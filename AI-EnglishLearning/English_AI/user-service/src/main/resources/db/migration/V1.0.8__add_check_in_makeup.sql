-- V1.0.8：签到记录增加补签标记，用于区分正常签到与花费金币的补签
-- 目标库：user_db
-- 风险：低。单表一次 ADD COLUMN，表内 19 行，MySQL 8.0 走 INSTANT；DDL 不参与事务，不可自动回滚
-- 回滚：ALTER TABLE `user_check_in` DROP COLUMN `is_makeup`;
--       回滚后需对 flyway_schema_history 执行 flyway repair，否则校验不通过
-- 老数据：新增列默认 0（正常签到），无需回填
-- 约束：禁止修改已应用的 V1.0.0 ~ V1.0.7

ALTER TABLE `user_check_in`
  ADD COLUMN `is_makeup` tinyint NOT NULL DEFAULT 0 COMMENT '是否补签：0 正常签到 1 金币补签' AFTER `streak_days`;
