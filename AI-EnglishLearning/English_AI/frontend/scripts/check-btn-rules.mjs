#!/usr/bin/env node
/**
 * 前端按钮规则门禁（L9，只读）
 *
 * 规则来源：English_AI/docs/前端UI契约.md §5「按钮」的三条禁止条款。
 *   §5-1 所有按钮底座固定 rounded-full，调用方不得覆盖
 *   §5-2 禁止在 bg-primary 按钮上叠加 rounded-xl
 *   §5-3 禁止绕过 btnIcon* 手写 h-N w-N rounded-full 图标按钮
 *
 * 判定方式：per-file 冻结表。
 *   存量违规按文件登记在 BASELINE 里，任何文件任一类超出基线即 fail；
 *   文件不在基线表中却出现违规也 fail。删旧增新不会因总数相等而漏网。
 *
 * 为什么不用 git grep：按钮开标签可能跨多行，且需要区分 `:class` 动态绑定，
 *   单行 grep 无法判定。本脚本按 §10 基线口径「只认 <ref>」的要求，
 *   逐文件 git show 取内容后再解析，不读工作区，避免未提交改动污染基线。
 *
 * 用法：node scripts/check-btn-rules.mjs [commit-ish]
 * 退出码：0 = 全部文件未超基线；1 = 存在超基线；2 = 运行错误
 *
 * 本脚本只读，不修改任何源文件，不执行任何 git 写操作。
 */

import { spawnSync } from 'node:child_process'
import { resolve } from 'node:path'

const SCRIPT_DIR = import.meta.dirname
const FRONTEND_ROOT = resolve(SCRIPT_DIR, '..')

/**
 * 存量冻结表：[ icon, bgRect, shape ]
 *   2026-11-21 实测于 b5b4fc0，共 82 处违反 §5。
 *   只允许减少，不允许任何文件超出对应档位。
 */
const BASELINE = {
  'components/AiSidebar.vue': [0, 0, 1],
  'components/AiSidebarContent.vue': [1, 0, 3],
  'components/AudioPlayer.vue': [2, 0, 0],
  'components/ToastNotification.vue': [1, 0, 0],
  'components/VocabularyGoalDialog.vue': [2, 0, 0],
  'components/WordReviewDialog.vue': [0, 0, 1],
  'components/admin/AdminFilterBar.vue': [0, 0, 1],
  'components/admin/AdminPagination.vue': [0, 0, 1],
  'components/admin/AdminSidebar.vue': [0, 0, 1],
  'components/admin/AdminTopbar.vue': [2, 0, 0],
  'components/ai/AiCard.vue': [0, 1, 2],
  'components/ai/FeedbackCardBody.vue': [0, 1, 0],
  'components/checkin/CheckInCalendarDialog.vue': [0, 0, 1],
  'components/listening/ListeningEntryPanel.vue': [0, 0, 1],
  'components/translation/TranslationEntryPanel.vue': [0, 0, 1],
  'components/word/WordDetailCard.vue': [2, 0, 0],
  'components/word/WordToken.vue': [0, 0, 1],
  'components/writing/WritingAnswerSheet.vue': [0, 0, 1],
  'components/writing/WritingEntryPanel.vue': [0, 0, 1],
  'views/ErrorBookView.vue': [0, 1, 6],
  'views/ForgotPasswordView.vue': [0, 0, 1],
  'views/GrammarQuizView.vue': [0, 1, 4],
  'views/LearningView.vue': [0, 0, 2],
  'views/ListeningQuizView.vue': [0, 1, 5],
  'views/LoginView.vue': [0, 0, 1],
  'views/PracticeView.vue': [0, 3, 1],
  'views/ProfileView.vue': [0, 1, 0],
  'views/RegisterView.vue': [0, 0, 3],
  'views/SettingsView.vue': [0, 0, 1],
  'views/StatsView.vue': [0, 0, 1],
  'views/TranslationPracticeView.vue': [0, 0, 4],
  'views/VocabQuizView.vue': [1, 2, 7],
  'views/VocabularyView.vue': [1, 0, 2],
  'views/admin/AdminUsersView.vue': [4, 0, 0],
  'views/writing/WritingHistoryView.vue': [0, 0, 1],
}

