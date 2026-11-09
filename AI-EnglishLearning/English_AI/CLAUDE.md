```
# CLAUDE.md
> 本文档是 Claude Code 操作本仓库的唯一事实基线，所有代码修改、方案输出均以本文档为准，禁止自行脑补未提及的架构与依赖。

## ⚠️ 本文件是仓库唯一指令基线

- **唯一路径**：`AI-EnglishLearning/English_AI/CLAUDE.md`（git 根为 `D:\AI-EnglishLearning`，主项目在 `AI-EnglishLearning/English_AI`）
- 禁止在仓库根、子模块、`docs/`、`frontend/` 下新建 `CLAUDE.md` / `AGENTS.md` / `.cursorrules` / `.windsurfrules` 等平行指令文件
- 需要补充说明时：追加到本文件对应章节；长文档写入 `docs/`，并在"仓库文件地图"登记
- 发现其他位置的平行指令文件，视为噪声，直接删除并在本文件记录
- 从仓库根启动的工具，请在启动参数里指定 `AI-EnglishLearning/English_AI` 为项目目录，不要为此在根目录再生成一份 CLAUDE.md

## 🔴 联网 Search / Fetch 成本约束（DeepSeek API 计费，最高优先级）
> 背景：DeepSeek Search/Fetch 网页搜索、抓取接口独立计费：**每1000次成功请求 5 元**，自北京时间 2026-11-01 00:00 起收费；本项目使用 DeepSeek 作为 Claude Code 后端，**自动联网会产生额外扣费**。
> 核心原则：**默认禁止自动联网，优先复用本地仓库、文档、历史上下文，非必要绝不调用 Search / Fetch**

1. ✅ 仅允许联网的场景（同时满足下面两条才可以发起搜索/抓取）
    - 场景：查阅官方原版文档（SpringBoot / Vue3 / MySQL / Flyway / M3 等）、时效性极强的官方变更公告、用户**明确主动要求检索网页**（如：帮我打开这个url、搜索最新版本特性）
    - 前置自检：先检索本仓库全部代码、docs文档、上下文记录，确认本地没有可用信息
2. ❌ 绝对禁止自动联网的场景（高频踩坑点）
    - 基础语法、Java/Vue 通用常识、简单单词释义、通用编程知识点
    - 方案构思、重构思路、学习资料整理、作文模板、考点梳理、非阻塞性质的讨论
    - 为了“答案更完美”、补充参考资料而主动搜索
    - 批量、连续多次抓取网页，单次任务联网请求尽量控制 ≤2次
3. 联网前置确认流程（强制）
    确认本地无信息后，必须先向用户提示：
    > 需要调用 DeepSeek Search/Fetch 联网查询，会产生额外接口计费，是否确认执行？
    用户回复【确认】，才执行联网；用户拒绝，停止联网，基于已有信息输出，并标注：`【信息未联网核验，如需最新官方内容，请手动发起检索】`
4. 兜底规则
    不影响开发主流程、非阻塞的需求，一律放弃联网；不编造信息，主动标注信息局限。

## 项目概述
Recall·睿考 —— 四六级英语学习系统，前后端分离架构。
- 后端：Maven 多模块 Spring Boot 微服务，Spring Cloud Gateway 做静态路由
- 前端：Vue 3 + Vite SPA，电脑端优先，Material Design 3 设计语言
- 交互语言、代码注释、业务文案统一使用中文
- 当前阶段：基础功能已跑通，正在开发听力/翻译/写作模块

## 技术栈与版本锁定（禁止擅自新增）
### 后端
- JDK 17
- Spring Boot 3.2.0
- Spring Cloud 2023.0.3
- Spring Cloud Gateway（WebFlux）
- MyBatis-Plus 3.5.5
- JJWT 0.12.3（HS256）
- Spring Security Crypto（BCrypt，work factor 10；存量 `$2b$12$` 在登录成功后自动重编码）
- 服务间调用：RestTemplate 直连（无 OpenFeign）
- 消息队列：RabbitMQ（默认关闭，`spring.rabbitmq.enabled=false`）
- AI 接入：阿里云百炼 DashScope，原生 HTTP 调用（无官方SDK），兼容 OpenAI 格式
- ❗ 明确未启用：Nacos 服务发现（仅 yml 有配置，无依赖，未生效）、Redis、Sentinel、Seata、Spring AI

### 前端
- Vue 3.5 + TypeScript（`<script setup>` 组合式）
- Vite 8
- Vue Router 5
- Pinia 3
- Tailwind CSS 3.4 + Material Design 3 设计令牌
- Material Symbols Outlined 图标
- ECharts 6
- Axios
- vue-i18n 10
- ❗ 明确约定：Element Plus 仅保留依赖，禁止在页面中直接使用 `el-*` 组件，全站 UI 统一用 Tailwind + M3 自研组件

### 数据库
- MySQL 8.0
- 三库拆分：`user_db` / `exercise_db` / `learning_db`

## 工程结构与入口文件
### 后端根目录 `English_AI/`（Maven 多模块）
```

English_AI/
├── pom.xml                          # 父 POM，统一版本管理
├── common/                          # 公共工具包（无启动端口）
│   └── src/main/java/...            # Result 统一响应、JwtUtil、PasswordUtil
├── api-gateway/                     # 端口 8086 | 网关
│   └── src/main/
│       ├── java/...GatewayApplication.java  # 启动类
│       └── resources/application.yml        # 配置文件：路由、JWT、CORS
├── user-service/                    # 端口 8081 | 对应 user_db
│   └── src/main/
│       ├── java/...UserServiceApplication.java
│       └── resources/application.yml
├── exercise-service/                # 端口 8082 | 对应 exercise_db
│   └── src/main/
│       ├── java/...ExerciseServiceApplication.java
│       └── resources/application.yml
├── learning-engine-service/         # 端口 8083 | 对应 learning_db
│   └── src/main/
│       ├── java/...LearningEngineServiceApplication.java
│       └── resources/application.yml
├── ai-service/                      # 端口 8084 | 无数据库
│   └── src/main/
│       ├── java/...AiServiceApplication.java
│       └── resources/application.yml
└── sql/                             # 数据库脚本
├── user_db.sql/exercise_db.sql/learning_db.sql   # 正式三库建表脚本
└── init/01 - 基础建表.sql                             # 遗留旧脚本，已废弃，禁止使用

```

### 前端目录 `frontend/`
```

frontend/
├── index.html                       # 页面入口
├── package.json/vite.config.ts    # 依赖与构建配置
├── tailwind.config.*                # M3 设计令牌配置，新页面必须复用语义类名
└── src/
├── main.ts                      # 应用入口：挂载 Pinia、Router、i18n
├── App.vue                      # 根组件
├── api/                         # 唯一数据出口，Axios 封装，分模块
├── router/                      # 路由 + 守卫
├── stores/                      # Pinia 状态管理
├── components/                  # 公共组件（AppLayout、AiSidebar 等）
├── views/                       # 页面视图
├── styles/                      # Tailwind 入口 + 全局样式
└── i18n/                        # 国际化

