#!/usr/bin/env node
/**
 * P0-C：Top200 高频填空题 accepted_answers 扩充，生成 Flyway 迁移。
 *
 * 用法：
 *   node scripts/patch-accepted-top200.mjs --out exercise-service/src/main/resources/db/migration/V1.0.24__patch_top200_accepted_answers.sql
 *   node scripts/patch-accepted-top200.mjs --dry-run      # 只出报告，不写 SQL
 *
 * 数据边界：
 *   - 只处理 question_type='FILL_BLANK' 且未删除的题
 *   - 只扩 accepted_answers：新集合 = 现有 ∪ 候选，不删除、不覆盖历史值
 *   - 不动 buggy_answers（question_buggy_path）
 *   - 只读数据库，不执行任何写库操作
 *
 * 幂等：生成的 UPDATE 自带存在性判断，候选变体全部已存在时跳过该行。
 */

import fs from 'node:fs'
import path from 'node:path'
import { execFileSync } from 'node:child_process'
import { fileURLToPath } from 'node:url'
import { readEnv, sqlEscape } from './lib/dump-parse.mjs'
import { buildForms } from './generate-vocab-questions.mjs'

const __dirname = path.dirname(fileURLToPath(import.meta.url))
const ROOT = path.resolve(__dirname, '..')
const DB = 'exercise_db'
const TOP_N = 200

// ---------------------------------------------------------------- 归一化（与 AnswerNormalizer 对齐）

const EDGE_PUNCTUATION = '.,!?;:"\'()[]{}<>。、，！？；：（）【】《》…—‘’“”'

function toHalfWidth(s) {
  let out = ''
  for (const ch of s) {
    const code = ch.codePointAt(0)
    if (code === 0x3000) out += ' '
    else if (code >= 0xff01 && code <= 0xff5e) out += String.fromCharCode(code - 0xfee0)
    else out += ch
  }
  return out
}

function stripEdges(s) {
  let start = 0
  let end = s.length
  while (start < end && EDGE_PUNCTUATION.includes(s[start])) start += 1
  while (end > start && EDGE_PUNCTUATION.includes(s[end - 1])) end -= 1
  return s.slice(start, end)
}

/** 与 common/util/AnswerNormalizer.normalize 同口径 */
export function normalize(raw) {
  if (raw === null || raw === undefined) return ''
  return stripEdges(toHalfWidth(String(raw)).replace(/\s+/g, ' ').trim().toLowerCase()).trim()
}

// ---------------------------------------------------------------- 英美拼写变体

const BRITISH_PAIRS = [
  ['color', 'colour'], ['behavior', 'behaviour'], ['favor', 'favour'], ['honor', 'honour'],
  ['labor', 'labour'], ['neighbor', 'neighbour'], ['humor', 'humour'], ['rumor', 'rumour'],
  ['flavor', 'flavour'], ['harbor', 'harbour'], ['center', 'centre'], ['meter', 'metre'],
  ['theater', 'theatre'], ['fiber', 'fibre'], ['liter', 'litre'], ['catalog', 'catalogue'],
  ['dialog', 'dialogue'], ['defense', 'defence'], ['license', 'licence'], ['practice', 'practise'],
]

function britishAmericanForms(base) {
  const out = new Set()
  const pair = BRITISH_PAIRS.find(([us, uk]) => base === us || base === uk)
  if (pair) {
    out.add(pair[0])
    out.add(pair[1])
  }
  // -ize / -yze 后缀的 s 变体（organize→organise、analyze→analyse）
  if (/ize$/.test(base)) out.add(base.replace(/ize$/, 'ise'))
  if (/ization$/.test(base)) out.add(base.replace(/ization$/, 'isation'))
  if (/yze$/.test(base)) out.add(base.replace(/yze$/, 'yse'))
  return [...out].filter((w) => w !== base)
}

// ---------------------------------------------------------------- 词干解析

const SUFFIX_RULES = [
  [/ied$/, 'y'],
  [/([b-df-hj-np-tv-z])\1ed$/, '$1'], // stopped -> stop
  [/ed$/, ''],
  [/ed$/, 'e'],
  [/ing$/, ''],
  [/([b-df-hj-np-tv-z])\1ing$/, '$1'],
  [/ing$/, 'e'],
  [/ies$/, 'y'],
  [/es$/, ''],
  [/s$/, ''],
]

