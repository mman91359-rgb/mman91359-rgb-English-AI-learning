// 后端门禁 2：Flyway 迁移文件规约
// 规则：
//   R1 文件名必须匹配 V<大>.<中>.<小>__snake_case.sql
//   R2 同模块版本号不得重复
//   R3 同模块版本号必须从 1.0.0 起连续递增（按数值，不按字典序）
//   R4 sql/ 根目录的手工脚本作为「第二变更渠道」提示（不 fail）
// 用法：node scripts/check-migrations.mjs [--verbose]
// 退出码：0 通过 / 1 违规 / 2 环境错误
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const HERE = path.dirname(fileURLToPath(import.meta.url));
const ROOT = path.resolve(HERE, '..');
const VERBOSE = process.argv.includes('--verbose');

const MODULES = ['exercise-service', 'user-service', 'learning-engine-service'];

const NAME_RE = /^V(\d+)\.(\d+)\.(\d+)__[a-z0-9_]+\.sql$/;

const violations = [];
const summary = [];

for (const mod of MODULES) {
  const dir = path.join(ROOT, mod, 'src', 'main', 'resources', 'db', 'migration');
  if (!fs.existsSync(dir)) {
    violations.push(`${mod}: 迁移目录不存在`);
    continue;
  }
  const files = fs.readdirSync(dir).filter(f => f.endsWith('.sql'));
  const parsed = [];

  for (const f of files) {
    const m = f.match(NAME_RE);
    if (!m) { violations.push(`${mod}/${f}: 命名不合规（应为 V<x>.<y>.<z>__snake_case.sql）`); continue; }
    parsed.push({ file: f, maj: +m[1], mid: +m[2], min: +m[3], ver: `${+m[1]}.${+m[2]}.${+m[3]}` });
  }

  // 重复
  const seen = new Map();
  for (const p of parsed) {
    if (seen.has(p.ver)) violations.push(`${mod}: 版本号重复 ${p.ver}（${seen.get(p.ver)} / ${p.file}）`);
    else seen.set(p.ver, p.file);
  }

  // 连续性：按数值排序后，从第一个版本开始逐项 +1（同一 大.中 段内）
  parsed.sort((a, b) => (a.maj - b.maj) || (a.mid - b.mid) || (a.min - b.min));
  for (let i = 1; i < parsed.length; i++) {
    const prev = parsed[i - 1], cur = parsed[i];
    if (cur.maj !== prev.maj || cur.mid !== prev.mid) {
      violations.push(`${mod}: 跨段跳跃 ${prev.ver} -> ${cur.ver}`);
      continue;
    }
    if (cur.min !== prev.min + 1) {
      const gap = [];
      for (let v = prev.min + 1; v < cur.min; v++) gap.push(`${prev.maj}.${prev.mid}.${v}`);
      violations.push(`${mod}: 版本号不连续，缺 ${gap.join(' / ')}（${prev.ver} -> ${cur.ver}）`);
    }
  }

  if (parsed.length > 0 && !(parsed[0].maj === 1 && parsed[0].mid === 0 && parsed[0].min === 0)) {
    violations.push(`${mod}: 起始版本应为 1.0.0，实际 ${parsed[0].ver}`);
  }

  summary.push({ mod, count: parsed.length, first: parsed[0]?.ver ?? '-', last: parsed.at(-1)?.ver ?? '-' });
}

// 第二变更渠道提示
const sqlDir = path.join(ROOT, 'sql');
let legacy = [];
if (fs.existsSync(sqlDir)) {
  legacy = fs.readdirSync(sqlDir).filter(f => f.endsWith('.sql'));
}

console.log('===== Flyway 迁移 =====');
for (const s of summary) {
  console.log(`  ${s.mod.padEnd(24)} ${String(s.count).padStart(3)} 个   ${s.first} ~ ${s.last}`);
}
const total = summary.reduce((n, s) => n + s.count, 0);
console.log(`  合计 ${total} 个`);

if (legacy.length) {
  console.log(`\n===== 提示：sql/ 根目录还有 ${legacy.length} 个手工脚本（第二变更渠道）=====`);
  if (VERBOSE) legacy.forEach(f => console.log('  ' + f));
  else console.log('  加 --verbose 看清单；这些脚本不得修改共享库结构，结构变更唯一入口是 Flyway');
}

if (violations.length === 0) {
  console.log('\n结论：迁移文件规约 0 违规');
  process.exit(0);
}

console.log(`\n结论：${violations.length} 处违规`);
violations.forEach(v => console.log('  ' + v));
process.exit(1);
