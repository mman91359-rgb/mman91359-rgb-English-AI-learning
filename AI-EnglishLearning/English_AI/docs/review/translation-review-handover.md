---
status: active
updated: 2026-11-21
---

# 段落翻译判题兜底 —— 交接文档

- 版本：2026-11-11（对应 Flyway `V1.0.46`，代码提交 `b5dcb6c`）
- 读者：接手本模块的开发者 / AI agent
- 性质：**只读交接**。读完本文即可理解链路、现状、坑点与待办，无需翻阅历史对话

---

## 30 秒摘要

段落翻译原本只做**逐字归一化比对**，语义正确但措辞不同的译文一律判错（62 道段落题 100% 复现）。
现在改为：**AI 按 CET 15 分制评分 → 按档位判定 → 灰区（7~8 分）判对并进人工复核队列 → 复核结论确定后一次性补记 ELO / 遗忘曲线**。

当前 **默认 `shadow` 模式**：AI 只打分写日志，**不改变判分结果**，用于攒样本标定阈值。
**未完成上线门禁前，禁止把 `judgment.translation.ai-mode` 改成 `enforce`。**

---

## 1. 模块定位

### 1.1 解决的核心问题

`JudgmentEngineImpl.judgeTranslation` 的段落分支（`isPassage = stem.length() > 40`）原实现是：

```java
// 段落翻译：仅本地归一化比对，不走 AI 兜底
if (isPassage) { return MISMATCH; }
```

而归一化只做「全角转半角 → 折叠空白 → 小写 → 剥首尾标点」，**逐字相等才算对**。
结果是 62 道段落题上，学生写出语义正确的译文也会被判错——不是抽样误差，是 100% 复现的判定缺陷。

### 1.2 模块价值

- 用 AI 评分替代字面匹配，判分口径贴近真实考试（CET 翻译 15 分制五档）；
- 灰区交给人工复核，避免"AI 一家说了算"；
- 成本可控：只有**段落翻译**（62 道题）走 AI，填空题/选择题/短句翻译链路完全不变。

---

## 2. 当前运行状态

### 2.1 运行模式

| 项 | 值 | 说明 |
|---|---|---|
| `judgment.translation.ai-mode` | **`shadow`**（默认） | AI 照常打分并写日志，**判分结果保持改造前行为（MISMATCH）** |
| `pass-score` | `9` | ≥9 判对 |
| `review-score` | `7` | 7~8 灰区：判对 + 入队 |
| `max-score` | `15` | 归一化标尺（CET 15 分制） |

### 2.2 已上线能力

- AI 段落评分端点 `POST /ai/translate-score`（15 分制、temperature 0.2）；
- 分数归一化（任意分母折算到 15 制）；
- 灰区产出 `reviewDraft`，由提交链路在答题日志插入后异步入队（带 `log_id`）；
- 复核接口三件套：`/internal/judge/review`（入队）、`/review/resolve`（结论落地）、`/review/rescore`（补记重试）；
- 补记租约 + 定时重试任务（`ReviewScoringRetryTask`，每 10 分钟）；
- 灰区提交跳过 ELO / 遗忘曲线（含 MQ 事件）。

### 2.3 未启用 / 未验证

| 项 | 状态 |
|---|---|
| `enforce` 模式 | **未启用**，等标定 |
| MQ 守卫实机验证 | **未验证**（本地 `spring.rabbitmq.enabled=false`，`RabbitTemplate` Bean 不存在） |
| 复核后台（列表 / 批量） | 未做，队列只能靠 SQL 看 |
| 答题记录"复核后改判"标记 | 未做 |
| 人工审核出队 UI | 未做 |

---

## 3. 完整数据流

