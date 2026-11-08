-- V1.0.23__fix_vocab_accepted_v2.sql：词汇题 accepted_answers 修正 + 补齐新增题（由 scripts/generate-vocab-questions.mjs --fix-sql 生成，请勿手改）
-- 目标库：exercise_db
-- 风险：低（UPDATE 只改 accepted_answers；INSERT 复用 NOT EXISTS 双幂等写法）
-- 回滚：新增题按 external_key 删除；accepted 用导入前的 sql/backup/*_exercise_db_vocab_data.sql 恢复
-- 生成时间：2026-11-08T13:47:58.970Z
-- 修正行数：34    新增题数：3    规则外存量：6

-- ---------- 规则外存量题（不自动删除，需人工决定） ----------
--   vocab-auto-10695-1
--   vocab-auto-11034-1
--   vocab-auto-7165-1
--   vocab-auto-7190-1
--   vocab-auto-7576-1
--   vocab-auto-8727-1

-- ---------- 新增题目 ----------
-- V1.0.23 · breed (CET4, 难度 6)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-6219-1', 1, 'CET4', 6, 'FILL_BLANK',
       'IMPORT', 'breed', JSON_ARRAY('breed', 'breeds', 'breeded', 'breeding'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-6219-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-6219-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'Spaniels are my favourite ____ of dog.',
       JSON_ARRAY(),
       'breed',
       'n. 种类, 品种 v. 养育, 引起, 饲养, 繁殖 ｜ 原句：Spaniels are my favourite breed of dog.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.23 · king (CET4, 难度 3)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-7668-1', 1, 'CET4', 3, 'FILL_BLANK',
       'IMPORT', 'king', JSON_ARRAY('king', 'kings', 'kinged', 'kinging'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-7668-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-7668-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'When I grow up, I want to be a ____.',
       JSON_ARRAY(),
       'king',
       'n. 国王, 君主 vt. 使...成为君主 vi. 君临, 统治 ｜ 原句：When I grow up, I want to be a king.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- V1.0.23 · swing (CET4, 难度 4)
INSERT INTO `question_info`
  (`external_key`, `module_type`, `target_level`, `difficulty_level`, `question_type`,
   `source`, `answer_word`, `accepted_answers`, `ai_generated`, `usage_count`, `is_deleted`,
   `created_at`, `updated_at`)
SELECT 'vocab-auto-9217-1', 1, 'CET4', 4, 'FILL_BLANK',
       'IMPORT', 'swing', JSON_ARRAY('swing', 'swings', 'swinged', 'swinging'), 0, 0, 0,
       NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM `question_info` WHERE `external_key` = 'vocab-auto-9217-1');

SET @qid = (SELECT `id` FROM `question_info` WHERE `external_key` = 'vocab-auto-9217-1' LIMIT 1);

INSERT INTO `question_content`
  (`question_id`, `stem`, `options`, `correct_answer`, `analysis`, `created_at`, `updated_at`)
SELECT @qid,
       'If you wind up the doll with the key on the side of its torso it will ____ its arms round and go forward doing somersaults.',
       JSON_ARRAY(),
       'swing',
       'n. 摇摆, 振幅, 音律, 节奏, 涨落, 秋千, 旋转, 行动自由 vi. 摇摆, 悬挂, 旋转, 大摇大摆地走, 转向 vt. 挥舞, 使旋转, 使转向, 悬挂, 吊运 a. 旋转的, 悬挂的, 强节奏爵士音乐的 ｜ 原句：If you wind up the doll with the key on the side of its torso it will swing its arms round and go forward doing somersaults.',
       NOW(), NOW()
WHERE @qid IS NOT NULL
  AND NOT EXISTS (SELECT 1 FROM `question_content` WHERE `question_id` = @qid);

-- ---------- 修正 accepted_answers ----------
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('abuse', 'abused', 'abuses', 'abusing') WHERE `external_key` = 'vocab-auto-5847-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('approach', 'approached', 'approaches', 'approaching') WHERE `external_key` = 'vocab-auto-6003-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('bark', 'barked', 'barking', 'barks') WHERE `external_key` = 'vocab-auto-6115-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('bore', 'bored', 'bores', 'boring') WHERE `external_key` = 'vocab-auto-6197-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('cancel', 'canceled', 'canceling', 'cancels') WHERE `external_key` = 'vocab-auto-6278-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('cause', 'caused', 'causes', 'causing') WHERE `external_key` = 'vocab-auto-6313-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('chop', 'chopped', 'chopping', 'chops') WHERE `external_key` = 'vocab-auto-6380-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('conserve', 'conserved', 'conserves', 'conserving') WHERE `external_key` = 'vocab-auto-6535-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('control', 'controlled', 'controlling', 'controls') WHERE `external_key` = 'vocab-auto-6567-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('cure', 'cured', 'cures', 'curing') WHERE `external_key` = 'vocab-auto-6647-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('decrease', 'decreased', 'decreases', 'decreasing') WHERE `external_key` = 'vocab-auto-6689-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('fetch', 'fetched', 'fetches', 'fetching') WHERE `external_key` = 'vocab-auto-7123-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('force', 'forced', 'forces', 'forcing') WHERE `external_key` = 'vocab-auto-7172-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('gather', 'gathered', 'gathering', 'gathers') WHERE `external_key` = 'vocab-auto-7244-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('highlight', 'highlighted', 'highlighting', 'highlights') WHERE `external_key` = 'vocab-auto-7415-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('melt', 'melted', 'melting', 'melts') WHERE `external_key` = 'vocab-auto-7885-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('permit', 'permits', 'permitted', 'permitting') WHERE `external_key` = 'vocab-auto-8239-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('plenty') WHERE `external_key` = 'vocab-auto-8291-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('praise', 'praised', 'praises', 'praising') WHERE `external_key` = 'vocab-auto-8354-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('quote', 'quoted', 'quotes', 'quoting') WHERE `external_key` = 'vocab-auto-8494-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('revise', 'revised', 'revises', 'revising') WHERE `external_key` = 'vocab-auto-8689-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('rust', 'rusted', 'rusting', 'rusts') WHERE `external_key` = 'vocab-auto-8752-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('shrink', 'shrinked', 'shrinking', 'shrinks') WHERE `external_key` = 'vocab-auto-8902-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('signal', 'signaled', 'signaling', 'signals') WHERE `external_key` = 'vocab-auto-8913-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('spur', 'spurred', 'spurring', 'spurs') WHERE `external_key` = 'vocab-auto-9054-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('startle', 'startled', 'startles', 'startling') WHERE `external_key` = 'vocab-auto-9074-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('tear', 'teared', 'tearing', 'tears') WHERE `external_key` = 'vocab-auto-9246-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('trifle', 'trifled', 'trifles', 'trifling') WHERE `external_key` = 'vocab-auto-9390-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('triumph', 'triumphed', 'triumphing', 'triumphs') WHERE `external_key` = 'vocab-auto-9392-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('vote', 'voted', 'votes', 'voting') WHERE `external_key` = 'vocab-auto-9568-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('wonder', 'wondered', 'wondering', 'wonders') WHERE `external_key` = 'vocab-auto-9646-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('wrap', 'wrapped', 'wrapping', 'wraps') WHERE `external_key` = 'vocab-auto-9664-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('endeavour', 'endeavoured', 'endeavouring', 'endeavours') WHERE `external_key` = 'vocab-auto-10258-1';
UPDATE `question_info` SET `accepted_answers` = JSON_ARRAY('tackle', 'tackled', 'tackles', 'tackling') WHERE `external_key` = 'vocab-auto-11425-1';

-- ---------- 停用题目（人工追加段，规则外且不可修，软删保留数据） ----------
-- 上方自动生成段只做 UPDATE / INSERT，不会删任何行；以下三条按当前规则已不出题，
-- 且库内数据本身有问题（敏感 / 同形异义），因此软删而非继续保留：
--   vocab-auto-11034-1  premature  例句含性敏感情节，已加入 CONTENT_PATTERNS
--   vocab-auto-7576-1   insult     同一例句（premature ejaculation），整句连带拦截
--   vocab-auto-8727-1   rose       同形异义：句中为 rise 的过去式，词形规则无法区分，精确屏蔽
-- 幂等：仅在 is_deleted = 0 时更新，重复执行无副作用。
UPDATE `question_info` SET `is_deleted` = 1 WHERE `external_key` = 'vocab-auto-11034-1' AND `is_deleted` = 0;
UPDATE `question_info` SET `is_deleted` = 1 WHERE `external_key` = 'vocab-auto-7576-1' AND `is_deleted` = 0;
UPDATE `question_info` SET `is_deleted` = 1 WHERE `external_key` = 'vocab-auto-8727-1' AND `is_deleted` = 0;