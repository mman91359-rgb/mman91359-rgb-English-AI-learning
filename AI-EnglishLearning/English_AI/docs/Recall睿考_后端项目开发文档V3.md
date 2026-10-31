# Recall·睿考 后端项目开发文档（V3）

**版本**：V3.1（2026-10-31 按代码事实校准）　|　**基线**：`mman91359-rgb-English-AI-learning` 仓库 `AI-EnglishLearning/English_AI/` 最新提交代码事实　|　**适用阶段**：听力 MVP 已完成，翻译/写作未开始

> **V3.1 校准摘要**：module_type 统一为 1词汇 2语法 3翻译 4听力 5造句 6写作；雷达维度 3→阅读、4→听力、6→无；ELO 初始值以代码 1000 为准；SRS 间隔以 `EbbinghausUtil` 的 1/2/4/7/15/30 为准；T-001/T-002/T-005 已完成，T-003 部分完成，T-004 暂缓，T-006 待做；听力采用"复用题库 + listening_audio"模型。

---

## 0. 文档声明（先读）

本文档全部技术判断**均来自对最新仓库源码的逐文件核验**（pom.xml、application.yml、Controller/Service/Entity、sql 脚本、frontend/package.json），不是对历史设计文档的照搬。本版（V3）相比 V2 的关键修订：

1. **整合《项目设计文档》增量补丁**：智能推题多维度策略（§6.4）、JSON 虚拟列 + 索引（§5.6）、知识点字典表（§5.7）、错误码规范（§7.1）、内部服务调用规范（§7.7）、AI 内容安全（§8.4）、P0 安全整改（§8.5）、双账号端到端验收（§9.3）、风险矩阵（§9.4）。
2. **技术栈表述修正**：~~注册配置中心：Nacos~~ —— 代码事实为 **user-service 的 application.yml 有 Nacos discovery 配置但 pom 无依赖，服务发现未生效（死配置）**；网关为静态路由 + 服务间环境变量 URL 直连。本文档一律按此表述。
3. **剔除游戏化**：成就体系、徽章、排行榜、分享卡片等游戏化内容**全部移除**，不在本文档任何章节（含路线图）出现。产品聚焦"背单词 → 练题 → AI 判分 → 遗忘曲线复习 → 错题巩固"的学习闭环。
4. 听力/翻译/写作模块：数据库结构已预留（`user_ability_radar.listening_score`、`question_info.question_type` 含 TRANSLATION/WRITING、`module_type` 4=听力），**后端接口尚未开发**，开发计划见独立《后续开发任务书（Backlog）》。

---

## 1. 项目概述

### 1.1 项目简介
"Recall·睿考"是面向大学英语四六级考生的个性化 AI 学习系统。核心能力：**单词背诵、ELO 定级、智能出题、AI 判题与讲解、艾宾浩斯遗忘曲线复习、错题本、学习统计可视化**。

MVP 版本目标：保证"单词 + 习题 + AI 反馈 + 复习"闭环可稳定运行，支持双账号体系演示验收；听力、翻译、写作等扩展能力作为后续迭代，不纳入当前开发范围。

### 1.2 技术栈（代码事实）

| 技术 | 版本/说明 |
|---|---|
| JDK | Java 17 |
| Spring Boot | 3.2.0（spring-boot-starter-parent） |
| Spring Cloud | 2023.0.3（BOM 管理） |
| 网关 | Spring Cloud Gateway（WebFlux，静态路由） |
| ORM | MyBatis-Plus 3.5.5（mybatis-plus-spring-boot3-starter） |
| 数据库 | MySQL 8.0（本地 8.0.28） |
| JWT | JJWT 0.12.3（HS256） |
| 密码 | Spring Security Crypto BCrypt（work factor 12） |
| MQ | spring-boot-starter-amqp（**默认 disabled**，可选） |
| 服务间调用 | RestTemplate / 环境变量 URL 直连（**非 OpenFeign**） |
| AI | 阿里云百炼 DashScope，模型 qwen-plus，无 Key 自动 Mock 降级 |
| 服务注册发现 | **未启用**（yml 残留 Nacos 配置，pom 无依赖，死配置） |

### 1.3 架构定性
轻量微服务 =「Spring Cloud Gateway 静态路由 + 多模块 HTTP 直连 + 可选 MQ + 三库拆分」。**不是 Nacos/Feign 全家桶**。后续开发一律围绕这个真实形态，不引入未规划的中间件。

