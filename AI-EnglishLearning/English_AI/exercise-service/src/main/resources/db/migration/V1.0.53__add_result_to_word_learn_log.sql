-- V1.0.53：单词学习事件补充作答结果
-- 目标库：exercise_db
-- 风险：低（纯加法 DDL，新增可空列，不触碰已有数据）
-- 回滚：
--   ALTER TABLE `user_word_learn_log` DROP COLUMN `result`;
-- 说明：
--   1. 原表只有 event_type（LEARN/REVIEW/MASTER/FAVORITE/UNFAVORITE/IGNORE），
--      无法区分"新学一次是答对还是答错"，历史页只能显示"新学"，看不到对错。
--   2. 新增 result 记录当时作答结果：CORRECT / WRONG。
--      仅 LEARN / REVIEW / MASTER 有值；FAVORITE / UNFAVORITE / IGNORE 为 NULL。
--   3. 存量数据不回填：用 user_vocabulary.last_result 回填等于伪造历史
--      （last_result 是"最近一次"快照，不是事件当时结果），NULL 表示未记录。
--   4. collation 显式写 utf8mb4_unicode_ci，与 user_word_learn_log 现有列一致，
--      避免与 user_vocabulary/word_dictionary（utf8mb4_0900_ai_ci）混用。

ALTER TABLE `user_word_learn_log`
  ADD COLUMN `result` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
  DEFAULT NULL COMMENT '作答结果: CORRECT/WRONG（仅 LEARN/REVIEW/MASTER 有值）'
  AFTER `event_type`;