```
用户提交（moduleType=3）
  └─ ExerciseServiceImpl.submitAnswer
       └─ stem.length() > 40 → JudgmentEngineImpl.judgeTranslation(isPassage=true)
            ├─ 空答案 → EMPTY
            ├─ 与参考译文/accepted 归一化后完全相等 → 判对（L1 / SEMANTIC）
            └─ judgePassageTranslation
                 ├─ TranslationScoreClient.score()  POST {service.ai.url}/ai/translate-score
                 │    └─ ai-service AiService.scoreTranslation → DashScope（temperature 0.2）
                 ├─ 分数归一化：scaled = round(raw × max-score / maxRawScore)，钳制 [0,15]
                 ├─ shadow → 仅写日志，返回 MISMATCH
                 └─ enforce → ≥9 判对 ／ 7~8 判对 + reviewDraft ／ ≤6 判错
       └─ 事务：insert user_exercise_log（回填 logId）+ 错题本增删
       └─ applyLearningSideEffects
            ├─ 有 reviewDraft 且 logId 非空 → 构建入队请求 → JudgeReviewAsyncWriter（异步）
            │    └─ JudgeReviewQueueService.enqueue → INSERT IGNORE（唯一键 log_id）
            │    ⚠ 此时【不】写 ELO、【不】写遗忘曲线
            └─ 无 reviewDraft → 原有 update-curve + update-elo
       └─ publishCompletedEvent（MQ）
            ⚠ reviewDraft 非空时直接 return，不发事件

人工复核
  └─ POST /internal/judge/review/resolve {reviewId, verdict: PASS|FAIL, comment, reviewerId}
       ├─ 条件更新 status: PENDING → REVIEWED（抢不到则返回 false）
       ├─ 无绑定 log_id（或绑定的作答已被清理）→ 改判/错题本/补记全部跳过
       ├─ FAIL 且作答本是对的 → 按 log_id 把该次作答改成 0 + 写回错题本
       └─ afterCommit → ensureCurve / ensureElo（结论以改判后的 log.is_correct 为准）
            ├─ claim 租约（5 分钟）→ 发 HTTP → 成功写完成时间 / 失败释放租约
            └─ 失败由 ReviewScoringRetryTask 每 10 分钟重试（或手动 /review/rescore）
```

---

## 4. 核心协议（**必须遵守，勿重踩**）

1. **判分规则（CET 15 分制五档）**：`≥9` 判对；`7~8` 灰区判对并入队；`≤6` 判错。
   分数先归一化到 `max-score`（默认 15）再比档位——模型若返回百分制（80/100），必须先折算成 12/15。
2. **灰区计分规则**：灰区提交**不写 ELO、不推进遗忘曲线、不发 MQ 事件**。原因：ELO 是增量模型，先加后减不对称；曲线间隔阶梯不可逆。复核结论确定后由 `resolve` **一次性补记**。
3. **补记租约机制**：完成时间与租约分列——
   - `curve_scored_at` / `elo_scored_at` 非空 = **已完成，永不再补**；
   - `curve_lease_until` / `elo_lease_until` 未到期 = **别的实例正在补，别抢**；
   - 协议：`claimLease`（未完成 + 无有效租约）→ 发 HTTP → 成功 `markDone`（写完成时间 + 清租约）/ 失败 `releaseLease`；
   - **所有时间比较用 DB 的 `NOW()`**，不要用 JVM 时钟。
4. **队列绑定规则**：按 `log_id`（`user_exercise_log` 主键）精确绑定单次作答。复核改判只影响那条记录；`log_id` 为空的历史行**不猜"最近一条"**，只记 warn 并跳过。
5. **数据一致性约定**：`accepted_answers` **只增不减**；删除仅允许"规则判定 + 人工复核 + 白名单"的定向摘除（详见 `docs/数据库迁移规范.md` 2.4-E）。

---

## 5. 数据库说明

### 5.1 `judge_review_queue` 字段