---

## 2. 现状基线

| 维度 | 事实（最新仓库核验） |
|---|---|
| 工程根 | `AI-EnglishLearning/English_AI/`（Maven 多模块） |
| Maven 模块 | 6 个：common / api-gateway / user-service / exercise-service / learning-engine-service / ai-service |
| 端口 | gateway **8086**、user **8081**、exercise **8082**、learning-engine **8083**、ai **8084** |
| 数据库 | 三库拆分：`user_db` / `exercise_db` / `learning_db`（yml 硬编码库名，环境变量可覆盖主机/端口） |
| 消息队列 | RabbitMQ 默认关闭（`spring.rabbitmq.enabled: false`）；开启时走 `exercise.exchange / exercise.complete.queue` |
| AI 接入 | 百炼 qwen-plus；无 Key 走 Mock 兜底 |
| JWT | 默认密钥 `EnglishAI-Local-Dev-JWT-Secret-Key-Change-Me-32-Bytes`（环境变量可覆盖） |
| 运行状态 | 用户本地已成功运行，IDEA 标红已解决 |

---

## 3. 工程结构与模块职责

```
English_AI/
├── pom.xml                          # 父 POM：Java17 + SB3.2.0 + SC2023.0.3 + MP3.5.5 + JJWT0.12.3
├── common/                          # 公共模块
│   ├── entity/Result.java           # 统一返回 {code,message,data,traceId}
│   ├── util/（JwtUtil / BCrypt 封装 / 常量）
├── api-gateway/                     # 8086：静态路由 + 全局 JWT 鉴权过滤器 + 白名单
├── user-service/                    # 8081：注册/登录/头像/改密/能力雷达（ELO）
├── exercise-service/                # 8082：题库/智能选题/三级判题/错题本/生词本/AI出题审核
├── learning-engine-service/         # 8083：艾宾浩斯遗忘曲线 + 复习任务
└── ai-service/                      # 8084：百炼调用（chat/score/judge/generate-questions）
```

---

## 4. 技术栈与版本锁定（唯一性声明）

| 技术 | 版本/说明 | 状态 |
|---|---|---|
| JDK | Java 17 | ✅ 锁定 |
| Spring Boot | 3.2.0 | ✅ 锁定 |
| Spring Cloud | 2023.0.3 | ✅ 锁定 |
| MyBatis-Plus | 3.5.5 | ✅ 锁定 |
| JJWT | 0.12.3 | ✅ 锁定 |
| MySQL | 8.0 | ✅ 锁定 |
| RabbitMQ | spring-boot-starter-amqp | ⚠️ 依赖存在，默认关闭 |
| 百炼 | qwen-plus | ✅ 使用中（无 Key Mock） |

**明确不引入（当前阶段）**：Nacos 依赖、OpenFeign、Redis、Sentinel、Seata、Spring AI 框架。若后续真要上 Nacos，须在 common 增加 `spring-cloud-starter-alibaba-nacos-discovery` 并改造网关路由为 `lb://`，属于中期工程决策，不在本阶段。

---

## 5. 数据库设计（三库）

### 5.1 三库总览与建库顺序
**唯一正确建库路径**：`user_db.sql → exercise_db.sql → learning_db.sql`。
> ⚠️ 仓库 `sql/init/01-基础建表.sql`（english_ai 单库 6 表）为**遗留脚本，与代码实体不匹配，勿用**；已列入 P0 归档整改（见 §8.5）。

| 库 | 核心表 | 归属服务 |
|---|---|---|
| user_db | sys_user、user_ability_radar | user-service |
| exercise_db | question_info、question_content、knowledge_mapping、sys_knowledge_point、user_exercise_log、user_error_book、user_favorite、user_vocabulary、word_dictionary、daily_word、question_pending 等 | exercise-service |
| learning_db | user_memory_curve | learning-engine-service |

### 5.2 user_db
- `sys_user`：id、username、password（BCrypt）、nickname、avatar_url、target_exam（CET4/CET6）、role、create_time、update_time、deleted。
- `user_ability_radar`：user_id、vocabulary_score、grammar_score、**listening_score（预留）**、**reading_score（预留）**、elo_rating、elo_level（BASIC/CET4/CET6）、updated_at。

