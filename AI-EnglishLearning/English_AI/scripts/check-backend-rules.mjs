// 后端门禁 3：代码规约三条
// R1 带 query userId 的 Controller 方法必须调用 requireOwnership（防越权回归）
// R2 Controller 方法体不许出现 SQL 字符串（防越界查询）
// R3 全仓不许 new RestTemplate()（必须注入，便于统一配置超时/替换实现）
// 用法：node scripts/check-backend-rules.mjs [--verbose]
// 退出码：0 通过 / 1 违规 / 2 环境错误
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const HERE = path.dirname(fileURLToPath(import.meta.url));
const ROOT = path.resolve(HERE, '..');
const VERBOSE = process.argv.includes('--verbose');

const MODULES = ['ai-service', 'api-gateway', 'exercise-service', 'learning-engine-service', 'user-service', 'common'];

function walk(dir, out = []) {
  if (!fs.existsSync(dir)) return out;
  for (const e of fs.readdirSync(dir, { withFileTypes: true })) {
    const p = path.join(dir, e.name);
    if (e.isDirectory()) walk(p, out);
    else if (e.name.endsWith('.java')) out.push(p);
  }
  return out;
}

const files = [];
for (const m of MODULES) walk(path.join(ROOT, m, 'src', 'main', 'java'), files);

/** 从 start（'{' 的位置）开始做括号配对，返回方法体字符串与结束下标 */
function methodBody(src, openBrace) {
  let depth = 0;
  for (let i = openBrace; i < src.length; i++) {
    const c = src[i];
    if (c === '{') depth++;
    else if (c === '}') {
      depth--;
      if (depth === 0) return { body: src.slice(openBrace + 1, i), end: i };
    }
  }
  return { body: src.slice(openBrace + 1), end: src.length };
}

const violations = [];
const stats = { files: 0, controllers: 0, methods: 0, userIdMethods: 0, guarded: 0, sqlHits: 0, restTemplateHits: 0 };

for (const file of files) {
  const rel = path.relative(ROOT, file).replace(/\\/g, '/');
  const short = rel.split('/').pop();
  const src = fs.readFileSync(file, 'utf8');
  stats.files++;

  // R3 全仓：new RestTemplate()
  const m3 = src.match(/new\s+RestTemplate\s*\(/g);
  if (m3) {
    stats.restTemplateHits += m3.length;
    const line = src.slice(0, src.indexOf('new RestTemplate')).split('\n').length;
    violations.push({ rule: 'R3', rel: short, line, msg: `new RestTemplate() 出现 ${m3.length} 次，应改为注入` });
  }

  // @RestControllerAdvice 也含 "@RestController" 前缀，必须排除
  if (!/@RestController(?!Advice)/.test(src)) continue;
  stats.controllers++;

  const classIdx = src.search(/public\s+class\s/);
  const mapRe = /@(Get|Post|Put|Delete|Patch|Request)Mapping/g;
  let m;
  while ((m = mapRe.exec(src)) !== null) {
    if (classIdx >= 0 && m.index < classIdx) continue;
    const after = src.slice(m.index, m.index + 600);
    const sig = after.match(/\bpublic\s+[A-Za-z_$][\w$<>,.\[\]?\s]*?\s+([A-Za-z_$][\w$]*)\s*\(/);
    if (!sig) continue;
    const name = sig[1];
    stats.methods++;

    // 定位方法体的 '{'
    const sigAbsStart = m.index + sig.index;
    const braceRel = src.indexOf('{', sigAbsStart);
    if (braceRel < 0) continue;
    const { body } = methodBody(src, braceRel);
    const sigText = src.slice(sigAbsStart, braceRel);
    const lineNo = src.slice(0, m.index).split('\n').length;

    // R1：带 query userId 的方法必须调用 requireOwnership
    const hasUserIdParam = /@RequestParam[^)]*\buserId\b/.test(sigText);
    if (hasUserIdParam) {
      stats.userIdMethods++;
      if (/requireOwnership\s*\(/.test(body)) stats.guarded++;
      else violations.push({ rule: 'R1', rel: short, line: lineNo, msg: `${name}() 接收 userId 但未调用 requireOwnership` });
    }

    // R2：Controller 方法体不许出现 SQL
    const sqlHit = body.match(/\b(SELECT\s+[^;]*FROM|INSERT\s+INTO|UPDATE\s+[A-Za-z_]+\s+SET|DELETE\s+FROM)\b/);
    if (sqlHit) {
      stats.sqlHits++;
      violations.push({ rule: 'R2', rel: short, line: lineNo, msg: `${name}() 方法体出现 SQL：${sqlHit[0].slice(0, 40)}` });
    }
  }
}

console.log(`扫描 ${stats.files} 个 java，其中 @RestController ${stats.controllers} 个，接口方法 ${stats.methods} 个`);
console.log(`  R1 带 query userId 的方法 ${stats.userIdMethods} 个，其中已调 requireOwnership ${stats.userIdMethods - violations.filter(v => v.rule === 'R1').length} 个`);
console.log(`  R2 Controller 方法体 SQL 命中 ${stats.sqlHits} 处`);
console.log(`  R3 new RestTemplate() 命中 ${stats.restTemplateHits} 处`);

if (violations.length === 0) {
  console.log('\n结论：代码规约 3 条 0 违规');
  process.exit(0);
}

console.log(`\n结论：${violations.length} 处违规`);
for (const v of violations) {
  console.log(`  [${v.rule}] ${v.rel}:${v.line}  ${v.msg}`);
}
process.exit(1);
