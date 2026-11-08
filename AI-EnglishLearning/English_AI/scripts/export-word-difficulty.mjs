#!/usr/bin/env node
/**
 * 从 ECDICT 词库 dump 计算每个词的难度提示，输出 JSON。
 *
 * 用法：
 *   node scripts/export-word-difficulty.mjs --source "D:/AI-EnglishLearning/英语资源/6.26.sql"
 *   node scripts/export-word-difficulty.mjs --source "..." --out "英语资源/_import/word-difficulty.json"
 *
 * 算法：
 *   1. 从 book_word 取 CET4(7)/CET6(8) 的 (word_id, sort_no)；
 *   2. 每本书内按 sort_no 升序排名 rank = 1..N（999999999 这类哨兵值自然排在最后）；
 *   3. difficulty = clamp(2 + floor((rank-1)/N*6), 2, 7)。
 *
 * 注意：sort_no 是**全局词频序位**，不是书内 1..N 连号（实测范围 137..999999999），
 * 所以不能直接 sort_no/count，必须按书内名次算。
 *
 * 不连数据库、不写库；dump 路径不存在直接报错退出，禁止猜默认值。
 */

import fs from 'node:fs'
import path from 'node:path'
import readline from 'node:readline'
import { fileURLToPath } from 'node:url'
import { cleanText } from './lib/dump-parse.mjs'

const __dirname = path.dirname(fileURLToPath(import.meta.url))
const ROOT = path.resolve(__dirname, '..')

const BOOK_CET4 = 7
const BOOK_CET6 = 8

function usage() {
  console.log(`用法:
  node scripts/export-word-difficulty.mjs --source <6.26.sql> [--out <word-difficulty.json>]`)
}

function parseArgs(argv) {
  const opts = {
    source: '',
    out: path.resolve(ROOT, '..', '..', '英语资源', '_import', 'word-difficulty.json'),
  }
  for (let i = 0; i < argv.length; i += 1) {
    const a = argv[i]
    if (a === '--source') opts.source = argv[++i]
    else if (a === '--out') opts.out = argv[++i]
    else if (a === '--help' || a === '-h') {
      usage()
      process.exit(0)
    }
  }
  return opts
}

function difficultyOf(rank, total) {
  if (total <= 0) return null
  const percentile = (rank - 1) / total
  return Math.min(7, Math.max(2, 2 + Math.floor(percentile * 6)))
}

async function scanV2(source) {
  // 两遍会被 680MB 读两次，这里用单遍 + Set 判断，避免 O(n^2)
  const c4 = []
  const c6 = []
  const wanted = new Set()
  const spelling = new Map()

  let currentTable = ''
  const rl = readline.createInterface({
    input: fs.createReadStream(source, { encoding: 'utf8' }),
    crlfDelay: Infinity,
  })

  for await (const line of rl) {
    if (line.startsWith('-- Table structure for ')) {
      currentTable = line.slice('-- Table structure for '.length).trim()
      continue
    }
    if (!line.startsWith('INSERT INTO `')) continue

    if (currentTable === 'book_word') {
      const m = /VALUES \((\d+), (\d+), (\d+), (\d+)/.exec(line)
      if (!m) continue
      const bookId = Number(m[2])
      const wordId = Number(m[3])
      const sortNo = Number(m[4])
      if (bookId === BOOK_CET4) {
        c4.push({ id: wordId, sortNo })
        wanted.add(wordId)
      } else if (bookId === BOOK_CET6) {
        c6.push({ id: wordId, sortNo })
        wanted.add(wordId)
      }
      continue
    }

    if (currentTable === 'word') {
      const m = /VALUES \((\d+), '/.exec(line)
      if (!m) continue
      const id = Number(m[1])
      if (!wanted.has(id)) continue
      const s = /VALUES \(\d+, '((?:[^'\\]|\\.|'')*)'/.exec(line)
      if (s) spelling.set(id, cleanText(s[1].replace(/''/g, "'")))
    }
  }

  return { c4, c6, spelling }
}

async function main() {
  const opts = parseArgs(process.argv.slice(2))
  if (!opts.source) {
    usage()
    console.error('\n[error] 缺少 --source')
    process.exit(1)
  }
  if (!fs.existsSync(opts.source)) {
    console.error(`[error] dump 文件不存在: ${opts.source}`)
    console.error('       请确认路径；本脚本不会猜测默认值。')
    process.exit(1)
  }

  console.log(`[info] 扫描 ${opts.source} ...`)
  const { c4, c6, spelling } = await scanV2(opts.source)

  const byWord = new Map()
  const stats = {}

  for (const [bookName, list] of [
    ['CET4', c4],
    ['CET6', c6],
  ]) {
    const sorted = [...list].sort((a, b) => a.sortNo - b.sortNo)
    const total = sorted.length
    let filled = 0
    sorted.forEach((item, index) => {
      const word = spelling.get(item.id)
      if (!word) return
      const difficulty = difficultyOf(index + 1, total)
      if (difficulty === null) return
      // CET4 优先：同一词若同时在两本书，保留 CET4 的档位（与 import-words.mjs 的等级规则一致）
      if (byWord.has(word) && bookName === 'CET6') return
      byWord.set(word, difficulty)
      filled += 1
    })
    stats[bookName] = { words: total, withSpelling: filled }
  }

  const out = {
    generatedAt: new Date().toISOString(),
    source: opts.source,
    algorithm: 'clamp(2 + floor((bookRank-1)/bookTotal*6), 2, 7)',
    books: stats,
    total: byWord.size,
    words: Object.fromEntries([...byWord.entries()].sort((a, b) => a[0].localeCompare(b[0]))),
  }

  fs.mkdirSync(path.dirname(opts.out), { recursive: true })
  fs.writeFileSync(opts.out, JSON.stringify(out, null, 0), 'utf8')

  const dist = {}
  for (const d of byWord.values()) dist[d] = (dist[d] || 0) + 1
  console.log(`[ok] 已生成 ${opts.out}`)
  console.log(`     词条 ${byWord.size}（CET4 词书 ${stats.CET4.words} / CET6 词书 ${stats.CET6.words}）`)
  console.log(`     难度分布 ${JSON.stringify(dist)}`)
}

main().catch((err) => {
  console.error(`[error] ${err.message}`)
  process.exit(1)
})
