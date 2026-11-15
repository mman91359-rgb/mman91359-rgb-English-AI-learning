-- V1.0.54：用户词汇库合并「忽略」为「标熟」，并补状态达成时间
-- 目标库：exercise_db
-- 风险：低（新增两列均为可空；枚举重命名存量 0 行，实际不改动任何数据行）
-- 回滚：
--   ALTER TABLE `user_vocabulary`
--     DROP COLUMN `mastered_at`,
--     DROP COLUMN `familiar_at`;
--   UPDATE `user_vocabulary` SET `status`='IGNORE' WHERE `status`='FAMILIAR';
--   ALTER TABLE `user_vocabulary`
--     MODIFY COLUMN `status` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
--       DEFAULT 'LEARNING' COMMENT '学习状态: LEARNING/REVIEWING/MASTERED/IGNORE' AFTER `source`;
--   ALTER TABLE `user_word_learn_log`
--     MODIFY COLUMN `event_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
--       NOT NULL COMMENT '事件类型: LEARN/REVIEW/MASTER/FAVORITE/UNFAVORITE/IGNORE' AFTER `word`;
-- 说明：
--   1. 产品上「忽略」与「标熟」合并为一个动作：用户唯一可操作的排除手段是「标熟」，
--      标熟即退出新词池与复习队列。与原 IGNORE 的唯一差别是——标熟计入已学
--      （图示里「已标熟」与「未学习」是分开的两档）。
--      存量核查（2026-11-15 实测）：user_vocabulary 中 status='IGNORE' 为 0 行，
--      user_word_learn_log 中 event_type='IGNORE' 为 0 条，故重命名无数据风险。
--   2. mastered_at / familiar_at 分别是「达成已掌握」「被标熟」的时间，
--      与 first_learned_at 一起构成「已学词库」按日期分组的分组键：
--      COALESCE(mastered_at, familiar_at, first_learned_at)
--      → 复习中按首次学习日、复习完成按 mastered_at、已标熟按 familiar_at。
--   3. 存量 mastered_at 回填口径：取 COALESCE(last_reviewed_at, updated_at)，
--      不伪造「今天达成」。
--   4. familiar_at 存量一律为 NULL（此前没有标熟行为）。

UPDATE `user_vocabulary`
  SET `status` = 'FAMILIAR'
  WHERE `status` = 'IGNORE';

ALTER TABLE `user_vocabulary`
  ADD COLUMN `familiar_at` datetime DEFAULT NULL
    COMMENT '标熟时间（状态达成日）' AFTER `first_learned_at`,
  ADD COLUMN `mastered_at` datetime DEFAULT NULL
    COMMENT '达成已掌握时间（状态达成日）' AFTER `familiar_at`,
  MODIFY COLUMN `status` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
    DEFAULT 'LEARNING'
    COMMENT '学习状态: LEARNING/REVIEWING/MASTERED/FAMILIAR' AFTER `source`;

UPDATE `user_vocabulary`
  SET `mastered_at` = COALESCE(`last_reviewed_at`, `updated_at`)
  WHERE `is_mastered` = 1 AND `mastered_at` IS NULL;

ALTER TABLE `user_word_learn_log`
  MODIFY COLUMN `event_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
    NOT NULL COMMENT '事件类型: LEARN/REVIEW/MASTER/FAVORITE/UNFAVORITE/FAMILIAR/UNFAMILIAR'
    AFTER `word`;
