```
# CLAUDE.md
> 本文档是 Claude Code 操作本仓库的唯一事实基线，所有代码修改、方案输出均以本文档为准，禁止自行脑补未提及的架构与依赖。

## 项目概述
Recall·睿考 —— 四六级英语学习系统，前后端分离架构。
- 后端：Maven 多模块 Spring Boot 微服务，Spring Cloud Gateway 做静态路由
- 前端：Vue 3 + Vite SPA，移动端优先，Material Design 3 设计语言
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
- Spring Security Crypto（BCrypt，work factor 12）
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

## 启动与构建命令
### 后端（仓库根目录执行）
```bash
# 安装公共依赖并全量构建（跳过测试）
mvn -DskipTests install

# 构建单个模块及其依赖
mvn -pl exercise-service -am clean package -DskipTests

# 启动单个服务
mvn -pl user-service spring-boot:run
```

- 本地开发启动顺序：`user-service(8081)` → `exercise-service(8082)` → `learning-engine-service(8083)` → `ai-service(8084)` → `api-gateway(8086)`
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

1. **三级判题引擎**：L1 精确匹配 → L2 归一化容错 → L2.5 AI 语义判对 → L3 AI 启发反馈，策略模式扩展新题型，不改原有 Handler
2. **ELO 定级算法**：初始分 1000，定级 K=40，常规答题按难度分档，更新用户能力雷达
3. **艾宾浩斯记忆曲线**：掌握度 1-5 级，间隔 1/3/7/15/30 天，答对升级答错降级
4. **智能选题**：按用户 ELO 匹配难度区间，去重近 7 天已做题，优先低使用量题目
5. **鉴权链路**：网关校验 JWT → 透传 `X-User-Id` 头 → 下游服务信任该头
6. **AI 出题闭环**：生成 → 待审核表 → 管理员审核通过 → 入正式题库

## 数据库约定

1. 建表脚本以 `sql/` 下三个库的正式 SQL 为准，`sql/init/` 下的旧脚本已废弃，禁止执行和修改
2. 禁止修改已发布的存量建表脚本，表结构变更必须新增增量脚本（如 `07-听力模块.sql`）
3. 逻辑删除全局使用 `is_deleted` 字段，MyBatis-Plus 自动处理
4. 题目分表设计：`question_info` 存元数据，`question_content` 存正文重字段，列表查询只查轻量表

## 🔴 严格禁止行为（优先级最高）

1. 禁止自动新增任何 Maven 依赖或 npm 包，如需引入必须先向用户确认
2. 禁止修改 `sql/` 目录下已发布的数据库建表 / 迁移脚本，结构变更只能新增增量脚本
3. 禁止自行启用 Nacos、Redis、OpenFeign、Sentinel 等未在技术栈内的中间件
4. 禁止在前端页面中直接使用 Element Plus 的 `el-*` 组件
5. 禁止擅自修改 ELO 算法、遗忘曲线、判题引擎等核心业务逻辑
6. 禁止在配置文件中硬编码 API Key、密钥等敏感信息，必须使用环境变量

## Git 提交规范

- 提交信息格式：`类型(模块): 中文描述`
- 类型约定：
  - `feat`：新增功能
  - `fix`：修复 bug
  - `refactor`：代码重构
  - `docs`：文档变更
  - `chore`：工程配置、依赖升级等杂项
- 示例：`feat(exercise): 新增听力题目CRUD接口`、`fix(web): 修复路由守卫重定向死循环`

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
8. 前端仍无单元测试框架；`BaseDialog` 的焦点陷阱、移动端交互需浏览器验收。
9. `QuestionGenerateService` 的 unchecked 编译警告为既有问题，本次未处理。

### 后续开发建议

1. 下一轮补读接口 IDOR 统一校验，优先 `/exercise/stats`、`/exercise/history`、`/user/info`、`/user/radar`。
2. 若前端交互频繁，再评估 `useAsyncState`、`ProgressBar`、`StatTile`，不要一次性全站重构。
3. 等出现第二个分页页再抽 `PageResult`/分页拦截器；等出现第三个 servlet 服务再评估 `common-web`。
4. 新增金币奖励类型时再抽 `BizKeyFactory`；新增复习入口时再评估 `VocabularyReviewPolicy`。
5. 部署前补一次真实 MySQL 端到端联调和浏览器 E2E。