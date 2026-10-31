-- Flyway V1.0.0 — learning_db 当前完整结构快照（2026-10-31）
-- 由本地 MySQL 8.0.28 实际结构生成；已去除删表语句与 USE，统一 utf8mb4_unicode_ci。

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_memory_curve` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `question_id` bigint NOT NULL COMMENT '题目ID',
  `mastery_level` int DEFAULT '1' COMMENT '掌握等级: 1=陌生, 2=模糊, 3=熟悉, 4=熟练, 5=精通',
  `next_review_time` datetime NOT NULL COMMENT '下次复习时间',
  `review_count` int DEFAULT '0' COMMENT '已复习次数',
  `last_review_at` datetime DEFAULT NULL COMMENT '最后复习时间',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_user_question` (`user_id`,`question_id`) USING BTREE,
  KEY `idx_user_review` (`user_id`,`next_review_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='艾宾浩斯遗忘曲线表(系统核心表)';
/*!40101 SET character_set_client = @saved_cs_client */;
