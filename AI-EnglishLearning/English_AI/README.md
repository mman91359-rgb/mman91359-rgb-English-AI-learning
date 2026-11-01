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

## 数据库初始化（Flyway）

三库由各业务服务独立管理，**不再手工重放历史 SQL**：

| 服务 | 数据库 | 迁移目录 |
|---|---|---|
| user-service | user_db | `user-service/src/main/resources/db/migration` |
| exercise-service | exercise_db | `exercise-service/src/main/resources/db/migration` |
| learning-engine-service | learning_db | `learning-engine-service/src/main/resources/db/migration` |

- `V1.0.0__init_*.sql` 是 2026-10-31 由本地 MySQL 8.0 实际结构生成的完整快照。
- `V1.0.1__seed_*.sql` 是幂等种子（词库/题库/听力/欢迎通知），不包含用户个人数据。
- 历史 `sql/*.sql` 仅作参考；`sql/init/00-init.sql` 已废弃，Docker 改用 `sql/flyway-init/00-create-databases.sql`。
- Flyway 配置：`validate-on-migrate=true`、`clean-disabled=true`、`out-of-order=false`、UTF-8。

### 现有库（已有表结构）

```bash
# 1. 先备份结构到 sql/backup/（已 gitignore）
scripts/backup-schema.sh

# 2. 核对表结构后，baseline 到 1.0.0（每库只需一次）
scripts/flyway.sh user-service baseline
scripts/flyway.sh exercise-service baseline
scripts/flyway.sh learning-engine-service baseline

# 3. 应用后续迁移（当前为 V1.0.1 种子）
scripts/flyway.sh user-service migrate
scripts/flyway.sh exercise-service migrate
scripts/flyway.sh learning-engine-service migrate
```

### 全新库

```bash
# 先创建三个空库（Docker 会自动创建）
mysql -uroot -p -e "CREATE DATABASE IF NOT EXISTS user_db DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
mysql -uroot -p -e "CREATE DATABASE IF NOT EXISTS exercise_db DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
mysql -uroot -p -e "CREATE DATABASE IF NOT EXISTS learning_db DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"

# 直接 migrate（会执行 V1.0.0 + V1.0.1）
scripts/flyway.sh user-service migrate
scripts/flyway.sh exercise-service migrate
scripts/flyway.sh learning-engine-service migrate
```

### 本地启动读取 .env

Spring Boot 不原生读取 `.env`；用脚本先注入环境变量：

```bash
scripts/with-env.sh mvn -pl user-service spring-boot:run
scripts/with-env.sh mvn -pl exercise-service spring-boot:run
```

> **不要混用启动方式**：`user-service` 签发 JWT，`api-gateway` 校验 JWT，两者必须加载同一个 `.env` 的 `JWT_SECRET`。如果 user-service 用 IDEA/普通 `mvn` 启动、gateway 用脚本启动，登录接口会成功，但随后的 `/user/info`、`/user/preference`、`/exercise/stats` 等接口会 401，前端会立即清登录态并跳回 `/login`。本地开发请统一使用 `scripts/with-env.sh`。

### Docker

```bash
cp .env.example .env   # 填入真实密钥
docker compose --env-file .env up -d --build
```

仅 frontend 对外暴露 80/443；MySQL 3306 默认开放供 Navicat 调试。首次启动只执行 `sql/flyway-init/00-create-databases.sql` 建三个空库，表结构由各服务启动时的 Flyway 迁移完成。

## 环境变量

| 变量 | 说明 |
|---|---|
| `MYSQL_ROOT_PASSWORD` / `MYSQL_USERNAME` / `MYSQL_PASSWORD` | MySQL 连接 |
| `JWT_SECRET` | JWT 签名密钥（生产要求 32 字节以上随机串） |
| `DASHSCOPE_API_KEY` / `DASHSCOPE_BASE_URL` / `DASHSCOPE_MODEL` | AI 服务；无 Key 自动 Mock |
| `INTERNAL_TOKEN` | 服务间 `/internal/**` 调用令牌；网关也用它注入 `X-Gateway-Token` |
| `ADMIN_BOOTSTRAP_USERNAME` | 管理员引导用户名，默认 `admin` |
| `ADMIN_BOOTSTRAP_PASSWORD` | 管理员引导密码；为空则跳过创建；至少 12 位且不能等于用户名 |

生产必须设置 `SPRING_PROFILES_ACTIVE=prod`，否则启动校验不会触发。

## 管理员端

- API 基座：`/admin/**`；用户/通知/活动/看板/日志走 user-service，题目审核/学习统计走 exercise-service。
- 鉴权：JWT 必须含 `ROLE_ADMIN`；网关注入 `X-Gateway-Token`，下游 `/admin/**` 强校验。管理员 Token 默认 2 小时。
- 首次启用：设置 `ADMIN_BOOTSTRAP_PASSWORD`（≥12 位）后启动 user-service，`AdminBootstrapRunner` 在系统没有启用管理员时创建账号；不会重置已有管理员密码。
- 设计契约：`docs/管理员端UI设计契约.md`；接口契约：`docs/管理员端API契约.md`。
- 普通用户访问 `/admin/**` 会被网关直接拒绝；生产环境不要暴露 8081/8082 端口。

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
