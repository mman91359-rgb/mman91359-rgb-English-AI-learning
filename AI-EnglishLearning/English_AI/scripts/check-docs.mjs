// scripts/check-docs.mjs —— 文档治理门禁（只读，不自动修复）
//
// 用法：
//   node scripts/check-docs.mjs            正常检查
//   node scripts/check-docs.mjs --verbose  打印每个被检查的文件
//   node scripts/check-docs.mjs --help
//
// 退出码：0 全部通过 / 1 有检查失败 / 2 参数错误
//
// 设计原则：
//   1. 只读。发现问题是报告，不是替你改。
//   2. 每条规则都必须机器可判定 —— 判不了的规则不写进门禁，写进 AGENTS.md 让人看。
//   3. 失败信息必须给出「文件 + 行号 + 怎么改」，否则等于没报。

import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const ROOT = path.resolve(__dirname, '..');                 // 主工程 English_AI/
const GIT_ROOT = path.resolve(ROOT, '..', '..');            // git 根 D:\AI-EnglishLearning
const DOCS = path.join(ROOT, 'docs');

const VERBOSE = process.argv.includes('--verbose');
if (process.argv.includes('--help')) {
  console.log(`文档治理门禁（check-docs）

用法：
  node scripts/check-docs.mjs [--verbose]

检查项：
  1. docs/ 顶层与 review/ 下的 .md 必须有 front-matter，且 status 在枚举内
  2. docs/ 顶层不得出现 status: deprecated（历史文档应移入 docs/history/）
  3. docs/ 顶层文件名不得带日期（现状基线白名单除外）
  4. 所有 .md 里引用的 .md 文件必须真实存在
  5. CLAUDE.md 必须是指针版：行数 < 100，且不得含「## 技术栈」章节
  6. 仓库内不得出现第二份平行指令文件

退出码：0 通过 / 1 失败 / 2 参数错误`);
  process.exit(0);
}

const C = {
  reset: '\x1b[0m', gray: '\x1b[90m', green: '\x1b[32m',
  red: '\x1b[31m', yellow: '\x1b[33m', bold: '\x1b[1m',
};

const STATUS_ENUM = ['active', 'draft', 'deprecated', 'superseded'];

// 免于 front-matter 强制要求的目录（历史归档、外部协作产物）
const FM_EXEMPT_DIRS = ['history', 'Workbuddy', 'pending-migrations'];
// 仍要检查 front-matter 的子目录（这些是我们自己维护的）
const FM_ENFORCED_SUBDIRS = ['review'];

// 顶层允许带日期的文件：现状基线，不是历史报告
const DATED_WHITELIST = ['2026-11-07-数据库结构与真题导入基线.md'];

// 规则 4 豁免：docs/history/ 记录的是「当时的路径」，不追存在性
const REF_SKIP_DIRS = ['history'];
// 规则 4 豁免前缀：平台文件举例（可能不存在）、题库数据文件（不是文档）
const REF_SKIP_PREFIXES = ['.github/', '.cursor/', 'CET4/', 'CET6/'];
// 规则 4 豁免精确名：外部协作产物引用
const REF_SKIP_EXACT = new Set(['growth-retention.md']);

const failures = [];
function fail(rule, file, line, msg) {
  failures.push({ rule, file, line, msg });
}

function rel(p) {
  return path.relative(ROOT, p).replace(/\\/g, '/');
}

function readLines(p) {
  return fs.readFileSync(p, 'utf8').split(/\r?\n/);
}

/** 递归收集 .md（跳过 node_modules / .git） */
function walk(dir, out = []) {
  if (!fs.existsSync(dir)) return out;
  for (const ent of fs.readdirSync(dir, { withFileTypes: true })) {
    if (ent.name === 'node_modules' || ent.name === '.git') continue;
    const full = path.join(dir, ent.name);
    if (ent.isDirectory()) walk(full, out);
    else if (ent.name.toLowerCase().endsWith('.md')) out.push(full);
  }
  return out;
}

