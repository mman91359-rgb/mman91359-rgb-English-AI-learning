#!/usr/bin/env node
/**
 * 全库填空题 accepted_answers 覆盖度巡检（只读）。
 *
 * 用法：
 *   node scripts/audit-accepted-coverage.mjs
 *   node scripts/audit-accepted-coverage.mjs --out docs/accepted-coverage-report.md
 *   node scripts/audit-accepted-coverage.mjs --top 50        # 只展示缺失最多的前 N 题
 *
 * 判定口径与判题入口一致：
 *   - 期望集合 = 正确答案 + 词干规则变形 + 英美拼写变体，全部经 normalize 处理
 *   - 实际集合 = question_info.accepted_answers 逐条 normalize
 *   - 缺失 = 期望 − 实际
 *
 * 只读：不写数据库、不生成迁移。优化清单供人工决定是否出补偿迁移。
 */

import fs from 'node:fs'
import path from 'node:path'
import { fileURLToPath } from 'node:url'
import { readEnv, sqlEscape } from './lib/dump-parse.mjs'
import { buildForms } from './generate-vocab-questions.mjs'
import {
  normalize,
  resolveLemma,
  britishAmericanForms,
  parseAccepted,
  resolveMysql,
  runQuery,
  unescapeTsv,
  loadDictionary,
} from './patch-accepted-top200.mjs'

const __dirname = path.dirname(fileURLToPath(import.meta.url))
const ROOT = path.resolve(__dirname, '..')
const DB = 'exercise_db'

function parseArgs(argv) {
  const opts = { out: '', top: 30 }
  for (let i = 0; i < argv.length; i += 1) {
    if (argv[i] === '--out') opts.out = argv[++i]
    else if (argv[i] === '--top') opts.top = Number(argv[++i]) || 30
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

  console.log('[info] 读取词库 ...')
  const dictionary = loadDictionary(mysqlBin, conn)

  console.log('[info] 扫描填空题 ...')
  const out = runQuery(
    mysqlBin,
    conn,
    `SELECT i.id, i.external_key, i.answer_word, i.accepted_answers, c.correct_answer
       FROM question_info i
       JOIN question_content c ON c.question_id = i.id
      WHERE i.question_type = 'FILL_BLANK' AND i.is_deleted = 0`,
  )

  const rows = []
  for (const line of out.split('\n')) {
    if (!line) continue
    const parts = line.split('\t')
    if (parts.length < 5) continue
    const field = (i) => {
      const v = unescapeTsv(parts[i])
      return v === 'NULL' ? null : v
    }
    rows.push({
      id: Number(parts[0]),
      externalKey: parts[1],
      answerWord: field(2),
      acceptedRaw: field(3),
      correctAnswer: field(4),
    })
  }

  let empty = 0
  let ok = 0
  let incomplete = 0
  let totalMissing = 0
  const gaps = []
  const emptyKeys = []

  for (const row of rows) {
    const existing = parseAccepted(row.acceptedRaw).map((v) => normalize(v))
    if (existing.length === 0) {
      empty += 1
      if (emptyKeys.length < opts.top) emptyKeys.push(row.externalKey)
      continue
    }
    const existingSet = new Set(existing)

    const base = row.answerWord || row.correctAnswer
    const { lemma, pos } = resolveLemma(base, dictionary)
    const surface = normalize(row.correctAnswer)
    const expected = new Set([surface])
    if (lemma) {
      const normalizedLemma = normalize(lemma)
      // 与生成器口径一致：句中要的是变形时（surface ≠ lemma），原形不进 accepted
      if (surface === normalizedLemma) {
        expected.add(normalizedLemma)
      }
      buildForms(lemma, pos).acceptedForms.forEach((f) => {
        const value = normalize(f)
        if (value !== normalizedLemma) expected.add(value)
      })
      britishAmericanForms(lemma).forEach((f) => {
        const value = normalize(f)
        if (value !== normalizedLemma) expected.add(value)
      })
    }
    expected.delete('')

    const missing = [...expected].filter((v) => !existingSet.has(v))
    if (missing.length === 0) {
      ok += 1
      continue
    }
    incomplete += 1
    totalMissing += missing.length
    gaps.push({ key: row.externalKey, lemma: lemma || row.correctAnswer, missing })
  }

  gaps.sort((a, b) => b.missing.length - a.missing.length)

  const total = rows.length
  const covered = ok + incomplete
  const lines = []
  lines.push('# 填空题 accepted_answers 覆盖度巡检报告')
  lines.push('')
  lines.push(`- 生成时间：${new Date().toISOString()}`)
  lines.push('- 数据来源：`exercise_db.question_info` + `question_content`（只读）')
  lines.push('')
  lines.push('## 汇总')
  lines.push('')
  lines.push('| 指标 | 数值 |')
  lines.push('|---|---|')
  lines.push(`| 填空题总数 | ${total} |`)
  lines.push(`| accepted 为空 | ${empty} |`)
  lines.push(`| 覆盖完整 | ${ok} |`)
  lines.push(`| 有缺失 | ${incomplete} |`)
  lines.push(`| 缺失变体总数 | ${totalMissing} |`)
  lines.push(`| 覆盖率（有 accepted 且无缺失） | ${total ? ((ok / total) * 100).toFixed(1) : 0}% |`)
  lines.push('')

  if (emptyKeys.length) {
    lines.push(`## accepted 为空的题（最多 ${opts.top} 条）`)
    lines.push('')
    emptyKeys.forEach((k) => lines.push(`- \`${k}\``))
    lines.push('')
  }

  lines.push(`## 缺失最多的前 ${Math.min(opts.top, gaps.length)} 题`)
  lines.push('')
  lines.push('| external_key | 词干 | 缺失变体 |')
  lines.push('|---|---|---|')
  for (const g of gaps.slice(0, opts.top)) {
    lines.push(`| \`${g.key}\` | ${g.lemma} | ${g.missing.join(', ')} |`)
  }
  lines.push('')

  const report = lines.join('\n')
  if (opts.out) {
    fs.mkdirSync(path.dirname(opts.out), { recursive: true })
    fs.writeFileSync(opts.out, report, 'utf8')
    console.log(`[ok] 报告已写入 ${opts.out}`)
  }

  console.log('')
  console.log(`填空题 ${total}：覆盖完整 ${ok}、有缺失 ${incomplete}、accepted 为空 ${empty}`)
  console.log(`缺失变体合计 ${totalMissing}，覆盖率 ${covered ? ((ok / total) * 100).toFixed(1) : 0}%`)
  if (gaps.length) {
    console.log('缺失最多的 5 题：')
    gaps.slice(0, 5).forEach((g) => console.log(`  ${g.key} (${g.lemma}): ${g.missing.join(', ')}`))
  }
}

main()
