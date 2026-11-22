#!/usr/bin/env node
/**
 * 从 ECDICT 词库 dump 生成词书种子 SQL（word_book + word_book_item）。
 *
 * 用法：
 *   node scripts/generate-word-book-seed.mjs --source "D:/AI-EnglishLearning/英语资源/6.26.sql"
 *   node scripts/generate-word-book-seed.mjs --source "..." --out docs/pending-migrations/word-book-seed.sql --dry-run
 *   node scripts/generate-word-book-seed.mjs --source "..." --dict-out docs/pending-migrations/foundation-dict.sql \
 *        --local-dict "D:/path/local_dict.txt"
 *
 * 算法（与 export-word-difficulty.mjs 的 rank 口径一致）：
 *   1. 从 book_word 取 CET4(7)/CET6(8)/CET4核心(26)/高考(4)/中考(9) 的 (word_id, sort_no)，
 *      排除 sort_no=999999999 哨兵值；
 *   2. 每本书内按 sort_no 升序排名 rank_no = 1..N（1 为词频最高）；
 *   3. CET6 是累积词书（含 CET4 词），本脚本只保留 CET6 增量（不在 CET4 集合内的词）；
 *   4. word 统一小写（word 表的 spelling 可能含转义引号，先 cleanText 再 toLowerCase）。
 *
 * 生成的 6 本词书（sort_order 与数组顺序一致）：
 *   basic_foundation  中考(9) 优先 + 高考(4) 补充，合并去重后的全部基础词
 *   cet4_high         CET4 rank_no <= ceil(N*0.30)
 *   cet4_core_1900    ECDICT book 26「四级核心精简 1900」，名次用该书自身 sort_no
 *   cet4_outline      CET4 全量
 *   cet6_high         CET6 增量 rank_no <= ceil(N*0.30)
 *   cet6_outline      CET6 增量全量
 *
 * 字典补录（--dict-out）：基础词里本库缺失的词，从 dump 的 word / word_example 表
 * 取中文释义、音标、词性、例句，产出 word_dictionary 的 INSERT。
 * 词性从 meanings JSON 推导（ECDICT 的 pos 列大量为 NULL）。
 *
 * 不连数据库、不写库；dump 路径不存在直接报错退出，禁止猜默认值。
 */

import fs from 'node:fs'
import path from 'node:path'
import readline from 'node:readline'
import { fileURLToPath } from 'node:url'
import {
  cleanText,
  sqlEscape,
  parseRow,
  buildTranslation,
  buildPos,
  buildPhonetic,
} from './lib/dump-parse.mjs'

const __dirname = path.dirname(fileURLToPath(import.meta.url))
const ROOT = path.resolve(__dirname, '..')

const BOOK_CET4 = 7
const BOOK_CET6 = 8
const BOOK_CET4_CORE = 26
const BOOK_GAOKAO = 4
const BOOK_ZHONGKAO = 9
const SENTINEL_SORT_NO = 999999999

function parseArgs(argv) {
  const opts = {
    source: '',
    out: path.resolve(ROOT, 'docs', 'pending-migrations', 'word-book-seed.sql'),
    dictOut: '',
    localDict: '',
    dryRun: false,
  }
  for (let i = 0; i < argv.length; i += 1) {
    const a = argv[i]
    if (a === '--source') opts.source = argv[++i]
    else if (a === '--out') opts.out = argv[++i]
    else if (a === '--dict-out') opts.dictOut = argv[++i]
    else if (a === '--local-dict') opts.localDict = argv[++i]
    else if (a === '--dry-run') opts.dryRun = true
    else if (a === '--help' || a === '-h') {
      console.log('用法: node scripts/generate-word-book-seed.mjs --source <6.26.sql> [--out <file>] [--dict-out <file>] [--local-dict <file>] [--dry-run]')
      process.exit(0)
    }
  }
  return opts
}

