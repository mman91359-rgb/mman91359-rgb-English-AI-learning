-- ============================================================
-- 10-listening-module.sql
-- 功能描述：听力模块音频元数据表 + 4 道种子题
-- 目标库：exercise_db
-- 创建时间：2026-10-31
-- 说明：题目复用 question_info / question_content（module_type=4, question_type=CHOICE），
--       本脚本只新增 listening_audio，不修改 02~09 已发布脚本。
-- 幂等：可连续执行多次，题目/内容/音频均不会重复插入。
-- 音频文件需放在 frontend/public/audio/，文件名与 audio_url 一致。
-- ============================================================

USE exercise_db;

-- 听力音频元数据（一题一音频）
CREATE TABLE IF NOT EXISTS `listening_audio` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '音频ID',
    `question_id` BIGINT NOT NULL COMMENT '关联 question_info.id',
    `audio_url` VARCHAR(255) NOT NULL COMMENT '音频地址，如 /audio/listening-cet4-01.mp3',
    `transcript` TEXT NULL COMMENT '听力原文',
    `duration_seconds` INT NULL COMMENT '音频时长（秒）',
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_question_id` (`question_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci
  COMMENT = '听力音频元数据表';

-- ============================================================
-- 种子数据：以题干为自然键，避免硬编码 question_info.id 冲突
-- ============================================================

START TRANSACTION;

-- 1. CET4 难度 3：问路
SET @stem = 'What is the man looking for?';
SET @qid = (
    SELECT qi.id
    FROM question_info qi
    JOIN question_content qc ON qc.question_id = qi.id
    WHERE qi.module_type = 4
      AND qi.question_type = 'CHOICE'
      AND BINARY qc.stem = BINARY @stem
    LIMIT 1
);
INSERT INTO question_info
    (module_type, target_level, difficulty_level, question_type,
     knowledge_point_id, source, ai_generated, usage_count, is_deleted)
SELECT 4, 'CET4', 3, 'CHOICE', NULL, 'MANUAL', 0, 0, 0
FROM DUAL
WHERE @qid IS NULL;
SET @qid = IF(@qid IS NULL, LAST_INSERT_ID(), @qid);
INSERT INTO question_content
    (question_id, stem, options, correct_answer, analysis)
SELECT @qid, @stem,
       '["A. A subway station", "B. A bus stop", "C. A coffee shop", "D. A bookstore"]',
       'A. A subway station',
       '对话中男士询问最近的地铁站在哪里，因此他正在寻找地铁站。'
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM question_content WHERE question_id = @qid);
INSERT INTO listening_audio
    (question_id, audio_url, transcript, duration_seconds)
SELECT @qid,
       '/audio/listening-cet4-01.mp3',
       'W: Excuse me, where is the nearest subway station? M: Go straight ahead and turn left at the second crossing. You will see it next to the bank.',
       38
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM listening_audio WHERE question_id = @qid);

-- 2. CET4 难度 4：迟到原因
SET @stem = 'Why did the woman miss the meeting?';
SET @qid = (
    SELECT qi.id
    FROM question_info qi
    JOIN question_content qc ON qc.question_id = qi.id
    WHERE qi.module_type = 4
      AND qi.question_type = 'CHOICE'
      AND BINARY qc.stem = BINARY @stem
    LIMIT 1
);
INSERT INTO question_info
    (module_type, target_level, difficulty_level, question_type,
     knowledge_point_id, source, ai_generated, usage_count, is_deleted)
SELECT 4, 'CET4', 4, 'CHOICE', NULL, 'MANUAL', 0, 0, 0
FROM DUAL
WHERE @qid IS NULL;
SET @qid = IF(@qid IS NULL, LAST_INSERT_ID(), @qid);
INSERT INTO question_content
    (question_id, stem, options, correct_answer, analysis)