### 5.3 exercise_db（关键表）
- `question_info`：id、module_type（1词汇/2语法/3翻译/4听力/5造句/6写作）、question_type（CHOICE/FILL_BLANK/SENTENCE_MAKING/TRANSLATION/WRITING）、difficulty_level（1~8）、target_level（BASIC/CET4/CET6）、knowledge_point_id、elo_difficulty、is_deleted、status。
- `listening_audio`：id、question_id（唯一）、audio_url、transcript、duration_seconds、created_at、updated_at；题目正文仍存 `question_content`，本表只补充音频元数据。
- `question_content`：question_id、stem、options（JSON）、correct_answer（JSON）、hint、analysis、**answer_json**（判题用 JSON，含 `ans` 键）。
- `knowledge_mapping`：question_id ↔ knowledge_point_id（多对多）。
- `sys_knowledge_point`：知识点字典（见 §5.7）。
- `user_exercise_log`：user_id、question_id、is_correct、user_answer、correct_answer、analysis、trace_id、module_type、create_time（**含 (user_id, create_time) 索引，支撑 7 天去重**）。
- `user_error_book`：user_id、question_id、error_count、last_error_time（**支撑薄弱点统计**）。
- `user_vocabulary` / `word_dictionary` / `daily_word`：生词本三件套。
- `question_pending`：AI 出题待审核队列（status：PENDING/APPROVED/REJECTED、review_comment）。

### 5.4 learning_db
- `user_memory_curve`：user_id、word_id/question_id、review_stage、next_review_at、review_count、last_review_at（支撑艾宾浩斯调度）。

### 5.5 索引设计要点
- 所有外键逻辑字段建索引（user_id、question_id、knowledge_point_id）。
- `user_exercise_log(user_id, create_time)` 联合索引：支撑"近 7 天去重 + 历史分页"。
- `user_error_book(user_id, error_count)` 联合索引：支撑薄弱点 TopN。
- `question_info(module_type, target_level, difficulty_level)` 联合索引：支撑智能选题主查询。

### 5.6 性能优化：虚拟列规避 JSON 查询陷阱
**问题**：`question_content.answer_json` 为 JSON 字段，若直接 `WHERE JSON_EXTRACT(answer_json, '$.ans') = 'B'` 查询，MySQL 放弃索引触发全表扫描，题库十万级时性能崩塌。

**方案**：MySQL 8.0 虚拟列（Generated Column）+ B+ 树索引：
```sql
ALTER TABLE question_content
ADD COLUMN specific_answer VARCHAR(50)
    GENERATED ALWAYS AS (answer_json->>'$.ans') VIRTUAL;
ALTER TABLE question_content
ADD INDEX idx_specific_answer (specific_answer);
```
**收益**：保留 JSON 灵活性，获得关系型同等的索引查询性能。属于数据库架构设计亮点，可用于实训报告/答辩。

### 5.7 知识点字典表
表：`sys_knowledge_point`（exercise_db，只读字典）

| 字段 | 类型 | 说明 |
|---|---|---|
| id | BIGINT PK | 知识点 ID |
| module_type | TINYINT | 1-词汇 / 2-语法 |
| name | VARCHAR(100) | 知识点名称（如：虚拟语气、定语从句） |
| parent_id | BIGINT | 父节点 ID，0 为根，支持树形 |
| sort_order | INT | 排序 |

作用：支撑"薄弱项强化推题"（§6.4），通过 `knowledge_mapping` 与题目多对多关联。

---

## 6. 核心算法

### 6.1 ELO 隐藏分与等级映射
- 用户初始 ELO 1000（`UserAbilityRadarServiceImpl.initRadar`）；定级 20 题后得出初始分。
- 更新公式（K 系数按题量衰减）：`R' = R + K × (S − E)`，S 为实际结果（1/0/0.5），E 为期望胜率。
- 等级映射：ELO < 1350 → BASIC；1350~1600 → CET4；> 1600 → CET6。
- 能力雷达分与 ELO 联动：答对提分、答错降分，幅度受难度系数调节。

### 6.2 艾宾浩斯 SRS 遗忘曲线
- 复习梯度：第 1、2、4、7、15、30 天（`EbbinghausUtil.INTERVALS_DAYS = [1,2,4,7,15,30]`），逐级加深。
- 答错降级：复习时答错 → 重置回第一级，进入"重点复习"队列。
- 每日复习任务 = 所有 `next_review_at ≤ now` 的记录，按到期时间升序返回。

