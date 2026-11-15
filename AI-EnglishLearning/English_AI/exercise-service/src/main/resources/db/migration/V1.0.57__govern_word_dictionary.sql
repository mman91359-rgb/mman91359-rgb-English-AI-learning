-- V1.0.57：词库数据治理（补音标/词性、清除错拼冗余条目、修正一道教错拼的题）
-- 目标库：exercise_db
-- 风险：中低（纯 DML；不涉及表结构；删除 5 个零引用死条目，改 1 道题答案）
-- 回滚：
--   -- 1) 补的音标/词性：还原为 NULL / ''
--   UPDATE `word_dictionary` SET `phonetic` = NULL WHERE `word` IN (
--     'surprisingly','theatre','videotape','waggon','consistently','consultancy',
--     'disillusioned','distil','firework','indefinitely','instinctively','intellectually',
--     'inversely','ironically','paradoxically','positively','predominantly','superficially',
--     'vividly','first-rate','grants','hypotheses','living-room','so-called','sitting-room',
--     'well-known','world-wide');
--   UPDATE `word_dictionary` SET `pos` = '' WHERE `word` IN (
--     'internet','antisocial','crippling','funding','moor','rainforest',
--     'b.c.','p.m.','reflexion','attent','grants','seminate');
--   -- 2) 删掉的 5 条（需从备份恢复，见迁移说明）
--   INSERT INTO `word_dictionary` (`id`,`word`,`phonetic`,`pos`,`translation`) VALUES
--     (9694,'accessary','', 'n','n. 贮水池,贮藏处,贮备'),  -- 值以备份为准
--     (8650,'reservior','', 'n','n. 贮水池,贮藏处,贮备'),
--     (9228,'systematical','','','a. 系统的, 分类的'),
--     (9480,'uptodate','', 'adj','a. 直到现代的, 现时的, 最新式的'),
--     (11581,'vitamine','', 'n','n. 维生素');
--   -- 3) 题目 3976 的答案还原
--   UPDATE `question_info` SET `answer_word` = 'accessary' WHERE `id` = 3976;
--   UPDATE `question_content` SET `correct_answer` = 'accessary' WHERE `question_id` = 3976;
-- 说明：
--   1. 音标来源：ECDICT dump 的同族词音标推导（与本库音标体系一致，均为 ECDICT 转写）。
--      如 consistently 取自 consistent /kәn'sistәnt/ + li；distil 无同族词，按 ECDICT 音系手工标注。
--      ECDICT 自身对这 27 个词的 phonetic_uk/phonetic_us 全为 NULL，无法直接取。
--   2. 词性来源：ECDICT meanings 缺失，按本词库中文释义的词性前缀判定（n/adj/vt）。
--   3. B.C. / P.M. 是缩写，本就不该有音标，保持 NULL 不补。
--   4. 删除的 5 条均为「错拼 + 正确拼法已存在」的死条目：
--      accessary（正确 accessory，词书内）、systematical（正确 systematic，词书内）、
--      vitamine（正确 vitamin，词书内）、reservior（正确 reservoir，词书内）、
--      uptodate（正确 up-to-date，词书内）。
--      这 5 条在 word_book_item / user_vocabulary / user_word_favorite /
--      user_word_learn_log / daily_word 中引用数均为 0，用户不可见。
--   5. 题 3976（question_info.answer_word = 'accessary'，题干 an ____ to murder）
--      正在教错拼，正确拼写 accessory 已在词书内且有音标词性，改后即指向规范形式。
--      保留 accessary 条目会产生「词表里两个拼法并存」，故一并清除。
--   6. 保留 reflexion / seminate / attent：它们是真实英语词（英式/古体），
--      不是错拼；reflexion 另被 question_info id=3013 引用，不动。
--   7. 本次不改 word_book_item / word_dictionary 之外的任何表结构。

-- ============================================================
-- 一、补音标（27 个词：19 个在词书内、8 个在词书外）
-- ============================================================

