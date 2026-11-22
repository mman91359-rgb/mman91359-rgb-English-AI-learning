-- V1.0.63：basic_foundation 显示名改为「中考高考基础词」
-- 目标库：exercise_db
-- 风险：低（纯 DML，单行 UPDATE；不改 code、不动 word_book_item、不动 user_preference.active_word_book_id）
--
-- 背景：
--   V1.0.55 把 basic_500 的显示名定为「四级精选」；
--   V1.0.58 已把该书内容重建为中考+高考基础词汇 3698 词，code 改为 basic_foundation，
--   description 改为「中考与高考基础词汇，适合从零打基础」，但 name 仍沿用「四级精选」。
--   本次仅修正显示名，使标题与内容一致；description 语义已与新名一致，不再重复改。
--
-- 回滚（Flyway Community 无 undo，需手动执行）：
--   UPDATE `word_book` SET `name` = '四级精选' WHERE `code` = 'basic_foundation';
--
-- 幂等：按 code 定位，不按 name 匹配；重复执行影响 0 行，name 已被改过也能落到目标状态。
-- 影响：仅 word_book.name（varchar(128)），updated_at 由 ON UPDATE 自动刷新。

UPDATE `word_book`
SET `name` = '中考高考基础词'
WHERE `code` = 'basic_foundation';
