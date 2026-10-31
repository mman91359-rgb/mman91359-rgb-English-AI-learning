-- ============================================================
-- 11-admin-module.sql
-- 功能：站内通知、通知已读、运营活动、管理员操作日志
-- 目标库：user_db
-- 说明：仅新增表与一条系统欢迎通知；不修改 00-10 已发布脚本
-- 管理员账号不在此脚本创建，由 user-service 的 AdminBootstrapRunner
-- 读取 ADMIN_BOOTSTRAP_PASSWORD 环境变量后创建。
-- ============================================================

USE user_db;

-- 站内公告
CREATE TABLE IF NOT EXISTS `sys_notice` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键',
    `title` VARCHAR(200) NOT NULL COMMENT '标题',
    `content` TEXT NOT NULL COMMENT '正文',
    `notice_type` VARCHAR(20) NOT NULL DEFAULT 'SYSTEM' COMMENT '类型: SYSTEM/REMINDER/ACTIVITY',
    `target_audience` VARCHAR(20) NOT NULL DEFAULT 'ALL' COMMENT '目标人群: ALL/CET4/CET6',
    `status` VARCHAR(20) NOT NULL DEFAULT 'DRAFT' COMMENT '状态: DRAFT/PUBLISHED/EXPIRED',
    `publish_at` DATETIME NULL DEFAULT NULL COMMENT '发布时间；PUBLISHED 且未来时间为定时发布',
    `expire_at` DATETIME NULL DEFAULT NULL COMMENT '过期时间；NULL 表示不过期',
    `created_by` BIGINT NULL DEFAULT NULL COMMENT '创建管理员ID；系统种子为 NULL',
    `updated_by` BIGINT NULL DEFAULT NULL COMMENT '最后修改管理员ID',
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`),
    KEY `idx_status_publish` (`status`, `publish_at`),
    KEY `idx_target_status` (`target_audience`, `status`),
    KEY `idx_created_at` (`created_at`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '站内公告';

-- 用户通知已读记录
CREATE TABLE IF NOT EXISTS `user_notice_read` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键',
    `notice_id` BIGINT NOT NULL COMMENT '通知ID',
    `user_id` BIGINT NOT NULL COMMENT '用户ID',
    `read_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '已读时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_notice_user` (`notice_id`, `user_id`),
    KEY `idx_user_read` (`user_id`, `read_at`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户通知已读记录';

-- 运营活动/横幅
CREATE TABLE IF NOT EXISTS `sys_activity` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键',
    `title` VARCHAR(200) NOT NULL COMMENT '活动标题',
    `summary` VARCHAR(500) NULL DEFAULT NULL COMMENT '摘要',
    `content` TEXT NULL COMMENT '详情内容',
    `banner_url` VARCHAR(500) NULL DEFAULT NULL COMMENT '横幅图片URL',
    `activity_type` VARCHAR(20) NOT NULL DEFAULT 'BANNER' COMMENT '类型: BANNER/CONTENT',
    `target_audience` VARCHAR(20) NOT NULL DEFAULT 'ALL' COMMENT '目标人群: ALL/CET4/CET6',
    `status` VARCHAR(20) NOT NULL DEFAULT 'DRAFT' COMMENT '状态: DRAFT/PUBLISHED/ENDED',
    `start_at` DATETIME NOT NULL COMMENT '开始时间',
    `end_at` DATETIME NOT NULL COMMENT '结束时间',
    `sort_order` INT NOT NULL DEFAULT 0 COMMENT '展示排序，越大越靠前',
    `created_by` BIGINT NULL DEFAULT NULL COMMENT '创建管理员ID',
    `updated_by` BIGINT NULL DEFAULT NULL COMMENT '最后修改管理员ID',
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`),
    KEY `idx_status_window` (`status`, `start_at`, `end_at`),
    KEY `idx_target_window` (`target_audience`, `status`, `start_at`, `end_at`),
    KEY `idx_sort` (`sort_order`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '运营活动/横幅';

-- 管理员操作审计日志
CREATE TABLE IF NOT EXISTS `admin_operation_log` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键',
    `operator_id` BIGINT NOT NULL COMMENT '操作管理员ID',
    `operator_name` VARCHAR(50) NULL DEFAULT NULL COMMENT '操作时用户名快照',
    `action` VARCHAR(50) NOT NULL COMMENT '动作: USER_STATUS_UPDATE/NOTICE_PUBLISH/QUESTION_APPROVE 等',
    `target_type` VARCHAR(32) NULL DEFAULT NULL COMMENT '目标类型: USER/NOTICE/ACTIVITY/QUESTION',
    `target_id` VARCHAR(64) NULL DEFAULT NULL COMMENT '目标ID（字符串兼容多种主键）',
    `detail` VARCHAR(1000) NULL DEFAULT NULL COMMENT '变更摘要，禁止存放密码/完整手机号',
    `ip` VARCHAR(64) NULL DEFAULT NULL COMMENT '操作IP',
    `user_agent` VARCHAR(255) NULL DEFAULT NULL COMMENT 'User-Agent',
    `result` VARCHAR(16) NOT NULL DEFAULT 'SUCCESS' COMMENT '结果: SUCCESS/FAIL',
    `trace_id` VARCHAR(64) NULL DEFAULT NULL COMMENT '链路追踪ID',
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
    PRIMARY KEY (`id`),
    KEY `idx_operator_created` (`operator_id`, `created_at`),
    KEY `idx_action_created` (`action`, `created_at`),
    KEY `idx_target` (`target_type`, `target_id`),
    KEY `idx_created_at` (`created_at`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '管理员操作审计日志';

-- 系统欢迎通知（仅一条，幂等）
INSERT INTO `sys_notice`
    (`title`, `content`, `notice_type`, `target_audience`, `status`, `publish_at`, `created_by`)
SELECT
    '欢迎使用 Recall 睿考',
    '欢迎来到 Recall 睿考，开始你的四六级学习之旅。',
    'SYSTEM', 'ALL', 'PUBLISHED', NOW(), NULL
FROM DUAL
WHERE NOT EXISTS (
    SELECT 1 FROM `sys_notice` WHERE `title` = '欢迎使用 Recall 睿考'
);