UPDATE `word_dictionary` SET `phonetic` = '/sәn\'praizli/'      WHERE `word` = 'surprisingly';
UPDATE `word_dictionary` SET `phonetic` = '/\'θiәtә/'          WHERE `word` = 'theatre';
UPDATE `word_dictionary` SET `phonetic` = '/\'vidiәuteip/'      WHERE `word` = 'videotape';
UPDATE `word_dictionary` SET `phonetic` = '/\'wægәn/'          WHERE `word` = 'waggon';
UPDATE `word_dictionary` SET `phonetic` = '/kәn\'sistәntli/'    WHERE `word` = 'consistently';
UPDATE `word_dictionary` SET `phonetic` = '/kәn\'sʌltәnsi/'    WHERE `word` = 'consultancy';
UPDATE `word_dictionary` SET `phonetic` = '/disi\'lu:ʒәnd/'     WHERE `word` = 'disillusioned';
UPDATE `word_dictionary` SET `phonetic` = '/dis\'til/'          WHERE `word` = 'distil';
UPDATE `word_dictionary` SET `phonetic` = '/\'faɪәwә:k/'       WHERE `word` = 'firework';
UPDATE `word_dictionary` SET `phonetic` = '/in\'definitli/'     WHERE `word` = 'indefinitely';
UPDATE `word_dictionary` SET `phonetic` = '/in\'stiŋktivli/'     WHERE `word` = 'instinctively';
UPDATE `word_dictionary` SET `phonetic` = '/.intә\'lektʃuәli/'   WHERE `word` = 'intellectually';
UPDATE `word_dictionary` SET `phonetic` = '/in\'vә:sli/'        WHERE `word` = 'inversely';
UPDATE `word_dictionary` SET `phonetic` = '/aɪ\'rɒnikli/'        WHERE `word` = 'ironically';
UPDATE `word_dictionary` SET `phonetic` = '/\'pærә\'dɒksikli/'   WHERE `word` = 'paradoxically';
UPDATE `word_dictionary` SET `phonetic` = '/\'pɒzitivli/'        WHERE `word` = 'positively';
UPDATE `word_dictionary` SET `phonetic` = '/pri\'dɒminәntli/'   WHERE `word` = 'predominantly';
UPDATE `word_dictionary` SET `phonetic` = '/.sju:pә\'fiʃәli/'   WHERE `word` = 'superficially';
UPDATE `word_dictionary` SET `phonetic` = '/\'vividli/'          WHERE `word` = 'vividly';

UPDATE `word_dictionary` SET `phonetic` = '/\'fә:st\'reit/'     WHERE `word` = 'first-rate';
UPDATE `word_dictionary` SET `phonetic` = '/grænts/'            WHERE `word` = 'grants';
UPDATE `word_dictionary` SET `phonetic` = '/hai\'pɒθәsi:z/'      WHERE `word` = 'hypotheses';
UPDATE `word_dictionary` SET `phonetic` = '/\'liviŋ ru:m/'      WHERE `word` = 'living-room';
UPDATE `word_dictionary` SET `phonetic` = '/\'sәu kɔ:ld/'       WHERE `word` = 'so-called';
UPDATE `word_dictionary` SET `phonetic` = '/\'sitiŋ ru:m/'      WHERE `word` = 'sitting-room';
UPDATE `word_dictionary` SET `phonetic` = '/\'wel\'nәun/'       WHERE `word` = 'well-known';
UPDATE `word_dictionary` SET `phonetic` = '/\'wә:ld\'waid/'     WHERE `word` = 'world-wide';

-- ============================================================
-- 二、补词性（12 个：6 个在词书内、6 个在词书外）
-- ============================================================

UPDATE `word_dictionary` SET `pos` = 'n'   WHERE `word` = 'internet';
UPDATE `word_dictionary` SET `pos` = 'adj' WHERE `word` = 'antisocial';
UPDATE `word_dictionary` SET `pos` = 'adj' WHERE `word` = 'crippling';
UPDATE `word_dictionary` SET `pos` = 'n'   WHERE `word` = 'funding';
UPDATE `word_dictionary` SET `pos` = 'n'   WHERE `word` = 'moor';
UPDATE `word_dictionary` SET `pos` = 'n'   WHERE `word` = 'rainforest';

UPDATE `word_dictionary` SET `pos` = 'n'   WHERE `word` = 'b.c.';
UPDATE `word_dictionary` SET `pos` = 'n'   WHERE `word` = 'p.m.';
UPDATE `word_dictionary` SET `pos` = 'n'   WHERE `word` = 'reflexion';
UPDATE `word_dictionary` SET `pos` = 'adj' WHERE `word` = 'attent';
UPDATE `word_dictionary` SET `pos` = 'n'   WHERE `word` = 'grants';
UPDATE `word_dictionary` SET `pos` = 'vt'  WHERE `word` = 'seminate';

-- ============================================================
-- 三、清除 5 个错拼冗余死条目
-- 正确拼法均已存在于 word_dictionary，且这 5 条在所有引用表中计数为 0。
-- ============================================================

DELETE FROM `word_dictionary` WHERE `word` IN (
  'accessary', 'systematical', 'vitamine', 'reservior', 'uptodate'
);

-- ============================================================
-- 四、修正正在教错拼的题目 3976
-- ============================================================

UPDATE `question_info`
SET `answer_word` = 'accessory'
WHERE `id` = 3976;

UPDATE `question_content`
SET `correct_answer` = 'accessory',
    `analysis` = REPLACE(`analysis`, 'an accessary to murder', 'an accessory to murder')
WHERE `question_id` = 3976;