/** 解析 front-matter 块，返回 { status, line } 或 null */
function parseFrontMatter(lines) {
  if (lines[0]?.trim() !== '---') return null;
  let end = -1;
  for (let i = 1; i < lines.length; i++) {
    if (lines[i].trim() === '---') { end = i; break; }
  }
  if (end === -1) return null;
  const body = lines.slice(1, end);
  const statusLine = body.findIndex((l) => /^\s*status\s*:/.test(l));
  const status = statusLine >= 0
    ? body[statusLine].split(':')[1]?.trim().replace(/^["']|["']$/g, '')
    : undefined;
  return { status, statusLineNo: statusLine >= 0 ? statusLine + 2 : undefined };
}

// ─────────────────────────────────────────────────────────────
// 规则 1：front-matter 与 status 枚举
// ─────────────────────────────────────────────────────────────
function rule1() {
  const targets = [];
  // docs/ 顶层
  for (const ent of fs.readdirSync(DOCS, { withFileTypes: true })) {
    if (ent.isFile() && ent.name.toLowerCase().endsWith('.md')) targets.push(path.join(DOCS, ent.name));
    if (ent.isDirectory() && FM_ENFORCED_SUBDIRS.includes(ent.name)) {
      for (const f of walk(path.join(DOCS, ent.name))) targets.push(f);
    }
  }

  let ok = 0;
  for (const f of targets) {
    const lines = readLines(f);
    const fm = parseFrontMatter(lines);
    if (!fm) {
      fail('R1', f, 1, '缺少 front-matter（首行应为 --- ，并含 status:）');
      continue;
    }
    if (!fm.status) {
      fail('R1', f, 1, 'front-matter 缺少 status 字段');
      continue;
    }
    if (!STATUS_ENUM.includes(fm.status)) {
      fail('R1', f, fm.statusLineNo, `status「${fm.status}」不在枚举内（${STATUS_ENUM.join(' / ')}）`);
      continue;
    }
    ok++;
    if (VERBOSE) console.log(`    ${C.gray}✓ ${rel(f)} → ${fm.status}${C.reset}`);
  }
  return { name: 'docs/ 顶层与 review/ 的 front-matter 与 status', total: targets.length, ok };
}

// ─────────────────────────────────────────────────────────────
// 规则 2：顶层不得有 deprecated
// ─────────────────────────────────────────────────────────────
function rule2() {
  let ok = 0, total = 0;
  for (const ent of fs.readdirSync(DOCS, { withFileTypes: true })) {
    if (!ent.isFile() || !ent.name.toLowerCase().endsWith('.md')) continue;
    total++;
    const fm = parseFrontMatter(readLines(path.join(DOCS, ent.name)));
    if (fm?.status === 'deprecated') {
      fail('R2', path.join(DOCS, ent.name), fm.statusLineNo,
        '顶层不允许 status: deprecated —— 已废弃文档应移入 docs/history/');
    } else ok++;
  }
  return { name: 'docs/ 顶层无 deprecated 文档', total, ok };
}

// ─────────────────────────────────────────────────────────────
// 规则 3：顶层文件名不带日期
// ─────────────────────────────────────────────────────────────
function rule3() {
  let ok = 0, total = 0;
  const DATE_RE = /^\d{4}-\d{2}-\d{2}-/;
  for (const ent of fs.readdirSync(DOCS, { withFileTypes: true })) {
    if (!ent.isFile() || !ent.name.toLowerCase().endsWith('.md')) continue;
    total++;
    if (DATE_RE.test(ent.name) && !DATED_WHITELIST.includes(ent.name)) {
      fail('R3', path.join(DOCS, ent.name), 1,
        '文件名带日期 —— 历史报告应移入 docs/history/；确属现状基线的请加入脚本白名单并写明理由');
    } else ok++;
  }
  return { name: 'docs/ 顶层文件名无日期', total, ok };
}

// ─────────────────────────────────────────────────────────────
// 规则 4：.md 交叉引用必须存在
// ─────────────────────────────────────────────────────────────
function rule4() {
  const files = walk(DOCS);
  // 主工程根的指令文件也纳入（它们也引用 docs）
  files.push(path.join(ROOT, 'AGENTS.md'));
  if (fs.existsSync(path.join(ROOT, 'CLAUDE.md'))) files.push(path.join(ROOT, 'CLAUDE.md'));

  let ok = 0, total = 0;
  const REF_RE = /`([^`\n]+?\.md)`/g;

  for (const f of files) {
    if (f.split(path.sep).some((seg) => REF_SKIP_DIRS.includes(seg))) continue;
    const lines = readLines(f);
    lines.forEach((line, idx) => {
      let m;
      REF_RE.lastIndex = 0;
      while ((m = REF_RE.exec(line)) !== null) {
        const ref = m[1].trim();
        if (/^https?:|^mailto:|^#/.test(ref)) continue;   // 外链、锚点跳过
        if (REF_SKIP_PREFIXES.some((p) => ref.startsWith(p))) continue;
        if (REF_SKIP_EXACT.has(ref)) continue;
        total++;
        const cands = [
          path.resolve(path.dirname(f), ref),
          path.resolve(DOCS, ref),
          path.resolve(ROOT, ref),
          path.resolve(ROOT, '..', ref),        // 主工程上一级（known/ 所在层）
          path.resolve(GIT_ROOT, ref),
          path.resolve(GIT_ROOT, 'AI-EnglishLearning', ref),
        ];
        if (cands.some((p) => fs.existsSync(p))) { ok++; continue; }
        fail('R4', f, idx + 1, `引用的文件不存在：\`${ref}\`（已试 当前目录 / docs/ / 主工程根 / git 根）`);
      }
    });
  }
  return { name: '.md 交叉引用全部可解析', total, ok };
}

