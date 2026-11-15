-- V1.0.55：词书改为普通定位名，并按体量重排展示顺序
-- 目标库：exercise_db
-- 风险：低（纯 DML，5 行 UPDATE，不动词条数据、不动 word_book_item）
-- 回滚：
--   UPDATE `word_book` SET `name`='四级高频 500 词', `description`='四级词纲内词频前 500 词', `sort_order`=1 WHERE `code`='basic_500';
--   UPDATE `word_book` SET `name`='四级词纲',     `description`='四级词纲全量',                 `sort_order`=2 WHERE `code`='cet4_outline';
--   UPDATE `word_book` SET `name`='六级词纲',     `description`='六级词纲增量（不含四级词）',   `sort_order`=3 WHERE `code`='cet6_outline';
--   UPDATE `word_book` SET `name`='四级高频 30%', `description`='四级词纲词频前 30%（约 1149 词）', `sort_order`=4 WHERE `code`='cet4_high';
--   UPDATE `word_book` SET `name`='六级高频 30%', `description`='六级增量词频前 30%（约 583 词）',  `sort_order`=5 WHERE `code`='cet6_high';
-- 说明：
--   1. 原名把词数/百分比写进了标题（「四级高频 30%」读起来像"高频词占 30%"，
--      实为"词频排序前 30%"），而词书卡上已有独立统计组件展示词数，标题不必重复承载。
--   2. 词数规模由统计组件呈现，name 只保留定位。
--   3. sort_order 调整为「每级内部按词集体量递增」：四级 500 → 1149 →（1900 见 V1.0.56）→ 3830，
--      六级 583 → 1942。sort_order=3 预留给 V1.0.56 新增的 cet4_core_1900。
--   4. code 不变，user_preference.active_word_book_id 指向的是 word_book.id，不受影响。

UPDATE `word_book`
SET `name` = '四级精选',
    `description` = '四级考纲内最常用的词，适合起步',
    `sort_order` = 1
WHERE `code` = 'basic_500';

UPDATE `word_book`
SET `name` = '四级高频',
    `description` = '四级考纲内的高频词',
    `sort_order` = 2
WHERE `code` = 'cet4_high';

UPDATE `word_book`
SET `name` = '四级词纲',
    `description` = '四级考纲全量',
    `sort_order` = 4
WHERE `code` = 'cet4_outline';

UPDATE `word_book`
SET `name` = '六级高频',
    `description` = '六级考纲增量内的高频词',
    `sort_order` = 5
WHERE `code` = 'cet6_high';

UPDATE `word_book`
SET `name` = '六级词纲',
    `description` = '六级考纲增量全量（不含四级词）',
    `sort_order` = 6
WHERE `code` = 'cet6_outline';
