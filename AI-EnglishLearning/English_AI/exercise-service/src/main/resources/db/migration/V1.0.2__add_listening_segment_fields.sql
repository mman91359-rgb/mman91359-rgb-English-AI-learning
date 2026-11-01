-- V1.0.2：听力完整音频分段时间字段 + 导入唯一键
-- 目标库：exercise_db
-- 风险：中（ALTER TABLE；MySQL DDL 不可事务回滚）
-- 回滚：执行前备份结构；失败时用 sql/backup/ 恢复，或新增补偿迁移。
-- 说明：新增列先允许默认值/NULL，回填旧数据后再评估收紧约束。
-- 禁止修改已应用的 V1.0.0 / V1.0.1。

ALTER TABLE `listening_audio`
  MODIFY COLUMN `duration_seconds` INT NULL
    COMMENT '片段时长（秒）；旧数据/整段等于音频总时长',
  ADD COLUMN `audio_total_seconds` INT NULL
    COMMENT '完整音频总时长（秒）' AFTER `duration_seconds`,
  ADD COLUMN `audio_start_seconds` DECIMAL(8,2) NOT NULL DEFAULT 0.00
    COMMENT '文章段起点（秒，包含）' AFTER `audio_total_seconds`,
  ADD COLUMN `audio_end_seconds` DECIMAL(8,2) NULL
    COMMENT '文章段终点（秒，不包含）；NULL=到音频末尾' AFTER `audio_start_seconds`,
  ADD COLUMN `question_start_seconds` DECIMAL(8,2) NULL
    COMMENT '题目段起点（秒，包含）' AFTER `audio_end_seconds`,
  ADD COLUMN `question_end_seconds` DECIMAL(8,2) NULL
    COMMENT '题目段终点（秒，不包含）' AFTER `question_start_seconds`,
  ADD COLUMN `group_key` VARCHAR(64) NULL
    COMMENT '题组/音频段落标识' AFTER `question_end_seconds`,
  ADD COLUMN `listening_type` VARCHAR(32) NULL
    COMMENT '听力题型：SHORT_DIALOGUE/LONG_DIALOGUE/PASSAGE/LECTURE/NEWS/OTHER' AFTER `group_key`,
  ADD COLUMN `lrc_content` MEDIUMTEXT NULL
    COMMENT '片段LRC字幕（完整音频绝对时间轴）' AFTER `listening_type`,
  ADD KEY `idx_listening_type` (`listening_type`),
  ADD KEY `idx_group_key` (`group_key`),
  ADD KEY `idx_group_question` (`group_key`, `question_start_seconds`),
  ADD KEY `idx_audio_url` (`audio_url`);

ALTER TABLE `question_info`
  ADD COLUMN `external_key` VARCHAR(120) NULL
    COMMENT '外部导入唯一键，如 cet6-2022-12-1-q01' AFTER `source`,
  ADD UNIQUE KEY `uk_external_key` (`external_key`);

UPDATE `listening_audio`
SET `audio_total_seconds` = COALESCE(`audio_total_seconds`, `duration_seconds`),
    `audio_start_seconds` = COALESCE(`audio_start_seconds`, 0),
    `audio_end_seconds` = COALESCE(`audio_end_seconds`, `duration_seconds`),
    `question_start_seconds` = COALESCE(`question_start_seconds`, 0),
    `question_end_seconds` = COALESCE(`question_end_seconds`, `duration_seconds`),
    `group_key` = COALESCE(`group_key`, CONCAT('legacy-', `question_id`)),
    `listening_type` = COALESCE(`listening_type`,
      CASE
        WHEN `audio_url` LIKE '%listening-cet4-01%' OR `audio_url` LIKE '%listening-cet4-02%' THEN 'SHORT_DIALOGUE'
        WHEN `audio_url` LIKE '%listening-cet6-01%' THEN 'LECTURE'
        WHEN `audio_url` LIKE '%listening-cet6-02%' THEN 'PASSAGE'
        ELSE 'OTHER'
      END)
WHERE `audio_total_seconds` IS NULL
   OR `audio_end_seconds` IS NULL
   OR `group_key` IS NULL
   OR `listening_type` IS NULL;
