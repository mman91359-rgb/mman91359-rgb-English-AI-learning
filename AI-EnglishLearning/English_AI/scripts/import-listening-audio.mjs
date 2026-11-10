#!/usr/bin/env node
/**
 * 听力音频数据导入脚本（第二阶段：listening_audio 落库）。
 *
 * 与 import-listening.mjs 的关系：
 *   import-listening.mjs  处理「原始 docx + manifest」→ 生成 question_info/question_content/listening_audio 全套；
 *   本脚本处理「已格式化的 manifest.json + .lrc」→ 只补写 listening_audio（题目已由真题导入 V1.0.32~37 入库）。
 *
 * 用法：
 *   node scripts/import-listening-audio.mjs check
 *   node scripts/import-listening-audio.mjs build [--version V1.0.40]
 *
 * 输入：英语资源/格式化数据/CET4-听力|CET6-听力/<examId>/{manifest.json, listening-<examId>.lrc}
 * 输出：check 时打印校验报告；build 时生成 Flyway 迁移 SQL 到 docs/pending-migrations/。
 *
 * 范围（已与需求方确认）：
 *   只接入「音频有 + 题库听力题已入库」的 30 套（每套 25 题，共 750 行 listening_audio）。
 *   第三套 *-3（借用，内容与来源套重复）不入；残卷不入。
 *
 * 关联方式：external_key = {examId}-q{两位题号} → 已入库 question_info.id。
 */

import fs from 'node:fs'
import path from 'node:path'
import { fileURLToPath } from 'node:url'

const __dirname = path.dirname(fileURLToPath(import.meta.url))
const ROOT = path.resolve(__dirname, '..')

// 源数据目录（git 根 D:/AI-EnglishLearning 下的 英语资源/格式化数据）
const SOURCE_DIR = process.env.EXAM_AUDIO_DIR || 'D:/AI-EnglishLearning/英语资源/格式化数据'

// 已接入/可接入的 30 套（音频有 + 题库题已入库）；第三套 *-3 与残卷不入
const ALLOWED_SETS = new Set([
  'cet4-2023-12-1', 'cet4-2023-12-2', 'cet4-2024-06-1', 'cet4-2024-06-2',
  'cet4-2024-12-1', 'cet4-2024-12-2', 'cet4-2025-06-1', 'cet4-2025-06-2',
  'cet4-2025-12-1', 'cet4-2025-12-2', 'cet4-2026-06-1', 'cet4-2026-06-2',
  'cet6-2022-06-1', 'cet6-2022-09-1', 'cet6-2022-12-1', 'cet6-2022-12-2',
  'cet6-2023-06-1', 'cet6-2023-06-2', 'cet6-2023-12-1', 'cet6-2023-12-2',
  'cet6-2024-06-1', 'cet6-2024-06-2', 'cet6-2024-12-1', 'cet6-2024-12-2',
  'cet6-2025-06-1', 'cet6-2025-06-2', 'cet6-2025-12-1', 'cet6-2025-12-2',
  'cet6-2026-06-1', 'cet6-2026-06-2',
])

const LISTENING_TYPES = new Set(['NEWS', 'LONG_DIALOGUE', 'PASSAGE', 'LECTURE', 'SHORT_DIALOGUE', 'OTHER'])

function usage() {
  console.log('用法: node scripts/import-listening-audio.mjs <check|build> [--version V1.0.40]')
}

