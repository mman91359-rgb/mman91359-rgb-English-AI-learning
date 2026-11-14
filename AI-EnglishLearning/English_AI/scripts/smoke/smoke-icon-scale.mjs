/**
 * 图标规格冒烟测试
 *
 * 为什么需要它：
 *   main.css 里的图标缺省字号规则一旦被写回基础类（或新增同特异性规则），
 *   全站 text-icon-* 会再次静默失效——图标恒 24px，页面不报错、测试不红、
 *   肉眼很难发现，只有类型检查也抓不到。这条脚本把「规格是否真的生效」变成断言。
 *
 * 断言项：
 *   A1 显式类  元素 class 上写了 text-icon-*，computed font-size 必须等于该令牌值
 *   A2 继承/兜底 尺寸类挂在祖先上（≤4 层）要生效；完全没写尺寸类的必须是 24px
 *   A3 字体    computed font-family 必须仍是 Material Symbols（丢失会退化成连字文字）
 *   A4 组件继承 .flame-glyph 必须等于最近 text-flame-* 祖先的字号；
 *             .logo-glyph 必须等于最近 text-icon-* 祖先的字号
 *            （两者靠 font-size:1em 继承，最容易被新规则的特异性打平后覆盖）
 *   A5 溢出    图标高度不得超过父容器内容盒
 *
 * 防假通过：每个路由同时校验「实际停留路径」与「最小图标数」，
 *   未登录被踢回 /login、管理员页无权限重定向、白屏，都会判失败而不是空过。
 *
 * 前置条件：
 *   1. 前端 dev server 已启动（默认 http://localhost:5173）
 *   2. api-gateway(8086) 与 user-service(8081) 已启动（用于登录换取 token）
 *   3. 账号需具备管理员权限（否则 /admin/* 会被重定向）
 *
 * 环境变量：
 *   SMOKE_WEB_URL    前端地址，默认 http://localhost:5173
 *   SMOKE_BASE_URL   网关地址，默认 http://localhost:8086
 *   SMOKE_ACCOUNT    登录账号，默认 13912345678
 *   SMOKE_PASSWORD   登录密码，默认 Recall@2026
 *   CHROME_PATH      浏览器路径（不传自动探测 Chrome / Edge）
 *
 * 运行：
 *   node scripts/smoke/smoke-icon-scale.mjs
 *
 * 退出码：0 全过，1 存在失败。
 */
import {
  request,
  unwrap,
  runStep,
  printHeader,
  printSummary,
  info,
  warn,
} from './lib/smoke.mjs';
import { launchBrowser } from './lib/browser.mjs';

const WEB_URL = (process.env.SMOKE_WEB_URL || 'http://localhost:5173').replace(/\/$/, '');
const ACCOUNT = process.env.SMOKE_ACCOUNT || '13912345678';
const PASSWORD = process.env.SMOKE_PASSWORD || 'Recall@2026';

/**
 * 路由清单。
 * minIcons 取实测值的六成左右，用途是「防白屏假通过」，不是精确快照——
 * 页面改版增删几个图标不该让它红。
 */
const ROUTES = [
  { path: '/dashboard', label: '学习首页', minIcons: 20 },
  { path: '/vocabulary', label: '词汇练习', minIcons: 15 },
  { path: '/stats', label: '学习统计', minIcons: 18 },
  { path: '/profile', label: '个人资料', minIcons: 28 },
  { path: '/error-book', label: '错题本', minIcons: 15 },
  { path: '/admin/overview', label: '管理概览', minIcons: 20 },
  { path: '/admin/users', label: '用户管理', minIcons: 90 },
  { path: '/admin/questions', label: '题目管理', minIcons: 14 },
  { path: '/admin/notices', label: '公告管理', minIcons: 14 },
  { path: '/403', label: '无权限页(3xl 空态)', minIcons: 1 },
];

/** 缺省兜底字号，对应 main.css 里 :where(.material-symbols-outlined):not(...) 的值 */
const BASE_FONT_SIZE = 24;