```

## 仓库文件地图（给 AI 的快速索引）

> 按"要改什么 → 先读什么"排序。找不到入口时先看本表，不要靠猜或重新生成文档。

### 后端模块与关键类

| 模块 | 职责 | 改之前先看 |
|---|---|---|
| `common/` | 公共契约 | `ModuleType.java`（module_type/question_type/雷达维度唯一事实来源）、`RadarDimension.java`、`PasswordUtil.java`、`JwtUtil.java`、`Result.java`、`ErrorCode.java` |
| `user-service/` | 账户、金币、签到、偏好、ELO、雷达 | `service/impl/UserServiceImpl.java`（注册/登录）、`UserAbilityRadarServiceImpl.java`（ELO 与维度更新）、`config/AdminAuthInterceptor.java`、`config/InternalAuthInterceptor.java` |
| `exercise-service/` | 题库、选题、判题、错题本、词库 | `service/impl/ExerciseServiceImpl.java`（`selectQuestions` 选题 / `submitAnswer` 判题 / `getDailyWord` 每日一词）、`judgment/`（三级判题）、`util/ChoiceAnswerUtil.java` |
| `learning-engine-service/` | 遗忘曲线、每日复习 | `service/`（`update-curve` 消费）、`db/migration/V1.0.0__init_learning_db.sql` |
| `ai-service/` | 大模型调用（唯一出口） | `service/AiService.java`、`controller/AiController.java`；业务模块禁止直连大模型 |
| `api-gateway/` | 统一入口、JWT 校验、路由 | `filter/JwtAuthFilter.java`（白名单与 `X-User-Id` 透传）、`application.yml`（路由与 CORS） |

### `docs/` 文档清单

| 文件 | 内容 |
|---|---|
| `数据库迁移规范.md` | Flyway 命名/执行/回滚规范 + 历次迁移记录（改库前必读） |
| `2026-11-07-数据库结构与真题导入基线.md` | 三库实际结构、题库/词库现状、导入方案、登录性能诊断 |
| `听力资源导入规范.md` | `scripts/import-listening.mjs` 的 manifest 与目录约定 |
| `作文模块UI设计契约.md` / `作文模块UI生成提示词.md` | 写作模块页面契约 |
| `管理员端API契约.md` / `管理员端UI设计契约.md` / `管理员端UI设计契约V2.md` | 管理端接口与视觉契约 |
| `Recall睿考_后端项目开发文档V3.md` / `Recall睿考_前端项目开发文档V3.md` | 整体架构与模块说明 |
| `后续开发任务书（Backlog）.md` | 待办优先级 |
| `2026-11-01-新增功能报告.md` / `2026-11-02-账号与找回密码说明.md` | 历史变更说明 |
| `pending-migrations/` | 导入脚本生成的待审迁移 SQL（README 说明流程） |
| `Workbuddy/` / `frontend-handoff/` | 外部协作产物，未纳入版本库约定 |

### `scripts/`

| 脚本 | 用途 |
|---|---|
| `flyway.sh` | **唯一迁移入口**：`<module> <baseline\|migrate\|info\|validate\|repair>`；空库会拒绝 baseline |
| `backup-schema.sh` | 迁移前结构备份（输出到 `sql/backup/`，已 gitignore） |
| `with-env.sh` | 注入 `.env` 后启动服务；**user-service 与 api-gateway 必须用它启动**，否则 JWT_SECRET 不一致会全站 401 |
| `import-listening.mjs` | 听力导入范式：`check` / `build` → 生成 Flyway SQL 到 `docs/pending-migrations/` |
| `import-words.mjs` | 词库导入：读 `6.26.sql` 的 `book_word`（只认 CET4=7 / CET6=8）→ 生成 `word_dictionary` 迁移 |
| `generate-vocab-questions.mjs` | 词汇填空题生成器：导出 `buildForms` / `categoryOf` / `inflect`；含不可数名词、CVC 双写、敏感过滤规则 |
| `patch-accepted-top200.mjs` | accepted 定点/批量补丁：`--top` / `--only-keys` / `--keys-file` / `--dry-run` → 生成纯 UPDATE 迁移 |
| `audit-accepted-coverage.mjs` | accepted 覆盖度**只读**巡检：`--out` 出报告、`--json-out` 出机器可读缺口清单、`--db` 指定库 |
| `clean-buggy-paths.mjs` | 错因表**只读**扫描 + 生成清洗迁移（只处理首尾标点/全角/多余空白等结构性脏数据） |
| `check-answer-slots.mjs` | 答案槽位**只读**校验：伪形态/词性/搭配/重复，输出 CSV 到 `docs/review/`；见 `docs/review/README.md` |
| `mvn.sh` / `mvn.cmd` | 自动挑选 JDK 17+ 后调用 Maven（bash / Windows 批处理两版） |

### 前端关键目录

`api/`（唯一数据出口）→ `stores/`（Pinia）→ `views/`（页面）→ `components/`（公共组件）；`config/modules.ts` 是 module_type 的前端映射，必须与 `common/ModuleType.java` 同步；`i18n/locales/` 管文案。

### 数据库入口

三库归属见"数据库约定"；**结构变更唯一入口是各模块 `src/main/resources/db/migration/`**。`sql/` 下历史脚本仅参考，`sql/init/` 已废弃。

### 仓库外素材（已 gitignore，不入库）

`英语资源/`（词库 dump、真题 PDF、听力音频）、`日志/`（开发日志 docx）、`设计方案/`、`页面/`（静态原型）、`参考图片/`、`init/`、`wordtml-main/`、`.workbuddy/`。

## 启动与构建命令
### 后端（仓库根目录执行）
```bash
# 安装公共依赖并全量构建（跳过测试）
scripts/mvn.sh -DskipTests install

# 构建单个模块及其依赖
scripts/mvn.sh -pl exercise-service -am clean package -DskipTests

# 跑单测
scripts/mvn.sh -pl exercise-service -am test

# 启动单个服务（必须通过 with-env 注入 .env）
scripts/with-env.sh scripts/mvn.sh -pl user-service spring-boot:run
```

> **JAVA_HOME 必须指向 JDK 17+**：本机默认 `JAVA_HOME` 是 JRE 8（`C:\Program Files\Java\jre1.8.0_152`），
> 直接跑 `mvn` 会报 `class file version 61.0 … up to 52.0`。
> `scripts/mvn.sh` 会自动挑选可用的 JDK（优先当前 `JAVA_HOME`，其次 jdk-21 / jdk-17），
> 新开终端统一使用它。IDE 的 Run/Debug 配置需自行把 Project SDK 与 Maven Runner JRE 设为 JDK 17+。

- 本地开发启动顺序：`user-service(8081)` → `exercise-service(8082)` → `learning-engine-service(8083)` → `ai-service(8084)` → `api-gateway(8086)`
- **user-service 与 api-gateway 必须都通过 `scripts/with-env.sh` 启动**：前者签发 JWT，后者校验 JWT。两者 `JWT_SECRET` 不一致时，登录接口会成功，但所有受保护接口返回 401，前端会立即清登录态跳回 `/login`。不要混用 IDEA 直接 Run 与脚本启动。
- 当前无单元测试，`src/test` 目录为空
- 本地开发默认无需启动 RabbitMQ

### 前端（`frontend/` 目录执行）

```
# 安装依赖
npm install

# 本地开发启动（端口 5173，代理 /api 到 8086）
npm run dev

# 类型检查
npm run type-check

