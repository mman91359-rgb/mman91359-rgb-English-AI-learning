-- V1.0.8：回填 question_info.external_key（仅补存量空值，不做结构变更）
-- 目标库：exercise_db
-- 风险：低（纯 DML，无 DDL；WHERE external_key IS NULL 保证幂等）
-- 回滚：UPDATE question_info SET external_key = NULL WHERE external_key LIKE 'seed-%';
-- 说明：
--   1. external_key 列与唯一索引 uk_external_key 由 V1.0.2 创建，本迁移只补数据。
--   2. 键名前缀统一用 seed-，与 V1.0.3（cet6-*）、V1.0.6（translation-*）及将来导入（vocab-*）分开，避免撞唯一键。
--   3. 使用临时表中转，规避 MySQL「UPDATE 目标表时不能在子查询里 SELECT 同一张表」的限制（错误码 1093）。

DROP TEMPORARY TABLE IF EXISTS `tmp_external_key_backfill`;

CREATE TEMPORARY TABLE `tmp_external_key_backfill` (
  `id` bigint NOT NULL COMMENT '题目ID',
  `new_key` varchar(120) NOT NULL COMMENT '回填后的外部导入键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `tmp_external_key_backfill` (`id`, `new_key`)
SELECT `id`,
       CONCAT('seed-',
              CASE `module_type`
                WHEN 1 THEN 'vocab'
                WHEN 2 THEN 'grammar'
                WHEN 4 THEN 'listening'
                ELSE 'misc'
              END,
              '-', LOWER(`target_level`), '-',
              LPAD(ROW_NUMBER() OVER (
                PARTITION BY `module_type`, `target_level`
                ORDER BY `id`
              ), 2, '0'))
FROM `question_info`
WHERE `external_key` IS NULL
  AND `module_type` IN (1, 2, 4);

UPDATE `question_info` q
INNER JOIN `tmp_external_key_backfill` t ON q.`id` = t.`id`
SET q.`external_key` = t.`new_key`
WHERE q.`external_key` IS NULL;

DROP TEMPORARY TABLE `tmp_external_key_backfill`;
