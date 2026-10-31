-- Flyway V1.0.0 — user_db 当前完整结构快照（2026-10-31）
-- 由本地 MySQL 8.0.28 实际结构生成；已去除删表语句与 USE，统一 utf8mb4_unicode_ci。

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_operation_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `operator_id` bigint NOT NULL COMMENT '操作管理员ID',
  `operator_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作时用户名快照',
  `action` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '动作: USER_STATUS_UPDATE/NOTICE_PUBLISH/QUESTION_APPROVE 等',
  `target_type` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '目标类型: USER/NOTICE/ACTIVITY/QUESTION',
  `target_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '目标ID（字符串兼容多种主键）',
  `detail` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '变更摘要，禁止存放密码/完整手机号',
  `ip` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作IP',
  `user_agent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'User-Agent',
  `result` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'SUCCESS' COMMENT '结果: SUCCESS/FAIL',
  `trace_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '链路追踪ID',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `idx_operator_created` (`operator_id`,`created_at`),
  KEY `idx_action_created` (`action`,`created_at`),
  KEY `idx_target` (`target_type`,`target_id`),
  KEY `idx_created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='管理员操作审计日志';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_activity` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '活动标题',
  `summary` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '摘要',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '详情内容',
  `banner_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '横幅图片URL',
  `activity_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'BANNER' COMMENT '类型: BANNER/CONTENT',
  `target_audience` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ALL' COMMENT '目标人群: ALL/CET4/CET6',
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT' COMMENT '状态: DRAFT/PUBLISHED/ENDED',
  `start_at` datetime NOT NULL COMMENT '开始时间',
  `end_at` datetime NOT NULL COMMENT '结束时间',
  `sort_order` int NOT NULL DEFAULT '0' COMMENT '展示排序，越大越靠前',
  `created_by` bigint DEFAULT NULL COMMENT '创建管理员ID',
  `updated_by` bigint DEFAULT NULL COMMENT '最后修改管理员ID',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_status_window` (`status`,`start_at`,`end_at`),
  KEY `idx_target_window` (`target_audience`,`status`,`start_at`,`end_at`),
  KEY `idx_sort` (`sort_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='运营活动/横幅';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_notice` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '正文',
  `notice_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'SYSTEM' COMMENT '类型: SYSTEM/REMINDER/ACTIVITY',
  `target_audience` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ALL' COMMENT '目标人群: ALL/CET4/CET6',
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT' COMMENT '状态: DRAFT/PUBLISHED/EXPIRED',
  `publish_at` datetime DEFAULT NULL COMMENT '发布时间；PUBLISHED 且未来时间为定时发布',
  `expire_at` datetime DEFAULT NULL COMMENT '过期时间；NULL 表示不过期',
  `created_by` bigint DEFAULT NULL COMMENT '创建管理员ID；系统种子为 NULL',
  `updated_by` bigint DEFAULT NULL COMMENT '最后修改管理员ID',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_status_publish` (`status`,`publish_at`),
  KEY `idx_target_status` (`target_audience`,`status`),
  KEY `idx_created_at` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='站内公告';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码(BCrypt加密)',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '昵称',
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '头像URL',
  `cet_level` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '考试级别: CET4/CET6',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `roles` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'ROLE_USER' COMMENT '角色: ROLE_USER/ROLE_ADMIN',
  `status` tinyint DEFAULT '1' COMMENT '状态: 1=正常, 0=禁用',
  `last_login_at` datetime DEFAULT NULL COMMENT '最后登录时间',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='用户账户表';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_ability_radar` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `vocabulary_score` decimal(5,2) DEFAULT '0.00' COMMENT '词汇能力分',
  `grammar_score` decimal(5,2) DEFAULT '0.00' COMMENT '语法能力分',
  `listening_score` decimal(5,2) DEFAULT '0.00' COMMENT '听力能力分',
  `reading_score` decimal(5,2) DEFAULT '0.00' COMMENT '阅读能力分',
  `elo_score` int DEFAULT '1000' COMMENT 'ELO能力总分',
  `target_level` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '目标等级/能力评级',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_user_id` (`user_id`) USING BTREE,
  KEY `idx_elo_score` (`elo_score`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='用户能力雷达图表';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_check_in` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `check_in_date` date NOT NULL COMMENT '签到日期',
  `reward_coins` int NOT NULL DEFAULT '0' COMMENT '本次签到获得金币（含连续奖励与里程碑）',
  `streak_days` int NOT NULL DEFAULT '1' COMMENT '签到时的连续天数',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_user_date` (`user_id`,`check_in_date`),
  KEY `idx_user_created` (`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='每日签到记录';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_coin_account` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `balance` int NOT NULL DEFAULT '0' COMMENT '当前金币余额',
  `total_earned` int NOT NULL DEFAULT '0' COMMENT '累计获得金币',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户金币账户';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_coin_transaction` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `amount` int NOT NULL COMMENT '金币变动值（正数为获得）',
  `biz_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '业务类型: CHECK_IN/CHECK_IN_MILESTONE/VOCAB_GROUP',
  `biz_key` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '业务幂等键',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '流水描述',
  `balance_after` int DEFAULT NULL COMMENT '变动后余额',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_biz_key` (`biz_key`),
  KEY `idx_user_created` (`user_id`,`created_at`),
  KEY `idx_user_biz_type` (`user_id`,`biz_type`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='金币流水';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_notice_read` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `notice_id` bigint NOT NULL COMMENT '通知ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `read_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '已读时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_notice_user` (`notice_id`,`user_id`),
  KEY `idx_user_read` (`user_id`,`read_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户通知已读记录';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_preference` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `vocab_group_size` int DEFAULT NULL COMMENT '每组单词数量（5-50）',
  `daily_new_words` int DEFAULT NULL COMMENT '每日新背单词数（1-50）',
  `daily_review_words` int DEFAULT NULL COMMENT '每日复习单词数（0-50）',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户学习偏好';
/*!40101 SET character_set_client = @saved_cs_client */;
