# Recall·睿考 后续开发任务书（Backlog / 喂给 AI 的编程任务单）

**版本**：V1.0　|　**基线**：`mman91359-rgb-English-AI-learning` 最新提交　|　**用途**：把"还没做 + 待优化"的目标拆成**可直接执行的开发任务**，按优先级排期，可直接投喂给 AI 编程工具（或人工作为检查单）

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

### T-001　吊销并移除明文 AI API Key
- **为什么**：ai-service `application.yml` 默认值写死了真实百炼 Key（`sk-ws-H.PYHPHIM...`，本仓库已二次泄露）。这是最高危项。
- **做什么**：① 去阿里云百炼控制台吊销该 Key 并换新；② 删除 yml 中默认值，只保留 `${DASHSCOPE_API_KEY}`；③ 本机/IDEA 环境变量注入。
- **验收**：`git grep "sk-"` 仓库内零命中；无 Key 启动走 Mock 降级（代码已支持）。
- **涉及**：`ai-service/src/main/resources/application.yml`。

### T-002　归档并废止 `sql/init/01-基础建表.sql`（单库脚本）
- **为什么**：该脚本是 english_ai 单库 6 表旧版，与当前三库 9 表代码**实体不匹配**，已被你本地误跑过（Navicat 截图），继续存在会导致再次建错库。
- **做什么**：移入 `sql/_archive/` 或删除；`README` 明确唯一建库路径 = `user_db.sql → exercise_db.sql → learning_db.sql`。
- **验收**：`sql/` 根目录不再有单库脚本；README 写入建库顺序。

### T-003　后端全局异常处理器收敛
- **为什么**：Controller 内散落 try-catch（`AiController`/判题链均有），错误码不统一，AI 编程易复制坏味道。
- **做什么**：新增 `common/exception/GlobalExceptionHandler`（`@RestControllerAdvice`），统一 `Result.fail(code,msg)`；业务异常用自定义 `BusinessException`。
- **验收**：全部 Controller 删除 try-catch，仅保留领域逻辑；错误统一 JSON。
- **涉及**：`common/` + 各 service Controller。

### T-004　Long → String 序列化（前端 Number 精度）
- **为什么**：`userId/questionId` 为 Long，超过 JS 安全整数后前端失真（当前量级未触发，但 AI 生成新表 ID 会踩坑）。
- **做什么**：新增 `JacksonConfig`，Long/长整型统一序列化为字符串；前端类型 `string | number`。
- **验收**：`/exercise/history/{userId}` 返回的 id 为字符串；前端页面正常。

### T-005　JWT 默认密钥启动校验
- **为什么**：默认密钥 `EnglishAI-Local-Dev-JWT-Secret-Key-Change-Me-32-Bytes` 人人可知，生产必炸。
- **做什么**：启动时校验 `JWT_SECRET` 环境变量，未设置且非 dev profile 则拒绝启动（或强制随机生成并告警）。
- **验收**：本地开发不受影响；部署需显式提供密钥。

### T-006　`question_pending` 审核流补充（可选，P0.5）
- **为什么**：`AdminQuestions.vue` 的"驳回"只存 comment，无状态回滚校验。
- **做什么**：审核接口增加状态机校验（仅 PENDING 可 approve/reject；重复操作返回 409）。
- **验收**：对已审核题重复操作返回 409。

---

## Sprint 1 —— 听力模块 MVP（当前迭代核心）

> **依据**：数据库已预留 `user_ability_radar.listening_score`；`module_type=4` 为听力；前端 `HomeView.moduleNames` 已含 `4:'听力'`；`recall-frontend-prompt.md` 设计了 `/listening` 路由与 `AudioPlayer` 组件；`参考图片/` 有听力学习标签界面设计稿。

### T-101　听力题库表结构
- **做什么**：`exercise_db.sql` 新增 `listening_audio`（音频元数据：id/title/level/audio_url/transcript/duration_seconds/created_at）与 `listening_question`（音频+题目关联：id/audio_id/question_text/options/correct_answer/analysis/difficulty）。`question_info` 现有 `module_type` 可复用，新题 `module_type=4`。
- **验收**：DDL 幂等（`IF NOT EXISTS`），提供种子数据 2~3 条（可用本地 mp3 占位 URL）。
- **涉及**：`sql/exercise_db.sql`（或新增 `sql/07-listening.sql`）。

