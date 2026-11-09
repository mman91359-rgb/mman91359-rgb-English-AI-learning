#!/usr/bin/env node
/**
 * 答案槽位离线校验（只读，不写库、不生成迁移）。
 *
 * 用法：
 *   node scripts/check-answer-slots.mjs                       # 全量扫描，写 docs/review/*.csv + *.md
 *   node scripts/check-answer-slots.mjs --dry-run             # 只打印统计，不落盘
 *   node scripts/check-answer-slots.mjs --question-id 1234    # 单题调试，逐条打印判定依据
 *   node scripts/check-answer-slots.mjs --only-types PSEUDO_FORM,DUPLICATE_VARIANT
 *
 * 判定基准：用生成器（generate-vocab-questions.mjs）的合法集合做参照，
 * 不另写一套英语词法，避免与出题口径漂移。
 *
 *   legit = correct_answer ∪ matchForms(lemma) ∪ acceptedForms(lemma)
 *         ∪ britishAmericanForms(lemma) ∪ {lemma}
 *
 * 问题类型：
 *   DUPLICATE_VARIANT     同题内归一化后重复（Fiber / fiber）      置信度 1.00
 *   PSEUDO_FORM           不在合法集合内，且命中伪形态后缀模式       置信度 0.90
 *   UNEXPECTED_VARIANT    不在合法集合内，但不属于伪形态              置信度 0.60
 *   SLOT_POS_MISMATCH     题干槽位线索要求词性与词干词性不符（题目级） 置信度 0.60
 *   COLLOCATION_CONFLICT  变体形态与题干限定结构冲突（a/an、to）      置信度 0.50
 *
 * 只读：SELECT only。输出 CSV 供人工筛选，不自动改库。
 */

import fs from 'node:fs'
import path from 'node:path'
import { fileURLToPath } from 'node:url'
import { readEnv } from './lib/dump-parse.mjs'
import { buildForms, categoryOf } from './generate-vocab-questions.mjs'
import {
  normalize,
  resolveLemma,
  britishAmericanForms,
  parseAccepted,
  resolveMysql,
  runQuery,
  unescapeTsv,
  loadDictionary,
  setDatabase,
} from './patch-accepted-top200.mjs'

const __dirname = path.dirname(fileURLToPath(import.meta.url))
const ROOT = path.resolve(__dirname, '..')
const DEFAULT_DB = 'exercise_db'
// 题库实际用的是 3 个下划线；兼容 3 个及以上，避免换生成器后失效
const BLANK_RE = /_{3,}/

// ---------------------------------------------------------------- 参数

function parseArgs(argv) {
  const stamp = new Date().toISOString().slice(0, 10).replace(/-/g, '')
  const opts = {
    out: path.join(ROOT, 'docs', 'review', `answer-slot-audit-${stamp}.csv`),
    dryRun: false,
    questionId: 0,
    db: DEFAULT_DB,
    limit: 0,
    onlyTypes: null,
  }
  for (let i = 0; i < argv.length; i += 1) {
    const a = argv[i]
    if (a === '--out') opts.out = argv[++i]
    else if (a === '--dry-run') opts.dryRun = true
    else if (a === '--question-id') opts.questionId = Number(argv[++i]) || 0
    else if (a === '--db') opts.db = argv[++i] || DEFAULT_DB
    else if (a === '--limit') opts.limit = Number(argv[++i]) || 0
    else if (a === '--only-types') {
      opts.onlyTypes = new Set(String(argv[++i] || '').split(',').map((s) => s.trim()).filter(Boolean))
    }
  }
  return opts
}

// ---------------------------------------------------------------- 槽位线索

/**
 * 从题干挖空处的前后文推断期望词性。
 * 线索未命中或互相矛盾时返回 null —— 宁可漏报，不制造噪声。
 */
