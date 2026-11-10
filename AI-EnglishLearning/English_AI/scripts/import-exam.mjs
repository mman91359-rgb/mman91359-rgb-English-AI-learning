#!/usr/bin/env node
/**
 * 四六级真题 JSON 导入脚本（听力/阅读/翻译）。
 *
 * 用法：
 *   node scripts/import-exam.mjs check
 *   node scripts/import-exam.mjs build [--version V1.0.31] [--part 1]
 *
 * 输入：英语资源/格式化数据/CET4、CET6 下的 JSON（文件名即 examId）。
 * 输出：check 时打印校验报告并生成 docs/pending-migrations/exam-import-report.json；
 *       build 时生成 Flyway 迁移 SQL 到 docs/pending-migrations/。
 *
 * 导入范围（已与需求方确认）：
 *   正常套（无 *BorrowedFrom）        -> 听力 + 阅读 + 翻译
 *   仅借听力（listeningBorrowedFrom） -> 阅读 + 翻译（听力与来源套重复，跳过）
 *   残卷（readingBorrowedFrom）       -> 整套跳过，留待后续处理
 *
 * 分类口径（A1，不扩 question_type 枚举）：
 *   听力 -> module_type=4, question_type=CHOICE（本次无音频/转写，不写 listening_audio）
 *   阅读 -> module_type=7, question_type=CHOICE（细分题型存 reading_passage.passage_type）
 *   翻译 -> module_type=3, question_type=TRANSLATION
 *
 * external_key 命名：
 *   题目  -> {examId}-q{两位题号}（沿用 import-listening.mjs）
 *   翻译  -> {examId}-translation
 *   文章  -> {examId}-{passageId}（如 cet4-2022-06-1-r1）
 *
 * 不直接连数据库，不新增 npm 依赖。
 */

import fs from 'node:fs'
import path from 'node:path'
import { fileURLToPath } from 'node:url'

const __dirname = path.dirname(fileURLToPath(import.meta.url))
const ROOT = path.resolve(__dirname, '..')

const SOURCE_DIR = process.env.EXAM_SOURCE_DIR || 'D:/AI-EnglishLearning/英语资源/格式化数据'

const LISTENING_TYPES = new Set(['NEWS', 'LONG_DIALOGUE', 'PASSAGE', 'LECTURE'])
const READING_TYPES = new Set(['BANKED_CLOZE', 'MATCHING', 'CAREFUL_READING'])

// 每个题型对应 reading_passage.passage_type
const SUBTYPE_TO_PASSAGE = {
  BANKED_CLOZE: 'BANKED_CLOZE',
  MATCHING: 'MATCHING',
  CAREFUL_READING: 'CAREFUL_READING',
}

function usage() {
  console.log('用法: node scripts/import-exam.mjs <check|build> [--version V1.0.31] [--part N]')
}

function parseArgs(argv) {
  const opts = { command: argv[0], version: 'V1.0.31', part: null }
  for (let i = 1; i < argv.length; i += 1) {
    if (argv[i] === '--version') opts.version = argv[++i]
    else if (argv[i] === '--part') opts.part = Number(argv[++i])
  }
  return opts
}

function sqlString(value) {
  if (value == null) return 'NULL'
  const text = String(value)
  return `'${text
    .replace(/\\/g, '\\\\')
    .replace(/'/g, "''")
    .replace(/\r?\n/g, '\\n')
    .replace(/\t/g, '\\t')}'`
}

/** 把选项数组转成 JSON 字符串（键 A/B/C/D...）；空数组返回 null（JS null，经 sqlString 转 SQL NULL）。 */
function optionsToJson(options) {
  if (!Array.isArray(options) || options.length === 0) return null
  const obj = {}
  options.forEach((opt, i) => {
    const key = String.fromCharCode(65 + i) // A, B, C, ...
    obj[key] = opt
  })
  return JSON.stringify(obj)
}

function collectFiles() {
  const files = []
  for (const level of ['CET4', 'CET6']) {
    const dir = path.join(SOURCE_DIR, level)
    if (!fs.existsSync(dir)) continue
    for (const f of fs.readdirSync(dir)) {
      if (f.endsWith('.json')) files.push(path.join(dir, f))
    }
  }
  files.sort()
  return files
}