# 生产构建
npm run build
```

## 编码与命名规范

### 后端通用编码规范

1. 模块职责严格边界：用户逻辑 → user-service；题库答题 → exercise-service；记忆复习 → learning-engine；大模型调用 → ai-service；鉴权路由 → 网关
2. 接口统一返回 `Result<T>` 包装，格式：`{code, message, data}`
3. 实体类、数据库字段遵循下划线转驼峰，MyBatis-Plus 全局配置生效
4. 新增接口默认需要鉴权，白名单仅 `/user/login`、`/user/register`
5. 服务间调用通过 RestTemplate，地址从配置文件读取，支持环境变量覆盖
6. AI 调用统一走 ai-service，禁止业务模块直接调用大模型
7. 密码一律 BCrypt 加密存储，永不明文

### 前端通用编码规范

1. 页面放 `views/`，公共组件放 `components/`，API 调用收敛在 `api/*.ts`，禁止页面内裸写 axios
2. 样式统一使用 Tailwind M3 语义类名，禁止写死 hex 色值、硬编码字号
3. 图标统一使用 Material Symbols Outlined，禁止引入 Element Plus 图标
4. 所有接口出入参定义 TS 类型，与后端 DTO 对齐，禁止使用 `any`
5. AI 流式交互统一复用 `AiSidebar` 组件的 SSE 渲染逻辑，不重复造轮子
6. 用户 ID 从 Pinia userStore 获取，禁止页面手动传 userId

### 命名风格约定

表格

| 场景 | 规则 | 示例 |
| --- | --- | --- |
| Java 类名 | 大驼峰（PascalCase） | `UserController`、`EssayScoreService` |
| Java 方法 / 变量 | 小驼峰（camelCase） | `getUserById`、`eloScore` |
| Java 常量 | 全大写下划线分隔 | `DEFAULT_K_FACTOR` |
| 数据库表 / 字段 | 小写下划线分隔 | `user_ability_radar`、`next_review_time` |
| 前端组件 | 大驼峰 | `AiSidebar.vue`、`QuestionCard.vue` |
| 前端变量 / 方法 | 小驼峰 | `handleSubmit`、`userInfo` |
| 前端普通文件 | 短横线分隔 | `user-api.ts`、`stats-view.vue` |

## 核心业务约定（禁止擅自修改核心逻辑）

1. **判题引擎（六层顺序，前置命中即短路）**：accepted_answers/正确答案精确匹配 → `question_buggy_path` 错因拦截 → L1 规则（拼写/语法）→ L2 相似度模糊 → L2.5 AI 语义判对 → L3 AI 启发反馈；`accepted_answers` 非空时 L2 未命中直接返回 `MISMATCH`，**禁止调用 AI**；填空类用户答案与 `correct_answer` 均经 `AnswerNormalizer` 归一化。策略模式扩展新题型，不改原有 Handler
2. **ELO 定级算法**：初始分 1000，定级 K=40，常规答题按难度分档，更新用户能力雷达
3. **艾宾浩斯记忆曲线**：掌握度 1-5 级，间隔 1/3/7/15/30 天，答对升级答错降级
4. **智能选题**：按用户 ELO 匹配难度区间，去重近 7 天已做题，优先低使用量题目
5. **鉴权链路**：网关校验 JWT → 透传 `X-User-Id` 头 → 下游服务信任该头
6. **AI 出题闭环**：生成 → 待审核表 → 管理员审核通过 → 入正式题库

## 数据库约定

1. 数据库结构以各服务 `src/main/resources/db/migration/` 下的 Flyway 迁移为准；`sql/` 下历史脚本仅作参考，`sql/init/` 已废弃，禁止执行和修改
2. 禁止修改已应用的 Flyway 迁移文件；表结构变更必须新增 `V1.0.x__描述.sql` 迁移
3. 逻辑删除全局使用 `is_deleted` 字段，MyBatis-Plus 自动处理
4. 题目分表设计：`question_info` 存元数据，`question_content` 存正文重字段，列表查询只查轻量表

## 数据库迁移（Flyway）

1. 数据库结构变更唯一入口是 Flyway：在对应模块 `src/main/resources/db/migration/` 新增 `V1.0.x__描述.sql`
2. 每次迁移必须先向用户展示：迁移文件、目标库、完整 SQL、风险等级、回滚方式；获得明确批准后才能执行
3. 执行顺序：`scripts/backup-schema.sh` → `scripts/flyway.sh <module> migrate` → `scripts/flyway.sh <module> validate` → 报告 `flyway_schema_history`
4. 禁止：`flyway clean`、`DROP TABLE`、清空数据、修改已应用迁移、用 Navicat 直接改共享库结构
5. 详细流程与回滚规范见 `docs/数据库迁移规范.md`

## 🔴 严格禁止行为（优先级最高）

1. 禁止自动新增任何 Maven 依赖或 npm 包，如需引入必须先向用户确认
2. 禁止修改 `sql/` 目录下已发布的数据库建表 / 迁移脚本，结构变更只能新增增量脚本
3. 禁止自行启用 Nacos、Redis、OpenFeign、Sentinel 等未在技术栈内的中间件
4. 禁止在前端页面中直接使用 Element Plus 的 `el-*` 组件
5. 禁止擅自修改 ELO 算法、遗忘曲线、判题引擎等核心业务逻辑
6. 禁止在配置文件中硬编码 API Key、密钥等敏感信息，必须使用环境变量
7. 禁止绕过 Flyway 用 Navicat/手工 SQL 改共享库结构；禁止 `flyway clean`、`DROP TABLE`、清空数据；每次迁移必须先预览并获批准
8. 禁止在仓库其他位置生成 CLAUDE.md / AGENTS.md / .cursorrules / .windsurfrules 等平行指令文件（详见文首"唯一指令基线"）

## Git 提交规范

- 提交信息格式：`类型(模块): 中文描述`
- 类型约定：
  - `feat`：新增功能
  - `fix`：修复 bug
  - `refactor`：代码重构
  - `docs`：文档变更
  - `chore`：工程配置、依赖升级等杂项
- 示例：`feat(exercise): 新增听力题目CRUD接口`、`fix(web): 修复路由守卫重定向死循环`

## Git 提交约束
- 严格遵守项目 `.gitignore` 规则，**禁止提交**：docx、pdf、excel、ppt 等文档、日志文件夹、听力音频资源、sql备份文件、外部独立项目目录（cet-word-keeper-main、wordhtml-main）、本地 .env 密钥文件。
- 只提交业务源码、配置模板、说明文档，版权音频、本地素材、临时文档一律不纳入Git。
- 做代码改动、准备commit前，先确认没有误选中被忽略的资源。

## AI 输出与协作约定

1. 所有代码注释、说明文字统一使用中文
2. 修改代码时优先遵循现有代码风格，不擅自重构无关代码
3. **多文件修改前，必须先列出修改计划与涉及文件，确认后再执行**
4. **执行代码修改前，自动执行 git commit 保存快照，提交信息清晰描述改动内容**
5. 涉及核心逻辑变更时，主动说明影响范围和风险点
6. 遇到不确定的设计决策，优先向用户确认，不自行拍板

## AI 协作工作流（默认遵守）
### 1. 问题推演规则
遇到以下场景时，禁止直接给出最终代码/答案，必须先完成推演再输出结论：
- 不明原因的报错、偶发 Bug、性能问题排查
- 技术方案选型、架构设计、模块拆分
- 涉及事务、并发、核心算法的逻辑设计
- 开发优先级、复用能力梳理等决策类问题

推演要求：至少列出 3 种可行思路，对比各自优劣、风险、适配性，说明放弃其他方案的原因，最后给出推荐结论。

### 2. 功能开发流程
新增功能、模块级重构、涉及表结构变更的开发任务，严格按以下顺序执行：
1. 先向我提问澄清需求，覆盖业务边界、输入输出、异常场景、约束条件，确认理解度达到 95% 再输出方案
2. 输出设计方案（文件列表、接口定义、数据结构）
3. 切换为资深技术顾问身份，自我复审方案，指出隐患、边界遗漏、性能风险并修正
4. 方案确认无误后，再开始编写代码

---

## 变更记录（2026-10-24）

### 本次修改文件

**SQL**
- `sql/09-user-preference-daily-goals.sql`（新增）

**user-service**
- `entity/UserPreference.java`
- `dto/PreferenceResponse.java`
- `dto/UpdateVocabularyGoalsRequest.java`（新增）
- `service/UserPreferenceService.java`
- `service/impl/UserPreferenceServiceImpl.java`
- `controller/PreferenceController.java`
- `src/test/.../service/UserPreferenceServiceImplTest.java`

**exercise-service**
- `dto/SubmitRequest.java`
- `dto/QuestionVO.java`
- `dto/UserExerciseStats.java`
- `service/ExerciseService.java`
- `service/impl/ExerciseServiceImpl.java`
- `controller/ExerciseController.java`
- `util/EbbinghausUtil.java`
- `util/VocabularyLearningHelper.java`（新增）
- `util/StudyDurationAggregator.java`
- `src/test/.../util/VocabularyLearningHelperTest.java`（新增）
- `src/test/.../util/StudyDurationAggregatorTest.java`

**frontend**
- `src/components/SideNavBar.vue`
- `src/components/VocabularyGoalDialog.vue`（新增）
- `src/components/WordReviewDialog.vue`（新增）
- `src/views/LearningView.vue`
- `src/views/HomeView.vue`
- `src/views/VocabQuizView.vue`
- `src/views/StatsView.vue`
- `src/views/ProfileView.vue`
- `src/stores/user.ts`
- `src/api/user.ts`
- `src/api/exercise.ts`
- `src/i18n/locales/zh-CN.ts`
- `src/i18n/locales/en-US.ts`

### 实现功能

1. 登录后左侧导航复用登录/注册页的 hover、位移、图标缩放与激活指示条过渡。
2. 词汇每日目标拆为“每日新背单词 + 每日复习单词”，保存到 user-service 偏好；新增覆盖式目标弹窗，紫色卡片不再内联编辑或直接开始练习。
3. 词汇练习改为“先复习到期词 → 新词循环”：复习翻卡/填空交替并调用 `reviewWord`；新词组内打乱顺序，连续答对 3 次才加入单词本（掌握度 0、次日复习）；新词尝试以 `practiceOnly=true` 只判题，不写日志/ELO/金币。
4. 新增新词选题接口，自动排除单词本已有单词；新增今日新学/复习计数并在首页展示双目标进度。
5. 删除“连续学习天数”统计与展示，侧栏、首页、统计、个人中心统一使用 `checkInStreak`（连续签到天数）。
6. 统计页学习时间图改为滚动最近 7 天（含今天）的每日分钟柱状图，附日期标签与 7 天平均值。

### 验证结果

- `mvn -DskipTests install`：7/7 模块 BUILD SUCCESS。
- `mvn -pl user-service,exercise-service -am test`：43 个用例全部通过，通过率 100%（user-service 23、exercise-service 20，Failures/Errors/Skipped 均为 0）。
- `npm run build`：vue-tsc 类型检查与 Vite 构建通过（仅保留原有 chunk 体积警告）。
- 未连接真实 MySQL 做端到端联调。

### 遗留风险 / 待办

1. 必须执行 `sql/07`、`sql/08`、`sql/09`（按顺序）；未执行 09 时偏好接口会报列不存在。
2. 新词循环按用户确认采用“只判题不打分”，因此不写 `user_exercise_log`、不更新 ELO、不触发词汇组金币。
3. 复习填空依赖单词例句；没有例句或例句不含目标词时自动回退翻卡。
4. 新词选题会排除单词本已有词，但未掌握就退出的词可能在下一次会话重新出现；当前会话进度存于 `sessionStorage`。
5. 仍未扩展艾宾浩斯间隔，继续使用现有 1/2/4/7/15/30 天。
6. 两套复习数据源仍并存：单词本复习走 `reviewWord`/`user_vocabulary`，learning-engine 的 `/learning/review-tasks` 未改。
7. 首页旧 `dailyTarget_vocab` localStorage 已不再读取；`vocabGroupSize` 仅保留给金币组，当前没有编辑入口。
8. 前端暂无单元测试框架，未新增 Vitest 等依赖；前端回归依赖类型检查、构建和手工 E2E。
9. `QuestionGenerateService` 的 unchecked 编译警告为既有问题，本次未处理。

### 后续开发建议

1. 给新词加入单词本时补充 `example` / `exampleTranslation`，让题库学到的词也能参与复习填空模式。
2. 如需“学会单词发金币”，单独设计 `VOCAB_WORD` 奖励与幂等键，不要复用当前练习尝试。
3. 评估将学习会话统计迁移到 learning-engine，统一“学习域”数据归属。
4. 清理旧 `dailyTarget_vocab` 前端逻辑与不再使用的 `vocabGroupSize` 相关 UI/文案。
5. 若允许引入前端测试依赖，优先补词汇目标弹窗、复习队列和新词连续答对循环的组件测试。
6. 增加跨会话的新词去重策略（按单词本或练习记录），避免未掌握词反复出现。

---

## 变更记录（2026-10-31）

### 本次修改文件

**common**
- `EnvGuard.java`（新增）：prod profile 下校验 JWT/DB/AI/内部 token 环境变量。
- `UserIdentityUtil.java`（迁入）：网关透传 `X-User-Id` 与请求 userId 一致性校验。
- `ErrorCode.java`、`BusinessException.java`（新增）：统一错误码与业务异常。
- `Result.java`：增加 `error(ErrorCode)`、`success(data, message)`。

**user-service**
- `UserApplication.java`、`config/InternalAuthInterceptor.java`（新增）、`config/WebMvcConfig.java`
- `controller/CoinController.java`、`PreferenceController.java`、`InternalController.java`、`UserController.java`
- `service/impl/CoinServiceImpl.java`
- `dto/UpdateVocabularyGoalsRequest.java`、`UpdateVocabGroupSizeRequest.java`、`CheckInRequest.java`、`AwardCoinRequest.java`
- `handler/GlobalExceptionHandler.java`（新增）
- `pom.xml`、`src/main/resources/application.yml`
- 测试：`CoinServiceImplTest`、`UserIdentityUtilTest`（新增）、`GlobalExceptionHandlerTest`（新增）、`VocabularyGoalsValidationTest`（新增）

**exercise-service**
- `ExerciseApplication.java`、`config/RestTemplateConfig.java`
- `controller/ExerciseController.java`、`StudySessionController.java`
- `service/impl/ExerciseServiceImpl.java`
- `dto/SubmitRequest.java`、`AddVocabularyRequest.java`、`AddFavoriteRequest.java`、`ReviewResultRequest.java`、`StudySessionReportRequest.java`
- `handler/GlobalExceptionHandler.java`（新增）
- `pom.xml`、`src/main/resources/application.yml`

**learning-engine-service**
- `LearningApplication.java`、`config/RestTemplateConfig.java`
- `handler/MyMetaObjectHandler.java`（新增）

**ai-service / api-gateway**
- `AiApplication.java`、`application.yml`
- `ApiGatewayApplication.java`、`application.yml`

**frontend**
- `components/ui/BaseDialog.vue`、`LoadingState.vue`、`EmptyState.vue`、`ErrorState.vue`（新增）
- `components/VocabularyGoalDialog.vue`、`WordReviewDialog.vue`：改用 BaseDialog；shuffle/日期格式化复用工具类。
- `config/modules.ts`、`utils/array.ts`、`utils/format.ts`（新增）
- `api/request.ts`：HTTP 401 清理登录态；错误信息读取 `response.data.message`。
- `api/user.ts`：删除重复的 `getUserInfo`/`getRadarData`。
- `views/HomeView.vue`、`StatsView.vue`、`LearningView.vue`、`ProfileView.vue`：去掉重复首屏加载。
- `views/VocabularyView.vue`、`HistoryView.vue`、`FavoritesView.vue`：接入 Loading/Empty/Error。
- `views/ErrorBookView.vue`、`PracticeView.vue`、`GrammarQuizView.vue`、`VocabQuizView.vue`：复用模块映射/shuffle。
- `components/CoinBadge.vue`、`views/ProfileView.vue`、`views/StatsView.vue`：复用数字格式化。

**部署配置**
- `docker-compose.yml`、`.env.example`：增加 `APP_CORS_ALLOWED_ORIGINS`、`INTERNAL_TOKEN`、`SPRING_PROFILES_ACTIVE=prod`。

### 实现功能

1. 生产环境启动校验：prod profile 缺少 `JWT_SECRET`、`MYSQL_PASSWORD`、`DASHSCOPE_API_KEY`、`INTERNAL_TOKEN` 时拒绝启动；AI Key 不再有明文默认值；网关 CORS 收敛为环境变量配置。
2. 统一错误契约：`ErrorCode` + `BusinessException` + user/exercise 本地 `GlobalExceptionHandler`；业务异常、参数错误、未知异常分别返回标准 HTTP 状态与 `Result` body。
3. 参数校验：user-service/exercise-service 引入 `spring-boot-starter-validation`，核心 DTO 增加 `@NotNull/@NotBlank/@Min/@Max`，Controller 加 `@Valid`。
4. 数据一致性：金币流水并发重复键在 `CoinService.award()` 内按幂等返回；答题日志与错题本本地写放入事务，金币/ELO/learning/MQ 移到事务提交后。
5. 身份与内部接口：`UserIdentityUtil` 迁入 common；高风险写接口补 `X-User-Id` 校验并抛 403；`/internal/**` 增加 `X-Internal-Token` 拦截器。
6. 稳定性：exercise/learning 的 RestTemplate 设置 connect 2s/read 10s；learning 补 `MyMetaObjectHandler`，`createdAt/updatedAt` 自动填充恢复。
7. 前端复用：`BaseDialog`、`Loading/Empty/Error`、模块映射、日期/数字格式化、shuffle 统一；HTTP 401 统一清登录态；4 个页面去掉重复首屏请求。

### 验证结果

- `mvn -pl user-service,exercise-service -am test`：55 个用例全部通过，通过率 100%（user-service 35、exercise-service 20，Failures/Errors/Skipped 均为 0）。
- `mvn -DskipTests install`：7/7 模块 BUILD SUCCESS。
- `npm run build`：`vue-tsc` 类型检查 + Vite 构建通过，仅保留既有 chunk 体积警告。
- 手工验证：非法每日目标返回 HTTP 400；`X-User-Id` 不匹配的签到请求返回 HTTP 403；`/internal/user/preference/1` 无 token 返回 401、带 token 返回 200；网关 CORS 预检返回 `Access-Control-Allow-Origin: http://localhost:5173`。
- 未启动完整前端做浏览器 E2E；未连接真实 MySQL 做完整业务联调。

### 遗留风险 / 待办

1. 读接口 IDOR 未全量修复：`ExerciseController` 多数读接口、`UserController` 读接口、learning/ai 接口仍信任请求参数中的 userId。
2. `/internal/**` 需要生产设置 `INTERNAL_TOKEN`；本地默认 token 仅用于开发。
3. 生产必须设置 `SPRING_PROFILES_ACTIVE=prod`，否则启动校验不会触发；还需要在阿里云侧轮换已暴露过的 AI Key。
4. 网关 CORS 当前按单值 `APP_CORS_ALLOWED_ORIGINS` 配置；多来源部署需确认 Spring 列表解析方式。
5. `SubmitRequest.userAnswer` 已加 `@NotBlank`；若未来有允许空答案的题型，需要单独放宽。
6. 两套遗忘曲线、两套 7 天统计口径仍并存；本轮未合并。
7. `awardedGroupCache` 仍是 JVM 内存缓存，多实例/重启时依赖数据库唯一键兜底。
8. 前端仍无单元测试框架；`BaseDialog` 的焦点陷阱、电脑端交互需浏览器验收。
9. `QuestionGenerateService` 的 unchecked 编译警告为既有问题，本次未处理。

### 后续开发建议

1. 下一轮补读接口 IDOR 统一校验，优先 `/exercise/stats`、`/exercise/history`、`/user/info`、`/user/radar`。
2. 若前端交互频繁，再评估 `useAsyncState`、`ProgressBar`、`StatTile`，不要一次性全站重构。
3. 等出现第二个分页页再抽 `PageResult`/分页拦截器；等出现第三个 servlet 服务再评估 `common-web`。
4. 新增金币奖励类型时再抽 `BizKeyFactory`；新增复习入口时再评估 `VocabularyReviewPolicy`。
5. 部署前补一次真实 MySQL 端到端联调和浏览器 E2E。

---

## 变更记录（2026-11-01）

### 本次修改文件

**frontend**
- `tailwind.config.js`、`src/assets/main.css`：新增 `info` 蓝色令牌；浅色 `warning` 提亮为 `#B45309`；补充字号/间距/动画。
- `src/views/LearningView.vue`：词汇/语法入口统一为 8/4 彩色 hero；删除语法入口硬编码色与 green/cyan 原生色；修正 `?tab=grammar` 首次深链的每日目标初始化。
- `src/i18n/locales/zh-CN.ts`、`en-US.ts`：补充 `vocabEntryDesc`、`vocabStart`、`grammarEntryDesc`、`grammarStart`；入口收藏文案改为“我的收藏”。
- `src/i18n/locales/admin-console.zh-CN.ts`、`admin-console.en-US.ts`：补齐 `nav.backToLearning`。
- `vite.config.ts`、`vite.config.js`：dev 代理在 `/api` 请求进入代理前重写 `Origin` 为 `http://localhost:5173`，修复非 5173 端口登录 403。
- 管理员端 7 页与写作 Mock 模块文件：详见 `docs/2026-11-01-新增功能报告.md`。

### 实现功能

1. 管理员端 7 页：概览、用户、用户详情、题目审核、通知、活动、操作日志；接真实 `/admin/**` 接口，侧栏分组导航，P1 不再占位。
2. 写作 Mock 模块：`/writing` 重定向学习中心 Tab；`/writing/practice`、`/writing/report`、`/writing/history`；30 分钟倒计时、10 秒自动保存、草稿恢复、四步评分、五维报告、逐句批改、历史趋势；`WritingScoringService` 可替换，当前仅 localStorage。
3. 学习中心入口视觉统一：五个入口统一 8/4；主色为紫/蓝/青/绿/琥珀；语法新增 `info` 蓝色令牌。
4. 本地 403 修复：根因是网关 CORS 只放行 5173 + 被跟踪的旧 `vite.config.js` 遮蔽 `.ts`；通过 dev 代理 Origin 重写解决。

### 验证结果

- `npm run type-check`、`npm run build` 通过（仅保留既有 chunk 体积警告）。
- 浏览器 UI 登录：`listen_e2e_1793508633` → `/dashboard`；`admin_e2e` → `/admin/overview`。
- 代理登录 `POST /api/user/login` 返回 200 + token。
- 管理员 7 页真实数据正常；写作提交报告 `13/15`、`92.3/106.5`，历史与趋势正常。
- 五个入口主色、8/4 比例、375/768 无溢出、亮/暗色均验证通过。

### 遗留风险 / 待办

1. 管理员写操作未在共享库做完整写入回归，上线前建议在测试库执行一轮。
2. 写作为预览模式：评分是确定性 mock，草稿/历史只写 localStorage。
3. 前端仍无单元测试；写作 AI 问答为占位。
4. `vite.config.js` 由 `vue-tsc` 生成且被 git 跟踪，必须与 `vite.config.ts` 同步；建议后续把 `tsconfig.node` 的 `outDir` 移出根目录并清理生成物。
5. `origin` remote URL 内嵌 GitHub PAT，建议改用凭据管理器/SSH 并轮换；本次未修改 remote。
6. 远端 `refactor/reuse-baseline` 与本地分叉；本次推送到新分支 `feature/admin-writing-ui-20261101`，未覆盖旧分支。

---

## 变更记录（2026-11-02）

### 本次修改文件

**user-service**
- `controller/AdminUserController.java`：新增 `PUT /admin/users/{id}/password`。
- `dto/admin/SetUserPasswordRequest.java`（新增）。
- `service/AdminUserService.java`、`impl/AdminUserServiceImpl.java`：新增 `setPassword`，BCrypt 入库，审计 `USER_PASSWORD_SET`。
- `controller/ForgotPasswordController.java`（新增）：`POST /user/forgot-password/reset`。
- `dto/ForgotPasswordRequest.java`（新增）。
- `service/PasswordResetService.java`（新增）：固定模拟验证码 `123456`，prod profile 拒绝，按手机号唯一匹配并改密。
- `src/test/.../AdminUserServiceImplTest.java`、`PasswordResetServiceTest.java`。

**api-gateway**
- `filter/JwtAuthFilter.java`：白名单增加 `/user/forgot-password`。

**frontend**
- `api/admin.ts`、`components/admin/UserActionDialog.vue`、`userActionTypes.ts`、`views/admin/AdminUsersView.vue`、`AdminUserDetailView.vue`：新增“设置新密码”入口与弹窗，保留随机重置。
- `views/ForgotPasswordView.vue`（新增）、`router/index.ts`、`LoginView.vue`、`api/user.ts`、`api/request.ts`、`i18n/locales/zh-CN.ts`、`en-US.ts`：手机号找回密码页面与接口。
- `i18n/locales/admin-console.zh-CN.ts`、`admin-console.en-US.ts`：管理员设密文案。

**文档**
- `docs/管理员端API契约.md`：补充管理员设密与找回密码接口。
- `docs/2026-11-02-账号与找回密码说明.md`（新增）。

### 实现功能

1. 本地创建简单管理员 `admin / 123456`（通过注册 + 角色提升；不写 Flyway 弱口令种子）。
2. 管理员可为用户直接设置指定新密码；原随机重置接口与 UI 保留。
3. 登录页新增“忘记密码”：手机号 + 固定模拟验证码 `123456` + 新密码，真实更新后端密码；仅非 prod profile 可用。
4. 网关白名单、前端 401 豁免、i18n 与 API 契约同步更新。

### 验证结果

- `mvn -pl user-service -am test`：59 个用例通过。
- `mvn -pl user-service,api-gateway -am package -DskipTests`：BUILD SUCCESS。
- `npm run type-check`、`npm run build`：通过。
- API：`admin/123456` 登录返回 `ROLE_ADMIN`；管理员设密后新密码可登录；手机号 `13912345678` + `123456` 找回密码后新密码可登录。
- 浏览器：管理员“设置新密码”弹窗、`/forgot-password` 发送验证码倒计时与提交跳转正常。

### 遗留风险 / 待办

1. `admin/123456` 与固定验证码 `123456` 均为本地弱凭据；生产 profile 已拒绝模拟找回，管理员账号不得写入 Flyway 或生产库。
2. 手机号 `sys_user.phone` 非唯一；找回密码要求恰好一个启用账号，否则 400/409。
3. 管理员设密不会使旧 JWT 立即失效；如需强制下线，需增加 token 版本/密码修改时间校验。
4. 真实短信流程后续需新增验证码表/Redis、频率限制、单次消费与风控；当前不引入新依赖。
5. 未新增前端单元测试；本轮依赖后端单测、type-check、build 与浏览器冒烟。

---

## 变更记录（2026-11-08）

> 主题：**登录标识改造 —— 手机号/邮箱登录，username 降级为可空昵称**。
> 本变更改动了鉴权链路与 `sys_user` 表结构，属「核心功能」，已与用户逐项确认后落地。后续 AI/开发者务必先读本节，避免误以为「用户名仍是登录标识」。

### 一、核心契约变化（最重要，先记住）

| 项 | 旧（改造前） | 新（改造后） |
|---|---|---|
| 登录标识 | `username`（唯一，NOT NULL） | `phone` **或** `email`（至少一个非空，各自唯一） |
| `username` 字段 | 登录账号，唯一 | **降级为昵称**：可空、可重复、限 20 字符，空时自动生成 `用户{4位随机}` |
| JWT `username` claim | 存登录账号 | **存昵称**（仅展示），身份唯一靠 `sub`(userId) |
| 网关透传 `X-Username` | 登录账号 | 昵称（仅展示），鉴权仍以 `X-User-Id` 为准 |
| 管理员登录 | `username=admin` | 占位邮箱 `admin@recall.local`（见下方「管理员登录说明」） |

### 二、本次修改文件

**Flyway（已执行，见「迁移执行结果」）**
- `user-service/src/main/resources/db/migration/V1.0.3__add_email_phone_login.sql`（新增）

**user-service**
- `entity/SysUser.java`：新增 `email` 字段；`username` 注释改为昵称语义
- `dto/LoginRequest.java`：`username` → `account`（手机号/邮箱）
- `dto/RegisterRequest.java`：新增 `email`、`nickname`（可空）
- `dto/LoginResponse.java`：新增 `email`
- `service/UserService.java`、`impl/UserServiceImpl.java`：新增 `getByAccount`；`register`/`login` 重写；新增昵称自动生成
- `controller/UserController.java`：注册/登录校验重写（手机号+邮箱至少一个非空、昵称限长 20）
- `config/AdminBootstrapRunner.java`：管理员引导改占位邮箱 `admin@recall.local`
- `config/AdminAuthInterceptor.java`：审计 operatorName 优先昵称
- `service/impl/AdminUserServiceImpl.java`：列表搜索 keyword 增加 email 维度

**frontend**
- `views/LoginView.vue`：登录标识改「手机号/邮箱」
- `views/RegisterView.vue`：新增邮箱、用户名改可选昵称
- `api/user.ts`：`LoginRequest.account`、`RegisterRequest.email/nickname`、`LoginResponse.email`
- `i18n/locales/zh-CN.ts`、`en-US.ts`：新增 `accountPlaceholder`/`accountEmpty`/`email`/`nicknamePlaceholder`

### 三、迁移执行结果（V1.0.3）

- 执行顺序：`backup-schema.sh`（三库 schema 备份至 `sql/backup/20261108_181018_*`）→ 存量检查（`phone` 无重复、`email` 字段不存在）→ `flyway.sh user-service migrate` → `validate`。
- `flyway_schema_history`：installed_rank=4，version=1.0.3，type=SQL，success=1。
- 表结构最终态（已验证）：`email varchar(255) NULL UNI`；`username varchar(50) NULL`（`uk_username` 已删）；`uk_phone`/`uk_email` 唯一索引已建。

### 四、关键配置与注意事项

1. **登录接口契约**：`POST /user/login` body 由 `{username, password}` 改为 `{account, password}`；`account` 填手机号或邮箱。前端与后端已同步，**任何旧调用方（脚本/其他客户端）需同步更新**。
2. **注册接口契约**：`POST /user/register` 的 `username` 字段已废弃，改为 `nickname`（可空）+ `phone`/`email`（至少一个非空）。旧「用户名注册」逻辑不存在了。
3. **JWT 语义**：`JwtUtil.generate(userId, nickname, roles)` 第二参现在传昵称而非账号；网关 `JwtAuthFilter` 透传的 `X-Username` 是昵称，**鉴权/身份判断一律以 `sub`(userId) 为准，不得用 username 做身份匹配**。
4. **本机编译**：JAVA_HOME 默认指向 JRE 1.8（`C:\Program Files\Java\jre1.8.0_152`），编译需显式覆盖为 JDK：`JAVA_HOME="C:/Program Files/Java/jdk-21"`（或 `C:\jdk-17`）。
5. **服务重启**：user-service 需重启才加载新代码；重启走 `scripts/with-env.sh`，并先 `unset SERVER__PORT SERVER__HOST SERVER_PORT`（宿主编注入会劫持端口）。

### 五、管理员端登录说明（必读）

- **登录入口**：与普通用户相同的登录页 `/login`，输入「手机号或邮箱」。
- **账号凭据来源**：管理员账号由 `AdminBootstrapRunner` 在启动时引导创建（仅当配置了 `ADMIN_BOOTSTRAP_PASSWORD` 且系统无启用管理员时）。登录标识为**占位邮箱**：`admin@recall.local`（由 `app.admin.bootstrap.username` 默认值 `admin` 拼上 `@recall.local`）。
- **验证步骤**：
  1. 在 `.env` 或环境变量设置 `ADMIN_BOOTSTRAP_PASSWORD`（≥12 位，且不能等于 `admin`）。
  2. 启动 user-service，观察日志出现「管理员引导完成: username=admin, email=admin@recall.local」。
  3. 打开 `/login`，登录标识填 `admin@recall.local`，密码填引导密码。
  4. 登录成功后按角色跳转 `/admin/overview`。
- **注意**：旧方式 `admin/123456` 是历史本地弱凭据，**改造后已无法用 `admin` 作登录标识登录**，必须用 `admin@recall.local`。若你已有存量管理员（无 email），需按下方「无手机号/邮箱账户」方案补 email。

### 六、无手机号账户的处理方案（重要，涉及存量数据）

改造后登录标识改为 `phone`/`email`，**存量用户若既无手机号也无 email，将无法登录**。三套方案对比如下：

| 方案 | 做法 | 适用场景 | 取舍 |
|---|---|---|---|
| **A. 数据回填真实信息** | 通过后台/脚本把存量用户的真实手机号或邮箱写入 `phone`/`email` | 有真实联系方式、且用户会继续使用的正式环境 | 最正规，但需要收集/核对真实联系方式，成本最高；且要保证唯一 |
| **B. 生成占位标识** | 按规则生成唯一占位（如 `user{id}@recall.local`），用户下次登录后自行改绑 | 开发/测试环境、或存量用户量少、联系不上的情况 | 成本低、立即可用；占位邮箱无法真正收信，用户需后续绑定真实手机号/邮箱；需配合「绑定/更新手机号」接口（`POST /user/phone/update` 已有） |
| **C. 强制重置/重新注册** | 放弃存量账号，让用户用手机号/邮箱重新注册 | 无真实数据价值、纯测试数据 | 最省事，但丢失用户学习记录、ELO、金币等数据，不可逆 |

**推荐**：
- **正式环境** 用 **方案 A**（回填真实信息），保证唯一后回填。
- **开发/测试环境** 用 **方案 B**（生成占位邮箱），推荐规则 `user{id}@recall.local`，避免唯一冲突；用户登录后通过现有 `POST /user/phone/update` 或未来邮箱绑定接口换成真实标识。

> **已落地（2026-11-08 第二轮）**：本项目已实际执行**方案 B**，详见下方「变更记录（2026-11-08 · 第二轮）」——通过 Flyway `V1.0.4` 给无手机号/邮箱的存量账号回填占位邮箱 `user{id}@recall.local`，并**统一重置所有 21 个账号密码为临时密码 `Recall@2026`**。

> 回填/生成占位同样属于数据变更，建议走一条**独立的 Flyway 迁移**（如 `V1.0.4__backfill_login_identifier.sql`）或明确的数据脚本，先备份、先展示 SQL 获批再执行；不要用 Navicat 手改共享库。

### 七、验证结果

- 后端 `mvn -pl user-service -am compile`（JDK 21）通过。
- 前端 `npm run type-check` 通过。
- Flyway `migrate`/`validate` 通过；`flyway_schema_history` 已记录 1.0.3 success=1。
- 已确认存量 `phone` 无重复、`email` 字段不存在（迁移前置检查通过）。

### 八、遗留风险 / 待办

1. **存量用户登录态**：改造前用 `username` 登录、且未绑手机号/邮箱的用户，改造后无法登录——**已在第二轮通过方案 B 解决**（回填占位邮箱 + 统一重置密码）。
2. **旧 JWT 兼容**：改造前签发的 token 其 `username` claim 存的是旧账号，改造后仅作展示，不影响 `sub`(userId) 鉴权，但前端展示的昵称可能短暂显示旧账号值，重新登录后恢复正常。
3. **找回密码仍走手机号**：`ForgotPasswordView` 与 `PasswordResetService` 目前仍按手机号匹配，尚未支持邮箱找回；若后续要邮箱找回，需单独扩展。

---

## 变更记录（2026-11-08 · 第二轮）

> 本轮在上一轮「登录标识改为手机号/邮箱」基础上，落地三件事：① 方案 B 存量账号数据回填；② 密码强度规则（含小写字母+数字、≥10 位）；③ 注册页新增验证码组件（手机/邮箱共用输入框）。

### 一、核心变化

| 项 | 结果 |
|---|---|
| 存量账号回填 | 17 个「无手机号且无邮箱」账号回填占位邮箱 `user{id}@recall.local` |
| 密码统一重置 | **全部 21 个账号**密码重置为临时密码 `Recall@2026`（BCrypt 强度 10） |
| 密码强度规则 | 注册/改密/找回密码**强制校验**「≥10 位且含小写字母和数字」；登录不校验强度 |
| 注册验证码 | 注册页新增验证码组件，账号框（手机号/邮箱二选一共用）+ 验证码框；本地模拟固定 `123456`，prod 拒绝 |

### 二、修改文件清单

**Flyway（已执行）**
- `user-service/src/main/resources/db/migration/V1.0.4__backfill_placeholder_email_reset_password.sql`（新增）

**common**
- `PasswordUtil.java`：新增 `isValidPassword(String)` 静态方法（≥10 位且含小写字母和数字）

**user-service**
- `dto/RegisterRequest.java`：新增 `code`（验证码）字段
- `dto/ForgotPasswordRequest.java`：移除 `@Size(min=6)`，改由 service 层用 `isValidPassword` 校验
- `controller/UserController.java`：注册接口加验证码校验（模拟 `123456`、prod 拒绝）+ 密码强度校验；改密接口密码强度校验；注入 `Environment`
- `service/PasswordResetService.java`：找回密码加密码强度校验

**frontend**
- `views/RegisterView.vue`：账号输入合并为「手机号/邮箱」单框 + 验证码组件（发送/倒计时）+ 密码强度校验
- `views/ForgotPasswordView.vue`：密码强度校验改为新规则 + 规则提示文案
- `views/LoginView.vue`：密码框下加规则提示文案（不拦截）
- `api/user.ts`：`RegisterRequest` 加 `code`
- `i18n/locales/zh-CN.ts`、`en-US.ts`：新增 `passwordInvalid`/`passwordRule`/`invalidEmail`/`accountPlaceholderRegister` 等 key

### 三、迁移执行结果（V1.0.4）

- 执行顺序：`backup-schema.sh`（备份至 `sql/backup/20261108_183848_*`）→ `flyway.sh user-service migrate` → `validate`。
- `flyway_schema_history`：installed_rank=5，version=1.0.4，success=1。
- 回填结果：17 个账号回填 `user{id}@recall.local`；4 个已有手机号账号（id 6/16/18/21）邮箱保持 NULL；全部 21 个账号密码重置为 `Recall@2026` 哈希。

### 四、关键配置与注意事项

1. **密码强度规则**：统一为「至少 10 位，且必须同时包含小写英文字母和数字」，校验逻辑集中在 `PasswordUtil.isValidPassword`。**仅「设置密码」入口校验**（注册 `POST /user/register`、改密 `POST /user/password/update`、找回 `POST /user/forgot-password/reset`），登录入口不校验（否则历史弱密码账号无法登录）。
2. **注册验证码**：本地模拟固定 `123456`，`prod` profile 下注册接口直接拒绝模拟验证码（与找回密码逻辑一致）。**尚未接入真实短信/邮件服务**，后续接真实验证码时需新增验证码存储（表/Redis）、发送通道、频率限制与单次消费，当前不引入新依赖。
3. **账号输入框共用**：注册页用一个输入框自动识别手机号（`^1[3-9]\d{9}$`）或邮箱（含 `@`），提交时分别填入 `phone`/`email` 字段；后端契约不变（`phone`/`email` 至少一个非空）。
4. **临时密码**：`Recall@2026` 为统一临时密码，已通过 `BCryptPasswordEncoder(strength=10)` 生成哈希写入，人工验证 `matches` 通过。**建议登录后立即改密**；账号清单见 `docs/Workbuddy/账号测试信息表.md`。

### 五、账号测试信息

完整账号清单（登录标识 + 统一临时密码）见 **`docs/Workbuddy/账号测试信息表.md`**，要点：

- 管理员账号：`user20@recall.local`（admin_e2e）、`13912345678`（admin），密码均 `Recall@2026`。
- 占位邮箱 `user{id}@recall.local` 仅作登录标识，**不能收发真实邮件**。
- 管理员登录入口仍为普通登录页 `/login`。

### 六、验证结果

- 后端 `mvn -pl user-service -am compile`（JDK 21）通过。
- 前端 `npm run type-check` 通过。
- Flyway `migrate`/`validate` 通过；`flyway_schema_history` 已记录 1.0.4 success=1。
- 已人工验证 `Recall@2026` 的 BCrypt 哈希匹配正确（`matches("Recall@2026")=true`）。

### 七、遗留风险 / 待办

1. **真实验证码未接入**：注册/找回密码的验证码仍是本地模拟 `123456`，正式上线前必须接入真实短信/邮件服务，否则任何人可用固定码注册。
2. **临时密码安全**：所有账号现用统一弱临时密码 `Recall@2026`（虽含字母+数字+符号，但公开在文档里），**上线前务必强制用户改密**，或重新走方案 A 回填真实联系方式。
3. **改密接口未校验新密码强度**：`POST /user/password/update` 已改为 `isValidPassword` 校验（本轮已覆盖），请确认无其他改密入口遗漏。

4. **端到端联调未做**：本轮只做了编译 + 迁移验证，未起服务做注册/登录/管理员邮箱登录的完整浏览器冒烟（user-service 需重启后验证）。
5. `.claude/worktrees/frontend-devtiny-fix` 是嵌套 git 仓库（位于仓库外），提交时勿 `git add -A` 误收。

---

## 变更记录（2026-11-08 · 第三轮）

> 主题：**词汇填空题批量生成器补丁 + 全量导入 exercise_db**。
> 从 `word_dictionary`（5805 词）批量生成 FILL_BLANK 题型，经 Flyway V1.0.13~V1.0.21 导入正式题库。

### 一、核心数据

| 项 | 值 |
|---|---|
| 词条总数 | 5805 |
| 生成题数 | **4465**（CET4 3451 / CET6 1014） |
| 跳过 | 1340（含 blocklist 1 条：`vocab-auto-10765-1`） |
| 正式库 question_info | 132 → **4597** |
| question_content | 4597（孤儿 0、空题 0） |
| Flyway | V1.0.13~V1.0.21 共 9 片全 success=1；V1.0.22 已移入 `docs/pending-migrations/_stale/`（不重新生成） |
| 难度回填 | 5805/5805（分布 668/753/899/1056/1173/1256） |

### 二、生成器补丁（`scripts/generate-vocab-questions.mjs`）

1. **blocklist 敏感过滤（两层）**：`POLITICAL_PATTERNS`（事件/人物）对整句匹配，命中即跳过；`CONTENT_PATTERNS`（暴力/色情/歧视）先剥离目标词所在片段再匹配，放行 `massacre` 这类词条本身作答案。另有 `EXACT_BLOCKED_KEYS` 精确键兜底。命中统一记 `blocklist` 跳过；报告新增 `## 3.2 敏感过滤`（只列 external_key，不含原句）。
2. **不可数名词**：21 词常量集合（hardware/software/furniture/equipment/information/advice/news/luggage/machinery/merchandise/baggage/homework/knowledge/research/evidence/traffic/weather/clothing/jewelry/scenery/poetry）+ `ware$` 启发式，命中时不生成规则复数，仍保留 -ware 类词的 match-only 匹配。
3. **IRREGULAR 拆分**：拆为动词/名词/形容词三类；只有 `IRREGULAR_NOUNS` 里的词接受不规则复数（criterion→criteria、child→children 等），不再给不规则名词生成规则复数（criterions 类）。
4. **CVC 双写白名单**：`DOUBLING_WHITELIST`（begin/occur/refer/prefer/infer/admit/commit/permit/regret/forget/control/patrol/compel/expel/rebel/transfer/upset/omit/submit/equip/recur/confer/deter/forbid）；单音节或白名单多音节动词接受双写形（stopping/occurring），非双写只 match-only；非白名单多音节（abandon）接受非双写形，双写只 match-only。
5. **报告自检**：新增 `## 5.2 accepted 一致性自检`（不可数规则复数 0、不规则规则复数 0、伪形态 0）。

### 三、幂等验证方式

- verify 库 `flyway_verify_exercise_db2`：从 V1.0.2 重建到 V1.0.21，得完整基线。
- 用 mysql 客户端直连把 V1.0.13 的 SQL 执行两次，question_info/question_content/vocab-auto 计数与重复键全程不变 → NOT EXISTS 双层幂等生效。
- **不走 `flyway repair` 或删 history 行**，不破坏历史表。

### 四、文件清单

- `scripts/generate-vocab-questions.mjs`（补丁）
- `exercise-service/src/main/resources/db/migration/V1.0.13__seed_vocab_auto_part01.sql` ~ `V1.0.21__seed_vocab_auto_part09.sql`（新增，9 片）
- `docs/pending-migrations/vocab-auto-report.md` / `vocab-auto-manifest.json` / `vocab-auto-sample.json`（生成物）
- `docs/pending-migrations/V1.0.22__seed_vocab_auto_part10.sql` → 移入 `_stale/`（废弃，不执行）

### 五、验证结果

- `JAVA_HOME=jdk-21 mvn -pl exercise-service -am test`：44 tests，BUILD SUCCESS。
- `npm run type-check` / `npm run build`：通过。
- Flyway `migrate` / `validate`：V1.0.12~V1.0.21 全 success=1。

### 六、遗留风险 / 待办

1. **blocklist 覆盖有限**：正则只拦关键词字面命中，语义变体（谐音、转述、隐晦表达）拦不住；上线前需人工过 `sample.json` 20 条 + 抽查各分片。
2. **被拦词条已核对（2026-11-08，结案）**：`vocab-auto-10765-1` → `word_dictionary.id=10765` 为 `massacre`（CET6，n./vt. 大屠杀）。只读 SQL 取出该条后与规则逐项比对：整句命中 `POLITICAL_PATTERNS`（第一层"整句政治敏感"检查先于第二层"剥离目标词"），同时目标词本身命中 `CONTENT_PATTERNS`。判定**应拦、非误杀**，`EXACT_BLOCKED_KEYS` 保留，原句按规则不复述。
3. **accepted_answers 偏宽松**：收录全部规则变形，填错词形也可能判对——这是"答案取表面词形"方案的既定取舍，不改。
4. **8082 实例已重启验证（2026-11-08 20:34）**：进程 24208 启动晚于类文件编译时间，接口实测题目 510（`vocab-auto-2-1`）——`showAnswer=false` 时 `analysis` 只返回释义，`showAnswer=true` 返回「释义 ｜ 原句：…」，截断逻辑已生效。
5. `docs/pending-migrations/_stale/V1.0.22__seed_vocab_auto_part10.sql` 确认无用后可物理删除。

---

## 变更记录（2026-11-08 · 第四轮）

> 主题：**判题链路前置 accepted/buggy、填空答案归一化对称、AI 调用收紧**。
> 提交：`199a514`（链路重排）、`57ee80a`（correct_answer 归一化 + `scripts/mvn.sh`）。

### 一、核心契约变化（先记住）

1. **六层判题顺序，前置命中即短路**：accepted_answers/正确答案精确匹配 → `question_buggy_path` 错因拦截 → L1 规则（拼写/语法）→ L2 相似度模糊 → L2.5 AI 语义判对 → L3 AI 启发反馈。
2. **AI 调用红线**：`question_info.accepted_answers` 非空且 L2 未命中时，直接返回 `errorType=MISMATCH`（`matchedLevel=2`），**不调 AI、不写错因表**；`accepted_answers` 为空才走 L2.5/L3。`moduleType=2`（连词成句）跳过 L2.5 语义判对。
3. **归一化两侧对称**：`FILL_BLANK` 的用户答案与 `correct_answer` 都经 `AnswerNormalizer.normalize`（全角转半角 → 空白折叠 → 小写 → 剥首尾标点，**保留词内 `-`**，如 `well-being`）；`accepted_answers` 逐条同样归一化。非填空类仍为 `trim + toLowerCase`，不做全角转换。
4. **错因表口径**：写入的 `wrong_answer` 已是归一化值；查询侧保留"原值兜底"第二次查询以兼容历史行（如带尾部标点的 `meal.`）。

### 二、修改文件

- `common/src/main/java/com/english/ai/common/util/AnswerNormalizer.java`（新增，纯函数、无状态）
- `exercise-service/.../service/impl/JudgmentEngineImpl.java`（判题编排重排、归一化接入、MISMATCH 短路）
- `exercise-service/.../service/JudgmentEngine.java`（javadoc 改为六层 + AI 调用控制说明）
- `exercise-service/src/test/.../JudgmentEngineImplTest.java`、`.../util/AnswerNormalizerTest.java`（新增用例）
- `scripts/mvn.sh`（新增，自动挑选 JDK 17+）

### 三、验证结果（2026-11-08 复核）

- `scripts/mvn.sh -pl exercise-service -am test` → **Tests run: 61, Failures: 0, Errors: 0, Skipped: 0，BUILD SUCCESS**。
- 回归用例：`correctAnswer="abandon."` + 用户填 `abandon` → 判对、`matchedLevel=1`、`verifyNoInteractions(restTemplate)`（零 AI 调用）。
- 端到端（8082 用新代码重启）：正确答案 / accepted 变体 / 全角输入均 `level=1`；accepted 非空错答 `MISMATCH level=2` 且不调 AI；错因表命中优先于 L1 与 AI；accepted 为空才走 AI。
- 影响面：全库 19 条带标点或全角的 `correct_answer`（5 条词内连字符、10 条翻译题走 `judgeTranslation`、4 条选择题走 `ChoiceAnswerUtil`），当前真实命中 0 条；缺陷此前是潜伏状态，已修。

### 四、遗留风险 / 待办（已定级，勿顺手改）

1. **`matchedLevel` 编号不自洽**：`0` 与 `1/2/3` 并存，需先定义对外契约再统一，勿零散改。
2. **accepted 非空命中错答时无 AI 反馈**：只给固定文案，是否补个性化提示待产品确认。
3. **`judgeTranslation` 未纳入本次归一化**：独立链路（`moduleType=3`），延后处理。
4. **`parseAcceptedAnswers` 每次判题都反序列化**：需要时加有界缓存，注意缓存键必须带 `questionId`，不可跨题复用。
5. **本地 8082 实例由开发终端后台启动**：IDE 里 Run/Debug 前先停掉，避免端口与类版本冲突。

---

## 变更记录（2026-11-08 · 第五轮）

> 主题：**P1 全链路收口**（判题口径统一、成本收敛、数据治理）+ 四条数据迁移落地。
> 提交：`60e2c23`（P1-1 归一化对齐）、`738f8dc`（P1 第二轮）、`39347fe`（P1-4 数据治理）、`07d8e42`（V1.0.26~28 执行与覆盖度补全）。

### 一、当前可对外依赖的现状（先记住）

1. 填空题 `accepted_answers` 覆盖率 **100%**（4537 题，缺失 0）；判题六层顺序未变。
2. `judgment.accepted-cache.enabled` 默认 **false**：缓存代码与埋点已就位，等 `aiRate` 与耗时基线观察后再评估开启。
3. `judge_review_queue` 已建表、`POST /internal/judge/review` 可用（幂等 `INSERT IGNORE`），但**判题链路零调用**，是否入队由调用方决定。
4. `matchedLevel` 取值仍为 0/1/2/3，已收敛到 `common/src/main/java/com/english/ai/common/JudgmentLevel`，对外契约尚未文档化。

### 二、迁移执行

| 版本 | 内容 | 实际影响 |
|---|---|---|
| V1.0.25 | 8 词补全（生成期并集 + 执行期整体替换） | 3 行 |
| V1.0.26 | `question_buggy_path` 清洗（`meal.` → `meal`） | 1 行 |
| V1.0.27 | `judge_review_queue` 建表 | 1 表 / 3 索引 |
| V1.0.28 | accepted 覆盖度补全 | 111 行 / 112 变体 |

全部按「备份 → `flyway_verify_exercise_db2` 预演 → 生产执行 → validate」落地，`flyway_schema_history` 均 success=1。

### 三、脚本

`generate-vocab-questions.mjs`、`patch-accepted-top200.mjs`（`--only-keys` / `--keys-file`）、`audit-accepted-coverage.mjs`（`--json-out` / `--db`）、`clean-buggy-paths.mjs`、`mvn.sh` / `mvn.cmd`，用途见「仓库文件地图 → scripts」。

### 四、本轮修正的口径

补丁脚本原先把词干原形无条件加入候选，与生成器/巡检的"句中需变形时不收原形"不一致，实测多出 6 条伪变体（generalization / paralyze / stabilize / organize / seize / specialize）；已对齐后与巡检清单 **0 多 0 少**。三条生成规则与词库缺口结论见 `docs/数据库迁移规范.md` 2.4。

### 五、遗留风险 / 待办

1. **伪形态清洗**：存量 accepted 有早期伪形态（如 `fiber` 的 `fiberer` / `fiberest`，名词被按形容词比较级处理）。下一轮先只读出清单（受影响题数 + 每题伪形态），人工确认删除白名单后再单独一条迁移，**本轮不动**。
2. **审核队列只有写入能力**：列表/审核接口与前端未做（按"仅预留"约定）。
3. **缓存未开启**：等 1~2 天埋点基线。
4. **词库缺 8 词**：已定口径「不补词库」，以 `docs/数据库迁移规范.md` 2.4-D 为准。
5. **`matchedLevel` 对外契约未文档化**：前端 `L${matchedLevel}` 仍依赖 0/1/2/3 取值，改动需先定义契约。

---

## 变更记录（2026-11-09 · 第六轮）

> 主题：**P2 质量兜底（模块1）—— 答案槽位离线校验**。
> 本轮无 Java 代码改动、无 Flyway 迁移。

### 一、范围决策

| 决策点 | 结论 |
|---|---|
| 范围 | 只做模块1（离线校验）；模块2（AI 低置信入队）推迟 |
| 低置信阈值 | 0.6，**仅预留配置，不接线**（`judge.ai.review-*`，无代码读取） |
| 词性校验粒度 | 统一标准（词库只有 CET4/CET6，无 TOEFL 数据） |
| 首扫去向 | 仅出 CSV 人工筛选，不直接入队 |

### 二、交付

- `scripts/check-answer-slots.mjs`（只读）：`--dry-run` / `--question-id` / `--db` / `--limit` / `--only-types`
- `docs/review/README.md`：用法、五条规则、CSV 字段、对接队列映射
- `docs/review/answer-slot-audit-20261109.{csv,md}`：首次全库扫描
- `docs/2026-11-09-P2质量兜底记录.md`：完整记录

### 三、首次扫描结论

4537 题 / 9440 个变体 → **934 个问题项**：`PSEUDO_FORM` 12（如 `fiberer`/`fiberest`、`kneer`/`kneest`）、`COLLOCATION_CONFLICT` 922、其余三类均为 0。

> `COLLOCATION_CONFLICT` 是「accepted 偏宽松」既定设计的体现（题干只容得下一种形态，accepted 收了全部变形），不是错题。

### 四、模块2 的前置条件

1. 先用 `JudgmentMetrics` 的 `aiRate` 埋点确认真实 AI 触发量；
2. 再决定是否改 `ai-service` 的 prompt 让它返回 `confidence`（当前两条判题链路都不返回）；
3. 接线时走 `V1.0.29` 给 `judge_review_queue` 加 `ai_confidence` / `ai_result` / `judge_context`；
4. exercise-service 目前**没有异步能力**（无 `@EnableAsync`），需自建有界线程池。

### 五、遗留

1. 12 条伪形态待清理（清单 → 白名单 → 单独迁移，accepted 只增不减的例外需单独评审）。
2. 922 条形态冲突待评估，属产品决策。
3. 槽位线索覆盖率仅 5.9%（266/4537），无 NLP 依赖只能靠强线索。
4. `ai-service` 两处待修：`application.yml` 模型名末尾多了 `nt`；`/ai/judge-feedback` 的 `errorType` 恒为 `UNKNOWN`。
