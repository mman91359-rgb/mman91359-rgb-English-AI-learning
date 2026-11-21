#!/usr/bin/env node
/**
 * i18n 键对齐门禁（只读）
 *
 * 本项目语言包有三种形态，比对口径不同：
 *
 *  1. 嵌套对象直出（`zh-CN.ts` / `en-US.ts` / `wallet.*`）
 *     `export default { a: { b: '...' } }` → 展开成 dot-path 叶子键。
 *
 *  2. 扁平字典直出（`handoff.*`）
 *     `const messages: Record<string,string> = { 'common.all': '...' }` + `export default messages`
 *     键名本身已是 dot-path，直接当叶子。→ 需追踪 Identifier 才能拿到对象。
 *
 *  3. deepMerge 派生（`writing.*` / `admin-console.*`）
 *     `export default deepMerge(base, extra)`：
 *       base = handoff 按前缀切片后 nestMessages 而来（handoff 对齐即自动对齐，不重复比对）
 *       extra = 本文件独有的补充文案（**必须**两语一致，这才是派生成包的检查点）
 *
 * 因此：形态 1、2 做严格全量比对；形态 3 只比对 `extra` 字面量。
 * 这个口径写进 docs/前端UI契约.md §5 门禁段，避免后来者误以为派生包没被检查。
 *
 * 为什么用 TypeScript 编译器 API 而不是正则或直接 import：
 *   - 正则处理嵌套对象与引号包裹的键名不可靠（嵌套层数一多就错）
 *   - 直接 import 需要 Vue 运行环境，且值里有模板串与函数调用
 *   - AST 能在纯静态层面拿到键结构，且能识别 Identifier / deepMerge 这两种间接导出
 *
 * 用法：node scripts/check-i18n-parity.mjs [--verbose]
 * 退出码：0 = 全部对齐；1 = 存在差异；2 = 运行错误
 */

import fs from 'node:fs'
import path from 'node:path'
import ts from 'typescript'

const SCRIPT_DIR = import.meta.dirname
/** I18N_LOCALES_DIR 仅供校验脚本自身时指向副本，正常运行时一律用真实目录 */
const LOCALES_DIR = process.env.I18N_LOCALES_DIR
  ? path.resolve(process.env.I18N_LOCALES_DIR)
  : path.resolve(SCRIPT_DIR, '..', 'src', 'i18n', 'locales')

/** 把任意 AST 表达式静态求成叶子键数组；无法求值时返回 null 表示「派生，跳过」 */
function keysOfExpression(node, ctx, prefix, seen) {
  if (node === undefined) return []

  // 对象字面量
  if (ts.isObjectLiteralExpression(node)) {
    const keys = []
    for (const prop of node.properties) {
      // 简写属性 `{ adminConsole, writing }`：把外部导入的整棵子树引进来。
      // 这里不能跳过——若两语只有一边少写了这行，合并后的键树就会缺一大片，必须报出来。
      if (ts.isShorthandPropertyAssignment(prop)) {
        const name = prop.name.text
        keys.push((prefix ? prefix + '.' + name : name) + '/**')
        continue
      }
      if (!ts.isPropertyAssignment(prop)) continue
      const name = propName(prop.name)
      if (!name) continue
      const full = prefix ? prefix + '.' + name : name
      const child = keysOfExpression(prop.initializer, ctx, full, seen)
      if (child === null) {
        // 值不可静态求值（如调用表达式），但键存在，仍登记
        keys.push(full)
      } else {
        keys.push(...child)
      }
    }
    return keys
  }

  // 标识符 → 找同文件里的 const 绑定
  if (ts.isIdentifier(node)) {
    const v = lookupBinding(node.text, ctx)
    if (v === undefined) return null
    if (seen.has(node.text)) return []
    seen.add(node.text)
    return keysOfExpression(v, ctx, prefix, seen)
  }

  // deepMerge(a, b) → 两者键并集
  if (ts.isCallExpression(node) && isCallTo(node, 'deepMerge')) {
    return node.arguments.flatMap((a) => keysOfExpression(a, ctx, prefix, new Set(seen)) ?? [])
  }

  // 其他调用表达式（nestMessages / Object.fromEntries / $t 等）→ 键结构在运行期才定
  if (ts.isCallExpression(node) || ts.isConditionalExpression(node)) return null

  // 字符串 / 模板 / 数组 / 数字等 → 叶子
  if (prefix) return [prefix]
  return []
}

