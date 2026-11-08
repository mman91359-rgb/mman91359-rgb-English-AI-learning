-- Flyway V1.0.4 — 存量账号回填占位邮箱 + 统一重置临时密码
-- 目标库：user_db
-- 背景：登录标识已改为手机号/邮箱，存量无手机号且无邮箱的账号无法登录；
--       统一重置所有账号密码为临时密码 Recall@2026（BCrypt 强度10，与 PasswordUtil.STRENGTH 一致）。

-- 1. 给无手机号、无邮箱的存量账号回填占位邮箱 user{id}@recall.local
UPDATE `sys_user`
SET `email` = CONCAT('user', `id`, '@recall.local')
WHERE (`phone` IS NULL OR `phone` = '')
  AND (`email` IS NULL OR `email` = '');

-- 2. 统一重置所有账号密码为临时密码 Recall@2026
--    哈希值由 BCryptPasswordEncoder(strength=10) 对 "Recall@2026" 生成，已人工验证 matches 通过。
UPDATE `sys_user`
SET `password` = '$2a$10$pg8N.kh9zK4QFDI348/GX.zDpVdYGdDhXj5puzM6HEZCMWeJ2FaQ2';
