# CLAUDE.md

本文件是 Claude Code / AI 编程助手的项目上下文说明。修改本项目代码前，请先阅读本文件；本项目代码与文档持续演进，本文件会随之更新。

## 项目概览

- **项目名称**：Recall · English AI Learning System（面向四六级 AI 学习系统）
- **定位**：面向大学生的英语四六级（CET-4 / CET-6）智能学习平台，提供词汇/语法练习、能力测评、AI 问答、错题本、艾宾浩斯遗忘曲线驱动的每日复习。
- **仓库**：`mman91359-rgb/mman91359-rgb-English-AI-learning`（默认分支 main）
- **阶段**：分布式 Web 开发实训（第四学期）项目，开发日志持续更新（见 `AI-EnglishLearning/日志/`）。

## 仓库结构

```
mman91359-rgb-English-AI-learning/
├── AI-EnglishLearning/          # 主项目
│   ├── English_AI/              # 微服务工程（后端 6 模块 + 前端）
│   │   ├── common/              # 公共依赖模块
│   │   ├── user-service/        # 用户服务（8081）
│   │   ├── exercise-service/    # 练习服务（8082）
│   │   ├── learning-engine-service/  # 学习引擎服务（8083）
│   │   ├── ai-service/          # AI 服务（8084）
│   │   ├── api-gateway/         # Spring Cloud Gateway 网关
│   │   ├── frontend/            # Vue3 前端
│   │   ├── sql/                 # 建库脚本 + 增量脚本（02~06）
│   │   ├── pom.xml              # Maven 父工程
│   │   └── docker-compose.yml   # 生产部署编排
│   ├── kown/                    # 知识库：服务清单、数据库结构、前端设计规范
│   ├── 设计方案/                 # 项目设计文档（docx）
│   ├── 日志/                     # 逐日开发日志（docx，6.15 起）
│   ├── 前端设计/                 # 前端设计相关资源
│   └── 分布式Web开发实训（第四学期）项目文档模板 (最终版).doc  # 实训文档模板
├── 页面/                         # 静态 HTML 原型（含 黑夜版/ 子目录）
├── 参考图片/                     # UI 参考图
├── 四级核心500词.pdf / 六级500词.pdf   # 词书资源
└── CLAUDE.md                    # 本文件
```

## 技术栈

| 层 | 选型 | 版本 |
|---|---|---|
| 后端框架 | Spring Boot / Spring Cloud | 3.2.0 / 2023.0.3 |
| JDK | Java | 17 |
| ORM | MyBatis-Plus | 3.5.5 |
| JWT | jjwt | 0.12.3 |
| 消息队列 | RabbitMQ（spring-boot-starter-amqp） | Spring Boot 管理 |
| 数据库 | MySQL | 8.0 |
| 前端框架 | Vue 3（Composition API + `<script setup>`） | ^3.5 |
| 构建 | Vite + TypeScript | ^8 / ~6.0 |
| 状态管理 | Pinia | ^3.0 |
| UI | Tailwind CSS | ^3.4 |
| 图表 | ECharts | ^6.1 |
| HTTP | Axios | ^1.7 |
| 国际化 | vue-i18n | ^10 |

## 服务清单（后端多模块）

| 模块 | 端口 | 数据库 | 职责 |
|---|---|---|---|
| api-gateway | 网关 | 无 | 统一入口、JWT 校验、限流、路由转发 |
| user-service | 8081 | user_db | 注册登录、JWT 认证、ELO 定级测试、能力雷达图 |
| exercise-service | 8082 | exercise_db | 题库管理、智能选题、自动判分、答题记录、错题本；发送 MQ 事件 |
| learning-engine-service | 8083 | learning_db | 消费 MQ、更新艾宾浩斯遗忘曲线、生成每日复习任务 |
| ai-service | 8084 | 无 | 对接阿里云百炼（DashScope，qwen-plus，兼容 OpenAI 模式），英语学习 AI 助手 |
| common | — | — | 公共依赖：统一响应、常量、工具类 |

服务间调用走 HTTP：网关按路由转发，业务服务间通过环境变量配置的服务地址（见 docker-compose.yml 中 `USER_SERVICE_URL` 等）。

## 数据库（三库隔离）

- **user_db**：`sys_user`（账户；密码 BCrypt 加密，work factor=12）、`user_ability_radar`（能力雷达，user_id 唯一，elo_score 默认 1000，四个维度分）
- **exercise_db**：`sys_knowledge_point`（知识点树，parent_id=0 为根）、`question_info`（题目元数据，轻量筛选）、`question_content`（题目正文，答题时才加载，含解析）、`knowledge_mapping`（题目-知识点多对多）、`user_exercise_log`（答题记录，含 trace_id）、`user_error_book`（错题本）
- **learning_db**：`user_memory_curve`（遗忘曲线：mastery_level 1~5、next_review_time、review_count）