function resolveLemma(surface, dictionary) {
  const base = normalize(surface)
  if (!base) return { lemma: '', pos: '' }
  if (dictionary.has(base)) return { lemma: base, pos: dictionary.get(base) }
  for (const [re, rep] of SUFFIX_RULES) {
    if (!re.test(base)) continue
    const candidate = base.replace(re, rep)
    if (candidate && dictionary.has(candidate)) {
      return { lemma: candidate, pos: dictionary.get(candidate) }
    }
  }
  return { lemma: '', pos: '' }
}

// ---------------------------------------------------------------- 数据库（只读）

function resolveMysql() {
  if (process.env.MYSQL_BIN) {
    for (const name of ['mysql.exe', 'mysql']) {
      const p = path.join(process.env.MYSQL_BIN, name)
      if (fs.existsSync(p)) return p
    }
  }
  for (const p of [
    'C:/Program Files/MySQL/MySQL Server 8.0/bin/mysql.exe',
    '/c/Program Files/MySQL/MySQL Server 8.0/bin/mysql.exe',
    '/usr/bin/mysql',
  ]) {
    if (fs.existsSync(p)) return p
  }
  throw new Error('找不到 mysql 客户端，请设置 MYSQL_BIN')
}

function runQuery(mysqlBin, conn, sql) {
  return execFileSync(
    mysqlBin,
    ['-h', conn.host, '-P', conn.port, '-u', conn.user, '--default-character-set=utf8mb4',
      '--batch', '--skip-column-names', DB, '-e', sql],
    { encoding: 'utf8', env: { ...process.env, MYSQL_PWD: conn.password }, maxBuffer: 256 * 1024 * 1024 },
  )
}

function unescapeTsv(v) {
  return v.replace(/\\(.)/g, (_, c) => (c === 'n' || c === 't' || c === 'r' ? ' ' : c === '0' ? '' : c))
}

function parseAccepted(json) {
  if (!json) return []
  try {
    const parsed = JSON.parse(json)
    return Array.isArray(parsed) ? parsed.map((x) => String(x)) : []
  } catch {
    return []
  }
}

function loadDictionary(mysqlBin, conn) {
  const out = runQuery(mysqlBin, conn, 'SELECT `word`, `pos` FROM `word_dictionary`')
  const map = new Map()
  for (const line of out.split('\n')) {
    if (!line) continue
    const i = line.indexOf('\t')
    const word = normalize(i < 0 ? line : line.slice(0, i))
    const pos = i < 0 ? '' : unescapeTsv(line.slice(i + 1))
    if (word) map.set(word, pos)
  }
  return map
}

const BASE_COLUMNS = `
  i.id, i.external_key, i.answer_word, i.accepted_answers, i.usage_count,
  c.correct_answer, COALESCE(log.cnt, 0) AS log_cnt`

const BASE_FROM = `
  FROM question_info i
  JOIN question_content c ON c.question_id = i.id
  LEFT JOIN (SELECT question_id, COUNT(*) cnt FROM user_exercise_log GROUP BY question_id) log
         ON log.question_id = i.id
  WHERE i.question_type = 'FILL_BLANK' AND i.is_deleted = 0`

function loadTop200(mysqlBin, conn) {
  // 第一批：有作答记录且 accepted 为空的题
  const first = runQuery(
    mysqlBin,
    conn,
    `SELECT ${BASE_COLUMNS} ${BASE_FROM}
       AND (i.accepted_answers IS NULL OR JSON_LENGTH(i.accepted_answers) = 0)
       AND COALESCE(log.cnt, 0) > 0
     ORDER BY log_cnt DESC, i.usage_count DESC`,
  )

  const rows = parseRows(first)
  if (rows.length >= TOP_N) return rows.slice(0, TOP_N)

  const taken = new Set(rows.map((r) => r.id))
  // 第二批：按 usage_count 补齐
  const second = runQuery(
    mysqlBin,
    conn,
    `SELECT ${BASE_COLUMNS} ${BASE_FROM}
     ORDER BY i.usage_count DESC, i.id ASC`,
  )
  for (const row of parseRows(second)) {
    if (rows.length >= TOP_N) break
    if (taken.has(row.id)) continue
    rows.push(row)
  }
  return rows
}

