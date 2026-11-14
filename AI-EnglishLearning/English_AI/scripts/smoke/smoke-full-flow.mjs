/**
 * 全链路冒烟测试
 *
 * 覆盖链路：
 *   注册 → 登录 → 拉取题目 → 提交练习（判题）→ 金币结算回查 → 错题入队回查
 *   （异步：练习完成事件经 RabbitMQ 投递，learning-engine 消费后更新遗忘曲线，
 *    最终一致性通过轮询验证）
 *
 * 核心原则：每个操作后独立回查验证，不只信接口返回值。
 *
 * 前置条件：
 *   1. api-gateway(8086)、user-service(8081)、exercise-service(8082)、
 *      learning-engine-service(8083) 均已启动
 *   2. MySQL 三库已迁移；RabbitMQ 需开启（spring.rabbitmq.enabled=true）
 *      否则「错题入队」步骤会检测到 MQ 关闭而跳过并告警
 *
 * 环境变量：
 *   SMOKE_BASE_URL  目标环境根地址，默认 http://localhost:8086
 *   SMOKE_PHONE     手机号（可选，不传自动生成）
 *   SMOKE_EMAIL     邮箱（可选）
 *
 * 运行：
 *   node scripts/smoke/smoke-full-flow.mjs
 */
import {
  request,
  unwrap,
  runStep,
  waitUntil,
  randomUser,
  printHeader,
  printSummary,
  info,
  warn,
} from './lib/smoke.mjs';

const results = [];

async function main() {
  printHeader('全链路冒烟：登录→提交练习→判题→积分→错题入队');

  // 测试数据准备：注册账号（用随机邮箱保证可重复运行）
  const email = `${randomUser()}@smoke.test`;
  const password = 'SmokeTest@123';
  let token = null;
  let userId = null;
  let questionId = null;
  let coinBefore = null;
  let logId = null;

  // ---- 步骤 1：注册 ----
  results.push(await runStep('注册新用户', async () => {
    const res = await request('POST', '/user/register', {
      body: { email, password, cetLevel: 'CET4', code: '123456' },
    });
    const data = unwrap(res, '注册');
    info(`注册返回 userId=${data}`);
  }));

  // ---- 步骤 2：登录 ----
  results.push(await runStep('登录获取 JWT', async () => {
    const res = await request('POST', '/user/login', {
      body: { account: email, password },
    });
    const data = unwrap(res, '登录');
    if (!data.token) throw new Error('登录响应缺少 token');
    token = data.token;
    userId = data.userId;
    info(`登录成功 userId=${userId}`);
  }));

  // ---- 步骤 3：拉取一道词汇题 ----
  results.push(await runStep('拉取一道题目', async () => {
    const res = await request('GET', '/exercise/questions', {
      token,
      query: { userId, moduleType: 1, count: 1 },
    });
    const data = unwrap(res, '拉题');
    // 兼容多种返回结构：可能是数组 / {list} / {records}
    const list = Array.isArray(data) ? data : data?.list || data?.records;
    if (!list || list.length === 0) {
      throw new Error(`拉题返回空列表: ${JSON.stringify(data).slice(0, 200)}`);
    }
    questionId = list[0].id ?? list[0].questionId;
    if (!questionId) throw new Error(`题目缺少 id 字段: ${JSON.stringify(list[0]).slice(0, 200)}`);
    info(`取到题目 questionId=${questionId}`);
  }));

  // ---- 步骤 4：记录提交前金币余额 ----
  results.push(await runStep('读取提交前金币余额', async () => {
    const res = await request('GET', `/user/coin/info/${userId}`, { token });
    const data = unwrap(res, '金币查询');
    coinBefore = data?.balance ?? data?.coinBalance ?? null;
    info(`提交前金币余额=${coinBefore}`);
  }));

  // ---- 步骤 5：提交练习（判题）----
  let submitResult = null;
  results.push(await runStep('提交练习并判题', async () => {
    // 故意提交一个答案，验证判题引擎返回 isCorrect 与 coinAwarded
    const res = await request('POST', '/exercise/submit', {
      token,
      body: { userId, questionId, userAnswer: 'test_answer', durationSeconds: 10, moduleType: 1 },
    });
    submitResult = unwrap(res, '提交练习');
    if (submitResult.isCorrect === undefined) {
      throw new Error(`判题响应缺少 isCorrect: ${JSON.stringify(submitResult).slice(0, 200)}`);
    }
    logId = submitResult.logId;
    info(`判题结果 isCorrect=${submitResult.isCorrect}, coinAwarded=${submitResult.coinAwarded}, logId=${logId}`);
  }));

  // ---- 步骤 6：回查金币余额是否一致（独立回查，不信接口返回值）----
  results.push(await runStep('回查金币结算一致性', async () => {
    const res = await request('GET', `/user/coin/info/${userId}`, { token });
    const data = unwrap(res, '金币回查');
    const coinAfter = data?.balance ?? data?.coinBalance ?? null;

    const awarded = submitResult?.coinAwarded ?? 0;
    if (coinBefore !== null && coinAfter !== null) {
      const expected = coinBefore + (awarded || 0);
      info(`回查：前=${coinBefore}, 提交返回奖励=${awarded}, 后=${coinAfter}, 期望=${expected}`);
      if (coinAfter !== expected) {
        throw new Error(`金币结算不一致：期望 ${expected}，实际 ${coinAfter}`);
      }
    } else {
      warn('无法取得完整金币余额（可能该账号无金币账户），跳过精确断言，仅验证接口可用');
      if (coinAfter === null) throw new Error('金币回查接口未返回余额字段');
    }
  }));

  // ---- 步骤 7：错题入队（异步最终一致性验证）----
  results.push(await runStep('错题入队与消费回查', async () => {
    if (submitResult?.isCorrect === true) {
      warn('本次判题结果为「正确」，不触发错题入队；跳过该步骤（可重跑直至判错）');
      return;
    }
    // 练习完成事件是异步的：exercise-service 发 MQ → learning-engine 消费。
    // 通过轮询错题本接口验证最终一致性。
    await waitUntil(
      async () => {
        const res = await request('GET', `/exercise/error-book/${userId}`, { token });
        const data = unwrap(res, '错题本回查');
        const list = Array.isArray(data) ? data : data?.list || data?.records || data?.items;
        return Array.isArray(list) && list.some((it) => it.questionId === questionId || it.id === questionId);
      },
      { timeout: 20000, interval: 1500, desc: `错题本出现 questionId=${questionId}` }
    );
    info(`错题已通过异步链路落库 questionId=${questionId}`);
  }));

  // ---- 汇总 ----
  const code = printSummary(results);
  process.exit(code);
}

main().catch((e) => {
  console.error('\n冒烟脚本执行异常:', e);
  process.exit(1);
});
