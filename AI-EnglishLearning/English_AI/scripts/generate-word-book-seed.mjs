#!/usr/bin/env node
/**
 * 从 ECDICT 词库 dump 生成词书种子 SQL（word_book + word_book_item）。
 *
 * 用法：
 *   node scripts/generate-word-book-seed.mjs --source "D:/AI-EnglishLearning/英语资源/6.26.sql"
 *   node scripts/generate-word-book-seed.mjs --source "..." --out docs/pending-migrations/word-book-seed.sql --dry-run
 *
 * 算法（与 export-word-difficulty.mjs 的 rank 口径一致）：
 *   1. 从 book_word 取 CET4(7)/CET6(8) 的 (word_id, sort_no)，排除 sort_no=999999999 哨兵值；
 *   2. 每本书内按 sort_no 升序排名 rank_no = 1..N（1 为词频最高）；
 *   3. CET6 是累积词书（含 CET4 词），本脚本只保留 CET6 增量（不在 CET4 集合内的词）；
 *   4. word 统一小写（word 表的 spelling 可能含转义引号，先 cleanText 再 toLowerCase）。
 *
 * 生成的 6 本词书（sort_order 与数组顺序一致）：
 *   basic_500        CET4 rank_no <= 500
 *   cet4_high        CET4 rank_no <= ceil(N*0.30)
 *   cet4_core_1900   ECDICT book 26「四级核心精简 1900」，名次用该书自身 sort_no
 *   cet4_outline     CET4 全量
 *   cet6_high        CET6 增量 rank_no <= ceil(N*0.30)
 *   cet6_outline     CET6 增量全量
 *
 * 不连数据库、不写库；dump 路径不存在直接报错退出，禁止猜默认值。
 */

import fs from 'node:fs'
import path from 'node:path'
import readline from 'node:readline'
import { fileURLToPath } from 'node:url'
import { cleanText, sqlEscape } from './lib/dump-parse.mjs'

const __dirname = path.dirname(fileURLToPath(import.meta.url))
const ROOT = path.resolve(__dirname, '..')

const BOOK_CET4 = 7
const BOOK_CET6 = 8
const BOOK_CET4_CORE = 26
const SENTINEL_SORT_NO = 999999999

function parseArgs(argv) {
  const opts = {
    source: '',
    out: path.resolve(ROOT, 'docs', 'pending-migrations', 'word-book-seed.sql'),
    dryRun: false,
  }
  for (let i = 0; i < argv.length; i += 1) {
    const a = argv[i]
    if (a === '--source') opts.source = argv[++i]
    else if (a === '--out') opts.out = argv[++i]
    else if (a === '--dry-run') opts.dryRun = true
    else if (a === '--help' || a === '-h') {
      console.log('用法: node scripts/generate-word-book-seed.mjs --source <6.26.sql> [--out <file>] [--dry-run]')
      process.exit(0)
    }
  }
  return opts
}

async function scanDump(source) {
  const c4 = new Map() // wordId -> sortNo
  const c6 = new Map() // wordId -> sortNo
  const core = new Map() // wordId -> sortNo（book 26「四级核心精简 1900」）
  const spelling = new Map() // wordId -> word
  const wanted = new Set()

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
      if (sortNo === SENTINEL_SORT_NO) continue // 排除哨兵值
      if (bookId === BOOK_CET4) {
        c4.set(wordId, sortNo)
        wanted.add(wordId)
      } else if (bookId === BOOK_CET6) {
        c6.set(wordId, sortNo)
        wanted.add(wordId)
      } else if (bookId === BOOK_CET4_CORE) {
        core.set(wordId, sortNo)
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
      if (s) {
        const w = cleanText(s[1].replace(/''/g, "'")).toLowerCase()
        if (w) spelling.set(id, w)
      }
    }
  }

  return { c4, c6, core, spelling }
}

/**
 * 书内按 sortNo 升序排名，返回 [{word, rankNo}]，rankNo 从 1 起。
 * exclude 为需要排除的词集合（用于 CET6 增量去重），排除后重新从 1 排名。
 */
function rankWithinBook(idMap, spelling, exclude) {
  const sorted = [...idMap.entries()].sort((a, b) => a[1] - b[1])
  const out = []
  let rank = 0
  for (let i = 0; i < sorted.length; i += 1) {
    const word = spelling.get(sorted[i][0])
    if (!word) continue
    if (exclude && exclude.has(word)) continue
    rank += 1
    out.push({ word, rankNo: rank })
  }
  return out
}

