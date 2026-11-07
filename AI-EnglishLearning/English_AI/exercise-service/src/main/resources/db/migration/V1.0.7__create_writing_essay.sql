-- V1.0.7__create_writing_essay.sql
-- 目标库：exercise_db
-- 新增写作作文记录表：作文"先落库后评分"，AI 评分失败时保留原文并标记未评分，支持重新评分。
-- 风险等级：低（纯新增表，无 DROP/ALTER，不触碰已有数据）
-- 回滚方式：DROP TABLE `writing_essay`;

CREATE TABLE `writing_essay` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '作文记录ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `topic_key` varchar(64) NOT NULL COMMENT '题目key（对应前端静态题库 id）',
  `topic_title` varchar(255) DEFAULT NULL COMMENT '题目标题快照',
  `content` text NOT NULL COMMENT '作文原文',
  `word_count` int DEFAULT NULL COMMENT '词数',
  `duration_seconds` int DEFAULT NULL COMMENT '答题用时(秒)',
  `ai_scored` tinyint NOT NULL DEFAULT 0 COMMENT 'AI是否已评分: 1=已评分, 0=未评分(降级待重评)',
  `score_json` text DEFAULT NULL COMMENT '评分结果快照(JSON)',
  `raw_score` decimal(4,1) DEFAULT NULL COMMENT '原始分(满分15)',
  `weighted_score` decimal(5,1) DEFAULT NULL COMMENT '百分制折算分',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_created` (`user_id`,`created_at`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='写作作文记录表';
