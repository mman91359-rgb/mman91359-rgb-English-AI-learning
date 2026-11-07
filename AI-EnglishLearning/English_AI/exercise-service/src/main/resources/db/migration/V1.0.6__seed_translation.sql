-- V1.0.6__seed_translation.sql
-- 目标库: exercise_db
-- 幂等种子：翻译题（module_type=3, question_type=TRANSLATION）
-- 题型两种：短句翻译（short）+ 完整四六级翻译真题（passage）
-- external_key 前缀：translation-{level}-{short|passage}-NN
-- 执行前必须按 docs/数据库迁移规范.md 预览、备份、审批。

START TRANSACTION;

-- ================= 短句翻译（CET4） =================

-- 短句 01
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `created_at`, `updated_at`)
SELECT 'translation-cet4-short-01', 3, 'CET4', 3, 'TRANSLATION', 'MANUAL',
       JSON_ARRAY('The company is world-renowned for its high-quality products.', 'The company is known around the world for its quality products.'),
       0, 0, 0, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'translation-cet4-short-01');
SET @t01 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'translation-cet4-short-01' LIMIT 1);
INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @t01, '这家公司以高质量的产品闻名于世。', NULL,
       'The company is famous worldwide for its high-quality products.',
       '参考译文。"闻名于世"可译 be famous worldwide / be world-renowned；"高质量产品"译为 high-quality products。',
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @t01);

-- 短句 02
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `created_at`, `updated_at`)
SELECT 'translation-cet4-short-02', 3, 'CET4', 3, 'TRANSLATION', 'MANUAL',
       JSON_ARRAY('It is important to strike a balance between work and rest.'),
       0, 0, 0, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'translation-cet4-short-02');
SET @t02 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'translation-cet4-short-02' LIMIT 1);
INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @t02, '在工作和休息之间保持平衡很重要。', NULL,
       'It is important to keep a balance between work and rest.',
       '参考译文。"保持平衡"可译 keep a balance / strike a balance；"在……之间"译为 between ... and ...。',
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @t02);

-- 短句 03
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `created_at`, `updated_at`)
SELECT 'translation-cet4-short-03', 3, 'CET4', 4, 'TRANSLATION', 'MANUAL',
       JSON_ARRAY('Reading widely plays an important role in improving writing skills.'),
       0, 0, 0, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'translation-cet4-short-03');
SET @t03 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'translation-cet4-short-03' LIMIT 1);
INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @t03, '广泛阅读对提高写作能力起着重要作用。', NULL,
       'Extensive reading plays an important role in improving writing ability.',
       '参考译文。"广泛阅读"译 extensive reading / reading widely；"起着重要作用"译 play an important role in。',
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @t03);

-- 短句 04（CET6）
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `created_at`, `updated_at`)
SELECT 'translation-cet6-short-04', 3, 'CET6', 5, 'TRANSLATION', 'MANUAL',
       JSON_ARRAY('A growing number of people have come to realize the importance of lifelong learning.'),
       0, 0, 0, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'translation-cet6-short-04');
SET @t04 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'translation-cet6-short-04' LIMIT 1);
INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @t04, '越来越多的人已经意识到终身学习的重要性。', NULL,
       'More and more people have realized the importance of lifelong learning.',
       '参考译文。"越来越多"译 more and more / a growing number of；"意识到"译 realize / become aware of；"终身学习"译 lifelong learning。',
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @t04);

-- 短句 05（CET6）
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `created_at`, `updated_at`)
SELECT 'translation-cet6-short-05', 3, 'CET6', 5, 'TRANSLATION', 'MANUAL',
       JSON_ARRAY('The government has taken effective measures to protect the environment.'),
       0, 0, 0, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'translation-cet6-short-05');
SET @t05 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'translation-cet6-short-05' LIMIT 1);
INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @t05, '政府已经采取了有效措施来保护环境。', NULL,
       'The government has taken effective measures to protect the environment.',
       '参考译文。"采取有效措施"译 take effective measures；"保护环境"译 protect the environment。',
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @t05);

-- 短句 06（CET6）
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `created_at`, `updated_at`)
SELECT 'translation-cet6-short-06', 3, 'CET6', 5, 'TRANSLATION', 'MANUAL',
       JSON_ARRAY('With the rapid development of the economy, the living standards of people have been greatly improved.'),
       0, 0, 0, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'translation-cet6-short-06');
SET @t06 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'translation-cet6-short-06' LIMIT 1);
INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @t06, '随着经济的快速发展，人们的生活水平得到了极大的提高。', NULL,
       'With the rapid development of the economy, people''s living standards have been greatly improved.',
       '参考译文。"随着……的发展"译 with the development of；"生活水平"译 living standards；"极大提高"译 greatly improved。',
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @t06);

-- ================= 完整四六级翻译真题（段落级） =================

