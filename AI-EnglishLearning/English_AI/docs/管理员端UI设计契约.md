# Recall·睿考 管理员端 UI 设计契约（V1）

你是一名资深 B 端产品设计师 + Vue3 前端工程师。请为「Recall·睿考」四六级英语学习系统设计管理员后台。你的输出必须严格服从本契约，不得自行发明字段、页面结构或技术栈。

## 0. 项目上下文
- 学习端：Vue3 + Vite + TS + Pinia + Tailwind CSS 3.4 + Material Design 3 设计令牌 + Material Symbols Outlined。
- 实现前先阅读 `frontend/tailwind.config.js`、`frontend/src/assets/main.css`、`docs/Recall睿考_前端项目开发文档V3.md`；**以代码中的令牌为准**。
- 管理员端：独立桌面优先后台，复用同一套设计令牌与组件风格；不引入 Element Plus 或其他 UI 库。
- 后端：Spring Boot 微服务，统一返回 `{ code, message, data, traceId }`；管理 API 基座 `/admin/**`，登录后 JWT 必带 `ROLE_ADMIN`。
- 角色：`ROLE_USER` / `ROLE_ADMIN` 两级；前端隐藏无权限入口，后端强校验。
- 登录：管理员复用同一登录入口，登录成功后按角色进入 `/admin/overview`；管理员端不提供注册。
- 语言：界面文案中文；所有文案走 i18n（zh-CN / en-US），禁止硬编码。

## 1. 硬约束（违反即视为不合格）
1. 禁止使用 Element Plus 的 `el-*` 组件、图标与其他组件库；禁止新增 npm 依赖。
2. 只使用 Tailwind 语义类 + M3 设计令牌；禁止写死 hex、RGB、字体大小（如 `text-[13px]`）。
3. 图标只用 Material Symbols Outlined。
4. 技术栈：Vue3 `<script setup>` + TypeScript；组合式 API；Pinia；Vue Router。
5. API 只允许放在 `src/api/admin.ts`，禁止组件内裸写 axios/fetch。
6. 所有出入参定义 TS 类型，禁止 `any`；后端 Long 按 `number` 处理，不要自造字符串化。
7. 列表必须服务端分页；禁止前端全量拉取后假分页。
8. 所有页面必须有 loading / empty / error / 无权限四态。
9. 所有危险操作（禁用、重置密码、改角色、发布/下线、删除）必须二次确认，并说明影响范围。
10. 管理员端桌面优先，不复用学习端的底部导航；移动端只要求不破版。
11. 禁止在界面展示密码、密码哈希；手机号必须脱敏（138****0000）。
12. 禁止把 userId / 角色作为可编辑参数传给后端来“假装权限”；权限由 JWT + 后端拦截器决定。

## 2. 设计令牌（必须使用）
- 主色：`bg-primary` / `text-primary`（#67558c 系）；容器：`bg-primary-container`、`text-on-primary-container`。
- 背景：`bg-background`、`bg-surface`、`bg-surface-container-lowest/low/high`。
- 文字：`text-on-surface`、`text-on-surface-variant`、`text-outline`。
- 语义：`text-error` / `bg-error-container`（危险）、`text-tertiary` / `bg-tertiary-container`（成功/强调）。
- 边框：`border-outline-variant`；阴影：`shadow-soft-glow`（不要重投影）。
- 圆角：卡片 `rounded-[16px]`/`rounded-[24px]`；输入框 `rounded-xl`；按钮 `rounded-full` 或 `rounded-xl`。
- 字号：`text-headline-lg/md`、`text-body-lg/md`、`text-label-lg/md`；实施前必须在 `tailwind.config.js` 补齐 `body-sm`、`label-sm`、`label-xs`、`headline-sm`，页面只使用这些令牌。
- 间距：页面 `px-gutter`（24px）、卡片内 `p-4/p-6`、区块 `gap-4/gap-6`。
- 管理端专用令牌（实施前补齐）：`admin-sidebar-width: 240px`、`admin-topbar-height: 64px`、`admin-container-max: 1440px`、`admin-table-row: 56px`；禁止用任意值绕过。
- 暗色：全部颜色使用语义类，自动适配 `html.dark`；图表 tooltip/坐标轴也要适配暗色。

