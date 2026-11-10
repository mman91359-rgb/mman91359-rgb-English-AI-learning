#!/usr/bin/env node
/**
 * 听力题目导入脚本。
 *
 * 用法：
 *   node scripts/import-listening.mjs check --exam cet6-2022-12-1
 *   node scripts/import-listening.mjs build --exam cet6-2022-12-1
 *
 * 输入：listening-source/<examId>/manifest.json + transcript.docx + questions.json
 * 输出：校验报告 report.json；build 时额外生成 Flyway V1.0.3 迁移 SQL。
 *
 * 不直接连数据库，不新增 npm 依赖；docx 通过系统 unzip 读取 word/document.xml。
 */

import fs from 'node:fs'
import path from 'node:path'
import { execFileSync } from 'node:child_process'
import { fileURLToPath } from 'node:url'

const __dirname = path.dirname(fileURLToPath(import.meta.url))
const ROOT = path.resolve(__dirname, '..')

const LISTENING_TYPES = new Set([
  'SHORT_DIALOGUE',
  'LONG_DIALOGUE',
  'PASSAGE',
  'LECTURE',
  'NEWS',
  'OTHER',
])

function usage() {
  console.log('用法: node scripts/import-listening.mjs <check|build> --exam <examId> [--version V1.0.3]')
}

function parseArgs(argv) {
  const command = argv[0]
  const opts = { command, examId: 'cet6-2022-12-1', version: 'V1.0.3' }
  for (let i = 1; i < argv.length; i += 1) {
    if (argv[i] === '--exam') opts.examId = argv[++i]
    else if (argv[i] === '--version') opts.version = argv[++i]
  }
  return opts
}

