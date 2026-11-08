-- V1.0.25：Top200 高频填空题 accepted_answers 追加合法变体（由 scripts/patch-accepted-top200.mjs 生成，请勿手改）
-- 目标库：exercise_db
-- 风险：低（纯 UPDATE，只改 accepted_answers；新集合 = 现有 ∪ 新增，不删除历史值）
-- 回滚：accepted_answers 为 JSON 数组，可用导入前备份恢复；本脚本不新增行、不改其他字段
-- 生成时间：2026-11-08T15:33:06.307Z
-- 涉及题目：3 行

-- seed-vocab-cet4-28 (study) 新增：studies, studied, studying
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('study', 'studies', 'studied', 'studying')
 WHERE `external_key` = 'seed-vocab-cet4-28'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('studies')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('studied')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('studying'))));

-- seed-vocab-cet6-17 (substantiate) 新增：substantiate, substantiates, substantiating
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('substantiated', 'substantiate', 'substantiates', 'substantiating')
 WHERE `external_key` = 'seed-vocab-cet6-17'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('substantiate')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('substantiates')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('substantiating'))));

-- seed-vocab-cet6-26 (become) 新增：became, becomes, becoming
UPDATE `question_info`
   SET `accepted_answers` = JSON_ARRAY('become', 'became', 'becomes', 'becoming')
 WHERE `external_key` = 'seed-vocab-cet6-26'
   AND (`accepted_answers` IS NULL
        OR JSON_LENGTH(`accepted_answers`) = 0
        OR NOT (JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('became')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('becomes')) AND JSON_CONTAINS(COALESCE(`accepted_answers`, JSON_ARRAY()), JSON_QUOTE('becoming'))));