// ─────────────────────────────────────────────────────────────
// 规则 5：CLAUDE.md 必须是指针版（防规则回流）
// ─────────────────────────────────────────────────────────────
function rule5() {
  const p = path.join(ROOT, 'CLAUDE.md');
  if (!fs.existsSync(p)) return { name: 'CLAUDE.md 指针版', total: 1, ok: 0, skipped: 'CLAUDE.md 不存在（非 Claude Code 环境可跳过）' };
  const lines = readLines(p);
  let ok = 1;
  if (lines.length >= 100) {
    fail('R5', p, 1, `CLAUDE.md 已膨胀到 ${lines.length} 行（上限 100）—— 规则正文应写进 AGENTS.md，本文件只放指针与平台独有约束`);
    ok = 0;
  }
  lines.forEach((line, idx) => {
    if (/^##\s+.*技术栈/.test(line)) {
      fail('R5', p, idx + 1, 'CLAUDE.md 里出现「技术栈」章节 —— 规则正文回流了，应在 AGENTS.md');
      ok = 0;
    }
  });
  return { name: 'CLAUDE.md 是指针版（<100 行且无技术栈章节）', total: 1, ok };
}

// ─────────────────────────────────────────────────────────────
// 规则 6：不得出现第二份平行指令文件
// ─────────────────────────────────────────────────────────────
function rule6() {
  const FORBIDDEN = [
    '.cursorrules', '.windsurfrules',
    '.cursor/rules', '.github/copilot-instructions.md',
    'docs/AGENTS.md', 'docs/CLAUDE.md',
    'frontend/AGENTS.md', 'frontend/CLAUDE.md',
    'AI-EnglishLearning/AGENTS.md',
  ];
  let ok = 0, total = FORBIDDEN.length;
  for (const relPath of FORBIDDEN) {
    const p = path.join(ROOT, relPath);
    if (fs.existsSync(p)) {
      fail('R6', p, 1, '发现平行指令文件 —— 所有规则只能写在根 AGENTS.md，平台文件只做指针');
    } else ok++;
  }
  if (!fs.existsSync(path.join(ROOT, 'AGENTS.md'))) {
    fail('R6', path.join(ROOT, 'AGENTS.md'), 1, '根 AGENTS.md 不存在 —— 唯一基线缺失');
  }
  return { name: '无第二份平行指令文件', total, ok };
}

// ─────────────────────────────────────────────────────────────
// 执行
// ─────────────────────────────────────────────────────────────
console.log(`\n${C.bold}文档治理门禁 check-docs${C.reset}  ${C.gray}${new Date().toISOString().slice(0, 10)}${C.reset}`);
console.log(C.gray + '─'.repeat(64) + C.reset);

const results = [rule1(), rule2(), rule3(), rule4(), rule5(), rule6()];
results.forEach((r, i) => {
  const bad = failures.filter((f) => f.rule === `R${i + 1}`).length;
  const pass = bad === 0;
  const label = `${i + 1}/6 ${r.name}`;
  const stat = r.total ? `${r.ok}/${r.total}` : '-';
  const dots = '.'.repeat(Math.max(2, 46 - label.length - stat.length));
  console.log(
    `${pass ? C.green + 'PASS' + C.reset : C.red + 'FAIL' + C.reset}  ${label} ${C.gray}${dots} ${stat}${C.reset}`
  );
  if (r.skipped) console.log(`      ${C.yellow}跳过：${r.skipped}${C.reset}`);
});

if (failures.length) {
  console.log(`\n${C.red}${C.bold}问题清单（${failures.length} 条）${C.reset}`);
  const byRule = {};
  for (const f of failures) (byRule[f.rule] ??= []).push(f);
  for (const [rule, list] of Object.entries(byRule)) {
    console.log(`\n${C.yellow}${rule}${C.reset}`);
    for (const f of list) {
      console.log(`  ${rel(f.file)}:${f.line}`);
      console.log(`    ${f.msg}`);
    }
  }
}

console.log(C.gray + '─'.repeat(64) + C.reset);
if (failures.length) {
  console.log(`${C.red}${C.bold}结果: ${results.filter((r, i) => failures.some((f) => f.rule === `R${i + 1}`)).length}/6 项未通过，共 ${failures.length} 个问题${C.reset}\n`);
  process.exit(1);
}
console.log(`${C.green}${C.bold}结果: 6/6 全部通过${C.reset}\n`);
process.exit(0);
