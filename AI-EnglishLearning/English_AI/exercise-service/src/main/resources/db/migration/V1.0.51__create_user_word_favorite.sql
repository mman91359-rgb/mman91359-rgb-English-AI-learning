-- V1.0.51：收藏单词表（与句子收藏 user_favorite 分表）
-- 目标库：exercise_db
-- 风险：低（纯 DDL，一张新表）
-- 回滚：
--   DROP TABLE `user_word_favorite`;
-- 说明：
--   1. 收藏单词与已学词库（user_vocabulary）分表：收藏未学词不创建 user_vocabulary，
--      不影响新词池，也不进复习队列。
--   2. word_id 关联 word_dictionary.id（可空：手工收藏的词可能不在词库）。
--   3. word 冗余存小写，便于展示与去重。

CREATE TABLE `user_word_favorite` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `word_id` bigint DEFAULT NULL COMMENT '关联 word_dictionary.id（可空）',
  `word` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '单词（小写）',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_user_word` (`user_id`,`word`),
  KEY `idx_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='用户收藏单词';
