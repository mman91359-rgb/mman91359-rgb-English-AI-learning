-- =============================================================
-- 练习组结算：答题日志记录所属练习组
--
-- 目标库：exercise_db
-- 风险等级：低（新增可空列 + 普通索引，不改动既有列与数据）
--   1. batch_key 允许 NULL：历史答题记录与未带 batchKey 的提交不受影响
--   2. 新增 idx_user_batch 支撑「按用户+练习组」聚合查询
-- 回滚方式（MySQL 不支持 DDL 事务，需手工执行）：
--   ALTER TABLE `user_exercise_log` DROP INDEX `idx_user_batch`;
--   ALTER TABLE `user_exercise_log` DROP COLUMN `batch_key`;
-- =============================================================

ALTER TABLE `user_exercise_log`
  ADD COLUMN `batch_key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
      COMMENT '练习组唯一键，用于单次练习结算' AFTER `trace_id`,
  ADD KEY `idx_user_batch` (`user_id`,`batch_key`) USING BTREE;