| 字段 | 类型 | 语义 |
|---|---|---|
| `id` | bigint PK | 主键 |
| `question_id` | bigint | 题目 ID |
| `user_id` | bigint | 用户 ID |
| `log_id` | bigint NULL | **绑定的答题记录**（`user_exercise_log.id`），唯一键 |
| `difficulty_level` | int NULL | 题目难度，复核后补记 ELO 用 |
| `module_type` | int NULL | 模块类型，复核后补记遗忘曲线用 |
| `user_answer` | varchar(2000) | 用户作答原文（段落译文较长，V1.0.42 放宽） |
| `answer_hash` | char(64) 生成列 | `SHA2(user_answer,256) STORED`，仅用于历史唯一键，现不参与 |
| `correct_answer` | varchar(2000) | 参考答案 |
| `matched_level` | int | 判题命中层级（见 `JudgmentLevel`） |
| `ai_confidence` | decimal(4,3) | AI 评分归一化 0~1（如 7/15 → `0.467`） |
| `ai_result` | varchar(20) | `CORRECT` / `PARTIAL` / `INCORRECT` |
| `judge_context` | varchar(1000) | 判题上下文快照（`mode=…;raw=…;scaled=…;level=…;elapsedMs=…;traceId=…`） |
| `reason` | varchar(50) | `MANUAL` / `MISMATCH` / `AI_LOW_CONFIDENCE` / **`TRANSLATION_LOW_SCORE`** |
| `status` | varchar(20) | `PENDING` / `REVIEWED` / `DISMISSED` |
| `reviewer_id` / `review_comment` | bigint / varchar(500) | 审核人与意见 |
| `curve_scored_at` | datetime NULL | 遗忘曲线**补记完成**时间 |
| `curve_lease_until` | datetime NULL | 遗忘曲线补记**租约到期**时间 |
| `elo_scored_at` | datetime NULL | ELO 补记完成时间 |
| `elo_lease_until` | datetime NULL | ELO 补记租约到期时间 |
| `created_at` / `updated_at` | datetime | 时间戳 |

### 5.2 索引

| 名称 | 列 | 用途 |
|---|---|---|
| `PRIMARY` | `id` | 主键 |
| `uk_review_log` | `log_id` | **按作答去重**（V1.0.44 起），一次作答一行 |
| `idx_status_created` | `status, created_at` | 复核列表按状态+时间 |
| `idx_question` | `question_id` | 按题查复核 |
| `idx_question_user` | `question_id, user_id` | 按题+用户查 |

> `log_id` 可空，MySQL 唯一键允许多个 NULL，因此手工入队（无 log_id）不受去重约束。

### 5.3 迁移演进

| 版本 | 做了什么 | 为什么 |
|---|---|---|
| V1.0.27 | 建表（`uk_question_user_answer` 唯一键） | 能力预留 |
| V1.0.41 | 加 `ai_confidence` / `ai_result` / `judge_context` | 灰区需要记录 AI 分数与结论 |
| V1.0.42 | `user_answer`/`correct_answer` 放宽到 2000；唯一键改用生成列 `answer_hash` | 段落译文 600~900 字符；长列直接进唯一键触发 InnoDB 3072 字节上限 |
| V1.0.43 | 加 `log_id` / `difficulty_level` / `module_type`；修正表与 `reason` 注释 | 改判精确到单次作答；补记需要难度/模块 |
| V1.0.44 | 唯一键改为 `uk_review_log(log_id)` | 按答案去重会把重复提交吞掉，那条作答永久不计分 |
| V1.0.45 | 加 `curve_scored_at` / `elo_scored_at` | 补记失败需要可重试 |
| V1.0.46 | 加 `curve_lease_until` / `elo_lease_until` | 完成时间与"进行中"必须分开，否则成功的记录会被反复补记 |

---

## 6. 配置项清单

### 6.1 exercise-service（`application.yml`）

