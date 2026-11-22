-- V1.0.13：用户偏好新增备考目标（考试日期 + 目标分）
-- 目标库：user_db
-- 风险：低（纯 DDL；两条可空列，不改存量数据、不加索引、无 DML）
-- 版本号说明：1.0.10~1.0.12 已被短信验证码/通知功能占用并应用，故取 1.0.13。
-- 回滚：
--   ALTER TABLE `user_preference` DROP COLUMN `exam_date`, DROP COLUMN `target_score`;
-- 说明：
--   1. exam_date 存 yyyy-MM-dd 纯日期串（MySQL DATE），NULL 表示用户未设置。
--      倒计时由前端按 Asia/Shanghai 当日零点计算，后端不存时间戳。
--   2. target_score 取值 425~710（CET 满分 710、425 为通过线），范围校验放 Service 层，
--      DB 不加 CHECK 约束以与既有偏好字段的校验分层保持一致。
--   3. 两列均可空，存量行读取到 NULL → 前端顶栏显示「设置目标」引导态，不改变现有行为。
--   4. CET 等级复用 sys_user.cet_level，不在本表冗余存储，避免两个真相源。

ALTER TABLE `user_preference`
  ADD COLUMN `exam_date` DATE NULL
    COMMENT '考试日期(yyyy-MM-dd)，NULL 表示未设置'
    AFTER `include_favorite_words`,
  ADD COLUMN `target_score` INT NULL
    COMMENT '目标分(425~710)，NULL 表示未设置'
    AFTER `exam_date`;
