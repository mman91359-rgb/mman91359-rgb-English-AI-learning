-- V1.0.52：单词学习事件日志
-- 目标库：exercise_db
-- 风险：低（纯 DDL，一张新表）
-- 回滚：
--   DROP TABLE `user_word_learn_log`;
-- 说明：
--   1. 记录单词状态变迁事件，与答题日志 user_exercise_log 分离：
--      答题归 user_exercise_log，单词状态归本表，接口层合并排序，不镜像。
--   2. event_type 枚举：LEARN=新学 / REVIEW=复习 / MASTER=掌握 / FAVORITE=收藏 /
--      UNFAVORITE=取消收藏 / IGNORE=忽略。
--   3. word_id 关联 word_dictionary.id（可空）；word 冗余小写便于展示。
--   4. book_code 记录当时词书（可空，手工/每日词无词书）。

CREATE TABLE `user_word_learn_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `word_id` bigint DEFAULT NULL COMMENT '关联 word_dictionary.id（可空）',
  `word` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '单词（小写）',
  `event_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '事件类型: LEARN/REVIEW/MASTER/FAVORITE/UNFAVORITE/IGNORE',
  `book_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '当时词书编码（可空）',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_user_created` (`user_id`,`created_at`),
  KEY `idx_user_event` (`user_id`,`event_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='单词学习事件日志';
