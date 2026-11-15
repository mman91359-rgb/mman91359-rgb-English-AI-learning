#!/usr/bin/env node
/**
 * 前端 UI 一致性门禁（只读）
 *
 * 口径来源：English_AI/docs/前端UI契约.md §10「验收方式」的七条 git grep 命令，
 *           以及同节「当前七条：L1a 28 / L1b 124 / ...」登记行。
 *
 * 设计约束：
 * 1. 只读：不写任何源文件，不执行任何 git 写操作，只打印报告并设置退出码。
 * 2. 完全复刻 §10 口径：七条命令的 flags / pattern / pathspec / 过滤管道逐条对应；
 *    用 spawnSync 的 argv 数组传参（不经 shell），等价于在 frontend/ 下手敲 §10 里的命令；
 *    命令中的 `| grep -v ...` 用等价的 JS 行过滤复刻，`| wc -l` 与「无 wc -l 时按输出行计」用行数复刻。
 * 3. PowerShell 兼容：
 *    - 编码：直接取 git stdout 的 Buffer 并按 UTF-8 解码，不经 PowerShell 转接，
 *      规避 CP936 把含中文注释的行与下一行粘连、使 -n 口径少算 1 行的问题（§10 警示 1）。
 *    - 正则转义：§10 在 PowerShell 下须写 `[^\"]` 才能把引号传进 git；argv 数组不经 shell，
 *      直接写语义等价的 `[^"]`（§10 警示 2）。
 * 4. 期望值不在脚本里硬编码，从契约文档 §10「当前七条」行解析，避免文档与脚本两处漂移。
 *    §10 命令注释里的 `当前 N @ <short-sha>` 属历史快照锚点，按 §11.5 豁免，不参与比对。
 *
 * 用法：node scripts/check-ui-consistency.mjs [commit-ish]
 * 退出码：0 = 七条全部与文档登记匹配；1 = 存在不匹配；2 = 运行错误
 */

import { spawnSync } from 'node:child_process'
import { readFileSync } from 'node:fs'
import { resolve } from 'node:path'

const SCRIPT_DIR = import.meta.dirname
const FRONTEND_ROOT = resolve(SCRIPT_DIR, '..')
const CONTRACT_PATH = resolve(FRONTEND_ROOT, '..', 'docs', '前端UI契约.md')

const PATHSPEC_ALL = ['src/*.vue', 'src/*.ts']

/**
 * 七条口径，一条对应 §10 一条命令。
 * flags / pattern / pathspec 原样照抄；exclude 对应命令里的 `| grep -v ...`；
 * tail 记录该命令末尾是 `| wc -l` 还是「直接看输出行」。
 */