## 3. 管理员端布局
- 新建 `AdminLayout`：左侧固定侧栏 240px（可折叠到 72px）+ 顶部栏 64px + 内容区。
- 内容区最大宽度 1440px，左右 padding 24–32px；表格页允许更宽。
- 侧栏分组：
  - 概览：`/admin/overview`
  - 用户：`/admin/users`
  - 运营：`/admin/notices`、`/admin/activities`
  - 系统：`/admin/operation-logs`
  - 内容：`/admin/questions`
- 顶部栏：面包屑/页面标题、全局搜索（可选）、管理员头像/角色、退出。
- 不显示学习端的金币徽章、底部导航、AI 侧边栏。
- 侧栏当前项使用 `border-l-2 border-primary` 或 `bg-primary-container/20` 激活态；hover 有轻微位移/图标缩放。
- 路由守卫：`meta: { requiresAuth: true, requiresAdmin: true }`；非管理员访问 `/admin/**` 重定向 `/dashboard` 或显示 403 页。
- 侧栏“管理后台”入口只对 `userStore.user?.roles` 含 `ROLE_ADMIN` 的用户显示。

## 4. 页面清单（六个核心页 + 用户详情）
### 4.1 `/admin/overview` 概览
- KPI 卡：总用户、今日新增、今日活跃、累计答题（近 30 天）、今日答题、待审核题目。
- 图表：近 7/30 天新增用户（柱/折线）、模块答题分布（柱/饼）、正确率趋势（折线）。
- 列表：最近操作日志 Top 5、待审核题目 Top 5。
- 状态：加载骨架、空态、错误重试；学习统计不可用时顶部黄色横幅“学习统计暂不可用”，不显示红色错误页。

### 4.2 `/admin/users` 用户管理
- 筛选：关键词（用户名/昵称/手机号）、角色、状态、CET 级别、注册时间范围。
- 表格列：用户（头像+昵称+用户名）、CET、角色、状态、ELO、金币、最后登录、注册时间、操作。
- 操作：查看详情、启用/禁用、重置密码、调整角色。
- 分页：服务端分页，每页 20/50/100。
- 批量：本轮不做；不要设计批量按钮。
- 空/错/加载：标准三态；筛选无结果显示“清空筛选”。

### 4.3 `/admin/users/:id` 用户详情（抽屉或独立页）
- 基本信息卡：头像、用户名、昵称、手机号（脱敏）、CET、角色、状态、注册时间、最后登录。
- 能力卡：ELO、词汇/语法/听力/阅读分数（进度条或雷达替代列表）。
- 学习数据卡：累计答题、正确率、学习时长、活跃天数（来自 exercise-service；可能为空，显示“暂不可用”）。
- 金币卡：余额、累计获得、签到连续天数。
- 操作：启用/禁用、重置密码、调整角色；危险操作确认。
- 不展示密码；不提供删除物理用户。

### 4.4 `/admin/notices` 通知管理
- 列表：标题、类型、目标人群（全部/CET4/CET6）、状态（草稿/已发布/已过期）、发布时间、过期时间、创建人、操作。
- 筛选：状态、类型、目标人群、关键词、时间范围。
- 新建/编辑：抽屉或弹窗，字段：标题、正文（多行）、类型（系统/提醒/活动）、目标人群（全部/CET4/CET6）、发布时间、过期时间。
- 操作：保存草稿、发布、下线、删除；发布前确认目标人群与时间。
- 已发布通知不可编辑正文与目标人群；需要更正时新建通知。仅草稿可删除。
- 预览：右侧预览用户端通知卡片样式。

