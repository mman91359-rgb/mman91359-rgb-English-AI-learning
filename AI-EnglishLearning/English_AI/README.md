# Recall·睿考 —— 四六级 AI 学习系统

Spring Boot 3 多模块微服务 + Vue 3 前端。本文只记录**当前代码事实**下的启动与建库方式。

## 模块与端口

| 模块 | 端口 | 数据库 | 职责 |
|---|---|---|---|
| api-gateway | 8086 | 无 | 静态路由、JWT 校验、CORS |
| user-service | 8081 | user_db | 注册登录、ELO、能力雷达、金币/签到/偏好 |
| exercise-service | 8082 | exercise_db | 题库、智能选题、判题、错题本、单词本、听力 |
| learning-engine-service | 8083 | learning_db | 艾宾浩斯遗忘曲线、复习任务 |
| ai-service | 8084 | 无 | 阿里云百炼 DashScope（无 Key 走 Mock） |
| frontend | 5173（开发）/ 80（容器） | — | Vue 3 + Vite |

本地启动顺序：`user-service → exercise-service → learning-engine-service → ai-service → api-gateway`，最后启动前端。

## 数据库初始化

### 本地 MySQL（推荐）

唯一建库路径：**三份基线 dump + 按编号执行增量脚本**。

```bash
# 1. 建库（基线 dump 不含 CREATE DATABASE）
mysql -uroot -p -e "CREATE DATABASE IF NOT EXISTS user_db DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
mysql -uroot -p -e "CREATE DATABASE IF NOT EXISTS exercise_db DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
mysql -uroot -p -e "CREATE DATABASE IF NOT EXISTS learning_db DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"

# 2. 基线
mysql -uroot -p user_db < sql/user_db.sql
mysql -uroot -p exercise_db < sql/exercise_db.sql
mysql -uroot -p learning_db < sql/learning_db.sql

# 3. 增量（严格按编号顺序）
mysql -uroot -p < sql/02-add-favorites-vocabulary.sql
mysql -uroot -p < sql/03-add-daily-word.sql
mysql -uroot -p < sql/03-upgrade-vocabulary.sql
mysql -uroot -p < sql/03b-fix-phonetic.sql
mysql -uroot -p < sql/04-add-buggy-paths.sql
mysql -uroot -p < sql/05-add-accepted-answers.sql
mysql -uroot -p < sql/06-add-pending-questions.sql
mysql -uroot -p < sql/07-user-coin-checkin-preference.sql
mysql -uroot -p < sql/08-study-session.sql
mysql -uroot -p < sql/09-user-preference-daily-goals.sql
mysql -uroot -p < sql/10-listening-module.sql
```

- `sql/init/00-init.sql` 是 Docker 首次启动的入口脚本，会建库并按序 `SOURCE` 上述文件。
- 仓库根 `init/01-基础建表.sql` 是旧单库脚本，**已废弃，禁止执行**。

### Docker

```bash
cp .env.example .env   # 填入真实密钥
docker compose --env-file .env up -d --build
```

仅 frontend 对外暴露 80/443；MySQL 3306 默认开放供 Navicat 调试。首次启动会自动执行 `sql/init/00-init.sql`。

## 环境变量

| 变量 | 说明 |
|---|---|
| `MYSQL_ROOT_PASSWORD` / `MYSQL_USERNAME` / `MYSQL_PASSWORD` | MySQL 连接 |
| `JWT_SECRET` | JWT 签名密钥（生产要求 32 字节以上随机串） |
| `DASHSCOPE_API_KEY` / `DASHSCOPE_BASE_URL` / `DASHSCOPE_MODEL` | AI 服务；无 Key 自动 Mock |
| `INTERNAL_TOKEN` | 服务间 `/internal/**` 调用令牌 |

生产必须设置 `SPRING_PROFILES_ACTIVE=prod`，否则启动校验不会触发。

## 构建与运行

```bash
# 后端全量构建
mvn -DskipTests install

# 单服务启动（示例）
mvn -pl user-service spring-boot:run

# 测试
mvn -pl user-service,exercise-service -am test

# 前端
cd frontend
npm install
npm run dev        # 5173，代理 /api -> 8086
npm run type-check
npm run build
```

## 模块编号契约

`module_type` 负责内容归类，`question_type` 负责作答形式：

| module_type | 内容 | 默认 question_type | 雷达维度 |
|---|---|---|---|
| 1 | 词汇 | FILL_BLANK | vocabulary_score |
| 2 | 语法 | SENTENCE_MAKING | grammar_score |
| 3 | 翻译 | TRANSLATION | reading_score |
| 4 | 听力 | CHOICE | listening_score |
| 5 | 造句（保留，后续作为翻译页子模式） | SENTENCE_MAKING | grammar_score |
| 6 | 写作 | WRITING | 暂无独立维度 |

后端唯一事实来源：`common/src/main/java/com/english/ai/common/ModuleType.java`。
前端对应 `frontend/src/config/modules.ts`，修改时必须同步。

## 文档

- `docs/Recall睿考_后端项目开发文档V3.md`
- `docs/Recall睿考_前端项目开发文档V3.md`
- `docs/后续开发任务书（Backlog）.md`
- `CLAUDE.md`（项目协作约定）