function propName(node) {
  if (ts.isIdentifier(node)) return node.text
  if (ts.isStringLiteral(node)) return node.text
  if (ts.isNumericLiteral(node)) return node.text
  return null
}

function isCallTo(node, name) {
  return ts.isIdentifier(node.expression) && node.expression.text === name
}

/** 在文件里找 `const <name> = <expr>` 的初始化表达式 */
function lookupBinding(name, ctx) {
  let found
  const visit = (node) => {
    if (found) return
    if (ts.isVariableDeclaration(node) && ts.isIdentifier(node.name) && node.name.text === name) {
      found = node.initializer
      return
    }
    ts.forEachChild(node, visit)
  }
  visit(ctx.sourceFile)
  return found
}

/** 解析一个语言包文件，返回 { mode, keys } 或 { mode, extra } */
function analyze(file) {
  const src = fs.readFileSync(file, 'utf8')
  const sf = ts.createSourceFile(file, src, ts.ScriptTarget.Latest, true, ts.ScriptKind.TS)
  const ctx = { sourceFile: sf }

  let exportExpr
  const findExport = (node) => {
    if (ts.isExportAssignment(node)) {
      exportExpr = node.expression
      return
    }
    ts.forEachChild(node, findExport)
  }
  findExport(sf)
  if (!exportExpr) return { mode: 'unknown', file }

  const isDerived = ts.isCallExpression(exportExpr) && isCallTo(exportExpr, 'deepMerge')
  if (isDerived) {
    // 派生包：只取 second arg（extra）
    const extraArg = exportExpr.arguments[1]
    if (!extraArg) return { mode: 'derived', extra: [] }
    const extra = keysOfExpression(extraArg, ctx, '', new Set())
    return { mode: 'derived', extra: extra ?? [] }
  }

  const keys = keysOfExpression(exportExpr, ctx, '', new Set())
  if (keys === null) return { mode: 'unknown', file }
  return { mode: 'direct', keys }
}

/** 发现成对语言包；返回 [{ group, zh, en }] */
function discoverPairs() {
  if (!fs.existsSync(LOCALES_DIR)) throw new Error('语言包目录不存在：' + LOCALES_DIR)
  const files = fs.readdirSync(LOCALES_DIR)
  const pairs = []

  if (files.includes('zh-CN.ts') && files.includes('en-US.ts')) {
    pairs.push({ group: '(主包)', zh: 'zh-CN.ts', en: 'en-US.ts' })
  }

  const zhSubs = files.filter((f) => f.endsWith('.zh-CN.ts'))
  for (const zh of zhSubs) {
    const group = zh.slice(0, -'.zh-CN.ts'.length)
    const en = group + '.en-US.ts'
    pairs.push({ group, zh, en: files.includes(en) ? en : null })
  }

  const enSubs = files.filter((f) => f.endsWith('.en-US.ts'))
  for (const en of enSubs) {
    const group = en.slice(0, -'.en-US.ts'.length)
    if (!files.includes(group + '.zh-CN.ts')) pairs.push({ group, zh: null, en })
  }

  return pairs
}

function pad(text, width) {
  let w = 0
  for (const ch of text) w += ch.codePointAt(0) > 0x7f ? 2 : 1
  return text + ' '.repeat(Math.max(0, width - w))
}

