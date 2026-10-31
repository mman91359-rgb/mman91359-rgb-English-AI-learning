-- Flyway V1.0.1 — user_db 欢迎通知种子
-- 幂等：已存在同标题通知时跳过。

INSERT INTO `sys_notice`
    (`title`, `content`, `notice_type`, `target_audience`, `status`, `publish_at`, `created_by`)
SELECT
    '欢迎使用 Recall 睿考',
    '欢迎来到 Recall 睿考，开始你的四六级学习之旅。',
    'SYSTEM', 'ALL', 'PUBLISHED', NOW(), NULL
FROM DUAL
WHERE NOT EXISTS (
    SELECT 1 FROM `sys_notice` WHERE `title` = '欢迎使用 Recall 睿考'
);