const B = '_{3,}'
// "to" 既可能是不定式标记，也可能是介词（due to / prefer A to B / according to）。
// 命中下面这些介词搭配时，不能把 to + 空格 当成动词原形槽位。
const TO_PREPOSITION_RE = new RegExp(
  '\\b(?:due|owing|according|prior|thanks|similar|close|next|opposed|related|contrary|' +
  'subject|exposed|accustomed|addicted|committed|devoted|dedicated|compared|' +
  'in addition|lead|leads|led|contribute|contributes|apply|applies|attend|attend|refer|' +
  'belong|belongs|object|objects|respond|responds|stick|sticks|listen|listens)\\s+to\\s+' + B +
  '|\\bprefer(?:red|ring)?\\s+(?:\\w+\\s+){1,5}to\\s+' + B +
  // 分词 + to（filled to capacity / compared to / related to）一律是介词用法
  '|\\b\\w+(?:ed|ing)\\s+to\\s+' + B +
  // from A to B 里的 to 也是介词
  '|\\bfrom\\s+\\w+\\s+to\\s+' + B,
  'i',
)
const isInfinitiveTo = (stem) => new RegExp(`\\bto\\s+${B}`, 'i').test(stem) && !TO_PREPOSITION_RE.test(stem)

// 只保留高确定度线索。经验：限定词/情态动词后面也可能跟形容词或副词
// （an ___ ability、could ___ stay），这类模糊线索在抽样里误报极多，一律不用。
const SLOT_CUES = [
  // to + 空格 只用于形态校验（COLLOCATION_CONFLICT），不用于推断词性：
  // "open to criticism"、"from elementary to ___" 这类介词用法太多，推词性误报高。
  { re: new RegExp(`\\bto\\s+${B}`, 'i'), guard: isInfinitiveTo, skipPos: true, pos: 'verb', cue: 'to + 空格 → 动词原形' },
  // 只收确定度高的程度副词："more/most" 后面既可能是形容词，也可能是名词量词
  // （eat more fiber），误报率高，不进线索表。
  // "so" 常作话语标记（so ____ up!），不作程度副词用，误报高，已排除
  { re: new RegExp(`\\b(very|too|quite|rather|extremely)\\s+${B}`, 'i'), pos: 'adj', cue: '程度副词 + 空格 → 形容词' },
  { re: new RegExp(`${B}\\s+(is|are|was|were)\\b`, 'i'), pos: 'noun', cue: '空格 + be 动词 → 名词' },
]

function inferSlot(stem) {
  if (!stem || !BLANK_RE.test(stem)) return { slot: null, reason: 'no-blank' }
  const hits = SLOT_CUES.filter((c) => c.re.test(stem) && !c.skipPos && (!c.guard || c.guard(stem)))
  if (hits.length === 0) return { slot: null, reason: 'no-cue' }
  const posSet = new Set(hits.map((h) => h.pos))
  if (posSet.size > 1) return { slot: null, reason: 'ambiguous-cue' }
  return { slot: hits[0].pos, cue: hits[0].cue, reason: 'ok', matched: hits }
}

function compatibleCategory(slotPos, lemmaCat) {
  if (!slotPos || !lemmaCat || lemmaCat === 'unknown' || lemmaCat === 'other') return true
  if (slotPos === lemmaCat) return true
  // 形容词与副词同属修饰语，不互相判错
  return (slotPos === 'adj' && lemmaCat === 'adv') || (slotPos === 'adv' && lemmaCat === 'adj')
}

/** 题干限定结构要求的变体形态（用于 COLLOCATION_CONFLICT） */
function slotFormRequirement(stem) {
  if (!stem) return null
  if (isInfinitiveTo(stem)) return { kind: 'base', label: 'to + 空格要求动词原形' }
  if (new RegExp(`\\b(a|an)\\s+${B}`, 'i').test(stem)) return { kind: 'singular', label: 'a/an + 空格要求单数' }
  return null
}

// ---------------------------------------------------------------- 伪形态

const esc = (s) => s.replace(/[.*+?^${}()|[\]\\]/g, '\\$&')

/**
 * 比较级/最高级的"生造候选"：覆盖 -er/-est、去 e 加 -r/-st、y→i、CVC 双写。
 * 例：fiber→fiberer、knee→kneer、poetry→poetrier。
 */
function pseudoComparativeForms(lemma) {
  const out = new Set([`${lemma}er`, `${lemma}est`])
  if (/e$/.test(lemma)) {
    out.add(`${lemma}r`)
    out.add(`${lemma}st`)
  }
  if (/y$/.test(lemma) && !/[aeiou]y$/.test(lemma)) {
    const stem = lemma.slice(0, -1)
    out.add(`${stem}ier`)
    out.add(`${stem}iest`)
  }
  if (/[^aeiou][aeiou][^aeiouwxy]$/.test(lemma)) {
    out.add(`${lemma}${lemma.slice(-1)}er`)
    out.add(`${lemma}${lemma.slice(-1)}est`)
  }
  return out
}

