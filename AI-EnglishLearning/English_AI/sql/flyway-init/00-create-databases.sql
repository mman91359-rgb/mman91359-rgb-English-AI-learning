-- ============================================================
-- 00-create-databases.sql
-- 用途：Docker MySQL 首次启动只创建三个空库；
--       表结构由各业务服务的 Flyway 迁移负责，避免两套建表冲突。
-- 说明：原 sql/init/00-init.sql 保留为历史参考，不再挂载到容器。
-- ============================================================

CREATE DATABASE IF NOT EXISTS user_db
    DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE IF NOT EXISTS exercise_db
    DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE IF NOT EXISTS learning_db
    DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