async function scanDump(source) {
  const c4 = new Map() // wordId -> sortNo
  const c6 = new Map() // wordId -> sortNo
  const core = new Map() // wordId -> sortNo（book 26「四级核心精简 1900」）
  const gaokao = new Map() // wordId -> sortNo（book 4 高考词汇）
  const zhongkao = new Map() // wordId -> sortNo（book 9 中考词汇）
  const spelling = new Map() // wordId -> word
  const rich = new Map() // wordId -> { phoneticUs, phoneticUk, meanings, translation, pos }
  const examples = new Map() // wordId -> { sentence, translation }
  const wanted = new Set()
  const richWanted = new Set()

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
      } else if (bookId === BOOK_GAOKAO) {
        gaokao.set(wordId, sortNo)
        wanted.add(wordId)
        richWanted.add(wordId)
      } else if (bookId === BOOK_ZHONGKAO) {
        zhongkao.set(wordId, sortNo)
        wanted.add(wordId)
        richWanted.add(wordId)
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
      if (richWanted.has(id)) {
        const row = parseRow(line)
        if (row && row.length >= 8) {
          rich.set(id, {
            phoneticUs: cleanText(row[2]),
            phoneticUk: cleanText(row[3]),
            meanings: row[4],
            translation: row[5],
            pos: row[7],
          })
        }
      }
      continue
    }

    if (currentTable === 'word_example') {
      const row = parseRow(line)
      if (!row || row.length < 4) continue
      const wordId = Number(row[1])
      if (!richWanted.has(wordId)) continue
      if (examples.has(wordId)) continue // 每个词只取第一条例句
      const sentence = cleanText(row[2])
      if (!sentence) continue
      examples.set(wordId, { sentence, translation: cleanText(row[3]) })
      continue
    }
  }

  return { c4, c6, core, gaokao, zhongkao, spelling, rich, examples }
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

/**
 * 基础词表：中考优先 + 高考补充，合并去重后按出现顺序重新排名。
 * 中考在前面（更基础），高考里中考没有的词接在后面，各自保持考纲内的词频序。
 */
function mergeFoundation(zhongkao, gaokao, spelling) {
  const seen = new Set()
  const out = []
  const append = (idMap) => {
    const sorted = [...idMap.entries()].sort((a, b) => a[1] - b[1])
    for (const [id] of sorted) {
      const w = spelling.get(id)
      if (!w || seen.has(w)) continue
      seen.add(w)
      out.push({ word: w, wordId: id, rankNo: out.length + 1 })
    }
  }
  append(zhongkao)
  append(gaokao)
  return out
}