### 6.3 三级判题引擎（JudgmentEngine）
1. **L1 精确匹配**：选择/填空类，答案字符串精确比对（含大小写/空格归一化）。
2. **L2 容错匹配**：答案变体比对（同义词、词形变化），命中返回"正确（近似）"。
3. **L2.5 AI 语义判对**：主观题（翻译）调 ai-service 语义判断，返回 isSemanticMatch + 建议。
> 所有判题结果写 `user_exercise_log`，含 trace_id 便于 AI 链路追踪。

### 6.4 智能推题多维度策略（增量补丁）
exercise-service 拉题时按以下优先级组合策略：

1. **等级匹配**：按 `target_level` 从对应等级题库选题。
2. **难度自适应**：优先推送与当前 ELO 匹配的题，使期望得分 E 落在 0.4~0.6 区间。
3. **薄弱点强化**：从 `user_error_book` 统计错误频率最高的 `knowledge_point_id`，定向推送（占总量 30%）。
4. **去重过滤**：排除近 7 天已做题目。
5. **新旧比例**：70% 新题 + 30% 薄弱点复习题。

核心查询 SQL 骨架：
```sql
SELECT qi.id, qi.question_type, qi.difficulty_level
FROM question_info qi
WHERE qi.target_level  = #{targetLevel}
  AND qi.module_type   = #{moduleType}
  AND qi.is_deleted    = 0
  AND qi.id NOT IN (
      SELECT question_id FROM user_exercise_log
      WHERE user_id = #{userId}
        AND create_time >= DATE_SUB(NOW(), INTERVAL 7 DAY)
  )
  AND ABS(qi.elo_difficulty - #{userElo}) <= 200
ORDER BY RAND()
LIMIT #{count};
```

---

## 7. 接口契约

### 7.1 统一响应与错误码规范（增量补丁）
所有接口统一返回：
```json
{ "code": 200, "message": "success", "data": {}, "traceId": "abc123" }
```
| code | 含义 |
|---|---|
| 200 | 成功 |
| 400 | 参数错误 |
| 401 | 未授权 / Token 失效 |
| 403 | 无权限 |
| 500 | 服务器内部错误 |

> traceId 由网关生成并注入 `X-Trace-Id`，贯穿日志与 MQ 消息体，用于分布式链路排查。

### 7.2 网关
- 静态路由：`/api/user/**`→8081、`/api/exercise/**`→8082、`/api/learning/**`→8083、`/api/ai/**`→8084。
- 全局鉴权过滤器：校验 JWT，白名单放行 `/api/user/register|login`；透传 `X-User-Id`。

### 7.3 user-service（真实接口）
- `POST /user/register`、`POST /user/login`（返回 token + 用户信息）
- `GET /user/profile/{userId}`、`PUT /user/profile/{userId}`
- `PUT /user/password`、`POST /user/avatar`
- `GET /user/radar/{userId}`（能力雷达 + ELO）

### 7.4 exercise-service（真实接口，含 AI 出题审核闭环）
- 练习：`GET /exercise/questions?moduleType&count`、`POST /exercise/submit`
- 错题本：`GET /exercise/error-book/{userId}`、`DELETE /exercise/error-book/{id}`
- 生词本：`GET /exercise/vocabulary/{userId}`、`POST /exercise/vocabulary/{userId}/toggle`、`GET /exercise/vocabulary/{userId}/smart`、`POST /exercise/vocabulary/{userId}/review`
- 收藏：`GET /exercise/favorites/{userId}`、`POST /exercise/favorites/toggle`
- 历史与统计：`GET /exercise/history/{userId}?page&size`、`GET /exercise/stats/{userId}`、`GET /exercise/stats/{userId}/weak-points`、`GET /exercise/stats/{userId}/generate-similar`
- **AI 出题审核**：`POST /exercise/generate-questions`、`GET /exercise/pending-questions?status=`、`POST /exercise/pending-questions/{id}/approve`、`POST /exercise/pending-questions/{id}/reject`
- **听力（已实现）**：`GET /exercise/listening/questions?userId&count`、`GET /exercise/listening/question/{id}?showAnswer`、`POST /exercise/listening/submit`、`GET /exercise/listening/stats/{userId}`
  - 听力题 `module_type=4`、`question_type=CHOICE`；判题走 `ChoiceAnswerUtil` 本地确定性比对，不进入 AI 语义判对链；提交后写 `user_exercise_log`、错题本、遗忘曲线，并更新 `listening_score`。

