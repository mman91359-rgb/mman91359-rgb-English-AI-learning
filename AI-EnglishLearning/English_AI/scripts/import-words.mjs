#!/usr/bin/env node
/**
 * 词库导入脚本：从 ECDICT 数据库 dump 提取 CET4/CET6 词条，生成 Flyway 迁移。
 *
 * 用法：
 *   node scripts/import-words.mjs check --source "D:/AI-EnglishLearning/英语资源/6.26.sql"
 *   node scripts/import-words.mjs build --source "D:/AI-EnglishLearning/英语资源/6.26.sql" \
 *        --extra "D:/.../四级.jsonl,D:/.../六级.jsonl"
 *
 * 输入：
 *   --source  Navicat 导出的 ai 库 dump（含 book / book_word / word / word_example 四张表）
 *   --extra   可选，english-vocabulary-master 的 jsonl（逗号分隔），仅用于补缺失例句
 *
 * 输出：
 *   check → 控制台统计 + 抽样，不落盘
 *   build → docs/pending-migrations/V1.0.10__seed_word_cet4.sql、V1.0.11__seed_word_cet6.sql
 *
 * 约束：不连数据库、不新增 npm 依赖；按表名分段流式读取，
 * 跳过 500 万行的 word_chinese_char_index，绝不执行 dump 原文。
 */

import fs from 'node:fs'
import path from 'node:path'
import readline from 'node:readline'
import { fileURLToPath } from 'node:url'

const __dirname = path.dirname(fileURLToPath(import.meta.url))
const ROOT = path.resolve(__dirname, '..')

const BOOK_CET4 = 7
const BOOK_CET6 = 8
const BATCH_SIZE = 500
const MOJIBAKE = /鍗|閲|璇|鏃|鐨|涓/

const ESCAPES = {
  0: '\0',
  b: '\b',
  n: '\n',
  r: '\r',
  t: '\t',
  Z: '\u001a',
  '\\': '\\',
  "'": "'",
  '"': '"',
}

function usage() {
  console.log(`用法:
  node scripts/import-words.mjs check --source <6.26.sql> [--extra <a.jsonl,b.jsonl>]
  node scripts/import-words.mjs build --source <6.26.sql> [--extra <a.jsonl,b.jsonl>] [--out <dir>] [--version V1.0.10]`)
}

function parseArgs(argv) {
  const opts = {
    command: argv[0],
    source: '',
    extra: [],
    out: path.join(ROOT, 'docs', 'pending-migrations'),
    version: 'V1.0.10',
  }
  for (let i = 1; i < argv.length; i += 1) {
    const arg = argv[i]
    if (arg === '--source') opts.source = argv[++i]
    else if (arg === '--extra') opts.extra = String(argv[++i] || '').split(',').filter(Boolean)
    else if (arg === '--out') opts.out = argv[++i]
    else if (arg === '--version') opts.version = argv[++i]
  }
  return opts
}

/** 解析一行 INSERT 的 VALUES 部分，返回原始值数组（字符串已按 MySQL 规则反转义） */
function parseRow(line) {
  const marker = ' VALUES ('
  const idx = line.indexOf(marker)
  if (idx < 0) return null
  const s = line.slice(idx + marker.length)
  const out = []
  let i = 0
  while (i < s.length) {
    while (s[i] === ' ') i += 1
    if (i >= s.length || s[i] === ')') break
    if (s[i] === "'") {
      i += 1
      let buf = ''
      while (i < s.length) {
        const c = s[i]
        if (c === '\\') {
          const n = s[i + 1]
          buf += Object.prototype.hasOwnProperty.call(ESCAPES, n) ? ESCAPES[n] : n
          i += 2
        } else if (c === "'") {
          if (s[i + 1] === "'") {
            buf += "'"
            i += 2
          } else {
            i += 1
            break
          }
        } else {
          buf += c
          i += 1
        }
      }
      out.push(buf)
    } else {
      let buf = ''
      while (i < s.length && s[i] !== ',' && s[i] !== ')') {
        buf += s[i]
        i += 1
      }
      const t = buf.trim()
      if (/^null$/i.test(t)) out.push(null)
      else if (t === '') out.push(null)
      else out.push(Number.isNaN(Number(t)) ? t : Number(t))
    }
    while (s[i] === ' ') i += 1
    if (s[i] === ',') i += 1
  }
  return out
}

