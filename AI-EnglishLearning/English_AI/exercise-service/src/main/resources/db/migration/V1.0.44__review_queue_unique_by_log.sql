-- V1.0.44__review_queue_unique_by_log.sql：审核队列唯一键从「按答案」改为「按作答」
-- 目标库：exercise_db
-- 风险：低（表当前 0 行；仅换索引，不动列与数据）
-- 回滚：DROP INDEX uk_review_log / idx_question_user，
--       恢复 UNIQUE KEY uk_question_user_answer (question_id, user_id, answer_hash)
-- 背景：灰区不计分，等复核结论补记。原唯一键 (question_id,user_id,answer_hash) 会让
--       同一用户重复提交同一译文时 INSERT IGNORE 返回 0 —— 第二次作答既不入队也永远不计分。
--       log_id 是 user_exercise_log 主键的 1:1 副本（一次作答一行），改它做唯一键后
--       重复译文会产生两条待复核记录，不再丢数据；去重展示留给复核列表页。
--       注意：log_id 可空，MySQL 唯一键允许多个 NULL，手工入队不受影响。

ALTER TABLE `judge_review_queue`
  DROP INDEX `uk_question_user_answer`,
  ADD UNIQUE KEY `uk_review_log` (`log_id`),
  ADD KEY `idx_question_user` (`question_id`, `user_id`);