SELECT @qid, @stem,
       '["A. She was ill.", "B. She forgot the time.", "C. Her train was delayed.", "D. She had a family emergency."]',
       'C. Her train was delayed.',
       '女士提到列车因大雪晚点近一个小时，所以她错过了会议。'
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM question_content WHERE question_id = @qid);
INSERT INTO listening_audio
    (question_id, audio_url, transcript, duration_seconds)
SELECT @qid,
       '/audio/listening-cet4-02.mp3',
       'M: Why were you not at the meeting this morning? W: My train was delayed for almost an hour because of the heavy snow.',
       42
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM listening_audio WHERE question_id = @qid);

-- 3. CET6 难度 6：线上学习
SET @stem = 'What does the speaker suggest about online learning?';
SET @qid = (
    SELECT qi.id
    FROM question_info qi
    JOIN question_content qc ON qc.question_id = qi.id
    WHERE qi.module_type = 4
      AND qi.question_type = 'CHOICE'
      AND BINARY qc.stem = BINARY @stem
    LIMIT 1
);
INSERT INTO question_info
    (module_type, target_level, difficulty_level, question_type,
     knowledge_point_id, source, ai_generated, usage_count, is_deleted)
SELECT 4, 'CET6', 6, 'CHOICE', NULL, 'MANUAL', 0, 0, 0
FROM DUAL
WHERE @qid IS NULL;
SET @qid = IF(@qid IS NULL, LAST_INSERT_ID(), @qid);
INSERT INTO question_content
    (question_id, stem, options, correct_answer, analysis)
SELECT @qid, @stem,
       '["A. It should replace traditional classrooms.", "B. It works best when combined with face-to-face teaching.", "C. It is unsuitable for college students.", "D. It requires less self-discipline."]',
       'B. It works best when combined with face-to-face teaching.',
       '讲话者认为线上学习提供灵活性，但与线下教学结合时效果最好。'
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM question_content WHERE question_id = @qid);
INSERT INTO listening_audio
    (question_id, audio_url, transcript, duration_seconds)
SELECT @qid,
       '/audio/listening-cet6-01.mp3',
       'Online learning gives students flexibility, but it works best when combined with face-to-face teaching. Students still need direct interaction with teachers and classmates.',
       55
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM listening_audio WHERE question_id = @qid);

-- 4. CET6 难度 7：蜜蜂数量下降
SET @stem = 'What is the main reason for the decline in bee populations according to the passage?';
SET @qid = (
    SELECT qi.id
    FROM question_info qi
    JOIN question_content qc ON qc.question_id = qi.id
    WHERE qi.module_type = 4
      AND qi.question_type = 'CHOICE'
      AND BINARY qc.stem = BINARY @stem
    LIMIT 1
);
INSERT INTO question_info
    (module_type, target_level, difficulty_level, question_type,
     knowledge_point_id, source, ai_generated, usage_count, is_deleted)
SELECT 4, 'CET6', 7, 'CHOICE', NULL, 'MANUAL', 0, 0, 0
FROM DUAL
WHERE @qid IS NULL;
SET @qid = IF(@qid IS NULL, LAST_INSERT_ID(), @qid);
INSERT INTO question_content
    (question_id, stem, options, correct_answer, analysis)
SELECT @qid, @stem,
       '["A. Climate change alone.", "B. The use of pesticides and loss of habitat.", "C. An increase in natural predators.", "D. A shortage of honey."]',
       'B. The use of pesticides and loss of habitat.',
       '短文指出农药的广泛使用和自然栖息地的丧失是蜜蜂数量下降的两个主要原因。'
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM question_content WHERE question_id = @qid);
INSERT INTO listening_audio
    (question_id, audio_url, transcript, duration_seconds)
SELECT @qid,
       '/audio/listening-cet6-02.mp3',
       'Scientists say bee populations are declining for two main reasons: the widespread use of pesticides and the loss of natural habitat. Both factors make it harder for bees to find food and reproduce.',
       60
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM listening_audio WHERE question_id = @qid);

COMMIT;