### T-102　听力接口（exercise-service）
- **做什么**：新增 `ListeningController`（前缀 `/exercise/listening`）：
  - `GET /exercise/listening/list?level=&difficulty=` 分页列表
  - `GET /exercise/listening/{id}` 详情（含音频 URL）
  - `POST /exercise/listening/submit` 提交听力答案（复用现有判题链 `JudgmentEngine`，题型挂 `module_type=4`）
  - `GET /exercise/listening/stats/{userId}` 听力正确率
- **验收**：接口返回 `Result<T>`；提交后写入 `user_exercise_log`（module_type=4）并同步更新 `user_ability_radar.listening_score`（ELO 公式复用）。
- **依赖**：T-003/T-004 完成。

### T-103　听力前端页面
- **做什么**：新增 `views/ListeningView.vue`，路由 `/listening`（requiresAuth）：
  - 列表页：音频卡片（标题/等级/时长/难度）
  - 详情页：内嵌播放器（复用 M3 风格，可先用原生 `<audio>` + Material Symbols 播放按钮，后续抽 `AudioPlayer.vue` 组件）+ 题目作答 + 判分结果展示（复用 PracticeView 的结果组件）
- **验收**：可完整走通"选听力 → 播放 → 作答 → 判分 → 结果/错题入库"；无 `el-*` 组件，符合设计令牌。
- **依赖**：T-101/T-102；`页面/听力学习标签界面` 原型为视觉参照。

### T-104　听力雷达与统计打通
- **做什么**：`StatsView` 雷达图增加听力维度（后端 `/user/radar/{userId}` 已含 listening_score 字段，前端渲染补齐）；`HomeView` 学习量柱状图听力维度。
- **验收**：雷达图出现听力维度且数值随听力答题更新。

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
  - 数据：`sql/07-writing.sql` 新增写作题库（`question_type='WRITING'`，module_type 沿用 2 或独立 5，**以 5=写作 隔离**，避免与语法混淆——需同步 HomeView moduleNames 增加 `5:'写作'`）。
  - 后端：`POST /exercise/writing/submit` 提交作文 → 调 `/ai/score`（scoreType=writing, SSE）→ 落库 `user_exercise_log` + 错题本；`GET /exercise/writing/history/{userId}` 历史作文与得分。
  - 前端：`views/WritingView.vue`，路由 `/writing`：题目展示 → 文本编辑器（计时器 TimerCountdown 参照 recall prompt）→ 提交 → SSE 流式显示分项得分（内容/结构/语言）+ AI 建议。
- **验收**：作文可提交、AI 评分流式输出、历史可回看；错题本/统计同步。
- **依赖**：T-003/T-004；AiSidebar SSE 渲染复用。

---

## Sprint 3 —— 体验与工程化增强

### T-301　暗色主题落地
- **做什么**：按 `页面/黑夜版/` 原型补全 `tailwind.config` dark 令牌（`dark:bg-inverse-surface` 等），`TopAppBar` 主题切换持久化到 localStorage。
- **验收**：切换主题全站生效，无写死亮色。

### T-302　路由懒加载 + 组件级错误边界
- **做什么**：16 个视图改 `() => import()`；大视图（VocabQuiz/GrammarQuiz 40KB+）单独分包。
- **验收**：`npm run build` 产物分块；首屏白屏无。

### T-303　AI 侧边栏 SSE 健壮性
- **做什么**：AiSidebarContent 增加断线重试、加载态、字数节流；对话上下文长度裁剪。
- **验收**：断网重连不丢已渲染内容；长对话响应流畅。

### T-304　图表组件沉淀
- **做什么**：将雷达图/柱状图/热力图封装为 `ChartRadar.vue / ChartBar.vue / ChartHeatmap.vue`，替换 StatsView 内联 ECharts。
- **验收**：三个图表组件可参数化复用。

### T-305　单元测试
- **做什么**：为纯函数补测试——`EbbinghausUtil`（遗忘曲线梯度）、ELO 更新公式、`JudgmentEngine`（L1/L2 判题样例）、`JwtUtil`。
- **验收**：`mvn test` 全绿，覆盖率报告中核心算法覆盖 >60%。

### T-306　Docker 化（可展示）
- **做什么**：Dockerfile（后端 5 服务 + 网关）与 `docker-compose.yml`（mysql8 + 5 服务 + 可选 rabbitmq），环境变量统一 `.env`。
- **验收**：`docker compose up` 一键起全套，前端代理指向容器网关。
- **注意**：T-001（Key 环境变量）必须先行，否则镜像内仍含明文 Key。

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