/** 校验并解析单个 JSON，返回 { examId, level, errors, units, skipped }。 */
function parseExam(filePath) {
  const examId = path.basename(filePath, '.json')
  const d = JSON.parse(fs.readFileSync(filePath, 'utf8'))
  const errors = []
  const units = []

  if (d.examId !== examId) errors.push(`${examId}: examId 字段与文件名不一致`)
  if (!['CET4', 'CET6'].includes(d.level)) errors.push(`${examId}: level 非法: ${d.level}`)

  const isResidual = 'readingBorrowedFrom' in d
  const isBorrowListen = 'listeningBorrowedFrom' in d
  const sec = d.sections || {}

  if (isResidual) return { examId, level: d.level, errors, units, skipped: 'residual' }

  // 翻译
  for (const t of sec.translation || []) {
    if (!t.chinese) errors.push(`${examId}: 翻译缺 chinese`)
    if (!t.referenceAnswer) errors.push(`${examId}: 翻译缺 referenceAnswer`)
    units.push({ kind: 'translation', chinese: t.chinese, referenceAnswer: t.referenceAnswer })
  }

  // 听力
  if (!isBorrowListen) {
    for (const q of sec.listening || []) {
      if (!LISTENING_TYPES.has(q.type)) errors.push(`${examId} Q${q.questionNo}: 非法听力 type ${q.type}`)
      if ((q.options || []).length !== 4) errors.push(`${examId} Q${q.questionNo}: 选项数 ${(q.options || []).length} != 4`)
      if (!/^[A-D]$/.test(String(q.answer || '').trim())) errors.push(`${examId} Q${q.questionNo}: 答案 ${q.answer} 非法`)
      units.push({
        kind: 'listening',
        questionNo: q.questionNo,
        listeningType: q.type,
        options: q.options,
        answer: String(q.answer).trim(),
      })
    }
  }

  // 阅读题
  for (const q of sec.reading || []) {
    if (!READING_TYPES.has(q.subType)) errors.push(`${examId} Q${q.questionNo}: 非法 subType ${q.subType}`)
    if (q.subType === 'BANKED_CLOZE') {
      if ((q.options || []).length !== 15) errors.push(`${examId} Q${q.questionNo}: 词库 ${(q.options || []).length} != 15`)
      if (!/^[A-O]$/.test(String(q.answer || '').trim())) errors.push(`${examId} Q${q.questionNo}: 答案 ${q.answer} 非法`)
    } else if (q.subType === 'MATCHING') {
      if (!q.stem || !q.stem.trim()) errors.push(`${examId} Q${q.questionNo}: 匹配题缺 stem`)
      if (!/^[A-Z]$/.test(String(q.answer || '').trim())) errors.push(`${examId} Q${q.questionNo}: 答案 ${q.answer} 非法`)
    } else if (q.subType === 'CAREFUL_READING') {
      if ((q.options || []).length !== 4) errors.push(`${examId} Q${q.questionNo}: 选项数 ${(q.options || []).length} != 4`)
      if (!/^[A-D]$/.test(String(q.answer || '').trim())) errors.push(`${examId} Q${q.questionNo}: 答案 ${q.answer} 非法`)
    }
    units.push({
      kind: 'reading',
      questionNo: q.questionNo,
      subType: q.subType,
      passageId: q.passageId,
      stem: q.stem,
      options: q.options,
      answer: String(q.answer).trim(),
    })
  }

  // 阅读文章（记录文章正文，供 reading_passage 使用）
  const passages = d.passages || []
  for (const p of passages) {
    if (!p.passageId) errors.push(`${examId}: 文章缺 passageId`)
    if (!p.text) errors.push(`${examId}: 文章 ${p.passageId} 缺 text`)
  }
  // 文章作为 units 之外的独立数据存到 d.passages，build 阶段用
  return { examId, level: d.level, errors, units, passages, skipped: null }
}

