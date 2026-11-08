-- V1.0.2：能力雷达新增翻译、写作两列，使六维与 ModuleType 一一对应
-- 目标库：user_db
-- 风险：低（单表两次 ADD COLUMN，MySQL 8.0 走 INSTANT；DDL 不可事务回滚）
-- 回滚：ALTER TABLE `user_ability_radar` DROP COLUMN `writing_score`, DROP COLUMN `translation_score`;
-- 老数据：两列初始化为 0.00；历史翻译分已混入 reading_score，无法拆分，不做回填。
-- 禁止修改已应用的 V1.0.0 / V1.0.1。

ALTER TABLE `user_ability_radar`
  ADD COLUMN `translation_score` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT '翻译能力分' AFTER `reading_score`,
  ADD COLUMN `writing_score` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT '写作能力分' AFTER `translation_score`;
