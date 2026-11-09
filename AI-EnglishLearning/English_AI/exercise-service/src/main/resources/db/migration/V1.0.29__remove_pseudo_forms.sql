-- V1.0.29__remove_pseudo_forms.sql：删除 accepted_answers 中的 12 个伪形态变体
-- 目标库：exercise_db
-- 风险：低（只删 12 个字符串，涉及 6 行；不新增行、不改其他字段、不动其他变体）
-- 回滚：用迁移前的 question_info 数据备份恢复；或对 6 行用 JSON_ARRAY_APPEND 逐个补回（顺序会变）
-- 依据：docs/review/answer-slot-audit-20261109.md 的 PSEUDO_FORM（置信度 0.90）
-- 例外条款：见 docs/数据库迁移规范.md 2.4-E「只增不减的例外」——
--           仅允许删除经规则判定 + 人工复核确认的变体，逐条白名单，禁止整列重写。
--
-- 白名单（人工复核结论）：
--   vocab-auto-7225-1  fur     → furer / furest        （非词）
--   vocab-auto-7672-1  knee    → kneer / kneest       （非词）
--   vocab-auto-8302-1  poetry  → poetrier / poetriest （非词）
--   vocab-auto-6358-1  cheer   → cheerer / cheerest   （cheerer 是真实派生名词"喝彩者"，但题干要动词原形）
--   vocab-auto-7373-1  harm    → harmer / harmest     （harmer 是真实派生名词"伤害者"，但题干要名词原形）
--   vocab-auto-10345-1 fiber   → fiberer / fiberest   （非词）
--
-- 幂等：JSON_CONTAINS 守卫，重复执行影响 0 行；
--       用 JSON_REMOVE + JSON_SEARCH 定向摘除单个元素，不整列重写。

-- vocab-auto-7225-1 (fur)
UPDATE `question_info`
   SET `accepted_answers` = JSON_REMOVE(`accepted_answers`,
         JSON_UNQUOTE(JSON_SEARCH(`accepted_answers`, 'one', 'furer')))
 WHERE `external_key` = 'vocab-auto-7225-1'
   AND JSON_CONTAINS(`accepted_answers`, JSON_QUOTE('furer'));

UPDATE `question_info`
   SET `accepted_answers` = JSON_REMOVE(`accepted_answers`,
         JSON_UNQUOTE(JSON_SEARCH(`accepted_answers`, 'one', 'furest')))
 WHERE `external_key` = 'vocab-auto-7225-1'
   AND JSON_CONTAINS(`accepted_answers`, JSON_QUOTE('furest'));

-- vocab-auto-7672-1 (knee)
UPDATE `question_info`
   SET `accepted_answers` = JSON_REMOVE(`accepted_answers`,
         JSON_UNQUOTE(JSON_SEARCH(`accepted_answers`, 'one', 'kneer')))
 WHERE `external_key` = 'vocab-auto-7672-1'
   AND JSON_CONTAINS(`accepted_answers`, JSON_QUOTE('kneer'));

UPDATE `question_info`
   SET `accepted_answers` = JSON_REMOVE(`accepted_answers`,
         JSON_UNQUOTE(JSON_SEARCH(`accepted_answers`, 'one', 'kneest')))
 WHERE `external_key` = 'vocab-auto-7672-1'
   AND JSON_CONTAINS(`accepted_answers`, JSON_QUOTE('kneest'));

-- vocab-auto-8302-1 (poetry)
UPDATE `question_info`
   SET `accepted_answers` = JSON_REMOVE(`accepted_answers`,
         JSON_UNQUOTE(JSON_SEARCH(`accepted_answers`, 'one', 'poetrier')))
 WHERE `external_key` = 'vocab-auto-8302-1'
   AND JSON_CONTAINS(`accepted_answers`, JSON_QUOTE('poetrier'));

UPDATE `question_info`
   SET `accepted_answers` = JSON_REMOVE(`accepted_answers`,
         JSON_UNQUOTE(JSON_SEARCH(`accepted_answers`, 'one', 'poetriest')))
 WHERE `external_key` = 'vocab-auto-8302-1'
   AND JSON_CONTAINS(`accepted_answers`, JSON_QUOTE('poetriest'));

-- vocab-auto-6358-1 (cheer)
UPDATE `question_info`
   SET `accepted_answers` = JSON_REMOVE(`accepted_answers`,
         JSON_UNQUOTE(JSON_SEARCH(`accepted_answers`, 'one', 'cheerer')))
 WHERE `external_key` = 'vocab-auto-6358-1'
   AND JSON_CONTAINS(`accepted_answers`, JSON_QUOTE('cheerer'));

UPDATE `question_info`
   SET `accepted_answers` = JSON_REMOVE(`accepted_answers`,
         JSON_UNQUOTE(JSON_SEARCH(`accepted_answers`, 'one', 'cheerest')))
 WHERE `external_key` = 'vocab-auto-6358-1'
   AND JSON_CONTAINS(`accepted_answers`, JSON_QUOTE('cheerest'));

-- vocab-auto-7373-1 (harm)
UPDATE `question_info`
   SET `accepted_answers` = JSON_REMOVE(`accepted_answers`,
         JSON_UNQUOTE(JSON_SEARCH(`accepted_answers`, 'one', 'harmer')))
 WHERE `external_key` = 'vocab-auto-7373-1'
   AND JSON_CONTAINS(`accepted_answers`, JSON_QUOTE('harmer'));

UPDATE `question_info`
   SET `accepted_answers` = JSON_REMOVE(`accepted_answers`,
         JSON_UNQUOTE(JSON_SEARCH(`accepted_answers`, 'one', 'harmest')))
 WHERE `external_key` = 'vocab-auto-7373-1'
   AND JSON_CONTAINS(`accepted_answers`, JSON_QUOTE('harmest'));

-- vocab-auto-10345-1 (fiber)
UPDATE `question_info`
   SET `accepted_answers` = JSON_REMOVE(`accepted_answers`,
         JSON_UNQUOTE(JSON_SEARCH(`accepted_answers`, 'one', 'fiberer')))
 WHERE `external_key` = 'vocab-auto-10345-1'
   AND JSON_CONTAINS(`accepted_answers`, JSON_QUOTE('fiberer'));

UPDATE `question_info`
   SET `accepted_answers` = JSON_REMOVE(`accepted_answers`,
         JSON_UNQUOTE(JSON_SEARCH(`accepted_answers`, 'one', 'fiberest')))
 WHERE `external_key` = 'vocab-auto-10345-1'
   AND JSON_CONTAINS(`accepted_answers`, JSON_QUOTE('fiberest'));
