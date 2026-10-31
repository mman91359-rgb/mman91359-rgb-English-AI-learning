-- ============================================================
-- 09-user-preference-daily-goals.sql
-- 功能描述：用户偏好新增每日新背单词数、每日复习单词数
-- 目标库：user_db
-- 创建时间：2026-10-24
-- 说明：不修改 07/08，需在 07 创建 user_preference 后执行
-- ============================================================

USE user_db;

ALTER TABLE `user_preference`
    ADD COLUMN `daily_new_words` INT DEFAULT NULL
        COMMENT '每日新背单词数（1-50）' AFTER `vocab_group_size`,
    ADD COLUMN `daily_review_words` INT DEFAULT NULL
        COMMENT '每日复习单词数（0-50）' AFTER `daily_new_words`;