### 7.5 learning-engine-service（真实接口）
- `GET /learning/review/tasks/{userId}`（今日复习任务）
- `POST /learning/review/submit`（复习提交，触发遗忘曲线更新）
- `GET /learning/curve/{userId}`

### 7.6 ai-service（真实接口，SSE）
- `POST /ai/chat`（SSE 流式答疑）
- `POST /ai/score`（SSE 流式评分，scoreType=writing/speaking）
- `POST /ai/word-detail`、`POST /ai/judge-feedback`、`POST /ai/judge-acceptable`、`POST /ai/generate-questions`
> 全部无 Key 走 Mock 降级，保证开发期不阻塞。

### 7.7 内部服务调用规范（增量补丁）
当前架构**未启用 Nacos 服务发现**，微服务间通过环境变量配置的 HTTP 地址直连（RestTemplate）。后续若接入 Nacos，调用层代码无需修改（仅改造网关路由为 `lb://`）。

---

### 7.8 管理员端接口（2026-10-31 新增）

- 统一基座 `/admin/**`，JWT 必须含 `ROLE_ADMIN`；网关注入 `X-Gateway-Token`，下游强校验。
- `GET /admin/overview`（用户/金币/签到/通知/活动 + 学习统计聚合，exercise-service 不可用时降级）
- 用户：`GET /admin/users`、`GET /admin/users/{id}`、`PUT /admin/users/{id}/status`、`PUT /admin/users/{id}/role`、`POST /admin/users/{id}/reset-password`
- 通知：`/admin/notices` CRUD + `publish`/`expire`；用户端 `/user/notices`、未读数、已读
- 活动：`/admin/activities` CRUD + `publish`/`end`；用户端 `/user/activities`
- 日志：`GET /admin/operation-logs`
- 题目审核：`GET /admin/questions`、`POST /admin/questions/{id}/approve|reject`、`POST /admin/questions/generate`
- 内部统计：`GET /internal/admin/overview`、`GET /internal/admin/user-stats/{userId}`（`X-Internal-Token`）
- 管理员账号由 `AdminBootstrapRunner` + `ADMIN_BOOTSTRAP_PASSWORD` 创建，不写死在 SQL。
- 详细字段见 `docs/管理员端API契约.md`。

## 8. 安全设计

### 8.1 认证鉴权
- JWT HS256（JJWT 0.12.3），有效期由配置控制；网关统一校验，服务间信任 `X-User-Id` 透传头。

### 8.2 密码存储
- BCrypt（work factor 12），禁止明文/MD5/SHA1。

### 8.3 输入安全
- MyBatis-Plus 全部使用 `#{}`，禁止 `${}` 拼接；前端 Vue 模板默认转义，禁用 `v-html` 渲染用户输入。

### 8.4 AI 内容安全（增量补丁）
1. **输入过滤**：用户提交内容发给大模型前，先经本地敏感词词典过滤。
2. **输出约束**：System Prompt 明确"仅针对英语语言学习内容作答，拒绝其他话题"。
3. **防幻觉机制**：AI 批改时把标准答案与解析一并传入，约束模型在已知事实范围内作答。
4. **审核日志**：每次 AI 调用记录脱敏输入输出，便于排查与 Prompt 优化。

### 8.5 P0 安全整改项（增量补丁 + 仓库现状）
- **API Key 泄露**：✅ 源码 `application.yml` 已改为 `${DASHSCOPE_API_KEY}`，无 Key 走 Mock；⚠️ 本地 `.env`/`.idea/workspace.xml` 仍有旧 Key，需在阿里云侧吊销轮换。
- **SQL 双轨清理**：✅ `English_AI/sql/` 已无旧单库脚本；新增 `sql/init/00-init.sql` 作为 Docker 初始化入口；⚠️ 仓库根 `AI-EnglishLearning/init/01-基础建表.sql` 仍为旧脚本，禁止执行。
- **JWT 默认密钥**：✅ `common/EnvGuard` 在 prod profile 下校验 `JWT_SECRET`、`MYSQL_PASSWORD`、`DASHSCOPE_API_KEY`、`INTERNAL_TOKEN`。
- **Long 精度**：⏸ 暂缓。当前 ID 量级远小于 `2^53`，投入产出比低；如后续出现真实精度问题再做。

