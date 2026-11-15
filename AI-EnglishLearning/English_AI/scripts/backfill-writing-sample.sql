-- ============================================================================
-- 写作维度采样次数回填 + 首次评分畸变修正
--
-- 背景：
--   1) 写作维度的画像展示新增「至少 3 次评分才算有数据」门槛，判定依据是
--      user_module_stats 中 module_type=6 的 total_count。历史上该计数从未写入，
--      需从 exercise_db.writing_essay 聚合回填。
--   2) 旧算法 writing_score 的移动加权从 0 起步（0 + (60-0)×10% = 6.0），
--      首次评分会把真实得分率压到原来的 1/10。新算法首次评分直接落真实值，
--      但存量该列仍是畸变值，若不清掉，后续移动加权会从错误基准出发。
--
-- 幂等：重复执行结果一致（次数取 MAX，修正后值不再满足 <10 的条件）。
-- 前置：先备份 user_db.user_ability_radar / user_module_stats 数据。
-- ============================================================================

-- 1. 回填写作评分次数：total_count = 已 AI 评分的作文篇数，correct_count 恒为 0
--    分两步（先更新已有行、再插入缺失行），避免 INSERT ... SELECT 不支持行别名的语法限制
UPDATE user_db.user_module_stats s
JOIN (SELECT w.user_id, COUNT(*) AS cnt
      FROM exercise_db.writing_essay w
      WHERE w.ai_scored = 1
      GROUP BY w.user_id) t
  ON t.user_id = s.user_id AND s.module_type = 6
SET s.total_count = GREATEST(IFNULL(s.total_count, 0), t.cnt);

INSERT INTO user_db.user_module_stats (user_id, module_type, total_count, correct_count)
SELECT t.user_id, 6, t.cnt, 0
FROM (SELECT w.user_id, COUNT(*) AS cnt
      FROM exercise_db.writing_essay w
      WHERE w.ai_scored = 1
      GROUP BY w.user_id) t
WHERE NOT EXISTS (
    SELECT 1 FROM user_db.user_module_stats s
    WHERE s.user_id = t.user_id AND s.module_type = 6
);

-- 2. 修正首次评分的畸变值：
--    仅当该用户恰好 1 次评分、且库中值 <10（即被压到 1/10 量级的典型畸变）时，
--    按 x10 还原真实得分率。真实得分率本身低于 10 的极端情况不会被命中，
--    因为那需要 raw_score/满分 < 0.1，实际评分链路不会产生该区间。
UPDATE user_db.user_ability_radar r
JOIN (SELECT user_id, COUNT(*) AS cnt
      FROM exercise_db.writing_essay
      WHERE ai_scored = 1
      GROUP BY user_id) t ON t.user_id = r.user_id
SET r.writing_score = LEAST(100, r.writing_score * 10)
WHERE t.cnt = 1
  AND r.writing_score IS NOT NULL
  AND r.writing_score > 0
  AND r.writing_score < 10;

-- 3. 校验输出
SELECT r.user_id,
       r.writing_score,
       IFNULL(s.total_count, 0) AS score_times,
       CASE WHEN IFNULL(s.total_count, 0) >= 3 THEN '计入画像' ELSE '样本不足' END AS profile_state
FROM user_db.user_ability_radar r
LEFT JOIN user_db.user_module_stats s ON s.user_id = r.user_id AND s.module_type = 6
ORDER BY r.user_id;