/** 清理文本：把字面 \n、真实换行、连续空白压成单空格 */
function cleanText(value) {
  if (value === null || value === undefined) return ''
  return String(value)
    .replace(/\\n/g, ' ')
    .replace(/\\r/g, ' ')
    .replace(/\\t/g, ' ')
    .replace(/\s+/g, ' ')
    .trim()
}

function parseJsonSafe(text) {
  if (!text) return null
  try {
    return JSON.parse(text)
  } catch {
    return null
  }
}

const POS_MAP = {
  a: 'adj',
  ad: 'adv',
  adj: 'adj',
  adv: 'adv',
  n: 'n',
  v: 'v',
  vt: 'vt',
  vi: 'vi',
  prep: 'prep',
  conj: 'conj',
  pron: 'pron',
  num: 'num',
  int: 'int',
  art: 'art',
  aux: 'aux',
  abbr: 'abbr',
}

function normalizePos(raw) {
  if (!raw) return ''
  const head = String(raw).trim().toLowerCase().replace(/\.$/, '').split(/[\s/,;]/)[0]
  if (!head) return ''
  return POS_MAP[head] || head
}

function buildTranslation(translationJson, meaningsJson, translationText) {
  const arr = parseJsonSafe(translationJson)
  if (Array.isArray(arr) && arr.length) {
    const parts = arr.map(cleanText).filter(Boolean)
    if (parts.length) return parts.join('；').slice(0, 500)
  }
  const meanings = parseJsonSafe(meaningsJson)
  if (Array.isArray(meanings) && meanings.length) {
    const parts = meanings
      .map((m) => {
        if (!m) return ''
        const pos = m.pos ? String(m.pos).trim() : ''
        const def = cleanText(m.definition)
        return def ? (pos ? `${pos} ${def}` : def) : ''
      })
      .filter(Boolean)
    if (parts.length) return parts.slice(0, 3).join('；').slice(0, 500)
  }
  return cleanText(translationText).slice(0, 500)
}

function buildPos(meaningsJson, posRaw) {
  const meanings = parseJsonSafe(meaningsJson)
  if (Array.isArray(meanings) && meanings.length) {
    for (const m of meanings) {
      const p = normalizePos(m && m.pos)
      if (p) return p.slice(0, 60)
    }
  }
  return normalizePos(posRaw).slice(0, 60)
}

function buildPhonetic(uk, us) {
  const raw = cleanText(uk) || cleanText(us)
  if (!raw) return ''
  const body = raw.replace(/^\/+/, '').replace(/\/+$/, '').trim()
  return body ? `/${body}/` : ''
}

