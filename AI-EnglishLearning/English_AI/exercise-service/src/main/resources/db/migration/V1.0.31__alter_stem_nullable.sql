-- V1.0.31：question_content.stem 改为可空
-- 目标库：exercise_db
-- 风险：低（放宽列约束；不影响已有数据——现有题目 stem 均有值）
-- 回滚：ALTER TABLE `question_content` MODIFY COLUMN `stem` text NOT NULL COMMENT '题干';
--   （回滚前提：先删除无题干的新导入听力/选词填空题）
-- 理由：四六级真题的听力题（原卷只有选项无题干转写）与选词填空题（空位在文章中）天然无题干，
--       需允许 stem 为 NULL；与 listening_audio.transcript 允许 NULL（纯文字听力）同一逻辑。
-- 禁止修改已应用的 V1.0.0 ~ V1.0.30。

ALTER TABLE `question_content`
  MODIFY COLUMN `stem` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL
    COMMENT '题干；听力/选词填空无题干为 NULL';