function main() {
  if (process.argv.includes('-h') || process.argv.includes('--help')) {
    console.log('用法：node scripts/check-i18n-parity.mjs [--verbose]')
    console.log('  1) 直出包（主包 / wallet / handoff）：全量账子键比对')
    console.log('  2) 派生包（writing / admin-console）：只比对 extra 补充文案')
    console.log('  --verbose 输出全部差异键；-h 显示本帮助')
    console.log('  退出码：0 = 全部对齐；1 = 存在差异；2 = 运行错误')
    return 0
  }

  const verbose = process.argv.includes('--verbose') || process.argv.includes('-v')
  const results = []
  let totalMissing = 0
  let totalExtra = 0
  let totalChecked = 0
  let totalDerived = 0

  for (const pair of discoverPairs()) {
    if (!pair.zh || !pair.en) {
      results.push({ group: pair.group, broken: true, detail: `缺少 ${pair.zh ? 'en-US' : 'zh-CN'} 对应文件` })
      totalMissing += 1
      continue
    }
    const zh = analyze(path.join(LOCALES_DIR, pair.zh))
    const en = analyze(path.join(LOCALES_DIR, pair.en))

    if (zh.mode === 'derived' || en.mode === 'derived') {
      if (zh.mode !== en.mode) {
        results.push({ group: pair.group, broken: true, detail: '两语形态不一致（一个直出、一个派生）' })
        totalMissing += 1
        continue
      }
      const zhSet = new Set(zh.extra || [])
      const enSet = new Set(en.extra || [])
      const missingInEn = (zh.extra || []).filter((k) => !enSet.has(k))
      const extraInEn = (en.extra || []).filter((k) => !zhSet.has(k))
      totalDerived += 1
      totalMissing += missingInEn.length
      totalExtra += extraInEn.length
      results.push({ group: pair.group, mode: 'derived', zhCount: (zh.extra || []).length, enCount: (en.extra || []).length, missingInEn, extraInEn })
      continue
    }

    if (zh.mode === 'unknown' || en.mode === 'unknown') {
      results.push({ group: pair.group, broken: true, detail: '导出形态无法静态解析，需人工检查' })
      totalMissing += 1
      continue
    }

    const zhKeys = zh.keys
    const enKeys = en.keys
    const enSet = new Set(enKeys)
    const zhSet = new Set(zhKeys)
    const missingInEn = zhKeys.filter((k) => !enSet.has(k))
    const extraInEn = enKeys.filter((k) => !zhSet.has(k))
    totalChecked += zhKeys.length
    totalMissing += missingInEn.length
    totalExtra += extraInEn.length
    results.push({ group: pair.group, mode: 'direct', zhCount: zhKeys.length, enCount: enKeys.length, missingInEn, extraInEn })
  }

  const bar = '─'.repeat(80)
  console.log(bar)
  console.log('  Recall·睿考 · i18n 键对齐门禁（只读）')
  console.log('  语言包目录 : ' + LOCALES_DIR)
  console.log('  比对口径   : 直出包全量叶子键；派生包只比 extra')
  console.log(bar)
  console.log('  ' + pad('语言包', 20) + pad('口径', 9) + pad('zh 键', 9) + pad('en 键', 9) + pad('缺译', 7) + pad('多余', 7) + '判定')

  for (const r of results) {
    if (r.broken) {
      console.log('  ' + pad(r.group, 20) + pad('—', 9) + pad('—', 9) + pad('—', 9) + pad('—', 7) + pad('—', 7) + r.detail)
      continue
    }
    const ok = r.missingInEn.length === 0 && r.extraInEn.length === 0
    console.log(
      '  ' + pad(r.group, 20) +
      pad(r.mode === 'derived' ? 'extra' : '全量', 9) +
      pad(String(r.zhCount), 9) +
      pad(String(r.enCount), 9) +
      pad(String(r.missingInEn.length), 7) +
      pad(String(r.extraInEn.length), 7) +
      (ok ? '一致' : '不一致'),
    )
  }
  console.log(bar)

  const failed = results.filter((r) => r.broken || (r.missingInEn && r.missingInEn.length) || (r.extraInEn && r.extraInEn.length))

  if (failed.length) {
    console.log(`  结果：直出包核对 ${totalChecked} 个键、派生包 ${totalDerived} 组；缺译 ${totalMissing} 处、多余 ${totalExtra} 处`)
    for (const r of failed) {
      if (r.broken) {
        console.log('  [' + r.group + '] ' + r.detail)
        continue
      }
      for (const section of [
        { title: `[${r.group}] zh 有 en 无（缺译）`, items: r.missingInEn },
        { title: `[${r.group}] en 有 zh 无（多余）`, items: r.extraInEn },
      ]) {
        if (!section.items.length) continue
        console.log('  ' + section.title + ' 共 ' + section.items.length + ' 处')
        const shown = verbose ? section.items : section.items.slice(0, 5)
        shown.forEach((k) => console.log('    ' + k))
        if (!verbose && section.items.length > 5) console.log('    …其余 ' + (section.items.length - 5) + ' 处用 --verbose 查看')
      }
    }
    console.log('  退出码：1（本脚本不自动补译；补齐或删除多余键后重新提交）')
    return 1
  }

  console.log(`  结果：${results.length} 对语言包全部对齐（直出包 ${totalChecked} 个键，派生包 ${totalDerived} 组 extra）`)
  console.log('  退出码：0（仅做只读校验，未修改任何语言包）')
  return 0
}

try {
  process.exitCode = main()
} catch (error) {
  console.error('  运行错误：' + error.message)
  console.error('  退出码：2（校验未能完成，不视为对齐）')
  process.exitCode = 2
}