function sqlEscape(value) {
  return String(value).replace(/\\/g, '\\\\').replace(/'/g, "''")
}

/** 第一遍：流式扫描 dump，只处理四张目标表 */
async function scanDump(source) {
  const c4 = new Map() // wordId → sort_no
  const c6 = new Map()
  const words = new Map() // wordId → 原始字段
  const examples = new Map() // wordId → { sentence, translation, sortNo }

  const stats = {
    bookWordRows: 0,
    wordRows: 0,
    exampleRows: 0,
    skippedOtherTables: 0,
  }

  let currentTable = ''
  const rl = readline.createInterface({
    input: fs.createReadStream(source, { encoding: 'utf8' }),
    crlfDelay: Infinity,
  })

  for await (const line of rl) {
    if (line.startsWith('-- Table structure for ')) {
      currentTable = line.slice('-- Table structure for '.length).trim()
      stats.skippedOtherTables += 1
      continue
    }
    if (!line.startsWith('INSERT INTO `')) continue

    if (currentTable === 'book_word') {
      const row = parseRow(line)
      if (!row || row.length < 4) continue
      stats.bookWordRows += 1
      const bookId = Number(row[1])
      const wordId = Number(row[2])
      const sortNo = Number(row[3]) || 0
      if (bookId === BOOK_CET4) c4.set(wordId, sortNo)
      else if (bookId === BOOK_CET6) c6.set(wordId, sortNo)
      continue
    }

    if (currentTable === 'word') {
      stats.wordRows += 1
      const m = /VALUES \((\d+),/.exec(line)
      if (!m) continue
      const id = Number(m[1])
      if (!c4.has(id) && !c6.has(id)) continue
      const row = parseRow(line)
      if (!row || row.length < 17) continue
      // 列顺序见 V1.0.0：id, spelling, phonetic_us, phonetic_uk, meanings, translation,
      // definition, pos, examples, difficulty_base, collins, oxford, bnc_rank, frq_rank,
      // exchange, tags, source, created_at, updated_at, translation_text
      words.set(id, {
        spelling: cleanText(row[1]),
        phoneticUs: row[2],
        phoneticUk: row[3],
        meanings: row[4],
        translation: row[5],
        pos: row[7],
        translationText: row[19] ?? null,
      })
      continue
    }

    if (currentTable === 'word_example') {
      const m = /VALUES \((\d+), (\d+),/.exec(line)
      if (!m) continue
      const wordId = Number(m[2])
      if (!c4.has(wordId) && !c6.has(wordId)) continue
      stats.exampleRows += 1
      const row = parseRow(line)
      if (!row || row.length < 7) continue
      const sortNo = Number(row[5]) || 0
      const prev = examples.get(wordId)
      if (!prev || sortNo < prev.sortNo) {
        examples.set(wordId, {
          sentence: cleanText(row[2]),
          translation: cleanText(row[3]),
          sortNo,
        })
      }
    }
  }

  return { c4, c6, words, examples, stats }
}

/** 读取 jsonl 备用例句：headWord → 第一条例句 */
function loadExtraExamples(files, log) {
  const map = new Map()
  for (const file of files) {
    if (!fs.existsSync(file)) {
      log(`[warn] 附加例句文件不存在，跳过：${file}`)
      continue
    }
    const lines = fs.readFileSync(file, 'utf8').split(/\r?\n/)
    let count = 0
    for (const line of lines) {
      if (!line.trim()) continue
      let obj
      try {
        obj = JSON.parse(line)
      } catch {
        continue
      }
      const head = cleanText(obj.headWord || obj.word)
      if (!head) continue
      const sentences =
        obj?.content?.word?.content?.sentence?.sentences ||
        obj?.content?.sentence?.sentences ||
        []
      const first = Array.isArray(sentences) ? sentences[0] : null
      const sentence = cleanText(first?.sContent)
      if (!sentence) continue
      const key = head.toLowerCase()
      if (!map.has(key)) map.set(key, { sentence, translation: cleanText(first?.sCn) })
      count += 1
    }
    log(`[info] 附加例句：${path.basename(file)} 解析 ${count} 条`)
  }
  return map
}

async function load(opts, log) {
  if (!opts.source) {
    usage()
    throw new Error('缺少 --source')
  }
  if (!fs.existsSync(opts.source)) throw new Error(`源文件不存在: ${opts.source}`)

  log(`[info] 扫描 ${opts.source} ...`)
  const scanned = await scanDump(opts.source)
  const extra = opts.extra.length ? loadExtraExamples(opts.extra, log) : new Map()

  const warnings = []
  const records = []
  const seen = new Set()
  let duplicateWords = 0
  let emptySpelling = 0
  let extraFilled = 0

  const total4 = scanned.c4.size
  const total6 = scanned.c6.size

  for (const [wordId, raw] of scanned.words) {
    const word = cleanText(raw.spelling)
    if (!word) {
      emptySpelling += 1
      continue
    }
    const key = word.toLowerCase()
    if (seen.has(key)) {
      duplicateWords += 1
      continue
    }
    seen.add(key)

    const inCet4 = scanned.c4.has(wordId)
    const level = inCet4 ? 'CET4' : 'CET6'
    const bookTotal = inCet4 ? total4 : total6
    const rank = inCet4 ? scanned.c4.get(wordId) : scanned.c6.get(wordId)
    const percentile = bookTotal ? Math.min(1, Math.max(0, rank / bookTotal)) : 0.5
    const difficultyHint = Math.min(7, 2 + Math.floor(percentile * 6))

    let example = ''
    let exampleTranslation = ''
    const fromDump = scanned.examples.get(wordId)
    if (fromDump) {
      example = fromDump.sentence
      exampleTranslation = fromDump.translation
    } else if (extra.has(key)) {
      const hit = extra.get(key)
      example = hit.sentence
      exampleTranslation = hit.translation
      extraFilled += 1
    }

    const record = {
      word,
      phonetic: buildPhonetic(raw.phoneticUk, raw.phoneticUs),
      translation: buildTranslation(raw.translation, raw.meanings, raw.translationText),
      pos: buildPos(raw.meanings, raw.pos),
      example,
      exampleTranslation,
      level,
      difficultyHint,
    }

    if (MOJIBAKE.test(record.word + record.translation + record.pos + record.example)) {
      warnings.push(`乱码嫌疑：${word} → ${record.translation.slice(0, 40)}`)
    }
    if (!record.translation) warnings.push(`缺释义：${word}`)
    if (!record.example) warnings.push(`缺例句：${word}`)
    records.push(record)
  }

  records.sort((a, b) => (a.level === b.level ? a.word.localeCompare(b.word) : a.level.localeCompare(b.level)))

  const cet4 = records.filter((r) => r.level === 'CET4')
  const cet6 = records.filter((r) => r.level === 'CET6')
  const withExample = records.filter((r) => r.example).length
  const withPhonetic = records.filter((r) => r.phonetic).length
  const overlap = [...scanned.c4.keys()].filter((id) => scanned.c6.has(id)).length

  return {
    records,
    cet4,
    cet6,
    warnings,
    stats: {
      ...scanned.stats,
      cet4Book: total4,
      cet6Book: total6,
      overlap,
      union: total4 + total6 - overlap,
      exported: records.length,
      cet4: cet4.length,
      cet6: cet6.length,
      withExample,
      withPhonetic,
      duplicateWords,
      emptySpelling,
      extraFilled,
    },
  }
}

function report(result, log) {
  const s = result.stats
  log('')
  log('== 源数据 ==')
  log(`  book_word 行数: ${s.bookWordRows}`)
  log(`  word 行数（全表）: ${s.wordRows}`)
  log(`  word_example 命中行数: ${s.exampleRows}`)
  log(`  CET4 词书: ${s.cet4Book}  CET6 词书: ${s.cet6Book}  重叠: ${s.overlap}  并集: ${s.union}`)
  log('')
  log('== 导出结果 ==')
  log(`  总条数: ${s.exported}（CET4 ${s.cet4} / CET6 ${s.cet6}）`)
  log(`  有音标: ${s.withPhonetic} (${pct(s.withPhonetic, s.exported)})`)
  log(`  有例句: ${s.withExample} (${pct(s.withExample, s.exported)})，其中 jsonl 补全 ${s.extraFilled}`)
  log(`  跳过重复词: ${s.duplicateWords}  跳过空拼写: ${s.emptySpelling}`)
  const mojibake = result.warnings.filter((w) => w.startsWith('乱码'))
  log(`  乱码告警: ${mojibake.length}`)
  log('')
  log('== 抽样 20 条 ==')
  const step = Math.max(1, Math.floor(result.records.length / 20))
  for (let i = 0; i < result.records.length && i < 20 * step; i += step) {
    const r = result.records[i]
    log(`  [${r.level}] ${r.word}  ${r.phonetic || '-'}  ${r.pos || '-'}  ${r.translation.slice(0, 30)}  | ${r.example.slice(0, 40) || '无例句'}`)
  }
  if (mojibake.length) {
    log('')
    log('== 乱码样本（最多 10 条） ==')
    mojibake.slice(0, 10).forEach((w) => log(`  ${w}`))
  }
  const missingTranslation = result.warnings.filter((w) => w.startsWith('缺释义')).length
  log('')
  log(`缺释义: ${missingTranslation}`)
}

function pct(n, total) {
  if (!total) return '0%'
  return `${Math.round((n / total) * 100)}%`
}

function buildSql(rows, level, version, fileName) {
  const header = `-- ${version}：导入 ${level} 词库（由 scripts/import-words.mjs 生成，请勿手改）
-- 目标库：exercise_db
-- 来源：ECDICT 词库 dump 的 book(7=CET4, 8=CET6) + book_word + word + word_example
-- 风险：低（纯 DML；ON DUPLICATE KEY UPDATE 只补空字段，不覆盖已有内容）
-- 回滚：优先用 scripts/backup-schema.sh 的备份恢复；如需按等级清理，先人工核对再执行
--       DELETE FROM word_dictionary WHERE level = '${level}'
-- 说明：
--   1. CET6 词书是累积词书（含 CET4 词），本文件只保留 CET6 增量。
--   2. 冲突时只补 phonetic/translation/pos/example/example_translation 的空值，不改 usage_count。
--   3. 生成时间：${new Date().toISOString()}

`
  const parts = [header]
  for (let i = 0; i < rows.length; i += BATCH_SIZE) {
    const batch = rows.slice(i, i + BATCH_SIZE)
    const values = batch
      .map(
        (r) =>
          `(${[
            r.word,
            r.phonetic,
            r.translation,
            r.pos,
            r.example,
            r.exampleTranslation,
            r.level,
            0,
          ]
            .map((v) => (typeof v === 'number' ? String(v) : `'${sqlEscape(v)}'`))
            .join(', ')})`,
      )
      .join(',\n')
    parts.push(`INSERT INTO \`word_dictionary\`
  (\`word\`, \`phonetic\`, \`translation\`, \`pos\`, \`example\`, \`example_translation\`, \`level\`, \`usage_count\`)
VALUES
${values}
AS new
ON DUPLICATE KEY UPDATE
  \`word_dictionary\`.\`phonetic\` = COALESCE(NULLIF(\`word_dictionary\`.\`phonetic\`, ''), new.\`phonetic\`),
  \`word_dictionary\`.\`translation\` = COALESCE(NULLIF(\`word_dictionary\`.\`translation\`, ''), new.\`translation\`),
  \`word_dictionary\`.\`pos\` = COALESCE(NULLIF(\`word_dictionary\`.\`pos\`, ''), new.\`pos\`),
  \`word_dictionary\`.\`example\` = COALESCE(NULLIF(\`word_dictionary\`.\`example\`, ''), new.\`example\`),
  \`word_dictionary\`.\`example_translation\` = COALESCE(NULLIF(\`word_dictionary\`.\`example_translation\`, ''), new.\`example_translation\`);

`)
  }
  parts.push(`-- 合计 ${rows.length} 条\n`)
  return { fileName, content: parts.join('') }
}

function nextVersion(version) {
  const m = /^V(\d+)\.(\d+)\.(\d+)$/.exec(version)
  if (!m) throw new Error(`版本号格式错误: ${version}`)
  return `V${m[1]}.${m[2]}.${Number(m[3]) + 1}`
}

async function main() {
  const opts = parseArgs(process.argv.slice(2))
  const log = (msg) => console.log(msg)

  if (!opts.command || opts.command === '--help' || opts.command === '-h') {
    usage()
    process.exit(0)
  }
  if (opts.command !== 'check' && opts.command !== 'build') {
    usage()
    process.exit(1)
  }

  const result = await load(opts, log)
  report(result, log)

  if (opts.command === 'check') {
    if (result.stats.exported === 0) {
      console.error('\n[error] 没有解析到任何词条，请检查 --source 是否指向 6.26.sql')
      process.exit(1)
    }
    return
  }

  fs.mkdirSync(opts.out, { recursive: true })
  const v4 = opts.version
  const v6 = nextVersion(v4)
  const files = [
    buildSql(result.cet4, 'CET4', v4, `${v4}__seed_word_cet4.sql`),
    buildSql(result.cet6, 'CET6', v6, `${v6}__seed_word_cet6.sql`),
  ]
  for (const f of files) {
    const target = path.join(opts.out, f.fileName)
    fs.writeFileSync(target, f.content, 'utf8')
    log(`[ok] 已生成 ${target}（${(f.content.length / 1024 / 1024).toFixed(2)} MB）`)
  }
}

main().catch((err) => {
  console.error(`[error] ${err.message}`)
  process.exit(1)
})
