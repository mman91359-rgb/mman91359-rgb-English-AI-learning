-- V1.0.43__review_queue_bind_log.sql：审核队列绑定单次作答，并修正陈旧注释
-- 目标库：exercise_db
-- 风险：低（3 个可空列 + 2 处注释；表内当前无业务数据）
-- 回滚：DROP COLUMN log_id / difficulty_level / module_type，并把 reason 与表注释改回原值
-- 背景：
--   1. 原实现按「该用户该题最近一条 user_exercise_log」改判，用户重做后会把正确记录改成错；
--      改为在入队时写入 log_id，复核精确到那一次作答。
--   2. 灰区提交不再记 ELO / 遗忘曲线，复核后按队列里的 difficulty_level / module_type 补记一次。

ALTER TABLE `judge_review_queue`
  ADD COLUMN `log_id` BIGINT DEFAULT NULL
      COMMENT 'user_exercise_log.id：精确绑定本次作答' AFTER `user_id`,
  ADD COLUMN `difficulty_level` INT DEFAULT NULL
      COMMENT '题目难度：复核后补记 ELO 用' AFTER `log_id`,
  ADD COLUMN `module_type` INT DEFAULT NULL
      COMMENT '模块类型：复核后补记遗忘曲线用' AFTER `difficulty_level`,
  MODIFY COLUMN `reason` VARCHAR(50) NOT NULL DEFAULT 'MANUAL'
      COMMENT '入队原因: MANUAL/MISMATCH/AI_LOW_CONFIDENCE/TRANSLATION_LOW_SCORE',
  COMMENT='判题审核队列：段落翻译灰区由判题引擎入队，人工复核后回写';
