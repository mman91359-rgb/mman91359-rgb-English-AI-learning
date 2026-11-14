-- Flyway V1.0.5 — 记住我 Refresh Token 表
-- 目标库：user_db
-- 背景：轻量化"记住我"功能，勾选后 7 天内自动刷新登录态。
--       Refresh Token 数据库仅存 SHA-256 哈希，明文只出现在 HttpOnly Cookie 中。

CREATE TABLE `user_refresh_token` (
  `id`            bigint       NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id`       bigint       NOT NULL COMMENT '用户ID',
  `token_hash`    char(64)     NOT NULL COMMENT 'Refresh Token 的 SHA-256 哈希（不存明文）',
  `series`        char(36)     NOT NULL COMMENT '令牌系列（UUID），同系列轮换；复用检测用',
  `expires_at`    datetime     NOT NULL COMMENT '过期时间',
  `status`        tinyint      NOT NULL DEFAULT 1 COMMENT '1有效 0已吊销',
  `revoked_at`    datetime     DEFAULT NULL COMMENT '吊销时间',
  `last_used_at`  datetime     DEFAULT NULL COMMENT '最近使用时间',
  `created_at`    datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at`    datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_token_hash` (`token_hash`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_series` (`series`),
  KEY `idx_user_status` (`user_id`, `status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='记住我 Refresh Token';