| 配置 | 默认值 | 含义 | 可调范围 |
|---|---|---|---|
| `judgment.translation.ai-mode` | `shadow` | `shadow` 只打分；`enforce` 按档位判定 | 仅这两个值 |
| `judgment.translation.pass-score` | `9` | ≥ 判对 | 0~max-score |
| `judgment.translation.review-score` | `7` | ≥ 进灰区（判对 + 入队） | 0~pass-score |
| `judgment.translation.max-score` | `15` | 归一化分母 | 建议固定 15 |
| `judgment.mismatch.reveal-answer` | `true` | accepted 非空错答时是否直接给答案 | 布尔 |
| `judgment.accepted-cache.enabled` | `false` | accepted 解析缓存 | 布尔 |
| `judgment.accepted-cache.ttl-seconds` | `60` | 缓存 TTL | 正整数 |
| `judgment.accepted-cache.max-size` | `2000` | 缓存上限 | 正整数 |
| `service.ai.url` | `http://localhost:8084` | ai-service 地址 | 环境变量 `AI_SERVICE_URL` |
| `service.user.url` | `http://localhost:8081` | 补记 ELO 用 | `USER_SERVICE_URL` |
| `service.learning-engine.url` | `http://localhost:8083` | 补记曲线用 | `LEARNING_SERVICE_URL` |
| `app.internal.token` | `local-dev-internal-token` | `/internal/**` 鉴权 | 生产必须设置 `INTERNAL_TOKEN` |
| `spring.rabbitmq.enabled` | `false` | MQ 开关（本地关闭） | 生产开启前需过门禁 |

### 6.2 代码内常量（非 yml）

| 常量 | 值 | 位置 | 说明 |
|---|---|---|---|
| 评分 HTTP 超时 | connect 2s / read 8s | `RestTemplateConfig#translationScoreRestTemplate` | 评分专用，超时回落 `AI_UNAVAILABLE` |
| 补记 HTTP 超时 | connect 1s / read 2s | `RestTemplateConfig#auditRestTemplate` | `resolve` 补记专用 |
| 补记租约 | 5 分钟 | Mapper SQL（`INTERVAL 5 MINUTE`） | **与 `ReviewScoringRetryTask` 的 10 分钟间隔配套**，改一处要两处一起看 |
| 队列容量 | 200，单线程 | `JudgeReviewAsyncWriter` | 满时丢弃并 `log.error` + 累加 `dropped` |
| 重试批量 | 50 条 / 10 分钟 | `ReviewScoringRetryTask` | 首次延迟 2 分钟 |

### 6.3 ai-service（`application.yml`）

| 配置 | 默认值 | 说明 |
|---|---|---|
| `dashscope.api-key` | 无默认（必填） | `DASHSCOPE_API_KEY` |
| `dashscope.model` | `qwen-plus` | `DASHSCOPE_MODEL` |
| `dashscope.temperature` | `0.7` | 全局默认；**评分调用另用 0.2**（`buildRequestBodySync(messages, 0.2)`） |
| `dashscope.max-tokens` | `1500` | — |

---

## 7. 上线门禁（切 `enforce` 前必须完成）

### 门禁 1：MQ 链路实机验证（**当前最大未验证项**）

本地 `spring.rabbitmq.enabled=false`，`RabbitTemplate` Bean 不存在，代码只能走到 `if (rabbitTemplate == null) return`，MQ 守卫**从未真跑过**。

在有 RabbitMQ 的环境：

```bash
# 1. 开启 MQ + enforce 起 exercise-service
SPRING_RABBITMQ_ENABLED=true JUDGMENT_TRANSLATION_AI_MODE=enforce \
  scripts/with-env.sh scripts/mvn.sh -pl exercise-service spring-boot:run

# 2. 提交 1 条灰区（practiceOnly=false），记下 traceId
# 3. 断言 A：ExerciseCompletedConsumer 日志中没有该 traceId
# 4. 断言 B：user_memory_curve 该 user+question 无新行
# 5. POST /internal/judge/review/resolve  verdict=FAIL
# 6. 断言 C：user_memory_curve 只新增 1 行（不是 2 行）
# 7. 断言 D：user_ability_radar.elo_score 只降一次（5 分，不是 10 分）
```

### 门禁 2：shadow 样本标定

- 累计 **≥30 条**真实段落翻译提交日志（`grep "翻译评分"`，字段 `raw/scaled/level/elapsedMs`）；
- 人工分三类标注：达标 / 达意有瑕疵 / 错译，**单列"机翻/直译"类别**；
- 按分布校准 `pass-score` / `review-score`。

