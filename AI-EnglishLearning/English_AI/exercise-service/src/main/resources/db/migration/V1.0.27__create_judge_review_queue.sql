-- V1.0.27：判题审核队列（基础能力预留）
-- 目标库：exercise_db
-- 风险：低（仅新增一张表，不动既有表与数据）
-- 回滚：DROP TABLE `judge_review_queue`;
-- 说明：
--   1. 本表只做能力预留：写入接口在 /internal/judge/review，**不接入主判题链路**。
--   2. 判题引擎不会读写本表；是否入队由调用方（管理端/运营脚本）决定。
--   3. uk_question_user_answer 用于重复入队幂等（同一题同一用户的同一答案只保留一条）。

CREATE TABLE `judge_review_queue` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `question_id` bigint NOT NULL COMMENT '题目ID',
  `user_id` bigint NOT NULL COMMENT '提交用户ID',
  `user_answer` varchar(500) NOT NULL COMMENT '用户作答原文',
  `correct_answer` varchar(500) DEFAULT NULL COMMENT '参考答案',
  `matched_level` int DEFAULT NULL COMMENT '判题命中层级（见 JudgmentLevel）',
  `reason` varchar(50) NOT NULL DEFAULT 'MANUAL' COMMENT '入队原因: MANUAL/MISMATCH/AI_LOW_CONFIDENCE',
  `status` varchar(20) NOT NULL DEFAULT 'PENDING' COMMENT '状态: PENDING/REVIEWED/DISMISSED',
  `reviewer_id` bigint DEFAULT NULL COMMENT '审核人ID',
  `review_comment` varchar(500) DEFAULT NULL COMMENT '审核意见',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_question_user_answer` (`question_id`, `user_id`, `user_answer`) USING BTREE,
  KEY `idx_status_created` (`status`, `created_at`) USING BTREE,
  KEY `idx_question` (`question_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC
  COMMENT='判题审核队列（仅预留，不接入主判题链路）';
