-- Flyway V1.0.3 — 登录标识改为手机号/邮箱，username 降级为可空昵称
-- 目标库：user_db

-- 1. sys_user 新增 email 字段（可空，作为邮箱登录标识）
ALTER TABLE `sys_user`
  ADD COLUMN `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱(登录标识)' AFTER `phone`;

-- 2. 删除 username 唯一索引（昵称允许重复）
ALTER TABLE `sys_user` DROP INDEX `uk_username`;

-- 3. username 改为可空（昵称可空，空时自动生成）
ALTER TABLE `sys_user`
  MODIFY COLUMN `username` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '昵称(展示用，可空可重复)';

-- 4. phone / email 加唯一索引（登录标识唯一）
ALTER TABLE `sys_user` ADD UNIQUE KEY `uk_phone` (`phone`);
ALTER TABLE `sys_user` ADD UNIQUE KEY `uk_email` (`email`);
