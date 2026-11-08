#!/usr/bin/env node
/**
 * 清洗 question_buggy_path 的历史脏数据（只读扫描 + 生成迁移，不写库）。
 *
 * 用法：
 *   node scripts/clean-buggy-paths.mjs --dry-run
 *   node scripts/clean-buggy-paths.mjs --out exercise-service/src/main/resources/db/migration/V1.0.26__clean_buggy_paths.sql
 *
 * 规则：
 *   1. 按判题入口同口径 normalize(wrong_answer)
 *   2. 归一化后与库内已有值冲突时：把 occurrence_count 合并到保留行，其余行删除
 *   3. 无冲突时：直接 UPDATE 为归一化值
 *
 * 生成的 SQL 幂等：UPDATE 以旧值作条件（改完不再匹配）；DELETE 以被合并行的 id 精确定位。
 */

import fs from 'node:fs'
import path from 'node:path'
import { execFileSync } from 'node:child_process'
import { fileURLToPath } from 'node:url'
import { readEnv, sqlEscape } from './lib/dump-parse.mjs'
import { normalize, resolveMysql, runQuery, unescapeTsv } from './patch-accepted-top200.mjs'

const __dirname = path.dirname(fileURLToPath(import.meta.url))
const ROOT = path.resolve(__dirname, '..')
const DB = 'exercise_db'

function parseArgs(argv) {
  const opts = { out: '', dryRun: false }
  for (let i = 0; i < argv.length; i += 1) {
    if (argv[i] === '--out') opts.out = argv[++i]
    else if (argv[i] === '--dry-run') opts.dryRun = true
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

  const out = runQuery(
    mysqlBin,
    conn,
    'SELECT `id`, `question_id`, `wrong_answer`, `occurrence_count` FROM `question_buggy_path` ORDER BY `id`',
  )

  const rows = []
  for (const line of out.split('\n')) {
    if (!line) continue
    const parts = line.split('\t')
    if (parts.length < 4) continue
    const raw = unescapeTsv(parts[2])
    rows.push({
      id: Number(parts[0]),
      questionId: Number(parts[1]),
      wrongAnswer: raw === 'NULL' ? '' : raw,
      occurrenceCount: Number(parts[3]) || 0,
    })
  }

  const updates = []
  const merges = [] // { keepId, totalCount, deleteIds }

  // 按 (question_id, normalized) 分组
  const groups = new Map()
  for (const row of rows) {
    const normalized = normalize(row.wrongAnswer)
    if (!normalized) continue
    const key = `${row.questionId}\u0000${normalized}`
    if (!groups.has(key)) groups.set(key, { questionId: row.questionId, normalized, items: [] })
    groups.get(key).items.push(row)
  }

  for (const group of groups.values()) {
    const items = group.items.slice().sort((a, b) => a.id - b.id)
    const keeper = items[0]
    const duplicates = items.slice(1)

    if (duplicates.length) {
      merges.push({
        keepId: keeper.id,
        totalCount: items.reduce((sum, r) => sum + r.occurrenceCount, 0),
        deleteIds: duplicates.map((r) => r.id),
      })
    }
    // 只有"结构性"脏数据才改写：首尾标点、全角字符、多余空白。
    // 仅大小写不同的行不改写——判题两侧本就忽略大小写，改写只会丢失原样展示。
    const lowerTrimmed = keeper.wrongAnswer.trim().toLowerCase()
    if (group.normalized !== lowerTrimmed) {
      updates.push({
        id: keeper.id,
        from: keeper.wrongAnswer,
        to: group.normalized,
        questionId: group.questionId,
      })
    }
  }

  console.log(`错因行 ${rows.length}，需归一化 ${updates.length}，需合并 ${merges.length}`)
  updates.forEach((u) => console.log(`  UPDATE id=${u.id} "${u.from}" -> "${u.to}"`))
  merges.forEach((m) => console.log(`  MERGE keep=${m.keepId} count=${m.totalCount} delete=${m.deleteIds.join(',')}`))

  if (opts.dryRun || !opts.out) {
    console.log('\n[dry-run] 未写入文件')
    return
  }

  const lines = [
    `-- ${path.basename(opts.out)}：清洗 question_buggy_path 历史未归一化数据`,
    '-- 目标库：exercise_db',
    '-- 风险：低（仅更新 wrong_answer 文本；冲突行合并 occurrence_count 后删除重复行）',
    '-- 回滚：用迁移前的数据备份恢复；UPDATE 可按 from -> to 反向还原',
    `-- 生成时间：${new Date().toISOString()}`,
    `-- 归一化 ${updates.length} 行，合并 ${merges.length} 组`,
    '',
  ]

  for (const u of updates) {
    lines.push(
      'UPDATE `question_buggy_path`\n' +
        `   SET \`wrong_answer\` = '${sqlEscape(u.to)}'\n` +
        ` WHERE \`id\` = ${u.id} AND \`wrong_answer\` = '${sqlEscape(u.from)}';`,
    )
    lines.push('')
  }

  for (const m of merges) {
    lines.push(`-- 合并重复错因：保留 id=${m.keepId}，合计 occurrence_count=${m.totalCount}`)
    lines.push(`UPDATE \`question_buggy_path\` SET \`occurrence_count\` = ${m.totalCount} WHERE \`id\` = ${m.keepId};`)
    lines.push(`DELETE FROM \`question_buggy_path\` WHERE \`id\` IN (${m.deleteIds.join(', ')});`)
    lines.push('')
  }

  fs.mkdirSync(path.dirname(opts.out), { recursive: true })
  fs.writeFileSync(opts.out, lines.join('\n'), 'utf8')
  console.log(`\n[ok] 已生成 ${opts.out}`)
}

main()
