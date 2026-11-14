-- V1.0.7：user_preference 增加当前词书
-- 目标库：user_db
-- 风险：低（ADD COLUMN 可空，不影响存量）
-- 回滚：
--   ALTER TABLE `user_preference` DROP COLUMN `active_word_book_id`;
-- 说明：
--   1. active_word_book_id 关联 exercise_db.word_book.id（跨库，仅存 ID，不做外键约束）。
--   2. NULL 表示未选词书，前端默认引导选择或回落到 basic_500。

ALTER TABLE `user_preference`
  ADD COLUMN `active_word_book_id` bigint DEFAULT NULL
    COMMENT '当前选中的词书ID（关联 exercise_db.word_book.id）' AFTER `daily_review_words`;
