-- V1.0.5__alter_correct_answer_to_text.sql
-- 目标库: exercise_db
-- 将 question_content.correct_answer 从 varchar(500) 扩展为 TEXT，
-- 以支持段落级翻译/写作等长文本参考答案。
-- 执行前必须按 docs/数据库迁移规范.md 预览、备份、审批。

ALTER TABLE `question_content`
  MODIFY COLUMN `correct_answer` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '正确答案';
