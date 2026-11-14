/**
 * 冒烟测试公共库
 *
 * 提供统一能力：
 *  1. HTTP 请求封装（fetch，自动附加 JWT、统一错误处理）
 *  2. PASS / FAIL 标准日志输出（含步骤耗时）
 *  3. 轮询等待工具（异步链路最终一致性验证）
 *  4. 环境变量读取（BASE_URL / 用户名密码等）
 *
 * 依赖：Node.js >= 18（原生 fetch），无第三方 npm 包。
 */

/** 目标环境根地址，默认走网关 8086 */
export const BASE_URL = process.env.SMOKE_BASE_URL || 'http://localhost:8086';

/** 当前运行的步骤名（用于日志上下文），由 runStep 维护 */
let currentStep = '';

const c = {
  reset: '\x1b[0m',
  red: '\x1b[31m',
  green: '\x1b[32m',
  yellow: '\x1b[33m',
  dim: '\x1b[2m',
};

/**
 * 发送 HTTP 请求。
 * @param {string} method  HTTP 方法
 * @param {string} path    路径（相对 BASE_URL，如 /user/login）
 * @param {object} [opts]  可选配置 { body, token, raw, query }
 * @returns {Promise<{status:number, body:any}>}
 */
export async function request(method, path, opts = {}) {
  const { body, token, raw = false, query } = opts;
  const headers = { 'Content-Type': 'application/json' };
  if (token) headers['Authorization'] = `Bearer ${token}`;

  let url = path.startsWith('http') ? path : `${BASE_URL}${path}`;
  if (query && typeof query === 'object') {
    const qs = Object.entries(query)
      .filter(([, v]) => v !== undefined && v !== null)
      .map(([k, v]) => `${encodeURIComponent(k)}=${encodeURIComponent(v)}`)
      .join('&');
    if (qs) url += (url.includes('?') ? '&' : '?') + qs;
  }
  const start = Date.now();

  let res;
  try {
    res = await fetch(url, {
      method,
      headers,
      body: body === undefined ? undefined : JSON.stringify(body),
    });
  } catch (e) {
    throw new Error(`请求失败（网络错误）: ${method} ${path} -> ${e.message}`);
  }

  const text = await res.text();
  const elapsed = Date.now() - start;
  let parsed = null;
  try {
    parsed = text ? JSON.parse(text) : null;
  } catch {
    parsed = text; // 非 JSON 响应，原样返回
  }

  if (raw) return { status: res.status, body: parsed, elapsed };

  return { status: res.status, body: parsed };
}

/** 解析统一响应体 { code, msg, data }，code !== 200 视为失败并抛出 */
export function unwrap(res, label) {
  const { status, body } = res;
  if (status >= 400) {
    throw new Error(`${label} HTTP ${status}: ${JSON.stringify(body)}`);
  }
  if (body && typeof body === 'object' && 'code' in body && body.code !== 200) {
    throw new Error(`${label} 业务失败 code=${body.code}: ${body.msg ?? JSON.stringify(body)}`);
  }
  return body && typeof body === 'object' && 'data' in body ? body.data : body;
}

/** 输出 PASS 行 */
export function pass(msg, elapsedMs) {
  console.log(`${c.green}[PASS]${c.reset} ${msg}${elapsedMs !== undefined ? ` ${c.dim}(${elapsedMs}ms)${c.reset}` : ''}`);
}

/** 输出 FAIL 行，并记录失败 */
export function fail(msg, detail) {
  console.error(`${c.red}[FAIL]${c.reset} ${msg}`);
  if (detail !== undefined) {
    console.error(`${c.red}       关键数据:${c.reset} ${JSON.stringify(detail)}`);
  }
}

/** 输出信息行 */
export function info(msg) {
  console.log(`${c.dim}[INFO]${c.reset} ${msg}`);
}

/** 输出警告行 */
export function warn(msg) {
  console.log(`${c.yellow}[WARN]${c.reset} ${msg}`);
}

/**
 * 执行一个测试步骤：包裹计时、异常捕获、PASS/FAIL 输出。
 * @param {string} name  步骤名
 * @param {() => Promise<void>} fn  步骤体，抛异常即 FAIL
 * @returns {Promise<boolean>} 是否通过
 */
export async function runStep(name, fn) {
  currentStep = name;
  const start = Date.now();
  try {
    await fn();
    pass(name, Date.now() - start);
    return true;
  } catch (e) {
    fail(name, e.message);
    return false;
  }
}

/**
 * 轮询等待条件成立（异步链路最终一致性验证）。
 * @param {() => Promise<boolean>} cond  返回 true 表示满足
 * @param {object} [opts]  { timeout=15000, interval=1000, desc='' }
 * @returns {Promise<void>}  超时抛异常
 */
export async function waitUntil(cond, opts = {}) {
  const { timeout = 15000, interval = 1000, desc = '条件' } = opts;
  const deadline = Date.now() + timeout;
  let last = null;
  while (Date.now() < deadline) {
    try {
      if (await cond()) return;
    } catch (e) {
      last = e;
    }
    await sleep(interval);
  }
  throw new Error(
    `等待超时（${timeout}ms）: ${desc}${last ? `，最近错误: ${last.message}` : ''}`
  );
}

/** 异步睡眠 */
export function sleep(ms) {
  return new Promise((r) => setTimeout(r, ms));
}

/** 生成随机用户名，避免重复注册冲突 */
export function randomUser(prefix = 'smoke') {
  return `${prefix}_${Date.now().toString(36)}${Math.floor(Math.random() * 1e4)}`;
}

/** 打印脚本头 */
export function printHeader(title) {
  console.log('');
  console.log(`========== ${title} ==========`);
  console.log(`${c.dim}目标环境: ${BASE_URL}${c.reset}`);
  console.log(`${c.dim}开始时间: ${new Date().toISOString()}${c.reset}`);
  console.log('');
}

/** 打印汇总结果，进程退出码：0=全过，1=存在失败 */
export function printSummary(results) {
  const total = results.length;
  const passed = results.filter(Boolean).length;
  const failed = total - passed;
  console.log('');
  console.log(`========== 结果汇总 ==========`);
  console.log(`通过: ${passed}/${total}，失败: ${failed}`);
  if (failed > 0) {
    console.log(`${c.red}冒烟测试未通过，存在 ${failed} 个失败步骤。${c.reset}`);
  } else {
    console.log(`${c.green}冒烟测试全部通过。${c.reset}`);
  }
  return failed === 0 ? 0 : 1;
}