const RULES = [
  {
    id: 'L1a',
    name: '任意值圆角（半径族）',
    flags: '-ohE',
    pattern: 'rounded(-[trblse]{1,2})?-\\[[0-9]*px\\]',
    pathspec: PATHSPEC_ALL,
    exclude: null,
    tail: '| wc -l',
  },
  {
    id: 'L1b',
    name: '除圆角外其他属性的任意值',
    flags: '-ohE',
    pattern: '[a-z-]+-\\[[^]]*\\]',
    pathspec: PATHSPEC_ALL,
    exclude: { text: 'grep -vE "^rounded"', test: (line) => /^rounded/.test(line) },
    tail: '| wc -l',
  },
  {
    id: 'L2',
    name: '图标具名原生字号（死类名）',
    flags: '-n',
    // §10 原文在 PowerShell 下写 [^\"]，argv 数组传参无需转义，语义等价为 [^"]
    pattern: 'material-symbols-outlined[^"]*text-\\(xs\\|sm\\|base\\|lg\\|xl\\|2xl\\|3xl\\)\\b',
    pathspec: ['src/views/*.vue'],
    exclude: null,
    tail: '| wc -l',
  },
  {
    id: 'L3',
    name: '手写 soft-glow 字面量',
    flags: '-n',
    pattern: 'shadow-\\[0_4px_20px_rgba(51,58,72,0.05)\\]',
    pathspec: PATHSPEC_ALL,
    exclude: null,
    tail: '按输出行计',
  },
  {
    id: 'L4',
    name: '不存在的色类',
    flags: '-n',
    pattern: 'success-container\\|text-success',
    pathspec: PATHSPEC_ALL,
    exclude: null,
    tail: '按输出行计',
  },
  {
    id: 'L5',
    name: '组件层直写图标（排除 AppIcon.vue）',
    flags: '-n',
    pattern: 'material-symbols-outlined',
    pathspec: ['src/components/*.vue'],
    exclude: { text: 'grep -v "AppIcon.vue"', test: (line) => line.includes('AppIcon.vue') },
    tail: '| wc -l',
  },
  {
    id: 'L6',
    name: '非 M3 调色板直用',
    flags: '-oE',
    pattern:
      '\\b(bg|text|border|border-[lrtb]|from|via|to|ring|divide|placeholder)-(white|black|(gray|red|orange|amber|yellow|lime|green|emerald|teal|cyan|sky|blue|indigo|violet|purple|fuchsia|pink|rose|slate|zinc|neutral|stone)-(50|100|200|300|400|500|600|700|800|900|950))',
    pathspec: PATHSPEC_ALL,
    exclude: null,
    tail: '| wc -l',
  },
]

const IDS = RULES.map((rule) => rule.id)

/** 只调用 git，取 Buffer 并按 UTF-8 解码；不执行任何写子命令 */
function runGit(args) {
  const result = spawnSync('git', args, {
    cwd: FRONTEND_ROOT,
    maxBuffer: 64 * 1024 * 1024,
    windowsHide: true,
  })
  if (result.error) throw new Error(`git 调用失败：${result.error.message}`)
  return {
    status: result.status,
    stdout: Buffer.isBuffer(result.stdout) ? result.stdout.toString('utf8') : String(result.stdout ?? ''),
    stderr: Buffer.isBuffer(result.stderr) ? result.stderr.toString('utf8') : String(result.stderr ?? ''),
  }
}

/** 复刻 wc -l 的输入：按换行切分，去掉末尾空项，并剥离 Windows 可能带上的 \r */
function splitLines(text) {
  if (!text) return []
  const lines = text.split('\n')
  if (lines.length > 0 && lines[lines.length - 1] === '') lines.pop()
  return lines.map((line) => line.replace(/\r$/, ''))
}

/** 跑一条口径，返回计数 */
function measure(rule, ref) {
  const args = ['grep', rule.flags, rule.pattern, ref, '--', ...rule.pathspec]
  const result = runGit(args)
  // git grep：0 = 有匹配，1 = 无匹配，>1 = 真错误
  if (result.status !== 0 && result.status !== 1) {
    throw new Error(`${rule.id} git grep 失败（exit ${result.status}）：${result.stderr.trim()}`)
  }
  let lines = splitLines(result.stdout)
  if (rule.exclude) lines = lines.filter((line) => !rule.exclude.test(line))
  return lines.length
}

/** 从契约文档 §10「当前七条：」行读取登记值；历史快照锚点行不参与 */
function readRegistered() {
  let text
  try {
    text = readFileSync(CONTRACT_PATH, 'utf8')
  } catch (error) {
    throw new Error(`契约文档不可读：${CONTRACT_PATH}（${error.message}）`)
  }
  const lines = text.split(/\r?\n/)
  const index = lines.findIndex((line) => line.replace(/^>\s*/, '').startsWith('当前七条：'))
  if (index < 0) throw new Error('契约文档 §10 未找到「当前七条：」登记行')
  const line = lines[index]
  const values = {}
  for (const match of line.matchAll(/L(1a|1b|2|3|4|5|6)\s+(\d+)/g)) {
    values[`L${match[1]}`] = Number(match[2])
  }
  const missing = IDS.filter((id) => !(id in values))
  if (missing.length > 0) {
    throw new Error(`登记行缺项 ${missing.join(' / ')}；原文：${line.trim()}`)
  }
  return { lineNo: index + 1, lineText: line.trim(), values }
}