const AREAS = ['src/views', 'src/components']

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

/** 列出 ref 下所有 .vue 文件（相对 frontend/ 的路径） */
function listVueFiles(ref) {
  const res = runGit(['ls-tree', '-r', '--name-only', ref, '--', ...AREAS])
  if (res.status !== 0) throw new Error(`git ls-tree 失败：${res.stderr.trim()}`)
  return res.stdout
    .split('\n')
    .map((line) => line.replace(/\r$/, '').trim())
    .filter((line) => line.endsWith('.vue'))
}

/** 取 ref 下单个文件内容 */
function readAtRef(ref, relPath) {
  // 用 ./ 前缀表示 cwd 相对路径，避免 git 要求 repo-root 相对路径
  const res = runGit(['show', `${ref}:./${relPath}`])
  if (res.status !== 0) throw new Error(`git show ${ref}:${relPath} 失败：${res.stderr.trim()}`)
  return res.stdout
}

/** 抓 <button ...> 开标签（可跨行），返回 { lineNo, cls } 列表 */
function collectLiteralButtons(src) {
  const BTN = /<button\b((?:[^<>]|\n)*?)>/g
  const out = []
  let match
  BTN.lastIndex = 0
  while ((match = BTN.exec(src))) {
    const tagSrc = match[0]
    const lineNo = src.slice(0, match.index).split('\n').length
    if (/\s:class\s*=/.test(tagSrc) || /\sv-bind:class\s*=/.test(tagSrc)) continue
    const cm = tagSrc.match(/\sclass="([^"]*)"/)
    if (!cm) continue
    out.push({ lineNo, cls: cm[1] })
  }
  return out
}

/** 判定单个按钮属于哪类违反 §5；null = 合规 */
function classify(cls) {
  const isFull = /rounded-full/.test(cls)
  if (isFull) {
    const isIcon = /\bh-\d+\b/.test(cls) && /\bw-\d+\b/.test(cls)
    return isIcon ? 'icon' : null
  }
  const isPrimary = /\bbg-primary\b/.test(cls) && !/\bbg-primary-container\b/.test(cls)
  return isPrimary ? 'bgRect' : 'shape'
}

const DIM_ORDER = ['icon', 'bgRect', 'shape']
const DIM_NAME = { icon: '手写图标按钮', bgRect: 'bg-primary+非圆底', shape: '非 rounded-full 底座' }

