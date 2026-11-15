-- V1.0.9：用户偏好新增「收藏词并行」开关
-- 目标库：user_db
-- 风险：低（纯 DDL；新增一列带默认值，不影响存量行）
-- 回滚：
--   ALTER TABLE `user_preference` DROP COLUMN `include_favorite_words`;
-- 说明：
--   1. 语义：1 = 新词队列中收藏词优先于词书词；0 = 只按当前词书取词。
--   2. 收藏词仍受「同等级 + 有题」约束（在 CET4 词书下收藏的六级词需切到六级词书才入队），
--      与既有「词书取题禁止跨等级兜底」的约定一致。
--   3. 存量行统一为 0（关闭），与升级前行为完全一致，不改变任何用户现有行为。
--   4. 默认关闭是保守选择：开启后新词队列会被收藏词占用每日新词名额。

ALTER TABLE `user_preference`
  ADD COLUMN `include_favorite_words` tinyint(1) NOT NULL DEFAULT 0
    COMMENT '新词队列是否并行收藏词：1=收藏词优先于词书词，0=仅按当前词书取词'
    AFTER `active_word_book_id`;