---

## 9. 测试与验收

### 9.1 单元测试
- `EbbinghausUtil`（遗忘曲线梯度）、ELO 更新公式、`JudgmentEngine`（L1/L2 判题样例）、`JwtUtil`。
- 验收：`mvn test` 全绿，核心算法覆盖率 >60%。

### 9.2 集成测试
- 三库初始化 + 种子数据后可一键启动 5 服务；Postman 按 §7 接口逐条冒烟。

### 9.3 双账号端到端验收方案（增量补丁）
| 维度 | 账号 A（薄弱用户） | 账号 B（优秀用户） |
|---|---|---|
| 初始/定级 ELO | 注册默认 1000，可保持在 1000~1200 | 测试 SQL 预置 1600+ |
| 推题难度 | difficulty 1~3 | difficulty 6~8（题库上限 8） |
| 答错后 | 复习间隔回落，ELO 小幅下降 | 按当前掌握度回落，ELO 微调下降 |
| 能力雷达 | ProfileView 列表各维度偏低 | 各维度偏高（含 listeningScore） |

### 9.4 风险矩阵（增量补丁）
| 风险项 | 等级 | 应对措施 |
|---|---|---|
| AI 接口限流 / 超时 | 高 | ai-service 降级兜底：超时 2s 切本地规则引擎，业务不中断 |
| RabbitMQ 消息丢失 | 中 | Publisher Confirm + 手动 ACK + 死信队列（启用 MQ 后） |
| JSON 字段全表扫描 | 高 | 虚拟列 + B+ 树索引（§5.6） |
| 跨库联表冲动 | 中 | 严格分库隔离，服务间 HTTP 关联，Review 重点检查 |

---

## 10. 当前缺口与整改清单

| 优先级 | 缺口 | 状态 / 动作 |
|---|---|---|
| P0 | AI Key 明文泄露 | ✅ 源码已环境变量化；仍需吊销旧 Key |
| P0 | 遗留单库 SQL | ✅ 主目录已清理；根 `init/` 旧脚本待归档 |
| P0 | 全局异常处理器不统一 | 🟡 user/exercise 已有，ai/learning/gateway 缺失 |
| P1 | Long 序列化精度 | ⏸ 暂缓（当前量级无风险） |
| P1 | 听力接口 | ✅ 已完成（Sprint 1） |
| P1 | 翻译/写作接口 | ⬜ 未开始（Sprint 2） |
| P2 | MQ 正式启用 | ⬜ 代码已就绪，默认关闭 |
| P2 | 单元测试补齐 | 🟡 已有 11+ 类，核心算法测试仍缺 |

---

## 11. 未来路线图（不含游戏化）

| 阶段 | 目标 |
|---|---|
| 近期 | 听力模块（后端 + 判分 + 雷达联动） |
| 中期 | 翻译模块（AI 语义判对）、写作模块（AI 流式评分） |
| 远期 | 模拟考试、学习数据驾驶舱、暗色主题、Docker 一键部署 |

> 所有扩展项均以《后续开发任务书（Backlog）》为准，逐条可验收。**产品不引入成就/徽章/排行榜等游戏化设计。**

---

## 12. 开发规范（AI 编程与人工共用）

1. Controller 返回 `Result<T>`，业务异常抛 `BusinessException`，由全局处理器收敛。
2. 判题走 handler 策略链；AI 调用只经 ai-service；无 Key 走 Mock。
3. 禁止改库名/端口/JWT 密钥；新表走增量 `sql/07-*.sql`（幂等）。
4. 禁止新增未规划技术栈（Nacos/Redis/Feign/Spring AI 一律不引入）。
5. 禁止在 yml 写任何密钥，一律 `${ENV}`。
6. 引用的任何接口/表/字段必须存在于本文档或代码中——**文档与代码冲突时以代码为准并回写标注**（反幻觉原则）。

---

*文档依据：mman91359-rgb-English-AI-learning@最新提交全部后端源码 + sql 脚本 + 《项目设计文档》增量补丁（已按代码事实修正）。*