/** 从某套的阅读题里推断每个 passageId 的 passage_type 与 word_bank。 */
function inferPassageMeta(examId, units) {
  const meta = {} // passageId -> { passageType, wordBank }
  for (const u of units) {
    if (u.kind !== 'reading') continue
    if (!meta[u.passageId]) {
      meta[u.passageId] = { passageType: SUBTYPE_TO_PASSAGE[u.subType], wordBank: null }
    }
    // 选词填空：词库是 15 个词的数组（同一文章多题共享同一词库）
    if (u.subType === 'BANKED_CLOZE' && meta[u.passageId].wordBank == null && Array.isArray(u.options)) {
      meta[u.passageId].wordBank = u.options
    }
  }
  return meta
}

/** 生成单个迁移 SQL 文本。 */
function buildSqlForExams(parsedExams, version) {
  const lines = []
  lines.push('-- 由 scripts/import-exam.mjs 自动生成，请勿手工修改。')
  lines.push(`-- 版本: ${version}`)
  lines.push(`-- 生成时间: ${new Date().toISOString()}`)
  lines.push('-- 目标库: exercise_db')
  lines.push('-- 执行前必须按 docs/数据库迁移规范.md 预览、备份、审批。')
  lines.push('-- 范围：正常套 + 仅借听力套（残卷留后）；听力无音频不写 listening_audio。')
  lines.push('')
  lines.push('START TRANSACTION;')
  lines.push('')

  for (const exam of parsedExams) {
    if (exam.skipped) continue
    const examId = exam.examId
    const level = exam.level
    const meta = inferPassageMeta(examId, exam.units)

    lines.push(`-- ==================== ${examId} ====================`)

    // 先写文章（reading_passage），题目再引用
    const passageVar = {}
    for (const p of exam.passages || []) {
      const pm = meta[p.passageId] || { passageType: 'CAREFUL_READING', wordBank: null }
      const externalKey = `${examId}-${p.passageId}`
      const varName = `@pg_${examId.replace(/[^a-z0-9]/gi, '_')}_${p.passageId}`
      passageVar[p.passageId] = varName
      const wordCount = (p.text || '').split(/\s+/).filter(Boolean).length
      const wordBankJson = pm.wordBank ? JSON.stringify(pm.wordBank) : null

      lines.push(`-- 文章 ${p.passageId}`)
      lines.push('INSERT INTO `reading_passage`')
      lines.push('  (`external_key`, `passage_type`, `target_level`, `title`, `content`, `content_translation`, `word_bank`, `word_count`, `source`, `exam_key`, `is_deleted`, `created_at`, `updated_at`)')
      lines.push('SELECT')
      lines.push(`  ${sqlString(externalKey)}, ${sqlString(pm.passageType)}, ${sqlString(level)}, ${sqlString(p.title || null)}, ${sqlString(p.text)}, NULL, ${sqlString(wordBankJson)}, ${wordCount}, 'IMPORT', ${sqlString(examId)}, 0, NOW(), NOW()`)
      lines.push('WHERE NOT EXISTS (')
      lines.push(`  SELECT 1 FROM \`reading_passage\` WHERE \`external_key\` = ${sqlString(externalKey)}`)
      lines.push(');')
      lines.push(`SET ${varName} = (SELECT \`id\` FROM \`reading_passage\` WHERE \`external_key\` = ${sqlString(externalKey)} LIMIT 1);`)
      lines.push('')
    }

    // 再写题目（question_info + question_content）
    let qi = 0
    for (const u of exam.units) {
      qi += 1
      const varName = `@q_${examId.replace(/[^a-z0-9]/gi, '_')}_${String(qi).padStart(2, '0')}`

      if (u.kind === 'translation') {
        const externalKey = `${examId}-translation`
        lines.push(`-- 翻译 ${examId}`)
        lines.push('INSERT INTO `question_info`')
        lines.push('  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)')
        lines.push('SELECT')
        lines.push(`  ${sqlString(externalKey)}, 3, ${sqlString(level)}, 5, 'TRANSLATION', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, ${sqlString(examId)}, NOW(), NOW()`)
        lines.push('WHERE NOT EXISTS (')
        lines.push(`  SELECT 1 FROM \`question_info\` WHERE \`external_key\` = ${sqlString(externalKey)}`)
        lines.push(');')
        lines.push(`SET ${varName} = (SELECT \`id\` FROM \`question_info\` WHERE \`external_key\` = ${sqlString(externalKey)} LIMIT 1);`)
        lines.push('')
        lines.push('INSERT INTO `question_content`')
        lines.push('  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)')
        lines.push('SELECT')
        lines.push(`  ${varName}, ${sqlString(u.chinese)}, NULL, ${sqlString(u.referenceAnswer)}, '四六级翻译真题。段落翻译判题仅做本地归一化精确比对。', NOW(), NOW()`)
        lines.push('WHERE NOT EXISTS (')
        lines.push(`  SELECT 1 FROM \`question_content\` WHERE \`question_id\` = ${varName}`)
        lines.push(');')
        lines.push('')
      } else if (u.kind === 'listening') {
        const externalKey = `${examId}-q${String(u.questionNo).padStart(2, '0')}`
        const optionsJson = optionsToJson(u.options)
        lines.push(`-- 听力 Q${u.questionNo} ${u.listeningType}`)
        lines.push('INSERT INTO `question_info`')
        lines.push('  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)')
        lines.push('SELECT')
        lines.push(`  ${sqlString(externalKey)}, 4, ${sqlString(level)}, 3, 'CHOICE', NULL, NULL, 'IMPORT', NULL, 0, 0, 0, ${sqlString(examId)}, NOW(), NOW()`)
        lines.push('WHERE NOT EXISTS (')
        lines.push(`  SELECT 1 FROM \`question_info\` WHERE \`external_key\` = ${sqlString(externalKey)}`)
        lines.push(');')
        lines.push(`SET ${varName} = (SELECT \`id\` FROM \`question_info\` WHERE \`external_key\` = ${sqlString(externalKey)} LIMIT 1);`)
        lines.push('')
        lines.push('INSERT INTO `question_content`')
        lines.push('  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)')
        lines.push('SELECT')
        lines.push(`  ${varName}, NULL, ${sqlString(optionsJson)}, ${sqlString(u.answer)}, NULL, NOW(), NOW()`)
        lines.push('WHERE NOT EXISTS (')
        lines.push(`  SELECT 1 FROM \`question_content\` WHERE \`question_id\` = ${varName}`)
        lines.push(');')
        lines.push('')
        // 注：听力无音频/转写，不写 listening_audio
      } else if (u.kind === 'reading') {
        const externalKey = `${examId}-q${String(u.questionNo).padStart(2, '0')}`
        const optionsJson = optionsToJson(u.options)
        const pgVar = passageVar[u.passageId] || 'NULL'
        // MATCHING 无选项，stem 有值；其他 stem 有值
        lines.push(`-- 阅读 Q${u.questionNo} ${u.subType} (${u.passageId})`)
        lines.push('INSERT INTO `question_info`')
        lines.push('  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `knowledge_point_id`, `passage_id`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `exam_key`, `created_at`, `updated_at`)')
        lines.push('SELECT')
        lines.push(`  ${sqlString(externalKey)}, 7, ${sqlString(level)}, 3, 'CHOICE', NULL, ${pgVar}, 'IMPORT', NULL, 0, 0, 0, ${sqlString(examId)}, NOW(), NOW()`)
        lines.push('WHERE NOT EXISTS (')
        lines.push(`  SELECT 1 FROM \`question_info\` WHERE \`external_key\` = ${sqlString(externalKey)}`)
        lines.push(');')
        lines.push(`SET ${varName} = (SELECT \`id\` FROM \`question_info\` WHERE \`external_key\` = ${sqlString(externalKey)} LIMIT 1);`)
        lines.push('')
        lines.push('INSERT INTO `question_content`')
        lines.push('  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)')
        lines.push('SELECT')
        lines.push(`  ${varName}, ${sqlString(u.stem || null)}, ${sqlString(optionsJson)}, ${sqlString(u.answer)}, NULL, NOW(), NOW()`)
        lines.push('WHERE NOT EXISTS (')
        lines.push(`  SELECT 1 FROM \`question_content\` WHERE \`question_id\` = ${varName}`)
        lines.push(');')
        lines.push('')
      }
    }
  }

  lines.push('COMMIT;')
  lines.push('')
  return lines.join('\n')
}

