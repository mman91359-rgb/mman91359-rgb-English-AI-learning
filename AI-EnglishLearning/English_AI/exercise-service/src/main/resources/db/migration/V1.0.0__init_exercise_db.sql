-- Flyway V1.0.0 — exercise_db 当前完整结构快照（2026-10-31）
-- 由本地 MySQL 8.0.28 实际结构生成；已去除删表语句与 USE，统一 utf8mb4_unicode_ci。

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daily_word` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `word_id` bigint NOT NULL COMMENT 'FK to word_dictionary.id',
  `date` date NOT NULL COMMENT '鏃ユ湡',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `date` (`date`) USING BTREE,
  KEY `idx_date` (`date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='姣忔棩鍗曡瘝';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `judgment_cache` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `question_id` bigint NOT NULL COMMENT '题目ID',
  `user_answer` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户答案',
  `correct_answer` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '正确答案',
  `heuristic_hint` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '启发式提示',
  `error_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '错误类型',
  `matched_level` int DEFAULT NULL COMMENT '匹配层级',
  `hit_count` int DEFAULT '1' COMMENT '命中次数',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_question_answer` (`question_id`,`user_answer`(100)),
  KEY `idx_created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='判题结果缓存表';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `knowledge_mapping` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '映射ID',
  `question_id` bigint NOT NULL COMMENT '题目ID',
  `knowledge_point_id` bigint NOT NULL COMMENT '知识点ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_question_knowledge` (`question_id`,`knowledge_point_id`) USING BTREE,
  KEY `idx_question_id` (`question_id`) USING BTREE,
  KEY `idx_knowledge_point_id` (`knowledge_point_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=456 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='题目-知识点映射表';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `listening_audio` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '音频ID',
  `question_id` bigint NOT NULL COMMENT '关联 question_info.id',
  `audio_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '音频地址，如 /audio/listening-cet4-01.mp3',
  `transcript` text COLLATE utf8mb4_unicode_ci COMMENT '听力原文',
  `duration_seconds` int DEFAULT NULL COMMENT '音频时长（秒）',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_question_id` (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='听力音频元数据表';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question_buggy_path` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `question_id` bigint NOT NULL COMMENT '关联题目ID',
  `wrong_answer` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '错误答案',
  `heuristic_hint` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '启发式提示（引导思考，不直接给答案）',
  `error_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '错误类型：SPELLING/GRAMMAR/PREPOSITION/ARTICLE/TENSE/VOCABULARY/UNKNOWN',
  `knowledge_point_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '关联知识点ID（多个用逗号分隔）',
  `occurrence_count` int DEFAULT '1' COMMENT '出现次数',
  `is_ai_generated` tinyint DEFAULT '0' COMMENT '是否AI生成：0=人工预设，1=AI生成',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_question_id` (`question_id`),
  KEY `idx_wrong_answer` (`wrong_answer`(100)),
  KEY `idx_error_type` (`error_type`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='题目常见错误路径表(Buggy Paths)';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question_content` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '内容ID',
  `question_id` bigint NOT NULL COMMENT '题目ID(关联question_info)',
  `stem` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '题干',
  `options` json DEFAULT NULL COMMENT '选项(JSON格式)',
  `correct_answer` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '正确答案',
  `analysis` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '题目解析',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_question_id` (`question_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=468 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='题目内容表(前后端分离,防泄漏)';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question_info` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '题目ID',
  `module_type` tinyint NOT NULL COMMENT '模块类型: 1=词汇, 2=语法',
  `target_level` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '目标等级: CET4/CET6',
  `difficulty_level` int NOT NULL COMMENT '难度等级: 1~8',
  `question_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '题型: CHOICE/FILL_BLANK/TRANSLATION/WRITING',
  `knowledge_point_id` bigint DEFAULT NULL COMMENT '关联知识点ID',
  `source` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'MANUAL' COMMENT '来源: MANUAL/AI/IMPORT',
  `accepted_answers` json DEFAULT NULL COMMENT 'accepted_answers',
  `ai_generated` tinyint DEFAULT '0' COMMENT 'ai_generated',
  `usage_count` int DEFAULT '0' COMMENT '被使用次数',
  `is_deleted` tinyint DEFAULT '0' COMMENT '逻辑删除: 0=正常, 1=已删除',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_target_module_diff` (`target_level`,`module_type`,`difficulty_level`) USING BTREE,
  KEY `idx_knowledge_point` (`knowledge_point_id`) USING BTREE,
  KEY `idx_question_type` (`question_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=468 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='题目元数据表(高频查询)';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question_pending` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `module_type` int NOT NULL COMMENT '模块类型: 1=词汇, 2=语法',
  `target_level` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '目标等级: CET4/CET6',
  `difficulty_level` int DEFAULT '3' COMMENT '难度等级: 1~8',
  `question_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '题型: FILL_BLANK/SENTENCE_MAKING',
  `stem` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '题干',
  `options` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '选项(JSON数组)',
  `correct_answer` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '正确答案',
  `analysis` text COLLATE utf8mb4_unicode_ci COMMENT '题目解析',
  `knowledge_point_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '关联知识点名称',
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'PENDING' COMMENT '状态: PENDING=待审核, APPROVED=已通过, REJECTED=已驳回',
  `reviewer_id` bigint DEFAULT NULL COMMENT '审核人ID',
  `review_comment` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '审核意见',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_status` (`status`),
  KEY `idx_module_type` (`module_type`),
  KEY `idx_target_level` (`target_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='AI生成待审核题目表';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_knowledge_point` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '知识点ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '知识点名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父知识点ID(0=根节点)',
  `cet_level` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '考试级别: CET4/CET6',
  `sort_order` int DEFAULT '0' COMMENT '排序序号',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_parent_id` (`parent_id`) USING BTREE,
  KEY `idx_cet_level` (`cet_level`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='知识点树表';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_error_book` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `question_id` bigint NOT NULL COMMENT '题目ID',
  `wrong_count` int DEFAULT '1' COMMENT '错误次数',
  `last_wrong_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '最后错误时间',
  `is_resolved` tinyint DEFAULT '0' COMMENT '是否已掌握: 0=未解决, 1=已解决',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_user_question` (`user_id`,`question_id`) USING BTREE,
  KEY `idx_user_resolved` (`user_id`,`is_resolved`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='错题本表';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_exercise_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `question_id` bigint NOT NULL COMMENT '题目ID',
  `user_answer` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户答案',
  `is_correct` tinyint DEFAULT NULL COMMENT '是否正确: 1=正确, 0=错误',
  `duration_seconds` int DEFAULT NULL COMMENT '答题用时(秒)',
  `module_type` tinyint DEFAULT NULL COMMENT '模块类型: 1=词汇, 2=语法',
  `trace_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '全链路追踪ID',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_created` (`user_id`,`created_at`) USING BTREE,
  KEY `idx_user_correct` (`user_id`,`is_correct`) USING BTREE,
  KEY `idx_trace_id` (`trace_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=289 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='答题记录表';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_favorite` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `sentence_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '收藏的句子/题干',
  `question_id` bigint DEFAULT NULL COMMENT '关联题目ID（可空）',
  `source_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SENTENCE' COMMENT '来源: SENTENCE/EXERCISE',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_favorite` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='收藏句';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_study_session` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `session_key` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户端会话唯一键',
  `stat_date` date NOT NULL COMMENT '会话开始日期（Asia/Shanghai）',
  `active_seconds` int NOT NULL DEFAULT '0' COMMENT '有效活跃秒数',
  `started_at` datetime NOT NULL COMMENT '会话开始时间',
  `last_reported_at` datetime NOT NULL COMMENT '最后上报时间',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_user_session` (`user_id`,`session_key`),
  KEY `idx_user_date` (`user_id`,`stat_date`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='学习会话活跃时长';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_vocabulary` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `word` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '单词',
  `translation` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '释义',
  `phonetic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '音标',
  `pos` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '词性',
  `example` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '英文例句',
  `example_translation` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '例句中文翻译',
  `collocation` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '常见搭配',
  `source` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'manual' COMMENT '来源: manual / ai',
  `review_count` int DEFAULT '0' COMMENT '复习次数',
  `mastery_level` int DEFAULT '0' COMMENT '掌握度等级',
  `last_reviewed_at` datetime DEFAULT NULL COMMENT '上次复习时间',
  `next_review_at` datetime DEFAULT NULL COMMENT '下次复习时间',
  `is_mastered` tinyint DEFAULT '0' COMMENT '是否掌握: 0=未掌握, 1=已掌握',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_user_word` (`user_id`,`word`) USING BTREE,
  KEY `idx_user_vocab` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='用户单词本';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `word_dictionary` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `word` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鍗曡瘝',
  `phonetic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '闊虫爣',
  `translation` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '涓?枃閲婁箟',
  `pos` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '璇嶆?',
  `example` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '渚嬪彞(鑻辨枃)',
  `example_translation` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '渚嬪彞缈昏瘧',
  `level` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'CET4' COMMENT '绛夌骇: CET4/CET6',
  `usage_count` int DEFAULT '0' COMMENT '被用作每日单词的次数',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_word` (`word`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='绯荤粺鍗曡瘝璇嶅吀';
/*!40101 SET character_set_client = @saved_cs_client */;
