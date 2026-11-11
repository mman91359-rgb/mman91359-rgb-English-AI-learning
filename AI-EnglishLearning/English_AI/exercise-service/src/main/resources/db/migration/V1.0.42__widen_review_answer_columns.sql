-- V1.0.42__widen_review_answer_columns.sql：放宽审核队列的作答/参考答案列宽
-- 目标库：exercise_db
-- 风险：低（仅放宽 VARCHAR 长度 + 把唯一键换成哈希列；表当前无业务数据）
-- 回滚：先删 answer_hash 与哈希唯一键，恢复 (question_id,user_id,user_answer) 唯一键，
--       再把两列 MODIFY 回 VARCHAR(500)（若已有超过 500 字符的数据会被截断，回滚前先确认）
-- 背景：段落翻译是整段作答，通常 600~900 字符，V1.0.27 的 varchar(500) 装不下。
--
-- 为什么不能直接放宽：uk_question_user_answer 把 user_answer 纳入唯一键，
-- utf8mb4 下 varchar(2000) = 8000 字节，超过 InnoDB 3072 字节的索引上限（ERROR 1071）。
-- 因此改为：user_answer 放宽到 2000 且不再入索引，唯一键改用生成列 answer_hash。

ALTER TABLE `judge_review_queue`
  DROP INDEX `uk_question_user_answer`;

ALTER TABLE `judge_review_queue`
  MODIFY COLUMN `user_answer` VARCHAR(2000) NOT NULL COMMENT '用户作答原文',
  MODIFY COLUMN `correct_answer` VARCHAR(2000) DEFAULT NULL COMMENT '参考答案',
  ADD COLUMN `answer_hash` CHAR(64)
      GENERATED ALWAYS AS (SHA2(`user_answer`, 256)) STORED
      COMMENT '作答哈希，用于唯一键（避免长文本索引超限）' AFTER `user_answer`,
  ADD UNIQUE KEY `uk_question_user_answer` (`question_id`, `user_id`, `answer_hash`) USING BTREE;