> 已知观察：机翻样本拿到 7/15（灰区下沿）。**不要因为"机翻也拿 7 分"就抬阈值**——7 分语义是"达意但表达差"，抬到 8 会误伤真实学生并连带灌错题本、扣 ELO。区分机翻应靠行为信号（作答时长/粘贴），不是分数。

### 门禁 3：核心链路回归

完整走一遍：灰区入队 → `resolve FAIL` → 按 `log_id` 改判 → 错题本 → 补记 ELO/曲线；再走一遍 `PASS`；再验证 `rescore` 在补记失败后能补上。

参考 2026-11-11 已做过的 enforce 冒烟（userId=9 / Q506）：

| 检查 | 期望 |
|---|---|
| 灰区提交 | `isCorrect=true`、hint 含"已提交人工复核" |
| 重复提交同一译文 | 产生 2 条 log + 2 条队列行（不被唯一键吞） |
| 队列字段 | `log_id` 精确、`difficulty_level=5`、`module_type=3`、`ai_confidence=0.467` |
| 灰区计分 | ELO 不变、无曲线、无错题本 |
| resolve FAIL | 只改绑定 log；错题本 +1；ELO 下降；曲线 +1 行 |

---

## 8. 历史踩坑

### 8.1 百分制分数直接比阈值 → 全量判对

- **现象**：模型返回 `rawScore=80, maxRawScore=100`，`80 ≥ 9` 直接判对。
- **根因**：阈值 9/7 的前提是分母恒为 15，代码未强制。
- **方案**：引擎侧归一化 `scaled = round(raw × max-score / maxRawScore)`，钳制到 `[0, max-score]`。
- **防回归**：单测 `passageScoreIsNormalizedToConfiguredScale`。

### 8.2 V1.0.42 首次迁移失败：索引 3072 字节上限

- **现象**：`MODIFY user_answer VARCHAR(2000)` 报 `ERROR 1071 Specified key was too long`。
- **根因**：该列在唯一键里，utf8mb4 下 2000×4=8000 字节 > InnoDB 3072。
- **方案**：唯一键改用生成列 `answer_hash CHAR(64) = SHA2(user_answer,256)`；两条库的 `success=0` 历史行用 `flyway repair` 清除后重跑。
- **防回归**：迁移规范写明"放宽长度前先看该列是否参与索引"。

### 8.3 灰区仍发 MQ 事件 → 遗忘曲线记两次

- **现象**：图形上灰区提交后被 MQ 记一次"记住"，复核 PASS 再补一次 → 阶梯推两级。
- **根因**：`applyLearningSideEffects` 跳过了同步 curve/elo，但下面的 `rabbitTemplate.convertAndSend` 照发；`ExerciseCompletedConsumer` 无条件 `updateCurve`。本地关闭 MQ 时完全不可见。
- **方案**：抽出 `publishCompletedEvent`，`reviewDraft != null` 直接 return。
- **防回归**：单测覆盖"draft 非空不发事件"。

### 8.4 唯一键按答案去重 → 重复提交永久漏分

- **现象**：同一译文提交两次，第二次 `INSERT IGNORE` 返回 0，既不入队也永远不计分。
- **根因**：`uk_question_user_answer(question_id,user_id,answer_hash)` 与灰区"提交时不计分"叠加。
- **方案**：V1.0.44 改为 `uk_review_log(log_id)`，一次作答一行。

### 8.5 复核改判按"最近一条" → 改错记录

- **现象**：用户重做该题后复核旧记录，被改的是新记录。
- **根因**：入队在判题引擎内，此时答题日志还没插入，队列里没有作答标识。
- **方案**：入队挪到 `ExerciseServiceImpl`（log 插入、主键回填之后），队列存 `log_id`；`log_id` 为空时只 warn、不猜。

### 8.6 单列 `scored_at` 冒充租约 → 每 10 分钟重复补记