/** 页面内审计脚本：全部用 computed style，不读源码、不猜令牌表 */
const AUDIT = `(() => {
  const BASE_EXPECT = ${BASE_FONT_SIZE};
  const errors = [];
  const stats = { total: 0, explicit: 0, inherited: 0, fallback: 0, flame: 0, logo: 0, overflow: 0, hidden: 0 };

  // 探针：直接量「这个类在当前 CSS 下真实产生多少 px」。
  // 不硬编码 18/20/24/32/36/48，改了 tailwind 配置脚本自动跟随，不会过期。
  const probe = document.createElement('span');
  probe.setAttribute('aria-hidden', 'true');
  // 探针自己也会挂上 .material-symbols-outlined，必须能被选择器排除
  probe.setAttribute('data-icon-probe', '');
  probe.style.cssText = 'position:absolute;left:-9999px;top:0;visibility:hidden;pointer-events:none';
  document.body.appendChild(probe);

  /**
   * 裸类字号：只挂令牌类、不带 material-symbols-outlined。
   * 期望值必须从这里取——基础规则里的缺省 24px 会盖住同特异性的工具类，
   * 若探针带上基础类，量到的就是兜底值，断言会「期望=实际=24」假通过。
   */
  const rawCache = new Map();
  const pxRaw = (cls) => {
    if (rawCache.has(cls)) return rawCache.get(cls);
    probe.className = cls;
    const v = parseFloat(getComputedStyle(probe).fontSize);
    rawCache.set(cls, v);
    return v;
  };

  /** 带基础类时的字号：用于验证工具类有没有被缺省规则吃掉 */
  const iconCache = new Map();
  const pxIcon = (cls) => {
    if (iconCache.has(cls)) return iconCache.get(cls);
    probe.className = cls ? 'material-symbols-outlined ' + cls : 'material-symbols-outlined';
    const v = parseFloat(getComputedStyle(probe).fontSize);
    iconCache.set(cls, v);
    return v;
  };
  const BASE_PROBED = pxIcon('');
  const findToken = (el, prefix) => {
    const own = [...el.classList].find((c) => c.startsWith(prefix));
    if (own) return { cls: own, via: 'self' };
    let p = el.parentElement;
    for (let i = 0; i < 4 && p; i++) {
      const c = [...p.classList].find((x) => x.startsWith(prefix));
      if (c) return { cls: c, via: 'ancestor' };
      p = p.parentElement;
    }
    return null;
  };
  const describe = (el) => {
    const extra = [...el.classList].filter((c) => c !== 'material-symbols-outlined').join('.');
    const glyph = (el.textContent || '').trim().slice(0, 20);
    return (extra ? '.' + extra : '(仅基础类)') + ' ' + glyph;
  };

  // A0 预检：尺寸工具类是否被缺省规则吃掉。
  // 这正是本次踩过的坑——基础规则与 .text-icon-* 同特异性且声明在后，
  // 打平后后置者胜，全站图标恒 24px。直接比对「裸类」与「带基础类」的字号，不等即失效。
  const seenTokens = new Set();
  for (const el of document.querySelectorAll('.material-symbols-outlined')) {
    if (el.hasAttribute('data-icon-probe')) continue;
    for (const c of el.classList) if (/^text-icon-/.test(c)) seenTokens.add(c);
  }
  for (const cls of seenTokens) {
    const raw = pxRaw(cls);
    const withBase = pxIcon(cls);
    // 声明值本身就是 24px 的令牌（如 text-icon-lg）天然与兜底相等，无从区分，跳过
    if (Math.abs(raw - BASE_EXPECT) < 0.6) continue;
    if (Math.abs(raw - withBase) > 0.6) {
      errors.push({ check: 'A0-工具类被覆盖', el: cls, expect: raw, actual: withBase, token: cls });
    }
  }
  // 兜底值本身也要对：完全不带尺寸类的图标应恰好是基准字号
  if (Math.abs(BASE_PROBED - BASE_EXPECT) > 0.6) {
    errors.push({
      check: 'A0-缺省值异常',
      el: '仅 .material-symbols-outlined',
      expect: BASE_EXPECT,
      actual: BASE_PROBED,
    });
  }

  for (const el of document.querySelectorAll('.material-symbols-outlined')) {
    if (el.hasAttribute('data-icon-probe')) continue;
    const cs = getComputedStyle(el);
    if (!cs) continue;
    const fs = parseFloat(cs.fontSize);
    if (!(fs > 0)) continue;
    const hidden = cs.display === 'none';
    if (hidden) stats.hidden++;
    stats.total++;

    // A3 字体：基础类若被整条 :not() 排除，图标会失去图标字体、变成连字文字
    if (!/Material Symbols/i.test(cs.fontFamily)) {
      errors.push({ check: 'A3-字体丢失', el: describe(el), expect: 'Material Symbols', actual: cs.fontFamily.slice(0, 40) });
      continue;
    }

    // A4 火焰：令牌挂在 .flame-plume 的 text-flame-*，glyph 用 1em 继承
    if (el.classList.contains('flame-glyph')) {
      stats.flame++;
      const t = findToken(el, 'text-flame-');
      if (t) {
        const want = pxRaw(t.cls);
        if (Math.abs(fs - want) > 0.6) {
          errors.push({ check: 'A4-火焰继承', el: describe(el), expect: want, actual: fs, token: t.cls });
        }
      }
      continue;
    }

    // A4 Logo：外层 text-icon-*，glyph 用 1em 继承
    if (el.classList.contains('logo-glyph')) {
      stats.logo++;
      const t = findToken(el, 'text-icon-');
      if (t) {
        const want = pxRaw(t.cls);
        if (Math.abs(fs - want) > 0.6) {
          errors.push({ check: 'A4-Logo继承', el: describe(el), expect: want, actual: fs, token: t.cls });
        }
      }
      continue;
    }

    // A1 / A2 尺寸类
    const t = findToken(el, 'text-icon-');
    if (t) {
      stats[t.via === 'self' ? 'explicit' : 'inherited']++;
      const want = pxRaw(t.cls);
      if (Math.abs(fs - want) > 0.6) {
        errors.push({
          check: t.via === 'self' ? 'A1-显式类失效' : 'A2-祖先类失效',
          el: describe(el),
          expect: want,
          actual: fs,
          token: t.cls,
        });
      }
    } else {
      stats.fallback++;
      if (Math.abs(fs - BASE_EXPECT) > 0.6) {
        errors.push({ check: 'A2-缺省兜底失准', el: describe(el), expect: BASE_EXPECT, actual: fs });
      }
    }

    // A5 溢出：只在元素真实参与布局时检查
    if (!hidden) {
      const r = el.getBoundingClientRect();
      if (r.height > 0) {
        let p = el.parentElement;
        while (p && p !== document.body && getComputedStyle(p).display === 'inline') p = p.parentElement;
        if (p) {
          const pr = p.getBoundingClientRect();
          const pcs = getComputedStyle(p);
          const boxH = pr.height - parseFloat(pcs.paddingTop) - parseFloat(pcs.paddingBottom);
          if (r.height > boxH + 1.5 || r.width > pr.width + 1.5) {
            stats.overflow++;
            errors.push({
              check: 'A5-图标溢出',
              el: describe(el),
              expect: Math.round(boxH) + 'x' + Math.round(pr.width),
              actual: Math.round(r.height) + 'x' + Math.round(r.width),
            });
          }
        }
      }
    }
  }

  probe.remove();
  return { errors, stats, path: location.pathname };
})()`;

