-- V1.0.17：词汇填空题自动生成（第 05 批，500 题）
-- 目标库：exercise_db
-- 来源：word_dictionary 例句挖空；生成脚本 scripts/generate-vocab-questions.mjs
-- 风险：低（纯 DML，NOT EXISTS 双重幂等：external_key + question_content）
-- 回滚：DELETE FROM question_info WHERE external_key LIKE 'vocab-auto-%';
--       DELETE FROM question_content WHERE question_id NOT IN (SELECT id FROM question_info);
-- 校验：stem 含 ___、analysis 无答案残留（生成时已断言）

-- V1.0.17 · nearby (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8002-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'nearby', JSON_ARRAY('nearby', 'nearbier', 'nearbiest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8002-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8002-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'There is a hospital ____.',
       JSON_ARRAY(),
       'nearby',
       'a. 附近的, 近旁的 adv. 在附近, 近旁地 prep. 在...附近 ｜ 原句：There is a hospital nearby.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · neat (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8003-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'neat', JSON_ARRAY('neat', 'neater', 'neatest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8003-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8003-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He took a drink of whiskey ____.',
       JSON_ARRAY(),
       'neat',
       'a. 整洁的, 巧妙的, 匀称的, 简洁的 n. 牛 ｜ 原句：He took a drink of whiskey neat.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · necessarily (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8004-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'necessarily', JSON_ARRAY('necessarily'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8004-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8004-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The art of modern warfare does not ____ require soldiers to be armed to the teeth to be effective as combatants.',
       JSON_ARRAY(),
       'necessarily',
       'adv. 必然地, 必须地, 必要地 ｜ 原句：The art of modern warfare does not necessarily require soldiers to be armed to the teeth to be effective as combatants.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · necessity (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8005-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'necessity', JSON_ARRAY('necessity'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8005-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8005-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'A computer is an absolute ____ now.',
       JSON_ARRAY(),
       'necessity',
       'n. 需要, 必需品, 必然 [法] 必要性, 必然性, 必要 ｜ 原句：A computer is an absolute necessity now.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · neck (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8006-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'neck', JSON_ARRAY('neck', 'necks'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8006-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8006-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The horse broke its ____ when it fell.',
       JSON_ARRAY(),
       'neck',
       'n. 脖子, 衣领, 颈 vi. 拥抱, 拥吻, 收缩 vt. 割颈 ｜ 原句：The horse broke its neck when it fell.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · necklace (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8007-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'necklace', JSON_ARRAY('necklace', 'necklaces'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8007-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8007-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'My grandma gave me this ____.',
       JSON_ARRAY(),
       'necklace',
       'n. 项链 ｜ 原句：My grandma gave me this necklace.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · needle (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8008-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'needle', JSON_ARRAY('needle', 'needles'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8008-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8008-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'It is like looking for a ____ in a haystack.',
       JSON_ARRAY(),
       'needle',
       'n. 针, 尖 vt. 用针缝 vi. 缝纫 [计] 探针 ｜ 原句：It is like looking for a needle in a haystack.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · needless (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8009-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'needless', JSON_ARRAY('needless'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8009-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8009-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '____ to say, health is above wealth.',
       JSON_ARRAY(),
       'needless',
       'a. 不需要的, 不必要的 ｜ 原句：Needless to say, health is above wealth.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · negative (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8010-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'negative', JSON_ARRAY('negative', 'negatives'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8010-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8010-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Let go of your ____ outlook on life.',
       JSON_ARRAY(),
       'negative',
       'n. 否定, 否定语, 负数, 底片 a. 否定的, 消极的, 负的, 阴性的 n. 负数, 负值 [计] 负数, 负值 ｜ 原句：Let go of your negative outlook on life.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · neglect (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8011-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'neglect', JSON_ARRAY('neglect', 'neglects'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8011-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8011-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'You are not to ____ your duty.',
       JSON_ARRAY(),
       'neglect',
       'n. 疏忽, 忽略, 漏做 vt. 疏忽, 忽视, 不顾 ｜ 原句：You are not to neglect your duty.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · neighborhood (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8013-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'neighborhood', JSON_ARRAY('neighborhood'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8013-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8013-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The whole ____ was surprised at the news.',
       JSON_ARRAY(),
       'neighborhood',
       'n. 附近, 邻近 ｜ 原句：The whole neighborhood was surprised at the news.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · neighbour (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8014-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'neighbour', JSON_ARRAY('neighbour', 'neighbours'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8014-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8014-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'A good ____ is better than a brother far off.',
       JSON_ARRAY(),
       'neighbour',
       'n. 邻居, 邻接的东西, 邻国, 邻座, 邻人, 世人 a. 邻接的, 邻近的 vi.vt. 邻近, 与...结邻, 邻接 ｜ 原句：A good neighbour is better than a brother far off.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · neighbourhood (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8015-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'neighbourhood', JSON_ARRAY('neighbourhood'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8015-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8015-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Be quiet! You’ll wake up the whole ____!',
       JSON_ARRAY(),
       'neighbourhood',
       'n. 邻接, 周围, 附近一带, 邻近, 邻居关系, 地区, 街道, 街坊, 四邻 [计] 邻域 ｜ 原句：Be quiet! You’ll wake up the whole neighbourhood!',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · nephew (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8016-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'nephew', JSON_ARRAY('nephew', 'nephews'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8016-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8016-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'My ____ is allergic to eggs.',
       JSON_ARRAY(),
       'nephew',
       'n. 侄子, 外甥 ｜ 原句：My nephew is allergic to eggs.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · nerve (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8017-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'nerve', JSON_ARRAY('nerve', 'nerves'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8017-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8017-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'She had the ____ to speak out.',
       JSON_ARRAY(),
       'nerve',
       'n. 精神, 勇气, 叶脉, 神经 vt. 鼓起勇气 ｜ 原句：She had the nerve to speak out.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · nervous (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8018-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'nervous', JSON_ARRAY('nervous'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8018-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8018-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'With so many people around he naturally became a bit ____.',
       JSON_ARRAY(),
       'nervous',
       'a. 神经紧张的, 不安的, 神经的 [医] 神经的; 神经质的, 神经过敏的 ｜ 原句：With so many people around he naturally became a bit nervous.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · nest (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8019-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'nest', JSON_ARRAY('nest', 'nests'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8019-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8019-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Children all leave the ____ one day.',
       JSON_ARRAY(),
       'nest',
       'n. 巢, 窝, 休息所, 隐匿处 vi. 筑巢, 找鸟巢 vt. 为...设窝, 使套叠 [计] 嵌套 ｜ 原句：Children all leave the nest one day.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · net (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8020-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'net', JSON_ARRAY('net', 'nets'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8020-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8020-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The hunters captured the wild animal with a strong rope ____.',
       JSON_ARRAY(),
       'net',
       'n. 网, 网状物, 罗网, 净利, 净价 a. 净的, 最终的 vt. 用网捕, 撒网, 净赚, 得到 vi. 编网 [计] 网络, 网络分析程序 ｜ 原句：The hunters captured the wild animal with a strong rope net.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · network (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8021-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'network', JSON_ARRAY('network', 'networks'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8021-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8021-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The UK must improve the problems with its rail ____.',
       JSON_ARRAY(),
       'network',
       'n. 网络, 广播网, 网状物 [计] 网络 ｜ 原句：The UK must improve the problems with its rail network.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · neutral (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8022-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'neutral', JSON_ARRAY('neutral', 'neutrals'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8022-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8022-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Switzerland is a ____ country.',
       JSON_ARRAY(),
       'neutral',
       'n. 中立者, 中立国, 非彩色, 空档 a. 中立的, 中性的, 无色的 ｜ 原句：Switzerland is a neutral country.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · nevertheless (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8023-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'nevertheless', JSON_ARRAY('nevertheless'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8023-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8023-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'It''s just five in the morning, but ____ it is light out.',
       JSON_ARRAY(),
       'nevertheless',
       'adv. 然而, 虽然如此 conj. 然而 ｜ 原句：It''s just five in the morning, but nevertheless it is light out.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · newly (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8024-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'newly', JSON_ARRAY('newly', 'newlier', 'newliest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8024-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8024-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Going to the ____ built Greenland in Shanghai is really fun!',
       JSON_ARRAY(),
       'newly',
       'adv. 重新, 最近 ｜ 原句：Going to the newly built Greenland in Shanghai is really fun!',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · niece (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8025-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'niece', JSON_ARRAY('niece', 'nieces'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8025-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8025-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'his ____, the daughter of his eldest sister',
       JSON_ARRAY(),
       'niece',
       'n. 侄女, 甥女 ｜ 原句：his niece, the daughter of his eldest sister',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · nitrogen (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8027-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'nitrogen', JSON_ARRAY('nitrogen', 'nitrogens'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8027-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8027-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The air we breathe consists of oxygen and ____.',
       JSON_ARRAY(),
       'nitrogen',
       'n. 氮 [化] 氮N-2 ｜ 原句：The air we breathe consists of oxygen and nitrogen.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · noble (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8028-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'noble', JSON_ARRAY('noble', 'nobles'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8028-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8028-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Your sister looks as ____ as if she were a princess.',
       JSON_ARRAY(),
       'noble',
       'n. 贵族 a. 高贵的, 高尚的, 贵族的, 辉煌的 ｜ 原句：Your sister looks as noble as if she were a princess.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · nod (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8029-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'nod', JSON_ARRAY('nod', 'nods'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8029-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8029-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Mary got the ____ from among some 500 applicants.',
       JSON_ARRAY(),
       'nod',
       'n. 点头, 打盹, 晃动 vi. 点头, 打盹 vt. 点头表示, 点(头) ｜ 原句：Mary got the nod from among some 500 applicants.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · noisy (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8030-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'noisy', JSON_ARRAY('noisy', 'noisier', 'noisiest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8030-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8030-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'That street is very ____.',
       JSON_ARRAY(),
       'noisy',
       'a. 嘈杂的, 喧闹的 [机] 噪声的, 嘈杂的 ｜ 原句：That street is very noisy.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · nonsense (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8031-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'nonsense', JSON_ARRAY('nonsense', 'nonsenses'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8031-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8031-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Don''t listen to him, he''s talking ____.',
       JSON_ARRAY(),
       'nonsense',
       'n. 无意义的事, 荒谬言行, 荒唐 ｜ 原句：Don''t listen to him, he''s talking nonsense.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · normal (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8032-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'normal', JSON_ARRAY('normal', 'normals'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8032-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8032-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Stop seeing me as a "____" person!',
       JSON_ARRAY(),
       'normal',
       'n. 常态, 标准, 正常, 普通 a. 正常的, 正规的, 标准的, 师范的, 正态的 [计] 标准, 普通 ｜ 原句：Stop seeing me as a "normal" person!',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · normally (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8033-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'normally', JSON_ARRAY('normally'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8033-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8033-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'We can ____ conceal our thoughts from others.',
       JSON_ARRAY(),
       'normally',
       'adv. 正规地, 合规则, 正常地 ｜ 原句：We can normally conceal our thoughts from others.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · northern (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8035-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'northern', JSON_ARRAY('northern', 'northerns'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8035-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8035-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Japan is located in the ____ Hemisphere.',
       JSON_ARRAY(),
       'northern',
       'n. 北方人 a. 北方的, 向北的, 自北方来的 ｜ 原句：Japan is located in the Northern Hemisphere.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · northwest (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8036-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'northwest', JSON_ARRAY('northwest', 'northwests'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8036-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8036-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'They marched ____ into the Shenandoah Valley.',
       JSON_ARRAY(),
       'northwest',
       'n. 西北, 西北方 a. 西北的, 在西北的, 来自西北的 adv. 向西北 ｜ 原句：They marched northwest into the Shenandoah Valley.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · notebook (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8037-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'notebook', JSON_ARRAY('notebook', 'notebooks'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8037-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8037-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I''ll lend you my ____.',
       JSON_ARRAY(),
       'notebook',
       'n. 笔记本, 手册, 期票簿 ｜ 原句：I''ll lend you my notebook.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · notice (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8038-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'notice', JSON_ARRAY('notice', 'notices'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8038-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8038-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Stick a ____ on the board.',
       JSON_ARRAY(),
       'notice',
       'n. 注意, 布告, 通知, 预告, 短评 vt. 注意, 通知, 评论, 提及, 关注 vi. 注意 ｜ 原句：Stick a notice on the board.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · noticeable (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8039-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'noticeable', JSON_ARRAY('noticeable'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8039-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8039-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'There are ____ differences between the two.',
       JSON_ARRAY(),
       'noticeable',
       'a. 显而易见的, 显著的, 值得注意的 ｜ 原句：There are noticeable differences between the two.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · notify (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8040-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'notify', JSON_ARRAY('notify', 'notifies', 'notified', 'notifying'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8040-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8040-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I will ____ you of the arrival of the goods.',
       JSON_ARRAY(),
       'notify',
       'vt. 通知, 通告, 报告 [计] 通知 ｜ 原句：I will notify you of the arrival of the goods.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · notion (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8041-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'notion', JSON_ARRAY('notion', 'notions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8041-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8041-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'She had no ____ what he meant.',
       JSON_ARRAY(),
       'notion',
       'n. 概念, 观念, 想法, 打算, 别致的小东西 [经] 概念, 打算, 想法 ｜ 原句：She had no notion what he meant.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · noun (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8042-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'noun', JSON_ARRAY('noun', 'nouns'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8042-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8042-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Accordingly, besides ____ declension patterns, there also existed a greater variety of verb conjugation patterns than in Modern English.',
       JSON_ARRAY(),
       'noun',
       'n. 名词 ｜ 原句：Accordingly, besides noun declension patterns, there also existed a greater variety of verb conjugation patterns than in Modern English.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · novel (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8043-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'novel', JSON_ARRAY('novel', 'novels'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8043-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8043-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Tom recommended the ____ to them.',
       JSON_ARRAY(),
       'novel',
       'n. 小说, 长篇故事 a. 新奇的, 异常的 ｜ 原句：Tom recommended the novel to them.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · nowadays (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8044-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'nowadays', JSON_ARRAY('nowadays'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8044-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8044-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Without an air conditioner, people ____ cannot live.',
       JSON_ARRAY(),
       'nowadays',
       'n. 现在, 现时, 当今 adv. 时下, 现今 ｜ 原句：Without an air conditioner, people nowadays cannot live.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · nowhere (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8045-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'nowhere', JSON_ARRAY('nowhere'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8045-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8045-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'After three hours of discussion we got ____.',
       JSON_ARRAY(),
       'nowhere',
       'adv. 无处, 到处都无 ｜ 原句：After three hours of discussion we got nowhere.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · nucleus (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8047-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'nucleus', JSON_ARRAY('nucleus', 'nucleuses'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8047-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8047-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'You two are the ____ of the team.',
       JSON_ARRAY(),
       'nucleus',
       'n. 核心, 核子, 原子核, 起点 [计] 核心程序 ｜ 原句：You two are the nucleus of the team.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · nuisance (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8048-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'nuisance', JSON_ARRAY('nuisance', 'nuisances'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8048-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8048-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He could be a bit of a ____ when he was drunk.',
       JSON_ARRAY(),
       'nuisance',
       'n. 讨厌的东西, 讨厌的人, 损害 [医] 损害, 讨厌 ｜ 原句：He could be a bit of a nuisance when he was drunk.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · numerous (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8049-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'numerous', JSON_ARRAY('numerous'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8049-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8049-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Richard Roberts is the author of ____ books.',
       JSON_ARRAY(),
       'numerous',
       'a. 很多的, 数目众多的, 多数的 [机] 多数的, 甚多的 ｜ 原句：Richard Roberts is the author of numerous books.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · nursery (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8050-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'nursery', JSON_ARRAY('nursery', 'nurseries'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8050-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8050-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'What''s your favorite ____ rhyme?',
       JSON_ARRAY(),
       'nursery',
       'n. 托儿所, 苗圃, 温床 [医] 婴儿室, 托儿所 ｜ 原句：What''s your favorite nursery rhyme?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · nylon (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8052-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'nylon', JSON_ARRAY('nylon', 'nylons'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8052-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8052-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'She bought a dozen ____ socks.',
       JSON_ARRAY(),
       'nylon',
       'n. 尼龙 [化] 尼龙; 聚酰胺纤维 ｜ 原句：She bought a dozen nylon socks.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · obey (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8053-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'obey', JSON_ARRAY('obey', 'obeys', 'obeyed', 'obeying'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8053-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8053-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Bill was adamant that she should ____ him.',
       JSON_ARRAY(),
       'obey',
       'vt. 服从, 遵从, 顺从 vi. 服从 ｜ 原句：Bill was adamant that she should obey him.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · object (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8054-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'object', JSON_ARRAY('object', 'objects'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8054-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8054-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I don''t ____ to your going out to work, but who will look after the children?',
       JSON_ARRAY(),
       'object',
       'n. 物体, 目标, 目的, 对象, 宾语, 客体 vi. 反对, 抱反感 vt. 提出...来反对 [计] 对象 ｜ 原句：I don''t object to your going out to work, but who will look after the children?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · objection (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8055-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'objection', JSON_ARRAY('objection', 'objections'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8055-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8055-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I have no ____ to your plan.',
       JSON_ARRAY(),
       'objection',
       'n. 异议, 反对, 不喜欢, 缺点, 缺陷, 妨碍, 拒绝之理由 [法] 异议, 反对, 抗议 ｜ 原句：I have no objection to your plan.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · objective (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8056-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'objective', JSON_ARRAY('objective', 'objectives'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8056-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8056-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The ____ of law is justice.',
       JSON_ARRAY(),
       'objective',
       'n. 目的, 目标, 宗旨, 宾格, 实物 a. 客观的, 如实的, 无偏见的, 宾格的 ｜ 原句：The objective of law is justice.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · obligation (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8057-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'obligation', JSON_ARRAY('obligation', 'obligations'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8057-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8057-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'It is our ____ to help.',
       JSON_ARRAY(),
       'obligation',
       'n. 义务, 责任, 约束, 契约, 恩惠, 债务 [经] 待付款, 债务, 义务 ｜ 原句：It is our obligation to help.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · oblige (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8058-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'oblige', JSON_ARRAY('oblige', 'obliged', 'obliges', 'obliging'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8058-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8058-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The minister was ____ to report at least once every six months.',
       JSON_ARRAY(),
       'obliged',
       'vt. 强制, 施恩惠于, 使感激 vi. 施恩惠, 帮忙 ｜ 原句：The minister was obliged to report at least once every six months.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · obscure (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8059-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'obscure', JSON_ARRAY('obscure'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8059-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8059-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The meaning of this sentence is ____.',
       JSON_ARRAY(),
       'obscure',
       'a. 模糊的, 昏暗的, 难解的, 晦涩的, 偏僻的, 微贱的, 无名的 vt. 使变暗, 隐藏, 使变模糊, 使难解 ｜ 原句：The meaning of this sentence is obscure.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · observation (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8060-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'observation', JSON_ARRAY('observation', 'observations'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8060-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8060-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Her acute ____ skills make her a very suitable photographer.',
       JSON_ARRAY(),
       'observation',
       'n. 观察, 注意, 观测, 观察力 [化] 观察 ｜ 原句：Her acute observation skills make her a very suitable photographer.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · observe (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8061-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'observe', JSON_ARRAY('observe', 'observes', 'observed', 'observing'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8061-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8061-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'We must ____ the rules.',
       JSON_ARRAY(),
       'observe',
       'vt. 觉察到, 遵守, 注意到, 庆祝 vi. 注意, 评论 ｜ 原句：We must observe the rules.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · obtain (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8063-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'obtain', JSON_ARRAY('obtain', 'obtains', 'obtained', 'obtaining'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8063-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8063-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'It is necessary to ____ the sanction of the authorities to enter this building.',
       JSON_ARRAY(),
       'obtain',
       'vt. 获得, 达到 vi. 流行, 得到公认 ｜ 原句：It is necessary to obtain the sanction of the authorities to enter this building.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · obvious (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8064-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'obvious', JSON_ARRAY('obvious'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8064-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8064-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'This system has ____ defects.',
       JSON_ARRAY(),
       'obvious',
       'a. 明显的, 明白的, 显然的, 平淡无奇的 ｜ 原句：This system has obvious defects.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · obviously (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8065-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'obviously', JSON_ARRAY('obviously'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8065-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8065-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He can speak French, and ____ English.',
       JSON_ARRAY(),
       'obviously',
       'adv. 显而易见地, 明显地 ｜ 原句：He can speak French, and obviously English.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · occasion (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8066-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'occasion', JSON_ARRAY('occasion', 'occasions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8066-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8066-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'What''s the happy ____?',
       JSON_ARRAY(),
       'occasion',
       'n. 场合, 时机, 机会, 诱因, 理由 vt. 惹起, 引起 ｜ 原句：What''s the happy occasion?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · occasional (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8067-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'occasional', JSON_ARRAY('occasional'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8067-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8067-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I have ____ pains in the stomach.',
       JSON_ARRAY(),
       'occasional',
       'a. 偶然的, 临时的 [法] 偶然的, 特殊场合的 ｜ 原句：I have occasional pains in the stomach.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · occasionally (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8068-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'occasionally', JSON_ARRAY('occasionally'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8068-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8068-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He ____ visited me.',
       JSON_ARRAY(),
       'occasionally',
       'adv. 有时候, 偶而 ｜ 原句：He occasionally visited me.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · occupation (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8069-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'occupation', JSON_ARRAY('occupation', 'occupations'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8069-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8069-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'What''s your ____?',
       JSON_ARRAY(),
       'occupation',
       'n. 职业, 占有, 占有期, 占领, 占领军 [经] 占有, 占用, 职业 ｜ 原句：What''s your occupation?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · occupy (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8070-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'occupy', JSON_ARRAY('occupy', 'occupies', 'occupied', 'occupying'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8070-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8070-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Books ____ most of his room.',
       JSON_ARRAY(),
       'occupy',
       'vt. 占领, 占(时间、空间等), 住进, 担任, 使从事, 使全神贯注 [法] 占领, 占据, 占有 ｜ 原句：Books occupy most of his room.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · occur (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8071-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'occur', JSON_ARRAY('occur', 'occurs'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8071-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8071-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'According to some scholars, a major earthquake could ____ at any moment now.',
       JSON_ARRAY(),
       'occur',
       'vi. 发生, 被想到, 存在 ｜ 原句：According to some scholars, a major earthquake could occur at any moment now.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · occurrence (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8072-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'occurrence', JSON_ARRAY('occurrence', 'occurrences'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8072-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8072-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'This is a daily ____.',
       JSON_ARRAY(),
       'occurrence',
       'n. 发生, 事件, 出现 [医] 发生 ｜ 原句：This is a daily occurrence.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · ocean (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8073-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'ocean', JSON_ARRAY('ocean', 'oceans'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8073-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8073-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'My eyes are an ____ in which my dreams are reflected.',
       JSON_ARRAY(),
       'ocean',
       'n. 海洋, 广阔, 许多, 一大片 [法] 海洋, 海 ｜ 原句：My eyes are an ocean in which my dreams are reflected.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · oceania (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8074-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'oceania', JSON_ARRAY('oceania', 'oceanias'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8074-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8074-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The Mummies Of The World exhibition brings together a collection of mummies and related artefacts from South America, Europe, Asia, ____ and Egypt.',
       JSON_ARRAY(),
       'oceania',
       'n. 大洋洲 ｜ 原句：The Mummies Of The World exhibition brings together a collection of mummies and related artefacts from South America, Europe, Asia, Oceania and Egypt.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · odour (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8076-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'odour', JSON_ARRAY('odour', 'odours'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8076-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8076-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'This kind of ____ is really terrifying.',
       JSON_ARRAY(),
       'odour',
       'n. 气味, 臭气, 香气, 味道, 迹象, 名誉, 声誉 [医] 气味 ｜ 原句：This kind of odour is really terrifying.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · offend (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8077-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'offend', JSON_ARRAY('offend', 'offends', 'offended', 'offending'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8077-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8077-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Don''t ____ anyone!',
       JSON_ARRAY(),
       'offend',
       'v. 犯罪, 冒犯, 违反, 进攻 ｜ 原句：Don''t offend anyone!',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · offer (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8078-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'offer', JSON_ARRAY('offer', 'offers'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8078-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8078-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'You should have refused his ____.',
       JSON_ARRAY(),
       'offer',
       'n. 给予(物), 出价, 提议, 意图, 报价 vt. 提供, 出价, 奉献, 试图, 使出现, 演出 vi. 出现, 献祭, 提议, 求婚 ｜ 原句：You should have refused his offer.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · officer (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8079-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'officer', JSON_ARRAY('officer', 'officers'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8079-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8079-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The police ____ arrested the burglar.',
       JSON_ARRAY(),
       'officer',
       'n. 军官, 主管, 官员, 公务员 vt. 指挥 ｜ 原句：The police officer arrested the burglar.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · official (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8080-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'official', JSON_ARRAY('official', 'officials'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8080-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8080-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'This news is ____.',
       JSON_ARRAY(),
       'official',
       'n. 官员, 公务员, 职员 a. 公务的, 官方的, 正式的 ｜ 原句：This news is official.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · oil (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8081-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'oil', JSON_ARRAY('oil', 'oils'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8081-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8081-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'We are not short of ____ in this country.',
       JSON_ARRAY(),
       'oil',
       'n. 油, 石油, 油画颜料 vt. 涂油于, 使融化成油状, 加油于 vi. 加燃油, 融化 ｜ 原句：We are not short of oil in this country.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · okay (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8082-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'okay', JSON_ARRAY('okay', 'okayer', 'okayest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8082-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8082-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'It''s ____ to take it easy sometimes.',
       JSON_ARRAY(),
       'okay',
       'a. 好, 可以, 行, 对, 好吗, 很好 adv. 好, 可以, 行, 对, 好吗, 很好 n. 同意, 签认, 批准, 认可 vt. 同意, 签认, 批准, 认可 ｜ 原句：It''s okay to take it easy sometimes.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · omit (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8083-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'omit', JSON_ARRAY('omit', 'omits'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8083-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8083-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'You can ____ the last chapter of the book.',
       JSON_ARRAY(),
       'omit',
       'vt. 省略, 删除, 疏忽, 遗漏 [化] 省略 ｜ 原句：You can omit the last chapter of the book.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · onion (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8085-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'onion', JSON_ARRAY('onion', 'onions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8085-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8085-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Chop the ____ finely.',
       JSON_ARRAY(),
       'onions',
       'n. 洋葱 vt. 因洋葱使掉泪 ｜ 原句：Chop the onions finely.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · opera (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8088-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'opera', JSON_ARRAY('opera', 'operas'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8088-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8088-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'This is an ____ in five acts.',
       JSON_ARRAY(),
       'opera',
       'n. 歌剧 ｜ 原句：This is an opera in five acts.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · operate (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8089-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'operate', JSON_ARRAY('operate', 'operates', 'operated', 'operating'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8089-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8089-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The doctor decided to ____ at once.',
       JSON_ARRAY(),
       'operate',
       'v. 操作, 运转, 动手术, 活动 ｜ 原句：The doctor decided to operate at once.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · operation (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8090-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'operation', JSON_ARRAY('operation', 'operations'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8090-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8090-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Doctors refused to perform a second ____.',
       JSON_ARRAY(),
       'operation',
       'n. 操作, 动作, 手术, 运算, 作用, 业务 [计] 运算 ｜ 原句：Doctors refused to perform a second operation.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · operational (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8091-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'operational', JSON_ARRAY('operational'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8091-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8091-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '____ activities/costs/difficulties',
       JSON_ARRAY(),
       'operational',
       'a. 操作的, 运作的 [法] 操作上的, 业务上的, 可起作用的 ｜ 原句：operational activities/costs/difficulties',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · operator (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8092-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'operator', JSON_ARRAY('operator', 'operators'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8092-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8092-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The telephone ____ asked the caller to hold on until a connection was made.',
       JSON_ARRAY(),
       'operator',
       'n. 操作员, 行家, 经纪人, 算子, 运算符 [计] 运算符 ｜ 原句：The telephone operator asked the caller to hold on until a connection was made.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · opinion (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8093-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'opinion', JSON_ARRAY('opinion', 'opinions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8093-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8093-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Every ____ is a mixture of truth and mistakes.',
       JSON_ARRAY(),
       'opinion',
       'n. 意见, 评价, 主张 [经] 意见 ｜ 原句：Every opinion is a mixture of truth and mistakes.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · opponent (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8094-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'opponent', JSON_ARRAY('opponent', 'opponents'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8094-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8094-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Our team defeated our ____ 5-4.',
       JSON_ARRAY(),
       'opponent',
       'n. 对手, 敌手, 反对者 a. 敌对的, 反对的, 对面的 ｜ 原句：Our team defeated our opponent 5-4.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · opportunity (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8095-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'opportunity', JSON_ARRAY('opportunity'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8095-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8095-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'All you have to do is take advantage of this rare ____.',
       JSON_ARRAY(),
       'opportunity',
       'n. 机会, 时机 ｜ 原句：All you have to do is take advantage of this rare opportunity.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · oppose (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8096-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'oppose', JSON_ARRAY('oppose', 'opposes', 'opposed', 'opposing'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8096-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8096-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The city government wants to set up special cycle lanes. However, a lot of drivers ____ the idea.',
       JSON_ARRAY(),
       'oppose',
       'vt. 反对, 以...对抗, 抗争 vi. 反对 ｜ 原句：The city government wants to set up special cycle lanes. However, a lot of drivers oppose the idea.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · opposite (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8097-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'opposite', JSON_ARRAY('opposite'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8097-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8097-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'You say one thing and then act just the ____.',
       JSON_ARRAY(),
       'opposite',
       'a. 相对的, 相反的, 对面的 prep. 对面 n. 对立面 ｜ 原句：You say one thing and then act just the opposite.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · oppress (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8098-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'oppress', JSON_ARRAY('oppress', 'oppresses', 'oppressed', 'oppressing'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8098-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8098-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Wealth could not muddle his thoughts, poverty could not change his integrity, force could not ____ his will, this is what it means to be a man.',
       JSON_ARRAY(),
       'oppress',
       'vt. 压迫, 压抑, 使烦恼 ｜ 原句：Wealth could not muddle his thoughts, poverty could not change his integrity, force could not oppress his will, this is what it means to be a man.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · optical (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8099-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'optical', JSON_ARRAY('optical'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8099-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8099-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'microscopes and other ____ instruments',
       JSON_ARRAY(),
       'optical',
       'a. 眼睛的, 视觉的, 光学的 [机] 光学上的, 光学的 ｜ 原句：microscopes and other optical instruments',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · optimistic (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8101-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'optimistic', JSON_ARRAY('optimistic'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8101-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8101-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Your view is too ____.',
       JSON_ARRAY(),
       'optimistic',
       'a. 乐观的, 乐观主义的, 乐天的 ｜ 原句：Your view is too optimistic.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · option (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8102-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'option', JSON_ARRAY('option', 'options'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8102-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8102-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'In the U.S., you have the ____, when you enter a restaurant, to sit in the smoking or non-smoking section.',
       JSON_ARRAY(),
       'option',
       'n. 选择权, 挑选, 选项 [计] 选项 ｜ 原句：In the U.S., you have the option, when you enter a restaurant, to sit in the smoking or non-smoking section.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · optional (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8103-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'optional', JSON_ARRAY('optional'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8103-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8103-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Being challenged in life is inevitable, being defeated is ____.',
       JSON_ARRAY(),
       'optional',
       'a. 可选择的, 随意的 [化] 选购的 ｜ 原句：Being challenged in life is inevitable, being defeated is optional.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · oral (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8104-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'oral', JSON_ARRAY('oral', 'orals'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8104-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8104-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Sami had Layla perform ____ sex on him.',
       JSON_ARRAY(),
       'oral',
       'n. 口试 a. 口头的, 口述的, 口部的 ｜ 原句：Sami had Layla perform oral sex on him.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · orbit (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8105-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'orbit', JSON_ARRAY('orbit', 'orbits'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8105-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8105-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Many moons ____ around Saturn.',
       JSON_ARRAY(),
       'orbit',
       'n. 轨道, 常轨, 眼眶 vt. 绕...轨道而行 vi. 进入轨道, 盘旋 ｜ 原句：Many moons orbit around Saturn.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · orchestra (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8106-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'orchestra', JSON_ARRAY('orchestra', 'orchestras'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8106-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8106-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I''m going to join the school ____.',
       JSON_ARRAY(),
       'orchestra',
       'n. 管弦乐队, 乐队演奏处 ｜ 原句：I''m going to join the school orchestra.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · orderly (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8107-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'orderly', JSON_ARRAY('orderly'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8107-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8107-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'She needs to organize her ideas in a more ____ way.',
       JSON_ARRAY(),
       'orderly',
       'a. 有秩序的, 整齐的, 值班的 n. 护理员, 清道夫, 传令兵, 勤务兵 adv. 依次地, 顺序地 ｜ 原句：She needs to organize her ideas in a more orderly way.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · ordinary (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8108-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'ordinary', JSON_ARRAY('ordinary'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8108-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8108-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'You cannot solve this problem in an ____ way.',
       JSON_ARRAY(),
       'ordinary',
       'a. 平常的, 普通的, 平凡的 n. 平常的人(或事) ｜ 原句：You cannot solve this problem in an ordinary way.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · organ (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8110-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'organ', JSON_ARRAY('organ', 'organs'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8110-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8110-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Can you play the ____?',
       JSON_ARRAY(),
       'organ',
       'n. 风琴, 器官, 元件, 机构, 机关 [电] 风琴 ｜ 原句：Can you play the organ?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · organic (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8111-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'organic', JSON_ARRAY('organic'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8111-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8111-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Some people only buy ____ food; they think that in this way their body will not be damaged by pollutants.',
       JSON_ARRAY(),
       'organic',
       'a. 器官的, 有机的, 组织的, 根本的 [医] 器官的, 有生命的, 有机的, 器质的 ｜ 原句：Some people only buy organic food; they think that in this way their body will not be damaged by pollutants.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · organism (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8112-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'organism', JSON_ARRAY('organism', 'organisms'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8112-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8112-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'All living ____ have to adapt to changes in environmental conditions.',
       JSON_ARRAY(),
       'organisms',
       'n. 生物, 有机体, 社会组织 [医] 生物[体],[有]机体 ｜ 原句：All living organisms have to adapt to changes in environmental conditions.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · organization (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8113-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'organization', JSON_ARRAY('organization', 'organizations'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8113-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8113-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The ____ furnished the refugees with food.',
       JSON_ARRAY(),
       'organization',
       'n. 组织, 结构, 团体, 体制 [医] 组织, 机构, 机化(血栓或坏死组织) ｜ 原句：The organization furnished the refugees with food.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · organize (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8114-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'organize', JSON_ARRAY('organize', 'organized', 'organizes', 'organizing', 'organises', 'organised', 'organising'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8114-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8114-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The course was ____ by a training company.',
       JSON_ARRAY(),
       'organized',
       'vt. 组织, 有机化, 给予生机 vi. 组织起来 ｜ 原句：The course was organized by a training company.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · orient (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8115-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'orient', JSON_ARRAY('orient', 'orients'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8115-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8115-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'She looked at the street names, trying to ____ herself.',
       JSON_ARRAY(),
       'orient',
       'n. 东方, 东方诸国 a. 东方的 vi. 向东 vt. 使朝东, 使适应, 确定方向 ｜ 原句：She looked at the street names, trying to orient herself.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · oriental (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8116-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'oriental', JSON_ARRAY('oriental', 'orientals'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8116-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8116-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I have an interest in ____ ceramics.',
       JSON_ARRAY(),
       'oriental',
       'n. 东方人, 亚洲人 a. 东方诸国的, 亚洲的, 东方的 ｜ 原句：I have an interest in oriental ceramics.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · origin (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8117-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'origin', JSON_ARRAY('origin', 'origins'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8117-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8117-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'This word is also French in ____.',
       JSON_ARRAY(),
       'origin',
       'n. 起源, 起因, 出身, 开端 [计] 原点; 起始地址; 信件来源的相关数据 ｜ 原句：This word is also French in origin.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · original (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8118-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'original', JSON_ARRAY('original'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8118-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8118-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The translation is quite true to the ____.',
       JSON_ARRAY(),
       'original',
       'a. 最初的, 原始的, 有创意的 n. 原物, 原作 ｜ 原句：The translation is quite true to the original.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · originate (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8119-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'originate', JSON_ARRAY('originate', 'originates', 'originated', 'originating'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8119-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8119-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'How did the plan ____?',
       JSON_ARRAY(),
       'originate',
       'vt. 创始, 发明, 发起 vi. 发源, 发生, 起航 [计] 发自 ｜ 原句：How did the plan originate?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · ornament (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8120-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'ornament', JSON_ARRAY('ornament', 'ornaments'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8120-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8120-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'a shelf covered with books and ____',
       JSON_ARRAY(),
       'ornaments',
       'n. 装饰, 点缀品, 教堂用品 vt. 装饰, 修饰 ｜ 原句：a shelf covered with books and ornaments',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · orphan (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8121-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'orphan', JSON_ARRAY('orphan', 'orphans'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8121-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8121-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'They adopted the ____.',
       JSON_ARRAY(),
       'orphan',
       'n. 孤儿 a. 无双亲的, 孤儿的 vt. 使成孤儿 [计] 弧体 ｜ 原句：They adopted the orphan.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · otherwise (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8122-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'otherwise', JSON_ARRAY('otherwise'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8122-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8122-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Hurry up, ____ you''ll be late for lunch.',
       JSON_ARRAY(),
       'otherwise',
       'adv. 否则, 不同地, 别的方式 ｜ 原句：Hurry up, otherwise you''ll be late for lunch.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · ounce (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8124-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'ounce', JSON_ARRAY('ounce', 'ounces'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8124-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8124-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'An ____ of prevention is worth a pound of cure.',
       JSON_ARRAY(),
       'ounce',
       'n. 盎司, 少量, 雪豹 [医] 英两, Г ｜ 原句：An ounce of prevention is worth a pound of cure.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · outcome (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8125-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'outcome', JSON_ARRAY('outcome', 'outcomes'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8125-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8125-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Regardless what you may do, the ____ will still be the same.',
       JSON_ARRAY(),
       'outcome',
       'n. 结果, 出口 ｜ 原句：Regardless what you may do, the outcome will still be the same.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · outdoor (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8126-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'outdoor', JSON_ARRAY('outdoor'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8126-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8126-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Children like ____ activities.',
       JSON_ARRAY(),
       'outdoor',
       'a. 户外的, 屋外的, 露天的 ｜ 原句：Children like outdoor activities.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · outdoors (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8127-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'outdoors', JSON_ARRAY('outdoors'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8127-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8127-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The party will be held ____, weather permitting.',
       JSON_ARRAY(),
       'outdoors',
       'n. 户外, 野外活动 adv. 在户外, 在野外 ｜ 原句：The party will be held outdoors, weather permitting.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · outer (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8128-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'outer', JSON_ARRAY('outer', 'outerer', 'outerest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8128-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8128-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'How do you find food in ____ space?',
       JSON_ARRAY(),
       'outer',
       'a. 外部的, 外面的, 在外的, 远离中心的 [机] 外部的, 外面的, 外侧的 ｜ 原句：How do you find food in outer space?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · outlet (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8129-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'outlet', JSON_ARRAY('outlet', 'outlets'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8129-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8129-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I spilled jam on the electric ____ and there was a short circuit.',
       JSON_ARRAY(),
       'outlet',
       'n. 出口, 发泄方法, 市场 [医] 出口 ｜ 原句：I spilled jam on the electric outlet and there was a short circuit.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · outline (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8130-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'outline', JSON_ARRAY('outline', 'outlines'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8130-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8130-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Line art emphasizes form and ____, over color, shading, and texture.',
       JSON_ARRAY(),
       'outline',
       'n. 大纲, 轮廓, 概要 vt. 描画轮廓, 描述要点 n. 大纲, 分级, 轮廓 [计] 大纲, 分级, 轮廓 ｜ 原句：Line art emphasizes form and outline, over color, shading, and texture.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · outlook (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8131-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'outlook', JSON_ARRAY('outlook', 'outlooks'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8131-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8131-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Let go of your negative ____ on life.',
       JSON_ARRAY(),
       'outlook',
       'n. 观点, 景色, 前途, 了望 [经] 展望 ｜ 原句：Let go of your negative outlook on life.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · output (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8132-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'output', JSON_ARRAY('output', 'outputs'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8132-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8132-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '____ is up 30% on last year.',
       JSON_ARRAY(),
       'output',
       'n. 输出, 产品, 产量 [计] 输出 ｜ 原句：Output is up 30% on last year.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · outset (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8133-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'outset', JSON_ARRAY('outset', 'outsets'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8133-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8133-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'It was clear from the ____ that there were going to be problems.',
       JSON_ARRAY(),
       'outset',
       'n. 着手, 开头, 最初 ｜ 原句：It was clear from the outset that there were going to be problems.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · outskirt (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8134-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'outskirt', JSON_ARRAY('outskirt', 'outskirts'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8134-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8134-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The hotel is situated in the ____ of the city.',
       JSON_ARRAY(),
       'outskirt',
       'n. 边缘, 郊外, 外围 ｜ 原句：The hotel is situated in the outskirt of the city.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · outstanding (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8135-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'outstanding', JSON_ARRAY('outstanding'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8135-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8135-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He''s a man of ____ character.',
       JSON_ARRAY(),
       'outstanding',
       'a. 杰出的, 突出的, 未偿付的, 未决定的 [经] 未解决的, 未偿付 ｜ 原句：He''s a man of outstanding character.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · outward (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8136-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'outward', JSON_ARRAY('outward'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8136-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8136-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The economy and ____ appearance of the area have changed considerably.',
       JSON_ARRAY(),
       'outward',
       'a. 向外的, 表面的, 外服的 adv. 向外, 在外, 表面 ｜ 原句：The economy and outward appearance of the area have changed considerably.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · outwards (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8137-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'outwards', JSON_ARRAY('outwards'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8137-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8137-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'His body type is born balanced! Wide shoulders, slim waist, belly not popping ____.',
       JSON_ARRAY(),
       'outwards',
       'adv. 向外地 ｜ 原句：His body type is born balanced! Wide shoulders, slim waist, belly not popping outwards.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · oval (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8138-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'oval', JSON_ARRAY('oval', 'ovals'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8138-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8138-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'She has an ____ face.',
       JSON_ARRAY(),
       'oval',
       'n. 椭圆形 a. 卵形的, 椭圆形的 ｜ 原句：She has an oval face.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · oven (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8139-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'oven', JSON_ARRAY('oven', 'ovens'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8139-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8139-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'It is about time we bought a new microwave ____.',
       JSON_ARRAY(),
       'oven',
       'n. 烤箱, 灶, 子宫 [化] 烘箱 ｜ 原句：It is about time we bought a new microwave oven.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · overall (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8140-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'overall', JSON_ARRAY('overall'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8140-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8140-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The infrastructure of an application is directly related to its ____ performance.',
       JSON_ARRAY(),
       'overall',
       'a. 全部的, 全体的, 从头至尾的, 一切在内的 adv. 从头到尾, 总的说来 n. 罩衫, 工作服 ｜ 原句：The infrastructure of an application is directly related to its overall performance.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · overcoat (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8141-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'overcoat', JSON_ARRAY('overcoat', 'overcoats'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8141-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8141-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The child had no ____ on although it was very cold.',
       JSON_ARRAY(),
       'overcoat',
       'n. 外套大衣 ｜ 原句：The child had no overcoat on although it was very cold.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · overcome (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8142-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'overcome', JSON_ARRAY('overcome', 'overcomes', 'overcomed', 'overcoming'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8142-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8142-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'You have to ____ the difficulties.',
       JSON_ARRAY(),
       'overcome',
       'vt. 战胜, 克服, 胜过 vi. 得胜 ｜ 原句：You have to overcome the difficulties.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · overhead (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8144-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'overhead', JSON_ARRAY('overhead', 'overheads'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8144-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8144-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I saw a helicopter flying ____.',
       JSON_ARRAY(),
       'overhead',
       'n. 经常开支, 普通用费, 天花板 a. 在头上的, 高架的 adv. 在头顶上, 在空中, 在高处, 从头到脚全部没入地 [计] 总开销; 额外开销 ｜ 原句：I saw a helicopter flying overhead.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · overlook (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8145-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'overlook', JSON_ARRAY('overlook', 'overlooks', 'overlooked', 'overlooking'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8145-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8145-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Making this matter public would have an effect on our sales, so we''re going to ____ it this once.',
       JSON_ARRAY(),
       'overlook',
       'vt. 俯瞰, 远眺, 没注意到 n. 眺望, 俯瞰到的景色 ｜ 原句：Making this matter public would have an effect on our sales, so we''re going to overlook it this once.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · overnight (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8146-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'overnight', JSON_ARRAY('overnight', 'overnights'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8146-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8146-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'English cannot be mastered ____.',
       JSON_ARRAY(),
       'overnight',
       'n. 前一天晚上, 一夜的逗留 a. 通宵的, 晚上的, 前夜的 adv. 在前一夜, 整夜, 昨晚一晚上 ｜ 原句：English cannot be mastered overnight.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · overseas (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8147-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'overseas', JSON_ARRAY('overseas'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8147-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8147-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I''d like to make an ____ call.',
       JSON_ARRAY(),
       'overseas',
       'a. 海外的, 国外的 adv. 在海外, 在国外 ｜ 原句：I''d like to make an overseas call.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · overtake (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8148-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'overtake', JSON_ARRAY('overtake', 'overtakes', 'overtaked', 'overtaking'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8148-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8148-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Where did you ____ them?',
       JSON_ARRAY(),
       'overtake',
       'vt. 赶上, 突然降临于, 压倒, 代替 ｜ 原句：Where did you overtake them?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · overtime (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8149-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'overtime', JSON_ARRAY('overtime', 'overtimes'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8149-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8149-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I''m afraid you have to work ____.',
       JSON_ARRAY(),
       'overtime',
       'n. 超时, 加班, 延长时间 a. 超时的, 加班的 adv. 加班地 vt. 使超过时间 ｜ 原句：I''m afraid you have to work overtime.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · owe (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8150-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'owe', JSON_ARRAY('owe', 'owes', 'owed', 'owing'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8150-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8150-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'You ____ me an apology for that.',
       JSON_ARRAY(),
       'owe',
       'vt. 亏欠, 负...债, 归功于, 怀有, 应给予, 感恩 vi. 欠钱 ｜ 原句：You owe me an apology for that.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · owing (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8151-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'owing', JSON_ARRAY('owing'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8151-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8151-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Many flights were canceled, ____ to the typhoon.',
       JSON_ARRAY(),
       'owing',
       'a. 未付的, 亏欠的, 受惠的, 归因于...的 [经] 应付的, 欠着的, 未付的 ｜ 原句：Many flights were canceled, owing to the typhoon.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · owner (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8153-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'owner', JSON_ARRAY('owner', 'owners'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8153-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8153-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Who is the ____ of this house?',
       JSON_ARRAY(),
       'owner',
       'n. 拥有者, 物主, 所有人 [经] 所有者, 物主, 业主 ｜ 原句：Who is the owner of this house?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · ownership (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8154-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'ownership', JSON_ARRAY('ownership'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8154-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8154-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Management of a company is different from ____ of a company.',
       JSON_ARRAY(),
       'ownership',
       'n. 所有权, 物主身份 [经] 所有权, 所有制 ｜ 原句：Management of a company is different from ownership of a company.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · ox (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8155-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'ox', JSON_ARRAY('ox', 'oxes'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8155-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8155-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'When the cow flies high and the ____ flies low, there probably is a twister.',
       JSON_ARRAY(),
       'ox',
       'n. 牛 ｜ 原句：When the cow flies high and the ox flies low, there probably is a twister.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · oxygen (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8156-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'oxygen', JSON_ARRAY('oxygen', 'oxygens'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8156-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8156-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'We yawn when we are short of ____.',
       JSON_ARRAY(),
       'oxygen',
       'n. 氧 [化] 氧O-2 ｜ 原句：We yawn when we are short of oxygen.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pace (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8158-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'pace', JSON_ARRAY('pace', 'paces'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8158-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8158-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Please don''t walk so fast. I can''t keep ____ with you.',
       JSON_ARRAY(),
       'pace',
       'n. 速度, 步调, 步法 vi. 踱步, 缓慢走 vt. 用步测, 踱步于 ｜ 原句：Please don''t walk so fast. I can''t keep pace with you.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pacific (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8159-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'pacific', JSON_ARRAY('pacific', 'pacifics'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8159-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8159-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The ____ is the largest ocean in the world.',
       JSON_ARRAY(),
       'pacific',
       'n. 太平洋 a. 太平洋的, 太平洋沿岸的, 爱好和平的, 安静的, 平息的 ｜ 原句：The Pacific is the largest ocean in the world.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pack (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8160-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'pack', JSON_ARRAY('pack', 'packs'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8160-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8160-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'She helped me ____ my suitcase.',
       JSON_ARRAY(),
       'pack',
       'n. 包裹, 一伙, 一副, 背包, 包装 vt. 包装, 捆扎, 塞满, 压紧, 挑选 vi. 包装货物, 挤, 群集, 被包装 [计] 压缩 ｜ 原句：She helped me pack my suitcase.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · package (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8161-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'package', JSON_ARRAY('package', 'packages'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8161-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8161-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I''d like to send this ____ to Japan.',
       JSON_ARRAY(),
       'package',
       'n. 包裹, 套装软件, 包, 包装用物, 程序包 vt. 包装, 打包 a. 一揽子的 [计] 包, 软件包, 包装 ｜ 原句：I''d like to send this package to Japan.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · packet (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8162-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'packet', JSON_ARRAY('packet', 'packets'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8162-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8162-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'She opened a ____ of biscuits.',
       JSON_ARRAY(),
       'packet',
       'n. 小包, 一批信件, 大量, 信息包 vt. 打包, 装进小包 [计] 分组, 分组报文, 数据分组 ｜ 原句：She opened a packet of biscuits.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pad (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8163-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'pad', JSON_ARRAY('pad', 'pads'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8163-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8163-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'May I use your ink ____?',
       JSON_ARRAY(),
       'pad',
       'n. 填补, 衬垫, 印色盒, 路 vt. 填补, 走, 夸大 vi. 步行 [计] 焊接点; 包装配/拆卸 ｜ 原句：May I use your ink pad?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · painful (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8166-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'painful', JSON_ARRAY('painful'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8166-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8166-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Any task may become ____.',
       JSON_ARRAY(),
       'painful',
       'a. 痛苦的, 困难的, 令人烦恼的 [医] 疼痛的 ｜ 原句：Any task may become painful.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · paint (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8167-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'paint', JSON_ARRAY('paint', 'paints'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8167-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8167-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I didn''t need to ____ the fence.',
       JSON_ARRAY(),
       'paint',
       'n. 油漆, 颜料, 绘画作品, 涂漆 vt. 油漆, 绘, 画, 描绘, 装饰, 点缀 vi. 绘画, 涂漆 ｜ 原句：I didn''t need to paint the fence.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · painter (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8168-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'painter', JSON_ARRAY('painter', 'painters'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8168-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8168-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'You are a good ____, aren''t you?',
       JSON_ARRAY(),
       'painter',
       'n. 画家, 油漆匠 [机] 油漆匠, 喷漆匠 ｜ 原句：You are a good painter, aren''t you?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · palm (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8171-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'palm', JSON_ARRAY('palm', 'palms'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8171-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8171-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I am interested in ____ reading.',
       JSON_ARRAY(),
       'palm',
       'n. 手掌, 棕榈, 胜利 vt. 与...握手, 藏...于掌中 ｜ 原句：I am interested in palm reading.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pan (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8172-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'pan', JSON_ARRAY('pan', 'pans'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8172-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8172-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Here is a ____ without handles.',
       JSON_ARRAY(),
       'pan',
       'n. 平锅, 浅盘, 盆地, 硬土层, 拍摄全景 v. 上下左右移动, 摇镜头, 淘洗, 淘金 ｜ 原句：Here is a pan without handles.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · panda (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8173-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'panda', JSON_ARRAY('panda', 'pandas'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8173-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8173-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Have you ever seen a ____?',
       JSON_ARRAY(),
       'panda',
       'n. 大熊猫, 小熊猫 ｜ 原句：Have you ever seen a panda?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pane (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8174-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'pane', JSON_ARRAY('pane', 'panes'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8174-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8174-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Tom broke the window ____.',
       JSON_ARRAY(),
       'pane',
       'n. 窗玻璃, 方框, 方格, 窗格 vt. 嵌窗玻璃于 [计] 窗格 ｜ 原句：Tom broke the window pane.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · panel (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8175-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'panel', JSON_ARRAY('panel', 'panels'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8175-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8175-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'A ____ of experts discussed the plan.',
       JSON_ARRAY(),
       'panel',
       'n. 嵌板, 仪表板, 专题讨论小组, 全体陪审员 vt. 嵌镶板 ｜ 原句：A panel of experts discussed the plan.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pant (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8176-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'pant', JSON_ARRAY('pant', 'pants'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8176-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8176-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Tom rolled up his ____ legs so people could see his bright red socks.',
       JSON_ARRAY(),
       'pant',
       'n. 喘息, 悸动 vi. 喘息, 渴望 vt. 气喘吁吁地说 ｜ 原句：Tom rolled up his pant legs so people could see his bright red socks.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · parade (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8178-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'parade', JSON_ARRAY('parade', 'parades'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8178-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8178-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I caught sight of a ____ on my way home.',
       JSON_ARRAY(),
       'parade',
       'n. 游行, 炫耀, 阅兵 v. 游行, 炫耀, (使)列队行进 ｜ 原句：I caught sight of a parade on my way home.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · paradise (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8179-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'paradise', JSON_ARRAY('paradise', 'paradises'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8179-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8179-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The island is a ____ for children.',
       JSON_ARRAY(),
       'paradise',
       'n. 天堂, 乐园, 伊甸园 ｜ 原句：The island is a paradise for children.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · paragraph (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8180-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'paragraph', JSON_ARRAY('paragraph', 'paragraphs'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8180-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8180-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'This ____ is vague.',
       JSON_ARRAY(),
       'paragraph',
       'n. 段落, 短评 vt. 将...分段, 分段落 vi. 写短讯 [计] 段落 ｜ 原句：This paragraph is vague.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · parallel (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8181-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'parallel', JSON_ARRAY('parallel', 'parallels'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8181-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8181-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The road is ____ to the river.',
       JSON_ARRAY(),
       'parallel',
       'n. 平行, 对比, 相匹敌之物 a. 平行的, 相似的 vt. 与...平行, 与...相似, 相比, 使平行 [计] 并联; 并行 ｜ 原句：The road is parallel to the river.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · parcel (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8182-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'parcel', JSON_ARRAY('parcel', 'parcels'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8182-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8182-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The address on this ____ is wrong.',
       JSON_ARRAY(),
       'parcel',
       'n. 包裹, 部分, 片 vt. 分配, 打包 a. 部分的 adv. 局部地 ｜ 原句：The address on this parcel is wrong.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · parliament (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8183-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'parliament', JSON_ARRAY('parliament'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8183-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8183-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The Japanese ____ today officially elected Ryūtarō Hashimoto as the country''s 52nd prime minister.',
       JSON_ARRAY(),
       'parliament',
       'n. 国会, 议会 [法] 会议, 国会, 议院 ｜ 原句：The Japanese Parliament today officially elected Ryūtarō Hashimoto as the country''s 52nd prime minister.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · parlor (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8184-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'parlor', JSON_ARRAY('parlor', 'parlors'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8184-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8184-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Sami took Layla to a tea ____.',
       JSON_ARRAY(),
       'parlor',
       'n. 客厅, 会客室, 小店 a. 客厅的 ｜ 原句：Sami took Layla to a tea parlor.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · part (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8185-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'part', JSON_ARRAY('part', 'parts'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8185-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8185-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Mathematics is the ____ of science you could continue to do if you woke up tomorrow and discovered the universe was gone.',
       JSON_ARRAY(),
       'part',
       'n. 部分, 局部, 零件, 要素, 等分, 职责, 角色, 部位 vt. 分开, 分离, 断绝, 区别, 分配 vi. 分开, 断裂, 分手 a. 部分的, 局部的 adv. 部分地, 有些 ｜ 原句：Mathematics is the part of science you could continue to do if you woke up tomorrow and discovered the universe was gone.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · partial (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8186-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'partial', JSON_ARRAY('partial'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8186-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8186-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'It was only a ____ success.',
       JSON_ARRAY(),
       'partial',
       'a. 部分的, 偏袒的, 偏爱的 n. 分音 ｜ 原句：It was only a partial success.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · partially (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8187-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'partially', JSON_ARRAY('partially'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8187-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8187-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'You''re ____ correct.',
       JSON_ARRAY(),
       'partially',
       'adv. 部分地, 一部分地, 不公平地 ｜ 原句：You''re partially correct.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · participate (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8188-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'participate', JSON_ARRAY('participate', 'participates', 'participated', 'participating'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8188-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8188-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I don''t want to ____ in the ceremony.',
       JSON_ARRAY(),
       'participate',
       'vi. 参加, 分享, 参与, 带有 vt. 分享, 分担 ｜ 原句：I don''t want to participate in the ceremony.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · particular (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8190-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'particular', JSON_ARRAY('particular', 'particulars'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8190-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8190-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I have no ____ reason to do so.',
       JSON_ARRAY(),
       'particular',
       'n. 一项(或条、点), 个别项目, 详细说明 a. 特别的, 独有的, 挑剔的, 详尽的 ｜ 原句：I have no particular reason to do so.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · particularly (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8191-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'particularly', JSON_ARRAY('particularly'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8191-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8191-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I like music, ____ classical music.',
       JSON_ARRAY(),
       'particularly',
       'adv. 特别, 格外, 尤其, 详细地, 细致地 ｜ 原句：I like music, particularly classical music.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · partly (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8192-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'partly', JSON_ARRAY('partly', 'partlier', 'partliest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8192-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8192-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The wall is ____ covered with ivy.',
       JSON_ARRAY(),
       'partly',
       'adv. 部分地, 在一定程度上 ｜ 原句：The wall is partly covered with ivy.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · partner (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8193-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'partner', JSON_ARRAY('partner', 'partners'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8193-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8193-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The teacher and her ____ took the people attending the wedding to a park.',
       JSON_ARRAY(),
       'partner',
       'n. 合伙人, 股东, 伙伴, 伴侣 vt. 与...合伙, 组成一对 vi. 做伙伴, 当助手 ｜ 原句：The teacher and her partner took the people attending the wedding to a park.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · passenger (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8194-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'passenger', JSON_ARRAY('passenger', 'passengers'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8194-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8194-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Tom put the large picnic basket on the ____ seat next to him.',
       JSON_ARRAY(),
       'passenger',
       'n. 乘客, 旅客 [经] 乘客, 旅客 ｜ 原句：Tom put the large picnic basket on the passenger seat next to him.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · passion (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8195-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'passion', JSON_ARRAY('passion', 'passions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8195-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8195-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'To share one''s ____ is to live it fully.',
       JSON_ARRAY(),
       'passion',
       'n. 激情, 酷爱, 热爱, 强烈感情, 耶稣受难(故事) ｜ 原句：To share one''s passion is to live it fully.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · passive (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8196-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'passive', JSON_ARRAY('passive'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8196-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8196-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Watching TV is a ____ activity.',
       JSON_ARRAY(),
       'passive',
       'a. 消极的, 被动的, 冷漠的, 顺从的, 无源的 [医] 被动的 ｜ 原句：Watching TV is a passive activity.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · paste (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8197-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'paste', JSON_ARRAY('paste', 'pastes'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8197-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8197-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Country girls like to cut red paper into peach and plum blossoms and ____ them onto doors and windows.',
       JSON_ARRAY(),
       'paste',
       'n. 面团, 面食, 浆糊, 糊状物, 粘贴, 用拳重击 vt. 用浆糊粘, 张贴, 狠狠地打 [计] 粘贴 ｜ 原句：Country girls like to cut red paper into peach and plum blossoms and paste them onto doors and windows.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pastime (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8198-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'pastime', JSON_ARRAY('pastime', 'pastimes'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8198-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8198-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Playing cards is a popular ____.',
       JSON_ARRAY(),
       'pastime',
       'n. 消遣, 娱乐, 游戏 ｜ 原句：Playing cards is a popular pastime.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pat (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8199-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'pat', JSON_ARRAY('pat', 'pats'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8199-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8199-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I felt somebody ____ me on the shoulder.',
       JSON_ARRAY(),
       'pat',
       'n. 轻拍 v. 轻拍 adv. 适时, 正好, 恰好, 毫不迟疑, 熟记地 a. 恰好的, 合适的, 熟练的, 坚定的, 人为的 ｜ 原句：I felt somebody pat me on the shoulder.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · patch (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8200-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'patch', JSON_ARRAY('patch', 'patches'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8200-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8200-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Let''s ____ up our argument.',
       JSON_ARRAY(),
       'patch',
       'n. 片, 补缀, 碎片, 斑, 傻瓜 vt. 补缀, 掩饰, 拼凑, 平息 [计] 修补; 拼凑 ｜ 原句：Let''s patch up our argument.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · path (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8201-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'path', JSON_ARRAY('path', 'paths'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8201-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8201-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'There''s a secret ____ on the left.',
       JSON_ARRAY(),
       'path',
       'n. 路径, 小路, 道路, 途径, 路线, 轨道 [计] 路径; DOS内部命令:设定DOS读取程序的路径 ｜ 原句：There''s a secret path on the left.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · patience (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8202-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'patience', JSON_ARRAY('patience', 'patiences'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8202-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8202-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '____ is essential for a teacher.',
       JSON_ARRAY(),
       'patience',
       'n. 耐性, 忍耐 ｜ 原句：Patience is essential for a teacher.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pattern (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8204-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'pattern', JSON_ARRAY('pattern', 'patterns'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8204-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8204-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'India ink produces an interesting ____ when used as a dye.',
       JSON_ARRAY(),
       'pattern',
       'n. 模范, 典型, 式样, 样品, 图案, 格调, 模式 vt. 模仿, 仿造, 以图案装饰 vi. 形成图案 [计] 模式, 图案 ｜ 原句：India ink produces an interesting pattern when used as a dye.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pause (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8205-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'pause', JSON_ARRAY('pause', 'pauses'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8205-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8205-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He spoke for ten minutes without a ____.',
       JSON_ARRAY(),
       'pause',
       'n. 暂停, 中止, 停顿, 间歇, 踌躇, 休止符 vi. 暂停, 中止, 停顿, 踌躇 [计] DOS内部命令:暂时停止批处理文件的执行 ｜ 原句：He spoke for ten minutes without a pause.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pavement (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8207-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'pavement', JSON_ARRAY('pavement'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8207-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8207-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Walk on the ____.',
       JSON_ARRAY(),
       'pavement',
       'n. 路面, 人行道, 铺面路, 铺路材料 ｜ 原句：Walk on the pavement.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · payment (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8209-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'payment', JSON_ARRAY('payment'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8209-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8209-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'We will make the ____ by bank transfer.',
       JSON_ARRAY(),
       'payment',
       'n. 付款, 支付的款项(或实物), 偿还, 报应, 惩罚 [经] 支付, 缴纳, 支付款额 ｜ 原句：We will make the payment by bank transfer.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pea (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8210-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'pea', JSON_ARRAY('pea', 'peas'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8210-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8210-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'There''s a ____ in my right nostril.',
       JSON_ARRAY(),
       'pea',
       'n. 豌豆, 似豌豆的东西 ｜ 原句：There''s a pea in my right nostril.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · peace (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8211-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'peace', JSON_ARRAY('peace', 'peaces'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8211-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8211-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'We are longing for world ____.',
       JSON_ARRAY(),
       'peace',
       'n. 和平, 和约, 治安, 和睦, 安宁, 静寂 vi. 安静下来, 不作声 ｜ 原句：We are longing for world peace.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · peaceful (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8212-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'peaceful', JSON_ARRAY('peaceful'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8212-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8212-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Country life is very ____ in comparison with city life.',
       JSON_ARRAY(),
       'peaceful',
       'a. 平静的, 和平的, 和平时期的, 爱好和平的, 喜爱安静的 [法] 和平的, 爱好和平的, 和平时期的 ｜ 原句：Country life is very peaceful in comparison with city life.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · peach (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8213-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'peach', JSON_ARRAY('peach', 'peaches'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8213-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8213-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Country girls like to cut red paper into ____ and plum blossoms and paste them onto doors and windows.',
       JSON_ARRAY(),
       'peach',
       'n. 桃子, 桃树, 桃色, 美人儿, 极好的事物 vt. 告发 vi. 告密, 检举 ｜ 原句：Country girls like to cut red paper into peach and plum blossoms and paste them onto doors and windows.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · peak (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8214-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'peak', JSON_ARRAY('peak', 'peaks'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8214-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8214-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The excitement reached its ____.',
       JSON_ARRAY(),
       'peak',
       'n. 山峰, 巅, 山顶, 顶点, 尖峰, 帽舌 a. 最高的, 最大值的 vi. 到达最高点, 消瘦, 变憔悴, 逐渐缩小 vt. 使竖起, 使达到最高点 ｜ 原句：The excitement reached its peak.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pear (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8215-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'pear', JSON_ARRAY('pear', 'pears'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8215-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8215-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'This ____ smells nice.',
       JSON_ARRAY(),
       'pear',
       'n. 梨子, 梨树, 梨木 [机] 梨木 ｜ 原句：This pear smells nice.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pearl (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8216-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'pearl', JSON_ARRAY('pearl', 'pearls'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8216-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8216-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Hong Kong is referred to as the ____ of Asia.',
       JSON_ARRAY(),
       'pearl',
       'n. 珍珠, 珠灰色, 杰出者, 珍贵之物 vt. 用珍珠镶, 使成珠状 vi. 成珠子状, 采珍珠, 用珍珠做 ｜ 原句：Hong Kong is referred to as the Pearl of Asia.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · peasant (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8217-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'peasant', JSON_ARRAY('peasant', 'peasants'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8217-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8217-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Most villagers are ____ farmers.',
       JSON_ARRAY(),
       'peasant',
       'n. 农夫, 乡下人 ｜ 原句：Most villagers are peasant farmers.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pebble (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8218-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'pebble', JSON_ARRAY('pebble', 'pebbles'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8218-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8218-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'She stooped to pick up a ____.',
       JSON_ARRAY(),
       'pebble',
       'n. 小圆石, 小鹅卵石, 水晶透镜, 碎石花纹 [医] 小石 ｜ 原句：She stooped to pick up a pebble.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · peculiar (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8219-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'peculiar', JSON_ARRAY('peculiar'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8219-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8219-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'This milk has a ____ smell.',
       JSON_ARRAY(),
       'peculiar',
       'a. 奇特的, 罕见的, 特殊的, 特别的 n. 特有财产, 特权 ｜ 原句：This milk has a peculiar smell.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · peel (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8220-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'peel', JSON_ARRAY('peel', 'peels'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8220-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8220-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I''ll ____ an orange for you.',
       JSON_ARRAY(),
       'peel',
       'n. 皮, 外壳 vt. 削...皮, 剥去...的壳 vi. 蜕皮, 剥落, 脱皮, 脱去衣服 ｜ 原句：I''ll peel an orange for you.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · peninsula (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8223-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'peninsula', JSON_ARRAY('peninsula', 'peninsulas'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8223-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8223-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Have you ever been to the Korean ____?',
       JSON_ARRAY(),
       'peninsula',
       'n. 半岛, 突出的地方, 伊比利亚半岛 ｜ 原句：Have you ever been to the Korean Peninsula?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · penny (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8224-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'penny', JSON_ARRAY('penny', 'pennies'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8224-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8224-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '____ wise, pound foolish.',
       JSON_ARRAY(),
       'penny',
       'n. 便士, 一分, 小钱, 点滴 [经] 便士 ｜ 原句：Penny wise, pound foolish.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pension (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8225-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'pension', JSON_ARRAY('pension', 'pensions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8225-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8225-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'People over 65 can receive a ____ from the government.',
       JSON_ARRAY(),
       'pension',
       'n. 养老金, 退休金, 津贴, 年金, 抚恤金, 膳宿学校, 膳宿费 vt. 发给退休金, 用津贴拉拢 ｜ 原句：People over 65 can receive a pension from the government.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pepper (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8226-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'pepper', JSON_ARRAY('pepper', 'peppers'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8226-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8226-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I seasoned the fish with salt and ____.',
       JSON_ARRAY(),
       'pepper',
       'n. 胡椒粉, 胡椒, 辣椒 [化] 胡椒; 辣椒; 花椒 ｜ 原句：I seasoned the fish with salt and pepper.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · perceive (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8227-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'perceive', JSON_ARRAY('perceive', 'perceives', 'perceived', 'perceiving'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8227-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8227-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I ____ by your face that you have good news.',
       JSON_ARRAY(),
       'perceive',
       'vt. 感觉, 认知, 理解, 意识到 ｜ 原句：I perceive by your face that you have good news.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · percent (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8228-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'percent', JSON_ARRAY('percent', 'percents'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8228-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8228-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'More than 90 ____ of visits to a web page are from search engines.',
       JSON_ARRAY(),
       'percent',
       'n. 百分比, 百分数, 部分 [机] 百分率 ｜ 原句：More than 90 percent of visits to a web page are from search engines.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · percentage (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8229-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'percentage', JSON_ARRAY('percentage', 'percentages'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8229-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8229-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'What ____ of all taxi drivers make unscrupulous detours, do you think?',
       JSON_ARRAY(),
       'percentage',
       'n. 百分比, 比率, 部分, 可能性 [计] 百分比 ｜ 原句：What percentage of all taxi drivers make unscrupulous detours, do you think?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · perfectly (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8230-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'perfectly', JSON_ARRAY('perfectly'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8230-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8230-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I understand your position ____.',
       JSON_ARRAY(),
       'perfectly',
       'adv. 完全地, 无瑕疵地, 完整地 ｜ 原句：I understand your position perfectly.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · perform (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8231-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'perform', JSON_ARRAY('perform', 'performs', 'performed', 'performing'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8231-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8231-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Doctors refused to ____ a second operation.',
       JSON_ARRAY(),
       'perform',
       'vt. 进行, 履行, 完成, 执行, 表演 vi. 行动, 工作, 执行, 演出 ｜ 原句：Doctors refused to perform a second operation.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · performance (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8232-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'performance', JSON_ARRAY('performance', 'performances'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8232-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8232-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I am not satisfied with my ____ today.',
       JSON_ARRAY(),
       'performance',
       'n. 施行, 工作情况, 成绩, 行为, 表现, 演出 [电] 绩效, 性能 ｜ 原句：I am not satisfied with my performance today.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · perfume (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8233-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'perfume', JSON_ARRAY('perfume', 'perfumes'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8233-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8233-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The ____ of roses filled the room.',
       JSON_ARRAY(),
       'perfume',
       'n. 香水, 香气, (悦人的)气氛, 美名 vt. 洒香水于, 薰香, 使充满香气 ｜ 原句：The perfume of roses filled the room.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · perhaps (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8234-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'perhaps', JSON_ARRAY('perhaps'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8234-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8234-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '____ you are right, I have been selfish.',
       JSON_ARRAY(),
       'perhaps',
       'adv. 也许, 大概 ｜ 原句：Perhaps you are right, I have been selfish.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · period (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8235-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'period', JSON_ARRAY('period', 'periods'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8235-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8235-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The students'' lunch ____ is from twelve to one.',
       JSON_ARRAY(),
       'period',
       'n. 时期, 节段, 节, 句点, 学时, 周期 a. 当时特有的, 过去某段时期的 interj. 就是这话, 就是这么回事 ｜ 原句：The students'' lunch period is from twelve to one.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · permanent (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8236-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'permanent', JSON_ARRAY('permanent'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8236-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8236-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Please give me your ____ address.',
       JSON_ARRAY(),
       'permanent',
       'a. 永久的, 不变的, 固定的, 持久的 n. 烫发 [计] 永久的 ｜ 原句：Please give me your permanent address.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · permanently (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8237-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'permanently', JSON_ARRAY('permanently'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8237-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8237-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'You''re still young, but not ____.',
       JSON_ARRAY(),
       'permanently',
       'adv. 永久, 不变, 持久 [计] 永久性的 ｜ 原句：You''re still young, but not permanently.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · permission (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8238-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'permission', JSON_ARRAY('permission', 'permissions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8238-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8238-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'You ought to ask for your teacher''s ____.',
       JSON_ARRAY(),
       'permission',
       'n. 许可, 允许 [计] 许可, 认可 ｜ 原句：You ought to ask for your teacher''s permission.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · permit (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8239-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'permit', JSON_ARRAY('permit', 'permits'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8239-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8239-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Will you ____ me to go there?',
       JSON_ARRAY(),
       'permit',
       'n. 许可证, 许可, 执照, 通行证 vt. 允许, 容许, 可能, 使放手做 vi. 容许, 给以机会, 提供可能 ｜ 原句：Will you permit me to go there?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · persist (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8240-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'persist', JSON_ARRAY('persist', 'persisted', 'persists', 'persisting'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8240-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8240-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '‘I don’t think it’s right,’ John ____.',
       JSON_ARRAY(),
       'persisted',
       'vi. 坚持, 固执, 持续, 坚称 [经] 持续 ｜ 原句：‘I don’t think it’s right,’ John persisted.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · personal (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8241-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'personal', JSON_ARRAY('personal'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8241-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8241-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Peter was an altruistic video game player; he would give items to people who needed them, rather than selling them for ____ profit.',
       JSON_ARRAY(),
       'personal',
       'a. 私人的, 涉及隐私的, 有人性的, 人称的, 亲自的, 身体的 [医] 人的; 个人的, 自身的 ｜ 原句：Peter was an altruistic video game player; he would give items to people who needed them, rather than selling them for personal profit.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · personality (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8242-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'personality', JSON_ARRAY('personality'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8242-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8242-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'There are a lot of things you don''t know about my ____.',
       JSON_ARRAY(),
       'personality',
       'n. 个性, 人格, (团体、地方、国家)特有特性, 名人 [医] 人格; 个性 ｜ 原句：There are a lot of things you don''t know about my personality.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · personnel (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8243-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'personnel', JSON_ARRAY('personnel', 'personnels'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8243-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8243-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'All ____ are to receive security badges.',
       JSON_ARRAY(),
       'personnel',
       'n. 人员, 人事部门, 人事科(处) [经] 人事, 全体人员, 职工 ｜ 原句：All personnel are to receive security badges.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · perspective (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8244-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'perspective', JSON_ARRAY('perspective', 'perspectives'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8244-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8244-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'His father’s death gave him a whole new ____ on life.',
       JSON_ARRAY(),
       'perspective',
       'n. 远景, 透视感, (观察问题的)视角, 透视法, 看法, 透视图 a. 透视的, 透视法的 [计] 透视 ｜ 原句：His father’s death gave him a whole new perspective on life.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · persuade (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8245-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'persuade', JSON_ARRAY('persuade', 'persuades', 'persuaded', 'persuading'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8245-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8245-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'We tried to ____ him.',
       JSON_ARRAY(),
       'persuade',
       'vt. 劝, 使相信, 恳求, 敦促, 说服 vi. 劝服, 被说服 ｜ 原句：We tried to persuade him.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pessimistic (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8246-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'pessimistic', JSON_ARRAY('pessimistic'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8246-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8246-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Everyone feels ____.',
       JSON_ARRAY(),
       'pessimistic',
       'a. 悲观的, 厌世的, 悲观主义的 ｜ 原句：Everyone feels pessimistic.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pet (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8247-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'pet', JSON_ARRAY('pet', 'pets'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8247-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8247-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'My ____ cat died yesterday.',
       JSON_ARRAY(),
       'pet',
       'n. 宠物, 受宠爱的人, 宠坏的孩子, 不悦, 生气 a. 宠爱的, 表示亲昵的, 养着观赏的, 特别珍爱的, 格外的 vt. 宠爱, 溺爱, 抚摸 vi. 拥抱, 爱抚, 生气, 发脾气 ｜ 原句：My pet cat died yesterday.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · petrol (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8248-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'petrol', JSON_ARRAY('petrol', 'petrols'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8248-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8248-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'More and more environmentalists advocate and use environmentally friendly unleaded ____ in cars.',
       JSON_ARRAY(),
       'petrol',
       'n. 汽油 [经] 汽油, 挥发油, 石油 ｜ 原句：More and more environmentalists advocate and use environmentally friendly unleaded petrol in cars.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · petroleum (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8249-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'petroleum', JSON_ARRAY('petroleum', 'petroleums'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8249-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8249-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '____-based products',
       JSON_ARRAY(),
       'petroleum',
       'n. 石油 [化] 石油 ｜ 原句：petroleum-based products',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · phase (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8250-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'phase', JSON_ARRAY('phase', 'phases'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8250-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8250-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Cancer can be cured easily if it is found in its first ____.',
       JSON_ARRAY(),
       'phase',
       'n. 时期, 局面, 方面, 位相, 相, 阶段 vt. 使调整相位, 使定相, 使一致, 逐步执行, 实行 [计] 阶段 ｜ 原句：Cancer can be cured easily if it is found in its first phase.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · philosopher (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8251-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'philosopher', JSON_ARRAY('philosopher', 'philosophers'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8251-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8251-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Russell was a brilliant ____, but even the simplest practical task was quite beyond him.',
       JSON_ARRAY(),
       'philosopher',
       'n. 哲学家, 哲人, 思想开创人, 达观的人 [法] 哲学家, 哲学研究者 ｜ 原句：Russell was a brilliant philosopher, but even the simplest practical task was quite beyond him.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · philosophy (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8252-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'philosophy', JSON_ARRAY('philosophy', 'philosophies'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8252-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8252-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The first subject that attracted my attention was ____.',
       JSON_ARRAY(),
       'philosophy',
       'n. 哲学, 人生观, 哲学思想, 哲理, 基本原理, 见解, 达观, 沉着 ｜ 原句：The first subject that attracted my attention was philosophy.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · phone (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8253-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'phone', JSON_ARRAY('phone', 'phones'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8253-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8253-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The ____ is ringing. "I''ll get it."',
       JSON_ARRAY(),
       'phone',
       'n. 电话, 受话器, 耳机 vt. 打电话给 vi. 打电话 ｜ 原句：The phone is ringing. "I''ll get it."',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · photograph (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8254-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'photograph', JSON_ARRAY('photograph', 'photographs'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8254-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8254-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'This ____ reminds me of enjoyable times when I was a child.',
       JSON_ARRAY(),
       'photograph',
       'n. 相片, 照片, 逼真的描绘 v. 照相, 摄影 ｜ 原句：This photograph reminds me of enjoyable times when I was a child.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · phrase (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8256-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'phrase', JSON_ARRAY('phrase', 'phrases'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8256-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8256-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'What is the meaning of this ____?',
       JSON_ARRAY(),
       'phrase',
       'n. 惯用语, 词组, 成语, 措词, 乐句 vt. 用短语表达, 把(乐曲)分成短句 [计] 短语 ｜ 原句：What is the meaning of this phrase?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · physical (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8257-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'physical', JSON_ARRAY('physical'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8257-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8257-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Scientists deal mainly with ____ matters.',
       JSON_ARRAY(),
       'physical',
       'a. 身体的, 物质的, 自然的, 物理学的, 好色的 n. 体格检查 ｜ 原句：Scientists deal mainly with physical matters.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · physician (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8258-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'physician', JSON_ARRAY('physician', 'physicians'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8258-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8258-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The ____ prescribed his patient some medicine.',
       JSON_ARRAY(),
       'physician',
       'n. 医师, 内科医师, 解除痛苦者 [医] 主治医师 ｜ 原句：The physician prescribed his patient some medicine.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · physics (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8260-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'physics', JSON_ARRAY('physics'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8260-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8260-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'My ____ teacher doesn''t care if I skip classes.',
       JSON_ARRAY(),
       'physics',
       'n. 物理学, 物理过程, 物理现象 [化] 物理; 物理学 ｜ 原句：My physics teacher doesn''t care if I skip classes.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · picnic (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8261-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'picnic', JSON_ARRAY('picnic', 'picnics'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8261-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8261-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'How come Mary is going on a ____ with him?',
       JSON_ARRAY(),
       'picnic',
       'n. 野餐, 远足, 愉快的经历 vi. 去野餐, 远足 ｜ 原句：How come Mary is going on a picnic with him?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pie (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8262-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'pie', JSON_ARRAY('pie', 'pies'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8262-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8262-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Have you ever eaten a banana ____?',
       JSON_ARRAY(),
       'pie',
       'n. 馅饼, 财富, 总额, 贪污受贿, 杂乱, 喜鹊 [计] 饼图 ｜ 原句：Have you ever eaten a banana pie?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pierce (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8263-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'pierce', JSON_ARRAY('pierce', 'pierces', 'pierced', 'piercing'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8263-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8263-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'If a high hill stood between A and B, it was important to decide whether the line should climb over it, ____ it with a tunnel, or make a detour to avoid it.',
       JSON_ARRAY(),
       'pierce',
       'vt. 刺穿, 穿透, 打眼于, 洞悉, (声音)响彻, (亮光)照进, 深深地打动 vi. 刺入, 穿入, 透入, 进入 ｜ 原句：If a high hill stood between A and B, it was important to decide whether the line should climb over it, pierce it with a tunnel, or make a detour to avoid it.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pig (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8264-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'pig', JSON_ARRAY('pig', 'pigs'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8264-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8264-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Don''t eat like a ____.',
       JSON_ARRAY(),
       'pig',
       'n. 猪, 猪肉, 贪婪的人, 猪一样的人 v. 生小猪, 象猪般地生活 ｜ 原句：Don''t eat like a pig.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pigeon (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8265-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'pigeon', JSON_ARRAY('pigeon', 'pigeons'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8265-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8265-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Many journalists here choose to ____ all but the most innocuous of stories.',
       JSON_ARRAY(),
       'pigeon',
       'n. 鸽子, 易上当受骗的人, 年轻女子 ｜ 原句：Many journalists here choose to pigeon all but the most innocuous of stories.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pile (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8266-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'pile', JSON_ARRAY('pile', 'piles'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8266-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8266-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I haven''t had time to do the dishes for two days; they are in a ____ in the kitchen sink.',
       JSON_ARRAY(),
       'pile',
       'n. 堆, 大堆, 大厦, 建筑群, 电池, 大量, 桥桩, 软毛, 痔疮 vi. 堆起, 堆积, 积累, 挤, 猛烈攻击 vt. 堆于, 累积, 堆叠, 打桩于, 用桩支撑 ｜ 原句：I haven''t had time to do the dishes for two days; they are in a pile in the kitchen sink.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pill (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8267-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'pill', JSON_ARRAY('pill', 'pills'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8267-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8267-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He has to take ____ to control his blood pressure.',
       JSON_ARRAY(),
       'pills',
       'n. 药丸, 弹丸, 屈辱, 胡说 v. 做成药丸, 形成丸状, 服药丸, 挫败, 抢劫 ｜ 原句：He has to take pills to control his blood pressure.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pillar (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8268-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'pillar', JSON_ARRAY('pillar', 'pillars'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8268-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8268-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'A large ____ obstructs the view of the lake.',
       JSON_ARRAY(),
       'pillar',
       'n. 柱子, 栋梁, 台柱, 重要的支持者 [医] 柱, 脚 ｜ 原句：A large pillar obstructs the view of the lake.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pillow (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8269-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'pillow', JSON_ARRAY('pillow', 'pillows'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8269-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8269-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Could I have a ____ and blanket?',
       JSON_ARRAY(),
       'pillow',
       'n. 枕头, 靠垫, 枕状岩 vt. 作...的枕头, 垫, 枕于 vi. 靠在枕上 ｜ 原句：Could I have a pillow and blanket?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pilot (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8270-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'pilot', JSON_ARRAY('pilot', 'pilots'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8270-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8270-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Tom wants to be a ____.',
       JSON_ARRAY(),
       'pilot',
       'n. 飞行员, 领航员, 航船者, 导向器, 驾驶仪, 向导, 领导人 vt. 领航, 驾驶, 引导, 试用 a. 引导的, 控制的, 试点的 [计] 引导 ｜ 原句：Tom wants to be a pilot.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pin (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8271-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'pin', JSON_ARRAY('pin', 'pins'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8271-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8271-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'It was so still that you would have heard a ____ drop.',
       JSON_ARRAY(),
       'pin',
       'n. 大头针, 针, 别针, 栓, 销子, 图钉, 插头, 管脚, 品(液量单位) vt. 将...用针别住, 钉住, 压住, 牵制, 使不能动, 归罪于 a. 针的, 销子的, 闩的 ｜ 原句：It was so still that you would have heard a pin drop.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pinch (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8272-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'pinch', JSON_ARRAY('pinch', 'pinches'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8272-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8272-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Add a tiny ____ of salt.',
       JSON_ARRAY(),
       'pinch',
       'n. 捏, 拧, 撮, 少量, 收缩, 挤压, 夹痛, 苦恼, 逮捕, 指控, 匮乏, 紧急关头 vt. 捏, 拧, 掐, 挤压, 修剪, 使困苦, 使萎缩, 节制, 少量加入, 逮捕, 勒索 vi. 收缩, 节省, 挤压, 引起苦恼 ｜ 原句：Add a tiny pinch of salt.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pine (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8273-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'pine', JSON_ARRAY('pine', 'pines'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8273-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8273-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'There used to be a big ____ tree in front of my house.',
       JSON_ARRAY(),
       'pine',
       'n. 松树, 松木 vi. 消瘦, 憔悴, 痛苦, 怀念, 渴望 [计] 邮件程序 ｜ 原句：There used to be a big pine tree in front of my house.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pink (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8274-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'pink', JSON_ARRAY('pink', 'pinks'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8274-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8274-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Who is the woman dressed in ____?',
       JSON_ARRAY(),
       'pink',
       'n. 粉红色, 石竹花, 化身, 典范, 头面人物, 极度 a. 粉红的, 石竹科的, 比较激进的, 脸色发红的, 精致的, 有点下流的 vt. 刺, 扎, 刺痛, 射伤, 使面红耳赤, 使变粉红色 vi. 变粉红色 ｜ 原句：Who is the woman dressed in pink?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pint (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8275-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'pint', JSON_ARRAY('pint', 'pints'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8275-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8275-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Beer is sold by the ____.',
       JSON_ARRAY(),
       'pint',
       'n. 品脱(干量或液量的单位) [医] 量磅, 品脱 ｜ 原句：Beer is sold by the pint.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pipe (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8276-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'pipe', JSON_ARRAY('pipe', 'pipes'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8276-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8276-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Something is stuck in the ____.',
       JSON_ARRAY(),
       'pipe',
       'n. 管, 导管, 输送管, 管状器官, 声带, 尖细的声音, 烟斗, 笛, 管乐器 vt. 以管输送, 吹哨子, 吹奏, 尖声唱 vi. 吹笛, 尖叫, 吹长哨发令 [计] 管道 ｜ 原句：Something is stuck in the pipe.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pistol (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8278-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'pistol', JSON_ARRAY('pistol', 'pistols'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8278-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8278-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Never trust a woman with a ____ in hand.',
       JSON_ARRAY(),
       'pistol',
       'n. 手枪, 信号枪 vt. 以手枪杀死(或伤害) ｜ 原句：Never trust a woman with a pistol in hand.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pit (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8279-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'pit', JSON_ARRAY('pit', 'pits'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8279-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8279-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The demon grabbed my sister and, with howling laughter, cast her into a bottomless ____.',
       JSON_ARRAY(),
       'pit',
       'n. 深坑, 矿井, 果核, 地窖, 深渊, 绝境, 陷阱 vt. 窖藏, 使凹下, 使有麻点, 去...之核, 使留疤痕, 使相斗, 使竞争 vi. 起凹点, 凹陷 ｜ 原句：The demon grabbed my sister and, with howling laughter, cast her into a bottomless pit.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · plain (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8281-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'plain', JSON_ARRAY('plain', 'plains'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8281-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8281-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Could you say that in ____ English?',
       JSON_ARRAY(),
       'plain',
       'n. 平原, 草原, 朴实无华的东西, 无格式 a. 简单的, 明白的, 平常的, 不好看的, 朴素的, 清晰的, 普通的, 平坦的, 十足的 adv. 清楚地, 显然地 [计] 无格式 ｜ 原句：Could you say that in plain English?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · planet (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8282-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'planet', JSON_ARRAY('planet', 'planets'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8282-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8282-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'When I was your age, Pluto was a ____.',
       JSON_ARRAY(),
       'planet',
       'n. 行星, 命运星辰, 杰出的人, 重大影响的事 ｜ 原句：When I was your age, Pluto was a planet.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · plastic (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8285-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'plastic', JSON_ARRAY('plastic', 'plastics'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8285-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8285-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'On May 18, a young Japanese couple was arrested after their one-year-old baby was found wrapped in a ____ bag and dumped in a gutter.',
       JSON_ARRAY(),
       'plastic',
       'n. 塑料, 可塑体, 可塑性物质 a. 塑料的, 塑造的, 有可塑性的, 造型的, 易受影响的, 有创造力的 ｜ 原句：On May 18, a young Japanese couple was arrested after their one-year-old baby was found wrapped in a plastic bag and dumped in a gutter.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · platform (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8286-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'platform', JSON_ARRAY('platform', 'platforms'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8286-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8286-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The train for Birmingham leaves from ____ 3.',
       JSON_ARRAY(),
       'platform',
       'n. 站台, 月台, 讲台, 论坛, 平台 [计] 平台 ｜ 原句：The train for Birmingham leaves from platform 3.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · player (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8287-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'player', JSON_ARRAY('player', 'players'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8287-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8287-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Peter was an altruistic video game ____; he would give items to people who needed them, rather than selling them for personal profit.',
       JSON_ARRAY(),
       'player',
       'n. 竞赛者, 上场队员, 游戏者, 演员 [经] 交易者 ｜ 原句：Peter was an altruistic video game player; he would give items to people who needed them, rather than selling them for personal profit.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · playground (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8288-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'playground', JSON_ARRAY('playground', 'playgrounds'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8288-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8288-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'A group of young men are playing handball in the ____.',
       JSON_ARRAY(),
       'playground',
       'n. 运动场, 操场, 度假胜地, 活动场所 ｜ 原句：A group of young men are playing handball in the playground.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pleasant (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8289-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'pleasant', JSON_ARRAY('pleasant'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8289-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8289-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'It was a ____ day, but there were few people in the park.',
       JSON_ARRAY(),
       'pleasant',
       'a. 愉快的, 可爱的, 活泼的, 亲切的 ｜ 原句：It was a pleasant day, but there were few people in the park.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · plentiful (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8290-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'plentiful', JSON_ARRAY('plentiful'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8290-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8290-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'She shed ____ tears when her beloved dog was killed in an accident.',
       JSON_ARRAY(),
       'plentiful',
       'a. 许多的, 丰富的, 丰饶的 ｜ 原句：She shed plentiful tears when her beloved dog was killed in an accident.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · plenty (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8291-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'plenty', JSON_ARRAY('plenty', 'plenties'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8291-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8291-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I have ____ of money with me.',
       JSON_ARRAY(),
       'plenty',
       'n. 充分, 很多, 丰富 a. 很多的, 足够的, 丰富的 ｜ 原句：I have plenty of money with me.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · plot (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8292-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'plot', JSON_ARRAY('plot', 'plots'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8292-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8292-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'a two-acre ____ of land',
       JSON_ARRAY(),
       'plot',
       'n. 小块土地, 地区图, 图, 阴谋, 情节 vt. 划分, 绘图, 密谋 vi. 密谋, 策划 [计] 绘制 ｜ 原句：a two-acre plot of land',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · plough (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8293-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'plough', JSON_ARRAY('plough', 'ploughs'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8293-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8293-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'There are new tractors and new ____ in the machinery lot.',
       JSON_ARRAY(),
       'ploughs',
       'n. 犁, 犁过的地 vi. 用犁耕田, 开路 vt. 耕, 犁, 开路 ｜ 原句：There are new tractors and new ploughs in the machinery lot.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pluck (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8294-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'pluck', JSON_ARRAY('pluck', 'plucks'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8294-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8294-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I want to ____ your facial hair.',
       JSON_ARRAY(),
       'pluck',
       'n. 勇气, 猛拉, 动物内脏 vt. 摘, 猛拉, 拔, 拉, 扯, 采 vi. 拉, 拽 ｜ 原句：I want to pluck your facial hair.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · plug (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8295-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'plug', JSON_ARRAY('plug', 'plugs'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8295-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8295-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Did you know that if you ____ a pickle into an electrical outlet, it glows and makes buzzing noises?',
       JSON_ARRAY(),
       'plug',
       'n. 塞子, 栓, 插头 vt. 插入, 塞住, 接插头 vi. 被塞住 ｜ 原句：Did you know that if you plug a pickle into an electrical outlet, it glows and makes buzzing noises?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · plunge (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8296-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'plunge', JSON_ARRAY('plunge', 'plunges'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8296-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8296-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The government''s political and economic reforms threaten to ____ the country into chaos.',
       JSON_ARRAY(),
       'plunge',
       'n. 钻进, 跳进, 跳水, 跳水池, 猛跌, 落下, 投入, 开始从事, 盲目投资 vi. 投入, 投身于, 跳进, 陷入, 下降 vt. 使投入, 使插入, 使陷入, 使遭受 ｜ 原句：The government''s political and economic reforms threaten to plunge the country into chaos.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · plural (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8297-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'plural', JSON_ARRAY('plural', 'plurals'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8297-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8297-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The ____ form of "louse" is "lice".',
       JSON_ARRAY(),
       'plural',
       'n. 复数 a. 复数的, 两个以上的 ｜ 原句：The plural form of "louse" is "lice".',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pocket (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8299-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'pocket', JSON_ARRAY('pocket', 'pockets'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8299-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8299-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The boy has an apple in his ____.',
       JSON_ARRAY(),
       'pocket',
       'n. 口袋, 钱袋, 钱, 容器 vt. 装...在口袋里, 隐藏, 抑制, 私吞, 搁置, 击...入袋 a. 袖珍的, 小型的, 压缩的, 金钱上的 ｜ 原句：The boy has an apple in his pocket.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · poem (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8300-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'poem', JSON_ARRAY('poem', 'poems'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8300-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8300-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Tom told her that he had written that ____ two years before.',
       JSON_ARRAY(),
       'poem',
       'n. 诗, 诗般美的事物 ｜ 原句：Tom told her that he had written that poem two years before.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · poetry (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8302-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'poetry', JSON_ARRAY('poetry', 'poetries'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8302-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8302-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Wine is ____ in bottles.',
       JSON_ARRAY(),
       'poetry',
       'n. 诗, 韵文, 诗歌艺术 ｜ 原句：Wine is poetry in bottles.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · point (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8303-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'point', JSON_ARRAY('point', 'points'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8303-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8303-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'If anyone was to ask what the ____ of the story is, I really don''t know.',
       JSON_ARRAY(),
       'point',
       'n. 点, 小数点, 标点, 地点, 要点, 特点, 尖端, 分数, 得分, 穴位 vt. 弄尖, 强调, 指出, 加标点于, 瞄准 vi. 指, 指向, 表明 ｜ 原句：If anyone was to ask what the point of the story is, I really don''t know.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · poison (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8304-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'poison', JSON_ARRAY('poison', 'poisons'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8304-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8304-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'This ____ is very effective in getting rid of roaches.',
       JSON_ARRAY(),
       'poison',
       'n. 毒药, 毒, 毒物, 有毒害的事物 vt. 毒害, 毒杀, 使中毒 vi. 放毒, 下毒 ｜ 原句：This poison is very effective in getting rid of roaches.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · poke (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8306-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'poke', JSON_ARRAY('poke', 'pokes'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8306-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8306-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'It''s best if you don''t ____ your nose into other people''s business.',
       JSON_ARRAY(),
       'poke',
       'n. 刺, 戳, 袋子 vt. 戳, 捅, 拨弄, 刺 vi. 戳, 刺, 捅, 搜索, 伸出, 行动散慢 [计] 存数 ｜ 原句：It''s best if you don''t poke your nose into other people''s business.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · police (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8308-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'police', JSON_ARRAY('police', 'polices'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8308-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8308-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The ____ will get you to find the bullets.',
       JSON_ARRAY(),
       'police',
       'n. 警察, 警察当局, 治安 vt. 维持治安, 管辖 ｜ 原句：The police will get you to find the bullets.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · policy (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8309-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'policy', JSON_ARRAY('policy', 'policies'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8309-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8309-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'We studied the government''s economic ____.',
       JSON_ARRAY(),
       'policy',
       'n. 政策, 方针, 策略, 保险单 [医] 凭单, 保险单 ｜ 原句：We studied the government''s economic policy.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · political (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8311-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'political', JSON_ARRAY('political'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8311-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8311-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The organization is not connected with any ____ parties.',
       JSON_ARRAY(),
       'political',
       'a. 政治的, 政治上的, 政党的, 从事政治的 [法] 政治的, 政治上的, 党派政治的 ｜ 原句：The organization is not connected with any political parties.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · politician (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8312-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'politician', JSON_ARRAY('politician', 'politicians'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8312-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8312-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The ____ pushed for reform by denouncing the corruption of the government officials.',
       JSON_ARRAY(),
       'politician',
       'n. 政客, 政治家, 从事党派政治的人 [法] 政客, 政治家 ｜ 原句：The politician pushed for reform by denouncing the corruption of the government officials.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · politics (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8313-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'politics', JSON_ARRAY('politics'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8313-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8313-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Are you concerned with ____?',
       JSON_ARRAY(),
       'politics',
       'n. 政治, 政治学, 政见, 政治活动 [法] 政治, 政治学, 政纲 ｜ 原句：Are you concerned with politics?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · poll (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8314-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'poll', JSON_ARRAY('poll', 'polls'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8314-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8314-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'It is a prevalent belief, according to a nationwide ____ in the United States, that Muslims are linked with terrorism.',
       JSON_ARRAY(),
       'poll',
       'n. 投票, 民意测验, 选举投票, 投票数, 一组人中的一个, 头颈和后脑部, 鹦鹉 vt. 对...进行民意测验, 获得...票, 剪树枝, 轮询 vi. 投票 a. 剪过毛的, 修过枝的 [计] 轮询 ｜ 原句：It is a prevalent belief, according to a nationwide poll in the United States, that Muslims are linked with terrorism.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pollute (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8315-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'pollute', JSON_ARRAY('pollute', 'pollutes', 'polluted', 'polluting'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8315-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8315-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'We ought to do our best not to ____ our environment.',
       JSON_ARRAY(),
       'pollute',
       'vt. 污染, 弄脏, 玷污 [化] 污染 ｜ 原句：We ought to do our best not to pollute our environment.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pollution (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8316-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'pollution', JSON_ARRAY('pollution', 'pollutions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8316-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8316-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Because of the problem of air ____, the bicycle may some day replace the automobile.',
       JSON_ARRAY(),
       'pollution',
       'n. 污染, 玷污 [化] 污染 ｜ 原句：Because of the problem of air pollution, the bicycle may some day replace the automobile.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pond (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8317-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'pond', JSON_ARRAY('pond', 'ponds'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8317-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8317-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'A gentle wind made ripples on the surface of the ____.',
       JSON_ARRAY(),
       'pond',
       'n. 池塘 v. 筑成池塘 ｜ 原句：A gentle wind made ripples on the surface of the pond.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pool (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8318-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'pool', JSON_ARRAY('pool', 'pools'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8318-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8318-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'You can use the hotel''s swimming ____.',
       JSON_ARRAY(),
       'pool',
       'n. 池, 水塘, 石油层, 联营 vt. 合伙经营, 共享, 采掘, 汇聚成 vi. 汇合成塘, 淤积, 联营 ｜ 原句：You can use the hotel''s swimming pool.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · popular (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8320-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'popular', JSON_ARRAY('popular'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8320-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8320-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Gardening has been ____ for some years.',
       JSON_ARRAY(),
       'popular',
       'a. 通俗的, 流行的, 受欢迎的, 大众的, 人民的, 普及的 [经] 大众的, 通俗的, 普及的 ｜ 原句：Gardening has been popular for some years.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · population (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8321-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'population', JSON_ARRAY('population', 'populations'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8321-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8321-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'By the year 2020, the ____ of our city will have doubled.',
       JSON_ARRAY(),
       'population',
       'n. 人口, 人口数 [化] 群体; 总体 ｜ 原句：By the year 2020, the population of our city will have doubled.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · porch (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8322-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'porch', JSON_ARRAY('porch', 'porches'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8322-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8322-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Three men are waiting for you on the ____.',
       JSON_ARRAY(),
       'porch',
       'n. 门廊, 走廊 ｜ 原句：Three men are waiting for you on the porch.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · porridge (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8323-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'porridge', JSON_ARRAY('porridge', 'porridges'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8323-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8323-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'There is a saying: cabbage soup and ____ are our food.',
       JSON_ARRAY(),
       'porridge',
       'n. 粥, 糊 ｜ 原句：There is a saying: cabbage soup and porridge are our food.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · port (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8324-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'port', JSON_ARRAY('port', 'ports'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8324-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8324-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'A whistle blew, and the boat slowly began to pull out of ____.',
       JSON_ARRAY(),
       'port',
       'n. 港口, 埠, 舱门, 避风港, 左舷, 炮眼, 姿势, 意义 vt. 左转舵, 持(枪) vi. 左转舵 [计] 端口, 移植 ｜ 原句：A whistle blew, and the boat slowly began to pull out of port.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · portable (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8325-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'portable', JSON_ARRAY('portable'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8325-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8325-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The device is ____.',
       JSON_ARRAY(),
       'portable',
       'a. 可携带的, 可搬运的, 可移动的 [计] 可移植的 ｜ 原句：The device is portable.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · porter (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8326-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'porter', JSON_ARRAY('porter', 'porters'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8326-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8326-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Our taxi pulled up at Old Delhi station and a ____ sprinted to the door.',
       JSON_ARRAY(),
       'porter',
       'n. 大楼管理员, 门房, 搬运工人, 侍者, 服务员 [化] 搬运车; 搬运工人 ｜ 原句：Our taxi pulled up at Old Delhi station and a porter sprinted to the door.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · portion (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8327-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'portion', JSON_ARRAY('portion', 'portions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8327-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8327-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'A ____ of the proceeds will go to benefit children with disabilities.',
       JSON_ARRAY(),
       'portion',
       'n. 部分, 一份, 命运, 嫁妆 vt. 分配, 给...嫁妆 ｜ 原句：A portion of the proceeds will go to benefit children with disabilities.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · portrait (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8328-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'portrait', JSON_ARRAY('portrait', 'portraits'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8328-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8328-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'There is a ____ of Bob on the wall.',
       JSON_ARRAY(),
       'portrait',
       'n. 肖像, 人像, 半身像, 描写, 竖排格式 [计] 纵向 ｜ 原句：There is a portrait of Bob on the wall.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pose (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8330-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'pose', JSON_ARRAY('pose', 'poses'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8330-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8330-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'When you ____ a question, you expect an answer.',
       JSON_ARRAY(),
       'pose',
       'n. 姿势, 姿态, 装模作样, 伪装 vi. 摆姿势, 装模作样, 假装 vt. 使摆好姿势, 提出, 造成 ｜ 原句：When you pose a question, you expect an answer.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · position (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8331-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'position', JSON_ARRAY('position', 'positions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8331-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8331-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I understand your ____ perfectly.',
       JSON_ARRAY(),
       'position',
       'n. 位置, 地位, 身分, 形势, 姿势, 立场, 职位, 状态, 阵地 vt. 安置, 决定...的位置 [计] 位置 ｜ 原句：I understand your position perfectly.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · positive (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8332-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'positive', JSON_ARRAY('positive'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8332-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8332-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I am ____ that he is wrong.',
       JSON_ARRAY(),
       'positive',
       'a. 肯定的, 积极的, 有把握的 [医] 正的, 阳性的 ｜ 原句：I am positive that he is wrong.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · possess (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8333-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'possess', JSON_ARRAY('possess', 'possesses', 'possessed', 'possessing'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8333-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8333-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'It is the things that we do not ____ which seem to us most desirable.',
       JSON_ARRAY(),
       'possess',
       'vt. 持有, 占有, 拥有, 克制, 支配, 迷住 [法] 持有, 占有, 具有 ｜ 原句：It is the things that we do not possess which seem to us most desirable.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · possession (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8334-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'possession', JSON_ARRAY('possession', 'possessions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8334-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8334-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The ball is that boy''s prized ____.',
       JSON_ARRAY(),
       'possession',
       'n. 拥有, 占有, 所有, 财产, 领土, 领地, 自制, 着迷 [经] 占有, 持有 ｜ 原句：The ball is that boy''s prized possession.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · possibility (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8335-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'possibility', JSON_ARRAY('possibility'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8335-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8335-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'There''s a ____ that the man was murdered.',
       JSON_ARRAY(),
       'possibility',
       'n. 可能性, 可能的事 [法] 可能性, 可能发生的事, 不确定权 ｜ 原句：There''s a possibility that the man was murdered.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · possibly (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8338-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'possibly', JSON_ARRAY('possibly'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8338-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8338-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '____ the factory will be closed down next week.',
       JSON_ARRAY(),
       'possibly',
       'adv. 可能, 也许 ｜ 原句：Possibly the factory will be closed down next week.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · postage (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8339-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'postage', JSON_ARRAY('postage', 'postages'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8339-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8339-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'How much is the ____ for a postcard?',
       JSON_ARRAY(),
       'postage',
       'n. 邮资 [经] 邮费, 邮资 ｜ 原句：How much is the postage for a postcard?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · postman (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8340-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'postman', JSON_ARRAY('postman', 'postmans'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8340-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8340-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The ____ delivers letters every morning.',
       JSON_ARRAY(),
       'postman',
       'n. 邮递员 [法] 邮递员, 理财法庭的高级律师 ｜ 原句：The postman delivers letters every morning.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · postpone (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8341-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'postpone', JSON_ARRAY('postpone', 'postponed', 'postpones', 'postponing'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8341-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8341-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The match had to be ____ until next week.',
       JSON_ARRAY(),
       'postponed',
       'vt. 延迟, 使延期, 缓办, 搁延 vi. 延缓, 延缓发作 ｜ 原句：The match had to be postponed until next week.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pot (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8342-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'pot', JSON_ARRAY('pot', 'pots'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8342-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8342-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Bob filled the ____ with water.',
       JSON_ARRAY(),
       'pot',
       'n. 盆, 罐, 壶, 坩埚, 奖杯 vt. 装入盆中, 在锅中煮, 随手射击 vi. 随手射击 ｜ 原句：Bob filled the pot with water.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · potential (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8343-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'potential', JSON_ARRAY('potential', 'potentials'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8343-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8343-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'If you are a ____ employee then you should be aware of what the company stands for and how it treats its employees before attending an interview.',
       JSON_ARRAY(),
       'potential',
       'n. 潜在性, 可能性, 潜力, 潜能, 势, 位 a. 有潜力的, 可能的, 潜在的 ｜ 原句：If you are a potential employee then you should be aware of what the company stands for and how it treats its employees before attending an interview.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pound (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8344-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'pound', JSON_ARRAY('pound', 'pounds'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8344-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8344-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'We bought a ____ of tea.',
       JSON_ARRAY(),
       'pound',
       'n. 磅, 英镑, 重击, 鱼塘, 拘留所, 兽栏 vt. 强烈打击, 捣烂, 监禁, 关入栏内 vi. 连续重击, 苦干 ｜ 原句：We bought a pound of tea.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pour (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8345-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'pour', JSON_ARRAY('pour', 'pours'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8345-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8345-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '____ melted butter over the popcorn.',
       JSON_ARRAY(),
       'pour',
       'n. 流出, 倾泻, 骤雨 vt. 倒, 灌, 注, 倾泻, 诉说, 倾吐 vi. 倾泻, 蜂涌而来, 下大雨 ｜ 原句：Pour melted butter over the popcorn.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · poverty (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8346-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'poverty', JSON_ARRAY('poverty', 'poverties'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8346-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8346-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Rye was called the grain of ____.',
       JSON_ARRAY(),
       'poverty',
       'n. 贫穷, 贫困, 缺乏 [医] 贫乏, 缺乏 ｜ 原句：Rye was called the grain of poverty.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · powder (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8347-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'powder', JSON_ARRAY('powder', 'powders'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8347-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8347-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The table is covered with ____.',
       JSON_ARRAY(),
       'powder',
       'n. 粉, 粉末, 火药 vt. 搽粉于, 搽粉, 撒粉, 使成粉末 vi. 搽粉, 变成粉末 ｜ 原句：The table is covered with powder.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · power (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8348-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'power', JSON_ARRAY('power', 'powers'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8348-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8348-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Don''t underestimate my ____.',
       JSON_ARRAY(),
       'power',
       'n. 力, 体力, 力量, 势力, 动力, 权力, 强国, 乘方, 强度, 幂, 功率 vt. 使...有力量, 供以动力, 激励 [计] 乘幂; DOS外部命令:能控制许多电池电源计算机上的电源管理特性 ｜ 原句：Don''t underestimate my power.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · powerful (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8349-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'powerful', JSON_ARRAY('powerful'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8349-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8349-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Japan''s army was very ____.',
       JSON_ARRAY(),
       'powerful',
       'a. 有力的, 有权力的, 强大的 [机] 强力的 ｜ 原句：Japan''s army was very powerful.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · practical (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8351-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'practical', JSON_ARRAY('practical'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8351-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8351-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'It''s ____ to have a laptop.',
       JSON_ARRAY(),
       'practical',
       'a. 实际的, 现实的, 实用性的 [法] 事实上的, 实际上的, 接近...的 ｜ 原句：It''s practical to have a laptop.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · practically (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8352-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'practically', JSON_ARRAY('practically'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8352-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8352-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The famous hotel was ____ destroyed by a large fire.',
       JSON_ARRAY(),
       'practically',
       'adv. 几乎, 差不多, 事实上 ｜ 原句：The famous hotel was practically destroyed by a large fire.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · practise (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8353-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'practise', JSON_ARRAY('practise', 'practises', 'practised', 'practising'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8353-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8353-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'It''s not that I don''t like your English, but for me it''s important to use every opportunity to ____ Russian.',
       JSON_ARRAY(),
       'practise',
       'v. 实践, 实行, 练习, 实习, 从事(职业) ｜ 原句：It''s not that I don''t like your English, but for me it''s important to use every opportunity to practise Russian.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · praise (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8354-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'praise', JSON_ARRAY('praise', 'praises'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8354-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8354-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'It''s not immoral for a novelist to tell lies. In fact, the bigger the lies, the better lies, and the more the common folks and critics will ____ you.',
       JSON_ARRAY(),
       'praise',
       'n. 赞美, 称赞, 崇拜 vt. 称赞, 赞美 vi. 赞扬, 表扬 ｜ 原句：It''s not immoral for a novelist to tell lies. In fact, the bigger the lies, the better lies, and the more the common folks and critics will praise you.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pray (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8355-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'pray', JSON_ARRAY('pray', 'prays', 'prayed', 'praying'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8355-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8355-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'We all knelt down to ____.',
       JSON_ARRAY(),
       'pray',
       'v. 祈祷, 恳求, 请 ｜ 原句：We all knelt down to pray.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · precaution (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8357-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'precaution', JSON_ARRAY('precaution', 'precautions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8357-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8357-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Fire ____ were neglected.',
       JSON_ARRAY(),
       'precautions',
       'n. 预防, 留心, 警戒 vt. 预先警告 ｜ 原句：Fire precautions were neglected.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · preceding (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8358-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'preceding', JSON_ARRAY('preceding'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8358-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8358-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The third quarter GNP growth was 1% over the ____ quarter.',
       JSON_ARRAY(),
       'preceding',
       'a. 在前的, 前面的 [法] 在前的, 在先的, 前面的 ｜ 原句：The third quarter GNP growth was 1% over the preceding quarter.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · precious (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8359-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'precious', JSON_ARRAY('precious'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8359-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8359-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The one resource more ____ than any other was land.',
       JSON_ARRAY(),
       'precious',
       'a. 宝贵的, 珍贵的, 过于精致的, 珍爱的 ｜ 原句：The one resource more precious than any other was land.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · precise (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8360-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'precise', JSON_ARRAY('precise'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8360-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8360-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He gave me ____ instructions to do the job.',
       JSON_ARRAY(),
       'precise',
       'a. 精确的, 严谨的, 明确的 [机] 精密的, 正确的 ｜ 原句：He gave me precise instructions to do the job.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · precision (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8361-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'precision', JSON_ARRAY('precision', 'precisions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8361-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8361-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Our teacher is someone who likes ____, and always demands precise answers of her students.',
       JSON_ARRAY(),
       'precision',
       'n. 精密, 精确, 精确度, 精度 a. 精密的, 精确的 [计] 精度 ｜ 原句：Our teacher is someone who likes precision, and always demands precise answers of her students.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · predict (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8362-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'predict', JSON_ARRAY('predict', 'predicts', 'predicted', 'predicting'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8362-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8362-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'It''s hard to ____ what the weather will be like tomorrow.',
       JSON_ARRAY(),
       'predict',
       'v. 预知, 预言, 预报 ｜ 原句：It''s hard to predict what the weather will be like tomorrow.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · preface (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8363-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'preface', JSON_ARRAY('preface', 'prefaces'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8363-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8363-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '...the ____ to Kelman''s novel.',
       JSON_ARRAY(),
       'preface',
       'n. 序, 绪言, 前言 vi. 作序, 写前言 vt. 给...作序, 以...开始 ｜ 原句：...the preface to Kelman''s novel.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · prefer (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8364-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'prefer', JSON_ARRAY('prefer', 'prefers'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8364-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8364-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I ____ to look for a solution to problems, not only to report them.',
       JSON_ARRAY(),
       'prefer',
       'vt. 宁可, 较喜欢, 提出 [法] 给予优先权, 优先偿还, 提出 ｜ 原句：I prefer to look for a solution to problems, not only to report them.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · preferable (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8365-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'preferable', JSON_ARRAY('preferable'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8365-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8365-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I think death is ____ to shame.',
       JSON_ARRAY(),
       'preferable',
       'a. 更可取的, 更好的, 更合意的 ｜ 原句：I think death is preferable to shame.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · preference (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8366-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'preference', JSON_ARRAY('preference', 'preferences'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8366-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8366-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Do you have a colour ____ ?',
       JSON_ARRAY(),
       'preference',
       'n. 偏爱, 优先, 喜爱物 [计] 首选项 ｜ 原句：Do you have a colour preference ?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · prejudice (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8367-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'prejudice', JSON_ARRAY('prejudice', 'prejudices'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8367-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8367-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I don''t have a ____ against foreign workers.',
       JSON_ARRAY(),
       'prejudice',
       'n. 偏见, 成见, 侵害 vt. 使存偏见, 使有成见, 侵害 ｜ 原句：I don''t have a prejudice against foreign workers.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · preliminary (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8368-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'preliminary', JSON_ARRAY('preliminary', 'preliminaries'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8368-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8368-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'the ____ stages of the competition',
       JSON_ARRAY(),
       'preliminary',
       'n. 初步做法, 初步措施, 预试, 预选赛 a. 初步的, 开始的, 预备的 ｜ 原句：the preliminary stages of the competition',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · premier (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8369-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'premier', JSON_ARRAY('premier', 'premiers'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8369-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8369-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Because all of the teams in the ____ League are really strong, the goal difference is usually small.',
       JSON_ARRAY(),
       'premier',
       'n. 总理, 首相 a. 首位的, 最初的 ｜ 原句：Because all of the teams in the Premier League are really strong, the goal difference is usually small.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · preparation (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8370-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'preparation', JSON_ARRAY('preparation', 'preparations'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8370-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8370-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'We failed due to a lack of ____.',
       JSON_ARRAY(),
       'preparation',
       'n. 准备, 预备, 预习 [化] 制剂 ｜ 原句：We failed due to a lack of preparation.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · prepare (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8371-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'prepare', JSON_ARRAY('prepare', 'prepares', 'prepared', 'preparing'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8371-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8371-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '____ five postcard sized pieces of cardboard.',
       JSON_ARRAY(),
       'prepare',
       'vt. 准备, 筹备, 使在思想上有准备, 制造, 调制 vi. 预备 ｜ 原句：Prepare five postcard sized pieces of cardboard.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · preposition (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8372-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'preposition', JSON_ARRAY('preposition', 'prepositions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8372-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8372-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'In is a ____.',
       JSON_ARRAY(),
       'preposition',
       'n. 前置词, 介词 ｜ 原句：In is a preposition.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · prescribe (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8373-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'prescribe', JSON_ARRAY('prescribe', 'prescribes', 'prescribed', 'prescribing'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8373-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8373-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The physician examines the patient then diagnoses the disease and ____ medication.',
       JSON_ARRAY(),
       'prescribes',
       'v. 规定, 指定, 嘱咐, 开处方 ｜ 原句：The physician examines the patient then diagnoses the disease and prescribes medication.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · presence (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8374-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'presence', JSON_ARRAY('presence', 'presences'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8374-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8374-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'John felt the ____ of a ghost in the dark room.',
       JSON_ARRAY(),
       'presence',
       'n. 出席, 面前, 存在, 仪态, 风度 [电] 出现 ｜ 原句：John felt the presence of a ghost in the dark room.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · presently (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8375-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'presently', JSON_ARRAY('presently'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8375-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8375-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The president is ____ in Miami.',
       JSON_ARRAY(),
       'presently',
       'adv. 目前, 不久 ｜ 原句：The president is presently in Miami.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · preserve (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8376-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'preserve', JSON_ARRAY('preserve', 'preserves', 'preserved', 'preserving'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8376-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8376-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Salt helps to ____ food from decay.',
       JSON_ARRAY(),
       'preserve',
       'vt. 保护, 保持, 保存, 维持, 腌, 禁猎 vi. 加工食品, 禁猎 n. 加工成的食品, 禁猎地, 保护区, 防护物 ｜ 原句：Salt helps to preserve food from decay.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · president (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8377-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'president', JSON_ARRAY('president', 'presidents'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8377-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8377-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'For whom will you vote for ____?',
       JSON_ARRAY(),
       'president',
       'n. 总统, 总裁, 董事长, (学院)院长, (大学)校长, 主管人, 主持人 [经] 总经理, 董事长, 总裁 ｜ 原句：For whom will you vote for president?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · press (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8378-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'press', JSON_ARRAY('press', 'presses'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8378-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8378-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '____ the bell twice.',
       JSON_ARRAY(),
       'press',
       'n. 压, 揿, 按, 人群, 印刷机, 压力, 出版社, 记者, 报刊, 新闻舆论, 紧迫 vt. 压, 压榨, 紧抱, 逼迫, 推进, 强迫征募, 催逼 vi. 压, 重压, 催促, 拥挤, 奋力前进, 受压 ｜ 原句：Press the bell twice.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pressure (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8379-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'pressure', JSON_ARRAY('pressure', 'pressures'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8379-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8379-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The bridge crashed under the ____.',
       JSON_ARRAY(),
       'pressure',
       'n. 压, 榨, 按, 强制, 压力, 压迫, 压强 vt. 迫使, 使增压, 密封 ｜ 原句：The bridge crashed under the pressure.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pretend (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8381-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'pretend', JSON_ARRAY('pretend', 'pretends', 'pretended', 'pretending'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8381-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8381-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Let''s ____ we are aliens.',
       JSON_ARRAY(),
       'pretend',
       'v. 假装, 伪称, 自命, 自称 ｜ 原句：Let''s pretend we are aliens.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pretty (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8382-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'pretty', JSON_ARRAY('pretty', 'prettier', 'prettiest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8382-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8382-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'This looks ____ interesting, Hiroshi says.',
       JSON_ARRAY(),
       'pretty',
       'a. 漂亮的, 优美的, 机灵的, 狡猾的, 恰当的 adv. 相当, 颇 ｜ 原句：This looks pretty interesting, Hiroshi says.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · prevail (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8383-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'prevail', JSON_ARRAY('prevail', 'prevails', 'prevailed', 'prevailing'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8383-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8383-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Justice will ____ in the end.',
       JSON_ARRAY(),
       'prevail',
       'vi. 获胜, 流行, 盛行 [医] 流行, 盛行 ｜ 原句：Justice will prevail in the end.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · prevent (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8384-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'prevent', JSON_ARRAY('prevent', 'prevents', 'prevented', 'preventing'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8384-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8384-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'We took strong measures to ____ it.',
       JSON_ARRAY(),
       'prevent',
       'v. 预防, 防止, 阻止, 妨碍 ｜ 原句：We took strong measures to prevent it.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · previous (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8385-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'previous', JSON_ARRAY('previous'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8385-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8385-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I would like to retract my ____ statement.',
       JSON_ARRAY(),
       'previous',
       'a. 早先的, 前面的, 过急的 [法] 以前的, 生前的, 前述的 ｜ 原句：I would like to retract my previous statement.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · previously (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8386-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'previously', JSON_ARRAY('previously'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8386-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8386-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '____ people believed the earth was flat.',
       JSON_ARRAY(),
       'previously',
       'adv. 先, 先前, 以前, 前, (非正式)过早, 过急, 在前, 在...以前, 在先 [计] 先前地 ｜ 原句：Previously people believed the earth was flat.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pride (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8387-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'pride', JSON_ARRAY('pride', 'prides'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8387-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8387-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Hey, I may have no money, but I still have my ____.',
       JSON_ARRAY(),
       'pride',
       'n. 骄傲, 自尊心, 自豪, 精华, 勇气 vt. 以...自豪 ｜ 原句：Hey, I may have no money, but I still have my pride.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · priest (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8388-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'priest', JSON_ARRAY('priest', 'priests'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8388-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8388-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'God is our salvation, said the ____.',
       JSON_ARRAY(),
       'priest',
       'n. 祭司, 牧师, 神父, 神质人员, 僧侣, 泰斗 ｜ 原句：God is our salvation, said the priest.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · primarily (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8389-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'primarily', JSON_ARRAY('primarily'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8389-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8389-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'If economic globalization is inevitable, it should ____ serve humanity rather than the interests of trans-national corporations.',
       JSON_ARRAY(),
       'primarily',
       'adv. 主要地, 首先地 ｜ 原句：If economic globalization is inevitable, it should primarily serve humanity rather than the interests of trans-national corporations.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · primary (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8390-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'primary', JSON_ARRAY('primary', 'primaries'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8390-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8390-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'This problem is too difficult for ____ school children to solve.',
       JSON_ARRAY(),
       'primary',
       'n. 最主要者, 原色 a. 主要的, 初期的, 根本的, 原始的, 首要的, 基本的 [计] 初等量; 主要的; 一次的 ｜ 原句：This problem is too difficult for primary school children to solve.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · prime (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8391-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'prime', JSON_ARRAY('prime', 'primes'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8391-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8391-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '____ numbers are like life; they are completely logical, but impossible to find the rules for, even if you spend all your time thinking about it.',
       JSON_ARRAY(),
       'prime',
       'n. 最佳部分, 初期, 全盛期 a. 主要的, 最初的, 根本的 v. 加油启动, 灌注, 填装 ｜ 原句：Prime numbers are like life; they are completely logical, but impossible to find the rules for, even if you spend all your time thinking about it.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · primitive (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8392-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'primitive', JSON_ARRAY('primitive', 'primitives'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8392-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8392-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Magic plays an important part in ____ society.',
       JSON_ARRAY(),
       'primitive',
       'n. 原始人, 早期艺术家 a. 原始的, 上古的 [计] 图元; 原语; 基元 ｜ 原句：Magic plays an important part in primitive society.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · prince (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8393-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'prince', JSON_ARRAY('prince', 'princes'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8393-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8393-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The ____ fell in love with a woodcutter''s daughter.',
       JSON_ARRAY(),
       'prince',
       'n. 王子, 亲王, 国君, 贵族, 诸侯, 有权势的大人物 ｜ 原句：The prince fell in love with a woodcutter''s daughter.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · princess (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8394-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'princess', JSON_ARRAY('princess', 'princesses'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8394-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8394-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Your sister looks as noble as if she were a ____.',
       JSON_ARRAY(),
       'princess',
       'n. 公主, 王妃, 女巨头 ｜ 原句：Your sister looks as noble as if she were a princess.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · principal (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8395-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'principal', JSON_ARRAY('principal', 'principals'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8395-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8395-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The ____ severely reproved the students whenever they made a mess in the hallway.',
       JSON_ARRAY(),
       'principal',
       'n. 校长, 首长, 本金, 主犯, 资本, 委托人 a. 主要的, 最重要的, 首要的 ｜ 原句：The principal severely reproved the students whenever they made a mess in the hallway.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · principle (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8396-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'principle', JSON_ARRAY('principle', 'principles'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8396-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8396-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'It is a matter of ____ with him to answer your questions honestly.',
       JSON_ARRAY(),
       'principle',
       'n. 原则, 原理, 主义 [化] 原理 ｜ 原句：It is a matter of principle with him to answer your questions honestly.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · print (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8397-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'print', JSON_ARRAY('print', 'prints'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8397-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8397-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'It will be able to edit the pictures you don''t like, then ____ them out.',
       JSON_ARRAY(),
       'print',
       'n. 打印, 版, 印刷物, 痕迹, 印刷业, 印刷字体, 图片, 印花布, 印章 v. 打印, 印刷, 铭记, 留印记于, 用印刷体写 [计] DOS外部命令:在打印机上打印文件, 可一边打印文件一边执行其他工作 ｜ 原句：It will be able to edit the pictures you don''t like, then print them out.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · prior (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8398-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'prior', JSON_ARRAY('prior', 'priorer', 'priorest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8398-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8398-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'You do not need any ____ knowledge of the subject.',
       JSON_ARRAY(),
       'prior',
       'a. 更重要的, 较早的, 在先的 n. 小隐修院院长, 大隐修院副院长 ｜ 原句：You do not need any prior knowledge of the subject.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · priority (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8399-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'priority', JSON_ARRAY('priority'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8399-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8399-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The club’s ____ is to win the League.',
       JSON_ARRAY(),
       'priority',
       'n. 优先权, 优先 [计] 优先级 ｜ 原句：The club’s priority is to win the League.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · prison (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8400-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'prison', JSON_ARRAY('prison', 'prisons'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8400-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8400-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Life in ____ is worse than the life of an animal.',
       JSON_ARRAY(),
       'prison',
       'n. 监狱, 监禁, 拘留所 vt. 监禁 ｜ 原句：Life in prison is worse than the life of an animal.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · prisoner (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8401-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'prisoner', JSON_ARRAY('prisoner', 'prisoners'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8401-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8401-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The king ordered that the ____ should be set free.',
       JSON_ARRAY(),
       'prisoner',
       'n. 囚犯, 犯人, 战俘 [法] 犯人, 囚犯, 扣押犯 ｜ 原句：The king ordered that the prisoner should be set free.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · private (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8402-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'private', JSON_ARRAY('private'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8402-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8402-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I would prefer to speak to you in ____.',
       JSON_ARRAY(),
       'private',
       'a. 私人的, 秘密的, 私立的, 隐蔽的 n. 士兵, 隐士, 阴部 [计] 私人的 ｜ 原句：I would prefer to speak to you in private.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · privilege (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8403-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'privilege', JSON_ARRAY('privilege', 'privileges'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8403-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8403-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'We were granted the ____ of fishing in this bay.',
       JSON_ARRAY(),
       'privilege',
       'n. 特权, 特别恩典, 基本权利, 特免 vt. 给与...特权, 特免 ｜ 原句：We were granted the privilege of fishing in this bay.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · prize (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8404-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'prize', JSON_ARRAY('prize', 'prizes', 'prises'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8404-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8404-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'You deserve the ____.',
       JSON_ARRAY(),
       'prize',
       'n. 奖赏, 奖金, 奖品, 战利品, 捕获 a. 得奖的 vt. 珍视, 估价, 捕获, 撬, 撬动 ｜ 原句：You deserve the prize.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · probability (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8405-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'probability', JSON_ARRAY('probability'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8405-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8405-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Tomorrow there''s a high ____ it will rain.',
       JSON_ARRAY(),
       'probability',
       'n. 可能性, 或然率, 几率, 概率 [化] 概率; 几率 ｜ 原句：Tomorrow there''s a high probability it will rain.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · probable (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8406-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'probable', JSON_ARRAY('probable'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8406-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8406-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'It is highly ____ that the deletion of element C will still yield the same result.',
       JSON_ARRAY(),
       'probable',
       'a. 很可能的, 大概的, 可信的 n. 很有希望的候选人, 很可能的事情 ｜ 原句：It is highly probable that the deletion of element C will still yield the same result.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · probably (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8407-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'probably', JSON_ARRAY('probably'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8407-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8407-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'You can ____ guess what happens though.',
       JSON_ARRAY(),
       'probably',
       'adv. 大概, 或许 ｜ 原句：You can probably guess what happens though.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · procedure (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8408-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'procedure', JSON_ARRAY('procedure', 'procedures'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8408-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8408-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'You don''t understand the ____.',
       JSON_ARRAY(),
       'procedure',
       'n. 程序, 过程, 手续 [计] 规程; 过程 ｜ 原句：You don''t understand the procedure.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · proceed (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8409-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'proceed', JSON_ARRAY('proceed', 'proceeds', 'proceeded', 'proceeding'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8409-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8409-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Let''s ____ with the items on the agenda.',
       JSON_ARRAY(),
       'proceed',
       'vi. 继续进行, 进行, 开始, 发出, 起诉 [法] 所得, 收入, 收益 ｜ 原句：Let''s proceed with the items on the agenda.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · process (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8410-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'process', JSON_ARRAY('process', 'processes'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8410-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8410-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I explained the ____ to him.',
       JSON_ARRAY(),
       'process',
       'n. 程序, 进行, 过程 vt. 加工, 使...接受处理, 对...处置, 对...起诉 a. 经加工的, 有特殊光效的 [计] 进程 ｜ 原句：I explained the process to him.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · procession (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8411-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'procession', JSON_ARRAY('procession', 'processions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8411-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8411-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'They marched in ____ to the Capitol building.',
       JSON_ARRAY(),
       'procession',
       'n. 队伍, 连续, 列队行进, 涌出 ｜ 原句：They marched in procession to the Capitol building.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · produce (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8413-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'produce', JSON_ARRAY('produce', 'produces'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8413-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8413-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Any universe simple enough to be understood is too simple to ____ a mind able to understand it.',
       JSON_ARRAY(),
       'produce',
       'n. 生产品, 物产, 后代 vt. 产生, 生产, 提出, 出示 vi. 生产, 制造 ｜ 原句：Any universe simple enough to be understood is too simple to produce a mind able to understand it.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · product (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8414-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'product', JSON_ARRAY('product', 'products'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8414-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8414-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'My uncle''s company launched a new ____ last month.',
       JSON_ARRAY(),
       'product',
       'n. 产品, 结果, 乘积 [化] 生产物 ｜ 原句：My uncle''s company launched a new product last month.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · production (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8415-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'production', JSON_ARRAY('production', 'productions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8415-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8415-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Steel ____ will increase 2% this month from last month.',
       JSON_ARRAY(),
       'production',
       'n. 制造, 生产, 产物 [医] 产生, 生成 ｜ 原句：Steel production will increase 2% this month from last month.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · productive (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8416-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'productive', JSON_ARRAY('productive'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8416-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8416-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'This factory''s ____ capacity is 250 cars a week.',
       JSON_ARRAY(),
       'productive',
       'a. 能生产的, 有生产价值的, 多产的 [医] 产出性的, 产生性的 ｜ 原句：This factory''s productive capacity is 250 cars a week.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · profession (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8417-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'profession', JSON_ARRAY('profession', 'professions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8417-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8417-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Teaching is a ____ of my own choosing.',
       JSON_ARRAY(),
       'profession',
       'n. 职业, 表白, 声明 [化] 工种; 职业 ｜ 原句：Teaching is a profession of my own choosing.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · professional (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8418-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'professional', JSON_ARRAY('professional', 'professionals'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8418-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8418-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The point we must clarify here is that the lines between amateur and ____ in sport are beginning to disappear.',
       JSON_ARRAY(),
       'professional',
       'n. 专业人才 a. 专业的, 职业的 ｜ 原句：The point we must clarify here is that the lines between amateur and professional in sport are beginning to disappear.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · professor (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8419-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'professor', JSON_ARRAY('professor', 'professors'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8419-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8419-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The ____ scolded John for skipping class.',
       JSON_ARRAY(),
       'professor',
       'n. 教授 ｜ 原句：The professor scolded John for skipping class.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · profit (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8420-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'profit', JSON_ARRAY('profit', 'profits'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8420-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8420-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Peter was an altruistic video game player; he would give items to people who needed them, rather than selling them for personal ____.',
       JSON_ARRAY(),
       'profit',
       'n. 利润, 赢利, 利益 vi. 有益, 获利, 赚钱 vt. 有益于 ｜ 原句：Peter was an altruistic video game player; he would give items to people who needed them, rather than selling them for personal profit.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · profitable (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8421-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'profitable', JSON_ARRAY('profitable'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8421-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8421-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'We''ll be ____ this year.',
       JSON_ARRAY(),
       'profitable',
       'a. 有利润的, 有利益的, 赚钱的 [经] 有利(可图)的, 合算的 ｜ 原句：We''ll be profitable this year.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · program (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8422-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'program', JSON_ARRAY('program', 'programs'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8422-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8422-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'If you do not have this ____, you can download it now.',
       JSON_ARRAY(),
       'program',
       'n. 节目, 节目单, 程序, 纲要, 大纲, 计划 vt. 规划, 拟...计划 vi. 安排节目, 编程序 [计] 程序 ｜ 原句：If you do not have this program, you can download it now.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · progress (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8423-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'progress', JSON_ARRAY('progress', 'progresses'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8423-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8423-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'In recent years, science has made remarkable ____.',
       JSON_ARRAY(),
       'progress',
       'n. 进步, 发展, 前进 vi. 进步, 进行 ｜ 原句：In recent years, science has made remarkable progress.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · progressive (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8424-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'progressive', JSON_ARRAY('progressive', 'progressives'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8424-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8424-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The grammatical form employed here is the present ____.',
       JSON_ARRAY(),
       'progressive',
       'n. 改革论者, 进步论者 a. 前进的, 累进的, 进步的 ｜ 原句：The grammatical form employed here is the present progressive.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · prohibit (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8425-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'prohibit', JSON_ARRAY('prohibit', 'prohibited', 'prohibits'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8425-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8425-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Smoking is strictly ____ inside the factory.',
       JSON_ARRAY(),
       'prohibited',
       'vt. 禁止, 阻止 [经] 禁止 ｜ 原句：Smoking is strictly prohibited inside the factory.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · project (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8426-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'project', JSON_ARRAY('project', 'projects'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8426-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8426-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I am proud to be a part of this ____.',
       JSON_ARRAY(),
       'project',
       'n. 计划, 设计, 事业 vt. 计划, 设计, 投掷, 发射, 使凸出, 放映 vi. 凸出 ｜ 原句：I am proud to be a part of this project.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · prominent (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8427-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'prominent', JSON_ARRAY('prominent'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8427-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8427-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'a ____ Russian scientist',
       JSON_ARRAY(),
       'prominent',
       'a. 卓越的, 显著的, 突出的, 凸出的 ｜ 原句：a prominent Russian scientist',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · promise (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8428-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'promise', JSON_ARRAY('promise', 'promises'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8428-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8428-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The boy is full of ____.',
       JSON_ARRAY(),
       'promise',
       'n. 诺言, 约定的事情, 有指望 vt. 允诺, 约定, 预示 vi. 允诺, 有前途, 有指望 ｜ 原句：The boy is full of promise.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · promising (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8429-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'promising', JSON_ARRAY('promising'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8429-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8429-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He is a ____ young man.',
       JSON_ARRAY(),
       'promising',
       'a. 有希望的, 前途有望的 [经] 有希望的 ｜ 原句：He is a promising young man.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · promote (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8430-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'promote', JSON_ARRAY('promote', 'promotes', 'promoted', 'promoting'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8430-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8430-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'They implemented a communication policy so as to ____ their new concept.',
       JSON_ARRAY(),
       'promote',
       'vt. 促进, 晋升, 创办, 推销 [经] 促进, 推广, 推销 ｜ 原句：They implemented a communication policy so as to promote their new concept.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · prompt (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8431-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'prompt', JSON_ARRAY('prompt', 'prompts'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8431-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8431-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He pressed me for a ____ reply.',
       JSON_ARRAY(),
       'prompt',
       'n. 激励, 提示, 提醒物, 提词, 付款期限 a. 迅速的, 敏捷的, 立刻的, 提词员的 vt. 激励, 鼓动, 提示 adv. 准时地 [计] 提示符; DOS内部命令:设定DOS命令行的提示符 ｜ 原句：He pressed me for a prompt reply.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pronoun (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8432-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'pronoun', JSON_ARRAY('pronoun', 'pronouns'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8432-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8432-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Now if we could only figure out the ____ problem.',
       JSON_ARRAY(),
       'pronoun',
       'n. 代词 ｜ 原句：Now if we could only figure out the pronoun problem.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pronounce (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8433-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'pronounce', JSON_ARRAY('pronounce', 'pronounces', 'pronounced', 'pronouncing'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8433-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8433-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I''m not sure how to ____ the word.',
       JSON_ARRAY(),
       'pronounce',
       'v. 发音, 宣告, 断言 ｜ 原句：I''m not sure how to pronounce the word.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pronunciation (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8434-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'pronunciation', JSON_ARRAY('pronunciation', 'pronunciations'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8434-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8434-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Please correct my ____.',
       JSON_ARRAY(),
       'pronunciation',
       'n. 发音, 读法 ｜ 原句：Please correct my pronunciation.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · proof (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8435-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'proof', JSON_ARRAY('proof', 'proofs'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8435-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8435-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'It''s so obvious we don''t need ____.',
       JSON_ARRAY(),
       'proof',
       'n. 证据, 证明, 试验, 检验, 考验 a. 不能透入的, 证明用的, 防...的, 耐...的 vt. 检验, 试验, 校对, 使不被穿透 [计] 审稿 ｜ 原句：It''s so obvious we don''t need proof.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · proper (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8436-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'proper', JSON_ARRAY('proper', 'properer', 'properest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8436-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8436-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Bicycles wear out, of course, but with ____ care they may be made to last a long time.',
       JSON_ARRAY(),
       'proper',
       'a. 适当的, 固有的, 高尚的, 专属的 adv. 完全地, 彻底地 ｜ 原句：Bicycles wear out, of course, but with proper care they may be made to last a long time.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · properly (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8437-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'properly', JSON_ARRAY('properly'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8437-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8437-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Musical talent can be developed if it''s ____ trained.',
       JSON_ARRAY(),
       'properly',
       'adv. 适当地, 相当地 ｜ 原句：Musical talent can be developed if it''s properly trained.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · property (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8438-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'property', JSON_ARRAY('property', 'properties'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8438-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8438-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I entrusted my ____ to him.',
       JSON_ARRAY(),
       'property',
       'n. 财产, 所有权, 性质, 属性 [计] 属性 ｜ 原句：I entrusted my property to him.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · proportion (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8439-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'proportion', JSON_ARRAY('proportion', 'proportions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8439-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8439-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Men''s wants become greater in ____ to the increase in their income.',
       JSON_ARRAY(),
       'proportion',
       'n. 比例, 比率, 均衡, 部分, 面积 vt. 使成比例, 使均衡 ｜ 原句：Men''s wants become greater in proportion to the increase in their income.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · proportional (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8440-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'proportional', JSON_ARRAY('proportional'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8440-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8440-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The number of muffins that you''ll receive will be inversely ____ to the number of times you talk on IRC.',
       JSON_ARRAY(),
       'proportional',
       'a. 比例的, 相称的 n. 比例项 ｜ 原句：The number of muffins that you''ll receive will be inversely proportional to the number of times you talk on IRC.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · proposal (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8441-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'proposal', JSON_ARRAY('proposal', 'proposals'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8441-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8441-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Your ____ is a bit extreme.',
       JSON_ARRAY(),
       'proposal',
       'n. 提议, 计划, 求婚 [经] 提案, 申请, 投标 ｜ 原句：Your proposal is a bit extreme.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · propose (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8442-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'propose', JSON_ARRAY('propose', 'proposes', 'proposed', 'proposing'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8442-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8442-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The young man decided to ____ to her.',
       JSON_ARRAY(),
       'propose',
       'vt. 计划, 打算, 建议, 提议, 求(婚) vi. 打算, 求婚 ｜ 原句：The young man decided to propose to her.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · prospect (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8443-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'prospect', JSON_ARRAY('prospect', 'prospects'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8443-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8443-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The ____ of marriage terrified Alice.',
       JSON_ARRAY(),
       'prospect',
       'n. 景色, 展望 vt. 勘探, 勘察 vi. 勘探, 有前途 ｜ 原句：The prospect of marriage terrified Alice.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · prosperous (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8444-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'prosperous', JSON_ARRAY('prosperous'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8444-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8444-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Shanghai is so ____; notably it was after the port was opened for trade one hundred and sixty years ago that things started to change.',
       JSON_ARRAY(),
       'prosperous',
       'a. 成功的, 繁盛的, 幸运的 [经] 繁荣的, 昌盛的 ｜ 原句：Shanghai is so prosperous; notably it was after the port was opened for trade one hundred and sixty years ago that things started to change.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · protect (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8445-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'protect', JSON_ARRAY('protect', 'protects', 'protected', 'protecting'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8445-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8445-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'You have to ____ your family.',
       JSON_ARRAY(),
       'protect',
       'vt. 防卫, 保护, 警戒 [法] 庇护, 保护, 警戒 ｜ 原句：You have to protect your family.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · protection (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8446-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'protection', JSON_ARRAY('protection', 'protections'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8446-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8446-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Which is more important, economic development or environmental ____?',
       JSON_ARRAY(),
       'protection',
       'n. 保护, 防卫, 贸易保护制度 [计] 保护 ｜ 原句：Which is more important, economic development or environmental protection?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · protein (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8448-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'protein', JSON_ARRAY('protein', 'proteins'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8448-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8448-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Where do you get your ____?',
       JSON_ARRAY(),
       'protein',
       'n. 蛋白质 a. 蛋白质的 ｜ 原句：Where do you get your protein?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · protest (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8449-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'protest', JSON_ARRAY('protest', 'protests'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8449-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8449-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Their small ____ triggered a mass demonstration.',
       JSON_ARRAY(),
       'protest',
       'n. 抗议, 反对, 抗议书, 断言 v. 反对, 抗议, 断言 ｜ 原句：Their small protest triggered a mass demonstration.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · proud (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8450-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'proud', JSON_ARRAY('proud', 'prouder', 'proudest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8450-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8450-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I am ____ to be a part of this project.',
       JSON_ARRAY(),
       'proud',
       'a. 骄傲的, 自大的, 自豪的, 辉煌的, 壮丽的 ｜ 原句：I am proud to be a part of this project.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · prove (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8451-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'prove', JSON_ARRAY('prove', 'proves', 'proved', 'proving'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8451-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8451-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'When you''re trying to ____ something, it helps to know it''s true.',
       JSON_ARRAY(),
       'prove',
       'vt. 证明, 查验, 检验, 勘探, 显示 vi. 证明是 ｜ 原句：When you''re trying to prove something, it helps to know it''s true.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · provide (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8452-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'provide', JSON_ARRAY('provide', 'provides', 'provided', 'providing'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8452-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8452-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Cows ____ us with milk.',
       JSON_ARRAY(),
       'provide',
       'vt. 提供, 供应, 规定, 预备 vi. 作准备, 抚养, 规定 ｜ 原句：Cows provide us with milk.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · province (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8454-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'province', JSON_ARRAY('province', 'provinces'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8454-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8454-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The panda is indigenous to Sichuan ____ and does not live in the wild in any other places.',
       JSON_ARRAY(),
       'province',
       'n. 省, 地方, 职权, 领域 [法] 省, 地方, 领域 ｜ 原句：The panda is indigenous to Sichuan Province and does not live in the wild in any other places.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · provision (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8455-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'provision', JSON_ARRAY('provision', 'provisions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8455-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8455-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He made ____ for his wife and his children in his will.',
       JSON_ARRAY(),
       'provisions',
       'n. (政府提供的)钱和设备, 准备, 供应品, 规定, 条款 vt. 供给...食物及必需品 ｜ 原句：He made provisions for his wife and his children in his will.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · psychological (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8456-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'psychological', JSON_ARRAY('psychological'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8456-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8456-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Those selected will have to face extensive medical and ____ tests.',
       JSON_ARRAY(),
       'psychological',
       'a. 心理学的, 精神上的, 心灵的 [法] 心理上的, 心理学的 ｜ 原句：Those selected will have to face extensive medical and psychological tests.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · public (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8457-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'public', JSON_ARRAY('public', 'publics'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8457-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8457-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'You will soon get used to speaking in ____.',
       JSON_ARRAY(),
       'public',
       'n. 公众, 民众 a. 公众的, 公共的, 公立的, 公用的 ｜ 原句：You will soon get used to speaking in public.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · publication (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8458-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'publication', JSON_ARRAY('publication', 'publications'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8458-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8458-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '____ of the article was timed to coincide with the professor''s birthday.',
       JSON_ARRAY(),
       'publication',
       'n. 出版物, 出版, 公布 [经] 发布 ｜ 原句：Publication of the article was timed to coincide with the professor''s birthday.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · publish (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8459-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'publish', JSON_ARRAY('publish', 'publishes', 'published', 'publishing'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8459-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8459-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He has written a book, however, he has no money to ____ it.',
       JSON_ARRAY(),
       'publish',
       'vt. 出版, 发行, 公开, 发表, 宣传, 公布 vi. 出版, 发行 ｜ 原句：He has written a book, however, he has no money to publish it.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pudding (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8460-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'pudding', JSON_ARRAY('pudding', 'puddings'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8460-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8460-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Here''s your ____.',
       JSON_ARRAY(),
       'pudding',
       'n. 布丁 ｜ 原句：Here''s your pudding.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pulse (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8462-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'pulse', JSON_ARRAY('pulse', 'pulses'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8462-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8462-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The doctor felt my ____.',
       JSON_ARRAY(),
       'pulse',
       'n. 脉冲, 脉搏, 情绪, 意向, 拍子, 豆类 vi. 跳动, 脉跳 vt. 使跳动, 用脉冲调制 [计] 脉冲 ｜ 原句：The doctor felt my pulse.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pump (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8463-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'pump', JSON_ARRAY('pump', 'pumps'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8463-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8463-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'water/air/beer etc ____ (=for moving water, air etc)',
       JSON_ARRAY(),
       'pump',
       'n. 抽水机, 打气筒, 泵, 抽吸 vt. 用唧筒抽水, 打气, 盘问, 倾注, 使疲惫 vi. 抽水, 上下(或往复)运动 ｜ 原句：water/air/beer etc pump (=for moving water, air etc)',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · punctual (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8465-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'punctual', JSON_ARRAY('punctual'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8465-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8465-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I expect you to be ____.',
       JSON_ARRAY(),
       'punctual',
       'a. 准时的, 守时的, 点状的, 中肯的 [经] 准时的, 不误期的, 准时 ｜ 原句：I expect you to be punctual.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · punish (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8466-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'punish', JSON_ARRAY('punish', 'punishes', 'punished', 'punishing'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8466-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8466-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'In Singapore, one way to ____ a criminal is to whip him or her.',
       JSON_ARRAY(),
       'punish',
       'vt. 处罚, 惩罚, 严厉对待 vi. 惩罚 ｜ 原句：In Singapore, one way to punish a criminal is to whip him or her.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · punishment (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8467-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'punishment', JSON_ARRAY('punishment'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8467-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8467-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Many countries have abolished capital ____.',
       JSON_ARRAY(),
       'punishment',
       'n. 处罚, 刑罚, 惩罚 [法] 罚, 处罚, 刑罚 ｜ 原句：Many countries have abolished capital punishment.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · puppet (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8468-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'puppet', JSON_ARRAY('puppet', 'puppets'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8468-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8468-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The Foreign Minister was a ____.',
       JSON_ARRAY(),
       'puppet',
       'n. 傀儡, 木偶 [法] 木偶, 傀儡, 受他人操纵的人 ｜ 原句：The Foreign Minister was a puppet.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · purchase (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8469-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'purchase', JSON_ARRAY('purchase', 'purchases'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8469-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8469-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I would like to ____ some boots.',
       JSON_ARRAY(),
       'purchase',
       'n. 购买, 购买品, 紧握, 绞辘 vt. 购买, 赢得, 努力取得, 用滑轮起(锚等) ｜ 原句：I would like to purchase some boots.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pure (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8470-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'pure', JSON_ARRAY('pure'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8470-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8470-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Blessed are the ____ in heart.',
       JSON_ARRAY(),
       'pure',
       'a. 纯的, 纯净的, 纯洁的, 清白的, 完美的, 无瑕的, 抽象的 [医] 的, 纯净的 ｜ 原句：Blessed are the pure in heart.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · purely (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8471-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'purely', JSON_ARRAY('purely', 'purelier', 'pureliest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8471-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8471-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'To claim sex is binary requires ignoring intersex people, which is unscientific and ____ ideological.',
       JSON_ARRAY(),
       'purely',
       'adv. 纯粹地, 清白地, 贞洁地 ｜ 原句：To claim sex is binary requires ignoring intersex people, which is unscientific and purely ideological.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · purple (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8474-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'purple', JSON_ARRAY('purple', 'purples'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8474-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8474-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'His socks are ____.',
       JSON_ARRAY(),
       'purple',
       'n. 紫色, 帝位 a. 紫色的, 帝王的, 华而不实的 v. (使)成紫色 ｜ 原句：His socks are purple.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · purpose (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8475-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'purpose', JSON_ARRAY('purpose', 'purposes'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8475-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8475-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Many people drift through life without a ____.',
       JSON_ARRAY(),
       'purpose',
       'n. 目的, 意向, 决心, 用途, 效果, 论题 vt. 意欲, 企图, 计划 ｜ 原句：Many people drift through life without a purpose.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · purse (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8476-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'purse', JSON_ARRAY('purse', 'purses'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8476-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8476-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'It was not until I reached home that I missed my ____.',
       JSON_ARRAY(),
       'purse',
       'n. 钱包, 小钱袋, 金钱, 募捐款, 囊状物 v. 缩拢, 皱起 ｜ 原句：It was not until I reached home that I missed my purse.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pursue (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8477-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'pursue', JSON_ARRAY('pursue', 'pursues', 'pursued', 'pursuing'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8477-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8477-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Some people ____ only pleasure.',
       JSON_ARRAY(),
       'pursue',
       'vt. 追赶, 追踪, 追随, 追求, 实行, 继续, 从事 vi. 追赶, 继续 ｜ 原句：Some people pursue only pleasure.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · pursuit (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8478-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'pursuit', JSON_ARRAY('pursuit', 'pursuits'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8478-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8478-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'In fact, love is the only genuinely precious thing in life; it''s also the only thing worthy of ____.',
       JSON_ARRAY(),
       'pursuit',
       'n. 追踪, 追求, 追赶, 娱乐, 职业 [法] 追捕, 追求 ｜ 原句：In fact, love is the only genuinely precious thing in life; it''s also the only thing worthy of pursuit.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · puzzle (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8479-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'puzzle', JSON_ARRAY('puzzle', 'puzzles'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8479-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8479-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Have you worked the ____ out?',
       JSON_ARRAY(),
       'puzzle',
       'n. 难题, 迷惑 vt. 使困惑, 使为难 vi. 迷惑, 苦思 ｜ 原句：Have you worked the puzzle out?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · qualify (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8480-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'qualify', JSON_ARRAY('qualify', 'qualifies', 'qualified', 'qualifying'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8480-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8480-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Free school lunches are given to children who ____.',
       JSON_ARRAY(),
       'qualify',
       'vi. 取得资格, 有资格 vt. 使有资格, 使合格, 限定, 限制, 准予 ｜ 原句：Free school lunches are given to children who qualify.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · quality (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8481-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'quality', JSON_ARRAY('quality'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8481-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8481-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Air ____ has deteriorated these past few years.',
       JSON_ARRAY(),
       'quality',
       'n. 品质, 特性, 才能, 质量 a. 优质的 [计] 品质 ｜ 原句：Air quality has deteriorated these past few years.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · quantity (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8482-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'quantity', JSON_ARRAY('quantity'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8482-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8482-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'In general, consumers prefer ____ to quality.',
       JSON_ARRAY(),
       'quantity',
       'n. 量, 数量, 总量 [计] 数量; 量 ｜ 原句：In general, consumers prefer quantity to quality.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · quarrel (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8483-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'quarrel', JSON_ARRAY('quarrel', 'quarrels'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8483-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8483-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Our conversation always ends in a ____.',
       JSON_ARRAY(),
       'quarrel',
       'n. 吵架, 反目, 怨言, 方头凿 vi. 吵架, 争论, 挑剔 ｜ 原句：Our conversation always ends in a quarrel.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · quart (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8484-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'quart', JSON_ARRAY('quart', 'quarts'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8484-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8484-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I want a ____ of milk.',
       JSON_ARRAY(),
       'quart',
       'n. 夸脱 [医] 夸脱(四分之一加仑) ｜ 原句：I want a quart of milk.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · queen (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8486-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'queen', JSON_ARRAY('queen', 'queens'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8486-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8486-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '____ Elizabeth I passed away in 1603.',
       JSON_ARRAY(),
       'queen',
       'n. 王后, 女王 vt. 立为女王 vi. 做女王 ｜ 原句：Queen Elizabeth I passed away in 1603.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · queue (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8488-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'queue', JSON_ARRAY('queue', 'queues'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8488-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8488-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The ____ for buying tickets was unbelievably long.',
       JSON_ARRAY(),
       'queue',
       'n. 辫子, 一队人, 队列 vt. 使排队, 将...梳成辫子 vi. 排队 [计] 队列 ｜ 原句：The queue for buying tickets was unbelievably long.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · quicken (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8489-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'quicken', JSON_ARRAY('quicken', 'quickened', 'quickens'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8489-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8489-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Ray glanced at his watch and ____ his pace (= began to walk faster ).',
       JSON_ARRAY(),
       'quickened',
       'vt. 加快, 激发, 使有生气, 鼓舞, 使复活 vi. 加快, 变活跃, 进入胎动期 ｜ 原句：Ray glanced at his watch and quickened his pace (= began to walk faster ).',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · quilt (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8490-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'quilt', JSON_ARRAY('quilt', 'quilts'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8490-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8490-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'She folded the ____.',
       JSON_ARRAY(),
       'quilt',
       'n. 棉被 vt. 加软衬料后缝制, 东拼西凑地编 vi. 缝被子 ｜ 原句：She folded the quilt.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · quiz (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8492-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'quiz', JSON_ARRAY('quiz', 'quizes'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8492-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8492-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'We had a history ____ this morning.',
       JSON_ARRAY(),
       'quiz',
       'n. 考查, 课堂测验, 恶作剧, 智力测验 vt. 戏弄, 考查, 恶作剧 ｜ 原句：We had a history quiz this morning.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · quotation (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8493-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'quotation', JSON_ARRAY('quotation', 'quotations'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8493-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8493-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The following ____ is taken from a nineteenth century travel diary.',
       JSON_ARRAY(),
       'quotation',
       'n. 引用语, 语录, 牌价, 报价 [化] 报价 ｜ 原句：The following quotation is taken from a nineteenth century travel diary.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · quote (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8494-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'quote', JSON_ARRAY('quote', 'quotes'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8494-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8494-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Your Chinese is so good, you can ____ proverbs.',
       JSON_ARRAY(),
       'quote',
       'n. 引用 vt. 引述, 举证, 报(价) vi. 引用 ｜ 原句：Your Chinese is so good, you can quote proverbs.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · rabbit (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8495-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'rabbit', JSON_ARRAY('rabbit', 'rabbits'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8495-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8495-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'A ____ has long ears and a short tail.',
       JSON_ARRAY(),
       'rabbit',
       'n. 兔子 vi. 猎兔 vt. 让...见鬼去 ｜ 原句：A rabbit has long ears and a short tail.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · race (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8496-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'race', JSON_ARRAY('race', 'races'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8496-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8496-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I was exhausted after running the ____.',
       JSON_ARRAY(),
       'race',
       'n. 种族, 人种, 赛跑, 比赛, 急流, 人类, 同道, 姜根 vi. 赛跑, 竞赛, 疾走 vt. 与...赛跑, 使疾走, 使猛转 [计] 竞争; 追赶; 欧州高级通信研究开发计划 ｜ 原句：I was exhausted after running the race.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · racial (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8497-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'racial', JSON_ARRAY('racial'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8497-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8497-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Garvey speaks up for ____ pride.',
       JSON_ARRAY(),
       'racial',
       'a. 人种的, 种族的 [医] 种族的 ｜ 原句：Garvey speaks up for racial pride.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · racket (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8499-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'racket', JSON_ARRAY('racket', 'rackets'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8499-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8499-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'You have the same ____ as I have.',
       JSON_ARRAY(),
       'racket',
       'n. 球拍, 喧闹, 杂乱无章 vi. 喧闹 vt. 用球拍打 ｜ 原句：You have the same racket as I have.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · radar (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8500-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'radar', JSON_ARRAY('radar', 'radars'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8500-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8500-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The ship is not equipped with ____.',
       JSON_ARRAY(),
       'radar',
       'n. 雷达, 无线电探测器 [计] 雷达图 ｜ 原句：The ship is not equipped with radar.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · radiation (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8502-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'radiation', JSON_ARRAY('radiation', 'radiations'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8502-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8502-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Yesterday my big brother went to Fukushima to help the locals. I''m very afraid of the rise in ____ levels.',
       JSON_ARRAY(),
       'radiation',
       'n. 辐射 [化] 放射 ｜ 原句：Yesterday my big brother went to Fukushima to help the locals. I''m very afraid of the rise in radiation levels.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · radioactive (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8504-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'radioactive', JSON_ARRAY('radioactive'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8504-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8504-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'the problem of how to dispose of ____ waste',
       JSON_ARRAY(),
       'radioactive',
       'a. 放射性的, 有放射能的 [医] 放射性的, 放射的 ｜ 原句：the problem of how to dispose of radioactive waste',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · radioactivity (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8505-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'radioactivity', JSON_ARRAY('radioactivity'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8505-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8505-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '''____'' is a chemistry term.',
       JSON_ARRAY(),
       'radioactivity',
       'n. 放射性 [化] 放射性 ｜ 原句：''Radioactivity'' is a chemistry term.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · radium (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8507-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'radium', JSON_ARRAY('radium', 'radiums'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8507-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8507-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'It was Marie Curie who discovered ____.',
       JSON_ARRAY(),
       'radium',
       'n. 镭 [化] 镭Ra ｜ 原句：It was Marie Curie who discovered radium.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · radius (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8508-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'radius', JSON_ARRAY('radius', 'radiuses'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8508-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8508-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Find the ____ of the incircle of the triangle.',
       JSON_ARRAY(),
       'radius',
       'n. 半径, 范围, 辐射光线 [电] 半径 ｜ 原句：Find the radius of the incircle of the triangle.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · rage (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8510-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'rage', JSON_ARRAY('rage', 'rages'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8510-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8510-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He is boiling with ____.',
       JSON_ARRAY(),
       'rage',
       'n. 愤怒, 情绪激动, 狂暴 vi. 大怒, 狂吹, 流行 ｜ 原句：He is boiling with rage.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · rail (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8512-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'rail', JSON_ARRAY('rail', 'rails'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8512-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8512-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The UK must improve the problems with its ____ network.',
       JSON_ARRAY(),
       'rail',
       'n. 横杆, 围栏, 栏杆, 铁轨, 扶手, 秧鸡 vt. 以横木围栏, 给...铺铁轨 vi. 责骂, 抱怨 ｜ 原句：The UK must improve the problems with its rail network.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · railroad (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8513-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'railroad', JSON_ARRAY('railroad', 'railroads'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8513-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8513-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Where is the ____ station?',
       JSON_ARRAY(),
       'railroad',
       'n. 铁路, 铁路公司 vt. 铺设铁路, 用铁路运输 vi. 在铁路工作 ｜ 原句：Where is the railroad station?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · rainbow (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8514-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'rainbow', JSON_ARRAY('rainbow', 'rainbows'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8514-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8514-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'How long is the ____ Bridge?',
       JSON_ARRAY(),
       'rainbow',
       'n. 彩虹 a. 五彩缤纷的 ｜ 原句：How long is the Rainbow Bridge?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · rainy (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8515-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'rainy', JSON_ARRAY('rainy', 'rainier', 'rainiest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8515-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8515-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Do you go to school by bus on ____ days?',
       JSON_ARRAY(),
       'rainy',
       'a. 下雨的, 多雨的 ｜ 原句：Do you go to school by bus on rainy days?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · range (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8517-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'range', JSON_ARRAY('range', 'ranges'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8517-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8517-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'We discussed a wide ____ of topics.',
       JSON_ARRAY(),
       'range',
       'n. 排, 行, 山脉, 范围, 行列, 射程 vt. 排列, 归类于, 使并列, 放牧 vi. 平行, 延伸, 漫游 [计] 量程; 范围; 域; 距离 ｜ 原句：We discussed a wide range of topics.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · rank (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8518-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'rank', JSON_ARRAY('rank', 'ranks'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8518-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8518-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He is immediately above me in ____.',
       JSON_ARRAY(),
       'rank',
       'n. 等级, 排, 横列, 队伍, 阶级 a. 茂密丛生的, 恶臭的, 十足的, 粗俗的 vt. 排列, 归类于, 把...分等 vi. 列为, 列队 n. 秩 [计] 秩 ｜ 原句：He is immediately above me in rank.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · rapid (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8519-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'rapid', JSON_ARRAY('rapid'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8519-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8519-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The doctor thought the patient''s pulse was rather ____.',
       JSON_ARRAY(),
       'rapid',
       'a. 迅速的, 飞快的, 急促的, 陡的 n. 急流 ｜ 原句：The doctor thought the patient''s pulse was rather rapid.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · rapidly (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8520-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'rapidly', JSON_ARRAY('rapidly'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8520-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8520-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'That market has been ____ expanding.',
       JSON_ARRAY(),
       'rapidly',
       'adv. 飞快地, 迅速地, 赶紧地 ｜ 原句：That market has been rapidly expanding.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · rare (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8521-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'rare', JSON_ARRAY('rare'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8521-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8521-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The importation of ____ wild animals to this country is strictly prohibited.',
       JSON_ARRAY(),
       'rare',
       'a. 稀罕的, 罕有的, 珍奇的, 稀薄的, 半熟的, 非常好的 adv. 非常 ｜ 原句：The importation of rare wild animals to this country is strictly prohibited.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · rarely (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8522-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'rarely', JSON_ARRAY('rarely', 'rarelier', 'rareliest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8522-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8522-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'English people ____ talk to strangers in the train.',
       JSON_ARRAY(),
       'rarely',
       'adv. 很少地, 罕有地 ｜ 原句：English people rarely talk to strangers in the train.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · rat (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8523-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'rat', JSON_ARRAY('rat', 'rats'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8523-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8523-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'A cornered ____ will bite a cat.',
       JSON_ARRAY(),
       'rat',
       'n. 鼠, 卑鄙的人, 破坏者, 变节者 vi. 捕鼠, 变节 vt. 弄蓬松 ｜ 原句：A cornered rat will bite a cat.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · rate (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8524-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'rate', JSON_ARRAY('rate', 'rates'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8524-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8524-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'At this ____, we''re not likely to be done before the end of the week.',
       JSON_ARRAY(),
       'rate',
       'n. 比率, 率, 速度, 价格, 费用, 等级 vt. 估价, 认为, 鉴定等级, 责骂 vi. 被评价, 责骂 ｜ 原句：At this rate, we''re not likely to be done before the end of the week.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · rather (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8525-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'rather', JSON_ARRAY('rather', 'ratherer', 'ratherest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8525-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8525-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'That is ____ unexpected.',
       JSON_ARRAY(),
       'rather',
       'adv. 宁可, 稍微, 相当 ｜ 原句：That is rather unexpected.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · ratio (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8526-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'ratio', JSON_ARRAY('ratio', 'ratios'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8526-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8526-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The application allows you to quickly calculate the ____ of body mass index - BMI.',
       JSON_ARRAY(),
       'ratio',
       'n. 比, 比率 [医] 比, 比率, 比例 ｜ 原句：The application allows you to quickly calculate the ratio of body mass index - BMI.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · rational (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8527-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'rational', JSON_ARRAY('rational'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8527-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8527-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'His argument is ____.',
       JSON_ARRAY(),
       'rational',
       'a. 理性的, 合理的 n. 有理数 ｜ 原句：His argument is rational.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · raw (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8528-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'raw', JSON_ARRAY('raw', 'raws'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8528-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8528-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Can you eat ____ oysters?',
       JSON_ARRAY(),
       'raw',
       'n. 擦伤处, 半成品 a. 生的, 未加工的, 生疏的, 不成熟的, 阴冷的, 刺痛的, 擦掉皮的 vt. 擦伤 [计] 写后读 ｜ 原句：Can you eat raw oysters?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · ray (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8529-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'ray', JSON_ARRAY('ray', 'rays'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8529-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8529-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '____ was willing to corroborate Gary''s story, but the police were still unconvinced that either of them were telling the truth.',
       JSON_ARRAY(),
       'ray',
       'n. 光线, 射线, 闪烁, 光辉 vi. 射出光线, 浮现, 放射光线 vt. 放射, 显出 ｜ 原句：Ray was willing to corroborate Gary''s story, but the police were still unconvinced that either of them were telling the truth.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · razor (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8530-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'razor', JSON_ARRAY('razor', 'razors'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8530-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8530-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The ____ made a buzzing sound.',
       JSON_ARRAY(),
       'razor',
       'n. 剃刀 vt. 剃 ｜ 原句：The razor made a buzzing sound.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · reach (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8531-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'reach', JSON_ARRAY('reach', 'reaches'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8531-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8531-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I tried to ____ you on the phone, but I was unable to get through.',
       JSON_ARRAY(),
       'reach',
       'n. 伸出, 延伸, 区域, 范围, 流域, 岬 vt. 到达, 达到, 伸出, 延伸, 影响 vi. 达到, 延伸, 伸出手, 传到 ｜ 原句：I tried to reach you on the phone, but I was unable to get through.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · react (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8532-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'react', JSON_ARRAY('react', 'reacts', 'reacted', 'reacting'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8532-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8532-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'If someone irritates you, it is best not to ____ immediately.',
       JSON_ARRAY(),
       'react',
       'vi. 起反应, 起作用, 反攻 [医] 应答, 发生反应 ｜ 原句：If someone irritates you, it is best not to react immediately.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · reaction (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8533-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'reaction', JSON_ARRAY('reaction', 'reactions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8533-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8533-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'What kind of ____ did you have when he came looking for you?',
       JSON_ARRAY(),
       'reaction',
       'n. 反应, 反作用, 反动 [医] 反应 ｜ 原句：What kind of reaction did you have when he came looking for you?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · readily (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8535-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'readily', JSON_ARRAY('readily'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8535-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8535-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'People will accept your idea much more ____ if you tell them Benjamin Franklin said it first.',
       JSON_ARRAY(),
       'readily',
       'adv. 迅速地, 轻易地, 乐意地 ｜ 原句：People will accept your idea much more readily if you tell them Benjamin Franklin said it first.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · reading (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8536-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'reading', JSON_ARRAY('reading', 'readings'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8536-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8536-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He spent the evening ____ a book.',
       JSON_ARRAY(),
       'reading',
       'n. 阅读, 知识, 读物 a. 阅读的 ｜ 原句：He spent the evening reading a book.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · real (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8537-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'real', JSON_ARRAY('real'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8537-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8537-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I''m not a ____ fish, I''m just a mere plushy.',
       JSON_ARRAY(),
       'real',
       'a. 真的, 真实的, 实际的, 实在的, 不动(产)的, 实数的 n. 实数, 现实 adv. 真正地 ｜ 原句：I''m not a real fish, I''m just a mere plushy.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · reality (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8538-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'reality', JSON_ARRAY('reality'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8538-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8538-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'John is brave in appearance, but is in ____ a coward.',
       JSON_ARRAY(),
       'reality',
       'n. 实在, 事实, 实体, 逼真 [法] 现实, 实在存在的事物, 实在性 ｜ 原句：John is brave in appearance, but is in reality a coward.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · realize (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8539-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'realize', JSON_ARRAY('realize', 'realizes', 'realized', 'realizing', 'realises', 'realised', 'realising'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8539-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8539-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Life begins when we ____ who we really are.',
       JSON_ARRAY(),
       'realize',
       'vt. 了解, 实现, 使显得逼真, 变卖 vi. 变卖 ｜ 原句：Life begins when we realize who we really are.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · reap (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8541-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'reap', JSON_ARRAY('reap', 'reaps', 'reaped', 'reaping'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8541-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8541-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'As a man sows, so he shall ____.',
       JSON_ARRAY(),
       'reap',
       'vt. 收割, 收获, 获得 vi. 收割, 得到报应 ｜ 原句：As a man sows, so he shall reap.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · rear (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8542-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'rear', JSON_ARRAY('rear', 'rears'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8542-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8542-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The ____ tire of my bicycle is flat.',
       JSON_ARRAY(),
       'rear',
       'n. 后面, 背后, 后方 a. 后面的, 背面的, 后方的 vt. 养育, 培养, 饲养, 举起, 树立, 栽种 vi. 高耸, 暴跳 ｜ 原句：The rear tire of my bicycle is flat.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · reasonable (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8543-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'reasonable', JSON_ARRAY('reasonable'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8543-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8543-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The price is not ____.',
       JSON_ARRAY(),
       'reasonable',
       'a. 合理的, 明理的, 适当的 [法] 合理的, 公道的, 正当的 ｜ 原句：The price is not reasonable.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · rebel (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8544-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'rebel', JSON_ARRAY('rebel', 'rebels'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8544-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8544-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Who doesn''t love a ____?',
       JSON_ARRAY(),
       'rebel',
       'n. 叛徒, 反叛者 vi. 造反, 反抗, 抵抗, 反感 a. 造反的, 反抗的 ｜ 原句：Who doesn''t love a rebel?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · rebellion (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8545-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'rebellion', JSON_ARRAY('rebellion', 'rebellions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8545-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8545-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The army quelled the ____.',
       JSON_ARRAY(),
       'rebellion',
       'n. 谋反, 叛乱, 反抗 [法] 造反, 反叛, 叛乱 ｜ 原句：The army quelled the rebellion.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · recall (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8546-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'recall', JSON_ARRAY('recall', 'recalls'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8546-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8546-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I ____ less and less of my childhood.',
       JSON_ARRAY(),
       'recall',
       'n. 回忆, 召回, 撤消 vt. 回想, 回忆, 召回, 撤消, 使恢复 [计] 检索 ｜ 原句：I recall less and less of my childhood.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · receiver (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8547-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'receiver', JSON_ARRAY('receiver', 'receivers'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8547-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8547-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I put the ____ to my ear.',
       JSON_ARRAY(),
       'receiver',
       'n. 接收器；接受者；收信机；收款员, 接待者 ｜ 原句：I put the receiver to my ear.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · recent (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8548-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'recent', JSON_ARRAY('recent'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8548-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8548-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Is it a ____ picture?',
       JSON_ARRAY(),
       'recent',
       'a. 最近的, 近代的, 最新的 [经] 最近的, 新进的 ｜ 原句：Is it a recent picture?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · recently (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8549-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'recently', JSON_ARRAY('recently'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8549-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8549-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I have not heard from her ____.',
       JSON_ARRAY(),
       'recently',
       'adv. 最近 ｜ 原句：I have not heard from her recently.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · reception (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8550-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'reception', JSON_ARRAY('reception', 'receptions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8550-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8550-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '____ in the cellar is very poor.',
       JSON_ARRAY(),
       'reception',
       'n. 接待, 接受, 招待会 [医] 接受, 感受 ｜ 原句：Reception in the cellar is very poor.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · recite (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8551-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'recite', JSON_ARRAY('recite', 'recites', 'recited', 'reciting'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8551-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8551-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'His daughter is able to ____ a lot of poems.',
       JSON_ARRAY(),
       'recite',
       'v. 背诵, 朗读, 叙述 ｜ 原句：His daughter is able to recite a lot of poems.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · recognition (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8552-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'recognition', JSON_ARRAY('recognition', 'recognitions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8552-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8552-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'She gave me a smile of ____.',
       JSON_ARRAY(),
       'recognition',
       'n. 赞誉, 认得, 识别, 承认, 认可, 认识 [电] 认识 ｜ 原句：She gave me a smile of recognition.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · recognize (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8553-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'recognize', JSON_ARRAY('recognize', 'recognizes', 'recognized', 'recognizing', 'recognises', 'recognised', 'recognising'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8553-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8553-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'You have changed so much that I can hardly ____ you.',
       JSON_ARRAY(),
       'recognize',
       'vt. 认出, 认可, 承认, 公认, 识别, 赏识 vi. 承认, 具结 ｜ 原句：You have changed so much that I can hardly recognize you.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · recommend (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8555-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'recommend', JSON_ARRAY('recommend', 'recommends', 'recommended', 'recommending'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8555-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8555-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Which do you ____?',
       JSON_ARRAY(),
       'recommend',
       'vt. 推荐, 介绍, 劝告, 使受欢迎, 托付 [经] 建议, 推荐 ｜ 原句：Which do you recommend?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · recommendation (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8556-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'recommendation', JSON_ARRAY('recommendation', 'recommendations'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8556-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8556-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'It was all thanks to his ____ that I was able to become a teacher at a college in Tokyo.',
       JSON_ARRAY(),
       'recommendation',
       'n. 推荐, 介绍, 推荐信, 劝告 [经] 建议书 ｜ 原句：It was all thanks to his recommendation that I was able to become a teacher at a college in Tokyo.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · record (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8557-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'record', JSON_ARRAY('record', 'records'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8557-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8557-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Stock prices plunged to a ____ low.',
       JSON_ARRAY(),
       'record',
       'n. 记录, 履历, 档案, 审判记录, 最高纪录, 唱片 vt. 记录, 记载, 标明, 将...录音 vi. 记录, 录音, 可被录音 a. 创纪录的 [计] 录制, 记录 ｜ 原句：Stock prices plunged to a record low.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · recorder (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8558-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'recorder', JSON_ARRAY('recorder', 'recorders'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8558-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8558-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Bob and Mary play the ____.',
       JSON_ARRAY(),
       'recorder',
       'n. 记录员, 录音机 n. 记录器 [计] 宏录制器, 记录器 ｜ 原句：Bob and Mary play the recorder.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · recover (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8559-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'recover', JSON_ARRAY('recover', 'recovers'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8559-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8559-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Business will ____ soon.',
       JSON_ARRAY(),
       'recover',
       'vt. 重新获得, 恢复, 复原, 拯救 vi. 痊愈, 复原, 胜诉 [计] 恢复 ｜ 原句：Business will recover soon.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · recovery (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8560-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'recovery', JSON_ARRAY('recovery', 'recoveries'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8560-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8560-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'You have to be patient about your ____.',
       JSON_ARRAY(),
       'recovery',
       'n. 恢复, 复原, 痊愈, 重获 [计] 恢复 ｜ 原句：You have to be patient about your recovery.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · recreation (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8561-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'recreation', JSON_ARRAY('recreation', 'recreations'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8561-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8561-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'People who cannot find time for ____ are obliged sooner or later to find time for illness.',
       JSON_ARRAY(),
       'recreation',
       'n. 娱乐, 消遣, 休息, 再创造 [医] 娱乐, 休养 ｜ 原句：People who cannot find time for recreation are obliged sooner or later to find time for illness.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · recruit (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8562-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'recruit', JSON_ARRAY('recruit', 'recruits'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8562-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8562-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The plan is to ____ 5 Java engineers before the end of next month.',
       JSON_ARRAY(),
       'recruit',
       'n. 新兵, 新手, 新会员, 补给品 vt. 恢复, 补充, 充实, 征募 vi. 征募新兵, 复原, 得到补充 ｜ 原句：The plan is to recruit 5 Java engineers before the end of next month.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · reduce (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8563-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'reduce', JSON_ARRAY('reduce', 'reduces', 'reduced', 'reducing'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8563-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8563-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'We must ____ energy demand.',
       JSON_ARRAY(),
       'reduce',
       'vt. 减少, 分解, 降低, 使衰退, 把...分解, 把...归纳 vi. 减少, 减肥, 缩小 [计] 缩小 ｜ 原句：We must reduce energy demand.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · reduction (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8564-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'reduction', JSON_ARRAY('reduction', 'reductions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8564-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8564-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'strategies for noise ____',
       JSON_ARRAY(),
       'reduction',
       'n. 减少, 缩影, 变化 [化] 还原 ｜ 原句：strategies for noise reduction',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · refer (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8567-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'refer', JSON_ARRAY('refer', 'refers'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8567-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8567-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '____ to the dictionary as often as possible.',
       JSON_ARRAY(),
       'refer',
       'vt. 提交, 归诸于, 把...提交, 使求助于 vi. 提到, 涉及, 查阅, 查询, 咨询 ｜ 原句：Refer to the dictionary as often as possible.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.17 · reference (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8568-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'reference', JSON_ARRAY('reference', 'references'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8568-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8568-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Anonymity or detailed ____ are both fine.',
       JSON_ARRAY(),
       'reference',
       'n. 参考, 索引, 参照 vt. 给...加上参考资料 vt. 引用 vi. 引用 [计] 引用 ｜ 原句：Anonymity or detailed reference are both fine.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);
