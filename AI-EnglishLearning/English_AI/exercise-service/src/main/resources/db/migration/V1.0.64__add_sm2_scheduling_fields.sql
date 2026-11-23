-- 词汇复习 SM-2 简化版排期字段
-- 目标库：exercise_db（user_vocabulary）
-- 风险：低（仅新增三列，不改存量数据与约束）
-- 回滚：ALTER TABLE user_vocabulary DROP COLUMN repetition, DROP COLUMN ease_factor, DROP COLUMN interval_days;
ALTER TABLE user_vocabulary
    ADD COLUMN repetition    INT           NOT NULL DEFAULT 0    COMMENT '连续成功复习次数(SM-2 n)',
    ADD COLUMN ease_factor   DECIMAL(4, 2) NOT NULL DEFAULT 2.50 COMMENT '难度因子(SM-2 EF, 范围1.30~3.00)',
    ADD COLUMN interval_days INT           NOT NULL DEFAULT 0    COMMENT '当前复习间隔天数(SM-2 I, 上限180)';
