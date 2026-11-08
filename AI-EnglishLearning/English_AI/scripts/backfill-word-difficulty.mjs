#!/usr/bin/env node
/**
 * 把 word-difficulty.json 回填到 word_dictionary.difficulty_hint。
 *
 * 用法：
 *   node scripts/backfill-word-difficulty.mjs --dry-run
 *   node scripts/backfill-word-difficulty.mjs
 *   node scripts/backfill-word-difficulty.mjs --force     # 覆盖已有值
 *
 * 依赖：系统 mysql 客户端（默认 C:/Program Files/MySQL/MySQL Server 8.0/bin/mysql.exe，
 *       可用环境变量 MYSQL_BIN 指向别的 bin 目录）。不引入 npm 依赖。
 *
 * 幂等：默认只更新 difficulty_hint IS NULL 的行；--force 才会覆盖已有值。
 * 前置：V1.0.12 必须先执行（否则列不存在，脚本会明确报错退出）。
 */

import fs from 'node:fs'
import path from 'node:path'
import { execFileSync } from 'node:child_process'
import { fileURLToPath } from 'node:url'
import { readEnv, sqlEscape } from './lib/dump-parse.mjs'

const __dirname = path.dirname(fileURLToPath(import.meta.url))
const ROOT = path.resolve(__dirname, '..')
const DB = 'exercise_db'

function usage() {
  console.log(`用法:
  node scripts/backfill-word-difficulty.mjs [--json <word-difficulty.json>] [--dry-run] [--force] [--batch 500]`)
}

function parseArgs(argv) {
  const opts = {
    json: path.resolve(ROOT, '..', '..', '英语资源', '_import', 'word-difficulty.json'),
    dryRun: false,
    force: false,
    batch: 500,
  }
  for (let i = 0; i < argv.length; i += 1) {
    const a = argv[i]
    if (a === '--json') opts.json = argv[++i]
    else if (a === '--batch') opts.batch = Number(argv[++i]) || 500
    else if (a === '--dry-run') opts.dryRun = true
    else if (a === '--force') opts.force = true
    else if (a === '--help' || a === '-h') {
      usage()
      process.exit(0)
    }
  }
  return opts
}

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
    '/usr/local/bin/mysql',
  ]) {
    if (fs.existsSync(p)) return p
  }
  throw new Error('找不到 mysql 客户端，请设置 MYSQL_BIN 指向 MySQL bin 目录')
}

function buildConn(env) {
  const host = env.MYSQL_HOST || '127.0.0.1'
  const port = env.MYSQL_PORT || '3306'
  const user = env.MYSQL_USERNAME
  const password = env.MYSQL_PASSWORD
  if (!user || password === undefined) {
    throw new Error('缺少 MYSQL_USERNAME / MYSQL_PASSWORD，请检查 .env')
  }
  return { host, port, user, password }
}

function runSql(mysqlBin, conn, sql, { input } = {}) {
  const args = [
    '-h', conn.host,
    '-P', conn.port,
    '-u', conn.user,
    '--default-character-set=utf8mb4',
    '--batch',
    '--skip-column-names',
    DB,
    ...(input ? [] : ['-e', sql]),
  ]
  return execFileSync(mysqlBin, args, {
    input: input ? sql : undefined,
    encoding: 'utf8',
    env: { ...process.env, MYSQL_PWD: conn.password },
    stdio: input ? ['pipe', 'pipe', 'pipe'] : ['ignore', 'pipe', 'pipe'],
    maxBuffer: 64 * 1024 * 1024,
  })
}

function main() {
  const opts = parseArgs(process.argv.slice(2))
  const env = readEnv(path.join(ROOT, '.env'))
  const mysqlBin = resolveMysql()
  const conn = buildConn(env)

  if (!fs.existsSync(opts.json)) throw new Error(`难度文件不存在: ${opts.json}`)
  const data = JSON.parse(fs.readFileSync(opts.json, 'utf8'))
  const entries = Object.entries(data.words || {})
  if (!entries.length) throw new Error('难度文件里没有 words 数据')

  // 前置检查：列是否存在
  const colCheck = runSql(
    mysqlBin,
    conn,
    `SELECT COUNT(*) FROM information_schema.COLUMNS
     WHERE TABLE_SCHEMA='${DB}' AND TABLE_NAME='word_dictionary' AND COLUMN_NAME='difficulty_hint'`,
  ).trim()
  if (colCheck !== '1') {
    if (!opts.dryRun) {
      throw new Error('word_dictionary.difficulty_hint 不存在，请先执行 V1.0.12 迁移')
    }
    console.warn('[warn] difficulty_hint 列尚不存在（V1.0.12 未执行），dry-run 仅预览 SQL')
  }

  const before =
    colCheck === '1'
      ? Number(
          runSql(
            mysqlBin,
            conn,
            'SELECT COUNT(*) FROM `word_dictionary` WHERE `difficulty_hint` IS NOT NULL',
          ).trim(),
        )
      : 0

  const condition = opts.force ? '' : ' AND `difficulty_hint` IS NULL'
  const batches = []
  for (let i = 0; i < entries.length; i += opts.batch) {
    const batch = entries.slice(i, i + opts.batch)
    const cases = batch.map(([word, d]) => `    WHEN '${sqlEscape(word)}' THEN ${Number(d)}`).join('\n')
    const inList = batch.map(([word]) => `'${sqlEscape(word)}'`).join(', ')
    batches.push(
      `UPDATE \`word_dictionary\`\nSET \`difficulty_hint\` = CASE \`word\`\n${cases}\n    ELSE \`difficulty_hint\` END\nWHERE \`word\` IN (${inList})${condition};\n`,
    )
  }

  console.log(`[info] 难度条目 ${entries.length}，分批 ${batches.length}（每批 ${opts.batch}）`)
  console.log(`[info] 回填前 difficulty_hint 非空行数：${before}`)
  console.log(`[info] 更新条件：${opts.force ? '覆盖已有值（--force）' : '仅 difficulty_hint IS NULL'}`)

  if (opts.dryRun) {
    console.log('\n[dry-run] 第一条 SQL 预览：')
    console.log(batches[0].split('\n').slice(0, 8).join('\n') + '\n    ...')
    console.log(`\n[dry-run] 未执行任何写入。预计执行 ${batches.length} 条 UPDATE。`)
    return
  }

  for (let i = 0; i < batches.length; i += 1) {
    runSql(mysqlBin, conn, batches[i], { input: true })
    process.stdout.write(`\r[ok] 已完成 ${i + 1}/${batches.length} 批`)
  }
  process.stdout.write('\n')

  const after = Number(
    runSql(
      mysqlBin,
      conn,
      'SELECT COUNT(*) FROM `word_dictionary` WHERE `difficulty_hint` IS NOT NULL',
    ).trim(),
  )
  const total = Number(runSql(mysqlBin, conn, 'SELECT COUNT(*) FROM `word_dictionary`').trim())
  console.log(`[done] difficulty_hint 非空 ${before} → ${after}（表总行数 ${total}）`)
}

try {
  main()
} catch (err) {
  console.error(`[error] ${err.message}`)
  process.exit(1)
}