-- 段落 01（CET4·中国结）
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `created_at`, `updated_at`)
SELECT 'translation-cet4-passage-01', 3, 'CET4', 5, 'TRANSLATION', 'MANUAL', NULL, 0, 0, 0, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'translation-cet4-passage-01');
SET @t07 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'translation-cet4-passage-01' LIMIT 1);
INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @t07,
  '中国结(the Chinese knot)最初是由手工艺人发明的，经过数百年不断的改进，已经成为一种优雅多彩的艺术和工艺。在古代，人们用它来记录事件，但现在主要用于装饰的目的。"结"在中文里意味着爱情、婚姻和团聚，中国结常常作为礼物交换或作为饰品祈求好运和辟邪。这种形式的手工艺代代相传，现在已经在中国和世界各地越来越受欢迎。',
  NULL,
  'The Chinese knot, originally invented by craftsmen, has become an elegant and colorful art and craft after hundreds of years of continuous improvement. In ancient times, people used it to record events, but now it is mainly used for decorative purposes. "Knot" means love, marriage and reunion in Chinese, and the Chinese knot is often exchanged as a gift or used as an ornament to pray for good luck and ward off evil spirits. This form of handicraft has been passed down from generation to generation and is now becoming increasingly popular in China and around the world.',
  '四六级翻译真题（中国传统文化类）。段落翻译判题仅做本地归一化精确比对，不走 AI 语义兜底。',
  NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @t07);

-- 段落 02（CET4·茶文化）
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `created_at`, `updated_at`)
SELECT 'translation-cet4-passage-02', 3, 'CET4', 5, 'TRANSLATION', 'MANUAL', NULL, 0, 0, 0, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'translation-cet4-passage-02');
SET @t08 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'translation-cet4-passage-02' LIMIT 1);
INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @t08,
  '茶是世界上最流行的饮料(beverage)之一。中国是茶的故乡，饮茶在中国已有四千多年的历史。人们普遍认为，喝茶有益于健康，而且能提神醒脑。中国人喜欢用茶来招待客人，茶也常常作为礼物赠送给亲朋好友。如今，茶已经成为中国文化的一个重要组成部分。',
  NULL,
  'Tea is one of the most popular beverages in the world. China is the hometown of tea, and drinking tea has a history of more than four thousand years in China. It is widely believed that drinking tea is good for health and can refresh the mind. Chinese people like to serve tea to entertain guests, and tea is often given as a gift to relatives and friends. Nowadays, tea has become an important part of Chinese culture.',
  '四六级翻译真题（传统文化类）。段落翻译判题仅做本地归一化精确比对。',
  NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @t08);

-- 段落 03（CET6·中国书法）
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `created_at`, `updated_at`)
SELECT 'translation-cet6-passage-03', 3, 'CET6', 6, 'TRANSLATION', 'MANUAL', NULL, 0, 0, 0, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'translation-cet6-passage-03');
SET @t09 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'translation-cet6-passage-03' LIMIT 1);
INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @t09,
  '中国书法(calligraphy)是一门独特的艺术，是世界上独一无二的瑰宝。中国书法艺术的产生和发展与汉字的产生和演变密切相关。汉字在漫长的历史发展中，一方面起着交流思想、传承文化的作用，另一方面又形成了一种独特的艺术。书法能够表达书法家的思想感情和审美理想，因此书法作品不仅具有实用价值，而且具有很高的艺术价值。',
  NULL,
  'Chinese calligraphy is a unique art and a treasure unique to the world. The birth and development of the art of Chinese calligraphy are closely related to the birth and evolution of Chinese characters. In the long course of historical development, Chinese characters have, on the one hand, played a role in exchanging ideas and passing on culture and, on the other hand, developed into a unique form of art. Calligraphy can express the thoughts, feelings and aesthetic ideals of calligraphers, so calligraphy works not only have practical value but also have high artistic value.',
  '四六级翻译真题（传统文化类）。段落翻译判题仅做本地归一化精确比对。',
  NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @t09);

-- 段落 04（CET6·城市化）
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`, `source`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`, `created_at`, `updated_at`)
SELECT 'translation-cet6-passage-04', 3, 'CET6', 6, 'TRANSLATION', 'MANUAL', NULL, 0, 0, 0, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'translation-cet6-passage-04');
SET @t10 = (SELECT `id` FROM `question_info` WHERE `external_key` = 'translation-cet6-passage-04' LIMIT 1);
INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @t10,
  '近年来，中国城市化进程明显加快，越来越多的人从农村迁往城市工作和生活。城市化带来了经济的快速发展和生活水平的提高，同时也带来了一些问题，如交通拥堵、环境污染和住房紧张等。为了解决这些问题，政府采取了一系列措施，努力实现城市的可持续发展。',
  NULL,
  'In recent years, the process of urbanization in China has accelerated significantly, and more and more people have moved from rural areas to cities to work and live. Urbanization has brought rapid economic development and an improvement in living standards, but it has also brought some problems, such as traffic congestion, environmental pollution and housing shortages. In order to solve these problems, the government has taken a series of measures to strive for the sustainable development of cities.',
  '四六级翻译真题（社会发展类）。段落翻译判题仅做本地归一化精确比对。',
  NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @t10);

COMMIT;
