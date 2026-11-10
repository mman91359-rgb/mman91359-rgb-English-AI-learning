-- V1.0.39：listening_audio 新增答案关键句区间（复听定位）
-- 目标库：exercise_db
-- 风险：低（纯新增两列，可空，不触碰已有数据；MySQL DDL 不可事务回滚，执行前已备份结构）
-- 回滚：ALTER TABLE `listening_audio` DROP COLUMN `answer_end_seconds`, DROP COLUMN `answer_start_seconds`;
-- 理由：方案 6 场景二——答题结束后复听音频，支持对照原文快速定位答案关键句。
--       与 article_*/question_* 时间字段同口径（DECIMAL(8,2)，绝对秒，起点包含终点不包含）。
-- 禁止修改已应用的 V1.0.0 ~ V1.0.38。

ALTER TABLE `listening_audio`
  ADD COLUMN `answer_start_seconds` DECIMAL(8,2) NULL
    COMMENT '答案关键句起点（秒，包含）；复听定位用' AFTER `question_end_seconds`,
  ADD COLUMN `answer_end_seconds` DECIMAL(8,2) NULL
    COMMENT '答案关键句终点（秒，不包含）' AFTER `answer_start_seconds`;
