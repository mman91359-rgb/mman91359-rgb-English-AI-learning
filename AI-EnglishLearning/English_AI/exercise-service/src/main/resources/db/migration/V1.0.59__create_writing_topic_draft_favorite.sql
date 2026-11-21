-- V1.0.59__create_writing_topic_draft_favorite.sql
-- 目标库：exercise_db
-- 新增写作题库 / 草稿 / 收藏三张表。此前三者全部由前端静态数组与 localStorage 顶着：
-- 题库打进包里（改题要改代码重新发版）、草稿与收藏按 userId 存在浏览器本地（换设备即丢，
-- 同一账号两台机器看到不同草稿）。所属服务 exercise-service。
-- 草稿与收藏的唯一键直接写在 DDL 里，不靠应用层去重：并发下两人同时点收藏会插出两条重复记录，
-- 事后要手工清洗数据。
-- 风险等级：低（纯新增表，无 DROP / ALTER，不触碰已有数据）
-- 回滚方式：DROP TABLE `writing_favorite`; DROP TABLE `writing_draft`; DROP TABLE `writing_topic`;

CREATE TABLE `writing_topic` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `topic_key` varchar(64) NOT NULL COMMENT '题目key；与 writing_essay.topic_key 同一命名空间',
  `type` varchar(20) NOT NULL COMMENT '题型：ESSAY/PRACTICAL/LETTER/NOTICE 等',
  `level` varchar(20) DEFAULT NULL COMMENT '等级：CET4/CET6；NULL 表示通用',
  `title` varchar(255) NOT NULL COMMENT '题目标题',
  `directions` text COMMENT '中文写作指令',
  `topic` text COMMENT '英文题目陈述（考生看到的题干）',
  `requirements` text COMMENT '写作要求列表，JSON 数组',
  `word_range_min` int DEFAULT NULL COMMENT '字数下限',
  `word_range_max` int DEFAULT NULL COMMENT '字数上限',
  `time_limit_seconds` int DEFAULT NULL COMMENT '建议用时（秒）',
  `source` varchar(64) DEFAULT NULL COMMENT '来源，如 2022.12 CET6 第一套；练习题为空',
  `outline_hints` text COMMENT '提纲提示，JSON 数组',
  `useful_expressions` text COMMENT '常用表达，JSON 数组',
  `sort_order` int NOT NULL DEFAULT 0 COMMENT '排序权重，越小越前',
  `status` varchar(20) NOT NULL DEFAULT 'PUBLISHED' COMMENT '状态：PUBLISHED/OFFLINE',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_topic_key` (`topic_key`) USING BTREE,
  KEY `idx_level_type` (`level`,`type`) USING BTREE,
  KEY `idx_status_sort` (`status`,`sort_order`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='写作题库';

CREATE TABLE `writing_draft` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `topic_key` varchar(64) NOT NULL COMMENT '题目key；与 writing_topic.topic_key 对应',
  `content` text COMMENT '草稿正文，可为空（用户清空后仍保留这一行便于继续写）',
  `elapsed_seconds` int NOT NULL DEFAULT 0 COMMENT '累计作答用时（秒），前端覆盖写入不作累加',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_user_topic` (`user_id`,`topic_key`) USING BTREE,
  KEY `idx_user_updated` (`user_id`,`updated_at`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='写作草稿（每用户每题仅一行）';

CREATE TABLE `writing_favorite` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `topic_key` varchar(64) NOT NULL COMMENT '题目key；与 writing_topic.topic_key 对应',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '收藏时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_user_topic` (`user_id`,`topic_key`) USING BTREE,
  KEY `idx_user_created` (`user_id`,`created_at`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='写作题目收藏（每用户每题仅一行）';
