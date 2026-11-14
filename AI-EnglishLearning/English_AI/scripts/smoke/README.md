# 冒烟测试（Smoke Test）

轻量、分层、可执行的端到端冒烟测试，用一条命令验证核心业务链路与界面规格是否健康。

## 目录结构

```
scripts/smoke/
├── lib/
│   ├── smoke.mjs          # 公共库：HTTP 封装、PASS/FAIL 日志、轮询等待
│   └── browser.mjs        # 浏览器驱动：CDP 直连无头 Chrome，读 computed style
├── smoke-full-flow.mjs    # 全链路冒烟：登录→提交练习→判题→积分→错题入队
├── smoke-icon-scale.mjs   # 图标规格冒烟：text-icon-* 是否真的生效
└── README.md              # 本文件
```

## 一、全链路冒烟（smoke-full-flow.mjs）

### 覆盖链路

```
注册 → 登录 → 拉题 → 提交练习(判题) → 金币结算回查 → 错题入队(异步消费回查)
```

每条步骤遵循「操作 → 独立回查验证」原则：

- **金币结算**：提交后通过 `GET /user/coin/info/{userId}` 二次查询余额，
  与「提交前余额 + 提交返回奖励」比对，不单信提交接口的返回值。
- **错题入队**：练习完成事件经 RabbitMQ 异步投递，由 learning-engine 消费后
  更新遗忘曲线并写错题本。脚本通过轮询 `GET /exercise/error-book/{userId}`
  验证最终一致性，超时即 FAIL。

### 前置条件

| 依赖 | 说明 |
| --- | --- |
| 服务 | api-gateway(8086)、user-service(8081)、exercise-service(8082)、learning-engine-service(8083) 全部启动 |
| MySQL | user_db / exercise_db / learning_db 三库已 Flyway 迁移 |
| RabbitMQ | 需开启（`spring.rabbitmq.enabled=true`）；关闭时「错题入队」步骤会告警跳过 |

### 运行

```bash
# 本地环境
node scripts/smoke/smoke-full-flow.mjs

# 测试环境（切目标地址）
SMOKE_BASE_URL=https://test.example.com node scripts/smoke/smoke-full-flow.mjs
```

## 二、图标规格冒烟（smoke-icon-scale.mjs）

### 解决什么问题

`main.css` 里的图标缺省字号规则，一旦被写回基础类、或新增了同特异性的规则，
全站 `text-icon-*` 会**静默失效**——图标恒 24px。页面不报错、构建不报错、
类型检查也抓不到，靠肉眼几乎发现不了（2026-11 实际发生过一次，126 处失效）。

这条脚本把「规格是否真的生效」变成断言。

### 断言项

| 编号 | 断言 | 失效含义 |
| --- | --- | --- |
| A0 | 尺寸工具类的裸类字号 == 带基础类后的字号 | 缺省规则把工具类吃掉了 |
| A1 | 元素 class 上的 `text-icon-*` == 该令牌裸类字号 | 显式尺寸类无效 |
| A2 | 祖先（≤4 层）上的尺寸类要生效；完全没写的必须 24px | 继承失效 / 兜底值被改 |
| A3 | `font-family` 仍含 Material Symbols | 基础类被整条排除，图标退化成连字文字 |
| A4 | `.flame-glyph` == 最近 `text-flame-*` 祖先字号；`.logo-glyph` == 最近 `text-icon-*` 祖先字号 | 组件靠 `font-size:1em` 继承，最易被新规则打平后覆盖 |
| A5 | 图标不超出父容器内容盒 | 尺寸生效后撑破布局 |

### 关键设计：期望值从哪来

脚本不硬编码 `18/20/24/32/36/48`，而是在页面里挂一个探针元素，
直接量「这个类在当前 CSS 下产生多少 px」。改了 `tailwind.config.js` 脚本自动跟随。

**探针必须量裸类**（只挂 `text-icon-md`，不带 `material-symbols-outlined`）。
若探针带上基础类，缺省 24px 会盖住工具类，量到的永远是 24，
断言会「期望=实际=24」**假通过**——这比没有断言更危险。

### 防假通过

每个路由同时校验两件事，避免空转通过：

- **实际停留路径**必须等于目标路由 —— 未登录被踢回 `/login`、无权限跳 `/403` 都会判失败；
- **最小图标数**（`ROUTES[].minIcons`，约为实测值的六成）—— 白屏或渲染未完成会判失败。

### 前置条件

| 依赖 | 说明 |
| --- | --- |
| 前端 | dev server 已启动（默认 `http://localhost:5173`），或用 `SMOKE_WEB_URL` 指向 preview / 测试环境 |
| 后端 | api-gateway(8086)、user-service(8081) 启动，用于登录换 token |
| 账号 | 需 **管理员** 权限，否则 `/admin/*` 会被重定向（脚本会告警但仍执行） |
| 浏览器 | 本机 Chrome 或 Edge；非默认安装路径用 `CHROME_PATH` 指定 |

### 环境变量

| 变量 | 默认值 | 说明 |
| --- | --- | --- |
| `SMOKE_WEB_URL` | `http://localhost:5173` | 前端地址 |
| `SMOKE_BASE_URL` | `http://localhost:8086` | 网关地址（登录用） |
| `SMOKE_ACCOUNT` | `13912345678` | 登录账号（需管理员） |
| `SMOKE_PASSWORD` | `Recall@2026` | 登录密码 |
| `CHROME_PATH` | 自动探测 | 浏览器可执行文件路径 |

### 运行

```bash
node scripts/smoke/smoke-icon-scale.mjs
```

输出示例：

```
[PASS] 启动无头浏览器 (742ms)
[PASS] 登录并写入 sessionStorage (863ms)
[INFO] 共 113 个图标：显式类 113、祖先继承 0、缺省兜底 0、火焰 0、Logo 0
[PASS] 图标规格 · 用户管理 /admin/users (2414ms)
...
========== 结果汇总 ==========
通过: 12/12，失败: 0
```

失败时会点名到具体元素与图标：

```
[FAIL] 图标规格 · 用户管理 /admin/users
       关键数据: "A1-显式类失效 .text-icon-md ... 期望20 实际24 | A0-工具类被覆盖 text-icon-md 期望20 实际24"
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

1. **不引入第三方 npm 包**：仅用 Node.js 原生 `fetch` 与内置 `WebSocket`（Node ≥ 22），
   直接说 CDP 协议，不装 Playwright / Puppeteer。
2. **可重复运行**：全链路冒烟每次用随机邮箱注册新用户；图标冒烟只读不写，
   登录态注入到 `sessionStorage`，不改任何业务数据。
3. **异步不只看生产者**：错题入队必须轮询验证消费结果与最终落库状态。
