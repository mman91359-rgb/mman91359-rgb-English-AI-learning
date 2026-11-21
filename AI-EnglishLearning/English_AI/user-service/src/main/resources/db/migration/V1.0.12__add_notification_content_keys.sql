-- V1.0.12__add_notification_content_keys.sql
-- 目标库：user_db
-- 背景：V1.0.11 建 notification 表时只留了 type + params_json，把 i18n key 交给前端自己映射。
-- 需求文档 §7.3 定稿改为「type + title_key + content_key + params_json」四字段，理由：
--   前端 useNotifications.ts 存的本来就是 titleKey / contentKey，TopAppBar 按 $t 渲染，
--   i18n 里 notification.achievementTitle / notification.achievementContent 条目已存在。
--   后端直接下发 key 可零改动复用；漏加映射时显示原始 key，属显性失败，好排查。
-- 已应用的 V1.0.11 不回头修改（改动会让 flyway validate 报校验失败），按规范用增量迁移补字段。
-- 风险等级：低（仅新增两个可空列，不触碰已有数据、不重建表）
-- 回滚方式：ALTER TABLE `notification` DROP COLUMN `title_key`, DROP COLUMN `content_key`;

ALTER TABLE `notification`
  ADD COLUMN `title_key` varchar(64) DEFAULT NULL COMMENT '标题 i18n key，如 notification.achievementTitle；为空时前端按 type 兜底' AFTER `type`,
  ADD COLUMN `content_key` varchar(64) DEFAULT NULL COMMENT '正文 i18n key；为空时前端按 type 兜底' AFTER `title_key`;
