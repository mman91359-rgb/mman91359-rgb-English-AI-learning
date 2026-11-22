-- V1.0.62__refine_user_favorite.sql
-- 目标库：exercise_db
-- 收藏页（词汇/语法 的习题与句子）数据治理：补模块类型、去重、加唯一键兜底。
-- 现状缺陷：user_favorite 无唯一键，重复收藏会产生脏数据；无 module_type，收藏页无法区分模块；
-- source_type 只存 EXERCISE/SENTENCE，与前端模块枚举对不上。
-- 本次：清理历史"纯句子"行（question_id 为空，模块无法考证，已获用户确认）；按 (user_id, question_id)
-- 去重；新增 module_type / content_hash；加两条唯一键。
-- 风险等级：中（含不可逆数据删除；加唯一键前必须完成清重，否则失败）
-- 回滚方式：
--   结构：ALTER TABLE user_favorite DROP INDEX uk_user_question, DROP INDEX uk_user_hash,
--          DROP INDEX idx_user_module, DROP COLUMN content_hash, DROP COLUMN module_type;
--   数据：第 1、2 步删除不可回，执行前必须单独导出 user_favorite 数据备份。

-- 第 1 步：清理历史"纯句子"行（question_id 为空，module_type 无法考证）
DELETE FROM `user_favorite` WHERE `question_id` IS NULL;

-- 第 2 步：按 (user_id, question_id) 去重，保留每组最小 id
DELETE f FROM `user_favorite` f
INNER JOIN `user_favorite` k
  ON k.`user_id` = f.`user_id`
 AND k.`question_id` = f.`question_id`
 AND k.`id` < f.`id`;

-- 第 3 步：新增列
ALTER TABLE `user_favorite`
  ADD COLUMN `module_type` TINYINT NOT NULL DEFAULT 0 COMMENT '模块类型 1词汇2语法3翻译4听力5造句6写作7阅读' AFTER `source_type`,
  ADD COLUMN `content_hash` CHAR(64) NULL COMMENT '句子内容哈希(纯句子去重用)，习题行为NULL' AFTER `module_type`;

-- 第 4 步：回填 module_type（习题行由 question_id 派生；悬空题号保持 0）
UPDATE `user_favorite` f
INNER JOIN `question_info` q ON q.`id` = f.`question_id` AND q.`is_deleted` = 0
SET f.`module_type` = q.`module_type`;

-- 第 5 步：加唯一键与索引
ALTER TABLE `user_favorite`
  ADD UNIQUE KEY `uk_user_question` (`user_id`, `question_id`),
  ADD UNIQUE KEY `uk_user_hash` (`user_id`, `content_hash`),
  ADD KEY `idx_user_module` (`user_id`, `module_type`, `created_at`);
