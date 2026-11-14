# 冒烟测试（Smoke Test）

轻量、分层、可执行的端到端冒烟测试，用一条命令验证核心业务链路是否健康。

## 目录结构

```
scripts/smoke/
├── lib/
│   └── smoke.mjs          # 公共库：HTTP 封装、PASS/FAIL 日志、轮询等待
├── smoke-full-flow.mjs    # 全链路冒烟：登录→提交练习→判题→积分→错题入队
└── README.md              # 本文件
```

## 覆盖链路

```
注册 → 登录 → 拉题 → 提交练习(判题) → 金币结算回查 → 错题入队(异步消费回查)
```

每条步骤遵循「操作 → 独立回查验证」原则：

- **金币结算**：提交后通过 `GET /user/coin/info/{userId}` 二次查询余额，
  与「提交前余额 + 提交返回奖励」比对，不单信提交接口的返回值。
- **错题入队**：练习完成事件经 RabbitMQ 异步投递，由 learning-engine 消费后
  更新遗忘曲线并写错题本。脚本通过轮询 `GET /exercise/error-book/{userId}`
  验证最终一致性，超时即 FAIL。

## 前置条件

| 依赖 | 说明 |
| --- | --- |
| 服务 | api-gateway(8086)、user-service(8081)、exercise-service(8082)、learning-engine-service(8083) 全部启动 |
| MySQL | user_db / exercise_db / learning_db 三库已 Flyway 迁移 |
| RabbitMQ | 需开启（`spring.rabbitmq.enabled=true`）；关闭时「错题入队」步骤会告警跳过 |

## 环境变量

| 变量 | 默认值 | 说明 |
| --- | --- | --- |
| `SMOKE_BASE_URL` | `http://localhost:8086` | 目标环境根地址（切测试环境用） |

## 运行

```bash
# 本地环境
node scripts/smoke/smoke-full-flow.mjs

# 测试环境（切目标地址）
SMOKE_BASE_URL=https://test.example.com node scripts/smoke/smoke-full-flow.mjs
```

## 日志格式

```
[PASS] 步骤名 (耗时ms)
[FAIL] 步骤名
       关键数据: {...}
[INFO] 中间关键数据
[WARN] 告警（不影响结论）
```

退出码：`0` = 全部通过，`1` = 存在失败步骤。

## 设计约束

1. **不引入第三方 npm 包**：仅用 Node.js 原生 `fetch`（Node ≥ 18）。
2. **可重复运行**：每次用随机邮箱注册新用户，避免数据冲突。
3. **异步不只看生产者**：错题入队必须轮询验证消费结果与最终落库状态。
