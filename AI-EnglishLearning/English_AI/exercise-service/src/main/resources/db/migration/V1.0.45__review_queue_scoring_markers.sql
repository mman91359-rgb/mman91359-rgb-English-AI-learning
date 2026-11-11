-- V1.0.45__review_queue_scoring_markers.sql：复核补记的两半各留一个时间戳
-- 目标库：exercise_db
-- 风险：低（仅两个可空列；表当前 0 行）
-- 回滚：DROP COLUMN elo_scored_at, DROP COLUMN curve_scored_at
-- 背景：灰区提交不记 ELO / 遗忘曲线，由 resolve 在事务提交后补记。
--       两条 HTTP 相互独立，可能一成一败；单个 scored_at 无论怎么实现都会出错：
--         - 都成功才置位 → 重试会把已成功的一半再跑一遍（曲线推两级 / ELO 扣两次）
--         - 任一成功就置位 → 失败的那半永久丢失
--       因此拆成两列，重试只补缺失的一半。
--       写入协议：先 claim（UPDATE ... SET x=NOW() WHERE id=? AND x IS NULL），
--                 再发请求；请求失败则 clear（SET x=NULL）等待重试。

ALTER TABLE `judge_review_queue`
  ADD COLUMN `curve_scored_at` DATETIME DEFAULT NULL
      COMMENT '遗忘曲线补记成功时间' AFTER `review_comment`,
  ADD COLUMN `elo_scored_at` DATETIME DEFAULT NULL
      COMMENT 'ELO 补记成功时间' AFTER `curve_scored_at`;