### 4.5 `/admin/activities` 活动管理
- 列表：标题、类型、目标人群、状态（草稿/未开始/进行中/已结束）、开始/结束时间、排序、操作。
- 新建/编辑：标题、摘要、详情、类型（横幅/内容）、目标人群（全部/CET4/CET6）、开始/结束时间、横幅图片 URL（可选）、排序。
- 操作：保存草稿、发布、结束、删除；时间校验（结束必须晚于开始）；发布后不可改目标人群/开始时间，只允许改描述、结束时间、排序。
- 仅草稿可删除；已发布活动通过“结束”下线。
- 不做金币奖励配置（本轮）。

### 4.6 `/admin/operation-logs` 操作日志
- 筛选：管理员、动作类型、目标类型、结果、时间范围、关键词。
- 表格：时间、管理员、动作、目标、结果、详情摘要、IP。
- 行点击展开详情（JSON 格式化只读）。
- 只读，不提供删除/编辑。

### 4.7 `/admin/questions` 题目审核
- 状态 Tab：待审核/已通过/已驳回。
- 筛选：模块、等级、难度、关键词。
- 表格/卡片：题干、选项、答案、解析、知识点、状态、创建时间。
- 操作：通过、驳回（必填意见）、AI 出题（知识点/等级/难度/题型/数量）。
- 状态机：只有 PENDING 可审核；重复操作提示 409。
- 现有 `AdminQuestions.vue` 的业务能力保留，但按本契约重做视觉与交互。

## 5. 组件契约（必须新建/复用）
复用：`BaseDialog`、`LoadingState`、`EmptyState`、`ErrorState`、`ToastNotification`/`useToast`。

新建：
- `AdminLayout`、`AdminSidebar`、`AdminTopbar`
- `AdminDataTable`：列配置、loading、empty、row key、sticky header、行 hover、操作列右对齐；表格行高 56px。
- `AdminPagination`：页码、上一页/下一页、每页条数、总数；与 URL query 同步。
- `AdminFilterBar`：关键词、下拉、日期范围、重置；筛选变化重置到第 1 页。
- `StatusBadge`：统一状态色板（成功/警告/危险/中性）；不要每页自己写颜色。
- `ConfirmDialog`：危险操作二次确认；展示目标名称与影响。
- `BaseDrawer`：新建/编辑通知、活动、用户详情侧滑。
- `AdminStatCard`：KPI 数字卡，支持趋势与图标。
- `AdminChartCard`：图表容器，统一标题/工具栏/空态/暗色。
- `FormField`：label、必填标记、帮助文字、错误文案。
- 可选 `BulkActionBar` 本轮不做。

## 6. 表格 / 表单 / 交互规范
- 表格：表头 sticky；列宽固定关键列；数字右对齐；时间统一 `yyyy-MM-dd HH:mm`；空值显示 `—`。
- 分页：默认 20；切换每页条数回到第 1 页；总数为 0 时隐藏分页。
- 表单：必填 `*`；提交按钮 loading；失败保留输入；取消确认未保存；日期范围校验。
- 危险操作：ConfirmDialog 必须显示对象名称、动作、影响；确认按钮用 `bg-error`；取消为次要按钮。
- 权限：无权限隐藏入口/按钮；后端 403 时 toast + 不白屏；不要只靠前端隐藏。
- 重置密码：服务端返回一次性临时密码；弹窗展示一次，提供复制按钮和“关闭后不再显示”提示；不写 `console.log`。
- 日志：只读，不允许编辑/删除。

## 7. API 契约（只允许使用这些字段）
统一响应：`{ code, message, data, traceId }`；列表：`{ records, total, page, size }`。
错误码：400 参数错误、401 未登录、403 无权限、404 不存在、409 状态冲突、500 系统异常。

### 概览
`GET /admin/overview`
data: `{ generatedAt, exerciseDegraded, totalUsers, enabledUsers, disabledUsers, newUsersToday, newUsers7d, adminUsers, totalCoinBalance, todayCheckIns, activeNotices, activeActivities, exercise: { questionTotal, pendingReview, approvedTotal, rejectedTotal, answeredLast30d, todayAnswered, activeUsersToday, activeUsers7d, totalStudySeconds, dataWindowDays } }`

