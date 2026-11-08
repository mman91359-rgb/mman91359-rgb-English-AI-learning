-- V1.0.12：词库难度提示 + 题目词条原形
-- 目标库：exercise_db
-- 风险：低（两次 ALTER TABLE ADD COLUMN，均为可空列，不影响存量数据）
-- 回滚：
--   ALTER TABLE `word_dictionary` DROP COLUMN `difficulty_hint`;
--   ALTER TABLE `question_info` DROP COLUMN `answer_word`;
-- 说明：
--   1. difficulty_hint 由 scripts/export-word-difficulty.mjs 计算（词书内 sort_no 名次百分位映射 2~7），
--      再由 scripts/backfill-word-difficulty.mjs 回填；本迁移只加列，不做数据变更。
--   2. answer_word 存词条原形（如题干答案为 inferred，此列为 infer），仅用于新词去重，不下发前端。
--      旧题该列为 NULL，应用层回落使用 correct_answer，行为不变。
--   3. 新增字段后必须本迁移先于新代码生效；Spring Boot 启动时 Flyway 会先执行迁移再对外提供服务。

ALTER TABLE `word_dictionary`
  ADD COLUMN `difficulty_hint` TINYINT NULL
    COMMENT '难度提示 2~7，由词书序位百分位映射' AFTER `level`;

ALTER TABLE `question_info`
  ADD COLUMN `answer_word` VARCHAR(100) NULL
    COMMENT '词条原形，仅用于新词去重，不下发前端' AFTER `accepted_answers`;
