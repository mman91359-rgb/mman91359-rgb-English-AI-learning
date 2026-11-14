/**
 * 冒烟测试 · 浏览器驱动（CDP）
 *
 * 冒烟层原本只有 fetch，看不到页面渲染结果。图标字号这类「类写了但被 CSS 覆盖」
 * 的问题只能看 computed style，因此补一个极薄的浏览器驱动。
 *
 * 约束（与《自动化测试分层规范》一致）：
 *  - 不引入第三方依赖：Node >= 22 内置 fetch 与 WebSocket，直接说 CDP 协议
 *  - 不引入测试框架：只暴露 goto / evaluate / close 三个能力
 *  - 用完即焚：独立 user-data-dir，进程退出后清理
 *
 * 环境变量：
 *   CHROME_PATH   浏览器可执行文件路径（不传则按常见位置探测）
 *
 * 用法：
 *   const browser = await launchBrowser();
 *   await browser.goto('http://localhost:5173/login');
 *   const data = await browser.evaluate('1 + 1');
 *   await browser.close();
 */

import { spawn } from 'node:child_process';
import { existsSync, rmSync } from 'node:fs';
import { tmpdir } from 'node:os';
import { join } from 'node:path';

const sleep = (ms) => new Promise((r) => setTimeout(r, ms));

/** 常见浏览器安装位置（Windows / macOS / Linux） */
const CANDIDATES = [
  'C:/Program Files/Google/Chrome/Application/chrome.exe',
  'C:/Program Files (x86)/Google/Chrome/Application/chrome.exe',
  'C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe',
  'C:/Program Files/Microsoft/Edge/Application/msedge.exe',
  '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome',
  '/usr/bin/google-chrome',
  '/usr/bin/chromium',
  '/usr/bin/chromium-browser',
];

/** 解析浏览器可执行文件路径：环境变量优先，其次探测常见位置 */
export function resolveBrowserPath() {
  const fromEnv = process.env.CHROME_PATH;
  if (fromEnv) {
    if (!existsSync(fromEnv)) {
      throw new Error(`CHROME_PATH 指向的文件不存在: ${fromEnv}`);
    }
    return fromEnv;
  }
  const hit = CANDIDATES.find((p) => existsSync(p));
  if (!hit) {
    throw new Error(
      '未找到 Chrome / Edge。请安装浏览器，或通过环境变量指定：CHROME_PATH=/path/to/chrome'
    );
  }
  return hit;
}

/** 取 CDP 目标列表里的第一个 page */
async function firstPageTarget(port, timeoutMs = 15000) {
  const deadline = Date.now() + timeoutMs;
  let lastErr = null;
  while (Date.now() < deadline) {
    try {
      const res = await fetch(`http://127.0.0.1:${port}/json/list`);
      const list = await res.json();
      const page = list.find((t) => t.type === 'page');
      if (page?.webSocketDebuggerUrl) return page.webSocketDebuggerUrl;
    } catch (e) {
      lastErr = e;
    }
    await sleep(200);
  }
  throw new Error(
    `连接浏览器调试端口失败（${port}）${lastErr ? `：${lastErr.message}` : ''}`
  );
}

/** 建立一条 CDP 连接，返回 send / close */
function connectCdp(wsUrl) {
  const ws = new WebSocket(wsUrl);
  let seq = 0;
  const pending = new Map();

  const ready = new Promise((resolve, reject) => {
    ws.addEventListener('open', () => resolve());
    ws.addEventListener('error', () => reject(new Error('CDP WebSocket 连接失败')));
  });

  ws.addEventListener('message', (ev) => {
    let msg;
    try {
      msg = JSON.parse(ev.data);
    } catch {
      return;
    }
    if (!msg.id) return;
    const task = pending.get(msg.id);
    if (!task) return;
    pending.delete(msg.id);
    if (msg.error) task.reject(new Error(`${msg.error.message} (code ${msg.error.code})`));
    else task.resolve(msg.result);
  });

  const send = (method, params = {}) =>
    new Promise((resolve, reject) => {
      const id = ++seq;
      pending.set(id, { resolve, reject });
      ws.send(JSON.stringify({ id, method, params }));
    });

  return { send, ready, close: () => ws.close() };
}

