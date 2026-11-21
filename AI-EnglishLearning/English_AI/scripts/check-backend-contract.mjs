// 后端门禁 1：响应体一致性
// 规则：@RestController 的公开方法返回类型必须是 Result<...>；SseEmitter 走白名单；裸 Map 走豁免名单
// 用法：node scripts/check-backend-contract.mjs [--verbose]
// 退出码：0 通过 / 1 违规 / 2 环境错误
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const HERE = path.dirname(fileURLToPath(import.meta.url));
const ROOT = path.resolve(HERE, '..');
const VERBOSE = process.argv.includes('--verbose');

const MODULES = ['ai-service', 'api-gateway', 'exercise-service', 'learning-engine-service', 'user-service'];

// SSE 流式：协议要求，无法包装
const SSE_ALLOWED = new Set(['chat', 'score']);

// 服务间内部接口：契约以字段为准，包装会让 4 个调用点静默回落
const MAP_EXEMPT = new Set(['judgeFeedback', 'judgeAcceptable', 'translateScore']);

function walk(dir, out = []) {
  if (!fs.existsSync(dir)) return out;
  for (const e of fs.readdirSync(dir, { withFileTypes: true })) {
    const p = path.join(dir, e.name);
    if (e.isDirectory()) walk(p, out);
    else if (e.name.endsWith('Controller.java')) out.push(p);
  }
  return out;
}

const files = [];
for (const m of MODULES) walk(path.join(ROOT, m, 'src', 'main', 'java'), files);

const violations = [];
const stats = { files: 0, methods: 0, result: 0, sse: 0, exempt: 0 };

for (const file of files) {
  const rel = path.relative(ROOT, file).replace(/\\/g, '/');
  const src = fs.readFileSync(file, 'utf8');
  if (!/@RestController/.test(src)) continue;
  stats.files++;

  // 类级 @RequestMapping 会先被匹配到，它后面紧跟的 public 是 class 而非方法
  const classIdx = src.search(/public\s+class\s/);

  // 找所有 mapping 注解，在其后 600 字符内取方法签名
  const re = /@(Get|Post|Put|Delete|Patch|Request)Mapping/g;
  let m;
  while ((m = re.exec(src)) !== null) {
    if (classIdx >= 0 && m.index < classIdx) continue;
    const after = src.slice(m.index, m.index + 600);
    const sig = after.match(/\bpublic\s+([A-Za-z_$][\w$<>,.\[\]?\s]*?)\s+([A-Za-z_$][\w$]*)\s*\(/);
    if (!sig) continue;
    const rawType = sig[1].replace(/\s+/g, ' ').trim();
    const name = sig[2];
    stats.methods++;

    // 剥掉注解残留与修饰符
    const type = rawType.replace(/^@\w+(\([^)]*\))?\s*/, '').trim();
    const base = type.replace(/<.*$/, '').trim();

    if (base === 'Result') { stats.result++; continue; }
    if (base === 'SseEmitter' && SSE_ALLOWED.has(name)) { stats.sse++; continue; }
    if (base === 'Map' && MAP_EXEMPT.has(name)) { stats.exempt++; continue; }

    violations.push({ rel: rel.split('/').pop(), name, type, line: src.slice(0, m.index).split('\n').length });
  }
}

console.log(`扫描 ${stats.files} 个 @RestController，${stats.methods} 个接口方法`);
console.log(`  Result<T>      ${stats.result}`);
console.log(`  SseEmitter(豁免) ${stats.sse}`);
console.log(`  裸 Map(豁免)     ${stats.exempt}`);

if (violations.length === 0) {
  console.log('\n结论：响应体一致，0 违规');
  process.exit(0);
}

console.log(`\n结论：${violations.length} 处违规`);
for (const v of violations) {
  console.log(`  ${v.rel}:${v.line}  ${v.name}() -> ${v.type}`);
}
if (!VERBOSE) console.log('\n（加 --verbose 看完整签名）');
process.exit(1);