function main() {
  const opts = parseArgs(process.argv.slice(2))
  if (!['check', 'build'].includes(opts.command)) {
    usage()
    process.exit(1)
  }

  const files = collectFiles()
  if (files.length === 0) {
    console.error(`未找到源 JSON：${SOURCE_DIR}`)
    console.error('可用环境变量 EXAM_SOURCE_DIR 指定源目录。')
    process.exit(1)
  }

  const parsed = []
  const allErrors = []
  const stats = { exams: 0, skippedResidual: 0, listening: 0, reading: 0, translation: 0, passage: 0 }

  for (const f of files) {
    const r = parseExam(f)
    parsed.push(r)
    allErrors.push(...r.errors)
    if (r.skipped === 'residual') stats.skippedResidual += 1
    else {
      stats.exams += 1
      for (const u of r.units) {
        if (u.kind === 'listening') stats.listening += 1
        else if (u.kind === 'reading') stats.reading += 1
        else if (u.kind === 'translation') stats.translation += 1
      }
      stats.passage += (r.passages || []).length
    }
  }

  const report = {
    generatedAt: new Date().toISOString(),
    sourceDir: SOURCE_DIR,
    stats,
    errors: allErrors,
  }
  const reportPath = path.join(ROOT, 'docs/pending-migrations/exam-import-report.json')
  fs.writeFileSync(reportPath, JSON.stringify(report, null, 2) + '\n', 'utf8')

  console.log(`源文件数: ${files.length}`)
  console.log(`导入套数: ${stats.exams}（跳过残卷 ${stats.skippedResidual} 套）`)
  console.log(`听力 ${stats.listening} / 阅读 ${stats.reading} / 翻译 ${stats.translation} / 文章 ${stats.passage}`)
  console.log(`预计 question_info 新增 ${stats.listening + stats.reading + stats.translation} 行，reading_passage 新增 ${stats.passage} 行`)

  if (allErrors.length > 0) {
    console.error(`\n校验失败，共 ${allErrors.length} 个错误：`)
    for (const e of allErrors.slice(0, 100)) console.error(`- ${e}`)
    console.error(`报告: ${path.relative(ROOT, reportPath)}`)
    process.exit(1)
  }
  console.log(`\n校验通过，报告: ${path.relative(ROOT, reportPath)}`)

  if (opts.command === 'build') {
    // 分片：每片最多 N 套，避免单文件过大（参照词汇 4465 题分 9 片）
    const chunkSize = 10
    const toImport = parsed.filter((r) => !r.skipped)
    const chunks = []
    for (let i = 0; i < toImport.length; i += chunkSize) {
      chunks.push(toImport.slice(i, i + chunkSize))
    }

    // 版本号从 --version 起连续递增（V1.0.31, V1.0.32, ...），避免 Flyway 同版本多文件冲突
    const baseVersion = opts.version || 'V1.0.31'
    const baseParts = baseVersion.split('.')
    const major = baseParts[0]
    const minor = baseParts[1]
    const patchStart = Number(baseParts[2])
    const sqlParts = chunks.map((chunk, idx) => {
      const partNo = String(idx + 1).padStart(2, '0')
      const patch = patchStart + idx
      const ver = `${major}.${minor}.${patch}`
      const sql = buildSqlForExams(chunk, ver)
      const fileName = `${ver}__seed_exam_part${partNo}.sql`
      const outputPath = path.join(ROOT, 'docs/pending-migrations', fileName)
      fs.writeFileSync(outputPath, sql, 'utf8')
      return { fileName, outputPath, examCount: chunk.length }
    })

    console.log(`\n已生成 ${sqlParts.length} 个迁移文件（先落 pending-migrations，审批后再复制进 db/migration）：`)
    for (const s of sqlParts) {
      console.log(`- ${s.fileName}（${s.examCount} 套）: ${path.relative(ROOT, s.outputPath)}`)
    }
    console.log('审批通过后，复制到 exercise-service/src/main/resources/db/migration/ 并执行 migrate。')
  }
}

main()