/** 名词复数的"生造候选" */
function pseudoPluralForms(lemma) {
  const out = new Set([`${lemma}s`, `${lemma}es`])
  if (/y$/.test(lemma) && !/[aeiou]y$/.test(lemma)) out.add(`${lemma.slice(0, -1)}ies`)
  if (/f$/.test(lemma)) out.add(`${lemma.slice(0, -1)}ves`)
  if (/fe$/.test(lemma)) out.add(`${lemma.slice(0, -2)}ves`)
  return out
}

/**
 * 变体不在合法集合内时，判断它是否命中伪形态特征。
 * 返回 { label } 或 null。
 */
function matchPseudoPattern(variant, lemma, lemmaCat) {
  if (!lemma || !lemmaCat || lemmaCat === 'unknown' || lemmaCat === 'other') return null

  if (lemmaCat !== 'adj' && lemmaCat !== 'adv') {
    if (pseudoComparativeForms(lemma).has(variant)) {
      return { label: `${lemmaCat === 'noun' ? '名词' : '非形容词'}误加比较级/最高级后缀` }
    }
  }
  if (lemmaCat !== 'noun' && pseudoPluralForms(lemma).has(variant)) {
    return { label: `${lemmaCat === 'adj' ? '形容词' : '非名词'}误加复数后缀` }
  }
  if (lemmaCat === 'verb') {
    if (new RegExp(`^${esc(lemma)}(tion|sion|ment|ness|ity|ance|ence)$`).test(variant)) {
      return { label: '动词误加名词后缀' }
    }
  }
  if (lemmaCat === 'noun' || lemmaCat === 'adj' || lemmaCat === 'adv') {
    if (new RegExp(`^${esc(lemma)}(ed|ing)$`).test(variant)) {
      return { label: '非动词误加动词后缀' }
    }
  }
  return null
}

// ---------------------------------------------------------------- 词性集合

/**
 * 从中文释义里提取声明的词性（"a. 完全的 vt. 完成" → adj + verb）。
 * 词库 pos 字段只存主词性，释义里常常还有第二个词性。
 */
