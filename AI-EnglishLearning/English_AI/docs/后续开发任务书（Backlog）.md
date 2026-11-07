# Recall·睿考 后续开发任务书（Backlog / 喂给 AI 的编程任务单）

**版本**：V1.0　|　**基线**：`mman91359-rgb-English-AI-learning` 最新提交　|　**用途**：把"还没做 + 待优化"的目标拆成**可直接执行的开发任务**，按优先级排期，可直接投喂给 AI 编程工具（或人工作为检查单）

> **最近校准（2026-11-07）**：P0 安全债「读接口 IDOR」已完成修复（14 个接口统一加 `X-User-Id` 越权校验）。后续方向对齐为 P1 翻译模块闭环 → P2 写作模块闭环 + AI 复用组件（`WordToken`/`WordDetailCard`/`AiFeedbackPanel`/`AiActionBar`）→ P3 复习/统计口径合并。词条数据源采用「C1 现在 AI 实时查词（复用 `/ai/word-detail`）→ C3 终态本地词典优先 + AI 回退 + 缓存写回」，为后续大量导入单词数据预留统一查词入口 `api/word.ts`。

> **上一校准（2026-10-31）**：按当前代码事实回写执行状态。T-001/T-002/T-005 已完成，T-003 部分完成，T-004 暂缓，T-006 待做；听力模块已按"复用题库 + 音频表"落地。module_type 契约统一为：1词汇 2语法 3翻译 4听力 5造句（保留）6写作。**写作不再使用 5，改为 6。**

---

## 0. 这份文档是什么

专业领域管它叫 **Product Backlog（产品待办清单）+ Sprint Plan（迭代计划）**。通俗说就是"**给 AI 的编程任务单**"：每一条 = 一个可交付的开发任务，包含【做什么 / 为什么 / 验收标准 / 涉及文件 / 依赖】。AI 编程工具按 P0→P2 顺序逐条执行，做完对照"验收标准"自检，即可保证项目健康演进、无幻觉功能。

### 任务分级
| 级别 | 含义 | 节奏 |
|---|---|---|
| **P0** | 安全/数据/地基问题，必须最先做 | 本轮迭代完成 |
| **P1** | 核心功能模块（听力/翻译/写作） | 后续迭代按里程碑推进 |
| **P2** | 体验与工程化增强 | 穿插进行，不阻塞主线 |

### 迭代规划（Sprint）
| Sprint | 内容 | 产出 |
|---|---|---|
| Sprint 0（P0 整改） | 安全整改 + SQL 归档 + 工程加固 | 干净地基 |
| Sprint 1（听力 MVP） | 听力模块 后端 + 前端 + 判分 | 可用的听力练习 |
| Sprint 2（翻译 + 写作 MVP） | 翻译模块、写作模块 | 完整"四模块学习"闭环 |
| Sprint 3（体验 + 工程化） | 暗色主题、SSE 重连、测试、Docker | 可展示、可部署 |

> 每个任务标注了**真实代码位置**与**真实接口**，AI 可直接定位修改；任务描述严格基于现状代码与已预留的设计（`kown/数据库结构.txt`、`页面/*.html` 原型、`recall-frontend-prompt.md` 愿景），**不允许新增未规划的表结构/接口方向**。

---

## Sprint 0 —— P0 安全与地基整改（做完再动功能）

### T-001　吊销并移除明文 AI API Key　✅ 已完成（2026-10-31）
- **状态**：`ai-service/src/main/resources/application.yml` 已改为 `${DASHSCOPE_API_KEY}`，无 Key 走 Mock；本地 `.env` 与 `.idea/workspace.xml` 仍含旧 Key，需在阿里云侧吊销并轮换。
- **为什么**：ai-service `application.yml` 默认值写死了真实百炼 Key（`sk-ws-H.PYHPHIM...`，本仓库已二次泄露）。这是最高危项。
- **做什么**：① 去阿里云百炼控制台吊销该 Key 并换新；② 删除 yml 中默认值，只保留 `${DASHSCOPE_API_KEY}`；③ 本机/IDEA 环境变量注入。
- **验收**：`git grep "sk-"` 仓库内零命中；无 Key 启动走 Mock 降级（代码已支持）。
- **涉及**：`ai-service/src/main/resources/application.yml`。