- **现象**：成功补记的记录，5 分钟后被扫描判成"过期未做"，重新发 HTTP；曲线每 10 分钟推一级、ELO 反复重算。
- **根因**：同一列同时承载"正在做（抢占时刻）"和"已完成"，两种语义要求的过期判断相反。成功时不刷新标记，标记永远停在抢占时刻。
- **方案**：V1.0.46 拆成 `*_scored_at`（完成）与 `*_lease_until`（进行中）；成功写完成时间并清租约。
- **防回归**：单测 `completedCurveIsNeverReclaimed`（10 分钟前完成的记录零补记）+ 实机 SQL 造数验证。

### 8.7 JVM 时钟 vs DB `NOW()`

- **现象**：云主机为 UTC、JDBC 带 `Asia/Shanghai` 时，两边差 8 小时，标记"瞬间过期"。
- **方案**：所有租约/完成判断全部下推到 SQL，用 `NOW()` 比较；Java 侧删除 `isFresh()`。

---

## 9. 后续迭代 Roadmap

### 高优先级（切 enforce 前必须完成）

| 项 | 目标 | 前置 | 验收 |
|---|---|---|---|
| MQ 实机验证 | 证明灰区不会重复推动学习数据 | 有 RabbitMQ 的环境 | 门禁 1 的四条断言全过 |
| shadow 标定与阈值校准 | 让 9/7 有真实样本支撑 | 累计 ≥30 条样本 | 出具分布报告 + 标注结论；阈值调整有依据 |

### 中优先级

| 项 | 目标 | 前置 | 验收 |
|---|---|---|---|
| 复核后台列表页 | PENDING 能被清掉（否则灰区兜底形同虚设） | 复用一个管理端页面骨架 | 列表筛选 `status/reason`、单条 resolve、批量 PASS/FAIL |
| 答题记录"复核后改判"标记 | 解释"昨天说对、今天变错" | 复核后台落地 | `user_exercise_log` 增加标记或关联查询，前端可展示 |
| 评分 prompt 优化 | 提高分数稳定性与区分度 | 标定数据 | 同一译文重复评分方差 ≤1 分；机翻/达标样本分数可区分 |

### 低优先级

| 项 | 目标 | 前置 | 验收 |
|---|---|---|---|
| 模型分层降本 | 简单样本用小模型 | 标定证明分数相关性 | 成本下降且分布偏移可接受 |
| 批量复核 | 运营效率 | 复核后台 | 支持一次处理 N 条，幂等 |
| 统计看板 | 看灰区量、复核通过率、补记失败率 | 埋点/表数据 | 看板可查近 7/30 天 |

---

## 附录：关键代码索引

| 关注点 | 位置 |
|---|---|
| 段落分支判定 | `exercise-service/.../service/impl/JudgmentEngineImpl.java` → `judgePassageTranslation` |
| 评分客户端 | `exercise-service/.../client/TranslationScoreClient.java` |
| AI 评分实现 | `ai-service/.../service/AiService.java` → `scoreTranslation` / `parseTranslationScore` |
| 提交链路分流 | `exercise-service/.../service/impl/ExerciseServiceImpl.java` → `applyLearningSideEffects` / `publishCompletedEvent` |
| 队列实现 | `.../service/impl/JudgeReviewQueueServiceImpl.java`（`enqueue` / `resolve` / `rescore`） |
| 队列 SQL | `.../mapper/JudgeReviewQueueMapper.java` |
| 异步写入 | `.../service/impl/JudgeReviewAsyncWriter.java` |
| 补记重试 | `.../schedule/ReviewScoringRetryTask.java` |
| 内部接口 | `.../controller/InternalJudgeReviewController.java` |
| 迁移 | `exercise-service/src/main/resources/db/migration/V1.0.27、41~46` |
| 配置 | `exercise-service/src/main/resources/application.yml` → `judgment.translation.*` |

---

*本文与代码同步于 2026-11-11，基线 `V1.0.46`。若代码有变更，请同步更新本文与 `CLAUDE.md` 第九轮记录。*
