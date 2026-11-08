-- V1.0.22__fix_vocab_accepted.sql：词汇题 accepted_answers 修正 + 补齐新增题（由 scripts/generate-vocab-questions.mjs --fix-sql 生成，请勿手改）
-- 目标库：exercise_db
-- 风险：低（UPDATE 只改 accepted_answers；INSERT 复用 NOT EXISTS 双幂等写法）
-- 回滚：新增题按 external_key 删除；accepted 用导入前的 sql/backup/*_exercise_db_vocab_data.sql 恢复
-- 生成时间：2026-11-08T13:17:46.004Z
-- 修正行数：269    新增题数：13    规则外存量：3

-- ---------- 规则外存量题（不自动删除，需人工决定） ----------
--   vocab-auto-10695-1
--   vocab-auto-7165-1
--   vocab-auto-7190-1

-- ---------- 新增题目 ----------
-- V1.0.22 · calm (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6271-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'calm', JSON_ARRAY('calm', 'calmer', 'calmest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6271-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6271-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'My friends always say I''m too ____, but my family always says I''m too annoying.',
       JSON_ARRAY(),
       'calm',
       'n. 平稳, 风平浪静 a. 平静的, 冷静的 vi. 平静下来, 镇静 vt. 使平静 ｜ 原句：My friends always say I''m too calm, but my family always says I''m too annoying.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.22 · cheer (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6358-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'cheer', JSON_ARRAY('cheer', 'cheerer', 'cheerest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6358-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6358-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The situation is improving, so ____ up!',
       JSON_ARRAY(),
       'cheer',
       'n. 愉快, 振奋, 欢呼 vi. 欢呼, 喝彩, 快活起来 vt. 使振奋, 欢呼 ｜ 原句：The situation is improving, so cheer up!',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.22 · harm (CET4, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7373-1', 1, 'CET4', 5, 'FILL_BLANK',
       'IMPORT', 'harm', JSON_ARRAY('harm', 'harmer', 'harmest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7373-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7373-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'This book will do more ____ than good.',
       JSON_ARRAY(),
       'harm',
       'n. 伤害, 害处 vt. 伤害, 损害 ｜ 原句：This book will do more harm than good.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.22 · independent (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7512-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'independent', JSON_ARRAY('independent'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7512-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7512-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I want to be more ____.',
       JSON_ARRAY(),
       'independent',
       'n. 独立自主者, 无党派者 a. 独立的, 有主见的, 不须依赖的, 不受约束的 ｜ 原句：I want to be more independent.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.22 · moisture (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7943-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'moisture', JSON_ARRAY('moisture'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7943-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7943-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'When the soil is dry, more ____ is lost from the plant.',
       JSON_ARRAY(),
       'moisture',
       'n. 湿气, 水分, 降雨 [化] 含水量; 含湿量 ｜ 原句：When the soil is dry, more moisture is lost from the plant.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.22 · narrow (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7989-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'narrow', JSON_ARRAY('narrow', 'narrower', 'narrowest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7989-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7989-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The angle would be too ____.',
       JSON_ARRAY(),
       'narrow',
       'n. 狭窄部分, 隘路 a. 狭窄的, 仔细的, 有限的, 勉强的, 狭隘的, 手紧的 vi. 变窄 vt. 使变狭窄 ｜ 原句：The angle would be too narrow.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.22 · patient (CET4, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8203-1', 1, 'CET4', 2, 'FILL_BLANK',
       'IMPORT', 'patient', JSON_ARRAY('patient'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8203-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8203-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'My driving instructor says I should be more ____.',
       JSON_ARRAY(),
       'patient',
       'n. 病人, 承受者 a. 忍耐的, 容忍的, 有耐性的, 坚忍的 ｜ 原句：My driving instructor says I should be more patient.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.22 · radical (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8503-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'radical', JSON_ARRAY('radical'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8503-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8503-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'She has a very ____ opinion about the problem.',
       JSON_ARRAY(),
       'radical',
       'n. 激进分子, 词根, 基础, 根式, 根 a. 激进的, 根本的, 基本的, 根的 ｜ 原句：She has a very radical opinion about the problem.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.22 · roast (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8710-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'roast', JSON_ARRAY('roast', 'roaster', 'roastest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8710-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8710-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'How about some more ____ beef?',
       JSON_ARRAY(),
       'roast',
       'n. 烤肉, 烘烤, 嘲笑 a. 烘烤的, 烤过的 vt. 烤, 炙, 烘焙, 嘲笑 vi. 烤, 炙, 烘焙 ｜ 原句：How about some more roast beef?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.22 · salad (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-8767-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'salad', JSON_ARRAY('salad'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-8767-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-8767-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Would you like some more ____?',
       JSON_ARRAY(),
       'salad',
       'n. 色拉 ｜ 原句：Would you like some more salad?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.22 · swift (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-9216-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'swift', JSON_ARRAY('swift', 'swifter', 'swiftest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-9216-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-9216-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The stream is not very ____.',
       JSON_ARRAY(),
       'swift',
       'n. 褐雨燕, 快速爬行的小蜥蜴, 蝙蝠蛾, 大滚筒 a. 迅速的, 快的, 敏捷的, 立刻的 adv. 迅速地, 敏捷地 ｜ 原句：The stream is not very swift.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.22 · workman (CET4, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-9652-1', 1, 'CET4', 7, 'FILL_BLANK',
       'IMPORT', 'workman', JSON_ARRAY('workmen'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-9652-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-9652-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'In University Square ____ are building a steel fence.',
       JSON_ARRAY(),
       'workmen',
       'n. 工人, 工匠, 男工 ｜ 原句：In University Square workmen are building a steel fence.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.22 · fiber (CET6, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10345-1', 1, 'CET6', 3, 'FILL_BLANK',
       'IMPORT', 'fiber', JSON_ARRAY('fiber', 'fiberer', 'fiberest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10345-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10345-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'You need to eat more ____.',
       JSON_ARRAY(),
       'fiber',
       'n. 纤维, 构造, 纤维制品 [化] 纤维 ｜ 原句：You need to eat more fiber.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- ---------- 修正 accepted_answers ----------
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('abandoned', 'abandoning', 'abandons') WHERE `external_key` = 'vocab-auto-2-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('accomplished', 'accomplishes', 'accomplishing') WHERE `external_key` = 'vocab-auto-4-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('benefits') WHERE `external_key` = 'vocab-auto-5-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('circumstances') WHERE `external_key` = 'vocab-auto-7-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('demonstrated', 'demonstrates', 'demonstrating') WHERE `external_key` = 'vocab-auto-9-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('negotiated', 'negotiates', 'negotiating') WHERE `external_key` = 'vocab-auto-16-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('acres') WHERE `external_key` = 'vocab-auto-5880-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('altered', 'altering', 'alters') WHERE `external_key` = 'vocab-auto-5948-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('amased', 'amases', 'amasing', 'amazed', 'amazes', 'amazing') WHERE `external_key` = 'vocab-auto-5955-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('ancestors') WHERE `external_key` = 'vocab-auto-5966-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('ants') WHERE `external_key` = 'vocab-auto-5976-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('anyhow') WHERE `external_key` = 'vocab-auto-5980-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('anyway') WHERE `external_key` = 'vocab-auto-5982-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('awaited', 'awaiting', 'awaits') WHERE `external_key` = 'vocab-auto-6085-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('banners') WHERE `external_key` = 'vocab-auto-6109-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('barely') WHERE `external_key` = 'vocab-auto-6113-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('barriers') WHERE `external_key` = 'vocab-auto-6118-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('blind', 'blinder', 'blindest') WHERE `external_key` = 'vocab-auto-6181-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('bound', 'bounder', 'boundest') WHERE `external_key` = 'vocab-auto-6204-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('bristles') WHERE `external_key` = 'vocab-auto-6226-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('bruises') WHERE `external_key` = 'vocab-auto-6236-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('bubbles') WHERE `external_key` = 'vocab-auto-6238-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('centimetres') WHERE `external_key` = 'vocab-auto-6324-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('chairman', 'chairmen') WHERE `external_key` = 'vocab-auto-6339-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('choked', 'chokes', 'choking') WHERE `external_key` = 'vocab-auto-6378-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('circulated', 'circulates', 'circulating') WHERE `external_key` = 'vocab-auto-6388-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('clothed', 'clothes', 'clothing') WHERE `external_key` = 'vocab-auto-6416-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('coils') WHERE `external_key` = 'vocab-auto-6428-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('compiled', 'compiles', 'compiling') WHERE `external_key` = 'vocab-auto-6477-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('composed', 'composes', 'composing') WHERE `external_key` = 'vocab-auto-6486-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('compressed', 'compresses', 'compressing') WHERE `external_key` = 'vocab-auto-6490-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('comprised', 'comprises', 'comprising') WHERE `external_key` = 'vocab-auto-6491-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('condensed', 'condenses', 'condensing') WHERE `external_key` = 'vocab-auto-6506-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('confined', 'confines', 'confining') WHERE `external_key` = 'vocab-auto-6514-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('containers') WHERE `external_key` = 'vocab-auto-6552-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('content') WHERE `external_key` = 'vocab-auto-6555-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('conventions') WHERE `external_key` = 'vocab-auto-6570-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('cores') WHERE `external_key` = 'vocab-auto-6583-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('dairies') WHERE `external_key` = 'vocab-auto-6660-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('deduced', 'deduces', 'deducing') WHERE `external_key` = 'vocab-auto-6690-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('depressed', 'depresses', 'depressing') WHERE `external_key` = 'vocab-auto-6726-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('desert') WHERE `external_key` = 'vocab-auto-6734-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('devised', 'devises', 'devising') WHERE `external_key` = 'vocab-auto-6754-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('dimensions') WHERE `external_key` = 'vocab-auto-6773-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('disclosed', 'discloses', 'disclosing') WHERE `external_key` = 'vocab-auto-6790-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('displeased', 'displeases', 'displeasing') WHERE `external_key` = 'vocab-auto-6806-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('disposed', 'disposes', 'disposing') WHERE `external_key` = 'vocab-auto-6808-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('dissolved', 'dissolves', 'dissolving') WHERE `external_key` = 'vocab-auto-6811-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('distributed', 'distributes', 'distributing') WHERE `external_key` = 'vocab-auto-6818-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('dominated', 'dominates', 'dominating') WHERE `external_key` = 'vocab-auto-6831-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('due', 'duer', 'duest') WHERE `external_key` = 'vocab-auto-6867-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('dwellings') WHERE `external_key` = 'vocab-auto-6876-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('easily') WHERE `external_key` = 'vocab-auto-6886-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('educated', 'educates', 'educating') WHERE `external_key` = 'vocab-auto-6897-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('electrons') WHERE `external_key` = 'vocab-auto-6916-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('emited', 'emiting', 'emits', 'emitted') WHERE `external_key` = 'vocab-auto-6930-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('enforced', 'enforces', 'enforcing') WHERE `external_key` = 'vocab-auto-6950-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('engaged', 'engages', 'engaging') WHERE `external_key` = 'vocab-auto-6951-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('englishman', 'englishmen') WHERE `external_key` = 'vocab-auto-6955-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('evaporated', 'evaporates', 'evaporating') WHERE `external_key` = 'vocab-auto-6991-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('evolved', 'evolves', 'evolving') WHERE `external_key` = 'vocab-auto-7000-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('exclaimed', 'exclaiming', 'exclaims') WHERE `external_key` = 'vocab-auto-7016-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('exerted', 'exerting', 'exerts') WHERE `external_key` = 'vocab-auto-7023-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('expectations') WHERE `external_key` = 'vocab-auto-7033-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('expelled', 'expelling', 'expels') WHERE `external_key` = 'vocab-auto-7034-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('exports') WHERE `external_key` = 'vocab-auto-7049-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('facilities') WHERE `external_key` = 'vocab-auto-7067-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('fairly') WHERE `external_key` = 'vocab-auto-7076-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('fireman', 'firemen') WHERE `external_key` = 'vocab-auto-7138-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('fisherman', 'fishermen') WHERE `external_key` = 'vocab-auto-7140-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('footsteps') WHERE `external_key` = 'vocab-auto-7170-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('forth') WHERE `external_key` = 'vocab-auto-7185-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('freely') WHERE `external_key` = 'vocab-auto-7201-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('frictions') WHERE `external_key` = 'vocab-auto-7208-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('frustrated', 'frustrates', 'frustrating') WHERE `external_key` = 'vocab-auto-7216-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('fulfiled', 'fulfiling', 'fulfils') WHERE `external_key` = 'vocab-auto-7219-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('fundamental') WHERE `external_key` = 'vocab-auto-7222-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('fur', 'furer', 'furest') WHERE `external_key` = 'vocab-auto-7225-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('gentleman', 'gentlemen') WHERE `external_key` = 'vocab-auto-7259-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('gently') WHERE `external_key` = 'vocab-auto-7260-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('germs') WHERE `external_key` = 'vocab-auto-7264-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('grey', 'greyer', 'greyest') WHERE `external_key` = 'vocab-auto-7325-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('hardly') WHERE `external_key` = 'vocab-auto-7369-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('hastened', 'hastening', 'hastens') WHERE `external_key` = 'vocab-auto-7379-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('headmaster') WHERE `external_key` = 'vocab-auto-7391-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('herds') WHERE `external_key` = 'vocab-auto-7410-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('highly') WHERE `external_key` = 'vocab-auto-7416-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('hollow', 'hollower', 'hollowest') WHERE `external_key` = 'vocab-auto-7425-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('hopeful') WHERE `external_key` = 'vocab-auto-7434-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('horizontal') WHERE `external_key` = 'vocab-auto-7437-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('human') WHERE `external_key` = 'vocab-auto-7449-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('ideal') WHERE `external_key` = 'vocab-auto-7462-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('imprisoned', 'imprisoning', 'imprisons') WHERE `external_key` = 'vocab-auto-7498-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('indispensable') WHERE `external_key` = 'vocab-auto-7521-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('inferred', 'inferring', 'infers') WHERE `external_key` = 'vocab-auto-7533-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('inhabited', 'inhabiting', 'inhabits') WHERE `external_key` = 'vocab-auto-7540-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('inhabitants') WHERE `external_key` = 'vocab-auto-7541-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('inquiries') WHERE `external_key` = 'vocab-auto-7554-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('institutions') WHERE `external_key` = 'vocab-auto-7571-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('insured', 'insures', 'insuring') WHERE `external_key` = 'vocab-auto-7578-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('interruptions') WHERE `external_key` = 'vocab-auto-7603-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('isolated', 'isolates', 'isolating') WHERE `external_key` = 'vocab-auto-7628-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('jewels') WHERE `external_key` = 'vocab-auto-7641-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('junior') WHERE `external_key` = 'vocab-auto-7654-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('knee', 'kneer', 'kneest') WHERE `external_key` = 'vocab-auto-7672-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('lately') WHERE `external_key` = 'vocab-auto-7698-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('later') WHERE `external_key` = 'vocab-auto-7699-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('limbs') WHERE `external_key` = 'vocab-auto-7759-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('listeners') WHERE `external_key` = 'vocab-auto-7773-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('locomotives') WHERE `external_key` = 'vocab-auto-7789-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('mainly') WHERE `external_key` = 'vocab-auto-7826-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('male', 'maler', 'malest') WHERE `external_key` = 'vocab-auto-7831-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('mankind') WHERE `external_key` = 'vocab-auto-7838-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('margins') WHERE `external_key` = 'vocab-auto-7845-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('material') WHERE `external_key` = 'vocab-auto-7860-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('mercury') WHERE `external_key` = 'vocab-auto-7890-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('merely') WHERE `external_key` = 'vocab-auto-7893-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('millimetres') WHERE `external_key` = 'vocab-auto-7914-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('mortal') WHERE `external_key` = 'vocab-auto-7952-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('mostly') WHERE `external_key` = 'vocab-auto-7954-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('namely') WHERE `external_key` = 'vocab-auto-7987-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('newly') WHERE `external_key` = 'vocab-auto-8024-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('obliged', 'obliges', 'obliging') WHERE `external_key` = 'vocab-auto-8058-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('official') WHERE `external_key` = 'vocab-auto-8080-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('onions') WHERE `external_key` = 'vocab-auto-8085-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('organisms') WHERE `external_key` = 'vocab-auto-8112-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('organised', 'organises', 'organising', 'organized', 'organizes', 'organizing') WHERE `external_key` = 'vocab-auto-8114-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('ornaments') WHERE `external_key` = 'vocab-auto-8120-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('parallel') WHERE `external_key` = 'vocab-auto-8181-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('partly') WHERE `external_key` = 'vocab-auto-8192-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('peasant') WHERE `external_key` = 'vocab-auto-8217-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('persisted', 'persisting', 'persists') WHERE `external_key` = 'vocab-auto-8240-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('philosophy') WHERE `external_key` = 'vocab-auto-8252-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('pills') WHERE `external_key` = 'vocab-auto-8267-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('ploughs') WHERE `external_key` = 'vocab-auto-8293-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('poetrier', 'poetriest', 'poetry') WHERE `external_key` = 'vocab-auto-8302-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('postman', 'postmen') WHERE `external_key` = 'vocab-auto-8340-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('postponed', 'postpones', 'postponing') WHERE `external_key` = 'vocab-auto-8341-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('precautions') WHERE `external_key` = 'vocab-auto-8357-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('prescribed', 'prescribes', 'prescribing') WHERE `external_key` = 'vocab-auto-8373-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('prohibited', 'prohibiting', 'prohibits') WHERE `external_key` = 'vocab-auto-8425-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('provisions') WHERE `external_key` = 'vocab-auto-8455-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('purely') WHERE `external_key` = 'vocab-auto-8471-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('purple', 'purpler', 'purplest') WHERE `external_key` = 'vocab-auto-8474-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('quickened', 'quickening', 'quickens') WHERE `external_key` = 'vocab-auto-8489-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('rarely') WHERE `external_key` = 'vocab-auto-8522-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('rather') WHERE `external_key` = 'vocab-auto-8525-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('reinforced', 'reinforces', 'reinforcing') WHERE `external_key` = 'vocab-auto-8594-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('reproduced', 'reproduces', 'reproducing') WHERE `external_key` = 'vocab-auto-8637-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('restricted', 'restricting', 'restricts') WHERE `external_key` = 'vocab-auto-8674-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('ribs') WHERE `external_key` = 'vocab-auto-8695-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('romans') WHERE `external_key` = 'vocab-auto-8722-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('rotations') WHERE `external_key` = 'vocab-auto-8731-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('routine') WHERE `external_key` = 'vocab-auto-8737-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('sadly') WHERE `external_key` = 'vocab-auto-8758-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('safely') WHERE `external_key` = 'vocab-auto-8761-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('salesman', 'salesmen') WHERE `external_key` = 'vocab-auto-8770-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('scouts') WHERE `external_key` = 'vocab-auto-8810-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('seised', 'seises', 'seising', 'seized', 'seizes', 'seizing') WHERE `external_key` = 'vocab-auto-8829-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('separate') WHERE `external_key` = 'vocab-auto-8847-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('shier', 'shiest', 'shy') WHERE `external_key` = 'vocab-auto-8906-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('silver', 'silverer', 'silverest') WHERE `external_key` = 'vocab-auto-8920-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('skimmed', 'skimming', 'skims') WHERE `external_key` = 'vocab-auto-8938-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('slowly') WHERE `external_key` = 'vocab-auto-8956-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('softly') WHERE `external_key` = 'vocab-auto-8981-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('solely') WHERE `external_key` = 'vocab-auto-8986-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('somewhat') WHERE `external_key` = 'vocab-auto-8994-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('specialised', 'specialises', 'specialising', 'specialized', 'specializes', 'specializing') WHERE `external_key` = 'vocab-auto-9021-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('sportsman', 'sportsmen') WHERE `external_key` = 'vocab-auto-9048-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('statesman', 'statesmen') WHERE `external_key` = 'vocab-auto-9079-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('static') WHERE `external_key` = 'vocab-auto-9080-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('steered', 'steering', 'steers') WHERE `external_key` = 'vocab-auto-9093-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('stripes') WHERE `external_key` = 'vocab-auto-9136-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('superior') WHERE `external_key` = 'vocab-auto-9182-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('supplements') WHERE `external_key` = 'vocab-auto-9183-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('surely') WHERE `external_key` = 'vocab-auto-9188-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('suspended', 'suspending', 'suspends') WHERE `external_key` = 'vocab-auto-9202-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('textiles') WHERE `external_key` = 'vocab-auto-9277-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('thus') WHERE `external_key` = 'vocab-auto-9306-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('tides') WHERE `external_key` = 'vocab-auto-9308-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('torture') WHERE `external_key` = 'vocab-auto-9340-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('transmited', 'transmiting', 'transmits', 'transmitted') WHERE `external_key` = 'vocab-auto-9372-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('troops') WHERE `external_key` = 'vocab-auto-9393-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('truly') WHERE `external_key` = 'vocab-auto-9398-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('trust', 'truster', 'trustest') WHERE `external_key` = 'vocab-auto-9401-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('turbines') WHERE `external_key` = 'vocab-auto-9410-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('undergraduates') WHERE `external_key` = 'vocab-auto-9434-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('underlined', 'underlines', 'underlining') WHERE `external_key` = 'vocab-auto-9435-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('unloaded', 'unloading', 'unloads') WHERE `external_key` = 'vocab-auto-9463-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('utilities') WHERE `external_key` = 'vocab-auto-9492-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('variations') WHERE `external_key` = 'vocab-auto-9510-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('violet') WHERE `external_key` = 'vocab-auto-9545-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('wakened', 'wakening', 'wakens') WHERE `external_key` = 'vocab-auto-9575-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('wandered', 'wandering', 'wanders') WHERE `external_key` = 'vocab-auto-9577-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('waterproof') WHERE `external_key` = 'vocab-auto-9583-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('welfare') WHERE `external_key` = 'vocab-auto-9602-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('wholly') WHERE `external_key` = 'vocab-auto-9623-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('widely') WHERE `external_key` = 'vocab-auto-9625-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('widened', 'widening', 'widens') WHERE `external_key` = 'vocab-auto-9626-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('worse') WHERE `external_key` = 'vocab-auto-9657-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('worthier', 'worthiest', 'worthy') WHERE `external_key` = 'vocab-auto-9662-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('admiration') WHERE `external_key` = 'vocab-auto-9703-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('affiliated', 'affiliates', 'affiliating') WHERE `external_key` = 'vocab-auto-9713-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('aggravated', 'aggravates', 'aggravating') WHERE `external_key` = 'vocab-auto-9717-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('ascended', 'ascending', 'ascends') WHERE `external_key` = 'vocab-auto-9776-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('asserted', 'asserting', 'asserts') WHERE `external_key` = 'vocab-auto-9783-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('assimilated', 'assimilates', 'assimilating') WHERE `external_key` = 'vocab-auto-9787-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('baffled', 'baffles', 'baffling') WHERE `external_key` = 'vocab-auto-9810-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('casualties') WHERE `external_key` = 'vocab-auto-9894-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('cited', 'cites', 'citing') WHERE `external_key` = 'vocab-auto-9925-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('collided', 'collides', 'colliding') WHERE `external_key` = 'vocab-auto-9951-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('commodities') WHERE `external_key` = 'vocab-auto-9959-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('commonplace') WHERE `external_key` = 'vocab-auto-9960-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('competitors') WHERE `external_key` = 'vocab-auto-9971-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('concessions') WHERE `external_key` = 'vocab-auto-9988-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('conferred', 'conferring', 'confers') WHERE `external_key` = 'vocab-auto-9990-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('constrained', 'constraining', 'constrains') WHERE `external_key` = 'vocab-auto-10009-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('contaminated', 'contaminates', 'contaminating') WHERE `external_key` = 'vocab-auto-10014-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('counterparts') WHERE `external_key` = 'vocab-auto-10050-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('deemed', 'deeming', 'deems') WHERE `external_key` = 'vocab-auto-10096-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('designated', 'designates', 'designating') WHERE `external_key` = 'vocab-auto-10127-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('deviated', 'deviates', 'deviating') WHERE `external_key` = 'vocab-auto-10139-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('diagnosed', 'diagnoses', 'diagnosing') WHERE `external_key` = 'vocab-auto-10143-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('diminished', 'diminishes', 'diminishing') WHERE `external_key` = 'vocab-auto-10152-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('dispatched', 'dispatches', 'dispatching') WHERE `external_key` = 'vocab-auto-10173-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('displaced', 'displaces', 'displacing') WHERE `external_key` = 'vocab-auto-10176-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('distorted', 'distorting', 'distorts') WHERE `external_key` = 'vocab-auto-10189-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('diverted', 'diverting', 'diverts') WHERE `external_key` = 'vocab-auto-10196-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('eccentric') WHERE `external_key` = 'vocab-auto-10224-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('elevated', 'elevates', 'elevating') WHERE `external_key` = 'vocab-auto-10239-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('embodied', 'embodies', 'embodying') WHERE `external_key` = 'vocab-auto-10249-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('endangered', 'endangering', 'endangers') WHERE `external_key` = 'vocab-auto-10256-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('entailed', 'entailing', 'entails') WHERE `external_key` = 'vocab-auto-10267-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('erupted', 'erupting', 'erupts') WHERE `external_key` = 'vocab-auto-10285-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('evenly') WHERE `external_key` = 'vocab-auto-10296-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('exempt') WHERE `external_key` = 'vocab-auto-10307-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('fro') WHERE `external_key` = 'vocab-auto-10403-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('fulfilled', 'fulfilling', 'fulfills') WHERE `external_key` = 'vocab-auto-10405-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('generalizations') WHERE `external_key` = 'vocab-auto-10417-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('illuminated', 'illuminates', 'illuminating') WHERE `external_key` = 'vocab-auto-10537-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('immortal') WHERE `external_key` = 'vocab-auto-10542-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('impaired', 'impairing', 'impairs') WHERE `external_key` = 'vocab-auto-10545-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('imperative') WHERE `external_key` = 'vocab-auto-10548-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('indulged', 'indulges', 'indulging') WHERE `external_key` = 'vocab-auto-10581-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('interconnected', 'interconnecting', 'interconnects') WHERE `external_key` = 'vocab-auto-10633-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('invalid') WHERE `external_key` = 'vocab-auto-10648-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('irritated', 'irritates', 'irritating') WHERE `external_key` = 'vocab-auto-10661-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('kidnaped', 'kidnaping', 'kidnapped', 'kidnaps') WHERE `external_key` = 'vocab-auto-10680-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('lingered', 'lingering', 'lingers') WHERE `external_key` = 'vocab-auto-10711-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('magnified', 'magnifies', 'magnifying') WHERE `external_key` = 'vocab-auto-10736-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('nominated', 'nominates', 'nominating') WHERE `external_key` = 'vocab-auto-10860-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('oars') WHERE `external_key` = 'vocab-auto-10882-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('paralysed', 'paralyses', 'paralysing', 'paralyzed', 'paralyzes', 'paralyzing') WHERE `external_key` = 'vocab-auto-10937-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('peers') WHERE `external_key` = 'vocab-auto-10955-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('permeated', 'permeates', 'permeating') WHERE `external_key` = 'vocab-auto-10968-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('portrayed', 'portraying', 'portrays') WHERE `external_key` = 'vocab-auto-11014-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('premiums') WHERE `external_key` = 'vocab-auto-11036-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('proficient') WHERE `external_key` = 'vocab-auto-11063-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('qualifications') WHERE `external_key` = 'vocab-auto-11100-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('sculptures') WHERE `external_key` = 'vocab-auto-11236-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('slack', 'slacker', 'slackest') WHERE `external_key` = 'vocab-auto-11295-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('specifications') WHERE `external_key` = 'vocab-auto-11334-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('spiral') WHERE `external_key` = 'vocab-auto-11342-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('stabilised', 'stabilises', 'stabilising', 'stabilized', 'stabilizes', 'stabilizing') WHERE `external_key` = 'vocab-auto-11347-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('symptoms') WHERE `external_key` = 'vocab-auto-11419-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('traits') WHERE `external_key` = 'vocab-auto-11487-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('transcended', 'transcending', 'transcends') WHERE `external_key` = 'vocab-auto-11491-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('unfolded', 'unfolding', 'unfolds') WHERE `external_key` = 'vocab-auto-11532-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('violations') WHERE `external_key` = 'vocab-auto-11575-1';