### T-002　归档并废止 `sql/init/01-基础建表.sql`（单库脚本）　✅ 已完成（2026-10-31）
- **状态**：`English_AI/sql/` 下已无旧单库脚本；新增 `sql/init/00-init.sql` 作为 Docker 初始化入口。仓库根 `AI-EnglishLearning/init/01-基础建表.sql` 仍是旧脚本，禁止执行。
- **为什么**：该脚本是 english_ai 单库 6 表旧版，与当前三库 9 表代码**实体不匹配**，已被你本地误跑过（Navicat 截图），继续存在会导致再次建错库。
- **做什么**：移入 `sql/_archive/` 或删除；`README` 明确唯一建库路径 = `user_db.sql → exercise_db.sql → learning_db.sql`。
- **验收**：`sql/` 根目录不再有单库脚本；README 写入建库顺序。

### T-003　后端全局异常处理器收敛　🟡 部分完成
- **状态**：`user-service`、`exercise-service` 已有各自的 `GlobalExceptionHandler`；`ai-service`、`learning-engine-service`、`api-gateway` 仍缺失，`AiController` 的 `/ai/judge-feedback`、`/ai/judge-acceptable` 仍返回裸 Map。未下沉到 common。
- **为什么**：Controller 内散落 try-catch（`AiController`/判题链均有），错误码不统一，AI 编程易复制坏味道。
- **做什么**：新增 `common/exception/GlobalExceptionHandler`（`@RestControllerAdvice`），统一 `Result.fail(code,msg)`；业务异常用自定义 `BusinessException`。
- **验收**：全部 Controller 删除 try-catch，仅保留领域逻辑；错误统一 JSON。
- **涉及**：`common/` + 各 service Controller。

### T-004　Long → String 序列化（前端 Number 精度）　⏸ 暂缓
- **状态**：当前 ID 量级远小于 `2^53`，实际失真风险低；引入全局 `ToStringSerializer` 会牵动所有前端类型与比较逻辑。本轮明确暂缓，待出现真实精度问题或答辩要求时再做。
- **为什么**：`userId/questionId` 为 Long，超过 JS 安全整数后前端失真（当前量级未触发，但 AI 生成新表 ID 会踩坑）。
- **做什么**：新增 `JacksonConfig`，Long/长整型统一序列化为字符串；前端类型 `string | number`。
- **验收**：`/exercise/history/{userId}` 返回的 id 为字符串；前端页面正常。

### T-005　JWT 默认密钥启动校验　✅ 已完成（2026-10-31）
- **状态**：`common/EnvGuard` 已在 prod profile 下校验 `JWT_SECRET`、`MYSQL_PASSWORD`、`DASHSCOPE_API_KEY`、`INTERNAL_TOKEN`，缺失时拒绝启动。
- **为什么**：默认密钥 `EnglishAI-Local-Dev-JWT-Secret-Key-Change-Me-32-Bytes` 人人可知，生产必炸。
- **做什么**：启动时校验 `JWT_SECRET` 环境变量，未设置且非 dev profile 则拒绝启动（或强制随机生成并告警）。
- **验收**：本地开发不受影响；部署需显式提供密钥。

### T-006　`question_pending` 审核流补充（可选，P0.5）
- **为什么**：`AdminQuestions.vue` 的"驳回"只存 comment，无状态回滚校验。
- **做什么**：审核接口增加状态机校验（仅 PENDING 可 approve/reject；重复操作返回 409）。
- **验收**：对已审核题重复操作返回 409。

---

## Sprint 1 —— 听力模块 MVP　✅ 已完成（2026-10-31）

> **依据**：数据库已预留 `user_ability_radar.listening_score`；`module_type=4` 为听力；前端映射实际在 `frontend/src/config/modules.ts`；原型资源为仓库根 `页面/`（15 个亮色 + 6 个黑夜版）与 `参考图片/听力学习标签界面.jpg`。

### T-100　module_type 契约收口　✅ 已完成
- **做什么**：在 `common/ModuleType` 固定 1词汇 2语法 3翻译 4听力 5造句 6写作；`defaultQuestionType` 决定选题题型（4→CHOICE）；`radarDimensionOf` 决定雷达维度（3→READING、4→LISTENING、6→无）。
- **验收**：`ModuleTypeTest`、`UserAbilityRadarServiceImplTest` 通过；听力分不再写入 `reading_score`。

### T-101　听力数据模型　✅ 已完成
- **做什么**：题目复用 `question_info`/`question_content`（`module_type=4`、`question_type=CHOICE`），新增 `listening_audio`（question_id 唯一，存 audio_url/transcript/duration_seconds）。种子 4 条（CET4 2 条、CET6 2 条），以题干为自然键幂等。
- **验收**：`sql/10-listening-module.sql` 连续执行两次计数不变；未修改 02~09 已发布脚本。
- **涉及**：`sql/10-listening-module.sql`。

