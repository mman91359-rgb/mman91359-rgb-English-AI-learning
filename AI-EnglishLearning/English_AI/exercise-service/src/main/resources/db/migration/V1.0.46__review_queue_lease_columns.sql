-- V1.0.46__review_queue_lease_columns.sql：补记的「完成时间」与「进行中租约」拆成两列
-- 目标库：exercise_db
-- 风险：低（仅两个可空列；表当前 0 行）
-- 回滚：DROP COLUMN elo_lease_until, DROP COLUMN curve_lease_until
-- 背景：V1.0.45 把「抢占时刻」写进 *_scored_at，成功补记后不再刷新，
--       结果 5 分钟后扫描把「已完成」误判成「过期未做」，每 10 分钟重复补记一次
--       （曲线阶梯不断推进、ELO 反复重算）。同一列无法同时表达「正在做」与「已完成」。
-- 语义：
--   *_scored_at   完成时间，非空 = 永远不再补记
--   *_lease_until 进行中租约，未到期 = 别人正在做，别抢
-- 所有时间比较一律用 DB 的 NOW()，避免 JVM 时区与 DB 时区不一致导致标记瞬间过期。

ALTER TABLE `judge_review_queue`
  ADD COLUMN `curve_lease_until` DATETIME DEFAULT NULL
      COMMENT '遗忘曲线补记租约到期时间' AFTER `curve_scored_at`,
  ADD COLUMN `elo_lease_until` DATETIME DEFAULT NULL
      COMMENT 'ELO 补记租约到期时间' AFTER `elo_scored_at`;
