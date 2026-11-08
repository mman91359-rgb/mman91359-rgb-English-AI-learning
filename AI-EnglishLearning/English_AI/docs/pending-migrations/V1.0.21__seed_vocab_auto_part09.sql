-- V1.0.21：词汇填空题自动生成（第 09 批，466 题）
-- 目标库：exercise_db
-- 来源：word_dictionary 例句挖空；生成脚本 scripts/generate-vocab-questions.mjs
-- 风险：低（纯 DML，NOT EXISTS 双重幂等：external_key + question_content）
-- 回滚：DELETE FROM question_info WHERE external_key LIKE 'vocab-auto-%';
--       DELETE FROM question_content WHERE question_id NOT IN (SELECT id FROM question_info);
-- 校验：stem 含 ___、analysis 无答案残留（生成时已断言）

-- V1.0.21 · lipstick (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10714-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'lipstick', JSON_ARRAY('lipstick', 'lipsticks'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10714-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10714-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Brian bought some ____ for Kate.',
       JSON_ARRAY(),
       'lipstick',
       'n. 口红, 唇膏 [机] 口红 ｜ 原句：Brian bought some lipstick for Kate.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · literacy (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10715-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'literacy', JSON_ARRAY('literacy', 'literacies'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10715-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10715-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'a campaign to promote adult ____',
       JSON_ARRAY(),
       'literacy',
       'n. 读写能力, 识字, 精通文学 ｜ 原句：a campaign to promote adult literacy',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · literal (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10716-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'literal', JSON_ARRAY('literal'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10716-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10716-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He explained the ____ meaning of the sentences.',
       JSON_ARRAY(),
       'literal',
       'a. 逐字的, 字面上的, 文字的, 字母的 n. 印刷错误 [计] 文字; 直接量; 字面量; 句节 ｜ 原句：He explained the literal meaning of the sentences.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · literally (CET6, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10717-1', 1, 'CET6', 3, 'FILL_BLANK',
       'IMPORT', 'literally', JSON_ARRAY('literally'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10717-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10717-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He took it ____.',
       JSON_ARRAY(),
       'literally',
       'adv. 逐字地, 按照字面上地, 不夸张地 ｜ 原句：He took it literally.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · litter (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10718-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'litter', JSON_ARRAY('litter', 'litters'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10718-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10718-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'A lot of people climb the railing, and even ____.',
       JSON_ARRAY(),
       'litter',
       'n. 垃圾, 杂乱, 轿, 担架 vt. 乱丢, 铺草, 弄乱 vi. 产仔, 乱丢垃圾 ｜ 原句：A lot of people climb the railing, and even litter.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · lobby (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10719-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'lobby', JSON_ARRAY('lobby', 'lobbies'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10719-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10719-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Meet me at the ____ of the Imperial Hotel at 6:30 p.m.',
       JSON_ARRAY(),
       'lobby',
       'n. 大厅, 休息室, 游说议员者 vi. 游说议员, 游说 vt. 游说 ｜ 原句：Meet me at the lobby of the Imperial Hotel at 6:30 p.m.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · locust (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10721-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'locust', JSON_ARRAY('locust', 'locusts'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10721-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10721-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'That''s not a grasshopper. It''s a ____!',
       JSON_ARRAY(),
       'locust',
       'n. 蝗虫, 蚱蜢, 蝉 ｜ 原句：That''s not a grasshopper. It''s a locust!',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · lodging (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10722-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'lodging', JSON_ARRAY('lodging', 'lodgings'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10722-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10722-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'This building is a capsule hotel ____ men and women.',
       JSON_ARRAY(),
       'lodging',
       'n. 寄宿处, 寄宿 [法] 提起, 住所 ｜ 原句：This building is a capsule hotel lodging men and women.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · lofty (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10723-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'lofty', JSON_ARRAY('lofty', 'loftier', 'loftiest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10723-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10723-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'No matter what grand and ____ reason you have, it''s not right to do this.',
       JSON_ARRAY(),
       'lofty',
       'a. 高的, 傲慢的, 崇高的, 高级的, 玄虚的 ｜ 原句：No matter what grand and lofty reason you have, it''s not right to do this.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · longitude (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10727-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'longitude', JSON_ARRAY('longitude', 'longitudes'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10727-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10727-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'This line represents the ____.',
       JSON_ARRAY(),
       'longitude',
       'n. 经度, 经线 [电] 经度 ｜ 原句：This line represents the longitude.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · lounge (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10729-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'lounge', JSON_ARRAY('lounge', 'lounges'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10729-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10729-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'the television ____',
       JSON_ARRAY(),
       'lounge',
       'n. 闲逛, 休闲室, 长沙发 vi. 闲混, (懒洋洋地)躺 vt. 闲混 ｜ 原句：the television lounge',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · luxurious (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10732-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'luxurious', JSON_ARRAY('luxurious'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10732-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10732-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The new theatre looks very ____.',
       JSON_ARRAY(),
       'luxurious',
       'a. 豪华的, 奢侈的, 放纵的 ｜ 原句：The new theatre looks very luxurious.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · magician (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10733-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'magician', JSON_ARRAY('magician', 'magicians'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10733-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10733-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The ____ had the children''s attention.',
       JSON_ARRAY(),
       'magician',
       'n. 魔术家, 幻术家, 术士 ｜ 原句：The magician had the children''s attention.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · magnetism (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10735-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'magnetism', JSON_ARRAY('magnetism'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10735-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10735-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'An electric current can generate ____.',
       JSON_ARRAY(),
       'magnetism',
       'n. 磁性, 吸引力, 磁学, 催眠术 [化] 磁学 ｜ 原句：An electric current can generate magnetism.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · magnify (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10736-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'magnify', JSON_ARRAY('magnify', 'magnified', 'magnifies', 'magnifying'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10736-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10736-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'At the Sheffield arena, the speakers were ____ ten times on a giant screen.',
       JSON_ARRAY(),
       'magnified',
       'vt. 放大, 扩大, 赞美, 夸大 vi. 有放大能力 ｜ 原句：At the Sheffield arena, the speakers were magnified ten times on a giant screen.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · magnitude (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10737-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'magnitude', JSON_ARRAY('magnitude', 'magnitudes'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10737-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10737-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'A massive earthquake of ____ 8.8 hit the Japanese islands today.',
       JSON_ARRAY(),
       'magnitude',
       'n. 巨大, 重大, 重要, 大小, 数量, 星等(指星的亮度) [计] 大小; 值 ｜ 原句：A massive earthquake of magnitude 8.8 hit the Japanese islands today.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · maiden (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10738-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'maiden', JSON_ARRAY('maiden', 'maidens'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10738-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10738-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The Titanic''s ____ voyage didn''t go so well.',
       JSON_ARRAY(),
       'maiden',
       'n. 年轻未婚女子, 少女, 处女 a. 未婚的, 处女的, 初次的, 无经验的 ｜ 原句：The Titanic''s maiden voyage didn''t go so well.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · makeup (CET6, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10740-1', 1, 'CET6', 3, 'FILL_BLANK',
       'IMPORT', 'makeup', JSON_ARRAY('makeup', 'makeups'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10740-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10740-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'She wears a lot of ____.',
       JSON_ARRAY(),
       'makeup',
       'n. 组成, 性格, 化妆品, 化装(术), 虚构, 补考 ｜ 原句：She wears a lot of makeup.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · malice (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10741-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'malice', JSON_ARRAY('malice', 'malices'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10741-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10741-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'There was no ____ intended in what she said.',
       JSON_ARRAY(),
       'malice',
       'n. 恶意, 蓄意害人, 怨恨 [法] 预谋, 蓄意, 恶意 ｜ 原句：There was no malice intended in what she said.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · malicious (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10742-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'malicious', JSON_ARRAY('malicious'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10742-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10742-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Nothing will hinder my ____ plan.',
       JSON_ARRAY(),
       'malicious',
       'a. 怀恶意的, 恶毒的 ｜ 原句：Nothing will hinder my malicious plan.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · mall (CET6, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10743-1', 1, 'CET6', 3, 'FILL_BLANK',
       'IMPORT', 'mall', JSON_ARRAY('mall', 'malls'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10743-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10743-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Where''s the nearest shopping ____?',
       JSON_ARRAY(),
       'mall',
       'n. 林荫路 ｜ 原句：Where''s the nearest shopping mall?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · mammal (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10745-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'mammal', JSON_ARRAY('mammal', 'mammals'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10745-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10745-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'A dolphin is a kind of ____.',
       JSON_ARRAY(),
       'mammal',
       'n. 哺乳动物 [化] 哺乳动物 ｜ 原句：A dolphin is a kind of mammal.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · managerial (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10746-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'managerial', JSON_ARRAY('managerial'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10746-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10746-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'My classmate, Xiao Ming, has strong ____ capability.',
       JSON_ARRAY(),
       'managerial',
       'a. 管理的 [经] 管理上的, 经营上的 ｜ 原句：My classmate, Xiao Ming, has strong managerial capability.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · manifest (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10747-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'manifest', JSON_ARRAY('manifest', 'manifests'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10747-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10747-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Spirits of Heaven and Earth, heed my call; ____ swiftly by divine decree!',
       JSON_ARRAY(),
       'manifest',
       'n. 载货单, 运货单, 旅客名单 a. 显然的, 明白的 vi. 显示, 出现 vt. 表明, 表现, 证明 ｜ 原句：Spirits of Heaven and Earth, heed my call; manifest swiftly by divine decree!',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · manipulate (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10748-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'manipulate', JSON_ARRAY('manipulate', 'manipulates', 'manipulated', 'manipulating'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10748-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10748-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Some teachers instinctively know how to play “favorites” to ____ the other students.',
       JSON_ARRAY(),
       'manipulate',
       'vt. 操纵, 利用, 操作, 巧妙地处理, 假造 ｜ 原句：Some teachers instinctively know how to play “favorites” to manipulate the other students.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · manoeuvre (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10749-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'manoeuvre', JSON_ARRAY('manoeuvre', 'manoeuvres'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10749-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10749-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Do you know the Heimlich ____?',
       JSON_ARRAY(),
       'manoeuvre',
       'n. 调遣, 演习, 策略 vi. 调动, 演习, 用策略 vt. 调动, 操纵 ｜ 原句：Do you know the Heimlich manoeuvre?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · mansion (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10750-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'mansion', JSON_ARRAY('mansion', 'mansions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10750-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10750-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Compared to our house, yours is a ____.',
       JSON_ARRAY(),
       'mansion',
       'n. 大厦, 宅邸 ｜ 原句：Compared to our house, yours is a mansion.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · manuscript (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10751-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'manuscript', JSON_ARRAY('manuscript', 'manuscripts'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10751-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10751-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He showed me the ____ of his new play.',
       JSON_ARRAY(),
       'manuscript',
       'n. 手稿, 原稿, 底稿 a. 手写的 ｜ 原句：He showed me the manuscript of his new play.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · maple (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10752-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'maple', JSON_ARRAY('maple', 'maples'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10752-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10752-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Could you pass me the ____ syrup?',
       JSON_ARRAY(),
       'maple',
       'n. 枫, 枫木, 淡棕色 [机] 枫木 ｜ 原句：Could you pass me the maple syrup?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · marathon (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10753-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'marathon', JSON_ARRAY('marathon', 'marathons'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10753-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10753-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'One hundred and fifty people entered the ____ race.',
       JSON_ARRAY(),
       'marathon',
       'n. 马拉松, 耐力的考验 ｜ 原句：One hundred and fifty people entered the marathon race.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · marginal (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10754-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'marginal', JSON_ARRAY('marginal'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10754-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10754-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'There is only a ____ difference between the two.',
       JSON_ARRAY(),
       'marginal',
       'a. 边缘的, 最低限度的, 有旁注的 [医] 缘的 ｜ 原句：There is only a marginal difference between the two.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · marsh (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10757-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'marsh', JSON_ARRAY('marsh', 'marshes'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10757-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10757-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Lots of herons live in the ____.',
       JSON_ARRAY(),
       'marsh',
       'n. 沼泽, 湿地 a. 沼泽的 ｜ 原句：Lots of herons live in the marsh.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · marvellous (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10761-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'marvellous', JSON_ARRAY('marvellous'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10761-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10761-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '‘How was your holiday?’ ‘____!’',
       JSON_ARRAY(),
       'marvellous',
       'a. 奇异的, 神奇的, 奇迹般的, 惊人的, 不可思议的, 绝妙的, 妙极的 ｜ 原句：‘How was your holiday?’ ‘Marvellous!’',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · masculine (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10763-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'masculine', JSON_ARRAY('masculine', 'masculines'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10763-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10763-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'There is no "____" way of learning.',
       JSON_ARRAY(),
       'masculine',
       'n. 阳性, 男性 a. 男性的, 阳性的, 有丈夫气的 ｜ 原句：There is no "masculine" way of learning.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · masculinity (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10764-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'masculinity', JSON_ARRAY('masculinity'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10764-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10764-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'This film attempts to break stereotypes and redefine what true ____ is.',
       JSON_ARRAY(),
       'masculinity',
       'n. 男子气, 刚毅, 大丈夫气概 [医] 男子本性, 男性 ｜ 原句：This film attempts to break stereotypes and redefine what true masculinity is.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · massacre (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10765-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'massacre', JSON_ARRAY('massacre', 'massacres'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10765-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10765-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The Chinese government controlled the internet to prevent the people from knowing the truth of the Tiananmen Square ____.',
       JSON_ARRAY(),
       'massacre',
       'n. 大屠杀 vt. 大屠杀, 残杀 ｜ 原句：The Chinese government controlled the internet to prevent the people from knowing the truth of the Tiananmen Square Massacre.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · mastery (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10767-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'mastery', JSON_ARRAY('mastery', 'masteries'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10767-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10767-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The road to ____ is oh so long.',
       JSON_ARRAY(),
       'mastery',
       'n. 征服, 统治权, 优势, 精通, 掌握 [法] 统治权, 控制权, 征服 ｜ 原句：The road to mastery is oh so long.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · maternity (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10768-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'maternity', JSON_ARRAY('maternity'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10768-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10768-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Little Wang is on ____ leave. She won''t be back to work for six months.',
       JSON_ARRAY(),
       'maternity',
       'n. 母性, 怀孕, 妇产科医院 a. 产妇的 ｜ 原句：Little Wang is on maternity leave. She won''t be back to work for six months.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · maturity (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10770-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'maturity', JSON_ARRAY('maturity'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10770-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10770-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Beth shows a ____ way beyond her 16 years.',
       JSON_ARRAY(),
       'maturity',
       'n. 成熟, 完备, 到期 [医] 成熟, 成熟期, 发育期 ｜ 原句：Beth shows a maturity way beyond her 16 years.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · meaningful (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10771-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'meaningful', JSON_ARRAY('meaningful'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10771-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10771-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'She gave me a ____ look.',
       JSON_ARRAY(),
       'meaningful',
       'a. 意味深长的 ｜ 原句：She gave me a meaningful look.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · meditate (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10775-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'meditate', JSON_ARRAY('meditate', 'meditates', 'meditated', 'meditating'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10775-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10775-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He used to ____ in the morning.',
       JSON_ARRAY(),
       'meditate',
       'vt. 想, 考虑, 计划 vi. 沉思, 反省 ｜ 原句：He used to meditate in the morning.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · melody (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10777-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'melody', JSON_ARRAY('melody', 'melodies'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10777-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10777-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I can''t remember the ____ of that song.',
       JSON_ARRAY(),
       'melody',
       'n. 曲子, 美妙音乐, 曲调 ｜ 原句：I can''t remember the melody of that song.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · membership (CET6, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10778-1', 1, 'CET6', 3, 'FILL_BLANK',
       'IMPORT', 'membership', JSON_ARRAY('membership'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10778-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10778-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I applied for ____ in the association.',
       JSON_ARRAY(),
       'membership',
       'n. 会员的资格, 全体会员, 会员数目 [法] 会员资格, 成员资格, 会籍 ｜ 原句：I applied for membership in the association.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · merge (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10782-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'merge', JSON_ARRAY('merge', 'merges', 'merged', 'merging'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10782-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10782-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Get into the left lane to make room for the guy who''s trying to ____.',
       JSON_ARRAY(),
       'merge',
       'vt. 使合并, 使消失, 吞没 vi. 合并, 渐渐消失 [计] 合并 ｜ 原句：Get into the left lane to make room for the guy who''s trying to merge.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · metropolitan (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10788-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'metropolitan', JSON_ARRAY('metropolitan', 'metropolitans'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10788-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10788-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'a ____ area of South Australia',
       JSON_ARRAY(),
       'metropolitan',
       'n. 大都市居民, 都主教, 宗主国的公民 a. 大都市的, 都主教区的, 宗主国的 ｜ 原句：a metropolitan area of South Australia',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · microwave (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10791-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'microwave', JSON_ARRAY('microwave', 'microwaves'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10791-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10791-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'It is about time we bought a new ____ oven.',
       JSON_ARRAY(),
       'microwave',
       'n. 微波 [计] 微波 ｜ 原句：It is about time we bought a new microwave oven.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · mighty (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10792-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'mighty', JSON_ARRAY('mighty', 'mighties'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10792-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10792-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'You scorned both the Nymphs, who beheld your deeds, and me the ____ Pan.',
       JSON_ARRAY(),
       'mighty',
       'n. 有势力的人 a. 有势力的, 强大的, 有力的 adv. 很, 极 ｜ 原句：You scorned both the Nymphs, who beheld your deeds, and me the mighty Pan.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · migrate (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10794-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'migrate', JSON_ARRAY('migrate', 'migrates', 'migrated', 'migrating'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10794-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10794-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'These birds don''t ____.',
       JSON_ARRAY(),
       'migrate',
       'vi. 移动, 移往, 随季节而移居 [计] 迁移程序 ｜ 原句：These birds don''t migrate.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · milky (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10796-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'milky', JSON_ARRAY('milky', 'milkier', 'milkiest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10796-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10796-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The solar system is a small celestial system in the ____ Way.',
       JSON_ARRAY(),
       'milky',
       'a. 乳状的, 乳白色的, 柔和的 ｜ 原句：The solar system is a small celestial system in the Milky Way.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · millionaire (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10797-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'millionaire', JSON_ARRAY('millionaire', 'millionaires'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10797-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10797-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I''d like to be a ____.',
       JSON_ARRAY(),
       'millionaire',
       'n. 百万富翁, 大富豪 [经] 大资本家, 巨富, 百万富翁 ｜ 原句：I''d like to be a millionaire.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · minimal (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10800-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'minimal', JSON_ARRAY('minimal'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10800-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10800-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The storm caused only ____ damage.',
       JSON_ARRAY(),
       'minimal',
       'a. 最小的, 极微的, 最小限度的 [医] 最小的, 最低的 ｜ 原句：The storm caused only minimal damage.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · miser (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10804-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'miser', JSON_ARRAY('miser', 'misers'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10804-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10804-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'A ____ hoards money not because he is prudent but because he is greedy.',
       JSON_ARRAY(),
       'miser',
       'n. 守财奴, 吝啬鬼, (石油工程上用的)锥钻头 ｜ 原句：A miser hoards money not because he is prudent but because he is greedy.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · misery (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10805-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'misery', JSON_ARRAY('misery', 'miseries'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10805-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10805-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'His illness caused her great ____.',
       JSON_ARRAY(),
       'misery',
       'n. 痛苦, 悲惨, 不幸, 穷困 ｜ 原句：His illness caused her great misery.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · misfortune (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10806-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'misfortune', JSON_ARRAY('misfortune', 'misfortunes'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10806-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10806-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Years of resistance to ____ ended when the settlers'' village was overcome by the savages and their hopes and lives came to the bitter end.',
       JSON_ARRAY(),
       'misfortune',
       'n. 不幸, 灾祸, 坏运气 [法] 不幸事故, 不幸, 灾祸 ｜ 原句：Years of resistance to misfortune ended when the settlers'' village was overcome by the savages and their hopes and lives came to the bitter end.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · missionary (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10807-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'missionary', JSON_ARRAY('missionary', 'missionaries'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10807-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10807-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'In 1807, Robert Morrison, the first British Protestant ____ to China arrived in Guangzhou.',
       JSON_ARRAY(),
       'missionary',
       'n. 传教士, 负有任务者, 工作人员 a. 传教的, 传教士的 ｜ 原句：In 1807, Robert Morrison, the first British Protestant missionary to China arrived in Guangzhou.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · mobility (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10811-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'mobility', JSON_ARRAY('mobility'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10811-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10811-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'There is greater ____ of labour (= movement of workers ) between jobs and areas.',
       JSON_ARRAY(),
       'mobility',
       'n. 可动性, 流动性, 机动性 [化] 迁移率 ｜ 原句：There is greater mobility of labour (= movement of workers ) between jobs and areas.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · mock (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10813-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'mock', JSON_ARRAY('mock', 'mocks'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10813-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10813-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The future pilot is trained in a ____ cockpit.',
       JSON_ARRAY(),
       'mock',
       'n. 嘲笑, 戏弄, 模仿 a. 假的, 伪造的, 模拟的 adv. 虚伪地 vt. 嘲弄, 模仿, 使失望, 欺骗, 挫败 vi. 嘲弄 ｜ 原句：The future pilot is trained in a mock cockpit.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · modesty (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10815-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'modesty', JSON_ARRAY('modesty', 'modesties'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10815-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10815-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'His ____ is worth respecting.',
       JSON_ARRAY(),
       'modesty',
       'n. 谦逊, 质朴, 羞怯 ｜ 原句：His modesty is worth respecting.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · modification (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10816-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'modification', JSON_ARRAY('modification', 'modifications'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10816-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10816-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Through genetic ____, we can improve crops.',
       JSON_ARRAY(),
       'modification',
       'n. 修正, 修饰, 修改 [化] 修饰; 修改 ｜ 原句：Through genetic modification, we can improve crops.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · momentary (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10820-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'momentary', JSON_ARRAY('momentary'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10820-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10820-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Victory attained by violence is tantamount to a defeat, for it is ____.',
       JSON_ARRAY(),
       'momentary',
       'a. 瞬间的, 刹那间的 ｜ 原句：Victory attained by violence is tantamount to a defeat, for it is momentary.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · momentum (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10821-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'momentum', JSON_ARRAY('momentum', 'momentums'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10821-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10821-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'incentives to maintain the ____ of European integration',
       JSON_ARRAY(),
       'momentum',
       'n. 动力, 动量 [化] 动量 ｜ 原句：incentives to maintain the momentum of European integration',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · monarch (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10822-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'monarch', JSON_ARRAY('monarch', 'monarches'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10822-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10822-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He is an absolute ____.',
       JSON_ARRAY(),
       'monarch',
       'n. 帝王, 统治者, 元首 [医] 单原型(植) ｜ 原句：He is an absolute monarch.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · monetary (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10823-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'monetary', JSON_ARRAY('monetary'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10823-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10823-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'the government’s tight ____ policy',
       JSON_ARRAY(),
       'monetary',
       'a. 货币的, 金钱的 [经] 货币的, 金融的 ｜ 原句：the government’s tight monetary policy',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · monk (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10824-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'monk', JSON_ARRAY('monk', 'monks'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10824-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10824-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Tom decided to become a ____.',
       JSON_ARRAY(),
       'monk',
       'n. 修道士, 僧侣, 和尚 ｜ 原句：Tom decided to become a monk.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · monopoly (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10825-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'monopoly', JSON_ARRAY('monopoly', 'monopolies'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10825-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10825-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '____ is a popular game for families to play.',
       JSON_ARRAY(),
       'monopoly',
       'n. 垄断, 专卖权, 独占事业 [经] 垄断, 专利品, 垄断(权)独占 ｜ 原句：Monopoly is a popular game for families to play.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · monster (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10826-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'monster', JSON_ARRAY('monster', 'monsters'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10826-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10826-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'There''s a ____ under my bed.',
       JSON_ARRAY(),
       'monster',
       'n. 怪物, 恶人, 巨物 [医] 畸胎 ｜ 原句：There''s a monster under my bed.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · mop (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10829-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'mop', JSON_ARRAY('mop', 'mops'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10829-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10829-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'When you''re done sweeping, I''ll ____.',
       JSON_ARRAY(),
       'mop',
       'n. 拖把, 鬼脸 vt. 用拖把洗擦, 擦, 拭 vi. 做鬼脸 [计] 维护操作协议 ｜ 原句：When you''re done sweeping, I''ll mop.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · morality (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10830-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'morality', JSON_ARRAY('morality'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10830-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10830-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Gentleness and cheerfulness, these come before all ____; they are the perfect duties.',
       JSON_ARRAY(),
       'morality',
       'n. 道德, 教训, 品行 [法] 道德, 道义 ｜ 原句：Gentleness and cheerfulness, these come before all morality; they are the perfect duties.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · mosque (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10833-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'mosque', JSON_ARRAY('mosque', 'mosques'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10833-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10833-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'This is a house and that is a ____.',
       JSON_ARRAY(),
       'mosque',
       'n. 清真寺 ｜ 原句：This is a house and that is a mosque.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · moss (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10834-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'moss', JSON_ARRAY('moss', 'mosses'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10834-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10834-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'A rolling stone gathers no ____ is a proverb.',
       JSON_ARRAY(),
       'moss',
       'n. 苔藓, 泥沼 vt. 使长满苔藓 ｜ 原句：A rolling stone gathers no moss is a proverb.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · motorway (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10835-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'motorway', JSON_ARRAY('motorway', 'motorways'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10835-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10835-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The toilets at ____ service stations are often very dirty.',
       JSON_ARRAY(),
       'motorway',
       'n. 高速公路 ｜ 原句：The toilets at motorway service stations are often very dirty.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · mountainous (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10836-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'mountainous', JSON_ARRAY('mountainous'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10836-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10836-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Armenia is a ____ country.',
       JSON_ARRAY(),
       'mountainous',
       'a. 多山的, 如山的, 巨大的 ｜ 原句：Armenia is a mountainous country.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · multitude (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10838-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'multitude', JSON_ARRAY('multitude', 'multitudes'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10838-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10838-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'It is a great joy to see your own sentences translated into a ____ of other languages.',
       JSON_ARRAY(),
       'multitude',
       'n. 多数, 群众 ｜ 原句：It is a great joy to see your own sentences translated into a multitude of other languages.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · municipal (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10839-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'municipal', JSON_ARRAY('municipal'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10839-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10839-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'the ____ waste dump',
       JSON_ARRAY(),
       'municipal',
       'a. 市政的, 自治区的, 内政的 [经] 市政的, 市的 ｜ 原句：the municipal waste dump',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · murmur (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10840-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'murmur', JSON_ARRAY('murmur', 'murmurs'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10840-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10840-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The ____ of the brook lulls me to sleep.',
       JSON_ARRAY(),
       'murmur',
       'n. 低语, 低声的怨言 vi. 低语, 低声而言 vt. 低声说 ｜ 原句：The murmur of the brook lulls me to sleep.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · muse (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10842-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'muse', JSON_ARRAY('muse', 'muses'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10842-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10842-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Novels? I hate novels. Oh ____, forgive her blasphemy.',
       JSON_ARRAY(),
       'muse',
       'n. 沉思, 冥想 v. 沉思, 冥想, 若有所思地凝望或说 ｜ 原句：Novels? I hate novels. Oh muse, forgive her blasphemy.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · mustard (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10843-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'mustard', JSON_ARRAY('mustard', 'mustards'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10843-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10843-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Easy on the ____.',
       JSON_ARRAY(),
       'mustard',
       'n. 芥末, 芥菜, 强烈的兴趣 [医] 芥子; 芥属植物 ｜ 原句：Easy on the mustard.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · myth (CET6, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10844-1', 1, 'CET6', 3, 'FILL_BLANK',
       'IMPORT', 'myth', JSON_ARRAY('myth', 'myths'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10844-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10844-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Paul''s success was a ____.',
       JSON_ARRAY(),
       'myth',
       'n. 神话, 虚构的事, 虚构的人 ｜ 原句：Paul''s success was a myth.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · naive (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10845-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'naive', JSON_ARRAY('naive'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10845-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10845-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Get rid of those kinds of ____ ideas.',
       JSON_ARRAY(),
       'naive',
       'a. 天真的, 纯真的, 幼稚的 ｜ 原句：Get rid of those kinds of naive ideas.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · napkin (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10846-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'napkin', JSON_ARRAY('napkin', 'napkins'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10846-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10846-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'May I have a ____, please?',
       JSON_ARRAY(),
       'napkin',
       'n. 餐巾, 餐巾纸, 尿布 ｜ 原句：May I have a napkin, please?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · negotiation (CET6, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10852-1', 1, 'CET6', 3, 'FILL_BLANK',
       'IMPORT', 'negotiation', JSON_ARRAY('negotiation', 'negotiations'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10852-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10852-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The ____ is off.',
       JSON_ARRAY(),
       'negotiation',
       'n. 谈判, 磋商, 交涉 [经] 谈判, 协商 ｜ 原句：The negotiation is off.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · neighbouring (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10853-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'neighbouring', JSON_ARRAY('neighbouring'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10853-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10853-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Germans are not willing to produce nuclear energy, but are not against using that of their ____ countries.',
       JSON_ARRAY(),
       'neighbouring',
       'a. 邻近的, 接壤的, 附近的 [法] 邻近的, 附近的, 接壤的 ｜ 原句：Germans are not willing to produce nuclear energy, but are not against using that of their neighbouring countries.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · nickname (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10857-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'nickname', JSON_ARRAY('nickname', 'nicknames'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10857-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10857-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I go by the ____ "Itch."',
       JSON_ARRAY(),
       'nickname',
       'n. 绰号, 昵称 vt. 给...取绰号, 叫错名字 [计] 绰号 ｜ 原句：I go by the nickname "Itch."',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · nominate (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10860-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'nominate', JSON_ARRAY('nominate', 'nominated', 'nominates', 'nominating'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10860-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10860-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'This week one of them will be ____ by the Democratic Party for the presidency of the United States.',
       JSON_ARRAY(),
       'nominated',
       'vt. 提名, 任命, 命名 [法] 提名...为候选人, 指定, 推荐 ｜ 原句：This week one of them will be nominated by the Democratic Party for the presidency of the United States.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · norm (CET6, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10862-1', 1, 'CET6', 3, 'FILL_BLANK',
       'IMPORT', 'norm', JSON_ARRAY('norm', 'norms'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10862-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10862-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'A vector is a unit vector if its ____ is 1.',
       JSON_ARRAY(),
       'norm',
       'n. 基准, 模范, 标准, 准则, 平均数 [化] 定额 ｜ 原句：A vector is a unit vector if its norm is 1.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · notable (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10866-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'notable', JSON_ARRAY('notable', 'notables'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10866-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10866-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The trigonometric functions satisfy a wide array of ____ algebraic identities.',
       JSON_ARRAY(),
       'notable',
       'n. 著名人士, 值得注意之事物 a. 值得注意的, 显著的 ｜ 原句：The trigonometric functions satisfy a wide array of notable algebraic identities.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · noted (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10868-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'noted', JSON_ARRAY('noted'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10868-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10868-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Korean food is ____ for its spicy flavor.',
       JSON_ARRAY(),
       'noted',
       'a. 著名的, 显著的, 扬名的 ｜ 原句：Korean food is noted for its spicy flavor.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · notorious (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10870-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'notorious', JSON_ARRAY('notorious'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10870-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10870-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Ms. Eichler had a ____ reputation for being austere to her students.',
       JSON_ARRAY(),
       'notorious',
       'a. 声名狼藉的, 臭名昭著的, 众人皆知的 ｜ 原句：Ms. Eichler had a notorious reputation for being austere to her students.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · nourish (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10873-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'nourish', JSON_ARRAY('nourish', 'nourishes', 'nourished', 'nourishing'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10873-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10873-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The role of the placenta is to ____ the foetus.',
       JSON_ARRAY(),
       'nourish',
       'vt. 滋养, 使健壮, 怀有 ｜ 原句：The role of the placenta is to nourish the foetus.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · novelty (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10875-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'novelty', JSON_ARRAY('novelty', 'novelties'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10875-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10875-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Some people prefer conformity, while others seek ____.',
       JSON_ARRAY(),
       'novelty',
       'n. 新奇, 新鲜, 新奇的事物 ｜ 原句：Some people prefer conformity, while others seek novelty.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · nutrition (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10880-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'nutrition', JSON_ARRAY('nutrition', 'nutritions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10880-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10880-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'She is careful about her child''s ____.',
       JSON_ARRAY(),
       'nutrition',
       'n. 营养, 营养学 [医] 营养, 营养品 ｜ 原句：She is careful about her child''s nutrition.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · oak (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10881-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'oak', JSON_ARRAY('oak', 'oaks'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10881-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10881-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'From a small acorn grows a tall ____ tree.',
       JSON_ARRAY(),
       'oak',
       'n. 橡树, 橡木 a. 橡木制的 ｜ 原句：From a small acorn grows a tall oak tree.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · oar (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10882-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'oar', JSON_ARRAY('oar', 'oars'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10882-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10882-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He pulled as hard as he could on the ____.',
       JSON_ARRAY(),
       'oars',
       'n. 桨, 桨手, 搅棒 vi. 划桨 vt. 划动 ｜ 原句：He pulled as hard as he could on the oars.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · oath (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10883-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'oath', JSON_ARRAY('oath', 'oaths'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10883-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10883-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The knight swore an ____ of allegiance to the king.',
       JSON_ARRAY(),
       'oath',
       'n. 誓约, 誓言, 咒骂 [法] 誓言, 誓约, 宣誓 ｜ 原句：The knight swore an oath of allegiance to the king.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · obedience (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10884-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'obedience', JSON_ARRAY('obedience', 'obediences'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10884-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10884-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'We should always act in ____ to the law.',
       JSON_ARRAY(),
       'obedience',
       'n. 服从, 顺从, 忠实 [法] 服从, 顺从, 遵从 ｜ 原句：We should always act in obedience to the law.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · obedient (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10885-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'obedient', JSON_ARRAY('obedient'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10885-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10885-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He was a great teacher so his children were very ____.',
       JSON_ARRAY(),
       'obedient',
       'a. 服从的, 顺从的, 孝顺的 [法] 服从的, 顺从的, 忠顺的 ｜ 原句：He was a great teacher so his children were very obedient.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · obese (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10886-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'obese', JSON_ARRAY('obese'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10886-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10886-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Many Americans are ____.',
       JSON_ARRAY(),
       'obese',
       'a. 肥胖的 [医] 肥胖的 ｜ 原句：Many Americans are obese.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · obscene (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10887-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'obscene', JSON_ARRAY('obscene'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10887-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10887-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'One must be respectful when speaking, and not say ____ things.',
       JSON_ARRAY(),
       'obscene',
       'a. 淫秽的, 猥亵的, 讨人厌的, 可憎的 [法] 猥亵的, 海洋的, 污秽的 ｜ 原句：One must be respectful when speaking, and not say obscene things.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · obsession (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10888-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'obsession', JSON_ARRAY('obsession', 'obsessions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10888-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10888-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Julia Davis, a Russian media commentator, describes Victory Mania as “an unhealthy ____ with military might and past victories.”',
       JSON_ARRAY(),
       'obsession',
       'n. 困扰, 困扰人的情绪 [医] 强迫观念 ｜ 原句：Julia Davis, a Russian media commentator, describes Victory Mania as “an unhealthy obsession with military might and past victories.”',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · obstinate (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10889-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'obstinate', JSON_ARRAY('obstinate'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10889-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10889-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He became more ____ as he grew older.',
       JSON_ARRAY(),
       'obstinate',
       'a. 倔强的, 顽固的, 不让步的 ｜ 原句：He became more obstinate as he grew older.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · odor (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10890-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'odor', JSON_ARRAY('odor', 'odors'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10890-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10890-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The attic was a long, low-ceilinged room, dark and fragrant with the ____ of the cedar.',
       JSON_ARRAY(),
       'odor',
       'n. 气味, 香味, 名声, 意味 [医] 气味 ｜ 原句：The attic was a long, low-ceilinged room, dark and fragrant with the odor of the cedar.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · offence (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10891-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'offence', JSON_ARRAY('offence', 'offences'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10891-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10891-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'She took ____ at my word.',
       JSON_ARRAY(),
       'offence',
       'n. 犯罪, 冒犯, 违反, 罪过, 过错, 攻击 [法] 犯法, 罪过, 过错 ｜ 原句：She took offence at my word.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · offensive (CET6, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10892-1', 1, 'CET6', 3, 'FILL_BLANK',
       'IMPORT', 'offensive', JSON_ARRAY('offensive'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10892-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10892-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The speaker''s comments were highly ____.',
       JSON_ARRAY(),
       'offensive',
       'a. 令人不快的, 侮辱的, 攻击性的 [法] 攻击的, 进攻的, 冒犯的 ｜ 原句：The speaker''s comments were highly offensive.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · olive (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10896-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'olive', JSON_ARRAY('olive', 'olives'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10896-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10896-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'We''d like to order 18 tonnes of ____ oil.',
       JSON_ARRAY(),
       'olive',
       'n. 橄榄, 橄榄树, 橄榄色, 橄榄枝 a. 黄绿色的, 黄褐色的, 橄榄色的 ｜ 原句：We''d like to order 18 tonnes of olive oil.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · opium (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10900-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'opium', JSON_ARRAY('opium', 'opiums'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10900-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10900-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Religion is the ____ of the people.',
       JSON_ARRAY(),
       'opium',
       'n. 鸦片 [化] 阿片; 鸦片 ｜ 原句：Religion is the opium of the people.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · optimism (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10902-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'optimism', JSON_ARRAY('optimism'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10902-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10902-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '____ is like the lamp of hope. Pessimism [or negativity] is like a drug of sorrow.',
       JSON_ARRAY(),
       'optimism',
       'n. 乐观主义, 乐观, 乐天 [医] 乐观主义, 乐观 ｜ 原句：Optimism is like the lamp of hope. Pessimism [or negativity] is like a drug of sorrow.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · orchard (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10904-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'orchard', JSON_ARRAY('orchard', 'orchards'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10904-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10904-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I delight in going to the apple ____ each fall.',
       JSON_ARRAY(),
       'orchard',
       'n. 果园, 果树林 ｜ 原句：I delight in going to the apple orchard each fall.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · orientation (CET6, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10906-1', 1, 'CET6', 3, 'FILL_BLANK',
       'IMPORT', 'orientation', JSON_ARRAY('orientation', 'orientations'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10906-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10906-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'This room''s ____ is great.',
       JSON_ARRAY(),
       'orientation',
       'n. 定方位, 适应, 向东方 n. 方向 [计] 方向 ｜ 原句：This room''s orientation is great.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · outbreak (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10909-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'outbreak', JSON_ARRAY('outbreak', 'outbreaks'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10909-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10909-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The next four to six weeks are crucial in controlling the massive Ebola ____.',
       JSON_ARRAY(),
       'outbreak',
       'n. 爆发, 暴动 [医] 暴发 ｜ 原句：The next four to six weeks are crucial in controlling the massive Ebola outbreak.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · overestimate (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10914-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'overestimate', JSON_ARRAY('overestimate', 'overestimates', 'overestimated', 'overestimating'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10914-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10914-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'We cannot ____ the value of health.',
       JSON_ARRAY(),
       'overestimate',
       'vt. 评价过高, 过高估价 n. 估计过高, 评价过高 ｜ 原句：We cannot overestimate the value of health.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · overlap (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10918-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'overlap', JSON_ARRAY('overlap', 'overlaps'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10918-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10918-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Their two shadows ____.',
       JSON_ARRAY(),
       'overlap',
       'n. 重叠, 重复, 部分的同时发生 vt. 重叠, 重复, 与...同时发生 vi. 迭盖, 部分的同时发生 [计] 重叠 ｜ 原句：Their two shadows overlap.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · overload (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10919-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'overload', JSON_ARRAY('overload', 'overloads', 'overloaded', 'overloading'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10919-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10919-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '57 percent complained of work ____.',
       JSON_ARRAY(),
       'overload',
       'vt. 超载, 过载, 超过负荷 n. 超载, 负荷过多 ｜ 原句：57 percent complained of work overload.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · overwhelm (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10922-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'overwhelm', JSON_ARRAY('overwhelm', 'overwhelms', 'overwhelmed', 'overwhelming'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10922-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10922-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'But the various pros and cons should not blindly ____ one another.',
       JSON_ARRAY(),
       'overwhelm',
       'vt. 淹没, 受打击, 制服, 压倒, 使不知所措 [法] 打翻, 倾覆, 覆盖 ｜ 原句：But the various pros and cons should not blindly overwhelm one another.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · overwhelming (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10923-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'overwhelming', JSON_ARRAY('overwhelming'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10923-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10923-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'There is ____ evidence that smoking damages your health.',
       JSON_ARRAY(),
       'overwhelming',
       'a. 压倒性的, 无法抵抗的 ｜ 原句：There is overwhelming evidence that smoking damages your health.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · oyster (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10926-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'oyster', JSON_ARRAY('oyster', 'oysters'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10926-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10926-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Should we order the steamed perch or the beef with ____ sauce?',
       JSON_ARRAY(),
       'oyster',
       'n. 牡蛎, 蚝, 沉默者 ｜ 原句：Should we order the steamed perch or the beef with oyster sauce?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · pal (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10927-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'pal', JSON_ARRAY('pal', 'pals'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10927-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10927-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'She writes to her pen ____ in London twice a month.',
       JSON_ARRAY(),
       'pal',
       'n. 朋友, 伙伴, 同志, 同谋 vi. 交友, 结伴 ｜ 原句：She writes to her pen pal in London twice a month.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · pamphlet (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10928-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'pamphlet', JSON_ARRAY('pamphlet', 'pamphlets'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10928-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10928-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'This ____ is free of charge.',
       JSON_ARRAY(),
       'pamphlet',
       'n. 小册子, 活页文选 ｜ 原句：This pamphlet is free of charge.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · panic (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10929-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'panic', JSON_ARRAY('panic', 'panics'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10929-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10929-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'There''s no need to ____. There''s plenty of time.',
       JSON_ARRAY(),
       'panic',
       'n. 恐慌, 惊慌 a. 惊慌的, 没有理由的, 恐慌的 vt. 使惊慌, 使狂热 vi. 惊慌 ｜ 原句：There''s no need to panic. There''s plenty of time.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · pantry (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10931-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'pantry', JSON_ARRAY('pantry', 'pantries'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10931-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10931-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Could you please find the missing key. I can''t open the ____.',
       JSON_ARRAY(),
       'pantry',
       'n. 餐具室, 食品室 ｜ 原句：Could you please find the missing key. I can''t open the pantry.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · parachute (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10932-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'parachute', JSON_ARRAY('parachute', 'parachutes'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10932-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10932-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Tom''s ____ didn''t open.',
       JSON_ARRAY(),
       'parachute',
       'n. 降落伞 vi. 跳伞 ｜ 原句：Tom''s parachute didn''t open.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · paralysis (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10936-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'paralysis', JSON_ARRAY('paralysis', 'paralysises'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10936-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10936-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'His ____ is progressing, and soon he won''t be able to get out of bed.',
       JSON_ARRAY(),
       'paralysis',
       'n. 麻痹, 停顿, 瘫痪 [医] 麻痹, 瘫痪 ｜ 原句：His paralysis is progressing, and soon he won''t be able to get out of bed.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · paralyze (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10937-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'paralyze', JSON_ARRAY('paralyze', 'paralysed', 'paralyzes', 'paralyzed', 'paralyzing', 'paralyses', 'paralysing'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10937-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10937-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Her legs were partly ____ in the crash.',
       JSON_ARRAY(),
       'paralysed',
       'vt. 使瘫痪, 使麻痹 [医] 使麻痹, 使瘫痪 ｜ 原句：Her legs were partly paralysed in the crash.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · pasture (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10941-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'pasture', JSON_ARRAY('pasture', 'pastures'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10941-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10941-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The ____ has an area of 10 acres.',
       JSON_ARRAY(),
       'pasture',
       'n. 牧场, 草地, 牧草 vt. 放牧 vi. 吃草 ｜ 原句：The pasture has an area of 10 acres.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · patriot (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10944-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'patriot', JSON_ARRAY('patriot', 'patriots'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10944-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10944-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The president speaks as a real ____.',
       JSON_ARRAY(),
       'patriot',
       'n. 爱国者, 爱国主义者 ｜ 原句：The president speaks as a real patriot.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · patriotic (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10945-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'patriotic', JSON_ARRAY('patriotic'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10945-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10945-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Chinese people have the most ____ stomachs.',
       JSON_ARRAY(),
       'patriotic',
       'a. 爱国的, 有爱国心的 [法] 爱国的, 有爱国心的 ｜ 原句：Chinese people have the most patriotic stomachs.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · peacock (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10949-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'peacock', JSON_ARRAY('peacock', 'peacocks'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10949-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10949-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I just saw a beautiful ____ displaying its feathers while on a walk in the forest.',
       JSON_ARRAY(),
       'peacock',
       'n. 孔雀, 好炫耀的人 vi. 炫耀, 神气活现地行走 ｜ 原句：I just saw a beautiful peacock displaying its feathers while on a walk in the forest.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · peck (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10950-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'peck', JSON_ARRAY('peck', 'pecks'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10950-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10950-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He gave her a ____ on the cheek.',
       JSON_ARRAY(),
       'peck',
       'n. 配克(英美干量单位), 啄痕, 啄食, 许多 vt. 啄, 啄食, 琢, 凿成, 扔 vi. 啄, 吹毛求疵, 啄食, 勉强吃 [计] 取数 ｜ 原句：He gave her a peck on the cheek.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · pedestrian (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10953-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'pedestrian', JSON_ARRAY('pedestrian', 'pedestrians'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10953-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10953-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The interface of this website is somewhat ____, but it’s simple.',
       JSON_ARRAY(),
       'pedestrian',
       'n. 行人, 步行者 a. 人行的, 徒步的, 呆板的, 通俗的, 平淡无奇的 ｜ 原句：The interface of this website is somewhat pedestrian, but it’s simple.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · peer (CET6, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10955-1', 1, 'CET6', 3, 'FILL_BLANK',
       'IMPORT', 'peer', JSON_ARRAY('peer', 'peers'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10955-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10955-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'American children did less well in math than their ____ in Japan.',
       JSON_ARRAY(),
       'peers',
       'n. 同等的人, 匹敌, 贵族 vi. 凝视, 窥视, 费力地看, 隐现 vt. 与...同等, 封为贵族 ｜ 原句：American children did less well in math than their peers in Japan.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · penalty (CET6, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10956-1', 1, 'CET6', 3, 'FILL_BLANK',
       'IMPORT', 'penalty', JSON_ARRAY('penalty', 'penalties'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10956-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10956-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The death ____ had been done away with in many states in the USA.',
       JSON_ARRAY(),
       'penalty',
       'n. 处罚, 刑罚, 罚款, 罚球, 报应, 不利结果, 妨碍 [经] 罚金(款), 违约金 ｜ 原句：The death penalty had been done away with in many states in the USA.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · perception (CET6, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10959-1', 1, 'CET6', 2, 'FILL_BLANK',
       'IMPORT', 'perception', JSON_ARRAY('perception', 'perceptions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10959-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10959-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '____ is reality.',
       JSON_ARRAY(),
       'perception',
       'n. 知觉, 感觉, 领悟力, 获取 [医] 知觉 ｜ 原句：Perception is reality.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · perch (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10960-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'perch', JSON_ARRAY('perch', 'perches'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10960-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10960-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Should we order the steamed ____ or the beef with oyster sauce?',
       JSON_ARRAY(),
       'perch',
       'n. 栖木, 高位, 杆, 河鲈 v. (使)栖息, 就位, 位于, (使)暂歇 ｜ 原句：Should we order the steamed perch or the beef with oyster sauce?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · perfection (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10961-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'perfection', JSON_ARRAY('perfection', 'perfections'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10961-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10961-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Mayuko always aims for ____.',
       JSON_ARRAY(),
       'perfection',
       'n. 完美, 完成, 极端 [经] 完整性 ｜ 原句：Mayuko always aims for perfection.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · periodic (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10964-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'periodic', JSON_ARRAY('periodic'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10964-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10964-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He learnt the ____ table by heart just for fun.',
       JSON_ARRAY(),
       'periodic',
       'a. 周期的, 定期的, 间歇(性)的, 循环的, 用完整句的, 高碘的 [医] 周期性的 ｜ 原句：He learnt the periodic table by heart just for fun.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · perish (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10967-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'perish', JSON_ARRAY('perish', 'perishes', 'perished', 'perishing'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10967-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10967-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'We must learn to live together as brothers, or we will ____ together as fools.',
       JSON_ARRAY(),
       'perish',
       'vi. 毁灭, 丧生, 凋谢, 颓丧, 死亡, 腐烂 vt. 毁坏, 使麻木, 使丧生, 耗尽 ｜ 原句：We must learn to live together as brothers, or we will perish together as fools.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · permeate (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10968-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'permeate', JSON_ARRAY('permeate', 'permeated', 'permeates', 'permeating'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10968-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10968-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The smell of diesel oil ____ the air.',
       JSON_ARRAY(),
       'permeated',
       'vt. 弥漫, 渗透, 充满, 影响, 感染 vi. 透入, 散布 ｜ 原句：The smell of diesel oil permeated the air.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · perpetual (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10971-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'perpetual', JSON_ARRAY('perpetual'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10971-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10971-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'the ____ snows of the mountaintops',
       JSON_ARRAY(),
       'perpetual',
       'a. 永久的, 不断的, 无期限的, 没完没了的, 四季开花的 [经] 永远的, 终身的, 持续的 ｜ 原句：the perpetual snows of the mountaintops',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · persistence (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10975-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'persistence', JSON_ARRAY('persistence', 'persistences'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10975-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10975-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Her ____ paid off when she was offered the job of manager.',
       JSON_ARRAY(),
       'persistence',
       'n. 固执, 坚持不懈, 持续(性), 存留(状态) [电] 持久 ｜ 原句：Her persistence paid off when she was offered the job of manager.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · persistent (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10976-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'persistent', JSON_ARRAY('persistent'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10976-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10976-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Be patient and ____. These things take time.',
       JSON_ARRAY(),
       'persistent',
       'a. 固执的, 坚持的, 持续的, 作用持久的 [法] 坚持的, 固执的, 持续的 ｜ 原句：Be patient and persistent. These things take time.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · persuasion (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10978-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'persuasion', JSON_ARRAY('persuasion', 'persuasions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10978-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10978-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I was born into the Hebrew ____, but when I got older I converted to narcissism.',
       JSON_ARRAY(),
       'persuasion',
       'n. 说服, 信念, 派别, 说服力 ｜ 原句：I was born into the Hebrew persuasion, but when I got older I converted to narcissism.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · photography (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10986-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'photography', JSON_ARRAY('photography', 'photographies'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10986-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10986-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I have an interest in ____.',
       JSON_ARRAY(),
       'photography',
       'n. 摄影, 摄影术 [化] 照相术 ｜ 原句：I have an interest in photography.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · physically (CET6, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10987-1', 1, 'CET6', 3, 'FILL_BLANK',
       'IMPORT', 'physically', JSON_ARRAY('physically'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10987-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10987-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Generally speaking, men are ____ stronger than women.',
       JSON_ARRAY(),
       'physically',
       'adv. 按自然规律, 完全地, 实际上, 真正地, 身体上地 ｜ 原句：Generally speaking, men are physically stronger than women.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · pickle (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10989-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'pickle', JSON_ARRAY('pickle', 'pickles'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10989-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10989-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Did you know that if you plug a ____ into an electrical outlet, it glows and makes buzzing noises?',
       JSON_ARRAY(),
       'pickle',
       'n. 盐卤, 腌汁, 泡菜, 困境, 讨厌鬼 vt. 腌制, 酸洗, 葬送(机会等), 泡 ｜ 原句：Did you know that if you plug a pickle into an electrical outlet, it glows and makes buzzing noises?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · pineapple (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10992-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'pineapple', JSON_ARRAY('pineapple', 'pineapples'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10992-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10992-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'You can decorate the cocktail with a cherry or a ____.',
       JSON_ARRAY(),
       'pineapple',
       'n. 凤梨, 菠萝, 失业救济金 [医] 凤梨, 波萝 ｜ 原句：You can decorate the cocktail with a cherry or a pineapple.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · pirate (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10994-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'pirate', JSON_ARRAY('pirate', 'pirates'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10994-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10994-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Do you like ____ movies?',
       JSON_ARRAY(),
       'pirate',
       'n. 海盗, 盗印者, 侵犯专利权者 vt. 盗印, 掠夺, 翻印 vi. 做海盗, 从事劫掠 ｜ 原句：Do you like pirate movies?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · piston (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10995-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'piston', JSON_ARRAY('piston', 'pistons'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10995-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10995-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The ____ does not come into contact with the cylinder cover.',
       JSON_ARRAY(),
       'piston',
       'n. 活塞, 活塞阀键 [医] 活塞(如注射器的) ｜ 原句：The piston does not come into contact with the cylinder cover.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · plague (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-10996-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'plague', JSON_ARRAY('plague', 'plagues'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-10996-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-10996-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'She avoided him like the ____.',
       JSON_ARRAY(),
       'plague',
       'n. 瘟疫, 天罚, 麻烦, 灾祸 vt. 折磨, 使苦恼, 使得灾祸 ｜ 原句：She avoided him like the plague.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · pledge (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11001-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'pledge', JSON_ARRAY('pledge', 'pledges'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11001-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11001-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Unity, justice and freedom are the ____ of fortune.',
       JSON_ARRAY(),
       'pledge',
       'n. 诺言, 保证, 誓言, 抵押, 信物, 保人, 祝愿 vt. 许诺, 保证, 使发誓, 抵押, 典当, 举杯祝...健康 ｜ 原句：Unity, justice and freedom are the pledge of fortune.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · plump (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11002-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'plump', JSON_ARRAY('plump', 'plumper', 'plumpest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11002-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11002-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'When my grandmother was young, her body was very slim. Now in her old age she''s grown ____.',
       JSON_ARRAY(),
       'plump',
       'a. 圆胖的, 丰满的, 直接下落的, 直率的 vt. 突然放下, 支持, 使丰满, 使鼓起 vi. 扑通落下, 投票赞成, 变丰满, 鼓起 adv. 沉重地, 突然地, 直截了当地 ｜ 原句：When my grandmother was young, her body was very slim. Now in her old age she''s grown plump.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · polar (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11006-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'polar', JSON_ARRAY('polar'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11006-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11006-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The aurora is a phenomenon characteristic of the ____ regions.',
       JSON_ARRAY(),
       'polar',
       'a. 两极的, 极地的, 正好相反的, 极性的 n. 极线, 极面 ｜ 原句：The aurora is a phenomenon characteristic of the polar regions.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · ponder (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11009-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'ponder', JSON_ARRAY('ponder', 'ponders'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11009-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11009-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He continued to ____ the problem as he walked home.',
       JSON_ARRAY(),
       'ponder',
       'v. 沉思, 考虑 ｜ 原句：He continued to ponder the problem as he walked home.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · pope (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11010-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'pope', JSON_ARRAY('pope', 'popes'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11010-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11010-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Even people who don''t believe in the Catholic church venerate the ____ as a symbolic leader.',
       JSON_ARRAY(),
       'pope',
       'n. 罗马教皇, 主教 ｜ 原句：Even people who don''t believe in the Catholic church venerate the Pope as a symbolic leader.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · popularity (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11011-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'popularity', JSON_ARRAY('popularity'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11011-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11011-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The movie gained her great ____.',
       JSON_ARRAY(),
       'popularity',
       'n. 名声, 受大众欢迎, 流行 ｜ 原句：The movie gained her great popularity.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · portray (CET6, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11014-1', 1, 'CET6', 3, 'FILL_BLANK',
       'IMPORT', 'portray', JSON_ARRAY('portray', 'portrayed', 'portrays', 'portraying'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11014-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11014-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Romantic artists ____ nature as wild and powerful.',
       JSON_ARRAY(),
       'portrayed',
       'vt. 描绘, 描写, 描绘...的肖像 ｜ 原句：Romantic artists portrayed nature as wild and powerful.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · poster (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11017-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'poster', JSON_ARRAY('poster', 'posters'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11017-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11017-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He paused to look at the ____.',
       JSON_ARRAY(),
       'poster',
       'n. 海报, 招贴, 驿马 ｜ 原句：He paused to look at the poster.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · prairie (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11020-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'prairie', JSON_ARRAY('prairie', 'prairies'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11020-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11020-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Laura Ingalls grew up on the ____.',
       JSON_ARRAY(),
       'prairie',
       'n. 大草原, 草甸 ｜ 原句：Laura Ingalls grew up on the prairie.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · preach (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11021-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'preach', JSON_ARRAY('preach', 'preaches', 'preached', 'preaching'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11021-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11021-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The main duty of a priest is to ____ in church.',
       JSON_ARRAY(),
       'preach',
       'v. 传道, 讲道, 说教, 宣讲, 鼓吹 n. 说教, 布道 ｜ 原句：The main duty of a priest is to preach in church.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · precedent (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11023-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'precedent', JSON_ARRAY('precedent', 'precedents'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11023-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11023-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'It''s totally without ____ for the suspect''s attorney to be the true culprit.',
       JSON_ARRAY(),
       'precedent',
       'n. 先例, 前例 a. 在先的, 在前的 ｜ 原句：It''s totally without precedent for the suspect''s attorney to be the true culprit.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · predecessor (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11026-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'predecessor', JSON_ARRAY('predecessor', 'predecessors'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11026-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11026-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Floppy disks are the ____ of hard disks.',
       JSON_ARRAY(),
       'predecessor',
       'n. 前任, 先辈, 前身 [医] 初牙, 前辈, 祖先 ｜ 原句：Floppy disks are the predecessor of hard disks.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · prediction (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11028-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'prediction', JSON_ARRAY('prediction', 'predictions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11028-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11028-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The ____ was falsified by the result.',
       JSON_ARRAY(),
       'prediction',
       'n. 预言, 预报 [化] 预测 ｜ 原句：The prediction was falsified by the result.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · predominantly (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11030-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'predominantly', JSON_ARRAY('predominantly'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11030-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11030-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The landscape has remained ____ rural in appearance.',
       JSON_ARRAY(),
       'predominantly',
       'adv. 主要地, 显著地, 大多数地, 突出地 ｜ 原句：The landscape has remained predominantly rural in appearance.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · pregnancy (CET6, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11032-1', 1, 'CET6', 3, 'FILL_BLANK',
       'IMPORT', 'pregnancy', JSON_ARRAY('pregnancy', 'pregnancies'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11032-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11032-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'One out of 455 women doesn''t realize she''s pregnant until the twentieth week of ____.',
       JSON_ARRAY(),
       'pregnancy',
       'n. 怀孕；丰富, 多产；意义深长 ｜ 原句：One out of 455 women doesn''t realize she''s pregnant until the twentieth week of pregnancy.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · pregnant (CET6, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11033-1', 1, 'CET6', 3, 'FILL_BLANK',
       'IMPORT', 'pregnant', JSON_ARRAY('pregnant'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11033-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11033-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I am four months ____.',
       JSON_ARRAY(),
       'pregnant',
       'a. 怀孕的, 充满的, 思想丰富的, 成果丰硕的 [医] 妊娠的, 有孕的 ｜ 原句：I am four months pregnant.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · premature (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11034-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'premature', JSON_ARRAY('premature'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11034-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11034-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'There is no greater insult to life than ____ ejaculation.',
       JSON_ARRAY(),
       'premature',
       'a. 早产的, 过早的, 不成熟的 n. 早产儿, 过早发生的事物 ｜ 原句：There is no greater insult to life than premature ejaculation.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · premise (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11035-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'premise', JSON_ARRAY('premise', 'premises'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11035-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11035-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'What''s the ____ of the TV show "The Bachelor"?',
       JSON_ARRAY(),
       'premise',
       'n. 前提, 房屋连地基, 上述各项 vt. 预先提出, 引出, 作为...的前提 vi. 作出前提 ｜ 原句：What''s the premise of the TV show "The Bachelor"?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · premium (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11036-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'premium', JSON_ARRAY('premium', 'premiums'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11036-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11036-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'It is too early to say whether insurance ____ will be affected.',
       JSON_ARRAY(),
       'premiums',
       'n. 额外补贴, 奖金, 奖赏, 保险费 [医] 保险费 ｜ 原句：It is too early to say whether insurance premiums will be affected.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · prescription (CET6, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11038-1', 1, 'CET6', 3, 'FILL_BLANK',
       'IMPORT', 'prescription', JSON_ARRAY('prescription', 'prescriptions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11038-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11038-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I''ll give you a ____.',
       JSON_ARRAY(),
       'prescription',
       'n. 处方, 命令, 指定 [医] 处方, 药方 ｜ 原句：I''ll give you a prescription.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · presentation (CET6, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11039-1', 1, 'CET6', 3, 'FILL_BLANK',
       'IMPORT', 'presentation', JSON_ARRAY('presentation', 'presentations'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11039-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11039-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Mennad''s ____ was perfect.',
       JSON_ARRAY(),
       'presentation',
       'n. 赠与, 描述, 介绍 [计] 简报 ｜ 原句：Mennad''s presentation was perfect.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · preservation (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11040-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'preservation', JSON_ARRAY('preservation', 'preservations'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11040-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11040-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'methods of food ____',
       JSON_ARRAY(),
       'preservation',
       'n. 保存, 保藏, 保护 [医] 保藏, 保存, 防腐 ｜ 原句：methods of food preservation',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · presidency (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11043-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'presidency', JSON_ARRAY('presidency', 'presidencies'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11043-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11043-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He''s eligible for the ____.',
       JSON_ARRAY(),
       'presidency',
       'n. 总统职权, 总裁职位 ｜ 原句：He''s eligible for the presidency.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · prestige (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11044-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'prestige', JSON_ARRAY('prestige', 'prestiges'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11044-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11044-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'His ____ is fading.',
       JSON_ARRAY(),
       'prestige',
       'n. 声望, 威望, 威信 [经] 商誉, 声誉 ｜ 原句：His prestige is fading.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · pretext (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11046-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'pretext', JSON_ARRAY('pretext', 'pretexts'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11046-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11046-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He came to my house on the ____ of seeing me.',
       JSON_ARRAY(),
       'pretext',
       'n. 借口, 托词 v. 以...为借口 ｜ 原句：He came to my house on the pretext of seeing me.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · prevailing (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11047-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'prevailing', JSON_ARRAY('prevailing'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11047-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11047-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The ____ mood of public opinion remained hostile.',
       JSON_ARRAY(),
       'prevailing',
       'a. 盛行很广的, 优势的, 主要的, 普遍的 [法] 占优势的, 盛行的, 通行的 ｜ 原句：The prevailing mood of public opinion remained hostile.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · prevalence (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11048-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'prevalence', JSON_ARRAY('prevalence', 'prevalences'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11048-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11048-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'However, no study on the ____ of infertility has been conducted in this area.',
       JSON_ARRAY(),
       'prevalence',
       'n. 普遍, 流行, 广泛 [医] 流行, 盛行 ｜ 原句：However, no study on the prevalence of infertility has been conducted in this area.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · prevalent (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11049-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'prevalent', JSON_ARRAY('prevalent'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11049-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11049-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'It is a ____ belief, according to a nationwide poll in the United States, that Muslims are linked with terrorism.',
       JSON_ARRAY(),
       'prevalent',
       'a. 普遍的, 流行的 ｜ 原句：It is a prevalent belief, according to a nationwide poll in the United States, that Muslims are linked with terrorism.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · prevention (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11050-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'prevention', JSON_ARRAY('prevention', 'preventions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11050-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11050-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '____ is better than cure.',
       JSON_ARRAY(),
       'prevention',
       'n. 阻止, 妨碍, 预防 [医] 预防 ｜ 原句：Prevention is better than cure.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · prey (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11051-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'prey', JSON_ARRAY('prey', 'preys'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11051-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11051-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Cornered ____ is the most dangerous kind.',
       JSON_ARRAY(),
       'prey',
       'n. 被掠食者, 牺牲者 vi. 捕食 ｜ 原句：Cornered prey is the most dangerous kind.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · prick (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11052-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'prick', JSON_ARRAY('prick', 'pricks', 'pricked', 'pricking'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11052-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11052-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'It''s alright. This injection won''t hurt. It will just ____ a little.',
       JSON_ARRAY(),
       'prick',
       'vt. 刺, 戳, 刺痛, 使竖起 vi. 刺, 竖起 n. 扎, 一刺, 刺痛 a. 竖起的 ｜ 原句：It''s alright. This injection won''t hurt. It will just prick a little.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · printer (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11055-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'printer', JSON_ARRAY('printer', 'printers'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11055-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11055-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I bought this ____ yesterday.',
       JSON_ARRAY(),
       'printer',
       'n. 印刷工, 打印机 [计] 打印机 ｜ 原句：I bought this printer yesterday.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · privacy (CET6, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11057-1', 1, 'CET6', 3, 'FILL_BLANK',
       'IMPORT', 'privacy', JSON_ARRAY('privacy', 'privacies'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11057-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11057-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Reporters do not hesitate to intrude into people''s ____.',
       JSON_ARRAY(),
       'privacy',
       'n. 隐私, 隐居, 秘密 [计] 个人保密权 ｜ 原句：Reporters do not hesitate to intrude into people''s privacy.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · probe (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11058-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'probe', JSON_ARRAY('probe', 'probes'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11058-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11058-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I dare not ____ too deeply, lest I uncover the awful truth!',
       JSON_ARRAY(),
       'probe',
       'n. 探索, 调查, 探针, 探测器 v. 用探针探测, 调查, 探索 ｜ 原句：I dare not probe too deeply, lest I uncover the awful truth!',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · proceeding (CET6, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11059-1', 1, 'CET6', 3, 'FILL_BLANK',
       'IMPORT', 'proceeding', JSON_ARRAY('proceeding', 'proceedings'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11059-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11059-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'At the meeting he monopolized the discussion and completely disrupted the ____.',
       JSON_ARRAY(),
       'proceeding',
       'n. 进行, 程序, 行动, 诉讼程序, 事项 [化] 会议论文集 ｜ 原句：At the meeting he monopolized the discussion and completely disrupted the proceeding.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · producer (CET6, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11060-1', 1, 'CET6', 2, 'FILL_BLANK',
       'IMPORT', 'producer', JSON_ARRAY('producer', 'producers'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11060-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11060-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Australia is the world''s fifth-largest coal ____.',
       JSON_ARRAY(),
       'producer',
       'n. 生产者, 制作者, 制作人 [化] 发生器; (炉煤气)发生炉; 制气炉; 生产者 ｜ 原句：Australia is the world''s fifth-largest coal producer.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · productivity (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11061-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'productivity', JSON_ARRAY('productivity'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11061-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11061-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'high ____ levels in manufacturing',
       JSON_ARRAY(),
       'productivity',
       'n. 生产力 [经] 生产率, 生产能力 ｜ 原句：high productivity levels in manufacturing',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · proficiency (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11062-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'proficiency', JSON_ARRAY('proficiency', 'proficiencies'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11062-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11062-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I''ve heard it said that there is no way for you to ever reach native ____ in a language if you haven''t started studying it before the age of twelve.',
       JSON_ARRAY(),
       'proficiency',
       'n. 精通, 熟练, 精练 ｜ 原句：I''ve heard it said that there is no way for you to ever reach native proficiency in a language if you haven''t started studying it before the age of twelve.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · proficient (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11063-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'proficient', JSON_ARRAY('proficient', 'proficients'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11063-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11063-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'She is ____ in French.',
       JSON_ARRAY(),
       'proficient',
       'n. 高手, 专家 a. 精通的, 熟练的 ｜ 原句：She is proficient in French.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · profile (CET6, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11064-1', 1, 'CET6', 3, 'FILL_BLANK',
       'IMPORT', 'profile', JSON_ARRAY('profile', 'profiles'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11064-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11064-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Tom always has the cutest ____ pictures.',
       JSON_ARRAY(),
       'profile',
       'n. 侧面, 轮廓, 传略 vt. 描绘...轮廓, 写...的传略 [计] 提问档; 剖面图法; 剖面法 ｜ 原句：Tom always has the cutest profile pictures.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · profound (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11065-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'profound', JSON_ARRAY('profound'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11065-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11065-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'His teachings are incorporated in a ____ book Daode Jing which Taoists regard as the final authority and doctrines of the religion.',
       JSON_ARRAY(),
       'profound',
       'a. 极深的, 深厚的, 深刻的, 渊博的 ｜ 原句：His teachings are incorporated in a profound book Daode Jing which Taoists regard as the final authority and doctrines of the religion.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · projector (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11068-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'projector', JSON_ARRAY('projector', 'projectors'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11068-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11068-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'What''s wrong with this ____? It won''t display anything.',
       JSON_ARRAY(),
       'projector',
       'n. 计划人, 发起人, 规划人, 放映机, 映画器, 幻灯机, 幻灯, 探照灯, 发射器 [计] 投影仪 ｜ 原句：What''s wrong with this projector? It won''t display anything.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · prolong (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11069-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'prolong', JSON_ARRAY('prolong', 'prolongs', 'prolonged', 'prolonging'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11069-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11069-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I was trying to think of some way to ____ the conversation.',
       JSON_ARRAY(),
       'prolong',
       'vt. 延长, 拖延, 拖长 [化] 冷凝管 ｜ 原句：I was trying to think of some way to prolong the conversation.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · promotion (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11071-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'promotion', JSON_ARRAY('promotion', 'promotions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11071-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11071-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Recently T Mall has had a sales ____ on cell phones.',
       JSON_ARRAY(),
       'promotion',
       'n. 晋级, 创建, 增进 [经] 推广, 推销, 促进 ｜ 原句：Recently T Mall has had a sales promotion on cell phones.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · promptly (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11072-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'promptly', JSON_ARRAY('promptly'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11072-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11072-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Would you please replace the broken one ____?',
       JSON_ARRAY(),
       'promptly',
       'adv. 敏捷地, 迅速地 ｜ 原句：Would you please replace the broken one promptly?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · prone (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11073-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'prone', JSON_ARRAY('prone'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11073-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11073-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Taiwan is ____ to earthquakes.',
       JSON_ARRAY(),
       'prone',
       'a. 俯伏的, 面向下的, 有...倾向的 [医] 旋前的, 伏的, 俯的 ｜ 原句：Taiwan is prone to earthquakes.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · propaganda (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11074-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'propaganda', JSON_ARRAY('propaganda', 'propagandas'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11074-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11074-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I''m in charge of the ____.',
       JSON_ARRAY(),
       'propaganda',
       'n. 宣传, 宣传活动 [医] 宣传 ｜ 原句：I''m in charge of the propaganda.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · prophecy (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11079-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'prophecy', JSON_ARRAY('prophecy', 'prophecies'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11079-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11079-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Your ____ has come true.',
       JSON_ARRAY(),
       'prophecy',
       'n. 预言, 预言能力 ｜ 原句：Your prophecy has come true.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · proposition (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11081-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'proposition', JSON_ARRAY('proposition', 'propositions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11081-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11081-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'An interesting ____ is raised in your book.',
       JSON_ARRAY(),
       'proposition',
       'n. 建议, 命题, 主张 vt. 向...提议, 向...提出猥亵的要求 ｜ 原句：An interesting proposition is raised in your book.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · prose (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11083-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'prose', JSON_ARRAY('prose', 'proses'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11083-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11083-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He isn''t a poet; he''s a ____ writer.',
       JSON_ARRAY(),
       'prose',
       'n. 散文 v. 写散文 a. 散文的, 平凡的 ｜ 原句：He isn''t a poet; he''s a prose writer.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · proverb (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11088-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'proverb', JSON_ARRAY('proverb', 'proverbs'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11088-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11088-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'A rolling stone gathers no moss is a ____.',
       JSON_ARRAY(),
       'proverb',
       'n. 谚语, 格言, 箴言 vt. 使众所周知, 用谚语表达 ｜ 原句：A rolling stone gathers no moss is a proverb.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · proximity (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11092-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'proximity', JSON_ARRAY('proximity'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11092-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11092-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Blind people sometimes develop a compensatory ability to sense the ____ of objects around them.',
       JSON_ARRAY(),
       'proximity',
       'n. 接近, 亲近 ｜ 原句：Blind people sometimes develop a compensatory ability to sense the proximity of objects around them.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · prudent (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11093-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'prudent', JSON_ARRAY('prudent'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11093-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11093-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'A miser hoards money not because he is ____ but because he is greedy.',
       JSON_ARRAY(),
       'prudent',
       'a. 审慎的, 三思而后行的, 精明的, 节俭的 ｜ 原句：A miser hoards money not because he is prudent but because he is greedy.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · psychology (CET6, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11094-1', 1, 'CET6', 3, 'FILL_BLANK',
       'IMPORT', 'psychology', JSON_ARRAY('psychology', 'psychologies'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11094-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11094-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Psycho-horror films dealing with the mysteries of human ____ are popular these days.',
       JSON_ARRAY(),
       'psychology',
       'n. 心理学, 心理状态 [医] 心理学 ｜ 原句：Psycho-horror films dealing with the mysteries of human psychology are popular these days.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · publicity (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11095-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'publicity', JSON_ARRAY('publicity'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11095-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11095-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Much advance ____ was given to the talks.',
       JSON_ARRAY(),
       'publicity',
       'n. 名声, 宣传, 公开场合 [经] 宣传, 广告 ｜ 原句：Much advance publicity was given to the talks.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · pumpkin (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11097-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'pumpkin', JSON_ARRAY('pumpkin', 'pumpkins'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11097-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11097-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I like to drink ____ soup.',
       JSON_ARRAY(),
       'pumpkin',
       'n. 南瓜 ｜ 原句：I like to drink pumpkin soup.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · puppy (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11098-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'puppy', JSON_ARRAY('puppy', 'puppies'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11098-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11098-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Sasha and Malia! I love you both more than you can imagine. And you have earned the new ____ that''s coming with us to the White House.',
       JSON_ARRAY(),
       'puppy',
       'n. 小狗, 小动物, 自负的年轻人 ｜ 原句：Sasha and Malia! I love you both more than you can imagine. And you have earned the new puppy that''s coming with us to the White House.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · pyjamas (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11099-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'pyjamas', JSON_ARRAY('pyjamas'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11099-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11099-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'One morning I shot an elephant in my ____.',
       JSON_ARRAY(),
       'pyjamas',
       'n. 睡衣裤, 宽松裤 ｜ 原句：One morning I shot an elephant in my pyjamas.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · qualification (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11100-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'qualification', JSON_ARRAY('qualification', 'qualifications'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11100-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11100-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He left school without any ____.',
       JSON_ARRAY(),
       'qualifications',
       'n. 资格, 条件, 限制 [计] 限定 ｜ 原句：He left school without any qualifications.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · quench (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11105-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'quench', JSON_ARRAY('quench', 'quenches', 'quenched', 'quenching'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11105-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11105-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Do you have a drink to help ____ my thirst?',
       JSON_ARRAY(),
       'quench',
       'vt. 熄灭, 结束, 使冷却, 将...淬火 vi. 熄灭, 平息 ｜ 原句：Do you have a drink to help quench my thirst?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · quest (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11106-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'quest', JSON_ARRAY('quest', 'quests'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11106-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11106-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Gulliver traveled in ____ of adventure.',
       JSON_ARRAY(),
       'quest',
       'n. 探索, 寻求, 调查 v. 寻找, 找, 追寻猎物 ｜ 原句：Gulliver traveled in quest of adventure.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · questionable (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11107-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'questionable', JSON_ARRAY('questionable'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11107-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11107-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'It is ____ whether this data can be relied on.',
       JSON_ARRAY(),
       'questionable',
       'a. 可疑的 [法] 可疑的, 有问题的, 不可靠的 ｜ 原句：It is questionable whether this data can be relied on.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · rainforest (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11113-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'rainforest', JSON_ARRAY('rainforest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11113-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11113-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Save the ____!',
       JSON_ARRAY(),
       'rainforest',
       '[生态]雨林 ｜ 原句：Save the rainforest!',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · rally (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11115-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'rally', JSON_ARRAY('rally', 'rallies'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11115-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11115-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'About 1,000 people attended the ____ in Hyde Park.',
       JSON_ARRAY(),
       'rally',
       'n. 重振旗鼓, 集合, 群众集会, 跌停回升 v. 重整旗鼓, 集合, 恢复精神, 团结, 挖苦, 嘲笑 ｜ 原句：About 1,000 people attended the rally in Hyde Park.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · random (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11118-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'random', JSON_ARRAY('random', 'randoms'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11118-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11118-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Choose three books at ____.',
       JSON_ARRAY(),
       'random',
       'n. 随意, 随机 a. 任意的, 随便的, 胡乱的, 随机的 adv. 胡乱地 ｜ 原句：Choose three books at random.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · rash (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11123-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'rash', JSON_ARRAY('rash', 'rasher', 'rashest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11123-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11123-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I got a makeup-induced ____.',
       JSON_ARRAY(),
       'rash',
       'a. 轻率的, 匆忙的, 鲁莽的 n. 皮疹 ｜ 原句：I got a makeup-induced rash.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · reactor (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11126-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'reactor', JSON_ARRAY('reactor', 'reactors'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11126-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11126-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Due to the catastrophe caused by the huge tsunami, damage was sustained by the nuclear ____ as well as explosions at the nuclear power plant.',
       JSON_ARRAY(),
       'reactor',
       'n. 反应者, 反应器, 反应堆, 电抗器 [化] 反应釜; 反应锅 ｜ 原句：Due to the catastrophe caused by the huge tsunami, damage was sustained by the nuclear reactor as well as explosions at the nuclear power plant.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · recession (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11131-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'recession', JSON_ARRAY('recession', 'recessions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11131-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11131-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '____ is a temporary falling off of business activity during a period when such activity is generally increasing.',
       JSON_ARRAY(),
       'recession',
       'n. 后退, 凹处, 衰退, 归还 [医] 退缩 ｜ 原句：Recession is a temporary falling off of business activity during a period when such activity is generally increasing.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · recipe (CET6, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11132-1', 1, 'CET6', 3, 'FILL_BLANK',
       'IMPORT', 'recipe', JSON_ARRAY('recipe', 'recipes'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11132-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11132-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The frog and I took turns guessing what the secret ____ was.',
       JSON_ARRAY(),
       'recipe',
       'n. 食谱, 处方, 秘诀 [医] 取(处方头语), 处方 ｜ 原句：The frog and I took turns guessing what the secret recipe was.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · recipient (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11133-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'recipient', JSON_ARRAY('recipient'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11133-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11133-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Don''t flip-flop the addresses of the sender and ____!',
       JSON_ARRAY(),
       'recipient',
       'a. 领受的, 容易接受的, 感受性强的 n. 领受者, 容纳者, 容器 ｜ 原句：Don''t flip-flop the addresses of the sender and recipient!',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · reckless (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11135-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'reckless', JSON_ARRAY('reckless'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11135-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11135-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '____ driving can easily lead to an accident.',
       JSON_ARRAY(),
       'reckless',
       'a. 不介意的, 大意的, 鲁莽的, 不顾后果的 [法] 不注意的, 粗心大意的, 鲁莽的 ｜ 原句：Reckless driving can easily lead to an accident.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · reckon (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11136-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'reckon', JSON_ARRAY('reckon', 'reckons'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11136-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11136-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I ____ he will be back soon.',
       JSON_ARRAY(),
       'reckon',
       'vt. 计算, 总计, 估计, 认为, 猜想 vi. 数, 计算, 估计, 依赖, 料想 ｜ 原句：I reckon he will be back soon.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · reconcile (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11138-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'reconcile', JSON_ARRAY('reconcile', 'reconciles', 'reconciled', 'reconciling'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11138-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11138-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I would rather kill myself than ____ myself to my fate.',
       JSON_ARRAY(),
       'reconcile',
       'vt. 使和解, 调停, 使和谐, 使一致, 使听从 [经] 对帐, 使一致 ｜ 原句：I would rather kill myself than reconcile myself to my fate.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · rectangle (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11140-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'rectangle', JSON_ARRAY('rectangle', 'rectangles'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11140-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11140-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Roll the pastry into a ____.',
       JSON_ARRAY(),
       'rectangle',
       'n. 长方形, 矩形 [化] 矩形 ｜ 原句：Roll the pastry into a rectangle.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · recurrence (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11144-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'recurrence', JSON_ARRAY('recurrence', 'recurrences'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11144-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11144-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Police are out in force to prevent a ____ of the violence.',
       JSON_ARRAY(),
       'recurrence',
       'n. 再现, 再发生, 反复, 循环 [医] 复发, 再发 ｜ 原句：Police are out in force to prevent a recurrence of the violence.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · recycle (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11145-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'recycle', JSON_ARRAY('recycle', 'recycles', 'recycled', 'recycling'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11145-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11145-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'We must make the utmost effort to reduce the use of plastic packaging, and also to ____ all waste plastic.',
       JSON_ARRAY(),
       'recycle',
       'vt. 使再循环, 重新利用, 再制 n. 再循环 ｜ 原句：We must make the utmost effort to reduce the use of plastic packaging, and also to recycle all waste plastic.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · redundant (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11146-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'redundant', JSON_ARRAY('redundant'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11146-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11146-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I''m sorry to have to tell you that you''ve been made ____.',
       JSON_ARRAY(),
       'redundant',
       'a. 多余的, 过多的, 冗长的 [医] 过多的, 多余的 ｜ 原句：I''m sorry to have to tell you that you''ve been made redundant.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · reef (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11147-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'reef', JSON_ARRAY('reef', 'reefs'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11147-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11147-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The coral ____ is the region''s prime attraction.',
       JSON_ARRAY(),
       'reef',
       'n. 暗礁, 礁, 缩帆 v. 缩(帆) ｜ 原句：The coral reef is the region''s prime attraction.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · refrain (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11150-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'refrain', JSON_ARRAY('refrain', 'refrains'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11150-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11150-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Please ____ from smoking in public places.',
       JSON_ARRAY(),
       'refrain',
       'n. 重复的话, 叠句, 副歌 vi. 节制, 避免, 克制 ｜ 原句：Please refrain from smoking in public places.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · regime (CET6, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11154-1', 1, 'CET6', 2, 'FILL_BLANK',
       'IMPORT', 'regime', JSON_ARRAY('regime', 'regimes'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11154-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11154-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'His ____ is bound to collapse.',
       JSON_ARRAY(),
       'regime',
       'n. 政权, 当权期间, 政体, 社会制度, 体制, 情态 [医] 制度, 生活制度 ｜ 原句：His regime is bound to collapse.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · reimburse (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11157-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'reimburse', JSON_ARRAY('reimburse', 'reimburses', 'reimbursed', 'reimbursing'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11157-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11157-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Your school is so kind to ____ you for the return airfare.',
       JSON_ARRAY(),
       'reimburse',
       'vt. 付还, 偿还, 赔偿 [经] 偿付, 赔还, 付还; 偿还 ｜ 原句：Your school is so kind to reimburse you for the return airfare.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · renaissance (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11164-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'renaissance', JSON_ARRAY('renaissance', 'renaissances'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11164-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11164-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'With ____, scholastic ideas gave place to positive ideas.',
       JSON_ARRAY(),
       'renaissance',
       'n. 复活, 复兴, 文艺复兴 a. 文艺复兴的 ｜ 原句：With Renaissance, scholastic ideas gave place to positive ideas.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · repay (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11166-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'repay', JSON_ARRAY('repay', 'repays', 'repayed', 'repaying'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11166-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11166-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Lend money only to such as will ____ it.',
       JSON_ARRAY(),
       'repay',
       'v. 偿还, 报答, 报复 ｜ 原句：Lend money only to such as will repay it.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · repertoire (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11169-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'repertoire', JSON_ARRAY('repertoire', 'repertoires'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11169-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11169-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Her ____ on the piano is not very large, but she has learned every piece by heart.',
       JSON_ARRAY(),
       'repertoire',
       'n. 全部剧目, 全部技能, 全部节目, 全部作品 ｜ 原句：Her repertoire on the piano is not very large, but she has learned every piece by heart.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · replacement (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11170-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'replacement', JSON_ARRAY('replacement'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11170-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11170-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'History develops through the ____ of the old by the new.',
       JSON_ARRAY(),
       'replacement',
       'n. 归还, 更换, 代替者 [医] 复位, 置换 ｜ 原句：History develops through the replacement of the old by the new.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · reproduction (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11172-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'reproduction', JSON_ARRAY('reproduction', 'reproductions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11172-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11172-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Scientists studied the ____, diet, and health of the dolphins.',
       JSON_ARRAY(),
       'reproduction',
       'n. 再现, 复制, 生殖, 繁殖, 复制品 [医] 生殖, 复现(心理) ｜ 原句：Scientists studied the reproduction, diet, and health of the dolphins.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · resemblance (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11175-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'resemblance', JSON_ARRAY('resemblance', 'resemblances'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11175-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11175-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The ____ between Sean and Conner is striking!',
       JSON_ARRAY(),
       'resemblance',
       'n. 相似处, 类似, 肖像 ｜ 原句：The resemblance between Sean and Conner is striking!',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · resent (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11176-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'resent', JSON_ARRAY('resent', 'resents', 'resented', 'resenting'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11176-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11176-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Why do you ____ me?',
       JSON_ARRAY(),
       'resent',
       'vt. 愤恨, 憎恶, 怨恨 ｜ 原句：Why do you resent me?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · resentment (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11177-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'resentment', JSON_ARRAY('resentment'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11177-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11177-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Losing your temper for no reason would invite the ____ of others.',
       JSON_ARRAY(),
       'resentment',
       'n. 怨恨, 愤恨 ｜ 原句：Losing your temper for no reason would invite the resentment of others.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · reservoir (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11178-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'reservoir', JSON_ARRAY('reservoir', 'reservoirs'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11178-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11178-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'This ____ was formed by damming the River Blith.',
       JSON_ARRAY(),
       'reservoir',
       'n. 贮水池, 贮藏处, 贮备, 水库 vt. 储藏 ｜ 原句：This reservoir was formed by damming the River Blith.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · residential (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11180-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'residential', JSON_ARRAY('residential'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11180-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11180-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Please write down your ____ address and home number.',
       JSON_ARRAY(),
       'residential',
       'a. 住宅的, 与居住有关的 [法] 有关居住的, 房产的:居所的, 适于居住的 ｜ 原句：Please write down your residential address and home number.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · retirement (CET6, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11189-1', 1, 'CET6', 3, 'FILL_BLANK',
       'IMPORT', 'retirement', JSON_ARRAY('retirement'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11189-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11189-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'After ____, Teresa devoted herself to caring for orphans.',
       JSON_ARRAY(),
       'retirement',
       'n. 退休, 隐居, 撤退 [经] 退休, 退股, (固定资产)报废 ｜ 原句：After retirement, Teresa devoted herself to caring for orphans.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · reunion (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11192-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'reunion', JSON_ARRAY('reunion', 'reunions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11192-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11192-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'This means that eating dumplings on New Year''s eve is a symbol of family ____.',
       JSON_ARRAY(),
       'reunion',
       'n. 团圆, 重聚 [医] 再连合, 复连[合] ｜ 原句：This means that eating dumplings on New Year''s eve is a symbol of family reunion.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · revision (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11194-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'revision', JSON_ARRAY('revision', 'revisions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11194-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11194-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Date of last ____ of this page: 2010-11-03',
       JSON_ARRAY(),
       'revision',
       'n. 校订, 修正, 修订本, 修订版 [计] 修订版 ｜ 原句：Date of last revision of this page: 2010-11-03',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · revive (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11195-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'revive', JSON_ARRAY('revive', 'revives', 'revived', 'reviving'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11195-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11195-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'You''ll never be able to ____ someone who is only pretending to be dead.',
       JSON_ARRAY(),
       'revive',
       'vt. 使苏醒, 使复兴, 使振奋, 回想起, 重播 vi. 苏醒, 复活, 复兴, 恢复精神 ｜ 原句：You''ll never be able to revive someone who is only pretending to be dead.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · revolve (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11196-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'revolve', JSON_ARRAY('revolve', 'revolves', 'revolved', 'revolving'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11196-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11196-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The world doesn''t ____ around you.',
       JSON_ARRAY(),
       'revolve',
       'v. (使)旋转, 反复考虑, 循环出现 ｜ 原句：The world doesn''t revolve around you.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · rigorous (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11199-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'rigorous', JSON_ARRAY('rigorous'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11199-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11199-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'As I''ve already mentioned before, after a ____ investigation, we have found nothing wrong with our company''s management.',
       JSON_ARRAY(),
       'rigorous',
       'a. 严厉的, 严酷的, 严格的, 苛刻的, 严密的, 精确的 ｜ 原句：As I''ve already mentioned before, after a rigorous investigation, we have found nothing wrong with our company''s management.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · rim (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11200-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'rim', JSON_ARRAY('rim', 'rims'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11200-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11200-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Mary took an egg and cracked it open on the ____ of the bowl.',
       JSON_ARRAY(),
       'rim',
       'n. 边, 轮缘, 框 vt. 镶边, 为...装边 vi. 形成边缘 ｜ 原句：Mary took an egg and cracked it open on the rim of the bowl.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · riot (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11202-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'riot', JSON_ARRAY('riot', 'riots'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11202-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11202-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'There was only one warden on duty when the ____ started.',
       JSON_ARRAY(),
       'riot',
       'n. 暴动, 喧闹, 放纵 vi. 发动, 暴动, 纵情, 放荡 vt. 浪费, 挥霍 ｜ 原句：There was only one warden on duty when the riot started.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · ritual (CET6, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11205-1', 1, 'CET6', 3, 'FILL_BLANK',
       'IMPORT', 'ritual', JSON_ARRAY('ritual', 'rituals'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11205-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11205-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'A sacred ____ took place in the magnificent temple.',
       JSON_ARRAY(),
       'ritual',
       'n. 仪式, 典礼, 宗教仪式 a. 仪式的, 依仪式进行的 ｜ 原句：A sacred ritual took place in the magnificent temple.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · robust (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11207-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'robust', JSON_ARRAY('robust'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11207-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11207-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Full oxidation gives black tea its deep, ____ flavor and dark amber color.',
       JSON_ARRAY(),
       'robust',
       'a. 健康的, 强健的, 要用力气的, 坚定的, 粗野的 [计] 健壮性 ｜ 原句：Full oxidation gives black tea its deep, robust flavor and dark amber color.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · romance (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11208-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'romance', JSON_ARRAY('romance', 'romances'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11208-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11208-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Can you recommend a ____ novel for me?',
       JSON_ARRAY(),
       'romance',
       'n. 冒险故事, 浪漫史, 传奇文学 vi. 写传奇, 作空想, 虚构 ｜ 原句：Can you recommend a romance novel for me?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · rooster (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11209-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'rooster', JSON_ARRAY('rooster', 'roosters'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11209-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11209-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Happy year of the ____!',
       JSON_ARRAY(),
       'rooster',
       'n. 公鸡, 栖息的鸟 [机] 炉篦 ｜ 原句：Happy year of the rooster!',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · royalty (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11211-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'royalty', JSON_ARRAY('royalty', 'royalties'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11211-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11211-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Intel gets a huge ____ from the invention.',
       JSON_ARRAY(),
       'royalty',
       'n. 皇室, 王族成员, 王权, 特权阶层, 庄严 [经] 特许权, 使用费, 使用税 ｜ 原句：Intel gets a huge royalty from the invention.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · salmon (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11216-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'salmon', JSON_ARRAY('salmon', 'salmons'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11216-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11216-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The fish tasted like ____.',
       JSON_ARRAY(),
       'salmon',
       'n. 鲑鱼, 大麻哈鱼 [医] 鲑 ｜ 原句：The fish tasted like salmon.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · salvation (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11217-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'salvation', JSON_ARRAY('salvation', 'salvations'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11217-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11217-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'God is our ____, said the priest.',
       JSON_ARRAY(),
       'salvation',
       'n. 拯救, 救助, 救世 ｜ 原句：God is our salvation, said the priest.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · sanction (CET6, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11218-1', 1, 'CET6', 3, 'FILL_BLANK',
       'IMPORT', 'sanction', JSON_ARRAY('sanction', 'sanctions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11218-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11218-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'It is necessary to obtain the ____ of the authorities to enter this building.',
       JSON_ARRAY(),
       'sanction',
       'n. 核准, 制裁, 处罚, 约束力 vt. 制定制裁规则, 认可, 核准, 同意 ｜ 原句：It is necessary to obtain the sanction of the authorities to enter this building.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · scarcity (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11225-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'scarcity', JSON_ARRAY('scarcity'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11225-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11225-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Gorelick said that the outcomes of his work in Jordan may be used to evaluate water ____ in other Middle Eastern countries, such as Syria.',
       JSON_ARRAY(),
       'scarcity',
       'n. 缺乏, 不足, 缺少 [经] 缺乏, 不足 ｜ 原句：Gorelick said that the outcomes of his work in Jordan may be used to evaluate water scarcity in other Middle Eastern countries, such as Syria.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · scrap (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11231-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'scrap', JSON_ARRAY('scrap', 'scraps'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11231-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11231-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'There is not a ____ of truth in his words.',
       JSON_ARRAY(),
       'scrap',
       'n. 碎片, 残余物, 些微, 片断, 铁屑, 吵架 vt. 扔弃, 敲碎, 拆毁 vi. 互相殴打 a. 零碎拼凑成的, 废弃的 ｜ 原句：There is not a scrap of truth in his words.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · script (CET6, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11232-1', 1, 'CET6', 3, 'FILL_BLANK',
       'IMPORT', 'script', JSON_ARRAY('script', 'scripts'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11232-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11232-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Overall, the movie was a success from ____ to screen.',
       JSON_ARRAY(),
       'script',
       'n. 手迹, 手稿, 正本, 手写体 vt. 改编为演出本 [计] 手写体, 小型程序 ｜ 原句：Overall, the movie was a success from script to screen.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · scripture (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11233-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'scripture', JSON_ARRAY('scripture', 'scriptures'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11233-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11233-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I cannot forbid a person to marry several wives, for it does not contradict ____.',
       JSON_ARRAY(),
       'scripture',
       'n. 圣经, 圣经的一节, 圣经的一句, 铭文 ｜ 原句：I cannot forbid a person to marry several wives, for it does not contradict Scripture.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · sculpture (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11236-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'sculpture', JSON_ARRAY('sculpture', 'sculptures'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11236-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11236-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '...stone ____ of figures and animals.',
       JSON_ARRAY(),
       'sculptures',
       'n. 雕刻, 雕塑 vt. 雕刻, 雕塑 vi. 当雕刻师 ｜ 原句：...stone sculptures of figures and animals.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · seaside (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11238-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'seaside', JSON_ARRAY('seaside'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11238-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11238-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I''d like to go to the ____ with you.',
       JSON_ARRAY(),
       'seaside',
       'a. 海边的, 海滨的 n. 海滨 ｜ 原句：I''d like to go to the seaside with you.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · second-hand (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11239-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'second-hand', JSON_ARRAY('second-hand'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11239-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11239-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Wearing ____ clothes is now popular among young people.',
       JSON_ARRAY(),
       'second-hand',
       'a. 用过的, 旧货的, 旧的, 间接的, 传来的, 第二手的 [机] 半新的, 旧货 ｜ 原句：Wearing second-hand clothes is now popular among young people.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · sector (CET6, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11240-1', 1, 'CET6', 2, 'FILL_BLANK',
       'IMPORT', 'sector', JSON_ARRAY('sector', 'sectors'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11240-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11240-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Algeria needs to train its public ____ employees on new technologies, communication skills, and customer service.',
       JSON_ARRAY(),
       'sector',
       'n. 扇形, 部门, 部分, 函数尺, 象限仪, 段, 区段 vt. 把...分成扇形 [计] 扇面; 扇区; 段; 区段 ｜ 原句：Algeria needs to train its public sector employees on new technologies, communication skills, and customer service.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · seemingly (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11242-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'seemingly', JSON_ARRAY('seemingly'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11242-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11242-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '____ unrelated bits of information',
       JSON_ARRAY(),
       'seemingly',
       'adv. 看来似乎, 表面上看来 ｜ 原句：seemingly unrelated bits of information',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · senator (CET6, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11245-1', 1, 'CET6', 3, 'FILL_BLANK',
       'IMPORT', 'senator', JSON_ARRAY('senator', 'senators'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11245-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11245-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The ____ was censured by the congressional ethics committee.',
       JSON_ARRAY(),
       'senator',
       'n. 参议员, (某些大学的)理事 [法] 参议员, 上议员 ｜ 原句：The senator was censured by the congressional ethics committee.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · sensation (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11246-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'sensation', JSON_ARRAY('sensation', 'sensations'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11246-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11246-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The hair style of the Beatles created a ____.',
       JSON_ARRAY(),
       'sensation',
       'n. 感觉, 轰动 [医] 感觉 ｜ 原句：The hair style of the Beatles created a sensation.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · senseless (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11247-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'senseless', JSON_ARRAY('senseless'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11247-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11247-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Even if your sentences were actually ____, you at least have the luck to be able to form beautiful sentences.',
       JSON_ARRAY(),
       'senseless',
       'a. 无感觉的, 无意识的, 不省人事的 ｜ 原句：Even if your sentences were actually senseless, you at least have the luck to be able to form beautiful sentences.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · sensitivity (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11248-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'sensitivity', JSON_ARRAY('sensitivity'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11248-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11248-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Writer Luiz Fernando Veríssimo, a columnist capable of uniting generations of readers with irony, precision and ____, died in Porto Alegre, Brazil.',
       JSON_ARRAY(),
       'sensitivity',
       'n. 敏感, 灵敏度 [计] 灵敏度 ｜ 原句：Writer Luiz Fernando Veríssimo, a columnist capable of uniting generations of readers with irony, precision and sensitivity, died in Porto Alegre, Brazil.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · sentiment (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11250-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'sentiment', JSON_ARRAY('sentiment'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11250-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11250-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Anti-Chinese ____ is on the rise in Myanmar.',
       JSON_ARRAY(),
       'sentiment',
       'n. 感情, 感伤, 情操, 情绪, 感想, 意见 [医] 情感, 情操 ｜ 原句：Anti-Chinese sentiment is on the rise in Myanmar.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · serpent (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11252-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'serpent', JSON_ARRAY('serpent', 'serpents'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11252-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11252-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'It had the head of a woman, the body of a lion, the wings of a bird, and the tail of a ____.',
       JSON_ARRAY(),
       'serpent',
       'n. 巨蛇座, 蛇, 蛇形管, 狡猾的人 ｜ 原句：It had the head of a woman, the body of a lion, the wings of a bird, and the tail of a serpent.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · shabby (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11254-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'shabby', JSON_ARRAY('shabby', 'shabbier', 'shabbiest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11254-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11254-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The room was empty except for a ____ bed.',
       JSON_ARRAY(),
       'shabby',
       'a. 衣衫褴褛的, 低劣的, 破旧的, 吝啬的, 卑鄙的 ｜ 原句：The room was empty except for a shabby bed.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · sham (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11258-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'sham', JSON_ARRAY('sham', 'shams'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11258-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11258-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'With all its ____, drudgery and broken dreams; it is still a beautiful world.',
       JSON_ARRAY(),
       'sham',
       'n. 假, 赝品, 骗子, 哄骗 a. 假的, 伪造的 vt. 假装, 冒充 vi. 装假 ｜ 原句：With all its sham, drudgery and broken dreams; it is still a beautiful world.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · shameful (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11259-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'shameful', JSON_ARRAY('shameful'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11259-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11259-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Your conduct is absolutely ____.',
       JSON_ARRAY(),
       'shameful',
       'a. 可耻的, 丢脸的, 不道德的, 淫猥的, 猥亵的, 不体面的 ｜ 原句：Your conduct is absolutely shameful.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · shark (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11260-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'shark', JSON_ARRAY('shark', 'sharks'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11260-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11260-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The skin of a ____ is much rougher than that of a tuna fish.',
       JSON_ARRAY(),
       'shark',
       'n. 鲨鱼, 骗子 v. 诈骗 ｜ 原句：The skin of a shark is much rougher than that of a tuna fish.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · sheer (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11262-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'sheer', JSON_ARRAY('sheer', 'sheerer', 'sheerest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11262-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11262-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'It is a ____ waste of time.',
       JSON_ARRAY(),
       'sheer',
       'a. 绝对的, 全然的, 纯粹的, 透明的, 峻峭的 vi. 偏转, 偏航 vt. 使急转向, 使偏航 adv. 完全, 全然, 峻峭 n. 偏航 ｜ 原句：It is a sheer waste of time.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · shipment (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11265-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'shipment', JSON_ARRAY('shipment'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11265-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11265-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'In case the ____ is delayed, we have special delay insurance.',
       JSON_ARRAY(),
       'shipment',
       'n. 装船, 出货 [经] 运送, 运送(寄出)货物, 装载 ｜ 原句：In case the shipment is delayed, we have special delay insurance.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · shortcut (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11267-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'shortcut', JSON_ARRAY('shortcut', 'shortcuts'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11267-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11267-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I created a ____ on the desktop.',
       JSON_ARRAY(),
       'shortcut',
       'n. 捷径, 最短路线 [计] 快捷方式 ｜ 原句：I created a shortcut on the desktop.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · shorten (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11268-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'shorten', JSON_ARRAY('shorten', 'shortens'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11268-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11268-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Don''t smoke. Smoking can ____ your penis.',
       JSON_ARRAY(),
       'shorten',
       'vt. 弄短, 缩短, 减少 vi. 缩小, 变短 ｜ 原句：Don''t smoke. Smoking can shorten your penis.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · shovel (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11272-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'shovel', JSON_ARRAY('shovel', 'shovels'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11272-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11272-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Tom clenched the ____.',
       JSON_ARRAY(),
       'shovel',
       'n. 铲, 铁铲 v. 铲 ｜ 原句：Tom clenched the shovel.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · shrewd (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11273-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'shrewd', JSON_ARRAY('shrewd', 'shrewder', 'shrewdest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11273-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11273-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Malcolm is a ____ businessman.',
       JSON_ARRAY(),
       'shrewd',
       'a. 精明的, 锐利的, 剧烈的, 机灵的, 厉害的 ｜ 原句：Malcolm is a shrewd businessman.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · shrill (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11274-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'shrill', JSON_ARRAY('shrill', 'shrills'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11274-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11274-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I was walking along the crowded street when all at once I heard a ____ cry.',
       JSON_ARRAY(),
       'shrill',
       'n. 尖声 a. 尖锐的, 刺耳的 vt. 尖声说出 vi. 发出刺耳声 ｜ 原句：I was walking along the crowded street when all at once I heard a shrill cry.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · shrimp (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11275-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'shrimp', JSON_ARRAY('shrimp', 'shrimps'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11275-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11275-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Acaraje, a Brazilian food from Africa, is a ball of caupi bean dough, onions, and salt, fried in palm oil and served with ____ and a spicy sauce.',
       JSON_ARRAY(),
       'shrimp',
       'n. 虾, 小虾, 矮子 vi. 捕小虾 ｜ 原句：Acaraje, a Brazilian food from Africa, is a ball of caupi bean dough, onions, and salt, fried in palm oil and served with shrimp and a spicy sauce.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · shrine (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11276-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'shrine', JSON_ARRAY('shrine', 'shrines'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11276-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11276-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The decay of the ____ is due, in part, to acid rain.',
       JSON_ARRAY(),
       'shrine',
       'n. 圣地, 神龛, 庙 vt. 将...置于神龛内 ｜ 原句：The decay of the shrine is due, in part, to acid rain.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · signify (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11281-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'signify', JSON_ARRAY('signify', 'signifies', 'signified', 'signifying'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11281-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11281-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'This is because you approach everything as a total person, with no loose ends hanging out to ____ divided intentions.',
       JSON_ARRAY(),
       'signify',
       'vt. 象征, 预示 vi. 要紧, 重要 ｜ 原句：This is because you approach everything as a total person, with no loose ends hanging out to signify divided intentions.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · simultaneous (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11285-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'simultaneous', JSON_ARRAY('simultaneous'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11285-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11285-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'They grabbed each other’s hands in ____ panic.',
       JSON_ARRAY(),
       'simultaneous',
       'a. 同时的, 同时发生的 [计] 同时的 ｜ 原句：They grabbed each other’s hands in simultaneous panic.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · simultaneously (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11286-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'simultaneously', JSON_ARRAY('simultaneously'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11286-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11286-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The game will be broadcast ____ on TV and radio.',
       JSON_ARRAY(),
       'simultaneously',
       'adv. 同时发生, 一齐, 同时, 同时存在 ｜ 原句：The game will be broadcast simultaneously on TV and radio.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · situated (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11290-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'situated', JSON_ARRAY('situated'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11290-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11290-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The town is ____ 1,500 meters above sea level.',
       JSON_ARRAY(),
       'situated',
       'a. 位于...的, 坐落在...的, 处于某种境地的 [法] 坐落...的, 位于...的, 处于某种境地的 ｜ 原句：The town is situated 1,500 meters above sea level.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · skeleton (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11291-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'skeleton', JSON_ARRAY('skeleton', 'skeletons'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11291-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11291-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The explorers discovered a ____ in the cave.',
       JSON_ARRAY(),
       'skeleton',
       'n. 骨骼, 骨瘦如柴的人, 梗概, 骨干, 残骸 a. 骨骼的, 概略的, 基层的, 骨干的 [计] 骨架 ｜ 原句：The explorers discovered a skeleton in the cave.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · skeptical (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11292-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'skeptical', JSON_ARRAY('skeptical'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11292-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11292-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'We''re very ____.',
       JSON_ARRAY(),
       'skeptical',
       'a. 怀疑论的, 怀疑的, 不可知论的 [法] 怀疑的, 不信的, 怀疑论者的 ｜ 原句：We''re very skeptical.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · skip (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11293-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'skip', JSON_ARRAY('skip', 'skips'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11293-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11293-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'My physics teacher doesn''t care if I ____ classes.',
       JSON_ARRAY(),
       'skip',
       'n. 跳跃, 跳读 vi. 跳越, 跳读, 跳绳, 遗漏, 跳级 vt. 跳过, 遗漏 [计] 跳过 ｜ 原句：My physics teacher doesn''t care if I skip classes.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · skyscraper (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11294-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'skyscraper', JSON_ARRAY('skyscraper', 'skyscrapers'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11294-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11294-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The elevators in a ____ are vital systems.',
       JSON_ARRAY(),
       'skyscraper',
       'n. 摩天楼, 三角形天帆 ｜ 原句：The elevators in a skyscraper are vital systems.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · slack (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11295-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'slack', JSON_ARRAY('slack', 'slacks'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11295-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11295-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Business remained ____ throughout the day.',
       JSON_ARRAY(),
       'slack',
       'n. 松弛, 松懈, 淡季, 闲散, 家常裤 a. 松弛的, 不流畅的, 疏忽的, 无力的, 呆滞的, 软弱的, 漏水的 adv. 马虎地, 缓慢地 vt. 放松, 使缓慢 vi. 松懈, 减弱, 松弛 ｜ 原句：Business remained slack throughout the day.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · slang (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11297-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'slang', JSON_ARRAY('slang', 'slangs'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11297-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11297-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'It''s fun to learn ____ words in foreign languages.',
       JSON_ARRAY(),
       'slang',
       'n. 俚语 v. 辱骂, 用俚语说 ｜ 原句：It''s fun to learn slang words in foreign languages.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · slap (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11298-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'slap', JSON_ARRAY('slap', 'slaps'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11298-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11298-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'She gave him a ____ in the face.',
       JSON_ARRAY(),
       'slap',
       'n. 掴, 掌击, 侮辱, 拍击声 v. 拍击, 惩罚 adv. 正面地, 直接地, 突然地 ｜ 原句：She gave him a slap in the face.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · slaughter (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11299-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'slaughter', JSON_ARRAY('slaughter', 'slaughters'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11299-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11299-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Many conservationists fear the continuing ____ of whales is pushing these animals towards extinction.',
       JSON_ARRAY(),
       'slaughter',
       'n. 残杀, 屠杀, 杀戮 vt. 残杀, 屠杀, 亏本出售 ｜ 原句：Many conservationists fear the continuing slaughter of whales is pushing these animals towards extinction.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · slim (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11300-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'slim', JSON_ARRAY('slim', 'slimer', 'slimest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11300-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11300-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'When my grandmother was young, her body was very ____. Now in her old age she''s grown plump.',
       JSON_ARRAY(),
       'slim',
       'a. 瘦的, 苗条的, 微小的, 稀少的, 微薄的 vi. 变苗条 vt. 使苗条 ｜ 原句：When my grandmother was young, her body was very slim. Now in her old age she''s grown plump.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · smuggle (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11303-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'smuggle', JSON_ARRAY('smuggle', 'smuggles', 'smuggled', 'smuggling'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11303-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11303-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'My message is "If you try to ____ drugs you are stupid."',
       JSON_ARRAY(),
       'smuggle',
       'vt. 偷运, 走私, 私运 vi. 走私 ｜ 原句：My message is "If you try to smuggle drugs you are stupid."',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · snack (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11304-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'snack', JSON_ARRAY('snack', 'snacks'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11304-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11304-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'There''s enough time for a quick ____.',
       JSON_ARRAY(),
       'snack',
       'n. 小吃, 点心, 快餐 vi. 吃零食, 吃快餐 ｜ 原句：There''s enough time for a quick snack.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · snail (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11305-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'snail', JSON_ARRAY('snail', 'snails'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11305-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11305-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The ____ draws in its feelers.',
       JSON_ARRAY(),
       'snail',
       'n. 蜗牛, 行动迟缓的人, 脑筋迟钝的人, 蜗形凸轮 vt. (蜗牛般)缓慢地打发(时间) vi. 缓慢移动 ｜ 原句：The snail draws in its feelers.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · sneak (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11307-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'sneak', JSON_ARRAY('sneak', 'sneaks', 'sneaked', 'sneaking'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11307-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11307-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'David decided to ____ into the kitchen and find something delicious to eat.',
       JSON_ARRAY(),
       'sneak',
       'vi. 鬼鬼祟祟做事 vt. 偷偷地做 n. 鬼鬼祟祟的人, 偷偷摸摸的行为, 帆布胶底运动鞋 a. 暗中进行的 ｜ 原句：David decided to sneak into the kitchen and find something delicious to eat.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · sneeze (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11309-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'sneeze', JSON_ARRAY('sneeze', 'sneezes', 'sneeses'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11309-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11309-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I think I''m gonna ____. Give me a tissue.',
       JSON_ARRAY(),
       'sneeze',
       'n. 喷嚏 vi. 打喷嚏 ｜ 原句：I think I''m gonna sneeze. Give me a tissue.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · snobbish (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11312-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'snobbish', JSON_ARRAY('snobbish'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11312-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11312-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Tom is a bit ____.',
       JSON_ARRAY(),
       'snobbish',
       'a. 自命不凡的, 势利的 ｜ 原句：Tom is a bit snobbish.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · snore (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11313-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'snore', JSON_ARRAY('snore', 'snores'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11313-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11313-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I must admit that I ____.',
       JSON_ARRAY(),
       'snore',
       'n. 鼾声, 打鼾 vi. 打鼾 vt. 打鼾度过 ｜ 原句：I must admit that I snore.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · soar (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11314-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'soar', JSON_ARRAY('soar', 'soars'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11314-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11314-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The birds ____ in the air.',
       JSON_ARRAY(),
       'soar',
       'n. 高扬, 翱翔 vi. 往上飞舞, 高耸, 翱翔 ｜ 原句：The birds soar in the air.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · sociology (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11315-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'sociology', JSON_ARRAY('sociology', 'sociologies'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11315-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11315-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Frank majored in ____ at university.',
       JSON_ARRAY(),
       'sociology',
       'n. 社会学 [医] 社会学 ｜ 原句：Frank majored in sociology at university.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · sodium (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11316-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'sodium', JSON_ARRAY('sodium', 'sodiums'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11316-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11316-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '____ bicarbonate is commonly known as baking soda.',
       JSON_ARRAY(),
       'sodium',
       'n. 钠 [化] 钠Na ｜ 原句：Sodium bicarbonate is commonly known as baking soda.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · sofa (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11317-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'sofa', JSON_ARRAY('sofa', 'sofas'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11317-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11317-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'We would like to buy a ____.',
       JSON_ARRAY(),
       'sofa',
       'n. 沙发 ｜ 原句：We would like to buy a sofa.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · solidarity (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11320-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'solidarity', JSON_ARRAY('solidarity'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11320-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11320-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'What can we do to strengthen the movement of ____ with the Palestinian people?',
       JSON_ARRAY(),
       'solidarity',
       'n. 团结, 团结一致, 共同一致 [法] 团结, 共同责任 ｜ 原句：What can we do to strengthen the movement of solidarity with the Palestinian people?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · solitary (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11322-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'solitary', JSON_ARRAY('solitary', 'solitaries'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11322-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11322-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I like a ____ walk.',
       JSON_ARRAY(),
       'solitary',
       'n. 独居者 a. 孤独的, 独居的 ｜ 原句：I like a solitary walk.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · solo (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11323-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'solo', JSON_ARRAY('solo', 'solos'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11323-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11323-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Charles Lindbergh made the first ____ flight across the Atlantic Ocean in 1927.',
       JSON_ARRAY(),
       'solo',
       'n. 独奏, 独唱, 单独表演 a. 单独的, 独奏的, 独唱的 vi. 放单飞 ｜ 原句：Charles Lindbergh made the first solo flight across the Atlantic Ocean in 1927.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · souvenir (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11328-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'souvenir', JSON_ARRAY('souvenir', 'souvenirs'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11328-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11328-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'This will be a good ____ of my trip around the United States.',
       JSON_ARRAY(),
       'souvenir',
       'n. 纪念品 ｜ 原句：This will be a good souvenir of my trip around the United States.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · sovereign (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11329-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'sovereign', JSON_ARRAY('sovereign', 'sovereigns'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11329-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11329-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Puerto Rico is not a ____ state.',
       JSON_ARRAY(),
       'sovereign',
       'n. 元首, 独立国 a. 具有主权的, 至高无上的, 国王的, 完全的 ｜ 原句：Puerto Rico is not a sovereign state.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · soy (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11330-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'soy', JSON_ARRAY('soy', 'soys'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11330-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11330-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Mix the rice and eggs with ____ sauce.',
       JSON_ARRAY(),
       'soy',
       'n. 酱油, 大豆 [医] 大豆; 酱油 ｜ 原句：Mix the rice and eggs with soy sauce.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · spacious (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11331-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'spacious', JSON_ARRAY('spacious'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11331-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11331-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The living room in my new house is very ____.',
       JSON_ARRAY(),
       'spacious',
       'a. 广大的, 宽广的 ｜ 原句：The living room in my new house is very spacious.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · specifically (CET6, 难度 2)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11333-1', 1, 'CET6', 2, 'FILL_BLANK',
       'IMPORT', 'specifically', JSON_ARRAY('specifically'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11333-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11333-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The first time he came to Taipei, he ____ wanted to go shopping in Ximending.',
       JSON_ARRAY(),
       'specifically',
       'adv. 特定地, 明确地, 按特性 ｜ 原句：The first time he came to Taipei, he specifically wanted to go shopping in Ximending.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · specification (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11334-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'specification', JSON_ARRAY('specification', 'specifications'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11334-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11334-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The bolts met all the engineering ____.',
       JSON_ARRAY(),
       'specifications',
       'n. 规格, 详述, 详细说明书 [计] 规范; 形式说明; 说明; 说明书; 规格 ｜ 原句：The bolts met all the engineering specifications.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · spectacular (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11335-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'spectacular', JSON_ARRAY('spectacular'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11335-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11335-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'These fireworks are ____!',
       JSON_ARRAY(),
       'spectacular',
       'a. 公开展示的, 惊人的, 壮观的 n. 奇观, 惊人之举, 展览物 ｜ 原句：These fireworks are spectacular!',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · spherical (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11339-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'spherical', JSON_ARRAY('spherical'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11339-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11339-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The puck of ice hockey is not ____.',
       JSON_ARRAY(),
       'spherical',
       'a. 球的, 球面的, 球状的, 天体的 [医] 球形的, 球状的 ｜ 原句：The puck of ice hockey is not spherical.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · spice (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11340-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'spice', JSON_ARRAY('spice', 'spices'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11340-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11340-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'You smell it. Do five ____ tea eggs smell good?',
       JSON_ARRAY(),
       'spice',
       'n. 香料, 药料, 香气, 调味品, 情趣, 少许 vt. 加香料, 使添趣味 ｜ 原句：You smell it. Do five spice tea eggs smell good?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · spiral (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11342-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'spiral', JSON_ARRAY('spiral', 'spirals'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11342-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11342-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'A snail''s shell is ____ in form.',
       JSON_ARRAY(),
       'spiral',
       'n. 螺旋形之物, 螺线 a. 螺旋形的, 盘旋的 vi. 螺旋形下降, 螺旋形上升, 螺旋形行进 vt. 使螺旋形行进 ｜ 原句：A snail''s shell is spiral in form.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · spouse (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11344-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'spouse', JSON_ARRAY('spouse', 'spouses'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11344-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11344-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Tom found a wonderful ____ in Mary.',
       JSON_ARRAY(),
       'spouse',
       'n. 配偶 ｜ 原句：Tom found a wonderful spouse in Mary.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · stabilize (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11347-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'stabilize', JSON_ARRAY('stabilize', 'stabilized', 'stabilizes', 'stabilizing', 'stabilises', 'stabilised', 'stabilising'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11347-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11347-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The patient’s condition has now ____.',
       JSON_ARRAY(),
       'stabilized',
       'vt. 使安定, 使稳固 vi. 稳定, 安定 ｜ 原句：The patient’s condition has now stabilized.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · stairway (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11350-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'stairway', JSON_ARRAY('stairway', 'stairways'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11350-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11350-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'In an emergency, use the ____, not the elevator.',
       JSON_ARRAY(),
       'stairway',
       'n. 楼梯, 阶梯 ｜ 原句：In an emergency, use the stairway, not the elevator.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · stalk (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11351-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'stalk', JSON_ARRAY('stalk', 'stalks'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11351-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11351-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Thoreau coveted the plant''s strong purple ____ for a cane, and the robins eat its dark crimson-juiced berries.',
       JSON_ARRAY(),
       'stalk',
       'n. 茎, 追踪, 高视阔步 vi. 悄悄靠近, 蹑手蹑脚地走近, 蔓延, 高视阔步 vt. 追踪, 搜索 ｜ 原句：Thoreau coveted the plant''s strong purple stalk for a cane, and the robins eat its dark crimson-juiced berries.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · stall (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11352-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'stall', JSON_ARRAY('stall', 'stalls'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11352-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11352-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'For years he has been at the market every Tuesday morning with his fish ____.',
       JSON_ARRAY(),
       'stall',
       'n. 厩, 停车处, 牧师职位, 货摊, 托辞, 拖延 vt. 关入厩, 停顿, 推托, 支吾, 使陷于泥中 vi. 被关在厩内, 陷于泥中, 停止, 支吾 ｜ 原句：For years he has been at the market every Tuesday morning with his fish stall.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · standardize (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11354-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'standardize', JSON_ARRAY('standardize', 'standardizes', 'standardized', 'standardizing', 'standardises', 'standardised', 'standardising'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11354-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11354-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Attempts to ____ English spelling have never been successful.',
       JSON_ARRAY(),
       'standardize',
       'vt. 使标准化, 使合于标准, 用标准检验 [计] 标准化; 规格化 ｜ 原句：Attempts to standardize English spelling have never been successful.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · stationery (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11356-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'stationery', JSON_ARRAY('stationery', 'stationeries'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11356-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11356-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'All of this ____ is his.',
       JSON_ARRAY(),
       'stationery',
       'n. 文具, 信纸 [法] 文具 ｜ 原句：All of this stationery is his.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · steak (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11357-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'steak', JSON_ARRAY('steak', 'steaks'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11357-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11357-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'How would you like your ____?',
       JSON_ARRAY(),
       'steak',
       'n. 牛排, 鱼排, 肉排 ｜ 原句：How would you like your steak?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · stereo (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11358-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'stereo', JSON_ARRAY('stereo', 'stereos'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11358-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11358-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Put a record on the ____.',
       JSON_ARRAY(),
       'stereo',
       'n. 铅版, 立体照片 a. 立体的, 立体感觉的 ｜ 原句：Put a record on the stereo.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · stereotype (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11359-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'stereotype', JSON_ARRAY('stereotype', 'stereotypes'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11359-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11359-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'It is a ____ that police officers always eat doughnuts.',
       JSON_ARRAY(),
       'stereotype',
       'n. 铅版, 陈规, 老套 vt. 使用铅版, 把...印制成盲文, 套用老套, 使一成不变 ｜ 原句：It is a stereotype that police officers always eat doughnuts.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · stew (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11360-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'stew', JSON_ARRAY('stew', 'stews'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11360-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11360-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The ____ smells delicious.',
       JSON_ARRAY(),
       'stew',
       'n. 炖, 烦恼, 热浴, 妓院, 鱼塘 vi. 炖, 焖, 忧虑 vt. 炖, 焖, 使焦虑 ｜ 原句：The stew smells delicious.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · stimulus (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11363-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'stimulus', JSON_ARRAY('stimulus', 'stimuluses'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11363-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11363-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Tax cuts provided the ____ which the slow economy needed.',
       JSON_ARRAY(),
       'stimulus',
       'n. 刺激, 激励, 刺激品 [医] 刺激特, 刺激 ｜ 原句：Tax cuts provided the stimulus which the slow economy needed.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · stout (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11365-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'stout', JSON_ARRAY('stout', 'stouter', 'stoutest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11365-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11365-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Irish ____ is the best beer.',
       JSON_ARRAY(),
       'stout',
       'a. 结实的；矮胖的；勇敢的；激烈的 n. 矮胖子；烈性啤酒 ｜ 原句：Irish stout is the best beer.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · straighten (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11366-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'straighten', JSON_ARRAY('straighten', 'straightens'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11366-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11366-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Put away the bedsheet, I''ll ____ the bed.',
       JSON_ARRAY(),
       'straighten',
       'vt. 弄直, 整顿, 清理, 使改正 vi. 直起来, 改正, 好转 ｜ 原句：Put away the bedsheet, I''ll straighten the bed.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · straightforward (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11367-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'straightforward', JSON_ARRAY('straightforward'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11367-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11367-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He''s very ____.',
       JSON_ARRAY(),
       'straightforward',
       'a. 笔直的, 率直的, 明确的, 简单的, 直接的 ｜ 原句：He''s very straightforward.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · stray (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11370-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'stray', JSON_ARRAY('stray', 'strays'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11370-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11370-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Tom has found another ____ dog.',
       JSON_ARRAY(),
       'stray',
       'n. 走失的家畜, 浪子 a. 迷途的, 偶然的 vi. 迷路, 彷徨, 流浪 ｜ 原句：Tom has found another stray dog.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · stride (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11372-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'stride', JSON_ARRAY('stride', 'strides'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11372-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11372-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I don''t know what to do with that guy. No matter how mad I get at him he just takes it in ____ and pays no attention.',
       JSON_ARRAY(),
       'stride',
       'n. 大步, 步幅, 步态, 进步 v. 迈大步走, 跨过, 跨 ｜ 原句：I don''t know what to do with that guy. No matter how mad I get at him he just takes it in stride and pays no attention.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · striking (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11374-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'striking', JSON_ARRAY('striking'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11374-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11374-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The resemblance between Sean and Conner is ____!',
       JSON_ARRAY(),
       'striking',
       'a. 醒目的, 惊人的, 打击的, 罢工的 [法] 罢工的, 罢市的, 罢课的 ｜ 原句：The resemblance between Sean and Conner is striking!',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · strive (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11375-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'strive', JSON_ARRAY('strive', 'strives', 'strived', 'striving'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11375-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11375-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'No matter how hard I ____, I fail to achieve my parents'' requirements.',
       JSON_ARRAY(),
       'strive',
       'vi. 努力, 奋斗, 斗争 ｜ 原句：No matter how hard I strive, I fail to achieve my parents'' requirements.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · stroll (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11376-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'stroll', JSON_ARRAY('stroll', 'strolls'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11376-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11376-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Spaniards love to ____ around in the evening cool.',
       JSON_ARRAY(),
       'stroll',
       'n. 闲逛, 漫步 v. 闲逛, 漫步 ｜ 原句：Spaniards love to stroll around in the evening cool.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · stubborn (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11377-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'stubborn', JSON_ARRAY('stubborn'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11377-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11377-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I have never come across such a ____ person.',
       JSON_ARRAY(),
       'stubborn',
       'a. 顽固的, 不听话的, 执拗的, 棘手的 ｜ 原句：I have never come across such a stubborn person.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · sturdy (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11381-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'sturdy', JSON_ARRAY('sturdy', 'sturdier', 'sturdiest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11381-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11381-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'This kind of cloth is both cheap and ____.',
       JSON_ARRAY(),
       'sturdy',
       'a. 强健的, 健全的 [医] 羊晕倒病, 羊蹒跚病 ｜ 原句：This kind of cloth is both cheap and sturdy.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · subjective (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11384-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'subjective', JSON_ARRAY('subjective'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11384-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11384-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'His writing is very ____.',
       JSON_ARRAY(),
       'subjective',
       'a. 主观的, 个人的 [医] 主观的, 自觉的 ｜ 原句：His writing is very subjective.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · subordinate (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11385-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'subordinate', JSON_ARRAY('subordinate', 'subordinates'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11385-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11385-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'a ____ officer',
       JSON_ARRAY(),
       'subordinate',
       'n. 属下, 附属物 a. 下级的, 次要的, 附属的 vt. 使居下位, 使服从 ｜ 原句：a subordinate officer',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · subscribe (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11386-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'subscribe', JSON_ARRAY('subscribe', 'subscribes', 'subscribed', 'subscribing'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11386-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11386-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Do you ____ to any magazines?',
       JSON_ARRAY(),
       'subscribe',
       'vt. 捐献, 签署 vi. 赞成, 同意, 捐款, 预订, 认购 [计] 订阅 ｜ 原句：Do you subscribe to any magazines?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · subscription (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11388-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'subscription', JSON_ARRAY('subscription', 'subscriptions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11388-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11388-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The ____ service is available for a fixed monthly fee with a one-month free trial.',
       JSON_ARRAY(),
       'subscription',
       'n. 捐献, 订金, 订阅, 签署, 同意 [化] 订购 ｜ 原句：The subscription service is available for a fixed monthly fee with a one-month free trial.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · subsequently (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11389-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'subsequently', JSON_ARRAY('subsequently'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11389-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11389-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The book was ____ translated into 15 languages.',
       JSON_ARRAY(),
       'subsequently',
       'adv. 后来, 随后 ｜ 原句：The book was subsequently translated into 15 languages.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · subtle (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11392-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'subtle', JSON_ARRAY('subtle', 'subtler', 'subtlest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11392-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11392-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'There are ____ differences between the two pictures.',
       JSON_ARRAY(),
       'subtle',
       'a. 敏锐的, 精细的, 狡猾的, 稀薄的, 灵巧的, 微妙的 [医] 锐敏的; 精细的 ｜ 原句：There are subtle differences between the two pictures.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · sue (CET6, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11394-1', 1, 'CET6', 3, 'FILL_BLANK',
       'IMPORT', 'sue', JSON_ARRAY('sue', 'sues', 'sued', 'suing'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11394-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11394-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Tom and ____ love each other.',
       JSON_ARRAY(),
       'sue',
       'vt. 控告, 起诉, 请求 vi. 提出诉讼, 提出请求 ｜ 原句：Tom and Sue love each other.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · suffice (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11395-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'suffice', JSON_ARRAY('suffice', 'suffices', 'sufficed', 'sufficing'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11395-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11395-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Would it ____ if I came around 7?',
       JSON_ARRAY(),
       'suffice',
       'vi. 足够, 有能力 vt. 满足 ｜ 原句：Would it suffice if I came around 7?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · suicide (CET6, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11396-1', 1, 'CET6', 3, 'FILL_BLANK',
       'IMPORT', 'suicide', JSON_ARRAY('suicide', 'suicides'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11396-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11396-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Smoking means ____.',
       JSON_ARRAY(),
       'suicide',
       'n. 自杀, 自杀者 v. 自杀 a. 自杀的 ｜ 原句：Smoking means suicide.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · suitcase (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11397-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'suitcase', JSON_ARRAY('suitcase', 'suitcases'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11397-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11397-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'What''s the weight of your ____?',
       JSON_ARRAY(),
       'suitcase',
       'n. 手提箱 ｜ 原句：What''s the weight of your suitcase?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · summon (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11399-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'summon', JSON_ARRAY('summon', 'summons'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11399-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11399-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He gained the power to ____ ghost trains.',
       JSON_ARRAY(),
       'summon',
       'vt. 召唤, 召集, 号召, 振奋, 唤起, 鼓起 [经] 传唤, 传讯 ｜ 原句：He gained the power to summon ghost trains.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · superstition (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11404-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'superstition', JSON_ARRAY('superstition', 'superstitions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11404-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11404-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Such a ridiculous ____ no longer exists.',
       JSON_ARRAY(),
       'superstition',
       'n. 迷信 [法] 迷信 ｜ 原句：Such a ridiculous superstition no longer exists.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · supervision (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11406-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'supervision', JSON_ARRAY('supervision', 'supervisions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11406-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11406-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The baby needs constant ____.',
       JSON_ARRAY(),
       'supervision',
       'n. 监督, 管理 [经] 监督, 管理 ｜ 原句：The baby needs constant supervision.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · suppress (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11408-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'suppress', JSON_ARRAY('suppress', 'suppresses', 'suppressed', 'suppressing'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11408-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11408-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Is France trying to ____ Algeria''s development?',
       JSON_ARRAY(),
       'suppress',
       'vt. 镇压, 使止住, 禁止, 抑制, 查禁 [法] 镇压, 平定, 禁止出版 ｜ 原句：Is France trying to suppress Algeria''s development?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · surpass (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11410-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'surpass', JSON_ARRAY('surpass', 'surpasses', 'surpassed', 'surpassing'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11410-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11410-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The reason the Northern and Southern Dynasties had failed in their rule was that they allowed literary splendor to ____ real substance.',
       JSON_ARRAY(),
       'surpass',
       'vt. 超越, 凌驾, 胜过 ｜ 原句：The reason the Northern and Southern Dynasties had failed in their rule was that they allowed literary splendor to surpass real substance.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · susceptible (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11411-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'susceptible', JSON_ARRAY('susceptible'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11411-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11411-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'She was ____ to colds.',
       JSON_ARRAY(),
       'susceptible',
       'a. 易受影响的, 易感动的, 容许...的 [法] 易感的, 易受影响的, 容许 ｜ 原句：She was susceptible to colds.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · sweetness (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11414-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'sweetness', JSON_ARRAY('sweetness'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11414-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11414-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Crafting a perfect Mojito can be a challenge. Achieving the right balance of ____, mintiness, and lime is an art.',
       JSON_ARRAY(),
       'sweetness',
       'n. 甜蜜, 芳香, 美妙 ｜ 原句：Crafting a perfect Mojito can be a challenge. Achieving the right balance of sweetness, mintiness, and lime is an art.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · symphony (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11417-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'symphony', JSON_ARRAY('symphony', 'symphonies'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11417-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11417-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Do you know the concert schedule of London ____ Orchestra?',
       JSON_ARRAY(),
       'symphony',
       'n. 交响乐, 交响曲 ｜ 原句：Do you know the concert schedule of London Symphony Orchestra?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · symptom (CET6, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11419-1', 1, 'CET6', 3, 'FILL_BLANK',
       'IMPORT', 'symptom', JSON_ARRAY('symptom', 'symptoms'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11419-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11419-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'One of the most common ____ of schizophrenia is hearing imaginary voices.',
       JSON_ARRAY(),
       'symptoms',
       'n. 症状, 征候, 征兆 [医] 症状 ｜ 原句：One of the most common symptoms of schizophrenia is hearing imaginary voices.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · tackle (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11425-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'tackle', JSON_ARRAY('tackle', 'tackles'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11425-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11425-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'To begin with, we must ____ the problem.',
       JSON_ARRAY(),
       'tackle',
       'n. 工具, 复滑车, 滑车, 装备, 扭倒 vt. 固定, 处理, 抓住 vi. 扭倒 ｜ 原句：To begin with, we must tackle the problem.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · tactics (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11427-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'tactics', JSON_ARRAY('tactics'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11427-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11427-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'She changed her ____.',
       JSON_ARRAY(),
       'tactics',
       'n. 用兵学, 战术, 兵法 [经] 战术, 策略 ｜ 原句：She changed her tactics.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · tanker (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11429-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'tanker', JSON_ARRAY('tanker', 'tankers'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11429-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11429-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Oil is transported by ____.',
       JSON_ARRAY(),
       'tanker',
       'n. 坦克手, 油船, 空中加油飞机, 运油飞机, 油槽/水槽汽车 [化] 槽车; 油槽船 ｜ 原句：Oil is transported by tanker.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · tar (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11431-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'tar', JSON_ARRAY('tar', 'tars'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11431-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11431-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The Japanese Parliament today officially elected Ryū____ō Hashimoto as the country''s 52nd prime minister.',
       JSON_ARRAY(),
       'tar',
       'n. 焦油, 柏油, 水手 vt. 涂以焦油, 玷污, 怂恿 a. 焦油的 ｜ 原句：The Japanese Parliament today officially elected Ryūtarō Hashimoto as the country''s 52nd prime minister.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · terminology (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11441-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'terminology', JSON_ARRAY('terminology', 'terminologies'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11441-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11441-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Legal ____ is usually incomprehensible to non-specialists.',
       JSON_ARRAY(),
       'terminology',
       'n. 术语, 术语学 [医] 名词学, 命名法 ｜ 原句：Legal terminology is usually incomprehensible to non-specialists.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · terrain (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11443-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'terrain', JSON_ARRAY('terrain', 'terrains'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11443-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11443-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The rugged ____ made the troops'' advance difficult.',
       JSON_ARRAY(),
       'terrain',
       'n. 地带, 地区, 地形, 领域, 范围 ｜ 原句：The rugged terrain made the troops'' advance difficult.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · terrorist (CET6, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11445-1', 1, 'CET6', 3, 'FILL_BLANK',
       'IMPORT', 'terrorist', JSON_ARRAY('terrorist', 'terrorists'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11445-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11445-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'We will never give in to ____ demands.',
       JSON_ARRAY(),
       'terrorist',
       'n. 恐怖分子 [法] 恐怖份子, 恐怖主义 ｜ 原句：We will never give in to terrorist demands.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · testify (CET6, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11446-1', 1, 'CET6', 3, 'FILL_BLANK',
       'IMPORT', 'testify', JSON_ARRAY('testify', 'testifies', 'testified', 'testifying'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11446-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11446-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'We speak that we do know, and ____ that we have seen; and ye receive not our witness.',
       JSON_ARRAY(),
       'testify',
       'v. 证明, 作证, 声明, 表明 ｜ 原句：We speak that we do know, and testify that we have seen; and ye receive not our witness.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · testimony (CET6, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11447-1', 1, 'CET6', 3, 'FILL_BLANK',
       'IMPORT', 'testimony', JSON_ARRAY('testimony', 'testimonies'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11447-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11447-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Barker’s ____ is crucial to the prosecution’s case.',
       JSON_ARRAY(),
       'testimony',
       'n. 证言, 证据, 声明 [医] 证据 ｜ 原句：Barker’s testimony is crucial to the prosecution’s case.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · texture (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11448-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'texture', JSON_ARRAY('texture', 'textures'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11448-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11448-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Line art emphasizes form and outline, over color, shading, and ____.',
       JSON_ARRAY(),
       'texture',
       'n. (织物的)密度, (材料等的)结构, 纹理 [化] 纹理 ｜ 原句：Line art emphasizes form and outline, over color, shading, and texture.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · theft (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11450-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'theft', JSON_ARRAY('theft', 'thefts'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11450-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11450-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The police accused him of ____.',
       JSON_ARRAY(),
       'theft',
       'n. 盗窃, 失窃, 盗窃罪, 赃物 [法] 盗窃行为, 偷窃, 失窃 ｜ 原句：The police accused him of theft.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · theorem (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11451-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'theorem', JSON_ARRAY('theorem', 'theorems'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11451-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11451-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The integral and the antiderivative are defined in two different ways, and the Fundamental ____ of Calculus states the relationship between them.',
       JSON_ARRAY(),
       'theorem',
       'n. 定理, 原理 [化] 定理 ｜ 原句：The integral and the antiderivative are defined in two different ways, and the Fundamental Theorem of Calculus states the relationship between them.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · therapy (CET6, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11452-1', 1, 'CET6', 3, 'FILL_BLANK',
       'IMPORT', 'therapy', JSON_ARRAY('therapy', 'therapies'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11452-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11452-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Demand for occupational ____ has surged in recent years.',
       JSON_ARRAY(),
       'therapy',
       'n. 治疗 [医] 疗法, 治疗 ｜ 原句：Demand for occupational therapy has surged in recent years.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · thereafter (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11453-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'thereafter', JSON_ARRAY('thereafter'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11453-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11453-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '____ we heard no more from him.',
       JSON_ARRAY(),
       'thereafter',
       'adv. 其后, 从那时以后 ｜ 原句：Thereafter we heard no more from him.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · therein (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11454-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'therein', JSON_ARRAY('therein'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11454-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11454-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '____ lies the problem.',
       JSON_ARRAY(),
       'therein',
       'adv. 在其中, 在那里, 在那一点上 ｜ 原句：Therein lies the problem.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · thesis (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11457-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'thesis', JSON_ARRAY('thesis', 'thesises', 'theses'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11457-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11457-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He does not, in short, write with the candor of a man who is completely confident of his ____.',
       JSON_ARRAY(),
       'thesis',
       'n. 论题, 论文 ｜ 原句：He does not, in short, write with the candor of a man who is completely confident of his thesis.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · thicken (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11458-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'thicken', JSON_ARRAY('thicken', 'thickens'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11458-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11458-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'This braised pork is still too watery. Cook it for another ten minutes to ____ the sauce, so the flavor sticks to the meat.',
       JSON_ARRAY(),
       'thicken',
       'vi. 变浓, 变厚, 变得模糊, 变为复杂 vt. 使变厚, 加强, 使模糊 ｜ 原句：This braised pork is still too watery. Cook it for another ten minutes to thicken the sauce, so the flavor sticks to the meat.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · thoroughly (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11460-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'thoroughly', JSON_ARRAY('thoroughly'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11460-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11460-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'We''re ____ prepared for the Y2K bug.',
       JSON_ARRAY(),
       'thoroughly',
       'adv. 彻底地, 绝对地, 透彻地, 详尽地, 周到地, 完全地, 完善地, 全面地 ｜ 原句：We''re thoroughly prepared for the Y2K bug.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · threshold (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11464-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'threshold', JSON_ARRAY('threshold', 'thresholds'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11464-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11464-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Tom has a high ____ for pain.',
       JSON_ARRAY(),
       'threshold',
       'n. 门槛, 入口, 开端, 阈 [计] 阈; 阈值 ｜ 原句：Tom has a high threshold for pain.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · thrifty (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11465-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'thrifty', JSON_ARRAY('thrifty'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11465-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11465-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He is ____, not to say stingy.',
       JSON_ARRAY(),
       'thrifty',
       'a. 节俭的, 兴旺的, 繁茂的 ｜ 原句：He is thrifty, not to say stingy.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · tighten (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11467-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'tighten', JSON_ARRAY('tighten', 'tightens'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11467-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11467-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Small businesses will have to ____ their belts to survive.',
       JSON_ARRAY(),
       'tighten',
       'vt. 勒紧, 使变紧 vi. 变紧, 绷紧 ｜ 原句：Small businesses will have to tighten their belts to survive.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · tightly (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11468-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'tightly', JSON_ARRAY('tightly'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11468-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11468-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'She held on to my hand ____.',
       JSON_ARRAY(),
       'tightly',
       'adv. 紧紧地, 坚固地 ｜ 原句：She held on to my hand tightly.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · timely (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11471-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'timely', JSON_ARRAY('timely', 'timelier', 'timeliest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11471-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11471-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'A ____ snow promises a good harvest.',
       JSON_ARRAY(),
       'timely',
       'a. 及时的, 适时的 adv. 及时地 ｜ 原句：A timely snow promises a good harvest.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · tiresome (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11472-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'tiresome', JSON_ARRAY('tiresome'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11472-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11472-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'If your children are being ____, you will feel time passing slowly.',
       JSON_ARRAY(),
       'tiresome',
       'a. 累人的, 烦人的 ｜ 原句：If your children are being tiresome, you will feel time passing slowly.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · toad (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11473-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'toad', JSON_ARRAY('toad', 'toads'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11473-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11473-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I can''t distinguish a frog from a ____.',
       JSON_ARRAY(),
       'toad',
       'n. 蟾蜍, 癞蛤蟆, 讨厌的家伙 ｜ 原句：I can''t distinguish a frog from a toad.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · token (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11474-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'token', JSON_ARRAY('token', 'tokens'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11474-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11474-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'On leaving school, we presented him with a table clock as a ____ of our thanks.',
       JSON_ARRAY(),
       'token',
       'n. 表征, 记号, 代币 a. 象征的, 表意的 [计] 记号 ｜ 原句：On leaving school, we presented him with a table clock as a token of our thanks.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · tolerant (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11475-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'tolerant', JSON_ARRAY('tolerant'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11475-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11475-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'It is said that Dutch are ____.',
       JSON_ARRAY(),
       'tolerant',
       'a. 宽容的, 容忍的, (对冷、热)能耐的 [医] 能耐受的 ｜ 原句：It is said that Dutch are tolerant.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · torment (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11476-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'torment', JSON_ARRAY('torment'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11476-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11476-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Bad children love to ____ animals.',
       JSON_ARRAY(),
       'torment',
       'n. 使人痛苦的东西, 折磨者, 苦痛 vt. 使苦恼, 纠缠, 歪曲, 拷问 ｜ 原句：Bad children love to torment animals.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · tow (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11480-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'tow', JSON_ARRAY('tow', 'tows'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11480-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11480-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The policeman didn''t ____ your car away.',
       JSON_ARRAY(),
       'tow',
       'n. 拖, 拖绳, 拖轮 vt. 拖, 拉, 牵引 ｜ 原句：The policeman didn''t tow your car away.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · toxic (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11481-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'toxic', JSON_ARRAY('toxic'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11481-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11481-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'fumes from a ____ waste dump',
       JSON_ARRAY(),
       'toxic',
       'a. 有毒的, 中毒的 [医] 中毒的, 毒物的 ｜ 原句：fumes from a toxic waste dump',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · tragic (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11486-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'tragic', JSON_ARRAY('tragic'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11486-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11486-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'They both cried after hearing the ____ news.',
       JSON_ARRAY(),
       'tragic',
       'a. 悲惨的, 悲剧的 ｜ 原句：They both cried after hearing the tragic news.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · trait (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11487-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'trait', JSON_ARRAY('trait', 'traits'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11487-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11487-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'genetic/inherited ____',
       JSON_ARRAY(),
       'traits',
       'n. 特征, 特性, 一笔, 少许 ｜ 原句：genetic/inherited traits',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · trample (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11488-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'trample', JSON_ARRAY('trample', 'tramples'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11488-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11488-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Don''t ____ on the grass.',
       JSON_ARRAY(),
       'trample',
       'n. 践踏(声), 蹂躏 v. 践踏, 无视 ｜ 原句：Don''t trample on the grass.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · transaction (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11490-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'transaction', JSON_ARRAY('transaction', 'transactions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11490-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11490-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The bank charges a fixed rate for each ____.',
       JSON_ARRAY(),
       'transaction',
       'n. 交易, 办理, 学报, 和解协议 [计] 事务处理 ｜ 原句：The bank charges a fixed rate for each transaction.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · transcend (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11491-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'transcend', JSON_ARRAY('transcend', 'transcended', 'transcends', 'transcending'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11491-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11491-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The desire for peace ____ political differences.',
       JSON_ARRAY(),
       'transcended',
       'vt. 超越, 胜过 ｜ 原句：The desire for peace transcended political differences.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · transition (CET6, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11494-1', 1, 'CET6', 3, 'FILL_BLANK',
       'IMPORT', 'transition', JSON_ARRAY('transition', 'transitions'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11494-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11494-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Making the ____ from youth to adulthood can be very painful.',
       JSON_ARRAY(),
       'transition',
       'n. 转变, 转换, 变迁, 过渡时期, 临时转调 [化] 跃迁 ｜ 原句：Making the transition from youth to adulthood can be very painful.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · tread (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11497-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'tread', JSON_ARRAY('tread', 'treads'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11497-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11497-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Fools rush in where angels fear to ____.',
       JSON_ARRAY(),
       'tread',
       'n. 踏, 步态, 梯级, 交尾, 鞋底 vi. 踏, 行走, 交尾 vt. 踩, 踏, 践踏, 跳(舞) ｜ 原句：Fools rush in where angels fear to tread.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · treasurer (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11498-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'treasurer', JSON_ARRAY('treasurer', 'treasurers'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11498-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11498-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I resigned from my position as club ____.',
       JSON_ARRAY(),
       'treasurer',
       'n. 会计, 出纳员, 司库 [经] 司库, 财务主任, 财政大臣 ｜ 原句：I resigned from my position as club treasurer.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · tremendously (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11499-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'tremendously', JSON_ARRAY('tremendously'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11499-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11499-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He is ____ handsome.',
       JSON_ARRAY(),
       'tremendously',
       'adv. 极大地; 极端地; 极其; 非常 ｜ 原句：He is tremendously handsome.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · trivial (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11506-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'trivial', JSON_ARRAY('trivial'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11506-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11506-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Forget it, those are just ____ details.',
       JSON_ARRAY(),
       'trivial',
       'a. 琐碎的, 不重要的, 轻微的, 平常的 ｜ 原句：Forget it, those are just trivial details.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · trot (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11509-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'trot', JSON_ARRAY('trot', 'trots'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11509-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11509-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The old man set off at a quick ____.',
       JSON_ARRAY(),
       'trot',
       'n. 快步 vi. 快步走, 小跑 vt. 使小跑, 策马小跑 ｜ 原句：The old man set off at a quick trot.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · tuberculosis (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11510-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'tuberculosis', JSON_ARRAY('tuberculosis', 'tuberculosises'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11510-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11510-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Juan died from ____.',
       JSON_ARRAY(),
       'tuberculosis',
       'n. 肺结核 [医] 顿挫性结核 ｜ 原句：Juan died from tuberculosis.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · tuna (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11513-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'tuna', JSON_ARRAY('tuna', 'tunas'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11513-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11513-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The skin of a shark is much rougher than that of a ____ fish.',
       JSON_ARRAY(),
       'tuna',
       'n. 金枪鱼, 金枪鱼肉 ｜ 原句：The skin of a shark is much rougher than that of a tuna fish.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · turnover (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11515-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'turnover', JSON_ARRAY('turnover', 'turnovers'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11515-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11515-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'This company achieved a remarkable increase in ____ last year.',
       JSON_ARRAY(),
       'turnover',
       'n. 翻倒, 翻转, 半圆酥饼, 营业额, 流通, 周转 a. 可翻转的 ｜ 原句：This company achieved a remarkable increase in turnover last year.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · tyrant (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11519-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'tyrant', JSON_ARRAY('tyrant', 'tyrants'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11519-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11519-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The depravity of the king''s deeds led the people to believe he was nothing more than a ____ that needed to be overthrown.',
       JSON_ARRAY(),
       'tyrant',
       'n. 暴君 [法] 专制君主, 暴君, 压制他人者 ｜ 原句：The depravity of the king''s deeds led the people to believe he was nothing more than a tyrant that needed to be overthrown.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · ultraviolet (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11521-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'ultraviolet', JSON_ARRAY('ultraviolet'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11521-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11521-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '____ rays can cause skin cancer.',
       JSON_ARRAY(),
       'ultraviolet',
       'a. 紫外线的 [化] 紫外线的; 紫外线 ｜ 原句：Ultraviolet rays can cause skin cancer.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · unanimous (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11522-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'unanimous', JSON_ARRAY('unanimous'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11522-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11522-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The vote is ____.',
       JSON_ARRAY(),
       'unanimous',
       'a. 意见一致的, 无异议的 ｜ 原句：The vote is unanimous.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · unavoidable (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11523-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'unavoidable', JSON_ARRAY('unavoidable'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11523-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11523-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'What happened here was ____.',
       JSON_ARRAY(),
       'unavoidable',
       'a. 不可避免的, 不得已的, 不能作废的 [医] 难免的 ｜ 原句：What happened here was unavoidable.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · underestimate (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11525-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'underestimate', JSON_ARRAY('underestimate', 'underestimates'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11525-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11525-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Don''t ____ my power.',
       JSON_ARRAY(),
       'underestimate',
       'n. 低估 vt. 低估, 看轻 ｜ 原句：Don''t underestimate my power.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · underlying (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11526-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'underlying', JSON_ARRAY('underlying'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11526-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11526-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'They used the Internet too much because they had some ____ problem that also caused them to neglect their child.',
       JSON_ARRAY(),
       'underlying',
       'a. 在下面的 [经] 优先的, 基础的, 放在下面的 ｜ 原句：They used the Internet too much because they had some underlying problem that also caused them to neglect their child.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · undermine (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11527-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'undermine', JSON_ARRAY('undermine', 'undermines', 'undermined', 'undermining'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11527-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11527-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The continued fighting threatens to ____ efforts to negotiate an agreement.',
       JSON_ARRAY(),
       'undermine',
       'vt. 在...下面挖, 渐渐破坏, 暗地里破坏 [法] 暗中破坏, 以阴谋中伤伤害 ｜ 原句：The continued fighting threatens to undermine efforts to negotiate an agreement.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · underwear (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11528-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'underwear', JSON_ARRAY('underwear', 'underwears'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11528-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11528-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I''m not wearing any ____.',
       JSON_ARRAY(),
       'underwear',
       'n. 内衣 ｜ 原句：I''m not wearing any underwear.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · unemployment (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11530-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'unemployment', JSON_ARRAY('unemployment'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11530-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11530-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'What is the ____ rate at the moment?',
       JSON_ARRAY(),
       'unemployment',
       'n. 失业, 失业人数 [经] 失业 ｜ 原句：What is the unemployment rate at the moment?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · unfit (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11531-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'unfit', JSON_ARRAY('unfit'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11531-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11531-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He is ____ to be a teacher.',
       JSON_ARRAY(),
       'unfit',
       'a. 不适当的, 不胜任的, 不健康的 vt. 使不相宜, 使不合格 ｜ 原句：He is unfit to be a teacher.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · unfold (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11532-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'unfold', JSON_ARRAY('unfold', 'unfolds', 'unfolded', 'unfolding'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11532-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11532-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'As the story ____, we learn more about Max’s childhood.',
       JSON_ARRAY(),
       'unfolds',
       'vt. 展开, 打开, 披露, 开展, 挑明 vi. 伸展, 开花, 呈现 ｜ 原句：As the story unfolds, we learn more about Max’s childhood.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · unify (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11534-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'unify', JSON_ARRAY('unify', 'unifies', 'unified', 'unifying'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11534-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11534-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He tried to ____ the various groups.',
       JSON_ARRAY(),
       'unify',
       'v. 统一, 使成一体 ｜ 原句：He tried to unify the various groups.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · unlock (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11537-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'unlock', JSON_ARRAY('unlock', 'unlocks', 'unlocked', 'unlocking'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11537-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11537-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'What does this key ____?',
       JSON_ARRAY(),
       'unlock',
       'vt. 开...的锁, 开启, 表露, 放出 vi. 被开启, 揭开, 解放 [计] 解出锁定 ｜ 原句：What does this key unlock?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · unprecedented (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11540-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'unprecedented', JSON_ARRAY('unprecedented'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11540-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11540-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Such a move is rare, but not ____.',
       JSON_ARRAY(),
       'unprecedented',
       'a. 空前的 [经] 空前的, 无前例的 ｜ 原句：Such a move is rare, but not unprecedented.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · unreasonable (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11541-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'unreasonable', JSON_ARRAY('unreasonable'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11541-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11541-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He''s not an ____ man.',
       JSON_ARRAY(),
       'unreasonable',
       'a. 不合理的, 过度的, 不切实际的 [法] 不讲道理的, 非理智的, 不合理的 ｜ 原句：He''s not an unreasonable man.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · unreliable (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11542-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'unreliable', JSON_ARRAY('unreliable'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11542-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11542-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'They are ____.',
       JSON_ARRAY(),
       'unreliable',
       'a. 不可靠的 [法] 不可靠的, 靠不住的 ｜ 原句：They are unreliable.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · update (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11544-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'update', JSON_ARRAY('update', 'updates', 'updated', 'updating'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11544-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11544-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Could I get you to ____ this data for me?',
       JSON_ARRAY(),
       'update',
       'vt. 更新, 使现代化 n. 更新 [计] 更新 ｜ 原句：Could I get you to update this data for me?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · upgrade (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11545-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'upgrade', JSON_ARRAY('upgrade', 'upgrades'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11545-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11545-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'With this ____, one obvious impact is that users will be obliged to reset their passwords.',
       JSON_ARRAY(),
       'upgrade',
       'n. 上坡, 升级, 上升 adv. 往上 vt. 使升级, 提升, 改良品种 vi. 升级 [计] 升级 ｜ 原句：With this upgrade, one obvious impact is that users will be obliged to reset their passwords.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · uproar (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11547-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'uproar', JSON_ARRAY('uproar', 'uproars'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11547-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11547-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'On the day of my birthday, my friends made me drink and I caused quite an ____.',
       JSON_ARRAY(),
       'uproar',
       'n. 骚动, 喧嚣 ｜ 原句：On the day of my birthday, my friends made me drink and I caused quite an uproar.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · utilization (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11550-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'utilization', JSON_ARRAY('utilization', 'utilizations'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11550-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11550-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Computer has found an increasingly wide ____ in all fields.',
       JSON_ARRAY(),
       'utilization',
       'n. 利用 [医] 利用 ｜ 原句：Computer has found an increasingly wide utilization in all fields.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · validity (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11552-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'validity', JSON_ARRAY('validity'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11552-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11552-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'You shouldn''t deny the ____ of everything she did just because of a single mistake.',
       JSON_ARRAY(),
       'validity',
       'n. 有效性, 正确性 [计] 有效性 ｜ 原句：You shouldn''t deny the validity of everything she did just because of a single mistake.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · vengeance (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11558-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'vengeance', JSON_ARRAY('vengeance', 'vengeances'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11558-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11558-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'You killed my father, and today I''ll have my ____.',
       JSON_ARRAY(),
       'vengeance',
       'n. 复仇, 报仇 [法] 报仇, 复仇 ｜ 原句：You killed my father, and today I''ll have my vengeance.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · vent (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11559-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'vent', JSON_ARRAY('vent', 'vents'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11559-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11559-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I am really extremely angry, so I plan to smash things to ____ my anger.',
       JSON_ARRAY(),
       'vent',
       'n. 排气口, 出口, 通风孔, 发泄 vt. 发泄, 排出, 给...开孔 ｜ 原句：I am really extremely angry, so I plan to smash things to vent my anger.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · ventilate (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11560-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'ventilate', JSON_ARRAY('ventilate', 'ventilates', 'ventilated', 'ventilating'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11560-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11560-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '____ the room properly when stripping paint.',
       JSON_ARRAY(),
       'ventilate',
       'vt. 使空气流通, 使通风, 公开讨论, 公开 [医] 通风, 换气 ｜ 原句：Ventilate the room properly when stripping paint.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · verdict (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11563-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'verdict', JSON_ARRAY('verdict', 'verdicts'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11563-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11563-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The jury''s guilty ____ gave rise to widespread debate.',
       JSON_ARRAY(),
       'verdict',
       'n. 裁决, 判决, 判断性意见, 定论, 结论 [法] 定论, 判断, 意见 ｜ 原句：The jury''s guilty verdict gave rise to widespread debate.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · verge (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11564-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'verge', JSON_ARRAY('verge', 'verges'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11564-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11564-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The poor child was on the ____ of starvation.',
       JSON_ARRAY(),
       'verge',
       'n. 边缘, 边界, 起始点 vi. 处在边缘, 接近, 下沉, 趋向 ｜ 原句：The poor child was on the verge of starvation.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · versatile (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11565-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'versatile', JSON_ARRAY('versatile'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11565-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11565-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The programming language Java is highly ____.',
       JSON_ARRAY(),
       'versatile',
       'a. 多才多艺的, 万用的, 万向的 ｜ 原句：The programming language Java is highly versatile.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · verse (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11566-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'verse', JSON_ARRAY('verse', 'verses'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11566-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11566-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He translated the ____ into English.',
       JSON_ARRAY(),
       'verse',
       'n. 诗, 韵文, 诗句 vt. 用诗表达 vi. 作诗 ｜ 原句：He translated the verse into English.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · veto (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11568-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'veto', JSON_ARRAY('veto', 'vetos'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11568-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11568-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The President of the United States has the power to ____ and send back legislation.',
       JSON_ARRAY(),
       'veto',
       'n. 否决权 vt. 否决, 禁止 ｜ 原句：The President of the United States has the power to veto and send back legislation.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · vicinity (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11569-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'vicinity', JSON_ARRAY('vicinity'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11569-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11569-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'We live in the ____ of the school.',
       JSON_ARRAY(),
       'vicinity',
       'n. 附近, 邻近, 附近地区, 近处 [法] 附近, 邻近, 附近地区 ｜ 原句：We live in the vicinity of the school.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · vicious (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11570-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'vicious', JSON_ARRAY('vicious'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11570-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11570-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The answer leads us to a ____ circle.',
       JSON_ARRAY(),
       'vicious',
       'a. 邪恶的, 堕落的, 品性不端的, 恶毒的, 恶性的, 有错误的 [医] 缺点的, 恶的 ｜ 原句：The answer leads us to a vicious circle.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · villa (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11573-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'villa', JSON_ARRAY('villa', 'villas'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11573-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11573-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Who owns this ____?',
       JSON_ARRAY(),
       'villa',
       'n. 别墅 ｜ 原句：Who owns this villa?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · violate (CET6, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11574-1', 1, 'CET6', 3, 'FILL_BLANK',
       'IMPORT', 'violate', JSON_ARRAY('violate', 'violates', 'violated', 'violating'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11574-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11574-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I will never ____ a law again.',
       JSON_ARRAY(),
       'violate',
       'vt. 违犯, 亵渎, 违反, 侵犯, 妨碍 [经] 违犯, 违反 ｜ 原句：I will never violate a law again.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · violation (CET6, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11575-1', 1, 'CET6', 3, 'FILL_BLANK',
       'IMPORT', 'violation', JSON_ARRAY('violation', 'violations'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11575-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11575-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'human rights ____',
       JSON_ARRAY(),
       'violations',
       'n. 违反, 违背, 妨碍 [法] 违犯, 违背, 违反 ｜ 原句：human rights violations',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · violently (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11576-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'violently', JSON_ARRAY('violently'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11576-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11576-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I felt my heart beating ____.',
       JSON_ARRAY(),
       'violently',
       'adv. 猛烈地, 激烈地, 极端地 ｜ 原句：I felt my heart beating violently.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · virgin (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11577-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'virgin', JSON_ARRAY('virgin', 'virgins'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11577-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11577-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Are you still a ____?',
       JSON_ARRAY(),
       'virgin',
       'n. 处女 a. 处女的, 贞洁的, 纯洁的, 初始的, 纯的 ｜ 原句：Are you still a virgin?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · visa (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11578-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'visa', JSON_ARRAY('visa', 'visas'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11578-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11578-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'If you want to study in the United States, you need to get a student ____.',
       JSON_ARRAY(),
       'visa',
       'n. 签证 vt. 签发 ｜ 原句：If you want to study in the United States, you need to get a student visa.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · visualize (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11580-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'visualize', JSON_ARRAY('visualize', 'visualizes', 'visualized', 'visualizing', 'visualises', 'visualised', 'visualising'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11580-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11580-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I tried to ____ the house while he was describing it.',
       JSON_ARRAY(),
       'visualize',
       'vt. 使看得见, 使具体化, 想象, 设想 vi. 想象, 显形 ｜ 原句：I tried to visualize the house while he was describing it.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · vocal (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11583-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'vocal', JSON_ARRAY('vocal'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11583-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11583-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Public feeling against air pollution has at last become ____.',
       JSON_ARRAY(),
       'vocal',
       'a. 嗓音的, 声音的, 有声的, 歌唱的 n. 元音, 声乐作品 ｜ 原句：Public feeling against air pollution has at last become vocal.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · vocation (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11584-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'vocation', JSON_ARRAY('vocation', 'vocations'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11584-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11584-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The "family manager" is a profession, occupation, ____.',
       JSON_ARRAY(),
       'vocation',
       'n. 职业, 天命, 天职, 才能, 行业 [法] 行业, 职业, 职业上的才能 ｜ 原句：The "family manager" is a profession, occupation, vocation.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · vocational (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11585-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'vocational', JSON_ARRAY('vocational'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11585-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11585-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Do you enjoy your ____ field?',
       JSON_ARRAY(),
       'vocational',
       'a. 职业的 [法] 职业上的, 天职的 ｜ 原句：Do you enjoy your vocational field?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · void (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11586-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'void', JSON_ARRAY('void', 'voids'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11586-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11586-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'This contract is null and ____.',
       JSON_ARRAY(),
       'void',
       'n. 空虚, 空间, 空白, 空隙, 空虚感 a. 空的, 无效的, 无人的, 没有的, 无用的 [计] 脱墨; 空白点 ｜ 原句：This contract is null and void.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · vulgar (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11589-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'vulgar', JSON_ARRAY('vulgar'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11589-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11589-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'She is extremely ____ in her speech.',
       JSON_ARRAY(),
       'vulgar',
       'a. 粗俗的, 庸俗的, 普通的, 通俗的, 方言的 [法] 庸俗的, 卑下的, 粗俗的 ｜ 原句：She is extremely vulgar in her speech.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · waitress (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11592-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'waitress', JSON_ARRAY('waitress', 'waitresses'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11592-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11592-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '____, I''d like to order.',
       JSON_ARRAY(),
       'waitress',
       'n. 女侍者, 女服务员 ｜ 原句：Waitress, I''d like to order.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · walnut (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11593-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'walnut', JSON_ARRAY('walnut', 'walnuts'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11593-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11593-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'He cracked the ____ with his teeth.',
       JSON_ARRAY(),
       'walnut',
       'n. 胡桃 [机] 胡桃木 ｜ 原句：He cracked the walnut with his teeth.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · warehouse (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11597-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'warehouse', JSON_ARRAY('warehouse', 'warehouses'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11597-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11597-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Who was it that forgot to lock the door of the ____?',
       JSON_ARRAY(),
       'warehouse',
       'n. 仓库, 货栈, 大商店 vt. 储入仓库 ｜ 原句：Who was it that forgot to lock the door of the warehouse?',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · warfare (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11598-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'warfare', JSON_ARRAY('warfare', 'warfares'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11598-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11598-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The art of modern ____ does not necessarily require soldiers to be armed to the teeth to be effective as combatants.',
       JSON_ARRAY(),
       'warfare',
       'n. 战争, 战斗, 交战, 斗争, 竞争 [法] 战事, 作战, 交战 ｜ 原句：The art of modern warfare does not necessarily require soldiers to be armed to the teeth to be effective as combatants.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · warrant (CET6, 难度 5)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11600-1', 1, 'CET6', 5, 'FILL_BLANK',
       'IMPORT', 'warrant', JSON_ARRAY('warrant', 'warrants'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11600-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11600-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'We have a ____ to search your apartment.',
       JSON_ARRAY(),
       'warrant',
       'n. 授权, 正当理由, 根据, 证明, 批准, 凭证, 令状, 委任状 vt. 授权给, 保证, 担保, 批准, 使有正当理由 ｜ 原句：We have a warrant to search your apartment.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · wasteful (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11602-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'wasteful', JSON_ARRAY('wasteful'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11602-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11602-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'It''s ____ to leave the land lying idle.',
       JSON_ARRAY(),
       'wasteful',
       'a. 浪费的, 不经济的 ｜ 原句：It''s wasteful to leave the land lying idle.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · web (CET6, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11609-1', 1, 'CET6', 4, 'FILL_BLANK',
       'IMPORT', 'web', JSON_ARRAY('web', 'webs'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11609-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11609-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'More than 90 percent of visits to a ____ page are from search engines.',
       JSON_ARRAY(),
       'web',
       'n. 网, 蛛丝, 蹼, 织物, 圈套, 卷筒纸 vi. 结网, 形成网 vt. 织蜘蛛网于, 使落入圈套 ｜ 原句：More than 90 percent of visits to a web page are from search engines.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · wholesome (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11614-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'wholesome', JSON_ARRAY('wholesome'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11614-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11614-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'She prepares ____ meals for her family.',
       JSON_ARRAY(),
       'wholesome',
       'a. 有益健康的, 合乎卫生的, 健全的, 有益的, 有生气的, 审慎的 ｜ 原句：She prepares wholesome meals for her family.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · winding (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11618-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'winding', JSON_ARRAY('winding', 'windings'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11618-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11618-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Chongqing is a hilly city with ____ streets.',
       JSON_ARRAY(),
       'winding',
       'n. 绕, 卷, 弯曲, 线圈 a. 蜿蜒的, 卷绕的, 弯曲的 ｜ 原句：Chongqing is a hilly city with winding streets.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · windmill (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11619-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'windmill', JSON_ARRAY('windmill', 'windmills'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11619-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11619-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I had never seen a ____ until I visited the Netherlands.',
       JSON_ARRAY(),
       'windmill',
       'n. 风车 ｜ 原句：I had never seen a windmill until I visited the Netherlands.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · windy (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11620-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'windy', JSON_ARRAY('windy', 'windier', 'windiest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11620-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11620-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'It was cold, and in addition, it was ____.',
       JSON_ARRAY(),
       'windy',
       'a. 多风的, 风强的, 腹胀的, 吹牛的 ｜ 原句：It was cold, and in addition, it was windy.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · wink (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11621-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'wink', JSON_ARRAY('wink', 'winks'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11621-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11621-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I didn''t sleep a ____ last night.',
       JSON_ARRAY(),
       'wink',
       'n. 眨眼, 使眼色, 瞬间 vi. 眨眼, 使眼色, 闪烁 vt. 眨 ｜ 原句：I didn''t sleep a wink last night.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · wither (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11622-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'wither', JSON_ARRAY('wither', 'withers'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11622-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11622-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Lettuce leaves ____ easily.',
       JSON_ARRAY(),
       'wither',
       'vt. 使凋谢, 使消亡, 使畏缩 vi. 枯萎, 衰退 ｜ 原句：Lettuce leaves wither easily.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · witty (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11624-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'witty', JSON_ARRAY('witty', 'wittier', 'wittiest'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11624-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11624-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'She''s quick on her feet, so no matter what you say to her, she''ll have a ____ comeback.',
       JSON_ARRAY(),
       'witty',
       'a. 富于机智的, 诙谐的 ｜ 原句：She''s quick on her feet, so no matter what you say to her, she''ll have a witty comeback.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · woe (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11625-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'woe', JSON_ARRAY('woe', 'woes'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11625-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11625-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       '____ to the vanquished.',
       JSON_ARRAY(),
       'woe',
       'n. 悲哀, 悲痛, 苦痛 ｜ 原句：Woe to the vanquished.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · woodpecker (CET6, 难度 7)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11626-1', 1, 'CET6', 7, 'FILL_BLANK',
       'IMPORT', 'woodpecker', JSON_ARRAY('woodpecker', 'woodpeckers'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11626-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11626-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'The ____ is pecking the tree trunk vigorously.',
       JSON_ARRAY(),
       'woodpecker',
       'n. 啄木鸟 ｜ 原句：The woodpecker is pecking the tree trunk vigorously.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · yacht (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11635-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'yacht', JSON_ARRAY('yacht', 'yachts'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11635-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11635-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Our ____ club has ten members.',
       JSON_ARRAY(),
       'yacht',
       'n. 快艇, 游艇 vi. 驾游艇, 乘游艇 ｜ 原句：Our yacht club has ten members.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · yearn (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11636-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'yearn', JSON_ARRAY('yearn', 'yearns', 'yearned', 'yearning'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11636-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11636-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'I ____ for the university.',
       JSON_ARRAY(),
       'yearn',
       'vi. 渴望, 想念, 怀念, 同情 ｜ 原句：I yearn for the university.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.21 · yeast (CET6, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-11637-1', 1, 'CET6', 6, 'FILL_BLANK',
       'IMPORT', 'yeast', JSON_ARRAY('yeast', 'yeasts'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-11637-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-11637-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Bread is made from flour, water, and often ____.',
       JSON_ARRAY(),
       'yeast',
       'n. 酵母 [化] 酵母 ｜ 原句：Bread is made from flour, water, and often yeast.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);
