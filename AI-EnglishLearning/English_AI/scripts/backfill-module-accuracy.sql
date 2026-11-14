-- =============================================================
-- 历史答题记录回填 user_module_stats（一次性脚本，不通过 Flyway 执行）
--
-- 背景：六维分数口径由「移动加权」改为「累计正确率」后，存量数值不再可用。
--      不回填的话，老用户的六维画像会全部变成「—」，直到重新积累 5 题以上。
--
-- 前提：
--   1. V1.0.6__add_practice_points_and_module_stats.sql 已执行（user_module_stats 已存在）
--   2. user_db 与 exercise_db 在同一 MySQL 实例，执行账号有跨库读权限
--
-- 风险：低
--   - 只写 user_db.user_module_stats，不删除、不修改其他表
--   - 幂等：重复执行会把计数覆盖为同一聚合值，不会累加出错
--   - 写作(module_type=6)的日志也会进表，但写作维度走 AI 评分，不读这张表，无副作用
--
-- 回滚：
--   DELETE FROM user_db.user_module_stats;
--   （回填前该表为空，删除即回到未回填状态）
--
-- 执行方式：
--   mysql -h <host> -u <user> -p < scripts/backfill-module-accuracy.sql
-- =============================================================

INSERT INTO user_db.user_module_stats (user_id, module_type, total_count, correct_count)
SELECT l.user_id,
       l.module_type,
       COUNT(*) AS total_count,
       SUM(CASE WHEN l.is_correct = 1 THEN 1 ELSE 0 END) AS correct_count
FROM exercise_db.user_exercise_log l
WHERE l.module_type IS NOT NULL
  AND l.is_correct IS NOT NULL
GROUP BY l.user_id, l.module_type
ON DUPLICATE KEY UPDATE total_count = VALUES(total_count),
                        correct_count = VALUES(correct_count);