### T-102　听力接口（exercise-service）　✅ 已完成
- **做什么**：`ListeningController` 提供 `GET /exercise/listening/questions`、`GET /exercise/listening/question/{id}`、`POST /exercise/listening/submit`、`GET /exercise/listening/stats/{userId}`。
- **判题约定**：`moduleType=4` 走 `ChoiceAnswerUtil` 本地确定性判题，**不进入** `JudgmentEngine` 的 L2.5/L3 AI 链；提交后写 `user_exercise_log`、错题本、遗忘曲线，并通过共享映射更新 `listening_score`。
- **验收**：接口返回 `Result<T>`；跨模块提交、越权提交、重复提交均有明确处理。

### T-103　听力前端页面　✅ 已完成
- **做什么**：新增 `ListeningView.vue` + `AudioPlayer.vue` + `/listening` 路由；`LearningView` 听力 tab 开启并增加专属入口布局；作答前不下发 `transcript` 与 `hint`，提交后才展示原文。
- **验收**：列表 → 播放 → 作答 → 判分 → 原文/解析 → 结果页全链路可用；空态、音频 404、提交失败有提示。

### T-104　听力雷达与统计　✅ 已完成
- **做什么**：`ProfileView` 已展示 `listeningScore`（注意：StatsView 没有雷达图）；`ListeningView` 顶部展示听力正确率；`HomeView` 暂未按模块拆分学习量，列为后续增强。
- **验收**：听力答题后 `listening_score` 变化、`reading_score` 不变。

---

## Sprint 2 —— 翻译 + 写作模块 MVP

> **依据**：`question_info.question_type` 已含 `TRANSLATION/WRITING`；`/ai/score` 已支持 `scoreType=writing`（SSE 流式）；`recall-frontend-prompt.md` 设计了 `/writing` 与作文评分 UI。

### T-201　翻译模块（中英互译练习）
- **做什么**：
  - 数据：`sql/07-translation.sql` 新增翻译题（`question_type='TRANSLATION'`，`module_type=3`，题干含原文，答案含参考译文）。
  - 后端：`ExerciseController` 扩展按 `moduleType=3&questionType=TRANSLATION` 选题（现有智能选题 SQL 已按 module_type 过滤，仅需数据与前端）；提交时 **L1 精确比对 + L2.5 AI 语义判对**（复用 `/ai/judge-acceptable`）。
  - 前端：`views/TranslationView.vue`，路由 `/translation`：原文展示 → 输入译文 → 提交 → 显示参考译文 + AI 语义判对结果（"语义匹配/需改进"+ 建议）。
- **验收**：翻译题可选题、作答、AI 判对，结果入库 `user_exercise_log`（module_type=3）。
- **依赖**：Sprint 0。

### T-202　写作模块（作文练习 + AI 评分）
- **做什么**：
  - 数据：新增写作题库（`question_type='WRITING'`，**module_type=6**，与 5=造句 隔离——需同步 `frontend/src/config/modules.ts` 与 i18n 增加 `6:'写作'`）。写作暂无独立雷达列，提交只更新 ELO/日志；若需要写作维度，另加 `writing_score` 增量 SQL。
  - 后端：`POST /exercise/writing/submit` 提交作文 → 调 `/ai/score`（scoreType=writing, SSE）→ 落库 `user_exercise_log` + 错题本；`GET /exercise/writing/history/{userId}` 历史作文与得分。
  - 前端：`views/WritingView.vue`，路由 `/writing`：题目展示 → 文本编辑器（计时器 TimerCountdown 参照 recall prompt）→ 提交 → SSE 流式显示分项得分（内容/结构/语言）+ AI 建议。
- **验收**：作文可提交、AI 评分流式输出、历史可回看；错题本/统计同步。
- **依赖**：T-003/T-004；AiSidebar SSE 渲染复用。

---

## Sprint 3 —— 体验与工程化增强

### T-301　暗色主题落地　✅ 已完成
- **状态**：`tailwind.config.js` 已启用 `darkMode: "class"` 并配置 dark 令牌；`stores/app.ts` 已实现切换与 `localStorage` 持久化，`TopAppBar` 已接入。
- **做什么**：按 `页面/黑夜版/` 原型补全 `tailwind.config` dark 令牌（`dark:bg-inverse-surface` 等），`TopAppBar` 主题切换持久化到 localStorage。
- **验收**：切换主题全站生效，无写死亮色。

### T-302　路由懒加载 + 组件级错误边界　⬜ 未完成
- **状态**：`router/index.ts` 目前仍是全静态 import（含新增的 ListeningView）；构建产物主包 2.7MB，需后续分包。
- **做什么**：17 个视图改 `() => import()`；大视图（VocabQuiz/GrammarQuiz 40KB+）单独分包。
- **验收**：`npm run build` 产物分块；首屏白屏无。

