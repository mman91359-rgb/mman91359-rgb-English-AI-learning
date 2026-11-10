-- V1.0.30：question_info 新增 exam_key 考次字段
-- 目标库：exercise_db
-- 风险：低（纯新增列 + 索引，不触碰已有数据；MySQL DDL 不可事务回滚，执行前已备份结构）
-- 回滚：ALTER TABLE `question_info` DROP INDEX `idx_exam_key`, DROP COLUMN `exam_key`;
-- 理由：真题按「考次」归档与残卷去重的硬需求；与 reading_passage.exam_key 口径统一（cet4-2022-06-1）。
-- 禁止修改已应用的 V1.0.0 ~ V1.0.29。

ALTER TABLE `question_info`
  ADD COLUMN `exam_key` varchar(64) NULL
    COMMENT '来源考次，如 cet4-2022-06-1；残卷/借用套次沿用本套 examId' AFTER `external_key`,
  ADD KEY `idx_exam_key` (`exam_key`);