function main() {
  const arg = process.argv[2]
  if (arg === '-h' || arg === '--help') {
    console.log('用法：node scripts/check-btn-rules.mjs [commit-ish]')
    console.log('  commit-ish 省略时取 HEAD；脚本只读，不修复任何问题。')
    console.log('  退出码：0 = 全部文件未超基线；1 = 存在超基线；2 = 运行错误')
    return 0
  }
  const ref = arg || 'HEAD'
  const rev = runGit(['rev-parse', '--short', ref])
  if (rev.status !== 0) throw new Error(`commit-ish 无效：${ref}（${rev.stderr.trim()}）`)
  const short = rev.stdout.trim() || ref

  const files = listVueFiles(ref)
  if (files.length === 0) throw new Error(`${ref} 下未找到任何 .vue 文件`)

  const actual = {}
  const details = []
  // 路径统一去掉 src/ 前缀，与 BASELINE 的键对齐
  const norm = (p) => p.replace(/^src\//, '')
  for (const relPath of files) {
    const src = readAtRef(ref, relPath)
    for (const btn of collectLiteralButtons(src)) {
      const type = classify(btn.cls)
      if (!type) continue
      const key = norm(relPath)
      actual[key] ||= { icon: 0, bgRect: 0, shape: 0 }
      actual[key][type] += 1
      details.push({ relPath: key, lineNo: btn.lineNo, type })
    }
  }

  const totals = { icon: 0, bgRect: 0, shape: 0 }
  for (const entry of Object.values(actual)) {
    for (const dim of DIM_ORDER) totals[dim] += entry[dim]
  }

  const rows = []
  let overflow = 0
  for (const relPath of Object.keys(actual)) {
    const base = BASELINE[relPath] || [0, 0, 0]
    const act = actual[relPath]
    const over = DIM_ORDER.map((dim, i) => Math.max(0, act[dim] - base[i]))
    const overSum = over.reduce((a, b) => a + b, 0)
    overflow += overSum
    rows.push({ relPath, act, base, over, overSum })
  }
  // 基线中登记了但文件已无违规（改善），也列出
  for (const relPath of Object.keys(BASELINE)) {
    if (actual[relPath]) continue
    rows.push({ relPath, act: { icon: 0, bgRect: 0, shape: 0 }, base: BASELINE[relPath], over: [0, 0, 0], overSum: 0, improved: true })
  }
  rows.sort((a, b) => b.overSum - a.overSum || (b.act.icon + b.act.bgRect + b.act.shape) - (a.act.icon + a.act.bgRect + a.act.shape))

  const bar = '─'.repeat(78)
  console.log(bar)
  console.log('  Recall·睿考 · 前端按钮规则门禁 L9（只读）')
  console.log('  规则来源 : §5 按钮 · 三条禁止条款')
  console.log('  复核对象 : ' + ref + '  (' + short + ')')
  console.log('  冻结表   : ' + Object.keys(BASELINE).length + ' 个文件 · 存量 ' +
    Object.values(BASELINE).reduce((s, v) => s + v[0] + v[1] + v[2], 0) + ' 处')
  console.log(bar)
  console.log('  合计实测 : 手写图标 ' + totals.icon + ' / bg-primary+非圆底 ' + totals.bgRect + ' / 非圆底 ' + totals.shape + '  = ' + (totals.icon + totals.bgRect + totals.shape))
  console.log(bar)

  const shown = rows.filter((r) => r.overSum > 0 || r.improved || (r.act.icon + r.act.bgRect + r.act.shape) > 0)
  if (shown.length === 0) {
    console.log('  所有文件均无违规。')
  } else {
    const pad = (text, width) => {
      let w = 0
      for (const ch of text) w += ch.codePointAt(0) > 0x7f ? 2 : 1
      return text + ' '.repeat(Math.max(0, width - w))
    }
    console.log('  ' + pad('文件', 46) + pad('icon', 7) + pad('bgRect', 8) + pad('shape', 7) + '判定')
    for (const row of shown) {
      const verdict = row.overSum > 0 ? '超基线 +' + row.overSum : row.improved ? '已清零' : '未超'
      console.log('  ' + pad(row.relPath.replace(/^src\//, ''), 46) +
        pad(row.act.icon + '/' + row.base[0], 7) +
        pad(row.act.bgRect + '/' + row.base[1], 8) +
        pad(row.act.shape + '/' + row.base[2], 7) + verdict)
    }
  }
  console.log(bar)

  if (overflow > 0) {
    console.log('  结果：存在 ' + overflow + ' 处超基线（新增违反 §5 的按钮）')
    console.log('  违规明细（列出超基线文件中的全部字面量违规；「新增」以判定列的 +N 为准，存量部分请对照冻结表）：')
    const overFiles = new Set(rows.filter((r) => r.overSum > 0).map((r) => r.relPath))
    for (const d of details.filter((x) => overFiles.has(x.relPath))) {
      console.log('    ' + d.relPath.replace(/^src\//, '') + ':' + d.lineNo + '  ' + DIM_NAME[d.type])
    }
    console.log('  退出码：1（本脚本不自动修复；请改用 buttonStyles.ts 常量或先裁定豁免）')
    return 1
  }
  console.log('  结果：全部 ' + Object.keys(actual).length + ' 个含有字面量按钮的文件均未超冻结表')
  console.log('  退出码：0（仅做只读校验，未修改任何源文件）')
  return 0
}

try {
  process.exitCode = main()
} catch (error) {
  console.error('  运行错误：' + error.message)
  console.error('  退出码：2（校验未能完成，不视为基线匹配）')
  process.exitCode = 2
}