### T-303　AI 侧边栏 SSE 健壮性
- **做什么**：AiSidebarContent 增加断线重试、加载态、字数节流；对话上下文长度裁剪。
- **验收**：断网重连不丢已渲染内容；长对话响应流畅。

### T-304　图表组件沉淀
- **做什么**：将雷达图/柱状图/热力图封装为 `ChartRadar.vue / ChartBar.vue / ChartHeatmap.vue`，替换 StatsView 内联 ECharts。
- **验收**：三个图表组件可参数化复用。

### T-305　单元测试　🟡 部分完成
- **状态**：已有 11 个测试类，覆盖金币/签到/偏好/学习会话/词汇工具；本轮新增 `ModuleTypeTest`、`ChoiceAnswerUtilTest`、`ListeningServiceImplTest`、`UserAbilityRadarServiceImplTest`。仍缺 `EbbinghausUtil`、ELO 公式、`JudgmentEngine`、`JwtUtil` 的专项测试。
- **做什么**：为纯函数补测试——`EbbinghausUtil`（遗忘曲线梯度）、ELO 更新公式、`JudgmentEngine`（L1/L2 判题样例）、`JwtUtil`。
- **验收**：`mvn test` 全绿，覆盖率报告中核心算法覆盖 >60%。

### T-306　Docker 化（可展示）　🟡 基本完成
- **状态**：6 个 Dockerfile + `docker-compose.yml` + nginx.conf 已存在；本轮补齐 `sql/init/00-init.sql` 与 `./sql:/sql:ro` 挂载，修复首次启动不建库的问题。仍需在真实 Docker 环境跑一次全链路验证。
- **做什么**：Dockerfile（后端 5 服务 + 网关）与 `docker-compose.yml`（mysql8 + 5 服务 + 可选 rabbitmq），环境变量统一 `.env`。
- **验收**：`docker compose up` 一键起全套，前端代理指向容器网关。
- **注意**：T-001（Key 环境变量）必须先行，否则镜像内仍含明文 Key。

---

## Sprint 4 —— 管理员端（2026-10-31 本轮）

> 目标：统一 `/admin/**` API，支持查看用户数据、管理用户、发放通知/活动；管理员 UI 契约见 `docs/管理员端UI设计契约.md`，API 契约见 `docs/管理员端API契约.md`。

### T-401　RBAC 与网关可信头　✅ 已完成
- **做什么**：`common/Roles`；网关剥离客户端 `X-User-*` 后注入 `X-User-Id/X-Username/X-User-Role/X-Gateway-Token`；非管理员访问 `/admin/**` 直接 403；下游 `AdminAuthInterceptor` 校验网关令牌，user-service 再回查数据库角色/状态。
- **验收**：无 token 401；普通用户 403；伪造角色直连 8081/8082 403；管理员 200。

### T-402　用户管理接口　✅ 已完成
- **做什么**：`GET /admin/users` 分页/筛选；`GET /admin/users/{id}`；`PUT /admin/users/{id}/status`；`PUT /admin/users/{id}/role`；`POST /admin/users/{id}/reset-password` 返回一次性临时密码。
- **规则**：禁止禁用/降级自己；至少保留一个启用管理员；手机号脱敏、不返回密码。
- **验收**：`AdminUserServiceImplTest` 覆盖自锁/最后管理员/临时密码。

### T-403　通知管理　✅ 已完成
- **做什么**：`/admin/notices` CRUD + publish/expire；用户端 `/user/notices`、未读数、已读；目标人群 `ALL/CET4/CET6`。
- **规则**：仅草稿可编辑/删除；已发布不可改内容，只能下线；已读前再次校验可见性。
- **验收**：`AdminNoticeServiceImplTest` 覆盖已发布不可编辑/删除、发布状态流转。

### T-404　活动管理　✅ 已完成
- **做什么**：`/admin/activities` CRUD + publish/end；用户端 `/user/activities`；目标人群与起止时间校验。
- **规则**：仅草稿可编辑/删除；发布后只能结束；`startAt < endAt`。
- **验收**：活动内容可见性按时间与人群过滤。

### T-405　操作审计日志　✅ 已完成
- **做什么**：`admin_operation_log` 表；用户/通知/活动写操作本地同事务记录；exercise-service 审核通过/驳回/生成通过 `AdminAuditClient` 上报；`GET /admin/operation-logs` 分页筛选。
- **验收**：禁用/改角色/重置密码/发布通知/审核题目均有日志；detail 不记录密码。

