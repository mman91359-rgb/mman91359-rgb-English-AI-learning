-- V1.0.38：回填 cet6-2022-12-1 听力题的 exam_key
-- 目标库：exercise_db
-- 风险：低（纯 DML UPDATE，WHERE exam_key IS NULL 保证幂等；不触碰其他数据）
-- 回滚：UPDATE `question_info` SET `exam_key` = NULL WHERE `external_key` LIKE 'cet6-2022-12-1-q%' AND `module_type` = 4;
-- 理由：V1.0.3 早期导入的 18 道听力题（Q1-8、Q16-25）早于 exam_key 字段（V1.0.30），
--       其 exam_key 为 NULL；本次真题导入（V1.0.32）补了 Q9-15（7 题）并写入 exam_key。
--       同一考次的题 exam_key 应统一，故回填这 18 题。
-- 禁止修改已应用的 V1.0.0 ~ V1.0.37。

UPDATE `question_info`
SET `exam_key` = 'cet6-2022-12-1'
WHERE `external_key` LIKE 'cet6-2022-12-1-q%'
  AND `module_type` = 4
  AND `exam_key` IS NULL;