function parseRows(out) {
  const rows = []
  for (const line of out.split('\n')) {
    if (!line) continue
    const parts = line.split('\t')
    if (parts.length < 7) continue
    // mysql --batch 把 SQL NULL 输出为字面量 "NULL"，必须还原成 null
    const field = (i) => {
      const v = unescapeTsv(parts[i])
      return v === 'NULL' ? null : v
    }
    rows.push({
      id: Number(parts[0]),
      externalKey: parts[1],
      answerWord: field(2) || null,
      acceptedRaw: field(3) || null,
      usageCount: Number(parts[4]) || 0,
      correctAnswer: field(5),
      logCount: Number(parts[6]) || 0,
    })
  }
  return rows
}

// ---------------------------------------------------------------- SQL 生成

function buildSql(rows, version) {
  const lines = [
    `-- ${version}：Top200 高频填空题 accepted_answers 追加合法变体（由 scripts/patch-accepted-top200.mjs 生成，请勿手改）`,
    '-- 目标库：exercise_db',
    '-- 风险：低（纯 UPDATE，只改 accepted_answers；新集合 = 现有 ∪ 新增，不删除历史值）',
    '-- 回滚：accepted_answers 为 JSON 数组，可用导入前备份恢复；本脚本不新增行、不改其他字段',
    `-- 生成时间：${new Date().toISOString()}`,
    `-- 涉及题目：${rows.length} 行`,
    '',
  ]
  for (const row of rows) {
    const union = row.union
    const arr = union.map((v) => `'${sqlEscape(v)}'`).join(', ')
    const guards = row.newOnes
      .map((v) => `JSON_CONTAINS(COALESCE(\`accepted_answers\`, JSON_ARRAY()), JSON_QUOTE('${sqlEscape(v)}'))`)
      .join(' AND ')
    lines.push(`-- ${row.externalKey} (${row.lemma || row.correctAnswer}) 新增：${row.newOnes.join(', ')}`)
    lines.push(
      `UPDATE \`question_info\`\n   SET \`accepted_answers\` = JSON_ARRAY(${arr})\n` +
        ` WHERE \`external_key\` = '${sqlEscape(row.externalKey)}'\n` +
        `   AND (\`accepted_answers\` IS NULL\n` +
        `        OR JSON_LENGTH(\`accepted_answers\`) = 0\n` +
        `        OR NOT (${guards}));`,
    )
    lines.push('')
  }
  return lines.join('\n')
}

// ---------------------------------------------------------------- 主流程

function parseArgs(argv) {
  const opts = {
    out: '',
    dryRun: false,
    topN: TOP_N,
    sample: 20,
  }
  for (let i = 0; i < argv.length; i += 1) {
    const a = argv[i]
    if (a === '--out') opts.out = argv[++i]
    else if (a === '--dry-run') opts.dryRun = true
    else if (a === '--top') opts.topN = Number(argv[++i]) || TOP_N
    else if (a === '--sample') opts.sample = Number(argv[++i]) || 20
  }
  return opts
}

