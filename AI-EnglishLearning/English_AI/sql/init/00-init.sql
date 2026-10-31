-- ============================================================
-- 00-init.sql
-- 用途：MySQL 容器首次启动时自动建三库并导入基线 + 增量脚本
-- 挂载：docker-compose 将 ./sql/init 挂到 /docker-entrypoint-initdb.d，
--       将 ./sql 只读挂到 /sql，本文件通过 SOURCE /sql/... 引用脚本。
-- 说明：三份基线 dump 不含 CREATE DATABASE / USE，必须先显式建库并切换。
-- ============================================================

CREATE DATABASE IF NOT EXISTS user_db
    DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE IF NOT EXISTS exercise_db
    DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE IF NOT EXISTS learning_db
    DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 1. 三库基线
USE user_db;
SOURCE /sql/user_db.sql;

USE exercise_db;
SOURCE /sql/exercise_db.sql;

USE learning_db;
SOURCE /sql/learning_db.sql;

-- 2. 增量脚本（严格按编号顺序）
USE exercise_db;
SOURCE /sql/02-add-favorites-vocabulary.sql;
SOURCE /sql/03-add-daily-word.sql;
SOURCE /sql/03-upgrade-vocabulary.sql;
SOURCE /sql/03b-fix-phonetic.sql;
SOURCE /sql/04-add-buggy-paths.sql;
SOURCE /sql/05-add-accepted-answers.sql;
SOURCE /sql/06-add-pending-questions.sql;

USE user_db;
SOURCE /sql/07-user-coin-checkin-preference.sql;

USE exercise_db;
SOURCE /sql/08-study-session.sql;

USE user_db;
SOURCE /sql/09-user-preference-daily-goals.sql;

USE exercise_db;
SOURCE /sql/10-listening-module.sql;