function buildBooks(c4, c6, core, spelling) {
  const cet4 = rankWithinBook(c4, spelling, null)
  const cet4Set = new Set(cet4.map((x) => x.word))
  // CET6 增量：排除已在 CET4 词书内的词，并对增量集合重新从 1 排名
  const cet6 = rankWithinBook(c6, spelling, cet4Set)
  // 四级核心 1900（book 26）：名次用该书自身的 sort_no，与词频名次体系相互独立
  const cet4Core = rankWithinBook(core, spelling, null)

  const cet4HighTop = Math.ceil(cet4.length * 0.3)
  const cet6HighTop = Math.ceil(cet6.length * 0.3)

  // 数组顺序即 sort_order：每级内部按词集体量递增，便于横向比较
  const books = [
    {
      code: 'basic_500',
      name: '四级精选',
      level: 'CET4',
      description: '四级考纲内最常用的词，适合起步',
      items: cet4.filter((x) => x.rankNo <= 500),
    },
    {
      code: 'cet4_high',
      name: '四级高频',
      level: 'CET4',
      description: '四级考纲内的高频词',
      items: cet4.filter((x) => x.rankNo <= cet4HighTop),
    },
    {
      code: 'cet4_core_1900',
      name: '四级核心',
      level: 'CET4',
      description: '四级核心词表，按核心优先级排序',
      items: cet4Core,
    },
    {
      code: 'cet4_outline',
      name: '四级词纲',
      level: 'CET4',
      description: '四级考纲全量',
      items: cet4,
    },
    {
      code: 'cet6_high',
      name: '六级高频',
      level: 'CET6',
      description: '六级考纲增量内的高频词',
      items: cet6.filter((x) => x.rankNo <= cet6HighTop),
    },
    {
      code: 'cet6_outline',
      name: '六级词纲',
      level: 'CET6',
      description: '六级考纲增量全量（不含四级词）',
      items: cet6,
    },
  ]

  return { books, cet4Count: cet4.length, cet6Count: cet6.length }
}

function toSql(books) {
  const lines = []
  lines.push('-- 词书种子数据（由 scripts/generate-word-book-seed.mjs 生成，请勿手改）')
  lines.push('-- 目标库：exercise_db')
  lines.push('-- 说明：word 统一小写；rank_no 为书内名次（1 为词频最高）；已排除 sort_no=999999999 哨兵值。')
  lines.push('')

  // word_book 主表
  lines.push('INSERT INTO `word_book` (`code`, `name`, `level`, `description`, `sort_order`) VALUES')
  books.forEach((b, bi) => {
    const sep = bi === books.length - 1 ? ';' : ','
    lines.push(
      `  ('${b.code}', '${sqlEscape(b.name)}', '${b.level}', '${sqlEscape(b.description)}', ${bi + 1})${sep}`,
    )
  })
  lines.push('')

  // word_book_item
  for (const b of books) {
    lines.push(`-- ${b.code}：${b.items.length} 词`)
    if (b.items.length === 0) {
      lines.push('')
      continue
    }
    // 分批 INSERT，每批 500 行，避免单条语句过长
    const BATCH = 500
    for (let i = 0; i < b.items.length; i += BATCH) {
      const chunk = b.items.slice(i, i + BATCH)
      lines.push(`INSERT INTO \`word_book_item\` (\`book_code\`, \`word\`, \`rank_no\`) VALUES`)
      chunk.forEach((it, j) => {
        const sep = j === chunk.length - 1 ? ';' : ','
        lines.push(`  ('${b.code}', '${sqlEscape(it.word)}', ${it.rankNo})${sep}`)
      })
    }
    lines.push('')
  }

  return lines.join('\n')
}

async function main() {
  const opts = parseArgs(process.argv.slice(2))
  if (!opts.source) {
    console.error('[error] 缺少 --source')
    process.exit(1)
  }
  if (!fs.existsSync(opts.source)) {
    console.error(`[error] dump 文件不存在: ${opts.source}`)
    process.exit(1)
  }

  console.log(`[info] 扫描 ${opts.source} ...`)
  const { c4, c6, core, spelling } = await scanDump(opts.source)
  const { books, cet4Count, cet6Count } = buildBooks(c4, c6, core, spelling)

  console.log(`[info] CET4 词书 ${c4.size} 词 / 有拼写 ${cet4Count}`)
  console.log(`[info] CET6 增量 ${cet6Count} 词`)
  for (const b of books) {
    console.log(`[info]   ${b.code}: ${b.items.length} 词`)
  }

  const sql = toSql(books)
  if (opts.dryRun) {
    console.log(`[dry-run] 未写文件，SQL 长度 ${sql.length}`)
    return
  }
  fs.mkdirSync(path.dirname(opts.out), { recursive: true })
  fs.writeFileSync(opts.out, sql, 'utf8')
  console.log(`[ok] 已生成 ${opts.out}`)
}

main().catch((err) => {
  console.error(`[error] ${err.message}`)
  process.exit(1)
})
