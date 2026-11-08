-- V1.0.15：词汇填空题自动生成（第 03 批，500 题）
-- 目标库：exercise_db
-- 来源：word_dictionary 例句挖空；生成脚本 scripts/generate-vocab-questions.mjs
-- 风险：低（纯 DML，NOT EXISTS 双重幂等：external_key + question_content）
-- 回滚：DELETE FROM question_info WHERE external_key LIKE 'vocab-auto-%';
--       DELETE FROM question_content WHERE question_id NOT IN (SELECT id FROM question_info);
-- 校验：stem 含 ___、analysis 无答案残留（生成时已断言）

-- V1.0.15 · education (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6898-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'education', JSON_ARRAY('education', 'educations'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6898-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6898-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '____ in this world disappoints me.',
       JSON_ARRAY(),
       'education',
       'n. 教育, 训练, 教育学 [医] 教育, 训练 ｜ 原句：Education in this world disappoints me.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · effect (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6899-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'effect', JSON_ARRAY('effect', 'effects'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6899-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6899-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Pollution has a disastrous ____ on the ecology of a region.',
       JSON_ARRAY(),
       'effect',
       'n. 结果, 影响, 效果, 印象 vt. 实行, 引起, 完成 [计] 效果 ｜ 原句：Pollution has a disastrous effect on the ecology of a region.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · effective (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6900-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'effective', JSON_ARRAY('effective'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6900-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6900-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The art of modern warfare does not necessarily require soldiers to be armed to the teeth to be ____ as combatants.',
       JSON_ARRAY(),
       'effective',
       'a. 有效的, 有力的, 实际的 n. 有生力量 ｜ 原句：The art of modern warfare does not necessarily require soldiers to be armed to the teeth to be effective as combatants.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · efficiency (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6901-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'efficiency', JSON_ARRAY('efficiency', 'efficiencies'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6901-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6901-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'We have optimized the database indexing, and as a result, system ____ has improved by 50%.',
       JSON_ARRAY(),
       'efficiency',
       'n. 效率, 效能, 功效 [医] 效率, 效力 ｜ 原句：We have optimized the database indexing, and as a result, system efficiency has improved by 50%.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · efficient (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6902-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'efficient', JSON_ARRAY('efficient'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6902-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6902-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'There is no denying that she is very ____.',
       JSON_ARRAY(),
       'efficient',
       'a. 有效率的, 能干的 ｜ 原句：There is no denying that she is very efficient.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · effort (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6903-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'effort', JSON_ARRAY('effort', 'efforts'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6903-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6903-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Nothing is achieved without ____.',
       JSON_ARRAY(),
       'effort',
       'n. 努力, 成就 ｜ 原句：Nothing is achieved without effort.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · elaborate (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6906-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'elaborate', JSON_ARRAY('elaborate'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6906-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6906-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'She made ____ preparations for the party.',
       JSON_ARRAY(),
       'elaborate',
       'a. 精细的, 详尽的, 精心计划(或制作)的 vt. 详细地说明, 用心地制作, 发挥 vi. 变复杂, 作详细说明 ｜ 原句：She made elaborate preparations for the party.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · elbow (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6908-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'elbow', JSON_ARRAY('elbow', 'elbows'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6908-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6908-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'My ____ still hurts.',
       JSON_ARRAY(),
       'elbow',
       'n. 手肘, 弯头, 扶手 v. 用手肘推开, 推挤 ｜ 原句：My elbow still hurts.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · elder (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6909-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'elder', JSON_ARRAY('elder', 'elders'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6909-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6909-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'John''s mother looks so young that she is often mistaken for his ____ sister.',
       JSON_ARRAY(),
       'elder',
       'n. 年长者, 老人, 前辈 a. 年长的, 资深的 ｜ 原句：John''s mother looks so young that she is often mistaken for his elder sister.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · elderly (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6910-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'elderly', JSON_ARRAY('elderly'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6910-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6910-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Keep these seats for the ____.',
       JSON_ARRAY(),
       'elderly',
       'a. 过了中年的, 稍老的 ｜ 原句：Keep these seats for the elderly.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · election (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6912-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'election', JSON_ARRAY('election', 'elections'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6912-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6912-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'American politics are interesting to watch, especially during a presidential ____.',
       JSON_ARRAY(),
       'election',
       'n. 选举, 当选, 选择权 [法] 选举, 当选 ｜ 原句：American politics are interesting to watch, especially during a presidential election.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · electric (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6913-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'electric', JSON_ARRAY('electric'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6913-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6913-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I should have tried out this ____ shaver before buying it.',
       JSON_ARRAY(),
       'electric',
       'a. 电的, 导电的, 电动的 [医] 电的 ｜ 原句：I should have tried out this electric shaver before buying it.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · electrical (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6914-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'electrical', JSON_ARRAY('electrical'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6914-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6914-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Tom is an ____ engineer.',
       JSON_ARRAY(),
       'electrical',
       'a. 电的, 有关电的 [医] 电的 ｜ 原句：Tom is an electrical engineer.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · electricity (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6915-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'electricity', JSON_ARRAY('electricity'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6915-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6915-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The machine generates a lot of ____.',
       JSON_ARRAY(),
       'electricity',
       'n. 电, 电流, 电学, 热情, 电力供应 [化] 电学; 电 ｜ 原句：The machine generates a lot of electricity.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · electron (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6916-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'electron', JSON_ARRAY('electron', 'electrons'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6916-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6916-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Most things are balanced - with equal numbers of ____ and protons.',
       JSON_ARRAY(),
       'electrons',
       'n. 电子 [化] 电子 ｜ 原句：Most things are balanced - with equal numbers of electrons and protons.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · electronic (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6917-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'electronic', JSON_ARRAY('electronic'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6917-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6917-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Clive wants to be an ____ engineer.',
       JSON_ARRAY(),
       'electronic',
       'a. 电子的 [计] 电子工业协会接口 ｜ 原句：Clive wants to be an electronic engineer.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · electronics (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6918-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'electronics', JSON_ARRAY('electronics'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6918-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6918-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'an ____ engineer',
       JSON_ARRAY(),
       'electronics',
       'n. 电子学 [计] 电子学 ｜ 原句：an electronics engineer',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · element (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6919-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'element', JSON_ARRAY('element'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6919-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6919-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'It is highly probable that the deletion of ____ C will still yield the same result.',
       JSON_ARRAY(),
       'element',
       'n. 元件, 元素, 要素 [计] 部分; 成分; 单元; 码元; 元件; 元素; 单元 ｜ 原句：It is highly probable that the deletion of element C will still yield the same result.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · elementary (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6920-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'elementary', JSON_ARRAY('elementary'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6920-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6920-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I went to ____ school in Nagoya.',
       JSON_ARRAY(),
       'elementary',
       'a. 初步的, 基本的 [医] 元素的, 基础的, 初级的 ｜ 原句：I went to elementary school in Nagoya.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · elephant (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6921-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'elephant', JSON_ARRAY('elephant', 'elephants'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6921-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6921-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Seen from a distance, the hill looks like an ____.',
       JSON_ARRAY(),
       'elephant',
       'n. 象 ｜ 原句：Seen from a distance, the hill looks like an elephant.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · elevator (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6922-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'elevator', JSON_ARRAY('elevator', 'elevators'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6922-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6922-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'After asking for my key at the front desk, I took the ____ to my floor.',
       JSON_ARRAY(),
       'elevator',
       'n. 电梯, 升降机 [化] 提升机 ｜ 原句：After asking for my key at the front desk, I took the elevator to my floor.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · eliminate (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6923-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'eliminate', JSON_ARRAY('eliminate', 'eliminates', 'eliminated', 'eliminating'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6923-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6923-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'If mankind doesn''t take care of the environment, the environment may ____ mankind.',
       JSON_ARRAY(),
       'eliminate',
       'vt. 除去, 排除, 剔除, 消除 ｜ 原句：If mankind doesn''t take care of the environment, the environment may eliminate mankind.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · elsewhere (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6925-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'elsewhere', JSON_ARRAY('elsewhere'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6925-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6925-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'She is becoming famous in Australia and ____.',
       JSON_ARRAY(),
       'elsewhere',
       'adv. 在别处 ｜ 原句：She is becoming famous in Australia and elsewhere.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · embarrass (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6926-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'embarrass', JSON_ARRAY('embarrass', 'embarrasses', 'embarrassed', 'embarrassing'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6926-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6926-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'You''ll ____ her.',
       JSON_ARRAY(),
       'embarrass',
       'vt. 使困窘, 使局促不安, 阻碍 ｜ 原句：You''ll embarrass her.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · embrace (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6927-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'embrace', JSON_ARRAY('embrace', 'embraces'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6927-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6927-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Why do women want to sleep in a man''s ____?',
       JSON_ARRAY(),
       'embrace',
       'n. 拥抱 vt. 拥抱, 互相拥抱, 包含, 收买 vi. 拥抱 ｜ 原句：Why do women want to sleep in a man''s embrace?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · emerge (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6928-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'emerge', JSON_ARRAY('emerge', 'emerges', 'emerged', 'emerging'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6928-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6928-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The flowers ____ in the spring.',
       JSON_ARRAY(),
       'emerge',
       'vi. 浮现, 形成, 出现, (事实)显露 ｜ 原句：The flowers emerge in the spring.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · emergency (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6929-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'emergency', JSON_ARRAY('emergency', 'emergencies'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6929-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6929-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'In case of ____, call 119.',
       JSON_ARRAY(),
       'emergency',
       'n. 紧急状况, 紧急事件, 紧急需要 [化] 紧急情况 ｜ 原句：In case of emergency, call 119.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · emit (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6930-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'emit', JSON_ARRAY('emit', 'emitted', 'emits'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6930-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6930-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The kettle ____ a shrill whistle.',
       JSON_ARRAY(),
       'emitted',
       'vt. 发出, 放射, 发表(意见等), 散发, 发行 [化] 放射 ｜ 原句：The kettle emitted a shrill whistle.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · emotion (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6931-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'emotion', JSON_ARRAY('emotion', 'emotions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6931-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6931-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Any ____, if it is sincere, is involuntary.',
       JSON_ARRAY(),
       'emotion',
       'n. 情绪, 激动, 强烈的情感 [医] 情绪, 情感 ｜ 原句：Any emotion, if it is sincere, is involuntary.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · emotional (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6932-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'emotional', JSON_ARRAY('emotional'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6932-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6932-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'It is not good for a scientist to get ____.',
       JSON_ARRAY(),
       'emotional',
       'a. 情绪的, 情感的 [医] 情绪的 ｜ 原句：It is not good for a scientist to get emotional.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · emperor (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6933-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'emperor', JSON_ARRAY('emperor', 'emperors'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6933-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6933-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The princess begged forgiveness from the ____.',
       JSON_ARRAY(),
       'emperor',
       'n. 皇帝, 君主 ｜ 原句：The princess begged forgiveness from the emperor.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · emphasis (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6934-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'emphasis', JSON_ARRAY('emphasis', 'emphasises'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6934-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6934-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'This point deserves special ____.',
       JSON_ARRAY(),
       'emphasis',
       'n. 强调, 加强, 重点, 强语气 ｜ 原句：This point deserves special emphasis.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · emphasize (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6935-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'emphasize', JSON_ARRAY('emphasize', 'emphasizes', 'emphasized', 'emphasizing', 'emphasises', 'emphasised', 'emphasising'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6935-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6935-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I want to ____ this point in particular.',
       JSON_ARRAY(),
       'emphasize',
       'vt. 强调, 加强语气, 着重 ｜ 原句：I want to emphasize this point in particular.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · empire (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6936-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'empire', JSON_ARRAY('empire', 'empires'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6936-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6936-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'They built their ____ in Peru about five hundred years ago.',
       JSON_ARRAY(),
       'empire',
       'n. 帝国, 帝权 ｜ 原句：They built their empire in Peru about five hundred years ago.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · employ (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6937-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'employ', JSON_ARRAY('employ', 'employs'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6937-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6937-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'His age didn''t enter into our decision not to ____ him.',
       JSON_ARRAY(),
       'employ',
       'n. 雇用 vt. 雇用, 使用, 使从事于 ｜ 原句：His age didn''t enter into our decision not to employ him.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · employee (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6938-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'employee', JSON_ARRAY('employee', 'employees'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6938-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6938-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Tom accused the ____ of stealing.',
       JSON_ARRAY(),
       'employee',
       'n. 职员, 员工, 受雇人员 [化] 职工; 雇员 ｜ 原句：Tom accused the employee of stealing.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · employer (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6939-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'employer', JSON_ARRAY('employer', 'employers'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6939-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6939-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The shoe factory is the largest ____ in this area.',
       JSON_ARRAY(),
       'employer',
       'n. 雇主, 老板 [经] 雇主, 业主 ｜ 原句：The shoe factory is the largest employer in this area.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · employment (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6940-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'employment', JSON_ARRAY('employment'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6940-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6940-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'They guaranteed regular ____ to their workers.',
       JSON_ARRAY(),
       'employment',
       'n. 雇用, 职业, 工作 [经] 职业, 雇用, 职工招请 ｜ 原句：They guaranteed regular employment to their workers.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · enable (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6941-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'enable', JSON_ARRAY('enable', 'enables', 'enabled', 'enabling'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6941-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6941-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Our on-line Customer Service Desk and trained support agents ____ problems to be quickly identified and addressed.',
       JSON_ARRAY(),
       'enable',
       'vt. 使能够 [计] 允许, 使能, 打开 ｜ 原句：Our on-line Customer Service Desk and trained support agents enable problems to be quickly identified and addressed.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · enclose (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6942-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'enclose', JSON_ARRAY('enclose', 'encloses', 'enclosed', 'enclosing'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6942-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6942-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Please ____ a cheque with your order.',
       JSON_ARRAY(),
       'enclose',
       'vt. 围绕, 圈起, 放入封套, 附上 ｜ 原句：Please enclose a cheque with your order.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · encounter (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6943-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'encounter', JSON_ARRAY('encounter', 'encounters'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6943-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6943-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'His ____ with her is enriching his inner life.',
       JSON_ARRAY(),
       'encounter',
       'n. 相会, 相遇, 遭遇 vt. 遇见, 邂逅, 会战 vi. 偶然相遇 ｜ 原句：His encounter with her is enriching his inner life.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · encourage (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6944-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'encourage', JSON_ARRAY('encourage', 'encourages', 'encouraged', 'encouraging'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6944-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6944-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'When I''m sad, my friends ____ me.',
       JSON_ARRAY(),
       'encourage',
       'vt. 鼓励, 支持, 激励 [法] 怂恿, 煽动, 助长 ｜ 原句：When I''m sad, my friends encourage me.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · ending (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6945-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'ending', JSON_ARRAY('ending', 'endings'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6945-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6945-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'People can begin to love when they choose, but they have no choice when it comes to ____ love.',
       JSON_ARRAY(),
       'ending',
       'n. 终止, 终了, 收场 [医] 末梢 ｜ 原句：People can begin to love when they choose, but they have no choice when it comes to ending love.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · endless (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6946-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'endless', JSON_ARRAY('endless'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6946-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6946-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The universe is ____.',
       JSON_ARRAY(),
       'endless',
       'a. 不停的, 无穷尽的, 无尽的 [机] 无端的, 环状的 ｜ 原句：The universe is endless.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · endure (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6947-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'endure', JSON_ARRAY('endure', 'endures', 'endured', 'enduring'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6947-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6947-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I cannot ____ being disturbed in my work.',
       JSON_ARRAY(),
       'endure',
       'vt. 忍受, 忍耐, 容忍, 耐 vi. (正式)持久, 持续 [计] 仍能工作, 继续工作 ｜ 原句：I cannot endure being disturbed in my work.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · enemy (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6948-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'enemy', JSON_ARRAY('enemy', 'enemies'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6948-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6948-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'We defeated the ____.',
       JSON_ARRAY(),
       'enemy',
       'n. 敌人, 仇敌, 敌军 a. 敌人的 ｜ 原句：We defeated the enemy.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · energy (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6949-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'energy', JSON_ARRAY('energy', 'energies'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6949-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6949-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'We are in the era of atomic ____.',
       JSON_ARRAY(),
       'energy',
       'n. 精力, 精神, 活力, 能量 [化] 能; 能量 ｜ 原句：We are in the era of atomic energy.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · enforce (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6950-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'enforce', JSON_ARRAY('enforce', 'enforced', 'enforces', 'enforcing'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6950-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6950-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Parking restrictions will be strictly ____.',
       JSON_ARRAY(),
       'enforced',
       'vt. 强迫, 执行, 坚持 [经] 予以强制执行 ｜ 原句：Parking restrictions will be strictly enforced.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · engage (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6951-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'engage', JSON_ARRAY('engage', 'engaged', 'engages', 'engaging'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6951-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6951-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I have never ____ in drug trafficking.',
       JSON_ARRAY(),
       'engaged',
       'vi. 答应, 从事, 交战 vt. 使忙碌, 雇佣, 预定, 使从事于, 使参加 ｜ 原句：I have never engaged in drug trafficking.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · engine (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6952-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'engine', JSON_ARRAY('engine', 'engines'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6952-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6952-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Tom started the ____.',
       JSON_ARRAY(),
       'engine',
       'n. 引擎, 发动机, 机车 vt. 安装发动机于 ｜ 原句：Tom started the engine.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · engineer (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6953-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'engineer', JSON_ARRAY('engineer', 'engineers'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6953-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6953-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Tom is an electrical ____.',
       JSON_ARRAY(),
       'engineer',
       'n. 工程师, 工兵 vt. 设计, 监造, 精明地处理, 策划 ｜ 原句：Tom is an electrical engineer.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · engineering (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6954-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'engineering', JSON_ARRAY('engineering', 'engineerings'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6954-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6954-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Should we use genetic ____ on people?',
       JSON_ARRAY(),
       'engineering',
       'n. 工程学, 工程, 操纵 [化] 机器; 机器学 ｜ 原句：Should we use genetic engineering on people?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · englishman (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6955-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'englishman', JSON_ARRAY('englishman', 'englishmans'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6955-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6955-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He was the only ____ present.',
       JSON_ARRAY(),
       'englishman',
       'n. 英国人 ｜ 原句：He was the only Englishman present.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · enhance (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6956-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'enhance', JSON_ARRAY('enhance', 'enhances', 'enhanced', 'enhancing'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6956-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6956-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Good lighting will ____ any room.',
       JSON_ARRAY(),
       'enhance',
       'vt. 提高, 加强, 增加 ｜ 原句：Good lighting will enhance any room.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · enlarge (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6957-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'enlarge', JSON_ARRAY('enlarge', 'enlarges', 'enlarged', 'enlarging'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6957-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6957-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He tried to ____ his sphere of influence.',
       JSON_ARRAY(),
       'enlarge',
       'vt. 扩大, 增大 vi. 扩大, 详述 ｜ 原句：He tried to enlarge his sphere of influence.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · enormous (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6958-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'enormous', JSON_ARRAY('enormous'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6958-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6958-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Compiling a dictionary demands an ____ amount of time.',
       JSON_ARRAY(),
       'enormous',
       'a. 巨大的, 庞大的 ｜ 原句：Compiling a dictionary demands an enormous amount of time.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · enroll (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6959-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'enroll', JSON_ARRAY('enroll', 'enrolls', 'enrolled', 'enrolling'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6959-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6959-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I want to ____ at graduate school.',
       JSON_ARRAY(),
       'enroll',
       'vt. 登记, 使加入 vi. 参军, 注册 ｜ 原句：I want to enroll at graduate school.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · ensure (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6960-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'ensure', JSON_ARRAY('ensure', 'ensures', 'ensured', 'ensuring'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6960-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6960-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'When watching TV, please ____ that the room is brightly lit and watch from a distance.',
       JSON_ARRAY(),
       'ensure',
       'vt. 确定, 保证, 担保, 保护 [经] 确保, 确定 ｜ 原句：When watching TV, please ensure that the room is brightly lit and watch from a distance.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · enter (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6961-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'enter', JSON_ARRAY('enter', 'enters'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6961-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6961-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Take off your hat when you ____ a classroom.',
       JSON_ARRAY(),
       'enter',
       'vt. 进入, 参加, 开始, 输入, 回车 vi. 进去, 参加 [计] 输入, 回车 ｜ 原句：Take off your hat when you enter a classroom.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · entertain (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6962-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'entertain', JSON_ARRAY('entertain', 'entertains', 'entertained', 'entertaining'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6962-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6962-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'A museum should aim to ____ as well as educate.',
       JSON_ARRAY(),
       'entertain',
       'vt. 娱乐, 招待, 怀抱 vi. 款待 ｜ 原句：A museum should aim to entertain as well as educate.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · entertainment (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6963-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'entertainment', JSON_ARRAY('entertainment'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6963-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6963-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Australians excel at sports and ____.',
       JSON_ARRAY(),
       'entertainment',
       'n. 娱乐, 款待, 娱乐表演 ｜ 原句：Australians excel at sports and entertainment.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · enthusiastic (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6964-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'enthusiastic', JSON_ARRAY('enthusiastic'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6964-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6964-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'This book is a result of his ____ research.',
       JSON_ARRAY(),
       'enthusiastic',
       'a. 狂热的, 热心的, 热烈的 ｜ 原句：This book is a result of his enthusiastic research.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · entire (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6965-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'entire', JSON_ARRAY('entire', 'entires'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6965-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6965-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Jane could not believe it when her date polished off an ____ chocolate cake.',
       JSON_ARRAY(),
       'entire',
       'n. 整个, 全部 a. 全体的, 完全的, 全部的 ｜ 原句：Jane could not believe it when her date polished off an entire chocolate cake.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · entitle (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6966-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'entitle', JSON_ARRAY('entitle', 'entitles', 'entitled', 'entitling'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6966-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6966-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'If the warranty is limited, the terms may ____ you to a replacement or refund.',
       JSON_ARRAY(),
       'entitle',
       'vt. 给...权利, 取名为, 给予名称, 叫做 [法] 给...权利, 使有资格, 称呼 ｜ 原句：If the warranty is limited, the terms may entitle you to a replacement or refund.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · entrance (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6967-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'entrance', JSON_ARRAY('entrance', 'entrances'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6967-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6967-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Please wait for me at the ____ of the building.',
       JSON_ARRAY(),
       'entrance',
       'n. 入口, 进入点, 入场, 入学, 进入, 开始(阶段), 就任 vt. 使出神, 使入迷 [计] 入口 ｜ 原句：Please wait for me at the entrance of the building.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · entry (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6968-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'entry', JSON_ARRAY('entry', 'entries'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6968-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6968-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '____ is strictly for staff only.',
       JSON_ARRAY(),
       'entry',
       'n. 登录, 条目, 进入, 入口, 报关 [计] 登录项, 输入项, 条目 ｜ 原句：Entry is strictly for staff only.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · envelope (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6969-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'envelope', JSON_ARRAY('envelope', 'envelopes'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6969-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6969-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Write your name and address on this ____.',
       JSON_ARRAY(),
       'envelope',
       'n. 信封, 封套, 封袋 [医] 膜, 包袋 ｜ 原句：Write your name and address on this envelope.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · environment (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6970-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'environment', JSON_ARRAY('environment'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6970-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6970-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'We ought to do our best not to pollute our ____.',
       JSON_ARRAY(),
       'environment',
       'n. 环境, 外界, 围绕 [计] 环境 ｜ 原句：We ought to do our best not to pollute our environment.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · envy (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6971-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'envy', JSON_ARRAY('envy', 'envies'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6971-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6971-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Your success excites my ____.',
       JSON_ARRAY(),
       'envy',
       'n. 羡慕, 嫉妒 vt. 羡慕, 嫉妒 ｜ 原句：Your success excites my envy.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · episode (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6972-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'episode', JSON_ARRAY('episode', 'episodes'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6972-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6972-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Seriously though, ____ 21 made me almost cry while laughing.',
       JSON_ARRAY(),
       'episode',
       'n. 插曲, 插话, 有趣的事件, 一段情节 [医] 插话, 插曲, 发作 ｜ 原句：Seriously though, episode 21 made me almost cry while laughing.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · equal (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6973-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'equal', JSON_ARRAY('equal', 'equals'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6973-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6973-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Cut the melon into six ____ pieces.',
       JSON_ARRAY(),
       'equal',
       'n. 对手, 匹敌, 同辈 a. 相等的, 平等的, 胜任的, 合适的, 平静的, 不相上下的 vt. 等于, 比得上 [计] 等长度编码 ｜ 原句：Cut the melon into six equal pieces.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · equality (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6974-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'equality', JSON_ARRAY('equality'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6974-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6974-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '____ is guaranteed by the Constitution.',
       JSON_ARRAY(),
       'equality',
       'n. 平等, 均匀, 相等 [法] 同等, 平等, 相等 ｜ 原句：Equality is guaranteed by the Constitution.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · equation (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6975-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'equation', JSON_ARRAY('equation', 'equations'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6975-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6975-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'It''s stable because all the roots of this ____ are negative.',
       JSON_ARRAY(),
       'equation',
       'n. 相等, 等式, 平衡 [化] 方程式; 等式; 反应式; 公式 ｜ 原句：It''s stable because all the roots of this equation are negative.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · equip (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6976-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'equip', JSON_ARRAY('equip', 'equips', 'equiped', 'equiping'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6976-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6976-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'They try to ____ their vehicles with gadgets to deal with every possible contingency.',
       JSON_ARRAY(),
       'equip',
       'vt. 装备, 配备 [机] 设备, 装置 ｜ 原句：They try to equip their vehicles with gadgets to deal with every possible contingency.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · equipment (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6977-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'equipment', JSON_ARRAY('equipment'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6977-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6977-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'This hospital has a lot of new ____.',
       JSON_ARRAY(),
       'equipment',
       'n. 装备, 设备, 才能 [化] 设备; 装备; 装置 ｜ 原句：This hospital has a lot of new equipment.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · equivalent (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6978-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'equivalent', JSON_ARRAY('equivalent', 'equivalents'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6978-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6978-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'That Japanese word has no ____ in English.',
       JSON_ARRAY(),
       'equivalent',
       'n. 同等物, 等价物, 相等物 a. 相等的, 相当的, 同意义的 [计] 等价的 ｜ 原句：That Japanese word has no equivalent in English.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · era (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6979-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'era', JSON_ARRAY('era', 'eras'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6979-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6979-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The revolution ushered in a new ____.',
       JSON_ARRAY(),
       'era',
       'n. 时代, 纪元, 时期 ｜ 原句：The revolution ushered in a new era.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · error (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6981-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'error', JSON_ARRAY('error', 'errors'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6981-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6981-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'At last, he realized his ____.',
       JSON_ARRAY(),
       'error',
       'n. 错误, 过失, 失误, 误差 [计] 错误 ｜ 原句：At last, he realized his error.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · especially (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6983-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'especially', JSON_ARRAY('especially'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6983-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6983-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Even now, many years after the Cold War, there is still much rancor between the Russians and the Germans, ____ in areas once occupied by the Soviet Union.',
       JSON_ARRAY(),
       'especially',
       'adv. 尤其, 特别, 格外 ｜ 原句：Even now, many years after the Cold War, there is still much rancor between the Russians and the Germans, especially in areas once occupied by the Soviet Union.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · essay (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6984-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'essay', JSON_ARRAY('essay', 'essays'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6984-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6984-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'His ____ gave only a superficial analysis of the problem, so it was a real surprise to him when he got the highest grade in the class.',
       JSON_ARRAY(),
       'essay',
       'n. 随笔, 短文, 评论, 企图 vt. 试图 ｜ 原句：His essay gave only a superficial analysis of the problem, so it was a real surprise to him when he got the highest grade in the class.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · establish (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6985-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'establish', JSON_ARRAY('establish', 'establishes', 'established', 'establishing'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6985-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6985-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Our ultimate goal is to ____ world peace.',
       JSON_ARRAY(),
       'establish',
       'vt. 建立, 确立, 制定 vi. 移植生长 ｜ 原句：Our ultimate goal is to establish world peace.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · establishment (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6986-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'establishment', JSON_ARRAY('establishment'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6986-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6986-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'the ____ of NATO in 1949',
       JSON_ARRAY(),
       'establishment',
       'n. 确立, 制定, 设施 [经] 企业, 公司, 商店 ｜ 原句：the establishment of NATO in 1949',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · estimate (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6988-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'estimate', JSON_ARRAY('estimate', 'estimates'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6988-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6988-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Try to ____ how much you spent on books.',
       JSON_ARRAY(),
       'estimate',
       'n. 估计, 判断 vt. 估计, 评价, 判断 vi. 估计 ｜ 原句：Try to estimate how much you spent on books.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · evacuate (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6989-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'evacuate', JSON_ARRAY('evacuate', 'evacuates', 'evacuated', 'evacuating'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6989-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6989-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'We have less than five minutes to ____ the whole building.',
       JSON_ARRAY(),
       'evacuate',
       'v. 疏散, 撤出, 排泄 ｜ 原句：We have less than five minutes to evacuate the whole building.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · evaluate (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6990-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'evaluate', JSON_ARRAY('evaluate', 'evaluates', 'evaluated', 'evaluating'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6990-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6990-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Gorelick said that the outcomes of his work in Jordan may be used to ____ water scarcity in other Middle Eastern countries, such as Syria.',
       JSON_ARRAY(),
       'evaluate',
       'vt. 评估, 评价, 赋值 ｜ 原句：Gorelick said that the outcomes of his work in Jordan may be used to evaluate water scarcity in other Middle Eastern countries, such as Syria.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · evaporate (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6991-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'evaporate', JSON_ARRAY('evaporate', 'evaporated', 'evaporates', 'evaporating'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6991-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6991-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Most of the water had ____.',
       JSON_ARRAY(),
       'evaporated',
       'vi. 蒸发, 失去水分, 消失 vt. 使蒸发, 使脱水, 使消失 ｜ 原句：Most of the water had evaporated.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · eve (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6992-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'eve', JSON_ARRAY('eve', 'eves'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6992-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6992-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Dumplings are essential at the New Year''s ____ dinner table.',
       JSON_ARRAY(),
       'eve',
       'n. 前夕, 前夜 ｜ 原句：Dumplings are essential at the New Year''s Eve dinner table.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · event (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6993-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'event', JSON_ARRAY('event', 'events'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6993-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6993-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'You make too much of the ____.',
       JSON_ARRAY(),
       'event',
       'n. 事件, 结果, 事情的进程, 竞赛项目 [计] 事件 ｜ 原句：You make too much of the event.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · eventually (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6994-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'eventually', JSON_ARRAY('eventually'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6994-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6994-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Such secrets are always ____ revealed.',
       JSON_ARRAY(),
       'eventually',
       'adv. 最后, 终于 ｜ 原句：Such secrets are always eventually revealed.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · everyday (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6995-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'everyday', JSON_ARRAY('everyday'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6995-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6995-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'TV plays an important part in ____ life.',
       JSON_ARRAY(),
       'everyday',
       'a. 每天的, 日常的, 平常的 ｜ 原句：TV plays an important part in everyday life.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · evidence (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6996-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'evidence', JSON_ARRAY('evidence', 'evidences'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6996-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6996-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The ____ was in his favor.',
       JSON_ARRAY(),
       'evidence',
       'n. 根据, 证据, 迹象 [经] 证据, 凭证 ｜ 原句：The evidence was in his favor.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · evident (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6997-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'evident', JSON_ARRAY('evident'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6997-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6997-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'As is ____ from the data, smoking is not decreasing among the young.',
       JSON_ARRAY(),
       'evident',
       'a. 显然的, 明显的 ｜ 原句：As is evident from the data, smoking is not decreasing among the young.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · evil (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6998-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'evil', JSON_ARRAY('evil', 'evils'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6998-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6998-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'That was an ____ bunny.',
       JSON_ARRAY(),
       'evil',
       'n. 邪恶, 不幸, 罪恶 a. 邪恶的, 不幸的, 有害的, 讨厌的 ｜ 原句：That was an evil bunny.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · evolution (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6999-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'evolution', JSON_ARRAY('evolution', 'evolutions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6999-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6999-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'We associate Darwin with the theory of ____.',
       JSON_ARRAY(),
       'evolution',
       'n. 进化, 发展, 进展, (气体)放出, 开方 [医] 进化, 演化, 旋出 ｜ 原句：We associate Darwin with the theory of evolution.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · evolve (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7000-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'evolve', JSON_ARRAY('evolve', 'evolved', 'evolves', 'evolving'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7000-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7000-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The school has ____ its own style of teaching.',
       JSON_ARRAY(),
       'evolved',
       'vi. 进展, 进化, 展开 vt. 使发展, 使推断出, 使进化 ｜ 原句：The school has evolved its own style of teaching.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · exact (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7001-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'exact', JSON_ARRAY('exact'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7001-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7001-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I can''t get at the ____ meaning of the sentence.',
       JSON_ARRAY(),
       'exact',
       'a. 精确的, 准确的, 精密的 vt. 强求, 急需 ｜ 原句：I can''t get at the exact meaning of the sentence.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · exactly (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7002-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'exactly', JSON_ARRAY('exactly'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7002-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7002-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Our plane took off ____ on time at six.',
       JSON_ARRAY(),
       'exactly',
       'adv. 确切地, 精确地, 恰好, 完全地, 确实, 恰恰正是, 确实如此 ｜ 原句：Our plane took off exactly on time at six.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · exaggerate (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7003-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'exaggerate', JSON_ARRAY('exaggerate', 'exaggerates', 'exaggerated', 'exaggerating'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7003-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7003-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'It seems to me that she has a tendency to ____.',
       JSON_ARRAY(),
       'exaggerate',
       'v. 夸大, 夸张 ｜ 原句：It seems to me that she has a tendency to exaggerate.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · examination (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7004-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'examination', JSON_ARRAY('examination', 'examinations'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7004-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7004-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'You should have known better than to take an ____ without preparing for it.',
       JSON_ARRAY(),
       'examination',
       'n. 考试, 测验, 审查 [医] 检查, 诊察 ｜ 原句：You should have known better than to take an examination without preparing for it.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · examine (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7005-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'examine', JSON_ARRAY('examine', 'examines', 'examined', 'examining'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7005-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7005-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The doctor used X-rays to ____ my stomach.',
       JSON_ARRAY(),
       'examine',
       'v. 检查, 调查, 考试 ｜ 原句：The doctor used X-rays to examine my stomach.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · exceed (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7006-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'exceed', JSON_ARRAY('exceed', 'exceeds', 'exceeded', 'exceeding'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7006-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7006-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Don''t ____ the speed limit.',
       JSON_ARRAY(),
       'exceed',
       'vt. 超过, 超越, 胜过 vi. 超过其他 ｜ 原句：Don''t exceed the speed limit.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · exceedingly (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7007-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'exceedingly', JSON_ARRAY('exceedingly'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7007-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7007-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Thank you. You’ve been ____ kind.',
       JSON_ARRAY(),
       'exceedingly',
       'adv. 极端地, 极度地, 非常 ｜ 原句：Thank you. You’ve been exceedingly kind.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · excellent (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7008-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'excellent', JSON_ARRAY('excellent'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7008-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7008-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Martha is an ____ pianist.',
       JSON_ARRAY(),
       'excellent',
       'a. 优良的, 杰出的, 出色的 ｜ 原句：Martha is an excellent pianist.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · exception (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7009-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'exception', JSON_ARRAY('exception', 'exceptions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7009-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7009-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Every team, without ____, was defeated.',
       JSON_ARRAY(),
       'exception',
       'n. 例外, 除外, 异议 [计] 例外; 异常 ｜ 原句：Every team, without exception, was defeated.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · excess (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7010-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'excess', JSON_ARRAY('excess', 'excesses'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7010-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7010-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The load of the truck was in ____ of three tons.',
       JSON_ARRAY(),
       'excess',
       'n. 过度, 剩于, 超过, 超额 a. 过量的, 额外的 ｜ 原句：The load of the truck was in excess of three tons.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · excessive (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7011-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'excessive', JSON_ARRAY('excessive'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7011-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7011-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '____ drinking is one of the causes of impotence.',
       JSON_ARRAY(),
       'excessive',
       'a. 过度的, 过多的, 极端的 [法] 过度的, 过分的, 额外的 ｜ 原句：Excessive drinking is one of the causes of impotence.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · exchange (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7012-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'exchange', JSON_ARRAY('exchange', 'exchanges'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7012-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7012-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The ____ rates for foreign currency change daily.',
       JSON_ARRAY(),
       'exchange',
       'n. 交换, (电话)交换局, 交换机, 汇兑, 交易所 v. 交换, 交易, 兑换 [计] 交换; 电话局 ｜ 原句：The exchange rates for foreign currency change daily.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · excite (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7013-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'excite', JSON_ARRAY('excite', 'excites', 'excited', 'exciting'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7013-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7013-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'His playing is technically brilliant, but it doesn’t ____ me.',
       JSON_ARRAY(),
       'excite',
       'vt. 刺激, 使兴奋, 激励 ｜ 原句：His playing is technically brilliant, but it doesn’t excite me.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · excitement (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7014-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'excitement', JSON_ARRAY('excitement'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7014-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7014-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The ____ reached its peak.',
       JSON_ARRAY(),
       'excitement',
       'n. 刺激, 兴奋 [医] 兴奋, 激动 ｜ 原句：The excitement reached its peak.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · exciting (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7015-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'exciting', JSON_ARRAY('exciting'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7015-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7015-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Movie making is an ____ job.',
       JSON_ARRAY(),
       'exciting',
       'a. 令人兴奋的, 刺激的 [电] 激磁 ｜ 原句：Movie making is an exciting job.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · exclaim (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7016-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'exclaim', JSON_ARRAY('exclaim', 'exclaimed', 'exclaims', 'exclaiming'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7016-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7016-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '‘No!’ she ____ in shock.',
       JSON_ARRAY(),
       'exclaimed',
       'v. 大叫, 呼喊, 大声叫 ｜ 原句：‘No!’ she exclaimed in shock.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · exclusively (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7019-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'exclusively', JSON_ARRAY('exclusively'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7019-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7019-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Confidence and courage are not ____ masculine traits—they are values that everyone can aspire to.',
       JSON_ARRAY(),
       'exclusively',
       'adv. 排他地, 仅仅, 专门, 只, 仅, 唯一地, 专有地 ｜ 原句：Confidence and courage are not exclusively masculine traits—they are values that everyone can aspire to.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · excursion (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7020-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'excursion', JSON_ARRAY('excursion', 'excursions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7020-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7020-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'A travel agent will arrange an ____ to Andalusia for you.',
       JSON_ARRAY(),
       'excursion',
       'n. 远足, 游览圆, 短程旅行 [医] 移动, 离轨, 逸出 ｜ 原句：A travel agent will arrange an excursion to Andalusia for you.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · execute (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7021-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'execute', JSON_ARRAY('execute', 'executes', 'executed', 'executing'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7021-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7021-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'We must ____ his orders.',
       JSON_ARRAY(),
       'execute',
       'vt. 执行, 实行, 完成, 处死, 制成 [计] 执行 ｜ 原句：We must execute his orders.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · executive (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7022-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'executive', JSON_ARRAY('executive', 'executives'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7022-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7022-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'We''ll need a head hunting agency to find the right man for this ____ position.',
       JSON_ARRAY(),
       'executive',
       'n. 执行部门, 执行委员会, 执行者, 经理主管人员 a. 执行的, 善于执行的, 善于经营的 [计] 执行程序 ｜ 原句：We''ll need a head hunting agency to find the right man for this executive position.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · exert (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7023-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'exert', JSON_ARRAY('exert', 'exerted', 'exerts', 'exerting'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7023-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7023-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'They ____ considerable influence within the school.',
       JSON_ARRAY(),
       'exerted',
       'vt. 发挥, 运用, 施以影响 [法] 施加, 产生, 行使 ｜ 原句：They exerted considerable influence within the school.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · exhaust (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7024-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'exhaust', JSON_ARRAY('exhaust', 'exhausts'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7024-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7024-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Car ____ causes serious pollution in towns.',
       JSON_ARRAY(),
       'exhaust',
       'n. 排气, 排气装置, 废气 vt. 抽完, 用尽, 耗尽, 使精疲力尽 vi. 排气 ｜ 原句：Car exhaust causes serious pollution in towns.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · exhibit (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7026-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'exhibit', JSON_ARRAY('exhibit', 'exhibits'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7026-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7026-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I''m going to ____ my roses at the flower show.',
       JSON_ARRAY(),
       'exhibit',
       'n. 显示, 显现, 展览品, 陈列品, 展览 vt. 展现, 陈列, 展览 vi. 开展览会 ｜ 原句：I''m going to exhibit my roses at the flower show.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · exhibition (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7027-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'exhibition', JSON_ARRAY('exhibition', 'exhibitions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7027-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7027-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The ____ is now open.',
       JSON_ARRAY(),
       'exhibition',
       'n. 表现, 展览会, 展览品 [医] 投药, 展览, 展出 ｜ 原句：The exhibition is now open.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · exist (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7028-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'exist', JSON_ARRAY('exist', 'exists', 'existed', 'existing'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7028-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7028-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I don''t believe such things ____.',
       JSON_ARRAY(),
       'exist',
       'vi. 存在, 生存, 发生 ｜ 原句：I don''t believe such things exist.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · existence (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7029-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'existence', JSON_ARRAY('existence', 'existences'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7029-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7029-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'A new law has come into ____.',
       JSON_ARRAY(),
       'existence',
       'n. 存在, 生存 [法] 存在, 存在状态, 实体 ｜ 原句：A new law has come into existence.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · exit (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7030-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'exit', JSON_ARRAY('exit', 'exits'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7030-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7030-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Where''s the emergency ____?',
       JSON_ARRAY(),
       'exit',
       'n. 出口, 退场, 离去, 去世 vi. 退出, 脱离, 去世 [计] 退出; DOS内部命令:本命令用于退出当前的命令处理器(COMMAND.COM) 恢复前一个命令处理器 ｜ 原句：Where''s the emergency exit?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · expand (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7031-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'expand', JSON_ARRAY('expand', 'expands', 'expanded', 'expanding'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7031-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7031-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He really needs to ____ his Berber vocabulary.',
       JSON_ARRAY(),
       'expand',
       'vt. 使膨胀, 详述, 扩张 vi. 张开, 发展 vt. 展开 vi. 展开 [计] 展开; DOS外部命令:将原始DOS磁盘上的压缩文件解压缩并拷贝到硬盘上 ｜ 原句：He really needs to expand his Berber vocabulary.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · expansion (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7032-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'expansion', JSON_ARRAY('expansion', 'expansions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7032-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7032-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The ____ of the building''s west end is being studied.',
       JSON_ARRAY(),
       'expansion',
       'n. 扩充, 开展, 膨胀 [计] 扩展 ｜ 原句：The expansion of the building''s west end is being studied.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · expectation (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7033-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'expectation', JSON_ARRAY('expectation', 'expectations'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7033-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7033-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Having raised ____ (= made people more hopeful ), he went on to help only a few people.',
       JSON_ARRAY(),
       'expectations',
       'n. 期待, 指望, 展望 [化] 期望值 ｜ 原句：Having raised expectations (= made people more hopeful ), he went on to help only a few people.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · expel (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7034-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'expel', JSON_ARRAY('expel', 'expelled', 'expels'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7034-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7034-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'More than five-thousand high school students have been ____ for cheating.',
       JSON_ARRAY(),
       'expelled',
       'vt. 驱逐, 逐出, 排出, 开除 [医] 排除, 迫出 ｜ 原句：More than five-thousand high school students have been expelled for cheating.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · expend (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7035-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'expend', JSON_ARRAY('expend', 'expends', 'expended', 'expending'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7035-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7035-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I knew since middle school that only because I was so lonely was I able to ____ so much energy on studying.',
       JSON_ARRAY(),
       'expend',
       'vt. 花费, 消耗, 用光 ｜ 原句：I knew since middle school that only because I was so lonely was I able to expend so much energy on studying.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · expenditure (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7036-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'expenditure', JSON_ARRAY('expenditure', 'expenditures'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7036-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7036-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'the ____ of time and money on your house or garden',
       JSON_ARRAY(),
       'expenditure',
       'n. 开支, 费用, 用光, 消费额 [经] 支出, 费用, 消费 ｜ 原句：the expenditure of time and money on your house or garden',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · expense (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7037-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'expense', JSON_ARRAY('expense', 'expenses'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7037-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7037-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The total ____ for the project amounts to one hundred million yen.',
       JSON_ARRAY(),
       'expense',
       'n. 费用, 代价, 开支, 损失 [经] 费用, 开支, 将支出转为费用 ｜ 原句：The total expense for the project amounts to one hundred million yen.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · experience (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7038-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'experience', JSON_ARRAY('experience', 'experiences'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7038-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7038-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Canada is a good place to go if it''s your first ____ living abroad.',
       JSON_ARRAY(),
       'experience',
       'n. 经历, 经验, 体验 vt. 经历, 经验, 体验 ｜ 原句：Canada is a good place to go if it''s your first experience living abroad.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · experiment (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7039-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'experiment', JSON_ARRAY('experiment'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7039-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7039-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Prove it by ____.',
       JSON_ARRAY(),
       'experiment',
       'n. 实验, 试验, 实验仪器 vi. 实验, 尝试 ｜ 原句：Prove it by experiment.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · experimental (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7040-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'experimental', JSON_ARRAY('experimental'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7040-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7040-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'What did the ____ set-up look like? What was connected to what and how?',
       JSON_ARRAY(),
       'experimental',
       'a. 实验的, 根据实验的 [医] 实验的 ｜ 原句：What did the experimental set-up look like? What was connected to what and how?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · expert (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7041-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'expert', JSON_ARRAY('expert', 'experts'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7041-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7041-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The aviation ____ analyzed the statistics in detail.',
       JSON_ARRAY(),
       'expert',
       'n. 专家, 行家 a. 老练的, 内行的, 专门的 [计] 高级 ｜ 原句：The aviation expert analyzed the statistics in detail.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · explain (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7042-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'explain', JSON_ARRAY('explain', 'explains', 'explained', 'explaining'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7042-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7042-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'It would take forever for me to ____ everything.',
       JSON_ARRAY(),
       'explain',
       'v. 解释, 说明 ｜ 原句：It would take forever for me to explain everything.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · explanation (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7043-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'explanation', JSON_ARRAY('explanation', 'explanations'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7043-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7043-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Thanks for your ____.',
       JSON_ARRAY(),
       'explanation',
       'n. 解释, 说明, 辩解, 表明 [经] 解释, 注释, 说明 ｜ 原句：Thanks for your explanation.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · explode (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7044-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'explode', JSON_ARRAY('explode', 'explodes', 'exploded', 'exploding'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7044-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7044-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The aim of this game is to ____ all the bombs on the screen.',
       JSON_ARRAY(),
       'explode',
       'vi. 爆炸, 爆发, 激增 vt. 使爆炸 ｜ 原句：The aim of this game is to explode all the bombs on the screen.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · exploit (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7045-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'exploit', JSON_ARRAY('exploit', 'exploits'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7045-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7045-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'the urgent need to ____ the resources of the Irish Sea',
       JSON_ARRAY(),
       'exploit',
       'n. 功绩, 勋绩 vt. 开发, 利用, 开拓, 剥削 ｜ 原句：the urgent need to exploit the resources of the Irish Sea',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · explore (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7046-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'explore', JSON_ARRAY('explore', 'explores', 'explored', 'exploring'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7046-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7046-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I want to ____ the world. It’s my dream.',
       JSON_ARRAY(),
       'explore',
       'v. 探险, 探测, 探究 ｜ 原句：I want to explore the world. It’s my dream.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · explosion (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7047-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'explosion', JSON_ARRAY('explosion', 'explosions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7047-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7047-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The ____ may have been caused by a gas leak.',
       JSON_ARRAY(),
       'explosion',
       'n. 爆发, 激增, 爆炸(声) [化] 爆炸 ｜ 原句：The explosion may have been caused by a gas leak.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · explosive (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7048-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'explosive', JSON_ARRAY('explosive', 'explosives'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7048-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7048-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '...one-hundred-and-fifty pounds of Semtex ____.',
       JSON_ARRAY(),
       'explosive',
       'n. 炸药, 爆破音 a. 易爆发的, 爆炸的, 暴躁的 ｜ 原句：...one-hundred-and-fifty pounds of Semtex explosive.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · export (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7049-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'export', JSON_ARRAY('export', 'exports'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7049-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7049-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The company ____ tuna to the US.',
       JSON_ARRAY(),
       'exports',
       'n. 输出品, 输出 vt. 输出, 出口 vi. 输出物资 [计] 导出 ｜ 原句：The company exports tuna to the US.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · expose (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7050-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'expose', JSON_ARRAY('expose', 'exposes', 'exposed', 'exposing'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7050-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7050-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'We should sometimes ____ our bodies to the sun.',
       JSON_ARRAY(),
       'expose',
       'vt. 使暴露, 使曝光, 揭穿, 陈列 [医] 暴露, 露置 ｜ 原句：We should sometimes expose our bodies to the sun.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · exposure (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7051-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'exposure', JSON_ARRAY('exposure', 'exposures'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7051-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7051-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '____ to lead is known to damage the brains of young children.',
       JSON_ARRAY(),
       'exposure',
       'n. 暴露, 揭发, 揭露 [化] 曝光量; 照射; 照射量 ｜ 原句：Exposure to lead is known to damage the brains of young children.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · express (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7052-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'express', JSON_ARRAY('express', 'expresses'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7052-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7052-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I don''t like it when mathematicians who know much more than I do can''t ____ themselves explicitly.',
       JSON_ARRAY(),
       'express',
       'n. 快车, 快递, 专使 a. 明确的, 丝毫不差的, 专门的, 快的 vt. 表达, 表示, 表露 ｜ 原句：I don''t like it when mathematicians who know much more than I do can''t express themselves explicitly.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · expression (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7053-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'expression', JSON_ARRAY('expression', 'expressions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7053-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7053-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He said with a perplexed ____, "I''ve heard nothing, so I can''t say anything."',
       JSON_ARRAY(),
       'expression',
       'n. 表达, 表现, 词语, 措辞 [计] 表达式 ｜ 原句：He said with a perplexed expression, "I''ve heard nothing, so I can''t say anything."',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · extend (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7054-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'extend', JSON_ARRAY('extend', 'extends', 'extended', 'extending'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7054-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7054-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I want to ____ my stay here for a few more days.',
       JSON_ARRAY(),
       'extend',
       'v. 扩充, 延伸, 伸展, 扩大 [计] 扩展 ｜ 原句：I want to extend my stay here for a few more days.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · extension (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7055-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'extension', JSON_ARRAY('extension', 'extensions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7055-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7055-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Grace goes upstairs to the ____ telephone.',
       JSON_ARRAY(),
       'extension',
       'n. 延长, 扩充, 范围, 扩展名 a. 伸缩的 [计] 扩展名, 扩充名 ｜ 原句：Grace goes upstairs to the extension telephone.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · extensive (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7056-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'extensive', JSON_ARRAY('extensive'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7056-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7056-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Those selected will have to face ____ medical and psychological tests.',
       JSON_ARRAY(),
       'extensive',
       'a. 广的, 广泛的, 多方面的 [经] 广大的, 扩大的 ｜ 原句：Those selected will have to face extensive medical and psychological tests.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · extent (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7057-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'extent', JSON_ARRAY('extent', 'extents'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7057-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7057-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'We could see the full ____ of the park from the hotel.',
       JSON_ARRAY(),
       'extent',
       'n. 范围, 程度, 区域 [计] 范围 ｜ 原句：We could see the full extent of the park from the hotel.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · exterior (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7058-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'exterior', JSON_ARRAY('exterior', 'exteriors'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7058-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7058-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The ____ walls need a new coat of paint.',
       JSON_ARRAY(),
       'exterior',
       'n. 外部, 表面, 外貌 a. 外部的, 外在的, 表面的 ｜ 原句：The exterior walls need a new coat of paint.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · external (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7059-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'external', JSON_ARRAY('external', 'externals'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7059-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7059-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Save it on the ____ hard drive.',
       JSON_ARRAY(),
       'external',
       'n. 外部, 外面 a. 外部的, 客观的, 表面的 ｜ 原句：Save it on the external hard drive.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · extinct (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7060-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'extinct', JSON_ARRAY('extinct'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7060-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7060-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Butterflies of this species are now ____.',
       JSON_ARRAY(),
       'extinct',
       'a. 熄灭的, 灭绝的, 耗尽的 [法] 消灭了的, 过时的, 无效的 ｜ 原句：Butterflies of this species are now extinct.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · extra (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7061-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'extra', JSON_ARRAY('extra', 'extras'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7061-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7061-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'My wife''s part-time job brings in a little ____ money.',
       JSON_ARRAY(),
       'extra',
       'n. 额外的事物, 另外的收费 a. 额外的, 特别的 adv. 额外地, 特别地, 非常地 ｜ 原句：My wife''s part-time job brings in a little extra money.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · extraordinary (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7062-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'extraordinary', JSON_ARRAY('extraordinary'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7062-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7062-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Rosa Montero is an ____ woman.',
       JSON_ARRAY(),
       'extraordinary',
       'a. 非常的, 特别的, 非凡的 [经] 非常的, 特别的, 临时的 ｜ 原句：Rosa Montero is an extraordinary woman.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · extreme (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7063-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'extreme', JSON_ARRAY('extreme', 'extremes'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7063-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7063-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I don''t want to lose my ideas, even though some of them are a bit ____.',
       JSON_ARRAY(),
       'extreme',
       'n. 极端, 末端 a. 极端的, 尽头的, 极度的, 偏激的 ｜ 原句：I don''t want to lose my ideas, even though some of them are a bit extreme.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · extremely (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7064-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'extremely', JSON_ARRAY('extremely'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7064-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7064-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'It is ____ hot and humid in Bali in December.',
       JSON_ARRAY(),
       'extremely',
       'adv. 极端地, 非常地 ｜ 原句：It is extremely hot and humid in Bali in December.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · eyesight (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7065-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'eyesight', JSON_ARRAY('eyesight', 'eyesights'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7065-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7065-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'My ____ is getting worse.',
       JSON_ARRAY(),
       'eyesight',
       'n. 视力, 目力 ｜ 原句：My eyesight is getting worse.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · fabric (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7066-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'fabric', JSON_ARRAY('fabric', 'fabrics'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7066-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7066-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The dress is made of a thin ____.',
       JSON_ARRAY(),
       'fabric',
       'n. 织物, 布, 结构, 构造, 建筑物 [经] 组织, 建筑物, 工厂 ｜ 原句：The dress is made of a thin fabric.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · facility (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7067-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'facility', JSON_ARRAY('facility', 'facilities'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7067-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7067-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'What recreational ____ are now available?',
       JSON_ARRAY(),
       'facilities',
       'n. 容易, 灵巧, 设备 [计] 设施; 设备; 装备 ｜ 原句：What recreational facilities are now available?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · fact (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7068-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'fact', JSON_ARRAY('fact', 'facts'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7068-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7068-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Only a handful of people know the ____.',
       JSON_ARRAY(),
       'fact',
       'n. 事实, 真实性, 真相, 细节, 论据 ｜ 原句：Only a handful of people know the fact.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · factor (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7069-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'factor', JSON_ARRAY('factor', 'factors'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7069-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7069-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'When applying to American universities, your TOEFL score is only one ____.',
       JSON_ARRAY(),
       'factor',
       'n. 因素, 因数, 系数, 基因, 代理人 [计] 因式 ｜ 原句：When applying to American universities, your TOEFL score is only one factor.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · faculty (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7070-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'faculty', JSON_ARRAY('faculty', 'faculties'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7070-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7070-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I study comparative religion in the arts ____ of the University of Turku.',
       JSON_ARRAY(),
       'faculty',
       'n. 才能, 能力, 全体教员, (大学的)系 [医] 能力, [大学]院系 ｜ 原句：I study comparative religion in the arts faculty of the University of Turku.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · fade (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7071-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'fade', JSON_ARRAY('fade', 'fades', 'faded', 'fading'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7071-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7071-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Her beauty will ____ in time.',
       JSON_ARRAY(),
       'fade',
       'vi. 褪色, 消失, 凋谢 vt. 使褪色 n. 淡入, 淡出 a. 平淡的 ｜ 原句：Her beauty will fade in time.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · fahrenheit (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7072-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'fahrenheit', JSON_ARRAY('fahrenheit'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7072-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7072-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Water freezes at 32 degrees ____.',
       JSON_ARRAY(),
       'fahrenheit',
       'a. 华氏温度计的 n. 华氏温度计 ｜ 原句：Water freezes at 32 degrees Fahrenheit.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · failure (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7073-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'failure', JSON_ARRAY('failure', 'failures'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7073-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7073-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'You should acknowledge your ____.',
       JSON_ARRAY(),
       'failure',
       'n. 失败, 失败者, 不足, 缺乏, 破产 [计] 故障; 失效 ｜ 原句：You should acknowledge your failure.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · faint (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7074-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'faint', JSON_ARRAY('faint', 'faints'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7074-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7074-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The sound of shouting grew ____.',
       JSON_ARRAY(),
       'faint',
       'n. 昏厥, 昏倒 a. 模糊的, 微弱的, 无力的 vi. 昏倒, 变得微弱 ｜ 原句：The sound of shouting grew faint.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · fair (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7075-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'fair', JSON_ARRAY('fair', 'fairs'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7075-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7075-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'No love is foul nor prison ____.',
       JSON_ARRAY(),
       'fair',
       'n. 展览会, 市集, 美好的事物 a. 公平的, 按规则进行的, 不好不坏的, 晴朗的, 美丽的 adv. 公平地, 正面地, 有教养地, 清楚地 vi. 转晴 ｜ 原句：No love is foul nor prison fair.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · fairly (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7076-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'fairly', JSON_ARRAY('fairly', 'fairlier', 'fairliest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7076-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7076-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'That sounds like a ____ good proposal.',
       JSON_ARRAY(),
       'fairly',
       'adv. 美观地, 公平地, 相当地, 清楚地 ｜ 原句：That sounds like a fairly good proposal.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · faith (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7077-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'faith', JSON_ARRAY('faith', 'faiths'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7077-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7077-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I have complete ____ in my doctor.',
       JSON_ARRAY(),
       'faith',
       'n. 信心, 信任, 忠实, 保证 [法] 信任, 信仰, 信念 ｜ 原句：I have complete faith in my doctor.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · faithful (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7078-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'faithful', JSON_ARRAY('faithful'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7078-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7078-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The statue of Hachiko, the ____ dog, stands in front of Shibuya Station.',
       JSON_ARRAY(),
       'faithful',
       'a. 忠实的, 详确的, 可靠的 n. 信徒 ｜ 原句：The statue of Hachiko, the faithful dog, stands in front of Shibuya Station.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · false (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7079-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'false', JSON_ARRAY('false'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7079-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7079-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The rumor turned out ____.',
       JSON_ARRAY(),
       'false',
       'a. 错误的, 虚伪的, 假的, 不老实的 adv. 不准确地, 欺诈地 ｜ 原句：The rumor turned out false.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · fame (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7080-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'fame', JSON_ARRAY('fame', 'fames'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7080-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7080-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Despite adversity, the architect achieved worldwide ____.',
       JSON_ARRAY(),
       'fame',
       'n. 名望, 名声, 传说 ｜ 原句：Despite adversity, the architect achieved worldwide fame.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · familiar (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7081-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'familiar', JSON_ARRAY('familiar'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7081-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7081-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'All of you are ____ with the truth of the story.',
       JSON_ARRAY(),
       'familiar',
       'a. 熟悉的, 常见的, 亲密的 n. 熟友, 常客 ｜ 原句：All of you are familiar with the truth of the story.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · famine (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7082-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'famine', JSON_ARRAY('famine', 'famines'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7082-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7082-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'the great potato ____ in Ireland',
       JSON_ARRAY(),
       'famine',
       'n. 饥荒, 缺乏, 饥饿 ｜ 原句：the great potato famine in Ireland',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · fancy (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7084-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'fancy', JSON_ARRAY('fancy', 'fancies'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7084-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7084-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '____ meeting you here!',
       JSON_ARRAY(),
       'fancy',
       'n. 想象力, 幻想, 喜好 a. 想象的, 精美的, 新奇的, 奇特的, 高价的, 特级的 vt. 想象, 设想, 相信, 喜爱 vi. 想象, 幻想 ｜ 原句：Fancy meeting you here!',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · fantasy (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7085-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'fantasy', JSON_ARRAY('fantasy', 'fantasies'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7085-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7085-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Mathematicians are poets, except that they have to prove what their ____ creates.',
       JSON_ARRAY(),
       'fantasy',
       'n. 幻想, 想象的产物 [医] 幻想 ｜ 原句：Mathematicians are poets, except that they have to prove what their fantasy creates.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · fare (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7086-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'fare', JSON_ARRAY('fare', 'fares'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7086-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7086-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'What''s the round-trip ____?',
       JSON_ARRAY(),
       'fare',
       'n. 费用, 旅客, 食物 vi. 进展, 进步, 经营, 过活 ｜ 原句：What''s the round-trip fare?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · farewell (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7087-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'farewell', JSON_ARRAY('farewell', 'farewells'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7087-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7087-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I got a ____ present from everyone.',
       JSON_ARRAY(),
       'farewell',
       'n. 辞别, 再见, 再会 interj. 再会 ｜ 原句：I got a farewell present from everyone.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · farmer (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7088-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'farmer', JSON_ARRAY('farmer', 'farmers'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7088-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7088-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'But the ____ smiled at him.',
       JSON_ARRAY(),
       'farmer',
       'n. 农夫, 农场主 [法] 农民, 农场主, 承包者 ｜ 原句：But the farmer smiled at him.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · farther (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7089-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'farther', JSON_ARRAY('farther'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7089-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7089-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I can''t walk any ____.',
       JSON_ARRAY(),
       'farther',
       'a. 更远的, 进一步的 adv. 更远的, 此外, far的比较级 ｜ 原句：I can''t walk any farther.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · fashion (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7090-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'fashion', JSON_ARRAY('fashion', 'fashions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7090-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7090-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'You may think those shoes are in ____, but they aren''t.',
       JSON_ARRAY(),
       'fashion',
       'n. 流行, 风尚, 时样 vt. 形成, 造, 作 ｜ 原句：You may think those shoes are in fashion, but they aren''t.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · fashionable (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7091-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'fashionable', JSON_ARRAY('fashionable'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7091-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7091-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'It''s sort of ____, but the price is too high!',
       JSON_ARRAY(),
       'fashionable',
       'a. 时髦的, 上流社会的, 流行的 ｜ 原句：It''s sort of fashionable, but the price is too high!',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · fasten (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7092-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'fasten', JSON_ARRAY('fasten', 'fastens'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7092-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7092-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '____ your seat belt, please.',
       JSON_ARRAY(),
       'fasten',
       'vt. 拴紧, 使固定, 系, 集中于, 强加于 vi. 扣紧 ｜ 原句：Fasten your seat belt, please.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · fatal (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7093-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'fatal', JSON_ARRAY('fatal'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7093-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7093-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Life is a ____ sexually transmitted disease.',
       JSON_ARRAY(),
       'fatal',
       'a. 致命的, 重大的, 命运注定的, 粗心的, 不幸的 [医] 致命的, 致死的 ｜ 原句：Life is a fatal sexually transmitted disease.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · fate (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7094-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'fate', JSON_ARRAY('fate', 'fates'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7094-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7094-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I would rather kill myself than reconcile myself to my ____.',
       JSON_ARRAY(),
       'fate',
       'n. 命运, 运气 vt. 注定 ｜ 原句：I would rather kill myself than reconcile myself to my fate.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · fatigue (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7096-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'fatigue', JSON_ARRAY('fatigue', 'fatigues'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7096-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7096-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'What with ____ and lack of sleep, he has fallen ill at last.',
       JSON_ARRAY(),
       'fatigue',
       'n. 疲乏, 疲劳 vt. 使疲劳, 使心智衰弱 vi. 疲劳 a. 疲劳的 ｜ 原句：What with fatigue and lack of sleep, he has fallen ill at last.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · faulty (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7098-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'faulty', JSON_ARRAY('faulty', 'faultier', 'faultiest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7098-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7098-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Customers may ask for a refund if the goods are ____.',
       JSON_ARRAY(),
       'faulty',
       'a. 有过失的, 有缺点的, 不完美的, 应受责备的 [经] 缺点多的 ｜ 原句：Customers may ask for a refund if the goods are faulty.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · favor (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7099-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'favor', JSON_ARRAY('favor', 'favors'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7099-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7099-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I am in ____ of your proposal.',
       JSON_ARRAY(),
       'favor',
       'n. 好意, 喜爱 vt. 赐予, 支持, 喜欢, 证实 ｜ 原句：I am in favor of your proposal.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · favorable (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7100-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'favorable', JSON_ARRAY('favorable'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7100-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7100-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'His comments about the book were ____.',
       JSON_ARRAY(),
       'favorable',
       'a. 有利的, 赞许的, 良好的 ｜ 原句：His comments about the book were favorable.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · favorite (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7101-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'favorite', JSON_ARRAY('favorite', 'favorites'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7101-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7101-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Winter is my ____ season.',
       JSON_ARRAY(),
       'favorite',
       'n. 喜欢的事物, 幸运儿 a. 特别受喜爱的, 喜爱的, 宠爱的, 中意的 ｜ 原句：Winter is my favorite season.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · favour (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7102-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'favour', JSON_ARRAY('favour', 'favours'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7102-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7102-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Could you do me a ____ please?',
       JSON_ARRAY(),
       'favour',
       'n. 好感, 偏爱, 喜爱, 相信, 庇护, 赞同, 支持, 信赖, 善行, 恩惠, 徽章, 礼物 vt. 赞成, 帮助, 支持, 喜爱, 偏袒, 关切, 赐与, 给与, 有利于, 有助于, 像, 体恤 ｜ 原句：Could you do me a favour please?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · favourable (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7103-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'favourable', JSON_ARRAY('favourable'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7103-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7103-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Another factor to be taken into consideration is that the present situation is ____ to us.',
       JSON_ARRAY(),
       'favourable',
       'a. 有用的, 良好的, 赞成的, 顺利的 [医] 良好的, 顺利的 ｜ 原句：Another factor to be taken into consideration is that the present situation is favourable to us.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · fear (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7105-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'fear', JSON_ARRAY('fear', 'fears'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7105-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7105-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'James had a great ____ of making mistakes in class and being reprimanded.',
       JSON_ARRAY(),
       'fear',
       'n. 恐怖, 害怕, 担心 v. 害怕, 恐惧, 为...担心, 敬畏 ｜ 原句：James had a great fear of making mistakes in class and being reprimanded.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · fearful (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7106-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'fearful', JSON_ARRAY('fearful'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7106-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7106-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'a shy and ____ child',
       JSON_ARRAY(),
       'fearful',
       'a. 可怕的, 恐怕的, 担心的 ｜ 原句：a shy and fearful child',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · feasible (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7107-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'feasible', JSON_ARRAY('feasible'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7107-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7107-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'We have come to the conclusion that this plan is not ____ currently.',
       JSON_ARRAY(),
       'feasible',
       'a. 能实行的, 可行的, 适宜的 [法] 可行的, 可执行的, 可完成的 ｜ 原句：We have come to the conclusion that this plan is not feasible currently.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · feather (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7109-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'feather', JSON_ARRAY('feather', 'feathers'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7109-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7109-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Birds of a ____ flock together.',
       JSON_ARRAY(),
       'feather',
       'n. 羽毛 vi. 长羽毛 vt. 用羽毛装饰 ｜ 原句：Birds of a feather flock together.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · feature (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7110-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'feature', JSON_ARRAY('feature', 'features'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7110-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7110-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The most important ____ of all games is that they are governed by rules.',
       JSON_ARRAY(),
       'feature',
       'n. 面孔的一部分(如眼、口等), 特征, 容貌, 特色, 特写 vt. 是...的特色, 特写, 放映 vi. 起重要作用 [计] 特性 ｜ 原句：The most important feature of all games is that they are governed by rules.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · federal (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7111-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'federal', JSON_ARRAY('federal'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7111-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7111-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The ____ Republic of Germany was established in 1949.',
       JSON_ARRAY(),
       'federal',
       'a. 联邦的, 联合的, 同盟的 [法] 联邦的, 联邦制的, 联盟的 ｜ 原句：The Federal Republic of Germany was established in 1949.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · fee (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7112-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'fee', JSON_ARRAY('fee', 'fees'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7112-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7112-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'How much is the monthly ____ of this swimming school?',
       JSON_ARRAY(),
       'fee',
       'n. 费用, 小费, 封地, 所有权 vt. 付费给 ｜ 原句：How much is the monthly fee of this swimming school?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · feeble (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7113-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'feeble', JSON_ARRAY('feeble', 'feebler', 'feeblest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7113-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7113-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'She was too ____ to leave her room.',
       JSON_ARRAY(),
       'feeble',
       'a. 微弱的, 衰弱的, 无效的 [医] 无力的, 衰弱的 ｜ 原句：She was too feeble to leave her room.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · feed (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7114-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'feed', JSON_ARRAY('feed', 'feeds'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7114-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7114-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I ____ my cat every morning and every evening.',
       JSON_ARRAY(),
       'feed',
       'n. 饲料, 一餐, 饲养 vt. 喂, 饲养, 放牧, 靠...为生 vi. 吃东西, 用餐, 流入 [计] 送纸 ｜ 原句：I feed my cat every morning and every evening.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · feedback (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7115-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'feedback', JSON_ARRAY('feedback', 'feedbacks'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7115-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7115-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The company welcomes ____ from consumers who use their products.',
       JSON_ARRAY(),
       'feedback',
       'n. 反馈, 反应 [计] 反馈 ｜ 原句：The company welcomes feedback from consumers who use their products.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · fellow (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7117-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'fellow', JSON_ARRAY('fellow', 'fellows'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7117-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7117-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Fred is a lazy ____.',
       JSON_ARRAY(),
       'fellow',
       'n. 男人, 朋友, 同事 a. 同伴的, 同事的, 同道的 ｜ 原句：Fred is a lazy fellow.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · female (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7118-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'female', JSON_ARRAY('female', 'females'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7118-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7118-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Mrs. Bruce was the first ____ pilot to fly between England and Japan.',
       JSON_ARRAY(),
       'female',
       'n. 女性, 女人, 雌性动物 a. 女性的, 女子的 ｜ 原句：Mrs. Bruce was the first female pilot to fly between England and Japan.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · fence (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7119-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'fence', JSON_ARRAY('fence', 'fences'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7119-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7119-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I didn''t need to paint the ____.',
       JSON_ARRAY(),
       'fence',
       'n. 围墙, 栅栏, 买卖赃物的人, 剑术 vt. 用篱笆围住, 练习剑术, 防护 vi. 击剑, 搪塞 ｜ 原句：I didn''t need to paint the fence.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · fertile (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7120-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'fertile', JSON_ARRAY('fertile'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7120-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7120-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The soil here is ____.',
       JSON_ARRAY(),
       'fertile',
       'a. 可繁殖的, 肥沃的, 生产多的 [医] 能生育的 ｜ 原句：The soil here is fertile.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · fertilizer (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7121-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'fertilizer', JSON_ARRAY('fertilizer', 'fertilizers'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7121-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7121-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'farming without any purchased chemical, ____ or pesticide',
       JSON_ARRAY(),
       'fertilizer',
       'n. 肥料, 促进发展者, 受精媒介物 [化] 肥料 ｜ 原句：farming without any purchased chemical, fertilizer or pesticide',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · festival (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7122-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'festival', JSON_ARRAY('festival'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7122-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7122-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'They helped one another to make the school ____ a success.',
       JSON_ARRAY(),
       'festival',
       'a. 节日的, 喜庆的, 快乐的 n. 节日, 庆祝, 欢宴 ｜ 原句：They helped one another to make the school festival a success.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · fetch (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7123-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'fetch', JSON_ARRAY('fetch', 'fetches'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7123-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7123-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Can you ____ the children from school?',
       JSON_ARRAY(),
       'fetch',
       'n. 取得, 拿, 诡计, 魂 vt. 接来, 取来, 售得, 带来, 推出, 引出, 杀死, 吸引, 到达 vi. 取物, 前进 [计] 取 ｜ 原句：Can you fetch the children from school?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · fever (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7124-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'fever', JSON_ARRAY('fever', 'fevers'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7124-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7124-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'You have a little ____ today, don''t you?',
       JSON_ARRAY(),
       'fever',
       'n. 发烧, 发热, 热病 [医] 发热, 热 ｜ 原句：You have a little fever today, don''t you?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · fibre (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7125-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'fibre', JSON_ARRAY('fibre', 'fibres'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7125-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7125-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Choose food low in fat, sugar and salt, and high in ____.',
       JSON_ARRAY(),
       'fibre',
       'n. 纤维, 构造, 纤维制品 [化] 纤维 ｜ 原句：Choose food low in fat, sugar and salt, and high in fibre.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · fiction (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7126-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'fiction', JSON_ARRAY('fiction', 'fictions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7126-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7126-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The ____ reduced girls to tears.',
       JSON_ARRAY(),
       'fiction',
       'n. 小说, 虚构故事 [法] 虚构的事实, 捏造, 拟制 ｜ 原句：The fiction reduced girls to tears.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · fight (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7128-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'fight', JSON_ARRAY('fight', 'fights', 'fought'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7128-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7128-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The argument ended in a ____.',
       JSON_ARRAY(),
       'fight',
       'n. 打架, 争吵, 斗志 v. 对抗, 打架 ｜ 原句：The argument ended in a fight.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · figure (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7129-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'figure', JSON_ARRAY('figure', 'figures'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7129-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7129-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Bill is still a legendary ____ in this company.',
       JSON_ARRAY(),
       'figure',
       'n. 数字, 价格, 图形, 形状 vt. 描绘, 表示, 演算, 认为 vi. 计算, 出现, 估计 ｜ 原句：Bill is still a legendary figure in this company.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · file (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7130-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'file', JSON_ARRAY('file', 'files'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7130-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7130-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'In which folder did you save the ____?',
       JSON_ARRAY(),
       'file',
       'n. 档案, 公文箱, 文件夹, 文件, 卷宗, 锉刀 vi. 列队行进, 用锉刀做 vt. 归档, 申请, 锉, 琢磨 [计] 文件 ｜ 原句：In which folder did you save the file?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · filter (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7131-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'filter', JSON_ARRAY('filter', 'filters'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7131-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7131-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He has no ____ for what he says.',
       JSON_ARRAY(),
       'filter',
       'n. 滤波器, 过滤器, 滤光器, 过滤嘴, 去尘器 vt. 过滤, 渗透, 走漏 vi. 滤过, 渗入 [计] 过滤器, 筛选 ｜ 原句：He has no filter for what he says.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · final (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7132-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'final', JSON_ARRAY('final', 'finals'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7132-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7132-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'We left the ____ decision to him.',
       JSON_ARRAY(),
       'final',
       'n. 期末考试, 结局, 决赛 a. 最后的, 终极的, 决定性的 ｜ 原句：We left the final decision to him.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · finally (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7133-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'finally', JSON_ARRAY('finally'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7133-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7133-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'With the heirless king going crazy and royal family poisoned, the general of the army ____ had his chance to usurp the throne.',
       JSON_ARRAY(),
       'finally',
       'adv. 最后, 终于 ｜ 原句：With the heirless king going crazy and royal family poisoned, the general of the army finally had his chance to usurp the throne.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · finance (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7134-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'finance', JSON_ARRAY('finance', 'finances'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7134-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7134-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He claimed to be an expert in ____.',
       JSON_ARRAY(),
       'finance',
       'n. 财政, 财务 vt. 供给...经费, 负担经费 vi. 筹措资金 ｜ 原句：He claimed to be an expert in finance.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · financial (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7135-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'financial', JSON_ARRAY('financial'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7135-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7135-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Russia is facing great ____ difficulties.',
       JSON_ARRAY(),
       'financial',
       'a. 财政的, 金融的 [经] 财政的, 金融的, 财务的 ｜ 原句：Russia is facing great financial difficulties.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · finding (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7136-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'finding', JSON_ARRAY('finding', 'findings'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7136-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7136-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'In London, the police are always worried about ____ a bomb on the train or subway.',
       JSON_ARRAY(),
       'finding',
       'n. 发现, 发现物, 决定, 裁决 [法] 调查结果, 对事实的认定, 判定的要素 ｜ 原句：In London, the police are always worried about finding a bomb on the train or subway.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · finger (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7137-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'finger', JSON_ARRAY('finger', 'fingers'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7137-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7137-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Cool the burned ____ in running water.',
       JSON_ARRAY(),
       'finger',
       'n. 手指, 指状物, (手套的)手指部分, 指针 v. 用手指拨弄, 伸出 [计] 网络命令 ｜ 原句：Cool the burned finger in running water.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · fireman (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7138-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'fireman', JSON_ARRAY('fireman', 'firemans'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7138-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7138-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '“Mum, what’s a ____?” “It’s like someone who does the watering of a building.”',
       JSON_ARRAY(),
       'fireman',
       'n. 救火队员, 消防队员 [机] 司炉 ｜ 原句：“Mum, what’s a fireman?” “It’s like someone who does the watering of a building.”',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · firm (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7139-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'firm', JSON_ARRAY('firm', 'firms'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7139-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7139-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The ____ went under due to lack of capital.',
       JSON_ARRAY(),
       'firm',
       'n. 公司, 商号 a. 坚定的, 坚强的, 牢固的, 结实的, 坚硬的, 坚挺的, 严格的, 确定的 vt. 使牢固, 使坚定 vi. 变稳固, 变坚实 adv. 稳固地 ｜ 原句：The firm went under due to lack of capital.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · fisherman (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7140-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'fisherman', JSON_ARRAY('fisherman', 'fishermans'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7140-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7140-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'My father is a skilled ____.',
       JSON_ARRAY(),
       'fisherman',
       'n. 渔夫, 钓鱼者, 渔船 ｜ 原句：My father is a skilled fisherman.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · fist (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7141-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'fist', JSON_ARRAY('fist', 'fists'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7141-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7141-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'She banged the table with her ____.',
       JSON_ARRAY(),
       'fist',
       'n. 拳头, 手 vt. 拳打, 握成拳, 紧握 ｜ 原句：She banged the table with her fist.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · fix (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7142-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'fix', JSON_ARRAY('fix', 'fixes', 'fixed', 'fixing'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7142-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7142-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Can I ____ you a hot drink?',
       JSON_ARRAY(),
       'fix',
       'vt. 使固定, 修理, 准备, 安装, 凝视, 牢记, 确定, 整理 vi. 固定, 注视, 确定 n. 困境, 方位, 维修, 贿赂 ｜ 原句：Can I fix you a hot drink?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · flame (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7144-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'flame', JSON_ARRAY('flame', 'flames'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7144-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7144-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Turn the ____ down low.',
       JSON_ARRAY(),
       'flame',
       'n. 火焰, 火舌, 热情, 光辉 vt. 焚烧, 用火焰给...灭菌, 用火焰传送(信号), 点燃, 激动 vi. 燃烧, 爆发, 闪耀 [计] 无聊邮件, 无益邮件 ｜ 原句：Turn the flame down low.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · flash (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7146-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'flash', JSON_ARRAY('flash', 'flashes'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7146-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7146-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I use ____ cards to study my German vocabulary.',
       JSON_ARRAY(),
       'flash',
       'n. 闪光, 闪现, 一瞬间 vi. 闪光, 闪现, 反射 vt. 使闪光, 反射 ｜ 原句：I use flash cards to study my German vocabulary.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · flat (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7147-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'flat', JSON_ARRAY('flat', 'flater', 'flatest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7147-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7147-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'It used to be thought that the earth was ____.',
       JSON_ARRAY(),
       'flat',
       'a. 平坦的, 单调的, 无力的, 浅的, 萧条的, 干脆的, 无聊的 adv. 平直地, 断然地 n. 扁平物, 平面, 平地, 平原, 平板车 v. (使)变平 ｜ 原句：It used to be thought that the earth was flat.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · flavour (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7148-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'flavour', JSON_ARRAY('flavour', 'flavours'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7148-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7148-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'If and only if the ice-cream is vanilla ____ will Xiao Wang eat it.',
       JSON_ARRAY(),
       'flavour',
       'n. 味, 调味香料, 滋味, 香味, 气味, 风味, 情味, 情趣, 风韵 vt. 给...调味, 给...增添风趣, 加香料, 加味于 ｜ 原句：If and only if the ice-cream is vanilla flavour will Xiao Wang eat it.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · fleet (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7150-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'fleet', JSON_ARRAY('fleet', 'fleets'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7150-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7150-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'the US seventh ____',
       JSON_ARRAY(),
       'fleet',
       'n. 舰队, 港湾, 小河 a. 快速的, 敏捷的, 浅的, 短暂的 adv. 浅 vi. 疾驰, 飞逝, 掠过 vt. 消磨, 变换船(或船员)的位置 ｜ 原句：the US seventh fleet',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · flesh (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7151-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'flesh', JSON_ARRAY('flesh', 'fleshes'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7151-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7151-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The spirit is willing, but the ____ is weak.',
       JSON_ARRAY(),
       'flesh',
       'n. 肉, 肉体, 肉欲, 人性, 亲属, 人类, 众生, 人体 vt. 以肉喂, 激起...的杀戳情绪, 使肥, 赋以血肉 vi. 长胖 ｜ 原句：The spirit is willing, but the flesh is weak.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · float (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7152-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'float', JSON_ARRAY('float', 'floats'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7152-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7152-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The substance is light enough to ____ on the water.',
       JSON_ARRAY(),
       'float',
       'n. 漂流物, 浮舟, 漂浮, 浮萍, 彩车 vi. 浮动, 飘动, 散播, 摇摆, 动摇, 浮动 vt. 使漂浮, 容纳, 淹没, 发行, 实行 [计] 浮动 ｜ 原句：The substance is light enough to float on the water.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · flock (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7153-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'flock', JSON_ARRAY('flock', 'flocks'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7153-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7153-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Birds of a feather ____ together.',
       JSON_ARRAY(),
       'flock',
       'n. 兽群, 鸟群, 一群人, 大量, 棉束 vi. 成群而行, 聚集 vt. 用棉束填满 ｜ 原句：Birds of a feather flock together.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · flood (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7154-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'flood', JSON_ARRAY('flood', 'floods'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7154-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7154-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Several cottages have been isolated by the ____ water.',
       JSON_ARRAY(),
       'flood',
       'n. 洪水, 大量之水, 涨潮 vt. 淹没, 使泛滥, 注满 vi. 被淹, 溢出, 涌进 ｜ 原句：Several cottages have been isolated by the flood water.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · flour (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7155-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'flour', JSON_ARRAY('flour', 'flours'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7155-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7155-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Bread is made from ____, water, and often yeast.',
       JSON_ARRAY(),
       'flour',
       'n. 面粉, 粉沫, 碎粉 [医] 面粉, 麦粉 ｜ 原句：Bread is made from flour, water, and often yeast.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · flow (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7156-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'flow', JSON_ARRAY('flow', 'flows'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7156-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7156-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The immigrants entered the country in a steady ____.',
       JSON_ARRAY(),
       'flow',
       'n. 流程, 流动, 流量, 洋溢, 泛滥, 涨潮 vi. 流动, 流泄, 畅流, 川流不息, 飘扬, 涌出 vt. 使流动, 淹没, 流出 ｜ 原句：The immigrants entered the country in a steady flow.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · flu (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7157-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'flu', JSON_ARRAY('flu', 'flus'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7157-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7157-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I''ve got a touch of the ____.',
       JSON_ARRAY(),
       'flu',
       'n. 流感, 流行性感冒 ｜ 原句：I''ve got a touch of the flu.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · fluent (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7158-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'fluent', JSON_ARRAY('fluent', 'fluenter', 'fluentest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7158-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7158-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'You will be able to speak ____ English in another few months.',
       JSON_ARRAY(),
       'fluent',
       'a. 流利的, 流畅的 ｜ 原句：You will be able to speak fluent English in another few months.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · fluid (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7159-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'fluid', JSON_ARRAY('fluid', 'fluids'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7159-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7159-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'My correction ____ has run out, so now I only write in pencil.',
       JSON_ARRAY(),
       'fluid',
       'n. 液体, 分泌液, 流体 a. 流动的, 可改变的 ｜ 原句：My correction fluid has run out, so now I only write in pencil.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · flush (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7160-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'flush', JSON_ARRAY('flush', 'flushes'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7160-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7160-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Don''t forget to ____ the toilet.',
       JSON_ARRAY(),
       'flush',
       'n. 流溢, 面红, 旺盛, 发烧, 惊飞的鸟, 同花牌 a. 丰足的, 齐平的, 满盈的, 泛滥的 adv. 齐平地, 直接地 vi. 脸发红, 奔涌, 旺盛, 惊飞 vt. 淹没, 冲洗, 使脸红, 使激动, 使齐平, 使惊飞 ｜ 原句：Don''t forget to flush the toilet.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · focus (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7161-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'focus', JSON_ARRAY('focus', 'focuses'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7161-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7161-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'These days many young people work without much ____; my friend''s son hadn''t gone two years after graduating before he''d changed jobs five times.',
       JSON_ARRAY(),
       'focus',
       'n. 焦点, 焦距 vi. 聚焦, 注视 vt. 使聚焦, 调焦, 集中 [计] 焦点 ｜ 原句：These days many young people work without much focus; my friend''s son hadn''t gone two years after graduating before he''d changed jobs five times.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · fog (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7162-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'fog', JSON_ARRAY('fog', 'fogs'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7162-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7162-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'London is famous for its ____.',
       JSON_ARRAY(),
       'fog',
       'n. 雾, 迷惑, (割后的)最生草, 苔藓 vi. 被雾笼罩, 变模糊 vt. 使困惑, 以雾笼罩 ｜ 原句：London is famous for its fog.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · folk (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7164-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'folk', JSON_ARRAY('folk', 'folks'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7164-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7164-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I’m sure there are some ____ who would rather they weren’t here.',
       JSON_ARRAY(),
       'folk',
       'n. 人们, 家人, 亲属, 民族 a. 民间的 ｜ 原句：I’m sure there are some folk who would rather they weren’t here.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · follow (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7165-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'follow', JSON_ARRAY('follow', 'follows', 'followed', 'following'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7165-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7165-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'All you have to do is ____ his advice.',
       JSON_ARRAY(),
       'follow',
       'vt. 跟随, 沿行, 遵循, 追求 vi. 跟随, 接着 n. 跟随, 追随 ｜ 原句：All you have to do is follow his advice.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · following (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7166-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'following', JSON_ARRAY('following', 'followings'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7166-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7166-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The ____ is a summary of the President''s speech.',
       JSON_ARRAY(),
       'following',
       'n. 下列各项, 部下, 追随者 a. 下列的, 其次的 ｜ 原句：The following is a summary of the President''s speech.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · fond (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7167-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'fond', JSON_ARRAY('fond', 'fonder', 'fondest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7167-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7167-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'What are you ____ of?',
       JSON_ARRAY(),
       'fond',
       'a. 喜欢的, 宠爱的, 温柔的 ｜ 原句：What are you fond of?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · fool (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7168-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'fool', JSON_ARRAY('fool', 'fools'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7168-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7168-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Do you take me for a ____?',
       JSON_ARRAY(),
       'fool',
       'n. 愚人, 受骗者, 奶油拌水果 vt. 愚弄, 欺骗, 浪费 vi. 干傻事, 开玩笑, 游荡 a. 傻的 ｜ 原句：Do you take me for a fool?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · foolish (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7169-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'foolish', JSON_ARRAY('foolish'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7169-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7169-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'You must put an end to this ____ behavior.',
       JSON_ARRAY(),
       'foolish',
       'a. 愚蠢的, 傻的 ｜ 原句：You must put an end to this foolish behavior.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · footstep (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7170-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'footstep', JSON_ARRAY('footstep', 'footsteps'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7170-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7170-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He heard someone’s ____ in the hall.',
       JSON_ARRAY(),
       'footsteps',
       'n. 脚步, 脚步声, 足迹 ｜ 原句：He heard someone’s footsteps in the hall.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · forbid (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7171-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'forbid', JSON_ARRAY('forbid', 'forbids'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7171-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7171-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I cannot ____ a person to marry several wives, for it does not contradict Scripture.',
       JSON_ARRAY(),
       'forbid',
       'vt. 禁止, 不准, 妨碍 [法] 不许, 禁止, 阻止 ｜ 原句：I cannot forbid a person to marry several wives, for it does not contradict Scripture.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · force (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7172-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'force', JSON_ARRAY('force', 'forces'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7172-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7172-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I will never ____ you to marry him.',
       JSON_ARRAY(),
       'force',
       'n. 力量, 武力, 势力, 影响力, 军队, 力, 效力 vt. 强迫, 强夺, 推动, 提高 [计] 人工转移; 强制 ｜ 原句：I will never force you to marry him.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · forecast (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7173-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'forecast', JSON_ARRAY('forecast', 'forecasts'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7173-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7173-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'What''s the ____ for tomorrow?',
       JSON_ARRAY(),
       'forecast',
       'n. 预想, 预测, 预报 vt. 预想, 预测, 预报 [计] 趋势预测 ｜ 原句：What''s the forecast for tomorrow?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · forehead (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7174-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'forehead', JSON_ARRAY('forehead', 'foreheads'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7174-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7174-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'My ____ burned with fever.',
       JSON_ARRAY(),
       'forehead',
       'n. 额, 前额, 前部 [医] 额 ｜ 原句：My forehead burned with fever.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · foreigner (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7175-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'foreigner', JSON_ARRAY('foreigner', 'foreigners'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7175-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7175-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'His accent suggests he is a ____.',
       JSON_ARRAY(),
       'foreigner',
       'n. 外国人, 外地人 [法] 外国人, 进口货, 外国货 ｜ 原句：His accent suggests he is a foreigner.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · foremost (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7176-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'foremost', JSON_ARRAY('foremost'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7176-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7176-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Economic concerns are ____ on many voters’ minds.',
       JSON_ARRAY(),
       'foremost',
       'a. 最初的, 最重要的 adv. 在最前 ｜ 原句：Economic concerns are foremost on many voters’ minds.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · forest (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7177-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'forest', JSON_ARRAY('forest', 'forests'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7177-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7177-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The ____ is teeming with monkeys.',
       JSON_ARRAY(),
       'forest',
       'n. 森林, 林区 vt. 植树于 ｜ 原句：The forest is teeming with monkeys.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · forever (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7178-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'forever', JSON_ARRAY('forever'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7178-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7178-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'It would take ____ for me to explain everything.',
       JSON_ARRAY(),
       'forever',
       'adv. 永远 ｜ 原句：It would take forever for me to explain everything.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · forgive (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7179-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'forgive', JSON_ARRAY('forgive', 'forgives', 'forgived', 'forgiving'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7179-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7179-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'To err is human, to ____ divine.',
       JSON_ARRAY(),
       'forgive',
       'vt. 原谅, 宽恕, 免除 [法] 免除, 宽恕, 原谅 ｜ 原句：To err is human, to forgive divine.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · fork (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7180-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'fork', JSON_ARRAY('fork', 'forks'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7180-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7180-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'A ____ fell off the table.',
       JSON_ARRAY(),
       'fork',
       'n. 叉子, 叉状物, 分岔 vi. 分支, 分歧 vt. 做成叉形, 叉起 [计] 派生指令 ｜ 原句：A fork fell off the table.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · formal (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7181-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'formal', JSON_ARRAY('formal'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7181-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7181-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'How ____ is this ceremony?',
       JSON_ARRAY(),
       'formal',
       'a. 正式的, 形式的, 礼仪的, 拘于礼节的, 拘谨的 n. 正式的社交活动 ｜ 原句：How formal is this ceremony?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · formation (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7182-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'formation', JSON_ARRAY('formation', 'formations'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7182-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7182-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Fundamentally, the ____ of the twelve zodiac signs is related to animal worship.',
       JSON_ARRAY(),
       'formation',
       'n. 形成, 构造, 编队 [医] 形成, 结构 ｜ 原句：Fundamentally, the formation of the twelve zodiac signs is related to animal worship.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · former (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7183-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'former', JSON_ARRAY('former', 'formerer', 'formerest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7183-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7183-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Kyoto was the ____ capital of Japan.',
       JSON_ARRAY(),
       'former',
       'a. 从前的, 前者的 n. 起形成作用的人(或物), 模型, 样板 ｜ 原句：Kyoto was the former capital of Japan.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · formula (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7184-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'formula', JSON_ARRAY('formula', 'formulas'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7184-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7184-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The chemical ____ for water is H-O-H.',
       JSON_ARRAY(),
       'formula',
       'n. 客套语, 公式, 准则 [计] 公式 ｜ 原句：The chemical formula for water is H-O-H.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · forth (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7185-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'forth', JSON_ARRAY('forth', 'forther', 'forthest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7185-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7185-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He asked me my age, my name, my address, and so ____.',
       JSON_ARRAY(),
       'forth',
       'adv. 往前, 以后, 向外 ｜ 原句：He asked me my age, my name, my address, and so forth.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · fortnight (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7186-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'fortnight', JSON_ARRAY('fortnight', 'fortnights'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7186-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7186-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'We want to go to the Alps for a ____.',
       JSON_ARRAY(),
       'fortnight',
       'n. 两星期 ｜ 原句：We want to go to the Alps for a fortnight.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · fortunate (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7187-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'fortunate', JSON_ARRAY('fortunate'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7187-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7187-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'You are very ____ that you have such friends.',
       JSON_ARRAY(),
       'fortunate',
       'a. 幸运的, 幸福的 ｜ 原句：You are very fortunate that you have such friends.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · fortunately (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7188-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'fortunately', JSON_ARRAY('fortunately'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7188-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7188-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '____, everybody understood what this foreigner meant, knew I was only making a fool of myself, and laughed at me.',
       JSON_ARRAY(),
       'fortunately',
       'adv. 幸运地, 幸亏 ｜ 原句：Fortunately, everybody understood what this foreigner meant, knew I was only making a fool of myself, and laughed at me.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · fortune (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7189-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'fortune', JSON_ARRAY('fortune', 'fortunes'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7189-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7189-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Fred left his wife a large ____.',
       JSON_ARRAY(),
       'fortune',
       'n. 财富, 运气, 兴隆, 大量财产, 好运, 命运 [法] 命运, 财产, 大量财产 ｜ 原句：Fred left his wife a large fortune.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · found (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7190-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'found', JSON_ARRAY('found', 'founds', 'founded', 'founding'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7190-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7190-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'On May 18, a young Japanese couple was arrested after their one-year-old baby was ____ wrapped in a plastic bag and dumped in a gutter.',
       JSON_ARRAY(),
       'found',
       'vt. 建立, 创立, 铸造 find的过去式和过去分词 ｜ 原句：On May 18, a young Japanese couple was arrested after their one-year-old baby was found wrapped in a plastic bag and dumped in a gutter.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · foundation (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7191-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'foundation', JSON_ARRAY('foundation', 'foundations'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7191-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7191-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The rumor was without ____.',
       JSON_ARRAY(),
       'foundation',
       'n. 基础, 根据, 建立 [化] 地基 ｜ 原句：The rumor was without foundation.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · fountain (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7192-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'fountain', JSON_ARRAY('fountain', 'fountains'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7192-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7192-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I have lost my new ____ pen.',
       JSON_ARRAY(),
       'fountain',
       'n. 水源, 源, 喷泉, 泉水, 本源 [医] 泉 ｜ 原句：I have lost my new fountain pen.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · fox (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7193-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'fox', JSON_ARRAY('fox', 'foxes'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7193-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7193-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'A ____ is not caught twice in the same snare.',
       JSON_ARRAY(),
       'fox',
       'n. 狐狸, 狡猾的人 vi. 奸狡地行动, (书页)生斑, 变酸 vt. 欺骗, 使变酸, 为(鞋等)换面, 使生黄斑 ｜ 原句：A fox is not caught twice in the same snare.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · fraction (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7194-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'fraction', JSON_ARRAY('fraction', 'fractions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7194-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7194-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I got these shoes at a ____ of the original price.',
       JSON_ARRAY(),
       'fraction',
       'n. 小部分, 破片, 分数 [医] 部分, 成分, 分散 ｜ 原句：I got these shoes at a fraction of the original price.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · frame (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7196-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'frame', JSON_ARRAY('frame', 'frames'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7196-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7196-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The ____ itself is worth more than the picture.',
       JSON_ARRAY(),
       'frame',
       'n. 框, 结构, 体格 vt. 构成, 设计, 制定, 使适合, 陷害 [计] 框架, 图文框, 帧 ｜ 原句：The frame itself is worth more than the picture.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · framework (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7197-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'framework', JSON_ARRAY('framework', 'frameworks'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7197-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7197-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The whole ____ was made of iron.',
       JSON_ARRAY(),
       'framework',
       'n. 结构, 骨架, 参照标准, 准则, 观点 [医] 构架组织 ｜ 原句：The whole framework was made of iron.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · frank (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7199-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'frank', JSON_ARRAY('frank', 'franker', 'frankest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7199-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7199-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '____ was waiting with pleasure for the date in the evening.',
       JSON_ARRAY(),
       'frank',
       'a. 坦白的, 率直的, 老实的 vt. 免费邮寄 n. 免费邮寄特权 ｜ 原句：Frank was waiting with pleasure for the date in the evening.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · freedom (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7200-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'freedom', JSON_ARRAY('freedom', 'freedoms'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7200-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7200-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '____ is not free.',
       JSON_ARRAY(),
       'freedom',
       'n. 自由, 坦率, 特权 [法] 自由, 自主, 免除 ｜ 原句：Freedom is not free.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · freely (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7201-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'freely', JSON_ARRAY('freely', 'freelier', 'freeliest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7201-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7201-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The advantage of freelancing is that you can divide your time ____. The disadvantage is that you actually have to work around the clock.',
       JSON_ARRAY(),
       'freely',
       'adv. 自由地, 随意地, 无拘束地, 直率地, 坦白地, 慷慨地, 免费地, 大量地 [计] 浮动地 ｜ 原句：The advantage of freelancing is that you can divide your time freely. The disadvantage is that you actually have to work around the clock.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · freeze (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7202-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'freeze', JSON_ARRAY('freeze', 'freezes', 'freezed', 'freezing', 'freeses', 'freesed', 'freesing', 'froze', 'frozen'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7202-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7202-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'It may ____ next week.',
       JSON_ARRAY(),
       'freeze',
       'vi. 冻结, 冷冻, 僵硬, 楞住 vt. 使结冰, 使冻住, 使呆住 n. 结冰, 凝固 [计] 冻结 ｜ 原句：It may freeze next week.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · frequency (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7204-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'frequency', JSON_ARRAY('frequency', 'frequencies'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7204-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7204-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The recent ____ of earthquakes makes us nervous.',
       JSON_ARRAY(),
       'frequency',
       'n. 频率, 频数 [计] 频率 ｜ 原句：The recent frequency of earthquakes makes us nervous.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · frequent (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7205-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'frequent', JSON_ARRAY('frequent'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7205-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7205-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'They make ____ trips to Europe.',
       JSON_ARRAY(),
       'frequent',
       'a. 时常发生的, 频繁的, 快速的 vt. 时常来访, 常常聚集, 常与...交往 ｜ 原句：They make frequent trips to Europe.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · frequently (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7206-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'frequently', JSON_ARRAY('frequently'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7206-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7206-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The fact that television ____ limits communication within families is already well known.',
       JSON_ARRAY(),
       'frequently',
       'adv. 频繁, 经常地 ｜ 原句：The fact that television frequently limits communication within families is already well known.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · fresh (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7207-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'fresh', JSON_ARRAY('fresh', 'fresher', 'freshest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7207-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7207-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'It is still ____ in my memory.',
       JSON_ARRAY(),
       'fresh',
       'a. 新鲜的, 新奇的, 另外的, 淡的, 精神饱满的, 冒失的 adv. 最新地, 刚刚 n. 开始, 泛滥 ｜ 原句：It is still fresh in my memory.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · friction (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7208-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'friction', JSON_ARRAY('friction', 'frictions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7208-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7208-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'the usual ____ between parents and their teenage children',
       JSON_ARRAY(),
       'frictions',
       'n. 摩擦, 摩擦治疗, 不和 [医] 摩擦 ｜ 原句：the usual frictions between parents and their teenage children',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · fridge (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7209-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'fridge', JSON_ARRAY('fridge', 'fridges'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7209-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7209-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'In a dictionary like this one there should be at least two sentences with "____".',
       JSON_ARRAY(),
       'fridge',
       'n. 电冰箱 ｜ 原句：In a dictionary like this one there should be at least two sentences with "fridge".',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · frighten (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7210-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'frighten', JSON_ARRAY('frighten', 'frightens'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7210-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7210-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Scary movies will ____ the children.',
       JSON_ARRAY(),
       'frighten',
       'vt. 使惊吓 vi. 惊恐 ｜ 原句：Scary movies will frighten the children.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · frog (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7211-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'frog', JSON_ARRAY('frog', 'frogs'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7211-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7211-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I''ve got a ____ in my throat.',
       JSON_ARRAY(),
       'frog',
       'n. 青蛙 [医] 蛙, 马蹄叉 ｜ 原句：I''ve got a frog in my throat.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · frontier (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7212-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'frontier', JSON_ARRAY('frontier', 'frontiers'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7212-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7212-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Lille is close to the ____ between France and Belgium.',
       JSON_ARRAY(),
       'frontier',
       'n. 边界, 边境 [法] 国境, 边境, 边界 ｜ 原句：Lille is close to the frontier between France and Belgium.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · frost (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7213-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'frost', JSON_ARRAY('frost', 'frosts'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7213-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7213-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'We had a heavy ____ this morning.',
       JSON_ARRAY(),
       'frost',
       'n. 霜, 冰冻, 冷漠 vt. 覆着霜, 冻结, 结霜 vi. 受冻, 起霜 ｜ 原句：We had a heavy frost this morning.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · frustrate (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7216-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'frustrate', JSON_ARRAY('frustrate', 'frustrates', 'frustrated', 'frustrating'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7216-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7216-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The fact that he’s working with amateurs really ____ him.',
       JSON_ARRAY(),
       'frustrates',
       'vt. 挫败, 击败, 破坏 a. 无益的, 挫败的, 挫折的 ｜ 原句：The fact that he’s working with amateurs really frustrates him.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · fry (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7217-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'fry', JSON_ARRAY('fry', 'fries'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7217-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7217-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I cannot ____ these eggs. They are rotten.',
       JSON_ARRAY(),
       'fry',
       'n. 油炸食物, 鱼苗 v. 油炸, 煎 ｜ 原句：I cannot fry these eggs. They are rotten.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · fuel (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7218-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'fuel', JSON_ARRAY('fuel', 'fuels'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7218-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7218-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'There was a shortage of ____.',
       JSON_ARRAY(),
       'fuel',
       'n. 燃料, 木炭 vt. 加燃料, 供燃料 vi. 得到燃料 ｜ 原句：There was a shortage of fuel.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · fulfil (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7219-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'fulfil', JSON_ARRAY('fulfil', 'fulfils'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7219-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7219-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'There is little doubt that the scheme ____ a need for our community.',
       JSON_ARRAY(),
       'fulfils',
       'vt. 实践, 履行, 实行, 完成, 结束, 满足 [经] 履行(契约), 满期 ｜ 原句：There is little doubt that the scheme fulfils a need for our community.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · function (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7220-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'function', JSON_ARRAY('function', 'functions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7220-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7220-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The ____ of the brake is to stop the car.',
       JSON_ARRAY(),
       'function',
       'n. 官能, 职务, 功能, 函数 vi. 活动, 运行, 行使职责 [计] 功能, 函数 ｜ 原句：The function of the brake is to stop the car.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · fund (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7221-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'fund', JSON_ARRAY('fund', 'funds'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7221-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7221-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Lobbyists for the bill funneled bribes into a campaign ____.',
       JSON_ARRAY(),
       'fund',
       'n. 基金, 资金, 存款, 财源, 贮藏 vt. 提供资金, 积累 ｜ 原句：Lobbyists for the bill funneled bribes into a campaign fund.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · fundamental (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7222-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'fundamental', JSON_ARRAY('fundamental', 'fundamentals'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7222-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7222-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Respect for law is ____ to our society.',
       JSON_ARRAY(),
       'fundamental',
       'n. 基本原理, 原则, 基波 a. 基本的, 重要的, 原音的 ｜ 原句：Respect for law is fundamental to our society.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · funeral (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7223-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'funeral', JSON_ARRAY('funeral', 'funerals'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7223-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7223-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'At lunchtime today, our usual restaurant was closed because of a ____ in the family.',
       JSON_ARRAY(),
       'funeral',
       'n. 葬礼, 出殡 ｜ 原句：At lunchtime today, our usual restaurant was closed because of a funeral in the family.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · funny (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7224-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'funny', JSON_ARRAY('funny', 'funnier', 'funniest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7224-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7224-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The teacher told us a ____ story.',
       JSON_ARRAY(),
       'funny',
       'a. 好笑的, 有趣的, 滑稽的 n. 滑稽人物 ｜ 原句：The teacher told us a funny story.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · fur (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7225-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'fur', JSON_ARRAY('fur', 'furs'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7225-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7225-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Her coat is ____ on the inside.',
       JSON_ARRAY(),
       'fur',
       'n. 毛皮 vt. 以毛皮制作, 使生苔, 使生水垢 vi. 生苔, 积水垢 ｜ 原句：Her coat is fur on the inside.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · furious (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7226-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'furious', JSON_ARRAY('furious'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7226-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7226-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Even though he apologized, I''m still ____.',
       JSON_ARRAY(),
       'furious',
       'a. 狂怒的, 激烈的, 吵闹的 ｜ 原句：Even though he apologized, I''m still furious.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · furnace (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7227-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'furnace', JSON_ARRAY('furnace', 'furnaces'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7227-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7227-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'It''s like a ____ (= very hot) in here!',
       JSON_ARRAY(),
       'furnace',
       'n. 火炉, 熔炉, 考验 vt. 在炉中烧 ｜ 原句：It''s like a furnace (= very hot) in here!',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · furnish (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7228-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'furnish', JSON_ARRAY('furnish', 'furnishes', 'furnished', 'furnishing'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7228-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7228-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Will these finds ____ more information on prehistoric man?',
       JSON_ARRAY(),
       'furnish',
       'vt. 供给, 提供, 装设 [化] 供应; 供给; 配料 ｜ 原句：Will these finds furnish more information on prehistoric man?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · furniture (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7229-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'furniture', JSON_ARRAY('furniture', 'furnitures'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7229-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7229-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'All the ____ was covered with dust.',
       JSON_ARRAY(),
       'furniture',
       'n. 家具, 帆具 ｜ 原句：All the furniture was covered with dust.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · further (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7230-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'further', JSON_ARRAY('further'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7230-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7230-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'You will find it stated a few pages ____ on.',
       JSON_ARRAY(),
       'further',
       'a. 更远的, 此外的, 更多的 vt. 促进, 增进, 助长 adv. 更进一步地, 更远地, 此外 ｜ 原句：You will find it stated a few pages further on.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · furthermore (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7231-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'furthermore', JSON_ARRAY('furthermore'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7231-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7231-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '____, I still don''t think this a huge cultural difference.',
       JSON_ARRAY(),
       'furthermore',
       'adv. 此外, 而且 ｜ 原句：Furthermore, I still don''t think this a huge cultural difference.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · gallery (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7233-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'gallery', JSON_ARRAY('gallery', 'galleries'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7233-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7233-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'an exhibition of African art at the Hayward ____',
       JSON_ARRAY(),
       'gallery',
       'n. 走廊, 最高楼座, 画廊, 收集, 图库 [计] 图库 ｜ 原句：an exhibition of African art at the Hayward Gallery',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · gallon (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7234-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'gallon', JSON_ARRAY('gallon', 'gallons'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7234-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7234-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'a 20 ____ fish tank',
       JSON_ARRAY(),
       'gallon',
       'n. 加仑 [医] 加仑 ｜ 原句：a 20 gallon fish tank',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · gang (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7235-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'gang', JSON_ARRAY('gang', 'gangs'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7235-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7235-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The ____ was planning a robbery.',
       JSON_ARRAY(),
       'gang',
       'n. 队, 群, 帮 vi. 成群结队, 结成一伙 vt. 使成群结队 ｜ 原句：The gang was planning a robbery.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · gap (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7236-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'gap', JSON_ARRAY('gap', 'gaps'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7236-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7236-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'In the London underground there is a warning to "mind the ____" when boarding the train.',
       JSON_ARRAY(),
       'gap',
       'n. 缝隙, 缺口, 间断, 间距, 通用汇编程序 vt. 打开缺口, 造成缝隙 vi. 豁开 [计] 通用汇编程序, 图形应用程序, 间距 ｜ 原句：In the London underground there is a warning to "mind the gap" when boarding the train.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · garage (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7237-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'garage', JSON_ARRAY('garage', 'garages'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7237-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7237-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I rented a house with a ____.',
       JSON_ARRAY(),
       'garage',
       'n. 车库, 汽车修理厂, 机库 vt. 把车送入修车场 ｜ 原句：I rented a house with a garage.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · garbage (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7238-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'garbage', JSON_ARRAY('garbage', 'garbages'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7238-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7238-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He had gone there to help ____ workers strike peacefully for better pay and working conditions.',
       JSON_ARRAY(),
       'garbage',
       'n. 垃圾, 废物 [计] 无用信息 ｜ 原句：He had gone there to help garbage workers strike peacefully for better pay and working conditions.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · gardener (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7239-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'gardener', JSON_ARRAY('gardener', 'gardeners'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7239-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7239-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The ____ planted a rose tree in the middle of the garden.',
       JSON_ARRAY(),
       'gardener',
       'n. 园丁, 花匠, 园艺家 ｜ 原句：The gardener planted a rose tree in the middle of the garden.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · gas (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7240-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'gas', JSON_ARRAY('gas'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7240-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7240-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'My car burns a lot of ____.',
       JSON_ARRAY(),
       'gas',
       'n. 气体, 汽油, 瓦斯 [化] 气体; 煤气; 瓦斯; 毒气 ｜ 原句：My car burns a lot of gas.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · gaseous (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7241-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'gaseous', JSON_ARRAY('gaseous'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7241-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7241-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Freon exists both in liquid and ____ states.',
       JSON_ARRAY(),
       'gaseous',
       'a. 气体的, 气态的, 无实质的 [医] 气[体]的 ｜ 原句：Freon exists both in liquid and gaseous states.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · gasoline (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7242-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'gasoline', JSON_ARRAY('gasoline', 'gasolines'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7242-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7242-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'There is a good chance that ____ prices will go up.',
       JSON_ARRAY(),
       'gasoline',
       'n. 汽油 [化] 汽油 ｜ 原句：There is a good chance that gasoline prices will go up.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · gather (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7244-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'gather', JSON_ARRAY('gather', 'gathers'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7244-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7244-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'You must ____ further information.',
       JSON_ARRAY(),
       'gather',
       'n. 集合, 聚集 vi. 聚集, 集合, 渐增 vt. 使聚集, 搜集, 积聚 ｜ 原句：You must gather further information.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · gauge (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7245-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'gauge', JSON_ARRAY('gauge', 'gauges'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7245-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7245-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The fuel ____ is broken.',
       JSON_ARRAY(),
       'gauge',
       'n. 标准度量, 计量器 vt. 精确计量, 估计 [计] 线规 ｜ 原句：The fuel gauge is broken.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · gay (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7246-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'gay', JSON_ARRAY('gay', 'gayer', 'gayest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7246-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7246-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'And if I were ____, would that be a crime?',
       JSON_ARRAY(),
       'gay',
       'a. 欢快的, 艳丽的, 快乐的, 放荡的 ｜ 原句：And if I were gay, would that be a crime?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · gear (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7248-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'gear', JSON_ARRAY('gear', 'gears'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7248-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7248-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Do you have rain ____ with you?',
       JSON_ARRAY(),
       'gear',
       'n. 齿轮, 工具 vt. 以齿轮连起, 开动, 使适应, 安排 vi. 连接上, 适合 ｜ 原句：Do you have rain gear with you?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · gene (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7249-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'gene', JSON_ARRAY('gene', 'genes'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7249-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7249-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Some diseases are caused by a defective ____.',
       JSON_ARRAY(),
       'gene',
       'n. 基因 [化] 基因(遗传因子) ｜ 原句：Some diseases are caused by a defective gene.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · general (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7250-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'general', JSON_ARRAY('general', 'generals'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7250-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7250-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'With the heirless king going crazy and royal family poisoned, the ____ of the army finally had his chance to usurp the throne.',
       JSON_ARRAY(),
       'general',
       'n. 一般, 将军, 大体 a. 全面的, 大体的, 总的, 一般的, 普遍的 n. 常规 [计] 常规 ｜ 原句：With the heirless king going crazy and royal family poisoned, the general of the army finally had his chance to usurp the throne.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · generally (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7251-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'generally', JSON_ARRAY('generally'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7251-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7251-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Korean food is ____ very spicy.',
       JSON_ARRAY(),
       'generally',
       'adv. 通常, 逐渐地, 普遍地 ｜ 原句：Korean food is generally very spicy.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · generate (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7252-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'generate', JSON_ARRAY('generate', 'generates', 'generated', 'generating'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7252-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7252-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'An electric current can ____ magnetism.',
       JSON_ARRAY(),
       'generate',
       'vt. 产生, 发生, 导致 [电] 产生 ｜ 原句：An electric current can generate magnetism.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · generation (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7253-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'generation', JSON_ARRAY('generation', 'generations'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7253-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7253-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The proliferation of Internet usage has given birth to a new ____ of young people.',
       JSON_ARRAY(),
       'generation',
       'n. 一代, 一世, 产生 [医] 生殖, 世代 ｜ 原句：The proliferation of Internet usage has given birth to a new generation of young people.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · generator (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7254-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'generator', JSON_ARRAY('generator', 'generators'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7254-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7254-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'an emergency ____',
       JSON_ARRAY(),
       'generator',
       'n. 产生器, 发电机, 生产者 [计] 发生器 ｜ 原句：an emergency generator',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · generous (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7255-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'generous', JSON_ARRAY('generous'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7255-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7255-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Do you want another cup of coffee? "Sure, make mine on the small side but be ____ with my brother''s."',
       JSON_ARRAY(),
       'generous',
       'a. 慷慨的, 有雅量的, 大量的, 丰富的 ｜ 原句：Do you want another cup of coffee? "Sure, make mine on the small side but be generous with my brother''s."',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · genetic (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7256-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'genetic', JSON_ARRAY('genetic'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7256-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7256-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Should we use ____ engineering on people?',
       JSON_ARRAY(),
       'genetic',
       'a. 创始的, 遗传的, 起源的, 遗传学的 [医] 生殖的, 遗传的 ｜ 原句：Should we use genetic engineering on people?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · genius (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7257-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'genius', JSON_ARRAY('genius', 'geniuses'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7257-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7257-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Einstein was a mathematical ____.',
       JSON_ARRAY(),
       'genius',
       'n. 天才, 天赋, 精神, 神魔 [医] 特征 ｜ 原句：Einstein was a mathematical genius.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · gentle (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7258-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'gentle', JSON_ARRAY('gentle', 'gentler', 'gentlest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7258-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7258-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'A ____ wind made ripples on the surface of the pond.',
       JSON_ARRAY(),
       'gentle',
       'a. 温和的, 文雅的 ｜ 原句：A gentle wind made ripples on the surface of the pond.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · gentleman (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7259-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'gentleman', JSON_ARRAY('gentleman', 'gentlemans'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7259-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7259-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Who is that ____ in spectacles?',
       JSON_ARRAY(),
       'gentleman',
       'n. 绅士, 先生 ｜ 原句：Who is that gentleman in spectacles?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · gently (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7260-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'gently', JSON_ARRAY('gently', 'gentlier', 'gentliest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7260-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7260-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The nurse ____ put a bandage around my head.',
       JSON_ARRAY(),
       'gently',
       'adv. 温和地, 温柔地, 轻轻地, 逐渐地 ｜ 原句：The nurse gently put a bandage around my head.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · geography (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7261-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'geography', JSON_ARRAY('geography', 'geographies'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7261-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7261-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I like ____ and history.',
       JSON_ARRAY(),
       'geography',
       'n. 地理学, 地理 [医] 地理 ｜ 原句：I like geography and history.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · geology (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7262-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'geology', JSON_ARRAY('geology', 'geologies'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7262-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7262-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He was visiting professor of ____ at the University of Georgia.',
       JSON_ARRAY(),
       'geology',
       'n. 地质学, 地质情况 ｜ 原句：He was visiting professor of geology at the University of Georgia.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · geometry (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7263-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'geometry', JSON_ARRAY('geometry', 'geometries'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7263-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7263-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'If ____ is the science of space, what is the science of time?',
       JSON_ARRAY(),
       'geometry',
       'n. 几何学 [机] 几何学 ｜ 原句：If geometry is the science of space, what is the science of time?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · germ (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7264-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'germ', JSON_ARRAY('germ', 'germs'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7264-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7264-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Put disinfectant down the toilet to kill any ____.',
       JSON_ARRAY(),
       'germs',
       'n. 细菌, 种子, 生殖细胞, 根源 [医] 芽胞, 胚, 胚芽, 病菌 ｜ 原句：Put disinfectant down the toilet to kill any germs.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · germany (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7266-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'germany', JSON_ARRAY('germany', 'germanies'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7266-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7266-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '____ borders on France.',
       JSON_ARRAY(),
       'germany',
       'n. 德国 ｜ 原句：Germany borders on France.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · gesture (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7267-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'gesture', JSON_ARRAY('gesture', 'gestures'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7267-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7267-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'They communicate with each other by ____.',
       JSON_ARRAY(),
       'gesture',
       'n. 手势, 姿态 vi. 作手势, 作姿态 ｜ 原句：They communicate with each other by gesture.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · ghost (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7268-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'ghost', JSON_ARRAY('ghost', 'ghosts'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7268-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7268-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'John felt the presence of a ____ in the dark room.',
       JSON_ARRAY(),
       'ghost',
       'n. 鬼, 灵魂, 幻影, 一丝, 一点 v. 鬼似地游荡 ｜ 原句：John felt the presence of a ghost in the dark room.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · giant (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7269-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'giant', JSON_ARRAY('giant', 'giants'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7269-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7269-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '____ pandas live only in China.',
       JSON_ARRAY(),
       'giant',
       'n. 巨人, 大力士, 巨大怪物 a. 庞大的, 巨大的 ｜ 原句：Giant pandas live only in China.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · glance (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7270-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'glance', JSON_ARRAY('glance', 'glances'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7270-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7270-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'At first ____, the question seemed easy.',
       JSON_ARRAY(),
       'glance',
       'n. 一瞥, 闪光, 掠过, 辉矿类 vi. 扫视, 闪光, 掠过, 提到, 略说 vt. 扫视, 反射, 使掠过 ｜ 原句：At first glance, the question seemed easy.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · glimpse (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7273-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'glimpse', JSON_ARRAY('glimpse', 'glimpses'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7273-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7273-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I caught a ____ of Mt. Fuji from the window of the train.',
       JSON_ARRAY(),
       'glimpse',
       'n. 一瞥, 一闪 vi. 投以一瞥, 闪烁不定 vt. 瞥见 ｜ 原句：I caught a glimpse of Mt. Fuji from the window of the train.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · glitter (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7274-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'glitter', JSON_ARRAY('glitter', 'glitters'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7274-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7274-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'This ring has lost its ____.',
       JSON_ARRAY(),
       'glitter',
       'n. 灿烂, 闪烁, 辉耀 vi. 灿烂, 闪烁, 辉耀 ｜ 原句：This ring has lost its glitter.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · global (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7275-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'global', JSON_ARRAY('global'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7275-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7275-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The term ''greenhouse effect'' is often used when people talk about ____ changes of climate nowadays.',
       JSON_ARRAY(),
       'global',
       'a. 通用的, 全球的, 球形的, 综合的, 普遍的 [计] 共用 ｜ 原句：The term ''greenhouse effect'' is often used when people talk about global changes of climate nowadays.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · globe (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7276-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'globe', JSON_ARRAY('globe', 'globes'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7276-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7276-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The equator divides the ____ into two hemispheres.',
       JSON_ARRAY(),
       'globe',
       'n. 球, 球状物, 地球仪, 天体 v. (使)成球状 ｜ 原句：The equator divides the globe into two hemispheres.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · gloomy (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7277-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'gloomy', JSON_ARRAY('gloomy', 'gloomier', 'gloomiest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7277-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7277-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The future looked very ____.',
       JSON_ARRAY(),
       'gloomy',
       'a. 抑沉的, 忧闷的, 黑暗的, 悲观的 ｜ 原句：The future looked very gloomy.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · glorious (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7278-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'glorious', JSON_ARRAY('glorious'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7278-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7278-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Therefore, for the ____ God, you must accept each other, and accept Jesus Christ in the same way.',
       JSON_ARRAY(),
       'glorious',
       'a. 光荣的 ｜ 原句：Therefore, for the glorious God, you must accept each other, and accept Jesus Christ in the same way.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · glory (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7279-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'glory', JSON_ARRAY('glory', 'glories'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7279-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7279-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The religion was in its ____ in those days.',
       JSON_ARRAY(),
       'glory',
       'n. 光荣, 荣耀, 荣誉, 壮丽, 繁荣 vi. 自豪 ｜ 原句：The religion was in its glory in those days.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · glove (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7280-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'glove', JSON_ARRAY('glove', 'gloves'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7280-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7280-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'My favorite word in German is the word for "____".',
       JSON_ARRAY(),
       'glove',
       'n. 手套 vt. 给...戴手套 ｜ 原句：My favorite word in German is the word for "glove".',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · glow (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7281-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'glow', JSON_ARRAY('glow', 'glows'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7281-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7281-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'the ____ from the dying fire',
       JSON_ARRAY(),
       'glow',
       'n. 赤热, 光辉, 热情, 热烈, 红光 vi. 发红光, 红光焕发, 发热, 洋溢, 激动 ｜ 原句：the glow from the dying fire',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · glue (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7282-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'glue', JSON_ARRAY('glue', 'glues'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7282-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7282-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Some furniture is put together with ____.',
       JSON_ARRAY(),
       'glue',
       'n. 胶, 粘性物 vt. 粘合, 胶合 ｜ 原句：Some furniture is put together with glue.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · goal (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7283-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'goal', JSON_ARRAY('goal', 'goals'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7283-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7283-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Our ultimate ____ is to establish world peace.',
       JSON_ARRAY(),
       'goal',
       'n. 目标, 终点, 得分, 球门, 守门员 vi. 攻门, 射门得分 ｜ 原句：Our ultimate goal is to establish world peace.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · goat (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7284-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'goat', JSON_ARRAY('goat', 'goats'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7284-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7284-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Horse, lion, dog, ____: these are animals.',
       JSON_ARRAY(),
       'goat',
       'n. 山羊, 替罪羊, 色鬼 ｜ 原句：Horse, lion, dog, goat: these are animals.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · gold (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7286-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'gold', JSON_ARRAY('gold', 'golds'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7286-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7286-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '____ is heavier than iron.',
       JSON_ARRAY(),
       'gold',
       'n. 黄金, 钱财, 金块, 金色, 宝贵 a. 金的, 似金的, 金色的, 金制的 ｜ 原句：Gold is heavier than iron.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · golden (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7287-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'golden', JSON_ARRAY('golden'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7287-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7287-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Speech is silver, but silence is ____.',
       JSON_ARRAY(),
       'golden',
       'a. 金的, 含金的, 金色的, 贵重的, 繁盛的 [法] 金制的, 金色的, 兴隆的 ｜ 原句：Speech is silver, but silence is golden.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · golf (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7288-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'golf', JSON_ARRAY('golf', 'golfs'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7288-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7288-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I like playing tennis and ____.',
       JSON_ARRAY(),
       'golf',
       'n. 高尔夫球 vi. 打高尔夫球 ｜ 原句：I like playing tennis and golf.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · goodness (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7289-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'goodness', JSON_ARRAY('goodness'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7289-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7289-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He retains a faith in human ____.',
       JSON_ARRAY(),
       'goodness',
       'n. 仁慈, 善良 ｜ 原句：He retains a faith in human goodness.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · goods (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7290-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'goods', JSON_ARRAY('goods'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7290-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7290-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I buy the ____ at $3 a dozen.',
       JSON_ARRAY(),
       'goods',
       'n. 货物 [经] 货物, 商品, 动产 ｜ 原句：I buy the goods at $3 a dozen.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · goose (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7291-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'goose', JSON_ARRAY('goose', 'gooses', 'geese'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7291-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7291-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Our ____ is cooked.',
       JSON_ARRAY(),
       'goose',
       'n. 鹅, 雌鹅, 鹅肉, 弯把熨斗 vt. 与...性交, 突然加大油门, 使生色, 喝倒彩 ｜ 原句：Our goose is cooked.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · govern (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7292-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'govern', JSON_ARRAY('govern', 'governs', 'governed', 'governing'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7292-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7292-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'To ____ a country is no easy job.',
       JSON_ARRAY(),
       'govern',
       'v. 统治, 支配, 管理 ｜ 原句：To govern a country is no easy job.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · government (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7293-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'government', JSON_ARRAY('government'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7293-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7293-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Democracy is the worst form of ____, except all the others that have been tried.',
       JSON_ARRAY(),
       'government',
       'n. 政府, 内阁 [经] 政府, 政治, 政体 ｜ 原句：Democracy is the worst form of government, except all the others that have been tried.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · governor (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7294-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'governor', JSON_ARRAY('governor', 'governors'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7294-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7294-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Everybody wished he had been elected ____.',
       JSON_ARRAY(),
       'governor',
       'n. (美)州长, (英)总督, 统治者, 管理者, 理事 [医] 节制器, 调节器 ｜ 原句：Everybody wished he had been elected governor.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · gown (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7295-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'gown', JSON_ARRAY('gown', 'gowns'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7295-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7295-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Life is a magnificent ____ full of lice.',
       JSON_ARRAY(),
       'gown',
       'n. 睡衣, 法衣, 大学全体师生 vt. 使穿睡衣 ｜ 原句：Life is a magnificent gown full of lice.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · grace (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7296-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'grace', JSON_ARRAY('grace', 'graces'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7296-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7296-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '____ has not come yet.',
       JSON_ARRAY(),
       'grace',
       'n. 优雅, 风度, 慈悲, 恩惠, 体面, 赦免, 恩典, 谢恩祷告 vt. 使优美 ｜ 原句：Grace has not come yet.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · gracious (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7298-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'gracious', JSON_ARRAY('gracious'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7298-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7298-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'She is ____ to everyone.',
       JSON_ARRAY(),
       'gracious',
       'a. 亲切的, 慈善的 ｜ 原句：She is gracious to everyone.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · gradual (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7299-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'gradual', JSON_ARRAY('gradual'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7299-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7299-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Learning is a ____ process.',
       JSON_ARRAY(),
       'gradual',
       'a. 逐渐的, 渐增的 n. 弥撒升阶圣歌 ｜ 原句：Learning is a gradual process.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · gradually (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7300-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'gradually', JSON_ARRAY('gradually'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7300-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7300-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The sky has ____ clouded over.',
       JSON_ARRAY(),
       'gradually',
       'adv. 逐渐地 ｜ 原句：The sky has gradually clouded over.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · graduate (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7301-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'graduate', JSON_ARRAY('graduate', 'graduates'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7301-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7301-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'When did you ____ from Oxford?',
       JSON_ARRAY(),
       'graduate',
       'n. 毕业生, 量杯 a. 已得学位的, 研究生的, 毕业的 vi. 毕业, 得学位, 逐渐变为 vt. 准予...毕业, 授予...学位, 分等级, 刻刻度 ｜ 原句：When did you graduate from Oxford?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · grain (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7302-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'grain', JSON_ARRAY('grain', 'grains'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7302-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7302-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Rye was called the ____ of poverty.',
       JSON_ARRAY(),
       'grain',
       'n. 谷粒, 颗粒, 谷类, 纹理, 本质 v. (使)成谷粒 ｜ 原句：Rye was called the grain of poverty.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · grammar (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7303-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'grammar', JSON_ARRAY('grammar', 'grammars'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7303-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7303-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'According to my experience, it takes one year to master French ____.',
       JSON_ARRAY(),
       'grammar',
       'n. 语法学, 入门书 [计] 语法检查 ｜ 原句：According to my experience, it takes one year to master French grammar.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · grammatical (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7304-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'grammatical', JSON_ARRAY('grammatical'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7304-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7304-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He made a few ____ mistakes.',
       JSON_ARRAY(),
       'grammatical',
       'a. 语法的, 合乎语法的 [法] 语法上的, 符合语法规则的, 文法上的 ｜ 原句：He made a few grammatical mistakes.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · gramme (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7305-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'gramme', JSON_ARRAY('gramme', 'grammes'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7305-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7305-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'A few twentieths of a ____ can be critical.',
       JSON_ARRAY(),
       'gramme',
       'n. 克 [医] 克 ｜ 原句：A few twentieths of a gramme can be critical.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · granddaughter (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7307-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'granddaughter', JSON_ARRAY('granddaughter', 'granddaughters'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7307-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7307-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Where''s your ____?',
       JSON_ARRAY(),
       'granddaughter',
       'n. 孙女, 外孙女 ｜ 原句：Where''s your granddaughter?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · grandfather (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7308-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'grandfather', JSON_ARRAY('grandfather', 'grandfathers'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7308-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7308-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Bob met her ____ early in the morning.',
       JSON_ARRAY(),
       'grandfather',
       'n. 祖父, 始祖 [电] 原始资料组 ｜ 原句：Bob met her grandfather early in the morning.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · grandmother (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7309-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'grandmother', JSON_ARRAY('grandmother', 'grandmothers'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7309-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7309-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Tom''s ____ looks healthy.',
       JSON_ARRAY(),
       'grandmother',
       'n. 祖母, 女祖先 ｜ 原句：Tom''s grandmother looks healthy.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · grandson (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7310-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'grandson', JSON_ARRAY('grandson', 'grandsons'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7310-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7310-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'My ____ is still a baby.',
       JSON_ARRAY(),
       'grandson',
       'n. 孙子, 外孙 ｜ 原句：My grandson is still a baby.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · grant (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7311-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'grant', JSON_ARRAY('grant', 'grants'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7311-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7311-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Even if I ____ that what you say is true, it is no excuse.',
       JSON_ARRAY(),
       'grant',
       'n. 授予, 授予物, 允许 vt. 允许, 承认, 授与 [计] 授权命令 ｜ 原句：Even if I grant that what you say is true, it is no excuse.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · grape (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7312-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'grape', JSON_ARRAY('grape', 'grapes'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7312-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7312-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I like ____ jelly best.',
       JSON_ARRAY(),
       'grape',
       'n. 葡萄, 葡萄树 [医] 葡萄 ｜ 原句：I like grape jelly best.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · graph (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7313-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'graph', JSON_ARRAY('graph', 'graphs'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7313-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7313-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Martin showed me a ____ of their recent sales.',
       JSON_ARRAY(),
       'graph',
       'n. 曲线图, 图表, 图形 [计] 图形 ｜ 原句：Martin showed me a graph of their recent sales.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · grasp (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7314-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'grasp', JSON_ARRAY('grasp', 'grasps'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7314-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7314-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He has a good ____ of English.',
       JSON_ARRAY(),
       'grasp',
       'n. 把握, 抓紧, 理解, 抓, 柄, 控制 vt. 抓住, 紧握, 领会 vi. 抓 ｜ 原句：He has a good grasp of English.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · grateful (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7315-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'grateful', JSON_ARRAY('grateful'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7315-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7315-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I am ____ to you for inviting me to the party.',
       JSON_ARRAY(),
       'grateful',
       'a. 感谢的, 感激的, 令人快意的, 受欢迎的 ｜ 原句：I am grateful to you for inviting me to the party.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · grave (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7316-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'grave', JSON_ARRAY('grave', 'graves'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7316-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7316-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'She carried that habit to her ____.',
       JSON_ARRAY(),
       'grave',
       'n. 墓穴, 坟墓, 终结, 死亡 a. 庄重的, 严肃的, 重大的, 低沉的 vt. 雕刻 ｜ 原句：She carried that habit to her grave.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · gravity (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7317-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'gravity', JSON_ARRAY('gravity'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7317-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7317-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'They conducted a series of experiments under zero ____.',
       JSON_ARRAY(),
       'gravity',
       'n. 地心引力, 重力 [化] 重力 ｜ 原句：They conducted a series of experiments under zero gravity.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · greatly (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7319-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'greatly', JSON_ARRAY('greatly'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7319-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7319-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The number of tourists has increased ____ in recent years.',
       JSON_ARRAY(),
       'greatly',
       'adv. 很, 非常 ｜ 原句：The number of tourists has increased greatly in recent years.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · greedy (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7320-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'greedy', JSON_ARRAY('greedy', 'greedier', 'greediest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7320-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7320-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'A miser hoards money not because he is prudent but because he is ____.',
       JSON_ARRAY(),
       'greedy',
       'a. 贪婪的, 贪得的, 贪吃的 ｜ 原句：A miser hoards money not because he is prudent but because he is greedy.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · greenhouse (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7322-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'greenhouse', JSON_ARRAY('greenhouse', 'greenhouses'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7322-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7322-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'They grow strawberries in their ____.',
       JSON_ARRAY(),
       'greenhouse',
       'n. 温室 ｜ 原句：They grow strawberries in their greenhouse.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · greet (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7323-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'greet', JSON_ARRAY('greet', 'greets', 'greeted', 'greeting'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7323-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7323-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I didn''t ____ you because I mistook you for somebody else.',
       JSON_ARRAY(),
       'greet',
       'vt. 问候, 致敬, 欢迎, 映入眼帘 ｜ 原句：I didn''t greet you because I mistook you for somebody else.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · greeting (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7324-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'greeting', JSON_ARRAY('greeting', 'greetings'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7324-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7324-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I smiled a polite ____, but the woman hardly acknowledged me.',
       JSON_ARRAY(),
       'greeting',
       'n. 祝贺, 问候 ｜ 原句：I smiled a polite greeting, but the woman hardly acknowledged me.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · grey (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7325-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'grey', JSON_ARRAY('grey', 'greys'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7325-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7325-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'All cats are ____ in the dark.',
       JSON_ARRAY(),
       'grey',
       'n. 灰色 a. 灰色的, 阴沉的 v. (使)成灰色 ｜ 原句：All cats are grey in the dark.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · grieve (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7326-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'grieve', JSON_ARRAY('grieve', 'grieves', 'grieved', 'grieving'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7326-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7326-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'People need time to ____ after the death of a loved one.',
       JSON_ARRAY(),
       'grieve',
       'vt. 使悲伤 vi. 悲痛, 伤心 ｜ 原句：People need time to grieve after the death of a loved one.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · grip (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7328-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'grip', JSON_ARRAY('grip', 'grips'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7328-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7328-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Get a ____ on yourself!',
       JSON_ARRAY(),
       'grip',
       'n. 紧握, 柄, 握力, 握手方式, 手提包, 掌握, 支配, 控制 vt. 抓紧, 抱住, 吸住, 掌握 vi. 握牢, 有吸引力 ｜ 原句：Get a grip on yourself!',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · grocer (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7330-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'grocer', JSON_ARRAY('grocer', 'grocers'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7330-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7330-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The cook and the ____ haggled over the price of eggs.',
       JSON_ARRAY(),
       'grocer',
       'n. 食品商 ｜ 原句：The cook and the grocer haggled over the price of eggs.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · grocery (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7331-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'grocery', JSON_ARRAY('grocery', 'groceries'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7331-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7331-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Please tell us where there is a ____ store.',
       JSON_ARRAY(),
       'grocery',
       'n. 食品杂货店, 食品杂货业 ｜ 原句：Please tell us where there is a grocery store.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · growth (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7339-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'growth', JSON_ARRAY('growth', 'growths'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7339-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7339-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'More money for education will spur economic ____.',
       JSON_ARRAY(),
       'growth',
       'n. 生长, 栽培, 增长 [计] 等比级数 ｜ 原句：More money for education will spur economic growth.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · guarantee (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7340-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'guarantee', JSON_ARRAY('guarantee', 'guarantees'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7340-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7340-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I ____ that this information is correct.',
       JSON_ARRAY(),
       'guarantee',
       'n. 担保, 抵押品, 保证书 vt. 保证, 担保 ｜ 原句：I guarantee that this information is correct.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · guard (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7341-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'guard', JSON_ARRAY('guard', 'guards'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7341-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7341-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'When one of my coworkers starts racking up good sales figures I can''t let down my ____.',
       JSON_ARRAY(),
       'guard',
       'n. 守卫者, 警戒, 护卫队, 防护装置 vt. 保卫, 看守, 当心 vi. 防止, 警惕, 警卫, 看守 ｜ 原句：When one of my coworkers starts racking up good sales figures I can''t let down my guard.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · guidance (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7342-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'guidance', JSON_ARRAY('guidance', 'guidances'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7342-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7342-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'But CNN has learned that, due to her husband''s ____, Kate feels she has already adapted to her new life.',
       JSON_ARRAY(),
       'guidance',
       'n. 指导, 领导 [医] 导 ｜ 原句：But CNN has learned that, due to her husband''s guidance, Kate feels she has already adapted to her new life.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · guide (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7343-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'guide', JSON_ARRAY('guide', 'guides'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7343-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7343-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I''ll act as a ____ for you.',
       JSON_ARRAY(),
       'guide',
       'n. 引导者, 导游, 指南, 路标 vt. 指导, 支配, 管理, 带领, 操纵 vi. 任向导 [计] 辅助线 ｜ 原句：I''ll act as a guide for you.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · guilty (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7344-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'guilty', JSON_ARRAY('guilty', 'guiltier', 'guiltiest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7344-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7344-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The news article painted the defendant as a ____ man, even though he had been proven innocent.',
       JSON_ARRAY(),
       'guilty',
       'a. 犯罪的, 有过失的, 自觉有错的, 心虚的 [法] 有罪的, 犯罪的, 自觉有罪的 ｜ 原句：The news article painted the defendant as a guilty man, even though he had been proven innocent.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · gulf (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7345-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'gulf', JSON_ARRAY('gulf', 'gulfs'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7345-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7345-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Gambling site lets users bet on which species will go extinct because of the oil spill in the ____ of Mexico.',
       JSON_ARRAY(),
       'gulf',
       'n. 海湾, 深渊, 漩涡, 隔阂 vt. 吞没 ｜ 原句：Gambling site lets users bet on which species will go extinct because of the oil spill in the Gulf of Mexico.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · gum (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7346-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'gum', JSON_ARRAY('gum', 'gums'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7346-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7346-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Some ____ stuck to his shoes.',
       JSON_ARRAY(),
       'gum',
       'n. 树胶, 橡皮, 橡皮糖, 牙床, 老天 vt. 涂以树胶, 用胶粘, 使有粘性 vi. 分泌树胶, 发粘 ｜ 原句：Some gum stuck to his shoes.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · gun (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7347-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'gun', JSON_ARRAY('gun', 'guns'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7347-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7347-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'They heard a ____ go off in the distance.',
       JSON_ARRAY(),
       'gun',
       'n. 枪 [医] 枪 ｜ 原句：They heard a gun go off in the distance.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · gunpowder (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7348-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'gunpowder', JSON_ARRAY('gunpowder', 'gunpowders'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7348-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7348-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Do you know who invented ____?',
       JSON_ARRAY(),
       'gunpowder',
       'n. 火药 [化] 有烟火药; 火药 ｜ 原句：Do you know who invented gunpowder?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · guy (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7349-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'guy', JSON_ARRAY('guy', 'guys'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7349-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7349-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'After a couple of drinks, the ____ was feeling no pain.',
       JSON_ARRAY(),
       'guy',
       'n. 家伙, 支索 vt. 用支索撑住, 取笑, 嘲弄 vi. 逃跑 ｜ 原句：After a couple of drinks, the guy was feeling no pain.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · gymnasium (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7350-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'gymnasium', JSON_ARRAY('gymnasium', 'gymnasiums'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7350-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7350-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I have found a new ____.',
       JSON_ARRAY(),
       'gymnasium',
       'n. 健身房, 体育馆 [医] 体育馆, 健身室, 运动场 ｜ 原句：I have found a new gymnasium.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · habit (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7351-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'habit', JSON_ARRAY('habit', 'habits'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7351-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7351-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'You should try to form the ____ of using your dictionaries.',
       JSON_ARRAY(),
       'habit',
       'n. 习惯, 嗜好, 习性 vt. 使穿衣 ｜ 原句：You should try to form the habit of using your dictionaries.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · habitual (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7352-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'habitual', JSON_ARRAY('habitual'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7352-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7352-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'James took his ____ morning walk around the garden.',
       JSON_ARRAY(),
       'habitual',
       'a. 习惯的, 惯常的, 平常的 [法] 习惯的, 以习惯为常业的, 惯常的 ｜ 原句：James took his habitual morning walk around the garden.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · haircut (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7353-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'haircut', JSON_ARRAY('haircut', 'haircuts'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7353-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7353-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The barber gave him a ____.',
       JSON_ARRAY(),
       'haircut',
       'n. 理发, (男子的)发式 ｜ 原句：The barber gave him a haircut.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · hall (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7354-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'hall', JSON_ARRAY('hall', 'halls'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7354-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7354-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The ____ was filled with such a large audience that there wasn''t even standing room.',
       JSON_ARRAY(),
       'hall',
       'n. 门厅, 走廊, 会堂 ｜ 原句：The hall was filled with such a large audience that there wasn''t even standing room.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · halt (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7355-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'halt', JSON_ARRAY('halt', 'halts'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7355-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7355-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'After business came to a ____, many bathhouses added new facilities, such as saunas and exercise equipment, in an effort to attract customers.',
       JSON_ARRAY(),
       'halt',
       'n. 停止, 立定, 休息 vt. 使停止, 使立定 vi. 立定, 停止, 蹒跚, 踌躇, 有缺点 [计] 停止 ｜ 原句：After business came to a halt, many bathhouses added new facilities, such as saunas and exercise equipment, in an effort to attract customers.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · hamburger (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7356-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'hamburger', JSON_ARRAY('hamburger', 'hamburgers'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7356-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7356-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Please give me a ____.',
       JSON_ARRAY(),
       'hamburger',
       'n. 汉堡(德国港口), 肉饼, 汉堡包, 纯精牛肉, 汉堡牛排 ｜ 原句：Please give me a hamburger.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · hammer (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7357-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'hammer', JSON_ARRAY('hammer', 'hammers'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7357-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7357-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'To the man who only has a ____ in the toolkit, every problem looks like a nail.',
       JSON_ARRAY(),
       'hammer',
       'n. 锤, 铁锤, 钉锤 vt. 锤打, 敲打, 钉 vi. 连续锤打 [计] 锤头 ｜ 原句：To the man who only has a hammer in the toolkit, every problem looks like a nail.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · handful (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7358-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'handful', JSON_ARRAY('handful', 'handfuls'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7358-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7358-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Only a ____ of people know the fact.',
       JSON_ARRAY(),
       'handful',
       'n. 少数, 一把, 棘手事 ｜ 原句：Only a handful of people know the fact.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · handkerchief (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7359-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'handkerchief', JSON_ARRAY('handkerchief', 'handkerchiefs'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7359-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7359-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'How much is this ____?',
       JSON_ARRAY(),
       'handkerchief',
       'n. 手帕, 头巾, 围巾 ｜ 原句：How much is this handkerchief?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · handsome (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7361-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'handsome', JSON_ARRAY('handsome'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7361-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7361-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He is young and, what is more, ____.',
       JSON_ARRAY(),
       'handsome',
       'a. 英俊的, 大方的, 慷慨的, 相当可观的, 美观的, 灵敏的 ｜ 原句：He is young and, what is more, handsome.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · handy (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7363-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'handy', JSON_ARRAY('handy', 'handier', 'handiest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7363-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7363-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'It really comes in ____.',
       JSON_ARRAY(),
       'handy',
       'a. 便利的, 敏捷的, 容易取得的 [化] 便于使用的; 易操作的 ｜ 原句：It really comes in handy.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · hang (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7364-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'hang', JSON_ARRAY('hang', 'hangs', 'hung'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7364-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7364-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '____ your coat on the hook.',
       JSON_ARRAY(),
       'hang',
       'n. 悬挂, 诀窍, 意义 vt. 悬挂, 附着, 装饰, 垂下, 踌躇, 绞死, 使悬而未决 vi. 悬着, 垂下, 被绞死, 悬而不决 ｜ 原句：Hang your coat on the hook.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · harbour (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7367-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'harbour', JSON_ARRAY('harbour', 'harbours'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7367-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7367-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The lost fishing boat made a safe return to ____.',
       JSON_ARRAY(),
       'harbour',
       'n. 港, 避难所 v. 庇护, 藏匿, (使)入港停泊 ｜ 原句：The lost fishing boat made a safe return to harbour.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · harden (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7368-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'harden', JSON_ARRAY('harden', 'hardens'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7368-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7368-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'It will take about 24 hours for the glue to ____.',
       JSON_ARRAY(),
       'harden',
       'vt. 使变硬, 使坚强, 使冷酷 vi. 变硬, 变冷酷 ｜ 原句：It will take about 24 hours for the glue to harden.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · hardly (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7369-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'hardly', JSON_ARRAY('hardly', 'hardlier', 'hardliest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7369-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7369-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I can ____ hear you.',
       JSON_ARRAY(),
       'hardly',
       'adv. 刚刚, 几乎不, 勉强是 ｜ 原句：I can hardly hear you.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · hardship (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7370-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'hardship', JSON_ARRAY('hardship'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7370-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7370-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He overcame all sorts of ____ and setbacks to succeed in a solo crossing of Antarctica.',
       JSON_ARRAY(),
       'hardship',
       'n. 艰难, 辛苦, 苦难 [法] 受苦, 吃苦, 苦难 ｜ 原句：He overcame all sorts of hardship and setbacks to succeed in a solo crossing of Antarctica.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · hardware (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7371-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'hardware', JSON_ARRAY('hardware', 'hardwares'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7371-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7371-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'A user should have freedom with respect to both ____ and software. An operating system should be open, not closed.',
       JSON_ARRAY(),
       'hardware',
       'n. 硬件, 五金器具, 零件 [计] 硬件 ｜ 原句：A user should have freedom with respect to both hardware and software. An operating system should be open, not closed.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · hare (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7372-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'hare', JSON_ARRAY('hare', 'hares'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7372-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7372-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The ____ was outdistanced by the tortoise.',
       JSON_ARRAY(),
       'hare',
       'n. 野兔 vi. 飞跑 ｜ 原句：The hare was outdistanced by the tortoise.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · harmful (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7374-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'harmful', JSON_ARRAY('harmful'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7374-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7374-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Smoking is ____ to your health.',
       JSON_ARRAY(),
       'harmful',
       'a. 有害的, 伤害的 ｜ 原句：Smoking is harmful to your health.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · harness (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7375-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'harness', JSON_ARRAY('harness'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7375-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7375-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'There''s new energy to ____, new jobs to be created, new schools to build, and threats to meet, alliances to repair.',
       JSON_ARRAY(),
       'harness',
       'n. 马具, 挽具状带子, 甲胄 vt. 给...上挽具, 驾驭, 披上甲胄, 利用...以产生动力 ｜ 原句：There''s new energy to harness, new jobs to be created, new schools to build, and threats to meet, alliances to repair.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · harsh (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7376-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'harsh', JSON_ARRAY('harsh', 'harsher', 'harshest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7376-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7376-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He doesn''t even dare to reply to a ____ word. He''s such a coward.',
       JSON_ARRAY(),
       'harsh',
       'a. 粗糙的, 刺耳的, 严厉的 [法] 粗糙的, 严厉的, 苛刻的 ｜ 原句：He doesn''t even dare to reply to a harsh word. He''s such a coward.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · harvest (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7377-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'harvest', JSON_ARRAY('harvest', 'harvests'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7377-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7377-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'A festival is held at the rice ____.',
       JSON_ARRAY(),
       'harvest',
       'n. 收获, 成果, 收获物, 收获期 v. 收割, 收获 ｜ 原句：A festival is held at the rice harvest.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · haste (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7378-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'haste', JSON_ARRAY('haste', 'hastes'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7378-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7378-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Having been written in ____, the book has a lot of errors.',
       JSON_ARRAY(),
       'haste',
       'n. 匆忙, 急忙 ｜ 原句：Having been written in haste, the book has a lot of errors.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · hasten (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7379-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'hasten', JSON_ARRAY('hasten', 'hastened', 'hastens'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7379-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7379-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'News of the scandal certainly ____ his departure from office.',
       JSON_ARRAY(),
       'hastened',
       'vt. 催促, 加紧 vi. 赶快, 急忙 ｜ 原句：News of the scandal certainly hastened his departure from office.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · hasty (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7380-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'hasty', JSON_ARRAY('hasty', 'hastier', 'hastiest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7380-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7380-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I ate a ____ lunch.',
       JSON_ARRAY(),
       'hasty',
       'a. 匆匆的, 轻率的, 性怠的 ｜ 原句：I ate a hasty lunch.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · hatch (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7381-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'hatch', JSON_ARRAY('hatch', 'hatches'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7381-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7381-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The eggs take three days to ____.',
       JSON_ARRAY(),
       'hatch',
       'n. 孵化, 舱口 vt. 孵, 孵出, 策划 vi. 孵化 ｜ 原句：The eggs take three days to hatch.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · hateful (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7383-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'hateful', JSON_ARRAY('hateful'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7383-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7383-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'It was all the fault of that ____ man!',
       JSON_ARRAY(),
       'hateful',
       'a. 憎恨的, 可恨的, 可恶的 ｜ 原句：It was all the fault of that hateful man!',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · hatred (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7384-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'hatred', JSON_ARRAY('hatred', 'hatreds'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7384-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7384-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'A look of pure ____ flashed across her face.',
       JSON_ARRAY(),
       'hatred',
       'n. 憎恨, 仇恨, 憎恶 [法] 敌意, 憎恨, 憎恶 ｜ 原句：A look of pure hatred flashed across her face.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · hawk (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7385-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'hawk', JSON_ARRAY('hawk', 'hawks'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7385-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7385-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The bird was half the size of a ____.',
       JSON_ARRAY(),
       'hawk',
       'n. 鹰, 掠夺者, 鹰派成员 vi. 放鹰行猎, 像鹰一般地袭击, 清嗓, 咳嗽 vt. 捕捉, 咳出, 兜售, 叫卖, 散播 ｜ 原句：The bird was half the size of a hawk.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · hazard (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7387-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'hazard', JSON_ARRAY('hazard', 'hazards'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7387-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7387-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'That pile of rubbish is a fire ____ (= something that is likely to cause a fire ).',
       JSON_ARRAY(),
       'hazard',
       'n. 冒险, 危险, 机会 vt. 冒...的危险, 赌运气, 使冒危险 [计] 相关危险; 冒险 ｜ 原句：That pile of rubbish is a fire hazard (= something that is likely to cause a fire ).',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · headache (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7388-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'headache', JSON_ARRAY('headache', 'headaches'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7388-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7388-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'So annoying... Now I get a ____ whenever I use the computer!',
       JSON_ARRAY(),
       'headache',
       'n. 头痛, 令人头痛之事 [医] 头痛 ｜ 原句：So annoying... Now I get a headache whenever I use the computer!',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · headline (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7390-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'headline', JSON_ARRAY('headline', 'headlines'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7390-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7390-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The ____ caught my eye this morning.',
       JSON_ARRAY(),
       'headline',
       'n. 大标题, 新闻摘要 vt. 为...做标题, 写标题 ｜ 原句：The headline caught my eye this morning.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · headmaster (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7391-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'headmaster', JSON_ARRAY('headmaster', 'headmasters'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7391-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7391-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He has just become ____.',
       JSON_ARRAY(),
       'headmaster',
       'n. (中小学)校长, 监工 ｜ 原句：He has just become headmaster.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · headquarters (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7392-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'headquarters', JSON_ARRAY('headquarters'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7392-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7392-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'There was a different kind of atmosphere in the ____.',
       JSON_ARRAY(),
       'headquarters',
       'n. 总部, 司令部, 总部人员 [经] 本部, 总部, 总署 ｜ 原句：There was a different kind of atmosphere in the headquarters.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · heal (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7393-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'heal', JSON_ARRAY('heal', 'heals', 'healed', 'healing'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7393-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7393-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Wounds ____ as time passes.',
       JSON_ARRAY(),
       'heal',
       'vi. 痊愈 vt. 使复原, 使和解, 治愈 ｜ 原句：Wounds heal as time passes.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · heat (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7395-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'heat', JSON_ARRAY('heat', 'heats'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7395-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7395-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I can''t put up with the ____ any longer.',
       JSON_ARRAY(),
       'heat',
       'n. 热, 热度, 体温, 高潮 vi. 加热, 激昂, 加剧 vt. 把...加热, 使激动 ｜ 原句：I can''t put up with the heat any longer.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · heating (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7396-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'heating', JSON_ARRAY('heating', 'heatings'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7396-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7396-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The ____ doesn''t work.',
       JSON_ARRAY(),
       'heating',
       'n. 加热, 供热, 暖气设备, 供暖系统, 暖气装置 a. 加热的, 供暖的 ｜ 原句：The heating doesn''t work.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · heaven (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7397-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'heaven', JSON_ARRAY('heaven', 'heavens'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7397-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7397-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'How can I get to ____?',
       JSON_ARRAY(),
       'heaven',
       'n. 天堂, 上帝, 天空 ｜ 原句：How can I get to heaven?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · heavily (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7398-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'heavily', JSON_ARRAY('heavily'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7398-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7398-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I had hardly left home when it began to rain ____.',
       JSON_ARRAY(),
       'heavily',
       'adv. 很重地, 严重地, 难以忍受地 ｜ 原句：I had hardly left home when it began to rain heavily.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · hedge (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7399-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'hedge', JSON_ARRAY('hedge', 'hedges'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7399-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7399-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The cat got through the ____.',
       JSON_ARRAY(),
       'hedge',
       'n. 树篱, 障碍, 套头交易 vt. 用树篱围, 套期保值, 妨碍, 两面下注以防...的损失 vi. 筑树篱, 躲闪, 两面下注以防损失 a. 树篱的, 偷偷摸摸的 ｜ 原句：The cat got through the hedge.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · heel (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7400-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'heel', JSON_ARRAY('heel', 'heels'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7400-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7400-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He had an operation on his ____ last week.',
       JSON_ARRAY(),
       'heel',
       'n. 脚后跟, 踵, 后部, 倾侧 vt. 尾随, 装以鞋跟, 倾侧, 追赶 vi. 紧随, 用脚后跟传球 ｜ 原句：He had an operation on his heel last week.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · height (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7401-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'height', JSON_ARRAY('height', 'heights'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7401-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7401-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'What is the average ____ of the players?',
       JSON_ARRAY(),
       'height',
       'n. 高度, 海拔, 高地, 顶点 [化] 高度 ｜ 原句：What is the average height of the players?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · heir (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7402-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'heir', JSON_ARRAY('heir', 'heirs'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7402-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7402-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'John was the sole ____ to a vast estate.',
       JSON_ARRAY(),
       'heir',
       'n. 继承人, 嗣子, 后嗣 [法] 继承人, 后嗣 ｜ 原句：John was the sole heir to a vast estate.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · helicopter (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7403-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'helicopter', JSON_ARRAY('helicopter', 'helicopters'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7403-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7403-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Tell those people to back off so that the ____ can land.',
       JSON_ARRAY(),
       'helicopter',
       'n. 直升机 vt. 由直升机运送 vi. 乘直升机 ｜ 原句：Tell those people to back off so that the helicopter can land.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · hell (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7404-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'hell', JSON_ARRAY('hell', 'hells'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7404-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7404-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'What the ____ are you going to do with it?',
       JSON_ARRAY(),
       'hell',
       'n. 地狱, 邪恶势力, 苦境, 阴间, 毁坏, 训斥 vi. 狂饮, 飞驰 ｜ 原句：What the hell are you going to do with it?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · helmet (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7405-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'helmet', JSON_ARRAY('helmet', 'helmets'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7405-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7405-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'It is dangerous to ride a motorbike without a ____.',
       JSON_ARRAY(),
       'helmet',
       'n. 钢盔, 盔, 防护帽 vt. 给...戴头盔 ｜ 原句：It is dangerous to ride a motorbike without a helmet.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · helpful (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7406-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'helpful', JSON_ARRAY('helpful'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7406-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7406-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He may be clever, but he is not very ____.',
       JSON_ARRAY(),
       'helpful',
       'a. 有帮助的, 有益的, 有用的 ｜ 原句：He may be clever, but he is not very helpful.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · helpless (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7407-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'helpless', JSON_ARRAY('helpless'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7407-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7407-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He began to feel depressed and ____.',
       JSON_ARRAY(),
       'helpless',
       'a. 无助的, 无能为力的, 无依无靠的 ｜ 原句：He began to feel depressed and helpless.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · hen (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7408-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'hen', JSON_ARRAY('hen', 'hens'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7408-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7408-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'That fox must have killed the ____.',
       JSON_ARRAY(),
       'hen',
       'n. 母鸡, 雌禽 ｜ 原句：That fox must have killed the hen.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · hence (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7409-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'hence', JSON_ARRAY('hence'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7409-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7409-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '____, we have to take care of ourselves.',
       JSON_ARRAY(),
       'hence',
       'adv. 因此, 从此 ｜ 原句：Hence, we have to take care of ourselves.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · herd (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7410-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'herd', JSON_ARRAY('herd', 'herds'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7410-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7410-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Chobe is also renowned for its large ____ of elephant and buffalo.',
       JSON_ARRAY(),
       'herds',
       'n. 兽群, 人群, 牧人 vt. 群集, 使成群, 放牧 vi. 聚在一起 ｜ 原句：Chobe is also renowned for its large herds of elephant and buffalo.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · heroic (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7412-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'heroic', JSON_ARRAY('heroic'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7412-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7412-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'her ____ efforts to save her family',
       JSON_ARRAY(),
       'heroic',
       'a. 英勇的, 英雄式的, 壮丽雄伟的 n. 英雄诗, 史诗, 英勇行为 ｜ 原句：her heroic efforts to save her family',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · heroine (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7413-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'heroine', JSON_ARRAY('heroine', 'heroines'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7413-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7413-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The ____ of this story is a little girl.',
       JSON_ARRAY(),
       'heroine',
       'n. 巾帼英雄, 烈妇, 女主角 [化] 海洛因; 二醋吗啡; 二乙酰吗啡 ｜ 原句：The heroine of this story is a little girl.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · hide (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7414-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'hide', JSON_ARRAY('hide', 'hides', 'hid', 'hidden'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7414-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7414-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Please ____ the blueberry jam where Takako can''t see it.',
       JSON_ARRAY(),
       'hide',
       'n. 兽皮, 迹象, 躲藏处 vt. 藏, 隐瞒, 遮避, 剥...的皮, 隐藏 vi. 躲藏 [计] 隐藏 ｜ 原句：Please hide the blueberry jam where Takako can''t see it.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · highlight (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7415-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'highlight', JSON_ARRAY('highlight', 'highlights'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7415-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7415-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Your résumé should ____ your skills and achievements.',
       JSON_ARRAY(),
       'highlight',
       'n. 加亮区, 精彩场面 vt. 加亮, 使显著, 以强光照射, 突出 [计] 突出 ｜ 原句：Your résumé should highlight your skills and achievements.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · highly (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7416-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'highly', JSON_ARRAY('highly', 'highlier', 'highliest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7416-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7416-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Your conclusion is ____ arguable.',
       JSON_ARRAY(),
       'highly',
       'adv. 非常, 非常赞许地 [电] 大大地 ｜ 原句：Your conclusion is highly arguable.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · highway (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7417-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'highway', JSON_ARRAY('highway', 'highways'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7417-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7417-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The accident took place on the ____.',
       JSON_ARRAY(),
       'highway',
       'n. 公路, 大道, 捷径 [法] 公路, 大路 ｜ 原句：The accident took place on the highway.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · hillside (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7418-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'hillside', JSON_ARRAY('hillside', 'hillsides'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7418-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7418-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The ____ had torrential flooding from the west.',
       JSON_ARRAY(),
       'hillside',
       'n. 山坡, 山腹 ｜ 原句：The hillside had torrential flooding from the west.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · hint (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7419-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'hint', JSON_ARRAY('hint', 'hints'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7419-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7419-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The girl, her eyes shining brightly from that single ____, makes her cute cat-motif automatic pencil run across her notebook.',
       JSON_ARRAY(),
       'hint',
       'n. 暗示, 提示 v. 暗示, 示意 ｜ 原句：The girl, her eyes shining brightly from that single hint, makes her cute cat-motif automatic pencil run across her notebook.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · hire (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7420-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'hire', JSON_ARRAY('hire', 'hires'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7420-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7420-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I would like to ____ a car.',
       JSON_ARRAY(),
       'hire',
       'n. 租金, 租用, 雇用 vt. 雇请, 出租 vi. 受雇 ｜ 原句：I would like to hire a car.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · historical (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7421-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'historical', JSON_ARRAY('historical'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7421-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7421-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The story approximates to ____ truth.',
       JSON_ARRAY(),
       'historical',
       'a. 历史的, 史实的, 历史上的 [法] 历史性的 ｜ 原句：The story approximates to historical truth.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · history (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7422-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'history', JSON_ARRAY('history', 'histories'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7422-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7422-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'How come you know so much about Japanese ____?',
       JSON_ARRAY(),
       'history',
       'n. 历史, 过去, 经历, 发展过程, 历史学, 过去的事, 历史记录 [计] 历史记录 ｜ 原句：How come you know so much about Japanese history?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · hit (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7423-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'hit', JSON_ARRAY('hit', 'hits'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7423-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7423-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'It is easier to ____ on people on the Internet than in the street.',
       JSON_ARRAY(),
       'hit',
       'n. 打击, 打, 冲撞, 讽刺 vt. 打, 打击, 碰撞, 打中, 袭击, 偶然碰上 vi. 打, 打中, 打击, 碰撞, 偶然碰上 [计] 击中; 找到; 瞬时打扰 ｜ 原句：It is easier to hit on people on the Internet than in the street.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · hole (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7424-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'hole', JSON_ARRAY('hole', 'holes'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7424-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7424-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'There is a ____ in your sock.',
       JSON_ARRAY(),
       'hole',
       'n. 孔, 洞, 穴, 漏洞 vt. 挖洞, 掘坑 vi. 进洞, 凿洞 ｜ 原句：There is a hole in your sock.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · hollow (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7425-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'hollow', JSON_ARRAY('hollow', 'hollows'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7425-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7425-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'My life is ____ without him.',
       JSON_ARRAY(),
       'hollow',
       'n. 洞, 窟窿, 山谷 a. 空的, 虚伪的, 空腹的, 凹的 vi. 形成空洞 vt. 挖空 ｜ 原句：My life is hollow without him.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · holy (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7426-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'holy', JSON_ARRAY('holy', 'holier', 'holiest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7426-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7426-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The man on whom you see the Spirit come down and remain is he who will baptize with the ____ Spirit.',
       JSON_ARRAY(),
       'holy',
       'a. 神圣的, 圣洁的, 至善的 n. 神圣的东西 ｜ 原句：The man on whom you see the Spirit come down and remain is he who will baptize with the Holy Spirit.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · honest (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7427-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'honest', JSON_ARRAY('honest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7427-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7427-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'You seem to be an ____ man.',
       JSON_ARRAY(),
       'honest',
       'a. 诚实的, 坦直的, 可靠的 ｜ 原句：You seem to be an honest man.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · honesty (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7428-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'honesty', JSON_ARRAY('honesty', 'honesties'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7428-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7428-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '____ was the most important factor in his success.',
       JSON_ARRAY(),
       'honesty',
       'n. 诚实, 公正, 正直 ｜ 原句：Honesty was the most important factor in his success.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · honey (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7429-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'honey', JSON_ARRAY('honey', 'honeys'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7429-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7429-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '____ in the mouth and poison in the heart.',
       JSON_ARRAY(),
       'honey',
       'n. 蜂蜜, 甜蜜, 爱人 a. 蜂蜜似的, 甜蜜的, 甘美的 vt. 加蜜使甜, 对...说甜言蜜语 vi. 说甜言蜜语, 奉承 ｜ 原句：Honey in the mouth and poison in the heart.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · honeymoon (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7430-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'honeymoon', JSON_ARRAY('honeymoon', 'honeymoons'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7430-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7430-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'More and more couples go on ____ trips abroad.',
       JSON_ARRAY(),
       'honeymoon',
       'n. 蜜月, 蜜月假期 vi. 渡蜜月 ｜ 原句：More and more couples go on honeymoon trips abroad.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · honour (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7431-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'honour', JSON_ARRAY('honour', 'honours'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7431-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7431-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Over 100 players competed for the ____ of representing the county in the National Finals.',
       JSON_ARRAY(),
       'honour',
       'n. 荣誉, 头衔, 信用, 尊敬, 名誉, 阁下, 勋章 vt. 尊敬, 授予荣誉, 承兑, 实践 ｜ 原句：Over 100 players competed for the honour of representing the county in the National Finals.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · hook (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7433-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'hook', JSON_ARRAY('hook', 'hooks'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7433-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7433-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Hang your coat on the ____.',
       JSON_ARRAY(),
       'hook',
       'n. 钩, 钩状, 镰刀, 陷阱 vt. 挂...于钩上, 钩住, 引上钩, 偷窃 vi. 弯成钩状, 钩紧 [计] 钩 ｜ 原句：Hang your coat on the hook.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · hopeful (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7434-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'hopeful', JSON_ARRAY('hopeful', 'hopefuls'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7434-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7434-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I feel ____ about the future.',
       JSON_ARRAY(),
       'hopeful',
       'n. 有希望之人, 有前途之人 a. 有希望的, 怀抱希望的, 保持乐观的 ｜ 原句：I feel hopeful about the future.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · hopeless (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7435-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'hopeless', JSON_ARRAY('hopeless'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7435-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7435-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'You really are ____.',
       JSON_ARRAY(),
       'hopeless',
       'a. 无希望的, 绝望的, 不可救药的 ｜ 原句：You really are hopeless.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · horizon (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7436-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'horizon', JSON_ARRAY('horizon', 'horizons'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7436-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7436-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The moon was above the ____.',
       JSON_ARRAY(),
       'horizon',
       'n. 地平线, 眼界, (天)视地平 ｜ 原句：The moon was above the horizon.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · horizontal (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7437-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'horizontal', JSON_ARRAY('horizontal', 'horizontals'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7437-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7437-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The stripes were ____.',
       JSON_ARRAY(),
       'horizontal',
       'n. 水平线, 水平面, 水平位置 a. 水平线的, 平坦的, 横的 n. 水平 [计] 水平 ｜ 原句：The stripes were horizontal.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · horn (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7438-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'horn', JSON_ARRAY('horn', 'horns'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7438-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7438-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'This may sound like blowing my own ____, but ...',
       JSON_ARRAY(),
       'horn',
       'n. 角, 角质, 喇叭, 号角 a. 角制的 vt. 用角触, 长角于 ｜ 原句：This may sound like blowing my own horn, but ...',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · horrible (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7439-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'horrible', JSON_ARRAY('horrible'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7439-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7439-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I just wish we could leave this ____ place.',
       JSON_ARRAY(),
       'horrible',
       'a. 可怕的, 遭透的, 极讨厌的 ｜ 原句：I just wish we could leave this horrible place.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · horror (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7440-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'horror', JSON_ARRAY('horror', 'horrors'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7440-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7440-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I''m going to see a ____ film.',
       JSON_ARRAY(),
       'horror',
       'n. 惊骇, 恐怖, 惨状 [医] 恐怖, 恐惧 ｜ 原句：I''m going to see a horror film.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · horsepower (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7441-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'horsepower', JSON_ARRAY('horsepower', 'horsepowers'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7441-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7441-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'a two-hundred ____ engine',
       JSON_ARRAY(),
       'horsepower',
       'n. 马力 [电] 马力 ｜ 原句：a two-hundred horsepower engine',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · host (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7442-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'host', JSON_ARRAY('host', 'hosts'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7442-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7442-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'A guest should not try to make himself superior to the ____.',
       JSON_ARRAY(),
       'host',
       'n. 主人, 旅馆老板, 节目主持人 vt. 当主人招待, 作...节目主持人 [计] 主机, 宿主机 ｜ 原句：A guest should not try to make himself superior to the host.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · hostess (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7443-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'hostess', JSON_ARRAY('hostess', 'hostesses'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7443-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7443-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He married an air ____.',
       JSON_ARRAY(),
       'hostess',
       'n. 女主人, 女房东, 女老板 ｜ 原句：He married an air hostess.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · hostile (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7444-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'hostile', JSON_ARRAY('hostile'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7444-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7444-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'We, ACME Ltd., hereby announce that we will resist with all our strength this ____ takeover.',
       JSON_ARRAY(),
       'hostile',
       'a. 敌人的, 怀敌意的, 敌对的 n. 敌对分子 ｜ 原句：We, ACME Ltd., hereby announce that we will resist with all our strength this hostile takeover.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · household (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7445-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'household', JSON_ARRAY('household', 'households'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7445-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7445-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'More and more married couples share ____ chores.',
       JSON_ARRAY(),
       'household',
       'n. 一家人, 家庭, 家族, 王室 a. 家庭的, 家常的, 王室的 ｜ 原句：More and more married couples share household chores.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · housewife (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7446-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'housewife', JSON_ARRAY('housewife', 'housewifes'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7446-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7446-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Married at nineteen, she was a traditional ____ and mother of four children.',
       JSON_ARRAY(),
       'housewife',
       'n. 主妇, 家庭妇女 ｜ 原句：Married at nineteen, she was a traditional housewife and mother of four children.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · however (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7447-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'however', JSON_ARRAY('however'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7447-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7447-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '____ you do it, the result will be the same.',
       JSON_ARRAY(),
       'however',
       'adv. 然而, 无论如何, 究竟怎样 conj. 然而, 可是 ｜ 原句：However you do it, the result will be the same.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · huge (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7448-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'huge', JSON_ARRAY('huge'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7448-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7448-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Seen from the sky, the river looked like a ____ snake.',
       JSON_ARRAY(),
       'huge',
       'a. 极大的, 巨大的, 无限的 ｜ 原句：Seen from the sky, the river looked like a huge snake.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · human (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7449-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'human', JSON_ARRAY('human', 'humans'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7449-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7449-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'To err is ____, to forgive divine.',
       JSON_ARRAY(),
       'human',
       'n. 人, 人类 a. 人类的, 似人类的, 人性的, 有同情心的 ｜ 原句：To err is human, to forgive divine.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · humble (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7450-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'humble', JSON_ARRAY('humble', 'humbler', 'humblest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7450-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7450-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Be it ever so ____, there''s no place like home.',
       JSON_ARRAY(),
       'humble',
       'a. 低下的, 谦逊的, 粗陋的 vt. 使...卑下, 降低...地位, 贬抑 ｜ 原句：Be it ever so humble, there''s no place like home.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · humid (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7451-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'humid', JSON_ARRAY('humid'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7451-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7451-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'It is extremely hot and ____ in Bali in December.',
       JSON_ARRAY(),
       'humid',
       'a. 潮湿的, 湿润的, 多湿气的 ｜ 原句：It is extremely hot and humid in Bali in December.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · humor (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7452-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'humor', JSON_ARRAY('humor', 'humors'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7452-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7452-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'You have a good sense of ____.',
       JSON_ARRAY(),
       'humor',
       'n. 幽默, 诙谐, 心情 vt. 迎合, 牵就, 顺应 ｜ 原句：You have a good sense of humor.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · humorous (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7453-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'humorous', JSON_ARRAY('humorous'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7453-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7453-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The writer is very ____.',
       JSON_ARRAY(),
       'humorous',
       'a. 富幽默感的, 滑稽的, 诙谐的 ｜ 原句：The writer is very humorous.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · humour (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7454-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'humour', JSON_ARRAY('humour', 'humours'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7454-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7454-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He has a great sense of ____.',
       JSON_ARRAY(),
       'humour',
       'n. 幽默, 诙谐, 情绪, 体液 vt. 使满足, 迁就 ｜ 原句：He has a great sense of humour.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.15 · hunger (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7455-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'hunger', JSON_ARRAY('hunger', 'hungers'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7455-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7455-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'To him, ____ was an abstract concept; he always had enough to eat.',
       JSON_ARRAY(),
       'hunger',
       'n. 饥饿, 渴望, 饥荒 vt. 使挨饿 vi. 挨饿, 渴望 ｜ 原句：To him, hunger was an abstract concept; he always had enough to eat.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);