### T-406　题目审核迁移与状态机　✅ 已完成
- **做什么**：旧 `/exercise/generate-questions`、`/exercise/pending-questions/**` 迁移到 `/admin/questions`；仅 `PENDING` 可通过/驳回；条件更新防并发重复审核；reviewerId 取 `X-User-Id`。
- **验收**：`QuestionGenerateServiceTest` 覆盖重复审核 409、条件更新冲突、正式题目只插入一次。

### T-407　管理看板聚合　✅ 已完成
- **做什么**：`GET /admin/overview` 聚合 user_db 用户/金币/签到/通知/活动；调用 exercise-service `/internal/admin/overview` 获取学习统计；超时 1s/2s，失败 `exerciseDegraded=true`。
- **验收**：停掉 exercise-service 时 HTTP 200 + 降级标记。

### T-408　管理员引导　✅ 已完成
- **做什么**：`AdminBootstrapRunner` 读取 `ADMIN_BOOTSTRAP_USERNAME/PASSWORD`，仅在无启用管理员时创建；不写死 SQL 账号。
- **验收**：未配置密码跳过；已有管理员跳过；弱密码拒绝；不打印明文。

### T-409　测试与文档　🟡 进行中
- **状态**：新增 `RolesTest`、`AdminAuthInterceptorTest`、`AdminUserServiceImplTest`、`AdminNoticeServiceImplTest`、`QuestionGenerateServiceTest`；当前 user-service 51、exercise-service 40，共 91 个用例通过。文档已新增 UI/API 契约。
- **待办**：活动状态机测试、看板降级测试、Controller MockMvc 测试、真实 MySQL/浏览器联调。

### T-410　管理员 UI 实现　⬜ 未开始
- **做什么**：按 `docs/管理员端UI设计契约.md` 实现 `AdminLayout`、六页、表格/分页/筛选/抽屉/确认框、角色守卫、通知铃铛改造。
- **验收**：契约第 10 节清单全部通过。

---

## Sprint 5 —— Flyway 数据库版本管理（2026-10-31）

### T-501　Flyway 接入与基线　✅ 已完成
- **做什么**：三个有库模块独立接入 Flyway 9.22.3（Boot 管理）；`V1.0.0` 为当前完整结构快照，`V1.0.1` 为幂等种子；配置 `validate-on-migrate=true`、`clean-disabled=true`、`out-of-order=false`。
- **Docker**：`sql/flyway-init/00-create-databases.sql` 只建三库，表结构由服务启动时 Flyway 迁移。
- **脚本**：`scripts/with-env.sh`、`scripts/backup-schema.sh`、`scripts/flyway.sh`。
- **验收**：三库 baseline 1.0.0 + migrate 成功；`flyway_verify_*` 空库从零迁移成功；`mvn test` 全绿。
- **规范**：`docs/数据库迁移规范.md`。

---

## 附：开发执行建议（喂 AI 时的措辞模板）

把本任务书按 Sprint 逐条喂给 AI 编程工具时，**每条任务请附带以下 3 句话**（示例，以 T-102 为例）：

> "项目是 Spring Boot 3 多模块微服务（见 English_AI/），遵循现有代码风格：Controller 返回 Result<T>、判题走 handler 策略链、AI 调用只经 ai-service 且无 Key 走 Mock。请实现 T-102 听力接口：新增 ListeningController，复用 ExerciseController 的选题/判题逻辑（module_type=4），DTO 与 api/exercise.ts 风格一致，提交答案后写 user_exercise_log 并调用 user-service 更新雷达 listening_score。完成后对照任务书验收标准自检。"

**红线提醒（喂 AI 前必读）**：
1. 禁止改库名/端口/JWT 密钥（已固化）；新表走增量 `sql/07-*.sql`。
2. 禁止新增未规划技术栈（Nacos/Redis/Feign 等一律不引入）。
3. 禁止在 yml 写任何密钥；一律 `${ENV}`。
4. 每个任务交付前跑 `mvn compile` / `npm run type-check` + 对照验收标准。
5. 引用的任何接口/表/字段必须存在于本任务书或代码中——**发现任务书与代码冲突时，以代码为准并回写标注**（反幻觉原则）。

---

*本任务书所有"依据"均来自最新仓库源码核验：`sql/*.sql`、各 Controller/Service 接口、`frontend/src/api/exercise.ts`、`kown/数据库结构.txt`、`页面/*.html` 原型、`参考图片/*.jpg` 设计稿。听力/翻译/写作为当前未实现、但**数据库与设计文档已明确预留**的方向，任务拆解满足"目标清晰、可验收、可实现"。*
