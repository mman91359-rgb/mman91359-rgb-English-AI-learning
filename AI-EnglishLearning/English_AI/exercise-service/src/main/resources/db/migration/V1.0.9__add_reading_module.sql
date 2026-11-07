-- V1.0.9：新增阅读模块（module_type=7）与纯文字听力支持
-- 目标库：exercise_db
-- 风险：中（新建表 + 两次 ALTER TABLE；MySQL DDL 不可事务回滚）
-- 回滚：
--   ALTER TABLE `question_info` DROP INDEX `idx_question_passage`, DROP COLUMN `passage_id`;
--   DROP TABLE `reading_passage`;
--   ALTER TABLE `listening_audio` MODIFY COLUMN `audio_url` varchar(255) NOT NULL COMMENT '音频地址，如 /audio/listening-cet4-01.mp3';
-- 禁止修改已应用的 V1.0.0 ~ V1.0.8。

-- ----------------------------
-- 1. 阅读文章表：一篇阅读对应多道题，正文只存一份
-- ----------------------------
CREATE TABLE `reading_passage` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '阅读文章ID',
  `external_key` varchar(120) NOT NULL COMMENT '导入唯一键，如 cet4-2019-12-reading-1',
  `passage_type` varchar(32) NOT NULL COMMENT 'BANKED_CLOZE=选词填空 / CAREFUL_READING=仔细阅读 / MATCHING=长篇信息匹配',
  `target_level` varchar(10) NOT NULL COMMENT '目标等级: CET4/CET6',
  `title` varchar(255) DEFAULT NULL COMMENT '文章标题，无标题为 NULL',
  `content` mediumtext NOT NULL COMMENT '正文；MATCHING 用 [A]/[B] 标注段落',
  `content_translation` mediumtext DEFAULT NULL COMMENT '参考译文（可选）',
  `word_bank` json DEFAULT NULL COMMENT '选词填空备选词库，如 ["A. absorb","B. ..."]；其他题型为 NULL',
  `word_count` int DEFAULT NULL COMMENT '正文词数',
  `source` varchar(50) NOT NULL DEFAULT 'IMPORT' COMMENT '来源: MANUAL/AI/IMPORT',
  `exam_key` varchar(64) DEFAULT NULL COMMENT '来源考次，如 cet4-2019-12',
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除: 0=正常, 1=已删除',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_reading_external_key` (`external_key`) USING BTREE,
  KEY `idx_reading_level_type` (`target_level`, `passage_type`) USING BTREE,
  KEY `idx_reading_exam` (`exam_key`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='阅读理解文章表';

-- ----------------------------
-- 2. 题目关联文章
-- ----------------------------
ALTER TABLE `question_info`
  ADD COLUMN `passage_id` bigint DEFAULT NULL COMMENT '阅读文章ID，仅 module_type=7 使用' AFTER `knowledge_point_id`,
  ADD KEY `idx_question_passage` (`passage_id`);

-- ----------------------------
-- 3. 同步 module_type 注释（新增 7=阅读），只改元数据
-- ----------------------------
ALTER TABLE `question_info`
  MODIFY COLUMN `module_type` tinyint NOT NULL COMMENT '模块类型: 1=词汇, 2=语法, 3=翻译, 4=听力, 5=造句, 6=写作, 7=阅读';

-- ----------------------------
-- 4. 听力支持纯文字：音频地址允许为空
-- ----------------------------
ALTER TABLE `listening_audio`
  MODIFY COLUMN `audio_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
    COMMENT '音频地址；NULL=纯文字听力（只提供 transcript）';
