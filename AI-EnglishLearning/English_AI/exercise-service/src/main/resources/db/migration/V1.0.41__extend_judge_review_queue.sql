-- V1.0.41__extend_judge_review_queue.sql：审核队列补 AI 评分三列
-- 目标库：exercise_db
-- 风险：低（仅新增 3 个可空列，不改既有列、不动数据）
-- 回滚：ALTER TABLE `judge_review_queue` DROP COLUMN `judge_context`, DROP COLUMN `ai_result`, DROP COLUMN `ai_confidence`;
-- 版本说明：V1.0.30~40 已被真题导入与听力音频占用，本迁移顺延到 V1.0.41。
-- 背景：段落翻译接 AI 评分后，灰区样本入队需要记录「AI 给了多少分、结论是什么、判题上下文」。
--       V1.0.27 建表时这三列尚不存在，属能力预留，本轮补齐。

ALTER TABLE `judge_review_queue`
  ADD COLUMN `ai_confidence` DECIMAL(4,3) DEFAULT NULL
      COMMENT 'AI 评分归一化 0.000~1.000（rawScore / maxScore）' AFTER `matched_level`,
  ADD COLUMN `ai_result` VARCHAR(20) DEFAULT NULL
      COMMENT 'AI 结论: CORRECT/PARTIAL/INCORRECT' AFTER `ai_confidence`,
  ADD COLUMN `judge_context` VARCHAR(1000) DEFAULT NULL
      COMMENT '判题上下文快照（模式/分数档位/耗时等）' AFTER `ai_result`;