function declaredCategories(translation) {
  const t = String(translation || '').toLowerCase()
  const set = new Set()
  if (/\bvt\.|\bvi\.|\bv\.|\bverb\b/.test(t)) set.add('verb')
  if (/\bn\.|\bnoun\b/.test(t)) set.add('noun')
  if (/\badj\.|\badjective\b/.test(t)) set.add('adj')
  if (/\badv\.|\badverb\b/.test(t)) set.add('adv')
  // "a." 必须放在 adv./adj. 之后判断，否则会被误当成形容词标记
  if (/(^|[\s;；,，[【])a\./.test(t)) set.add('adj')
  return set
}

function loadPosSets(mysqlBin, conn) {
  const out = runQuery(mysqlBin, conn, 'SELECT `word`, `pos`, `translation` FROM `word_dictionary`')
  const map = new Map()
  for (const line of out.split('\n')) {
    if (!line) continue
    const parts = line.split('\t')
    if (parts.length < 3) continue
    const word = normalize(parts[0])
    if (!word) continue
    const pos = unescapeTsv(parts[1]).replace(/\r/g, '')
    const translation = unescapeTsv(parts.slice(2).join('\t')).replace(/\r/g, '')
    const set = declaredCategories(translation)
    const cat = categoryOf(pos)
    if (cat !== 'unknown' && cat !== 'other') set.add(cat)
    map.set(word, set)
  }
  return map
}

/** 是否为该名词的规则复数（只判规则形态，避免 bus→bus 这类误伤） */
function isRegularPlural(variant, base) {
  if (!base) return false
  if (variant === `${base}s` || variant === `${base}es`) return true
  if (/y$/.test(base) && variant === `${base.slice(0, -1)}ies`) return true
  if (/f$/.test(base) && variant === `${base.slice(0, -1)}ves`) return true
  return false
}

/** 变体是否明显与原词无关（无共同词干） */
function sharesStem(variant, lemma) {
  if (!lemma) return true
  const n = Math.min(lemma.length, variant.length, 4)
  return variant.slice(0, n) === lemma.slice(0, n)
}

// ---------------------------------------------------------------- CSV

function csvCell(value) {
  const s = value === null || value === undefined ? '' : String(value)
  return /[",\r\n]/.test(s) ? `"${s.replace(/"/g, '""')}"` : s
}

const COLUMNS = [
  'question_id',
  'answer',
  'issue_type',
  'confidence',
  'suggestion',
  'external_key',
  'answer_word',
  'lemma_pos',
  'target_level',
  'evidence',
  'stem_excerpt',
]

function buildCsv(rows) {
  const lines = [COLUMNS.join(',')]
  for (const row of rows) {
    lines.push(COLUMNS.map((c) => csvCell(row[c])).join(','))
  }
  // BOM 让 Excel 直接识别 UTF-8；CRLF 兼容 Windows
  return '﻿' + lines.join('\r\n') + '\r\n'
}

// ---------------------------------------------------------------- 校验

const SUGGESTION = {
  DUPLICATE_VARIANT: 'MERGE_DUPLICATE',
  PSEUDO_FORM: 'DELETE_VARIANT',
  UNEXPECTED_VARIANT: 'REVIEW',
  SLOT_POS_MISMATCH: 'REVIEW',
  COLLOCATION_CONFLICT: 'REVIEW',
}

const CONFIDENCE = {
  DUPLICATE_VARIANT: 1.0,
  PSEUDO_FORM: 0.9,
  UNEXPECTED_VARIANT: 0.6,
  SLOT_POS_MISMATCH: 0.6,
  COLLOCATION_CONFLICT: 0.5,
}

function checkQuestion(row, dictionary, posSets, stats) {
  const issues = []
  const acceptedRaw = parseAccepted(row.acceptedRaw)
  const lemmaInfo = row.answerWord
    ? { lemma: normalize(row.answerWord), pos: dictionary.get(normalize(row.answerWord)) || '' }
    : resolveLemma(row.correctAnswer, dictionary)
  lemmaInfo.pos = String(lemmaInfo.pos || '').replace(/\r/g, '')
  const lemma = lemmaInfo.lemma || ''
  const lemmaCat = lemma ? categoryOf(lemmaInfo.pos) : 'unknown'
  // 词库 pos 只记一个主词性，用中文释义里声明的词性集合补全（complete = a. + vt.）
  const declared = posSets.get(normalize(lemma)) || new Set()
  if (lemmaCat !== 'unknown' && lemmaCat !== 'other') declared.add(lemmaCat)

  const stem = row.stem || ''
  const slot = inferSlot(stem)
  stats.slotReasons[slot.reason] = (stats.slotReasons[slot.reason] || 0) + 1

  if (!lemma) {
    stats.noLemma += 1
  }

  // 合法集合：生成器口径
  const legit = new Set()
  legit.add(normalize(row.correctAnswer))
  if (lemma) {
    legit.add(normalize(lemma))
    // 按词库释义声明的每个词性分别生成合法集合：abuse 同时是 n./vt.，
    // 只按主词性 n. 生成会把 abused/abusing 误判成非预期变体。
    const cats = declared.size ? [...declared] : [lemmaCat]
    for (const cat of cats) {
      const { matchForms, acceptedForms } = buildForms(lemma, lemmaInfo.pos, cat)
      matchForms.forEach((f) => legit.add(normalize(f)))
      acceptedForms.forEach((f) => legit.add(normalize(f)))
    }
    britishAmericanForms(lemma).forEach((f) => legit.add(normalize(f)))
  }

  const base = {
    question_id: row.id,
    external_key: row.externalKey || '',
    answer_word: row.answerWord || '',
    lemma_pos: lemmaInfo.pos || '',
    target_level: row.targetLevel || '',
    stem_excerpt: stem.replace(/\s+/g, ' ').slice(0, 120),
  }

  const push = (issueType, answer, evidence) => {
    issues.push({
      ...base,
      answer,
      issue_type: issueType,
      confidence: CONFIDENCE[issueType].toFixed(2),
      suggestion: SUGGESTION[issueType],
      evidence,
    })
  }

  // A. 槽位词性冲突（题目级）：只有释义声明的所有词性都对不上才报
  if (slot.slot && declared.size && ![...declared].some((cat) => compatibleCategory(slot.slot, cat))) {
    push(
      'SLOT_POS_MISMATCH',
      row.correctAnswer,
      `题干线索要求 ${slot.slot}（${slot.cue}），词干词性为 ${[...declared].join('/')}`,
    )
  }

  // B/D. 变体级
  const seen = new Map()
  const formReq = slotFormRequirement(stem)

  for (const raw of acceptedRaw) {
    const variant = normalize(raw)
    if (!variant) continue

    if (seen.has(variant)) {
      seen.get(variant).push(raw)
      continue
    }
    seen.set(variant, [raw])

    if (!lemma) continue // 无词干只做重复检测
    if (legit.has(variant)) {
      // 合法变体，但可能与题干限定结构冲突
      if (formReq) {
        const base = normalize(lemma)
        if (formReq.kind === 'base' && declared.has('verb') && variant !== base) {
          push('COLLOCATION_CONFLICT', raw, `${formReq.label}，但变体是 ${variant}`)
        } else if (formReq.kind === 'singular' && declared.has('noun') && isRegularPlural(variant, base)) {
          push('COLLOCATION_CONFLICT', raw, `${formReq.label}，但变体是 ${variant}`)
        }
      }
      continue
    }

    const pseudo = matchPseudoPattern(variant, normalize(lemma), lemmaCat)
    if (pseudo) {
      push('PSEUDO_FORM', raw, pseudo.label)
    } else if (!sharesStem(variant, normalize(lemma))) {
      push('UNEXPECTED_VARIANT', raw, `与原词无共同词干（词干 ${lemma}）`)
    } else {
      push('UNEXPECTED_VARIANT', raw, '不在生成器合法集合内')
    }
  }

  // D. 重复项
  for (const [variant, raws] of seen) {
    if (raws.length > 1) {
      push('DUPLICATE_VARIANT', raws.join(' | '), `归一化后同为 ${variant}，共 ${raws.length} 条`)
    }
  }

  stats.variants += acceptedRaw.length
  return issues
}

// ---------------------------------------------------------------- 主流程

function main() {
  const opts = parseArgs(process.argv.slice(2))
  const DB = setDatabase(opts.db)
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

  console.log(`[info] 目标库 ${DB}`)
  const dictionary = loadDictionary(mysqlBin, conn)
  const posSets = loadPosSets(mysqlBin, conn)

  const where = [`i.question_type = 'FILL_BLANK'`, 'i.is_deleted = 0']
  if (opts.questionId) where.push(`i.id = ${Number(opts.questionId)}`)
  const limitSql = opts.limit > 0 ? ` LIMIT ${opts.limit}` : ''
  const sql =
    `SELECT i.id, i.external_key, i.answer_word, i.accepted_answers, i.target_level,` +
    ` c.stem, c.correct_answer` +
    ` FROM question_info i JOIN question_content c ON c.question_id = i.id` +
    ` WHERE ${where.join(' AND ')}` +
    ` ORDER BY i.id` +
    limitSql

  const out = runQuery(mysqlBin, conn, sql)
  const rows = []
  for (const line of out.split('\n')) {
    if (!line) continue
    const parts = line.split('\t')
    if (parts.length < 7) continue
    const field = (i) => {
      // Windows 下 mysql --batch 用 CRLF，最后一列会带上 \r，必须剥掉
      const v = unescapeTsv(parts[i]).replace(/\r/g, '')
      return v === 'NULL' ? null : v
    }
    rows.push({
      id: Number(parts[0]),
      externalKey: parts[1],
      answerWord: field(2),
      acceptedRaw: field(3),
      targetLevel: field(4),
      stem: field(5),
      correctAnswer: field(6) || '',
    })
  }

  console.log(`[info] 读取填空题 ${rows.length} 道`)

  const stats = { variants: 0, noLemma: 0, slotReasons: {} }
  const allIssues = []

  for (const row of rows) {
    const issues = checkQuestion(row, dictionary, posSets, stats)
    if (opts.questionId) {
      console.log(`\n[question ${row.id}] ${row.externalKey || ''} 答案=${row.correctAnswer} 词干=${row.answerWord || '-'}`)
      console.log(`  题干：${(row.stem || '').replace(/\s+/g, ' ')}`)
      console.log(`  accepted：${parseAccepted(row.acceptedRaw).join(', ')}`)
      if (issues.length === 0) console.log('  未发现问题')
      for (const it of issues) {
        console.log(`  - [${it.issue_type}] ${it.answer}  置信度=${it.confidence}  ${it.evidence}`)
      }
      continue
    }
    allIssues.push(...issues)
  }

  if (opts.questionId) return

  const filtered = opts.onlyTypes
    ? allIssues.filter((i) => opts.onlyTypes.has(i.issue_type))
    : allIssues

  const byType = {}
  for (const issue of filtered) byType[issue.issue_type] = (byType[issue.issue_type] || 0) + 1

  console.log('')
  console.log(`变体总数 ${stats.variants}，问题项 ${filtered.length}（原始 ${allIssues.length}）`)
  for (const [type, count] of Object.entries(byType).sort((a, b) => b[1] - a[1])) {
    console.log(`  ${type}: ${count}`)
  }
  console.log(`无法解析词干的题：${stats.noLemma}`)
  console.log(`槽位线索：${JSON.stringify(stats.slotReasons)}`)

  if (opts.dryRun) {
    console.log('\n[dry-run] 每个类型前 5 条：')
    for (const type of Object.keys(byType)) {
      filtered.filter((i) => i.issue_type === type).slice(0, 5).forEach((i) => {
        console.log(`  ${type} qid=${i.question_id} ${i.answer} — ${i.evidence}`)
      })
    }
    console.log('\n[dry-run] 未写入任何文件')
    return
  }

  // CSV
  fs.mkdirSync(path.dirname(opts.out), { recursive: true })
  fs.writeFileSync(opts.out, buildCsv(filtered), 'utf8')

  // Markdown 摘要
  const mdPath = opts.out.replace(/\.csv$/i, '.md')
  const md = []
  md.push('# 答案槽位离线校验报告')
  md.push('')
  md.push(`- 生成时间：${new Date().toISOString()}`)
  md.push(`- 数据来源：\`${DB}.question_info\` + \`question_content\`（只读）`)
  md.push(`- CSV：\`${path.relative(ROOT, opts.out).replace(/\\/g, '/')}\``)
  md.push('')
  md.push('## 汇总')
  md.push('')
  md.push('| 指标 | 数值 |')
  md.push('|---|---|')
  md.push(`| 扫描题目 | ${rows.length} |`)
  md.push(`| 变体总数 | ${stats.variants} |`)
  md.push(`| 问题项 | ${filtered.length} |`)
  md.push(`| 无法解析词干的题 | ${stats.noLemma} |`)
  md.push('')
  md.push('## 按问题类型')
  md.push('')
  md.push('| 问题类型 | 数量 | 置信度 | 建议操作 |')
  md.push('|---|---|---|---|')
  // 五条规则全列，命中 0 的也列出来，便于确认规则确实跑过
  for (const type of Object.keys(CONFIDENCE)) {
    md.push(`| ${type} | ${byType[type] || 0} | ${CONFIDENCE[type].toFixed(2)} | ${SUGGESTION[type]} |`)
  }
  md.push('')
  md.push('## 槽位线索覆盖')
  md.push('')
  md.push('| 情况 | 题数 |')
  md.push('|---|---|')
  for (const [reason, count] of Object.entries(stats.slotReasons)) {
    md.push(`| ${reason} | ${count} |`)
  }
  md.push('')
  md.push('> 线索未命中或自相矛盾的题不输出槽位类问题（宁可漏报，不制造噪声）。')
  md.push('')
  md.push('## 已知局限')
  md.push('')
  md.push('1. **槽位线索覆盖率有限**：只有题干含 `to ___`、`very/too ___`、`___ is/are` 等强线索时才做词性推断；')
  md.push('   限定词、情态动词后的槽位既可能是名词也可能是形容词/副词（`an ___ ability`、`could ___ stay`），一律不推断。')
  md.push('2. **COLLOCATION_CONFLICT 反映的是「accepted 偏宽松」这一既定设计**，不是错题：')
  md.push('   生成器会收录词条的全部合法变形，而具体题干往往只容得下其中一种。是否收紧需人工判断，脚本只负责列出。')
  md.push('3. **伪形态判定基于词库主词性**：词库只记录一个主词性，脚本用中文释义补充第二词性；')
  md.push('   释义缺失时可能漏判。')
  md.push('4. **不做语义判断**：不判断近义词是否可接受，也不判断答案与题干的语义是否搭调。')
  md.push('')
  fs.writeFileSync(mdPath, md.join('\n'), 'utf8')

  console.log('')
  console.log(`[ok] CSV 已写入 ${opts.out}（${filtered.length} 行）`)
  console.log(`[ok] 摘要已写入 ${mdPath}`)
}

main()