function buildBooks(c4, c6, core, gaokao, zhongkao, spelling) {
  const cet4 = rankWithinBook(c4, spelling, null)
  const cet4Set = new Set(cet4.map((x) => x.word))
  // CET6 增量：排除已在 CET4 词书内的词，并对增量集合重新从 1 排名
  const cet6 = rankWithinBook(c6, spelling, cet4Set)
  // 四级核心 1900（book 26）：名次用该书自身的 sort_no，与词频名次体系相互独立
  const cet4Core = rankWithinBook(core, spelling, null)
  // 基础词：中考 + 高考
  const foundation = mergeFoundation(zhongkao, gaokao, spelling)

  const cet4HighTop = Math.ceil(cet4.length * 0.3)
  const cet6HighTop = Math.ceil(cet6.length * 0.3)

  // 数组顺序即 sort_order：每级内部按词集体量递增，便于横向比较
  const books = [
    {
      code: 'basic_foundation',
      name: '中考高考基础词',
      level: 'CET4',
      description: '中考与高考基础词汇，适合从零打基础',
      items: foundation,
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

  return { books, cet4Count: cet4.length, cet6Count: cet6.length, foundation }
}

/** 读本库已有词表（一行一词），用于只补录缺失的词 */
function readLocalDict(filePath) {
  const set = new Set()
  if (!filePath || !fs.existsSync(filePath)) return set
  for (const raw of fs.readFileSync(filePath, 'utf8').split(/\r?\n/)) {
    const w = raw.trim().toLowerCase()
    if (w) set.add(w)
  }
  return set
}

/**
 * 产出 word_dictionary 的补录 SQL。
 * 中文释义取 ECDICT 的 translation JSON，音标取英式（缺则取美式），
 * 词性从 meanings JSON 推导（ECDICT 的 pos 列大量为 NULL），
 * 例句取 word_example 表的第一条。
 */
function buildDictSql(foundation, rich, examples, localWords) {
  const missing = foundation.filter((x) => !localWords.has(x.word))
  const lines = []
  lines.push('-- 基础词库补录（由 scripts/generate-word-book-seed.mjs 生成，请勿手改）')
  lines.push('-- 目标库：exercise_db')
  lines.push(`-- 基础词 ${foundation.length} 个，其中本库缺失 ${missing.length} 个`)
  lines.push('')
  if (missing.length === 0) return lines.join('\n')

  const BATCH = 200
  for (let i = 0; i < missing.length; i += BATCH) {
    const chunk = missing.slice(i, i + BATCH)
    lines.push('INSERT INTO `word_dictionary` (`word`, `phonetic`, `translation`, `pos`, `example`, `example_translation`, `level`) VALUES')
    chunk.forEach((item, j) => {
      const meta = rich.get(item.wordId) || {}
      const ex = examples.get(item.wordId)
      const translation = buildTranslation(meta.translation, meta.meanings, null)
      const pos = buildPos(meta.meanings, meta.pos)
      const phonetic = buildPhonetic(meta.phoneticUk, meta.phoneticUs)
      const values = [
        `'${sqlEscape(item.word)}'`,
        phonetic ? `'${sqlEscape(phonetic)}'` : 'NULL',
        translation ? `'${sqlEscape(translation)}'` : 'NULL',
        pos ? `'${sqlEscape(pos)}'` : 'NULL',
        ex && ex.sentence ? `'${sqlEscape(ex.sentence)}'` : 'NULL',
        ex && ex.translation ? `'${sqlEscape(ex.translation)}'` : 'NULL',
        "'CET4'",
      ].join(', ')
      const sep = j === chunk.length - 1 ? ';' : ','
      lines.push(`  (${values})${sep}`)
    })
    lines.push('')
  }
  return lines.join('\n')
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
  const { c4, c6, core, gaokao, zhongkao, spelling, rich, examples } = await scanDump(opts.source)
  const { books, cet4Count, cet6Count, foundation } = buildBooks(c4, c6, core, gaokao, zhongkao, spelling)

  console.log(`[info] CET4 词书 ${c4.size} 词 / 有拼写 ${cet4Count}`)
  console.log(`[info] CET6 增量 ${cet6Count} 词`)
  console.log(`[info] 基础词（中考 ${zhongkao.size} + 高考 ${gaokao.size}）合并去重 ${foundation.length} 词`)
  for (const b of books) {
    console.log(`[info]   ${b.code}: ${b.items.length} 词`)
  }

  const sql = toSql(books)
  if (opts.dryRun) {
    console.log(`[dry-run] 未写文件，SQL 长度 ${sql.length}`)
  } else {
    fs.mkdirSync(path.dirname(opts.out), { recursive: true })
    fs.writeFileSync(opts.out, sql, 'utf8')
    console.log(`[ok] 已生成 ${opts.out}`)
  }

  if (opts.dictOut) {
    const localWords = readLocalDict(opts.localDict)
    const dictSql = buildDictSql(foundation, rich, examples, localWords)
    if (opts.dryRun) {
      console.log(`[dry-run] 字典补录 SQL 长度 ${dictSql.length}`)
    } else {
      fs.mkdirSync(path.dirname(opts.dictOut), { recursive: true })
      fs.writeFileSync(opts.dictOut, dictSql, 'utf8')
      console.log(`[ok] 已生成 ${opts.dictOut}`)
    }
  }
}

main().catch((err) => {
  console.error(`[error] ${err.message}`)
  process.exit(1)
})