function main() {
  const opts = parseArgs(process.argv.slice(2))
  const env = readEnv(path.join(ROOT, '.env'))
  const mysqlBin = resolveMysql()
  const conn = {
    host: env.MYSQL_HOST || '127.0.0.1',
    port: env.MYSQL_PORT || '3306',
    user: env.MYSQL_USERNAME,
    password: env.MYSQL_PASSWORD,
  }
  if (!conn.user || conn.password === undefined) {
    throw new Error('缺少 MYSQL_USERNAME / MYSQL_PASSWORD，请检查 .env')
  }

  console.log('[info] 读取 word_dictionary ...')
  const dictionary = loadDictionary(mysqlBin, conn)
  console.log(`[info] 词库 ${dictionary.size} 条`)

  console.log('[info] 选取 Top N 填空题 ...')
  const rows = loadTop200(mysqlBin, conn).slice(0, opts.topN)
  console.log(`[info] 选中 ${rows.length} 道（其中有作答记录 ${rows.filter((r) => r.logCount > 0).length} 道）`)

  const stats = {
    processed: rows.length,
    changedRows: 0,
    addedVariants: 0,
    unstableDropped: [],
    noLemma: 0,
    noLemmaWords: [],
    emptyAcceptedRows: 0,
  }

  const planned = []
  for (const row of rows) {
    const existing = parseAccepted(row.acceptedRaw)
    const existingNormalized = new Set(existing.map((v) => normalize(v)))
    if (existing.length === 0) stats.emptyAcceptedRows += 1

    let lemma
    let pos = ''
    if (row.answerWord) {
      lemma = normalize(row.answerWord)
      pos = dictionary.get(lemma) || ''
    } else {
      const resolved = resolveLemma(row.correctAnswer, dictionary)
      lemma = resolved.lemma
      pos = resolved.pos
      if (!lemma) {
        stats.noLemma += 1
        stats.noLemmaWords.push(`${row.externalKey}(${row.correctAnswer})`)
      }
    }

    const candidates = new Set()
    // 正确答案本身必须始终可接受
    candidates.add(normalize(row.correctAnswer))
    if (lemma) {
      const { acceptedForms } = buildForms(lemma, pos)
      acceptedForms.forEach((f) => candidates.add(normalize(f)))
      britishAmericanForms(lemma).forEach((f) => candidates.add(normalize(f)))
    }

    // 归一化稳定性校验：归一化后再归一化必须不变，且不能变成空串
    const stable = []
    for (const c of candidates) {
      if (!c) continue
      if (normalize(c) !== c) {
        stats.unstableDropped.push(`${row.externalKey}: ${c}`)
        continue
      }
      stable.push(c)
    }

    const newOnes = stable.filter((v) => !existingNormalized.has(v))
    if (newOnes.length === 0) continue

    // 合并而非覆盖：保留全部历史值
    const union = [...existing]
    const unionSet = new Set(existingNormalized)
    for (const v of newOnes) {
      if (!unionSet.has(v)) {
        union.push(v)
        unionSet.add(v)
      }
    }

    stats.changedRows += 1
    stats.addedVariants += newOnes.length
    planned.push({ ...row, lemma, pos, union, newOnes })
  }

  // 抽样验证：新变体在判题入口口径下必须能命中
  const samples = planned.slice(0, opts.sample)
  let samplePass = 0
  const sampleFail = []
  for (const row of samples) {
    const acceptedSet = new Set(row.union.map((v) => normalize(v)))
    let ok = true
    for (const v of row.newOnes) {
      if (!acceptedSet.has(normalize(v))) {
        ok = false
        sampleFail.push(`${row.externalKey}: ${v}`)
      }
    }
    if (ok) samplePass += 1
  }

  console.log('')
  console.log(`涉及题目：${stats.processed}`)
  console.log(`有变更的行：${stats.changedRows}    新增变体：${stats.addedVariants}`)
  console.log(`accepted 原为空的题：${stats.emptyAcceptedRows}    无法解析词干的题：${stats.noLemma}`)
  console.log(`归一化不稳定被丢弃：${stats.unstableDropped.length}`)
  if (stats.noLemmaWords.length) {
    console.log(`无法解析词干（只补正确答案本身）：${stats.noLemmaWords.join(', ')}`)
  }
  console.log(`抽样命中验证：${samplePass}/${samples.length} 通过${sampleFail.length ? '；失败：' + sampleFail.join(', ') : ''}`)

  if (opts.dryRun) {
    console.log('\n[dry-run] 未写入任何文件')
    return
  }
  if (!opts.out) {
    throw new Error('缺少 --out 参数（或使用 --dry-run）')
  }
  const version = path.basename(opts.out).split('__')[0] || 'V1.0.24'
  const sql = buildSql(planned, version)
  fs.mkdirSync(path.dirname(opts.out), { recursive: true })
  fs.writeFileSync(opts.out, sql, 'utf8')
  console.log(`\n[ok] 已生成 ${opts.out}（${sql.length} 字节）`)
}

main()