### 用户
- `GET /admin/users?keyword=&role=&status=&cetLevel=&startDate=&endDate=&page=&size=`
- `GET /admin/users/{id}`
- `PUT /admin/users/{id}/status` body `{ status: 0|1 }`
- `PUT /admin/users/{id}/role` body `{ role: "ROLE_USER"|"ROLE_ADMIN" }`
- `POST /admin/users/{id}/reset-password` 无请求体，返回 `{ userId, temporaryPassword }`（只展示一次）

用户列表字段：`id, username, nickname, avatarUrl, cetLevel, phoneMasked, roles, status, lastLoginAt, createdAt, eloScore, coinBalance`。

### 通知
- `GET /admin/notices?status=&noticeType=&targetAudience=&keyword=&page=&size=`
- `GET /admin/notices/{id}`
- `POST /admin/notices` body `{ title, content, noticeType, targetAudience, publishAt?, expireAt? }`
- `PUT /admin/notices/{id}` 仅草稿可编辑
- `POST /admin/notices/{id}/publish`
- `POST /admin/notices/{id}/expire`
- `DELETE /admin/notices/{id}` 仅草稿可删除

### 活动
- `GET /admin/activities?status=&activityType=&targetAudience=&keyword=&page=&size=`
- `GET /admin/activities/{id}`
- `POST /admin/activities` body `{ title, summary, content, bannerUrl?, activityType, targetAudience, startAt, endAt, sortOrder }`
- `PUT /admin/activities/{id}` 仅草稿可编辑
- `POST /admin/activities/{id}/publish`
- `POST /admin/activities/{id}/end`
- `DELETE /admin/activities/{id}` 仅草稿可删除

### 操作日志
- `GET /admin/operation-logs?operatorId=&action=&targetType=&result=&startTime=&endTime=&page=&size=`

### 题目审核
- `GET /admin/questions?status=PENDING&moduleType=&targetLevel=&keyword=&page=&size=`
- `POST /admin/questions/{id}/approve` 无请求体；审核人取当前登录管理员
- `POST /admin/questions/{id}/reject` body `{ comment }`
- `POST /admin/questions/generate` body `{ knowledgePoint, cetLevel, difficulty, questionType, count }`

字段细节以后端 API 为准；禁止发明字段。

## 8. 状态枚举
- 用户状态：1 正常 / 0 禁用
- 角色：`ROLE_USER` / `ROLE_ADMIN`
- 通知状态：`DRAFT` / `PUBLISHED` / `EXPIRED`
- 通知类型：`SYSTEM` / `REMINDER` / `ACTIVITY`
- 目标人群：`ALL` / `CET4` / `CET6`
- 活动状态：`DRAFT` / `PUBLISHED` / `ENDED`；展示态另算 `SCHEDULED/ACTIVE/ENDED`
- 活动类型：`BANNER` / `CONTENT`
- 审核状态：`PENDING` / `APPROVED` / `REJECTED`

## 9. 输出格式（给设计 AI）
对每个页面输出：
1. 路由与页面目标
2. ASCII 线框图（桌面 1440）
3. 组件树（使用第 5 节组件名）
4. 数据字段与 API 映射
5. 交互与状态矩阵（loading/empty/error/disabled/无权限）
6. 权限与危险操作
7. i18n key 清单
8. 验收清单

最后输出全局设计令牌使用表与组件 Props 表。

## 10. 验收清单
- [ ] 无 `el-*`、无新增依赖、无硬编码 hex/字号
- [ ] 六页齐全，路由与角色守卫明确
- [ ] 所有列表服务端分页 + 筛选 + 空/错/加载
- [ ] 所有危险操作二次确认
- [ ] 手机号脱敏、无密码展示；临时密码只显示一次
- [ ] 暗色模式全部适配
- [ ] 所有文案 i18n，zh-CN/en-US 同步
- [ ] 无 `any`、API 只在 `api/admin.ts`
- [ ] 桌面 1440/1280/1024 不破版
