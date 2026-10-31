-- ============================================================
-- 07-user-coin-checkin-preference.sql
-- 功能描述：金币账户、金币流水、每日签到、用户学习偏好
-- 目标库：user_db
-- 创建时间：2026-10-24
-- 说明：仅新增表与数据，不修改 02-06 已发布脚本
-- ============================================================

USE user_db;

-- 用户金币账户（与 sys_user 一对一）
CREATE TABLE IF NOT EXISTS `user_coin_account` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `user_id` BIGINT NOT NULL COMMENT '用户ID',
    `balance` INT NOT NULL DEFAULT 0 COMMENT '当前金币余额',
    `total_earned` INT NOT NULL DEFAULT 0 COMMENT '累计获得金币',
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户金币账户';

-- 金币流水（biz_key 唯一，用于幂等）
CREATE TABLE IF NOT EXISTS `user_coin_transaction` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `user_id` BIGINT NOT NULL COMMENT '用户ID',
    `amount` INT NOT NULL COMMENT '金币变动值（正数为获得）',
    `biz_type` VARCHAR(32) NOT NULL COMMENT '业务类型: CHECK_IN/CHECK_IN_MILESTONE/VOCAB_GROUP',
    `biz_key` VARCHAR(128) NOT NULL COMMENT '业务幂等键',
    `description` VARCHAR(255) DEFAULT NULL COMMENT '流水描述',
    `balance_after` INT DEFAULT NULL COMMENT '变动后余额',
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_biz_key` (`biz_key`),
    INDEX `idx_user_created` (`user_id`, `created_at`),
    INDEX `idx_user_biz_type` (`user_id`, `biz_type`, `created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='金币流水';

-- 每日签到记录（同一用户同一天只能有一条）
CREATE TABLE IF NOT EXISTS `user_check_in` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `user_id` BIGINT NOT NULL COMMENT '用户ID',
    `check_in_date` DATE NOT NULL COMMENT '签到日期',
    `reward_coins` INT NOT NULL DEFAULT 0 COMMENT '本次签到获得金币（含连续奖励与里程碑）',
    `streak_days` INT NOT NULL DEFAULT 1 COMMENT '签到时的连续天数',
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_user_date` (`user_id`, `check_in_date`),
    INDEX `idx_user_created` (`user_id`, `created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='每日签到记录';

-- 用户偏好（vocab_group_size 为 NULL 表示尚未完成首次设置）
CREATE TABLE IF NOT EXISTS `user_preference` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `user_id` BIGINT NOT NULL COMMENT '用户ID',
    `vocab_group_size` INT DEFAULT NULL COMMENT '每组单词数量（5-50）',
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户学习偏好';

-- 为存量用户补金币账户，后续注册用户由服务端懒创建
INSERT IGNORE INTO `user_coin_account` (`user_id`, `balance`, `total_earned`)
SELECT `id`, 0, 0 FROM `sys_user`;
