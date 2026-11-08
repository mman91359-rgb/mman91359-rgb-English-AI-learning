-- V1.0.26__clean_buggy_paths.sql：清洗 question_buggy_path 历史未归一化数据
-- 目标库：exercise_db
-- 风险：低（仅更新 wrong_answer 文本；冲突行合并 occurrence_count 后删除重复行）
-- 回滚：用迁移前的数据备份恢复；UPDATE 可按 from -> to 反向还原
-- 生成时间：2026-11-08T15:40:53.299Z
-- 归一化 1 行，合并 0 组

UPDATE `question_buggy_path`
   SET `wrong_answer` = 'meal'
 WHERE `id` = 17 AND `wrong_answer` = 'meal.';
