-- ============================================================
-- 08-study-session.sql
-- 功能描述：学习会话活跃时长表，用于替代单题 duration_seconds 统计
-- 目标库：exercise_db
-- 创建时间：2026-10-24
-- 说明：仅新增表与历史数据回填，不修改 02-06 已发布脚本
-- ============================================================

USE exercise_db;

-- 学习会话（一次进入学习中心及子页面产生一行）
CREATE TABLE IF NOT EXISTS `user_study_session` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `user_id` BIGINT NOT NULL COMMENT '用户ID',
    `session_key` VARCHAR(64) NOT NULL COMMENT '客户端会话唯一键',
    `stat_date` DATE NOT NULL COMMENT '会话开始日期（Asia/Shanghai）',
    `active_seconds` INT NOT NULL DEFAULT 0 COMMENT '有效活跃秒数',
    `started_at` DATETIME NOT NULL COMMENT '会话开始时间',
    `last_reported_at` DATETIME NOT NULL COMMENT '最后上报时间',
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_user_session` (`user_id`, `session_key`),
    INDEX `idx_user_date` (`user_id`, `stat_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='学习会话活跃时长';

-- 回填历史答题时长：按用户、按天汇总为一条 legacy 会话
-- 只回填今天之前的数据，避免上线当天与新的会话计时重复
INSERT IGNORE INTO `user_study_session`
    (`user_id`, `session_key`, `stat_date`, `active_seconds`, `started_at`, `last_reported_at`)
SELECT
    `user_id`,
    CONCAT('legacy-', `user_id`, '-', DATE(`created_at`)),
    DATE(`created_at`),
    SUM(COALESCE(`duration_seconds`, 0)),
    MIN(`created_at`),
    MAX(`created_at`)
FROM `user_exercise_log`
WHERE `created_at` IS NOT NULL
  AND DATE(`created_at`) < CURDATE()
GROUP BY `user_id`, DATE(`created_at`);