function parseArgs(argv) {
  const opts = { command: argv[0], version: 'V1.0.40' }
  for (let i = 1; i < argv.length; i += 1) {
    if (argv[i] === '--version') opts.version = argv[++i]
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

function round2(value) {
  return Math.round(Number(value) * 100) / 100
}

function formatLrcTime(seconds) {
  const totalCentis = Math.max(0, Math.round(Number(seconds) * 100))
  const minutes = Math.floor(totalCentis / 6000)
  const secs = Math.floor((totalCentis % 6000) / 100)
  const centis = totalCentis % 100
  return `${String(minutes).padStart(2, '0')}:${String(secs).padStart(2, '0')}.${String(centis).padStart(2, '0')}`
}

/** 解析 LRC 文本为 [{seconds, english, chinese}]，时间单调递增。 */
function parseLrc(content) {
  const lines = []
  for (const raw of content.split(/\r?\n/)) {
    const line = raw.trim()
    if (!line) continue
    // 忽略元信息 [ti:][ar:] 等
    if (/^\[(ti|ar|al|by|re|ve|offset):/i.test(line)) continue
    const match = line.match(/^\[(\d{1,3}):(\d{2})(?:\.(\d{1,3}))?\](.*)$/)
    if (!match) continue
    const fraction = Number(`0.${match[3] || '0'}`)
    const seconds = round2(Number(match[1]) * 60 + Number(match[2]) + fraction)
    const payload = (match[4] || '').trim()
    if (!payload) continue
    // 全角｜分隔中英（本批数据已统一），兼容 || 
    const sepIdx = payload.includes('｜') ? payload.indexOf('｜') : payload.indexOf('||')
    const english = (sepIdx >= 0 ? payload.slice(0, sepIdx) : payload).trim()
    const chinese = sepIdx >= 0 ? payload.slice(sepIdx + (payload.includes('｜') ? 1 : 2)).trim() : ''
    lines.push({ seconds, english, chinese })
  }
  lines.sort((a, b) => a.seconds - b.seconds)
  return lines
}

function linesInRange(lines, start, end) {
  return lines.filter((line) => line.seconds >= start && line.seconds < end)
}

function buildLrc(lines) {
  return lines
    .filter((line) => line.english)
    .map((line) => {
      const suffix = line.chinese ? `｜${line.chinese}` : ''
      return `[${formatLrcTime(line.seconds)}]${line.english}${suffix}`
    })
    .join('\n')
}

function buildTranscript(lines) {
  return lines
    .map((line) => [line.english, line.chinese].filter(Boolean).join('\n'))
    .filter(Boolean)
    .join('\n\n')
}

/** 收集 30 套的 examId。 */
function collectSets() {
  const result = []
  for (const level of ['CET4-听力', 'CET6-听力']) {
    const dir = path.join(SOURCE_DIR, level)
    if (!fs.existsSync(dir)) continue
    for (const f of fs.readdirSync(dir)) {
      if (f.startsWith('cet') && fs.statSync(path.join(dir, f)).isDirectory() && ALLOWED_SETS.has(f)) {
        result.push({ examId: f, dir: path.join(dir, f) })
      }
    }
  }
  result.sort((a, b) => a.examId.localeCompare(b.examId))
  return result
}

/** 校验并解析单个套次，返回 { examId, errors, groups, manifest }。 */
function parseSet({ examId, dir }) {
  const errors = []
  const manifestPath = path.join(dir, 'manifest.json')
  if (!fs.existsSync(manifestPath)) {
    return { examId, errors: [`${examId}: 缺少 manifest.json`], groups: [], manifest: null }
  }
  const manifest = JSON.parse(fs.readFileSync(manifestPath, 'utf8'))
  if (manifest.examId !== examId) errors.push(`${examId}: manifest.examId 不一致: ${manifest.examId}`)

  const lrcFile = path.join(dir, `listening-${examId}.lrc`)
  if (!fs.existsSync(lrcFile)) {
    return { examId, errors: [...errors, `${examId}: 缺少 .lrc`], groups: [], manifest }
  }
  const lrcLines = parseLrc(fs.readFileSync(lrcFile, 'utf8'))
  if (lrcLines.length === 0) errors.push(`${examId}: LRC 解析为空`)

  const totalSeconds = Number(manifest.audio?.totalSeconds)
  if (!Number.isFinite(totalSeconds) || totalSeconds <= 0) {
    errors.push(`${examId}: audio.totalSeconds 非法`)
  }

  const groups = []
  const questionNumbers = new Set()
  for (const group of manifest.groups || []) {
    const groupKey = group.groupKey
    if (!groupKey) errors.push(`${examId}: 题组缺 groupKey`)
    if (!LISTENING_TYPES.has(group.listeningType)) errors.push(`${examId}: ${groupKey} listeningType 非法: ${group.listeningType}`)

    const articleStart = Number(group.articleStartSeconds)
    const articleEnd = Number(group.articleEndSeconds)
    if (!Number.isFinite(articleStart) || !Number.isFinite(articleEnd)) {
      errors.push(`${examId}: ${groupKey} articleStart/End 非法`)
    } else if (articleEnd <= articleStart) {
      errors.push(`${examId}: ${groupKey} articleEnd <= articleStart`)
    } else if (articleEnd > totalSeconds) {
      errors.push(`${examId}: ${groupKey} articleEnd 超总时长`)
    }

    let lastQuestionEnd = articleEnd
    const questions = []
    for (const q of group.questions || []) {
      const number = Number(q.number)
      if (!Number.isInteger(number) || number <= 0) {
        errors.push(`${examId}: ${groupKey} 非法题号 ${q.number}`)
        continue
      }
      if (questionNumbers.has(number)) errors.push(`${examId}: 题号 ${number} 重复`)
      questionNumbers.add(number)

      const start = Number(q.questionStartSeconds)
      const end = Number(q.questionEndSeconds)
      if (!Number.isFinite(start) || !Number.isFinite(end) || end <= start) {
        errors.push(`${examId}: ${groupKey} Q${number} questionStart/End 非法`)
      } else if (end > totalSeconds) {
        errors.push(`${examId}: ${groupKey} Q${number} questionEnd 超总时长`)
      }
      lastQuestionEnd = Math.max(lastQuestionEnd, Number.isFinite(end) ? end : 0)

      // answer 可选
      let answerStart = null
      let answerEnd = null
      if (q.answerStartSeconds != null || q.answerEndSeconds != null) {
        answerStart = Number(q.answerStartSeconds)
        answerEnd = Number(q.answerEndSeconds)
        if (!Number.isFinite(answerStart) || !Number.isFinite(answerEnd) || answerEnd <= answerStart) {
          errors.push(`${examId}: ${groupKey} Q${number} answerStart/End 非法`)
        } else if (answerStart < articleStart || answerEnd > articleEnd) {
          errors.push(`${examId}: ${groupKey} Q${number} answer 区间未落在文章段内`)
        }
      }

      questions.push({ number, start, end, answerStart, answerEnd })
    }

    const groupLines = linesInRange(lrcLines, articleStart, lastQuestionEnd)
    const transcript = buildTranscript(groupLines)
    const lrc = buildLrc(groupLines)

    groups.push({
      groupKey,
      listeningType: group.listeningType,
      articleStart,
      articleEnd,
      transcript,
      lrc,
      questions,
    })
  }

  if (questionNumbers.size !== 25) {
    errors.push(`${examId}: 题号应 25 个，实际 ${questionNumbers.size}`)
  }

  return { examId, errors, groups, manifest }
}

function main() {
  const opts = parseArgs(process.argv.slice(2))
  if (!['check', 'build'].includes(opts.command)) {
    usage()
    process.exit(1)
  }

  const sets = collectSets()
  if (sets.length === 0) {
    console.error(`未找到可接入套次: ${SOURCE_DIR}`)
    process.exit(1)
  }

  const parsed = sets.map(parseSet)
  const allErrors = []
  let totalQuestions = 0
  let totalGroups = 0
  let answerFilled = 0
  let answerMissing = 0
  for (const p of parsed) {
    allErrors.push(...p.errors)
    totalQuestions += p.groups.reduce((s, g) => s + g.questions.length, 0)
    totalGroups += p.groups.length
    for (const g of p.groups) {
      for (const q of g.questions) {
        if (q.answerStart != null) answerFilled++
        else answerMissing++
      }
    }
  }

  console.log(`可接入套数: ${parsed.length}`)
  console.log(`题组: ${totalGroups} / 题目: ${totalQuestions}`)
  console.log(`answer 关键句已填: ${answerFilled} / 未填: ${answerMissing}`)

  if (allErrors.length > 0) {
    console.error(`\n校验失败，共 ${allErrors.length} 个错误：`)
    for (const e of allErrors.slice(0, 100)) console.error(`- ${e}`)
    process.exit(1)
  }
  console.log('\n校验通过。')

  if (opts.command === 'build') {
    const lines = []
    lines.push('-- 由 scripts/import-listening-audio.mjs 自动生成，请勿手工修改。')
    lines.push(`-- 版本: ${opts.version}`)
    lines.push(`-- 生成时间: ${new Date().toISOString()}`)
    lines.push('-- 目标库: exercise_db')
    lines.push('-- 范围：30 套（音频有 + 题库题已入库），仅补写 listening_audio；第三套 *-3 与残卷不入。')
    lines.push('-- 执行前必须按 docs/数据库迁移规范.md 预览、备份、审批。')
    lines.push('')
    lines.push('START TRANSACTION;')
    lines.push('')

    for (const p of parsed) {
      const examId = p.examId
      const audio = p.manifest.audio
      lines.push(`-- ==================== ${examId} ====================`)
      for (const group of p.groups) {
        const durationSeconds = Math.round(group.articleEnd - group.articleStart)
        for (const q of group.questions) {
          const externalKey = `${examId}-q${String(q.number).padStart(2, '0')}`
          const varName = `@a_${examId.replace(/[^a-z0-9]/gi, '_')}_${String(q.number).padStart(2, '0')}`
          const answerStartVal = q.answerStart == null ? 'NULL' : q.answerStart.toFixed(2)
          const answerEndVal = q.answerEnd == null ? 'NULL' : q.answerEnd.toFixed(2)

          lines.push(`-- ${examId} Q${q.number} ${group.groupKey}`)
          lines.push(`SET ${varName} = (SELECT \`id\` FROM \`question_info\` WHERE \`external_key\` = ${sqlString(externalKey)} AND \`module_type\` = 4 LIMIT 1);`)
          lines.push('INSERT INTO `listening_audio`')
          lines.push('  (`question_id`, `audio_url`, `transcript`, `duration_seconds`, `audio_total_seconds`, `audio_start_seconds`, `audio_end_seconds`, `question_start_seconds`, `question_end_seconds`, `answer_start_seconds`, `answer_end_seconds`, `group_key`, `listening_type`, `lrc_content`, `created_at`, `updated_at`)')
          lines.push('SELECT')
          lines.push(`  ${varName}, ${sqlString(audio.publicUrl)}, ${sqlString(group.transcript)}, ${durationSeconds}, ${Number(audio.totalSeconds)}, ${group.articleStart.toFixed(2)}, ${group.articleEnd.toFixed(2)}, ${q.start.toFixed(2)}, ${q.end.toFixed(2)}, ${answerStartVal}, ${answerEndVal}, ${sqlString(group.groupKey)}, ${sqlString(group.listeningType)}, ${sqlString(group.lrc)}, NOW(), NOW()`)
          lines.push(`WHERE ${varName} IS NOT NULL`)
          lines.push('ON DUPLICATE KEY UPDATE')
          lines.push('  `audio_url` = VALUES(`audio_url`),')
          lines.push('  `transcript` = VALUES(`transcript`),')
          lines.push('  `duration_seconds` = VALUES(`duration_seconds`),')
          lines.push('  `audio_total_seconds` = VALUES(`audio_total_seconds`),')
          lines.push('  `audio_start_seconds` = VALUES(`audio_start_seconds`),')
          lines.push('  `audio_end_seconds` = VALUES(`audio_end_seconds`),')
          lines.push('  `question_start_seconds` = VALUES(`question_start_seconds`),')
          lines.push('  `question_end_seconds` = VALUES(`question_end_seconds`),')
          lines.push('  `answer_start_seconds` = VALUES(`answer_start_seconds`),')
          lines.push('  `answer_end_seconds` = VALUES(`answer_end_seconds`),')
          lines.push('  `group_key` = VALUES(`group_key`),')
          lines.push('  `listening_type` = VALUES(`listening_type`),')
          lines.push('  `lrc_content` = VALUES(`lrc_content`),')
          lines.push('  `updated_at` = NOW();')
          lines.push('')
        }
      }
    }

    lines.push('COMMIT;')
    lines.push('')

    const fileName = `${opts.version}__seed_listening_audio.sql`
    const outputPath = path.join(ROOT, 'docs/pending-migrations', fileName)
    fs.writeFileSync(outputPath, lines.join('\n'), 'utf8')
    console.log(`\n已生成: ${path.relative(ROOT, outputPath)}`)
    console.log('审批通过后，复制到 exercise-service/src/main/resources/db/migration/ 并执行 migrate。')
  }
}

main()