**跨库关联原则**：微服务禁止跨库 JOIN，关联统一通过 `user_id` / `question_id` 在应用层实现（HTTP 调用或冗余字段）。

## 核心业务逻辑

1. **ELO 自适应选题**：读取 `user_ability_radar`（elo_score + target_level）→ `question_info` 按 `target_level` / `module_type` / `difficulty_level`（1~8）筛选，使期望得分落在 0.4~0.6，配合 `usage_count` 去重，`LIMIT 10`。
2. **事件驱动链路**：答题完成 → exercise-service 写入 `user_exercise_log` → 发 RabbitMQ 消息（含 trace_id）→ learning-engine-service 消费 → 更新 `user_memory_curve`；答错则 upsert `user_error_book`。
3. **遗忘曲线（SRS）**：答对升级 `next_review_time = T+1/3/7/15/30` 天；复习答错降级（mastery-1）。每日复习：`WHERE next_review_time <= NOW() ORDER BY next_review_time LIMIT 20`。
4. **题型约定**：`module_type`：1=词汇，2=语法；`question_type`：CHOICE / FILL_BLANK / TRANSLATION / WRITING。

## 前端结构（English_AI/frontend）

```
frontend/src/
├── api/          # request.ts（Axios 实例，token 注入、错误处理）+ user/exercise/learning/stats/ai
├── components/   # 通用组件
├── composables/  # 组合式函数
├── i18n/         # vue-i18n 国际化
├── router/       # 路由
├── stores/       # Pinia store
├── views/        # Home/Login/Register/Learning/Practice/VocabQuiz/GrammarQuiz/Vocabulary/Favorites/ErrorBook/History/Stats/Profile/Settings/Assess/AdminQuestions
└── main.ts
```

**设计风格**：Epop 现代潮流风——暗色主导、霓虹渐变点缀、毛玻璃卡片、大圆角、微动效。完整设计系统（色彩 token、字体层级、动效规范、组件清单）见 `kown/recall-frontend-prompt.md`，新增页面必须遵循该规范。

## 开发命令

后端（在 `AI-EnglishLearning/English_AI/` 下）：
- 全量编译：`mvn clean package -DskipTests`
- 单服务运行：IDEA 直接运行对应 Application，或 `mvn -pl user-service -am spring-boot:run`
- 依赖中间件：MySQL 8（三库）+ RabbitMQ

前端（`AI-EnglishLearning/English_AI/frontend/` 下）：
- 安装依赖：`npm install`
- 开发：`npm run dev`
- 构建：`npm run build`（含 type-check）

部署（`English_AI/` 下）：
- `cp .env.example .env` 填入真实密钥 → `docker compose --env-file .env up -d --build`
- 仅 frontend 对外暴露 80/443（Nginx 唯一入口），后端全走内网；MySQL 3306 默认开放供 Navicat 调试
- SSL 证书挂载宿主机 `./certs`（fullchain.pem / privkey.pem）

## 环境变量（.env）

- `MYSQL_ROOT_PASSWORD` / `MYSQL_USERNAME` / `MYSQL_PASSWORD`：MySQL 连接
- `JWT_SECRET`：JWT 签名密钥（生产要求 32 字节以上随机串）
- `DASHSCOPE_API_KEY` / `DASHSCOPE_BASE_URL` / `DASHSCOPE_MODEL`：AI 服务（阿里云百炼或硅基流动，兼容 OpenAI 模式）

## 代码与开发约定

- 数据库变更：新表/新字段以增量 SQL 脚本提交到 `English_AI/sql/`（现有 02~06 为增量脚本；基础建库在 `sql/init/` 与各库 `.sql`）
- 跨服务数据关联走应用层，禁止跨库 JOIN
- 答题链路用 `trace_id` 贯穿 MQ 消息与日志
- 密码一律 BCrypt（work factor=12）；JWT 密钥等敏感信息走环境变量，禁止硬编码
- 实训文档模板与开发日志（docx）属于项目交付文档，代码变更后按需同步
- 前端新页面/组件遵循 `kown/recall-frontend-prompt.md` 的设计系统

## 项目文档索引

- 项目设计文档：`设计方案/Claude面向四六级AI学习系统_项目设计文档.docx`
- 数据库结构：`kown/数据库结构.txt`
- 服务清单：`kown/服务清单.txt`
- 前端设计规范：`kown/recall-frontend-prompt.md`
- 开发日志：`日志/*.docx`（6.15 起逐日记录）
- 静态原型：`页面/`（含 `黑夜版/`）