const results = [];

/** 登录拿 token 与用户信息（凭据错误直接终止，避免后续全部误判为页面问题） */
async function login() {
  const res = await request('POST', '/user/login', {
    body: { account: ACCOUNT, password: PASSWORD },
  });
  const data = unwrap(res, '登录');
  if (!data?.token) throw new Error('登录响应缺少 token');
  return data;
}

async function main() {
  printHeader('图标规格冒烟：text-icon-* 是否真的生效');
  info(`前端地址: ${WEB_URL}`);
  info(`登录账号: ${ACCOUNT}`);

  let browser = null;
  try {
    results.push(
      await runStep('启动无头浏览器', async () => {
        browser = await launchBrowser({ width: 1440, height: 900 });
      })
    );
    if (!browser) {
      printSummary(results);
      process.exit(1);
    }

    // ---- 登录态注入 ----
    let user = null;
    results.push(
      await runStep('登录并写入 sessionStorage', async () => {
        user = await login();
        if (!String(user.roles || '').includes('ROLE_ADMIN')) {
          warn(`账号 ${ACCOUNT} 不是管理员，/admin/* 路由将无法覆盖`);
        }
        await browser.goto(`${WEB_URL}/login`);
        await browser.evaluate(`
          sessionStorage.setItem('token', ${JSON.stringify(user.token)});
          sessionStorage.setItem('user', ${JSON.stringify(JSON.stringify(user))});
          true
        `);
        info(`登录成功 userId=${user.userId}`);
      })
    );

    // ---- 逐路由审计 ----
    for (const route of ROUTES) {
      const url = `${WEB_URL}${route.path}`;
      results.push(
        await runStep(`图标规格 · ${route.label} ${route.path}`, async () => {
          await browser.goto(url, 2200);
          const r = await browser.evaluate(AUDIT);

          // 防假通过 1：被重定向（未登录踢回 /login、无权限跳 /403）
          if (r.path !== route.path) {
            throw new Error(
              `实际停留在 ${r.path}，与目标 ${route.path} 不一致（登录态失效或无权限）`
            );
          }
          // 防假通过 2：白屏 / 渲染未完成
          if (r.stats.total < route.minIcons) {
            throw new Error(
              `仅发现 ${r.stats.total} 个图标，低于下限 ${route.minIcons}（页面可能未渲染完）`
            );
          }

          if (r.errors.length) {
            const detail = r.errors
              .slice(0, 6)
              .map((e) => `${e.check} ${e.el} 期望${e.expect} 实际${e.actual}`)
              .join(' | ');
            const more = r.errors.length > 6 ? ` …等 ${r.errors.length} 条` : '';
            throw new Error(detail + more);
          }

          info(
            `共 ${r.stats.total} 个图标：显式类 ${r.stats.explicit}、祖先继承 ${r.stats.inherited}、` +
              `缺省兜底 ${r.stats.fallback}、火焰 ${r.stats.flame}、Logo ${r.stats.logo}` +
              (r.stats.hidden ? `，其中 ${r.stats.hidden} 个隐藏` : '')
          );
        })
      );
    }
  } catch (e) {
    warn(`脚本异常终止: ${e.message}`);
    results.push(false);
  } finally {
    if (browser) await browser.close();
  }

  const code = printSummary(results);
  process.exit(code);
}

main();