function readJson(filePath) {
  return JSON.parse(fs.readFileSync(filePath, 'utf8'))
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

function sqlString(value) {
  const text = value == null ? '' : String(value)
  return `'${text
    .replace(/\\/g, '\\\\')
    .replace(/'/g, "''")
    .replace(/\r?\n/g, '\\n')
    .replace(/\t/g, '\\t')}'`
}

/** 把 docx 的 XML 转成按段落分行的纯文本，保留 <ch> 分隔符。 */
function docxXmlToText(xml) {
  let text = xml
    .replace(/<w:tab\/>/g, '\t')
    .replace(/<w:br\/>/g, '\n')
    .replace(/<\/w:p>/g, '\n')
    .replace(/<[^>]+>/g, '')
  text = text
    .replace(/&lt;/g, '<')
    .replace(/&gt;/g, '>')
    .replace(/&quot;/g, '"')
    .replace(/&apos;/g, "'")
    .replace(/&amp;/g, '&')
  return text
}

function readDocxText(docxPath) {
  try {
    return execFileSync('unzip', ['-p', docxPath, 'word/document.xml'], {
      encoding: 'utf8',
      maxBuffer: 64 * 1024 * 1024,
    })
  } catch (error) {
    throw new Error(
      `读取 docx 失败：${docxPath}\n` +
      `请确认系统有 unzip 命令，或在 manifest.source 中配置 transcriptTxt。\n` +
      `原始错误：${error.message}`,
    )
  }
}

/** 解析 [mm:ss.xx]English<ch>中文 行。 */
function parseTimeline(text) {
  const lines = []
  for (const raw of text.split(/\r?\n/)) {
    const line = raw.trim()
    const match = line.match(/^\[(\d{1,3}):(\d{2})(?:\.(\d{1,3}))?\](.*)$/)
    if (!match) continue
    const fraction = Number(`0.${match[3] || '0'}`)
    const seconds = round2(Number(match[1]) * 60 + Number(match[2]) + fraction)
    const payload = (match[4] || '').trim()
    const splitIndex = payload.indexOf('<ch>')
    const english = (splitIndex >= 0 ? payload.slice(0, splitIndex) : payload).trim()
    const chinese = splitIndex >= 0 ? payload.slice(splitIndex + 4).trim() : ''
    if (!english && !chinese) continue
    lines.push({ seconds, english, chinese })
  }
  lines.sort((a, b) => a.seconds - b.seconds)
  return lines
}

function extractQuestionStems(lines) {
  const stems = new Map()
  for (const line of lines) {
    const match = line.english.match(/^(\d{1,3})\.\s*(.+)$/)
    if (!match) continue
    const number = Number(match[1])
    if (!stems.has(number)) {
      stems.set(number, match[2].trim())
    }
  }
  return stems
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

function normalizeQuestions(raw) {
  const list = Array.isArray(raw) ? raw : raw.questions
  if (!Array.isArray(list)) throw new Error('questions.json 缺少 questions 数组')
  const map = new Map()
  for (const item of list) {
    const number = Number(item.number)
    if (!Number.isInteger(number) || number <= 0) throw new Error(`非法题号: ${item.number}`)
    if (map.has(number)) throw new Error(`题号重复: ${number}`)
    map.set(number, item)
  }
  return map
}

function validate(manifest, examDir, docxLines) {
  const errors = []
  const warnings = []
  const groups = []
  const questionNumbers = new Set()

  if (!manifest.examId) errors.push('manifest.examId 不能为空')
  if (!manifest.audio?.publicUrl) errors.push('manifest.audio.publicUrl 不能为空')
  if (!LISTENING_TYPES.has(manifest.groups?.[0]?.listeningType)) {
    // 逐组校验时再给出精确错误
  }
  if (!Array.isArray(manifest.groups) || manifest.groups.length === 0) {
    errors.push('manifest.groups 不能为空')
    return { errors, warnings, groups, questionNumbers }
  }

  const totalSeconds = Number(manifest.audio?.totalSeconds)
  if (!Number.isFinite(totalSeconds) || totalSeconds <= 0) {
    errors.push('manifest.audio.totalSeconds 必须是正数')
  }

  const audioPath = path.join(ROOT, 'frontend/public/audio/exams', manifest.audio?.fileName || '')
  if (!manifest.audio?.fileName || !fs.existsSync(audioPath)) {
    errors.push(`音频文件不存在: ${path.relative(ROOT, audioPath)}`)
  }

  const questionStems = extractQuestionStems(docxLines)
  if (questionStems.size === 0) {
    errors.push('docx 中没有解析到 "N. What..." 格式的题干')
  }

  for (const group of manifest.groups) {
    const groupKey = group.groupKey
    if (!groupKey) errors.push('题组缺少 groupKey')
    if (!LISTENING_TYPES.has(group.listeningType)) {
      errors.push(`${groupKey}: listeningType 非法: ${group.listeningType}`)
    }
    const articleStart = Number(group.articleStartSeconds)
    const articleEnd = Number(group.articleEndSeconds)
    if (!Number.isFinite(articleStart) || !Number.isFinite(articleEnd)) {
      errors.push(`${groupKey}: articleStart/End 必须是数字`)
    } else {
      if (articleStart < 0) errors.push(`${groupKey}: articleStart 不能小于 0`)
      if (articleEnd <= articleStart) errors.push(`${groupKey}: articleEnd 必须大于 articleStart`)
      if (articleEnd > totalSeconds) errors.push(`${groupKey}: articleEnd 超过音频总时长`)
    }

    const articleLines = linesInRange(docxLines, articleStart, articleEnd)
    if (articleLines.length === 0) {
      errors.push(`${groupKey}: 文章段没有任何字幕行`)
    }

    const questions = []
    let previousQuestionEnd = null
    for (const question of group.questions || []) {
      const number = Number(question.number)
      if (!Number.isInteger(number) || number <= 0) {
        errors.push(`${groupKey}: 非法题号 ${question.number}`)
        continue
      }
      if (questionNumbers.has(number)) {
        errors.push(`题号 ${number} 在多个题组中重复`)
      }
      questionNumbers.add(number)

      const start = Number(question.questionStartSeconds)
      const end = Number(question.questionEndSeconds)
      if (!Number.isFinite(start) || !Number.isFinite(end)) {
        errors.push(`${groupKey} Q${number}: questionStart/End 必须是数字`)
      } else {
        if (start < articleStart) errors.push(`${groupKey} Q${number}: 题目起点早于文章起点`)
        if (end <= start) errors.push(`${groupKey} Q${number}: questionEnd 必须大于 questionStart`)
        if (end > totalSeconds) errors.push(`${groupKey} Q${number}: questionEnd 超过音频总时长`)
        if (previousQuestionEnd != null && start < previousQuestionEnd) {
          errors.push(`${groupKey} Q${number}: 题目区间与前题重叠`)
        }
        previousQuestionEnd = end
      }

      if (!questionStems.has(number)) {
        errors.push(`${groupKey} Q${number}: docx 中找不到题干`)
      }
      const questionLines = linesInRange(docxLines, start, end)
      if (questionLines.length === 0) {
        errors.push(`${groupKey} Q${number}: 题目段没有任何字幕行`)
      }

      const difficultyLevel = Number(question.difficultyLevel ?? 3)
      if (!Number.isInteger(difficultyLevel) || difficultyLevel < 1 || difficultyLevel > 8) {
        errors.push(`${groupKey} Q${number}: difficultyLevel 必须在 1~8`)
      }

      // 关键句（答案）区间，可选；提供时校验合法性
      let answerStart = null
      let answerEnd = null
      if (question.answerStartSeconds != null || question.answerEndSeconds != null) {
        answerStart = Number(question.answerStartSeconds)
        answerEnd = Number(question.answerEndSeconds)
        if (!Number.isFinite(answerStart) || !Number.isFinite(answerEnd)) {
          errors.push(`${groupKey} Q${number}: answerStart/End 必须是数字`)
        } else if (answerEnd <= answerStart) {
          errors.push(`${groupKey} Q${number}: answerEnd 必须大于 answerStart`)
        } else if (answerStart < articleStart || answerEnd > articleEnd) {
          errors.push(`${groupKey} Q${number}: answer 区间必须落在文章段内`)
        } else if (answerEnd > totalSeconds) {
          errors.push(`${groupKey} Q${number}: answerEnd 超过音频总时长`)
        }
      }

      questions.push({
        number,
        start,
        end,
        answerStart,
        answerEnd,
        difficultyLevel,
        stem: questionStems.get(number) || '',
        lrcLineCount: questionLines.length,
      })
    }

    if (questions.length === 0) {
      errors.push(`${groupKey}: 至少需要 1 道题`)
    }
    if (questions.length > 0 && articleEnd > questions[0].start) {
      errors.push(`${groupKey}: articleEnd 必须小于等于首题 questionStart`)
    }

    const groupRange = linesInRange(docxLines, articleStart, previousQuestionEnd ?? articleEnd)
    const lrc = buildLrc(groupRange)
    const transcript = buildTranscript(groupRange)
    if (!lrc) errors.push(`${groupKey}: 生成的 LRC 为空`)
    if (!transcript) errors.push(`${groupKey}: 生成的 transcript 为空`)

    groups.push({
      groupKey,
      listeningType: group.listeningType,
      articleStart,
      articleEnd,
      articleLineCount: articleLines.length,
      lrcLineCount: groupRange.length,
      lrc,
      transcript,
      questions,
    })
  }

  return { errors, warnings, groups, questionNumbers }
}

function validateQuestions(manifest, questionsByNumber, groups) {
  const errors = []
  for (const group of groups) {
    for (const question of group.questions) {
      const item = questionsByNumber.get(question.number)
      if (!item) {
        errors.push(`Q${question.number}: questions.json 中缺少该题`)
        continue
      }
      const options = item.options
      if (!options || typeof options !== 'object') {
        errors.push(`Q${question.number}: options 必须是对象`)
        continue
      }
      const keys = Object.keys(options).map((key) => key.toUpperCase()).sort()
      if (keys.join(',') !== 'A,B,C,D') {
        errors.push(`Q${question.number}: options 必须恰好是 A/B/C/D，当前为 ${keys.join(',')}`)
      }
      for (const key of keys) {
        const value = options[key] ?? options[key.toLowerCase()]
        if (!value || !String(value).trim()) {
          errors.push(`Q${question.number}: 选项 ${key} 为空`)
        }
      }
      const answer = String(item.answer || '').trim().toUpperCase()
      if (!/^[A-D]$/.test(answer)) {
        errors.push(`Q${question.number}: answer 必须是 A-D，当前为 ${item.answer}`)
      }
      if (!keys.includes(answer)) {
        errors.push(`Q${question.number}: answer=${answer} 不在 options 中`)
      }
      const confidence = item.answerMeta?.confidence
      if (confidence !== 'high') {
        errors.push(`Q${question.number}: 只接受 answerMeta.confidence=high，当前为 ${confidence || '缺失'}`)
      }
      if (!item.explanation || !String(item.explanation).trim()) {
        errors.push(`Q${question.number}: explanation 不能为空`)
      }
    }
  }
  return errors
}

function buildSql(manifest, groups, questionsByNumber, questionsStems) {
  const lines = []
  lines.push('-- 由 scripts/import-listening.mjs 自动生成，请勿手工修改。')
  lines.push(`-- examId: ${manifest.examId}`)
  lines.push(`-- 生成时间: ${new Date().toISOString()}`)
  lines.push(`-- 目标库: exercise_db`)
  lines.push('-- 执行前必须按 docs/数据库迁移规范.md 预览、备份、审批。')
  lines.push('')
  lines.push('START TRANSACTION;')
  lines.push('')

  let index = 0
  for (const group of groups) {
    const durationSeconds = Math.round(group.articleEnd - group.articleStart)
    for (const question of group.questions) {
      index += 1
      const item = questionsByNumber.get(question.number)
      if (!item) throw new Error(`Q${question.number} 缺少题目数据`)
      const variable = `@q${String(index).padStart(2, '0')}`
      const externalKey = `${manifest.examId}-q${String(question.number).padStart(2, '0')}`
      const stem = questionsStems.get(question.number) || question.stem
      const optionsJson = JSON.stringify(item.options)
      const answer = String(item.answer).trim().toUpperCase()
      const analysis = String(item.explanation || '').trim()

      lines.push(`-- Q${question.number} ${group.groupKey}`)
      lines.push('INSERT INTO `question_info`')
      lines.push('  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `source`, `ai_generated`, `usage_count`, `is_deleted`, `created_at`, `updated_at`)')
      lines.push('SELECT')
      lines.push(`  ${sqlString(externalKey)}, 4, ${sqlString(manifest.level || 'CET6')}, ${question.difficultyLevel}, 'CHOICE', 'IMPORT', 0, 0, 0, NOW(), NOW()`)
      lines.push('WHERE NOT EXISTS (')
      lines.push(`  SELECT 1 FROM \`question_info\` WHERE \`external_key\` = ${sqlString(externalKey)}`)
      lines.push(');')
      lines.push(`SET ${variable} = (SELECT \`id\` FROM \`question_info\` WHERE \`external_key\` = ${sqlString(externalKey)} LIMIT 1);`)
      lines.push('')
      lines.push('INSERT INTO `question_content`')
      lines.push('  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)')
      lines.push('SELECT')
      lines.push(`  ${variable}, ${sqlString(stem)}, ${sqlString(optionsJson)}, ${sqlString(answer)}, ${sqlString(analysis)}, NOW(), NOW()`)
      lines.push('WHERE NOT EXISTS (')
      lines.push(`  SELECT 1 FROM \`question_content\` WHERE \`question_id\` = ${variable}`)
      lines.push(');')
      lines.push('')
      lines.push('INSERT INTO `listening_audio`')
      lines.push('  (`question_id`, `audio_url`, `transcript`, `duration_seconds`, `audio_total_seconds`, `audio_start_seconds`, `audio_end_seconds`, `question_start_seconds`, `question_end_seconds`, `answer_start_seconds`, `answer_end_seconds`, `group_key`, `listening_type`, `lrc_content`, `created_at`, `updated_at`)')
      lines.push('VALUES (')
      const answerStartVal = question.answerStart == null ? 'NULL' : question.answerStart.toFixed(2)
      const answerEndVal = question.answerEnd == null ? 'NULL' : question.answerEnd.toFixed(2)
      lines.push(`  ${variable}, ${sqlString(manifest.audio.publicUrl)}, ${sqlString(group.transcript)}, ${durationSeconds}, ${Number(manifest.audio.totalSeconds)}, ${group.articleStart.toFixed(2)}, ${group.articleEnd.toFixed(2)}, ${question.start.toFixed(2)}, ${question.end.toFixed(2)}, ${answerStartVal}, ${answerEndVal}, ${sqlString(group.groupKey)}, ${sqlString(group.listeningType)}, ${sqlString(group.lrc)}, NOW(), NOW()`)
      lines.push(')')
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

  const examDir = path.join(ROOT, 'listening-source', opts.examId)
  const manifestPath = path.join(examDir, 'manifest.json')
  if (!fs.existsSync(manifestPath)) {
    console.error(`找不到 manifest: ${manifestPath}`)
    process.exit(1)
  }

  const manifest = readJson(manifestPath)
  const transcriptDocx = path.join(examDir, manifest.source?.transcriptDocx || 'transcript.docx')
  const transcriptTxt = path.join(examDir, manifest.source?.transcriptTxt || 'transcript.txt')
  let docxText
  if (fs.existsSync(transcriptDocx)) {
    docxText = docxXmlToText(readDocxText(transcriptDocx))
  } else if (fs.existsSync(transcriptTxt)) {
    docxText = fs.readFileSync(transcriptTxt, 'utf8')
  } else {
    console.error(`找不到 transcript.docx 或 transcript.txt: ${examDir}`)
    process.exit(1)
  }
  const docxLines = parseTimeline(docxText)
  const questionsJsonPath = path.join(examDir, manifest.source?.questionsJson || 'questions.json')
  if (!fs.existsSync(questionsJsonPath)) {
    console.error(`找不到 questions.json: ${questionsJsonPath}`)
    process.exit(1)
  }
  const questionsByNumber = normalizeQuestions(readJson(questionsJsonPath))
  const stems = extractQuestionStems(docxLines)

  const result = validate(manifest, examDir, docxLines)
  const questionErrors = validateQuestions(manifest, questionsByNumber, result.groups)
  const errors = [...result.errors, ...questionErrors]

  const report = {
    examId: manifest.examId,
    generatedAt: new Date().toISOString(),
    audio: manifest.audio,
    questionCount: result.groups.reduce((sum, group) => sum + group.questions.length, 0),
    groupCount: result.groups.length,
    errors,
    warnings: result.warnings,
    groups: result.groups.map((group) => ({
      groupKey: group.groupKey,
      listeningType: group.listeningType,
      articleStart: group.articleStart,
      articleEnd: group.articleEnd,
      articleLineCount: group.articleLineCount,
      lrcLineCount: group.lrcLineCount,
      questions: group.questions,
    })),
  }
  fs.writeFileSync(path.join(examDir, 'report.json'), JSON.stringify(report, null, 2) + '\n', 'utf8')

  if (errors.length > 0) {
    console.error(`校验失败，共 ${errors.length} 个错误：`)
    for (const error of errors) console.error(`- ${error}`)
    console.error(`报告: ${path.relative(ROOT, path.join(examDir, 'report.json'))}`)
    process.exit(1)
  }

  console.log(`校验通过：${report.groupCount} 组 / ${report.questionCount} 题`)
  for (const group of report.groups) {
    console.log(`- ${group.groupKey} ${group.listeningType} 文章 ${group.articleStart}-${group.articleEnd}s，题目 ${group.questions.map((q) => q.number).join(',')}`)
  }

  if (opts.command === 'build') {
    const sql = buildSql(manifest, result.groups, questionsByNumber, stems)
    const fileName = `${opts.version}__seed_listening_${opts.examId.replace(/-/g, '_')}.sql`
    // 先写到 pending 目录，避免 Flyway 在审批前随服务启动自动执行
    const outputPath = path.join(ROOT, 'docs/pending-migrations', fileName)
    fs.writeFileSync(outputPath, sql, 'utf8')
    console.log(`已生成: ${path.relative(ROOT, outputPath)}`)
    console.log('审批通过后，再复制到 exercise-service/src/main/resources/db/migration/ 并执行 migrate。')
  }
}

main()
