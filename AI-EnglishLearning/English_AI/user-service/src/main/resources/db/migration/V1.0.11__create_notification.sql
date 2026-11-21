-- V1.0.11__create_notification.sql
-- 目标库：user_db
-- 新增用户维度通知表。与已有的 sys_notice 分工不同，二者不可合并：
--   sys_notice      是广播（全局一条，无 user_id，管理员发公告，所有人看）
--   notification    是点对点（每人一条，如「连续答对 10 题」只属于该用户）
-- 文案采用「下发类型代号 + 渲染参数」，不存已渲染句子，也不存前端的 i18n key：
--   type        后端枚举，前端维护 type → i18n key 的映射表
--   params_json 渲染参数，如 {"count":10}
-- 不存 key 的理由：i18n key 是前端文案标识，存进库等于把前端文案结构固化进数据，
-- 前端改个 key 名就得写数据迁移。漏加映射时前端显示裸 type，属显性出错。
-- 风险等级：低（纯新增表，无 DROP / ALTER，不触碰已有数据）
-- 回滚方式：DROP TABLE `notification`;

CREATE TABLE `notification` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint NOT NULL COMMENT '收件人用户ID',
  `type` varchar(32) NOT NULL COMMENT '类型代号：SYSTEM/REMINDER/ACHIEVEMENT/LEVEL',
  `params_json` text COMMENT '渲染参数，JSON 对象；无参数时为 NULL',
  `is_read` tinyint NOT NULL DEFAULT 0 COMMENT '是否已读: 1=已读, 0=未读',
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除: 1=已删除, 0=正常',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_read_created` (`user_id`,`is_read`,`created_at`) USING BTREE,
  KEY `idx_user_created` (`user_id`,`created_at`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='用户维度通知';
