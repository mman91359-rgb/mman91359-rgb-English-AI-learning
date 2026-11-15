-- 统一验证码记录（user_db）
-- 场景：REGISTER 注册 / FORGOT_PASSWORD 找回密码 / PHONE_BIND 换绑手机号
-- 下发通道当前为本地模拟（仅非 prod profile 可用），接入真实短信时只需替换发送器实现。
-- 本迁移只新增一张独立表，无 DML、不修改存量表、不影响既有查询。
CREATE TABLE `sms_verification_code` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `recipient` varchar(100) NOT NULL COMMENT '接收地址：手机号或邮箱',
  `scene` varchar(32) NOT NULL COMMENT '业务场景：REGISTER/FORGOT_PASSWORD/PHONE_BIND',
  `user_id` bigint DEFAULT NULL COMMENT '换绑场景绑定的用户ID，其余场景为 NULL',
  `code_hash` char(64) NOT NULL COMMENT 'SHA-256(salt|接收地址|场景|验证码)，不存明文',
  `salt` char(32) NOT NULL COMMENT '每条记录独立的随机盐（16 字节十六进制）',
  `expire_at` datetime NOT NULL COMMENT '过期时间（签发后 5 分钟）',
  `used` tinyint NOT NULL DEFAULT 0 COMMENT '是否已消费：0 未使用，1 已使用',
  `try_count` tinyint NOT NULL DEFAULT 0 COMMENT '校验失败次数，达到 5 次作废',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '签发时间',
  PRIMARY KEY (`id`),
  KEY `idx_recipient_scene_created` (`recipient`, `scene`, `created_at`),
  KEY `idx_expire_at` (`expire_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='统一验证码记录（本地模拟下发）';
