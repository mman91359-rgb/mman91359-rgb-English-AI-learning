# sql/ 目录说明

> 本目录是 **Flyway 化之前的历史手工变更记录**，仅供追溯，**禁止执行**。
> 数据库结构的唯一变更入口是各模块的 `src/main/resources/db/migration/`。

## 为什么保留而不删除

- **可追溯**：某张表、某个列是谁在什么时候加的，只能在这里找到原始出处；Flyway 迁移只记录了「之后」。
- **排查历史事故**：线上/本地数据出现异常时，需要回看当时的建表语句与种子数据。
- **删除成本高于保留成本**：移走会破坏别人笔记、书签、聊天记录里的路径引用，而保留的代价只是目录里多几个文件。

## 目录构成

| 类别 | 文件数 | 说明 |
|---|---|---|
| 全库 dump | 3 | Navicat 导出的**建库快照** |
| 增量脚本 | 12 | 逐个功能手工执行的 `CREATE` / `ALTER` / `UPDATE` |
| `backup/` | 106 | `scripts/backup-schema.sh` 的输出，已 gitignore，不入库 |
| `flyway-init/` | 1 | `00-create-databases.sql`，建空库用 |
| `init/` | 1 | `00-init.sql`，**已废弃**，被 `flyway-init/` 取代 |

## 12 个增量脚本

| 文件 | 目标库 | 内容 |
|---|---|---|
| `02-add-favorites-vocabulary.sql` | `exercise_db` | 建 `user_favorite` 收藏表 |
| `03-add-daily-word.sql` | `exercise_db` | 建 `word_dictionary` 系统词库 + 每日一词 |
| `03-upgrade-vocabulary.sql` | `exercise_db` | 扩展 `user_vocabulary`：音标、词性、例句、搭配、复习次数、掌握度等 |
| `03b-fix-phonetic.sql` | `exercise_db` | 修正 `word_dictionary.phonetic` 的一批音标（纯 `UPDATE`） |
| `04-add-buggy-paths.sql` | `exercise_db` | 建 `question_buggy_path`：错误答案与启发式提示 |
| `05-add-accepted-answers.sql` | `exercise_db` | `question_info` 加 `accepted_answers` JSON 列 |
| `06-add-pending-questions.sql` | `exercise_db` | 建 `question_pending`：AI 离线生成待审核题 |
| `07-user-coin-checkin-preference.sql` | `user_db` | 金币账户、金币流水、每日签到、用户偏好 |
| `08-study-session.sql` | `exercise_db` | 建学习会话时长表 + 历史数据回填 |
| `09-user-preference-daily-goals.sql` | `user_db` | `user_preference` 加每日新背/复习单词数 |
| `10-listening-module.sql` | `exercise_db` | 建 `listening_audio` + 4 道听力种子题（复用 `question_info`，`module_type=4`） |
| `11-admin-module.sql` | `user_db` | 站内通知、通知已读、运营活动、管理员操作日志 + 1 条欢迎通知 |

## 三个全库 dump

`exercise_db.sql` / `learning_db.sql` / `user_db.sql`，均由 Navicat Premium Data Transfer 导出，源库 MySQL 8.0.28，导出时间 2026-10-24。

它们只反映**当时的**结构，不含此后任何迁移。

## 与 Flyway 的关系（重要）

这些脚本**不是「另一套迁移」**，是 Flyway 之前的草稿。判断依据是表名已经对不上：

| 脚本里建的 | 当前库实际 |
|---|---|
| `study_session` | `user_study_session` |
| `user_checkin` | `user_check_in` |
| `promotion_activity` | `sys_activity` |

所以：

- **不能用它们重建数据库** —— 建出来的结构与当前不一致。
- **不能拿它们推演当前结构** —— 以 `known/数据库结构.txt` 或直接查 `information_schema` 为准。
- **不要「修正」它们** —— 改了也不会有人执行，只会增加一处需要维护的过期内容。

`scripts/check-migrations.mjs` 扫描本目录时只**提示**、不报错，原因就在这里：它是第二变更渠道的历史残留，不是现行违规。真正要 fail 的是「有人在 `db/migration/` 之外新增 SQL 变更」。

## 历史注释偏差

`exercise-service/.../V1.0.60__seed_writing_topics.sql` 的头部注释写着「前端 `types/writing.ts` 的 type 联合类型须同步扩为五档，否则 type-check 不通过」。

这句话**已失效**：紧随其后的 `V1.0.61__remap_writing_topic_type.sql` 把五档映射回了前端已有的枚举（`SHORT_ESSAY` / `ARGUMENTATIVE` / `PRACTICAL` / `CHART` / `LETTER`），方向是后端适配前端。

该文件已被应用，**注释不能修改**（改一字节 `flyway validate` 就报 checksum 失败）。记录在此以免后来人按注释去改前端。