/**
 * 启动无头浏览器并连接。
 * @param {object} [opts]
 * @param {number} [opts.width=1440]      视口宽
 * @param {number} [opts.height=900]      视口高
 * @param {number} [opts.scale=1]         设备像素比
 * @returns {Promise<{goto:Function, evaluate:Function, url:Function, close:Function}>}
 */
export async function launchBrowser(opts = {}) {
  const { width = 1440, height = 900, scale = 1 } = opts;
  const exe = resolveBrowserPath();
  const profileDir = join(tmpdir(), `recall-smoke-${process.pid}-${Date.now()}`);

  // 端口从高位随机取，失败换一个重试，避免与本机其它调试实例撞车
  let chrome = null;
  let cdp = null;
  let lastErr = null;

  for (let attempt = 0; attempt < 3; attempt++) {
    const port = 9300 + Math.floor(Math.random() * 500);
    chrome = spawn(
      exe,
      [
        '--headless=new',
        '--disable-gpu',
        '--no-first-run',
        '--no-default-browser-check',
        '--disable-extensions',
        '--hide-scrollbars',
        // 本机系统代理会把 localhost 请求转走，必须绕开
        '--no-proxy-server',
        `--remote-debugging-port=${port}`,
        `--user-data-dir=${profileDir}`,
        `--window-size=${width},${height}`,
        'about:blank',
      ],
      { stdio: ['ignore', 'ignore', 'ignore'] }
    );

    try {
      const wsUrl = await firstPageTarget(port, 12000);
      cdp = connectCdp(wsUrl);
      await cdp.ready;
      await cdp.send('Page.enable');
      await cdp.send('Runtime.enable');
      await cdp.send('Emulation.setDeviceMetricsOverride', {
        width,
        height,
        deviceScaleFactor: scale,
        mobile: false,
      });
      lastErr = null;
      break;
    } catch (e) {
      lastErr = e;
      try {
        chrome.kill();
      } catch {
        /* ignore */
      }
      cdp = null;
      await sleep(300);
    }
  }

  if (!cdp) {
    try {
      rmSync(profileDir, { recursive: true, force: true });
    } catch {
      /* ignore */
    }
    throw lastErr || new Error('浏览器启动失败');
  }

  const { send } = cdp;

  const evaluate = async (expression) => {
    const r = await send('Runtime.evaluate', {
      expression,
      awaitPromise: true,
      returnByValue: true,
      userGesture: true,
    });
    if (r.exceptionDetails) {
      const desc =
        r.exceptionDetails.exception?.description || r.exceptionDetails.text || '页面脚本异常';
      throw new Error(desc.split('\n')[0].slice(0, 300));
    }
    return r.result.value;
  };

  /** 导航并等待 load 完成 */
  const goto = async (url, waitMs = 0) => {
    await send('Page.navigate', { url });
    // 等 document.readyState 完成，再给 SPA 一点渲染时间
    const deadline = Date.now() + 15000;
    while (Date.now() < deadline) {
      try {
        if ((await evaluate('document.readyState')) === 'complete') break;
      } catch {
        /* 导航中执行会抛错，忽略 */
      }
      await sleep(150);
    }
    if (waitMs > 0) await sleep(waitMs);
  };

  const currentUrl = () => evaluate('location.href');

  const close = async () => {
    try {
      cdp.close();
    } catch {
      /* ignore */
    }
    try {
      chrome.kill();
    } catch {
      /* ignore */
    }
    await sleep(200);
    try {
      rmSync(profileDir, { recursive: true, force: true });
    } catch {
      /* Windows 上进程退出后仍可能占用，残留临时目录无害 */
    }
  };

  return { goto, evaluate, url: currentUrl, close };
}
