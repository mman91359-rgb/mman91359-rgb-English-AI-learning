-- =============================================================
-- 个人能力画像改造：移除答错扣分，改为「模块正确率 + 累计练习积分」
--
-- 目标库：user_db
-- 风险等级：中（新增列带默认值 + 新建两张空表，不改动既有列语义）
--   1. user_ability_radar 新增 practice_points，默认 0，存量行安全
--   2. 六维分数列含义由「移动加权分」变为「模块累计正确率」，
--      存量数值通过 V1.0.6 之后的回填脚本重算，本迁移不删除任何数据
-- 回滚方式（MySQL 不支持 DDL 事务，需手工执行）：
--   DROP TABLE IF EXISTS `user_practice_settlement`;
--   DROP TABLE IF EXISTS `user_module_stats`;
--   ALTER TABLE `user_ability_radar` DROP COLUMN `practice_points`;
-- =============================================================

ALTER TABLE `user_ability_radar`
  ADD COLUMN `practice_points` INT NOT NULL DEFAULT '0' COMMENT '累计练习积分（只增不减）' AFTER `target_level`;

-- 用户各模块答题统计：正确率的唯一事实来源，答题时增量累加
CREATE TABLE `user_module_stats` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `module_type` tinyint NOT NULL COMMENT '模块类型: 1词汇 2语法 3翻译 4听力 5造句 6写作 7阅读',
  `total_count` int NOT NULL DEFAULT '0' COMMENT '累计作答总题数',
  `correct_count` int NOT NULL DEFAULT '0' COMMENT '累计答对题数',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_user_module` (`user_id`,`module_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户模块答题统计（正确率口径）';

-- 练习组结算记录：既是幂等键，也是每日积分上限的统计依据
CREATE TABLE `user_practice_settlement` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `batch_key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '练习组唯一键（幂等）',
  `module_type` tinyint NOT NULL COMMENT '模块类型: 1词汇 2语法 3翻译 4听力 5造句 6写作 7阅读',
  `total_count` int NOT NULL DEFAULT '0' COMMENT '本组总题数',
  `correct_count` int NOT NULL DEFAULT '0' COMMENT '本组答对题数',
  `accuracy` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT '本组正确率(0~100)',
  `points` int NOT NULL DEFAULT '0' COMMENT '本次实发积分（已扣每日上限）',
  `stat_date` date NOT NULL COMMENT '结算日期（Asia/Shanghai）',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_user_batch` (`user_id`,`batch_key`) USING BTREE,
  KEY `idx_user_date` (`user_id`,`stat_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='练习积分结算记录';
