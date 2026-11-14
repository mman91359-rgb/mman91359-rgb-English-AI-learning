-- V1.0.50：user_vocabulary 扩展列 + 回填旧数据
-- 目标库：exercise_db
-- 风险：中（ADD COLUMN 均为可空/带默认值，不影响存量；回填为 DML，不可逆，需先备份）
-- 回滚：回填数据不可逆，回滚依赖 scripts/backup-schema.sh 的备份；
--       结构可回滚：
--         ALTER TABLE `user_vocabulary`
--           DROP COLUMN `last_result`,
--           DROP COLUMN `wrong_count`,
--           DROP COLUMN `correct_count`,
--           DROP COLUMN `first_learned_at`,
--           DROP COLUMN `book_id`,
--           DROP COLUMN `word_id`,
--           DROP COLUMN `status`;
-- 说明：
--   1. status 枚举：LEARNING=学习中 / REVIEWING=复习中 / MASTERED=已掌握 / IGNORE=忽略。
--      回填口径（保守）：correct_count=0、wrong_count=0，不拿 review_count 当答对次数（那是复习次数）。
--   2. word_id 关联 word_dictionary.id（按 word 小写匹配），用于词书归属与词卡降级。
--   3. book_id 为词书归属（可空：手工/每日单词加入的词不强制属于某本书）。
--   4. first_learned_at 首次学习时间，回填取 created_at。
--   5. last_result 最近一次复习结果：CORRECT/WRONG，旧数据无记录，置 NULL。

ALTER TABLE `user_vocabulary`
  ADD COLUMN `status` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'LEARNING'
    COMMENT '学习状态: LEARNING/REVIEWING/MASTERED/IGNORE' AFTER `source`,
  ADD COLUMN `word_id` bigint DEFAULT NULL
    COMMENT '关联 word_dictionary.id' AFTER `status`,
  ADD COLUMN `book_id` bigint DEFAULT NULL
    COMMENT '词书归属（word_book.id），手工/每日词可空' AFTER `word_id`,
  ADD COLUMN `first_learned_at` datetime DEFAULT NULL
    COMMENT '首次学习时间' AFTER `book_id`,
  ADD COLUMN `correct_count` int DEFAULT '0'
    COMMENT '累计答对次数' AFTER `first_learned_at`,
  ADD COLUMN `wrong_count` int DEFAULT '0'
    COMMENT '累计答错次数' AFTER `correct_count`,
  ADD COLUMN `last_result` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
    COMMENT '最近一次复习结果: CORRECT/WRONG' AFTER `wrong_count`;

-- 回填 word_id：按 word 小写匹配 word_dictionary
UPDATE `user_vocabulary` uv
  LEFT JOIN `word_dictionary` wd ON LOWER(uv.word) = LOWER(wd.word)
  SET uv.word_id = wd.id
  WHERE uv.word_id IS NULL;

-- 回填 status（保守口径）
UPDATE `user_vocabulary` uv
  SET uv.status = CASE
    WHEN uv.is_mastered = 1 THEN 'MASTERED'
    WHEN COALESCE(uv.review_count, 0) > 0 THEN 'REVIEWING'
    ELSE 'LEARNING'
  END
  WHERE uv.status IS NULL OR uv.status = 'LEARNING';

-- 回填 first_learned_at：取 created_at
UPDATE `user_vocabulary`
  SET first_learned_at = created_at
  WHERE first_learned_at IS NULL;

-- 回填 correct_count / wrong_count 保持 0（保守，不把复习次数当答对次数）
UPDATE `user_vocabulary`
  SET correct_count = 0, wrong_count = 0
  WHERE correct_count IS NULL OR wrong_count IS NULL;