/** 中文按 2 列宽计算，保证控制台表格对齐 */
function displayWidth(text) {
  let width = 0
  for (const ch of text) width += ch.codePointAt(0) > 0x7f ? 2 : 1
  return width
}

function pad(text, width) {
  return text + ' '.repeat(Math.max(0, width - displayWidth(text)))
}

function printUsage() {
  console.log('用法：node scripts/check-ui-consistency.mjs [commit-ish]')
  console.log('  commit-ish 省略时取 HEAD；脚本只读，不修复任何问题。')
  console.log('  退出码：0 = 七条全部匹配；1 = 存在不匹配；2 = 运行错误')
}

function printReport({ ref, short, registered, rows }) {
  const bar = '─'.repeat(78)
  console.log('┌' + '─'.repeat(78) + '┐')
  console.log('  Recall·睿考 · 前端 UI 一致性门禁（只读）')
  console.log('└' + '─'.repeat(78) + '┘')
  console.log(`  契约文档 : ${CONTRACT_PATH}`)
  console.log(`  登记来源 : §10 第 ${registered.lineNo} 行  ${registered.lineText}`)
  console.log(`  复核对象 : ${ref}  (${short})`)
  console.log(`  扫描目录 : ${FRONTEND_ROOT}`)
  console.log(bar)
  console.log(`  ${pad('编号', 6)}${pad('口径', 40)}${pad('登记', 8)}${pad('实测', 8)}判定`)
  console.log(bar)
  for (const row of rows) {
    const verdict = row.ok ? '匹配' : '不匹配'
    console.log(
      `  ${pad(row.id, 6)}${pad(row.name, 40)}${pad(String(row.expected), 8)}${pad(String(row.actual), 8)}${verdict}`,
    )
  }
  console.log(bar)
  console.log('  口径明细（逐条对应 §10，无自定义宽口径）：')
  for (const rule of RULES) {
    const filter = rule.exclude ? ` | ${rule.exclude.text}` : ''
    console.log(
      `  ${rule.id}  git grep ${rule.flags} '${rule.pattern}' ${ref} -- ${rule.pathspec.join(' ')}${filter} ${rule.tail}`,
    )
  }
  console.log(bar)
}

function main() {
  const arg = process.argv[2]
  if (arg === '-h' || arg === '--help') {
    printUsage()
    return 0
  }
  const ref = arg || 'HEAD'

  const registered = readRegistered()
  const rev = runGit(['rev-parse', '--short', ref])
  if (rev.status !== 0) throw new Error(`commit-ish 无效：${ref}（${rev.stderr.trim()}）`)
  const short = rev.stdout.trim() || ref

  const rows = RULES.map((rule) => {
    const actual = measure(rule, ref)
    const expected = registered.values[rule.id]
    return { ...rule, actual, expected, ok: actual === expected }
  })

  printReport({ ref, short, registered, rows })

  const mismatched = rows.filter((row) => !row.ok)
  if (mismatched.length > 0) {
    console.log(`  结果：${rows.length - mismatched.length} / ${rows.length} 条匹配；差异项：`)
    for (const row of mismatched) {
      console.log(`    ${row.id} ${row.name}：登记 ${row.expected}，实测 ${row.actual}（差 ${row.actual - row.expected > 0 ? '+' : ''}${row.actual - row.expected}）`)
    }
    console.log('  退出码：1（存在不匹配；本脚本不自动修复）')
    return 1
  }
  console.log(`  结果：${rows.length} / ${rows.length} 条与文档登记一致`)
  console.log('  退出码：0（仅做只读校验，未修改任何源文件）')
  return 0
}

try {
  process.exitCode = main()
} catch (error) {
  console.error(`  运行错误：${error.message}`)
  console.error('  退出码：2（校验未能完成，不视为基线匹配）')
  process.exitCode = 2
}
