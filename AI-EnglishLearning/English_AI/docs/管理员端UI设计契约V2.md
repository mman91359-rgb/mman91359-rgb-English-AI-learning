# Recall·睿考 管理员端 UI 设计契约 V2

**用途**：给其他 AI / 设计师生成管理员后台 UI 设计稿；V1 的六页细节仍适用，本版补充**登录保护、P0/P1 分期、与现有后端的对接边界**。

---

## 0. 当前后端事实

- 管理 API 基座：`/admin/**`，前端请求 `/api/admin/**`（Vite/Nginx 剥 `/api`）。
- 登录：复用学习端登录页；JWT 必须含 `ROLE_ADMIN`；管理员 Token 默认 2 小时。
- 网关：`JwtAuthFilter` 校验 JWT 角色、剥离客户端伪造头、注入 `X-User-Id/X-Username/X-User-Role/X-Gateway-Token`。
- 下游：user-service / exercise-service 的 `AdminAuthInterceptor` 校验网关令牌并回查管理员状态。
- 已有接口：概览、用户列表/详情/状态/角色/重置密码、通知、活动、操作日志、题目审核、AI 出题。
- 前端缺口：登录跳转、`requiresAdmin` 守卫、AdminLayout、后台页面、`api/admin.ts`、旧审核页接口 404。

**设计 AI 不要发明接口/字段**；字段以 `docs/管理员端API契约.md` 为准。

---

## 1. 登录与权限

- 管理员复用 `/login`，不提供注册。
- 登录成功后：
  - `ROLE_ADMIN` → `/admin/overview`
  - 普通用户 → `/dashboard` 或原 redirect
- 路由：`meta: { requiresAuth: true, requiresAdmin: true }`。
- 未登录访问 `/admin/**` → `/login?redirect=...`。
- 已登录非管理员访问 `/admin/**` → `/403` 或 `/dashboard` + toast；前端隐藏入口，后端仍强校验。
- 学习端侧栏仅对管理员显示“管理后台”。
- 不展示密码/密码哈希；手机号脱敏；临时密码只出现一次。

---

## 2. 布局

- `AdminLayout`：左侧 240px（可折叠 72px）+ 顶部 64px + 内容最大 1440px。
- 不使用学习端 `AppLayout`、底部导航、金币徽章、AI 侧边栏。
- 侧栏：
  - P0：概览 `/admin/overview`、用户 `/admin/users`、题目审核 `/admin/questions`
  - P1：通知 `/admin/notices`、活动 `/admin/activities`、操作日志 `/admin/logs`（可标“下一轮”）
- 顶栏：面包屑/页面标题、管理员头像/角色、主题切换、退出。
- 激活态：`bg-primary-container/20` + `border-l-2 border-primary`。
- 桌面优先；移动端不破版即可，不做完整移动后台。

---

## 3. 页面分期

### P0（先做）

1. `/admin/overview`
2. `/admin/users`
3. `/admin/users/:id`
4. `/admin/questions`

### P1（后补）

5. `/admin/notices`
6. `/admin/activities`
7. `/admin/operation-logs`

---

## 4. P0 页面要点

### 4.1 概览

- KPI：总用户、今日新增、今日活跃、累计答题（30 天）、今日答题、待审核题目。
- `exerciseDegraded=true`：顶部黄色横幅“学习统计暂不可用”，页面仍 200，不显示红色错误页。
- 快捷入口：用户管理、题目审核。
- 可选：近 7/30 天新增、模块答题分布、正确率趋势、最近日志 Top 5（P1 可后补）。

### 4.2 用户管理

- 筛选：关键词、（用户名/昵称/手机号）、角色、状态、CET 级别、注册时间范围。
- 表格列：用户（头像+昵称+用户名）、CET、角色、状态、ELO、金币、最后登录、注册时间、操作。
- 服务端分页 20/50/100。
- 操作：
  - 查看详情
  - 启用/禁用（确认；不能禁用自己）
  - 调整角色（确认；不能改自己；至少保留一个启用管理员）
  - 重置密码（确认；一次性临时密码弹窗，可复制，关闭后不再显示）
- 表格空/加载/错误/无权限四态。
- 手机号脱敏；不显示密码。

### 4.3 用户详情

- 基本信息、能力雷达（ELO/词汇/语法/听力/阅读）、学习数据、金币、偏好。
- `stats=null` 显示“暂不可用”。
- 操作同上；危险操作确认。

### 4.4 题目审核

- 状态 Tab：待审核 / 已通过 / 已驳回。
- 筛选：模块、等级、难度、关键词。
- 卡片/表格：题干、选项、答案、解析、知识点、状态、创建时间。
- 操作：
  - 通过（确认）
  - 驳回（意见必填）
  - AI 出题（知识点/等级/难度/题型/数量）
- 只有 `PENDING` 可审核；409 提示“状态已变化，请刷新”。
- 旧接口 `/exercise/pending-questions/**` 已删除，必须调 `/admin/questions`。

---

## 5. P1 页面要点

- 通知：列表/筛选/新建编辑/发布/下线/删除；已发布不可改正文与目标人群；仅草稿可删除。
- 活动：列表/筛选/新建编辑/发布/结束；结束必须晚于开始；已发布不可改目标人群/开始时间。
- 操作日志：只读筛选表格；行展开 JSON 详情；不提供编辑/删除。

---

## 6. 组件契约

复用：`BaseDialog`、`LoadingState`、`EmptyState`、`ErrorState`、`useToast`。

新增：
- `AdminLayout`、`AdminSidebar`、`AdminTopbar`
- `AdminDataTable`：列配置、sticky header、行高 56px、操作列右对齐
- `AdminPagination`：页码/每页条数/总数，服务端分页
- `AdminFilterBar`：关键词、下拉、日期、重置
- `StatusBadge`：成功/警告/危险/中性
- `ConfirmDialog`：危险操作二次确认，展示对象与影响
- `BaseDrawer`：新建/编辑、用户详情
- `AdminStatCard`：KPI
- `FormField`：label/必填/帮助/错误

---

## 7. 状态与安全

- 所有页面：loading / empty / error / 无权限。
- 危险操作：二次确认，确认按钮 `bg-error`。
- 403：toast + 不白屏；不要只靠前端隐藏。
- 临时密码：只展示一次；不写 console；不写入日志。
- 手机号：`138****0000`。
- 管理员降权：user-service 即时回查；exercise-service 最长 2h 仍信任 JWT，属于已知边界，不在 UI 层解决。

---

## 8. 设计约束

- Vue3 `<script setup>` + TS + Pinia + Vue Router + Tailwind M3 语义 token。
- 禁止 Element Plus `el-*`；禁止新增依赖；禁止硬编码 hex/字号。
- 图标 Material Symbols Outlined。
- API 只放 `src/api/admin.ts`；禁止组件内裸写 axios/fetch。
- 所有出入参 TS 类型，禁止 `any`。
- 列表服务端分页；禁止前端假分页。
- 桌面 1440/1280/1024 不破版；暗色模式；i18n zh-CN/en-US。
- 文案中文；后台可桌面优先，移动端只要求不破版。

---

## 9. 验收清单

- [ ] 管理员登录后进入 `/admin/overview`；普通用户访问 `/admin/**` 被拦截
- [ ] P0 四页齐全；P1 入口标记“下一轮”，无死链
- [ ] 概览 KPI 与 `exerciseDegraded` 横幅
- [ ] 用户列表筛选/分页/详情/启禁用/改角色/重置密码
- [ ] 临时密码只显示一次；手机号脱敏；无密码展示
- [ ] 题目审核通过/驳回/AI 出题；只有 PENDING 可操作；409 提示
- [ ] 所有页面 loading/empty/error/无权限
- [ ] 无 `el-*`、无硬编码 hex、无新增依赖
- [ ] `npm run type-check`、`npm run build` 通过

---

## 10. 可直接复制给其他 AI 的提示词

```text
你是 Recall·睿考（CET4/CET6 AI 学习系统）的管理员后台 UI 设计师兼 Vue3 前端工程师。请按以下契约生成管理员端设计稿，优先 P0 四页，P1 三页可后补。

【登录与权限】
- 管理员复用学习端 /login，不提供注册。
- 登录后 ROLE_ADMIN → /admin/overview；普通用户 → /dashboard。
- 路由 meta.requiresAdmin；未登录 → /login?redirect=...；非管理员 → /403。
- 普通用户隐藏“管理后台”入口；管理员显示。
- 不展示密码/哈希；手机号脱敏；临时密码只展示一次。

【布局】
- 独立 AdminLayout：左侧 240px 可折叠 + 顶部 64px + 内容最大 1440px。
- 不使用学习端底部导航、金币、AI 侧边栏。
- 侧栏 P0：概览/用户/题目审核；P1：通知/活动/操作日志（标“下一轮”）。
- 顶栏：面包屑/标题、管理员头像/角色、主题切换、退出。

【P0 页面】
1. /admin/overview：KPI（总用户、今日新增、今日活跃、累计答题、今日答题、待审核题目）；exerciseDegraded 黄色横幅；用户/题目入口。
2. /admin/users：筛选（关键词/角色/状态/CET/注册时间）+ 服务端分页表格 + 详情/启禁用/改角色/重置密码；危险操作确认；临时密码一次性。
3. /admin/users/:id：基本信息、能力雷达、学习数据、金币、偏好；stats 为空显示“暂不可用”。
4. /admin/questions：待审核/已通过/已驳回 Tab；通过、驳回（意见必填）、AI 出题；只有 PENDING 可审核；409 提示刷新。

【P1 页面】
- 通知、活动、操作日志；先保留入口和占位，不要虚构后端字段。

【API】
- 只使用 /admin/**；字段以 docs/管理员端API契约.md 为准。
- 列表 { records,total,page,size }；服务端分页；page>=1，size 20/50/100。
- 错误码 400/401/403/404/409/500；所有页面四态。

【组件】
AdminLayout、AdminSidebar、AdminTopbar、AdminDataTable、AdminPagination、AdminFilterBar、StatusBadge、ConfirmDialog、BaseDrawer、AdminStatCard、FormField。
复用 BaseDialog、LoadingState、EmptyState、ErrorState、useToast。

【约束】
- Vue3 <script setup> + TS + Tailwind M3 语义 token；禁止 Element Plus el-*；禁止硬编码 hex/字号；禁止新增依赖。
- API 只放 src/api/admin.ts；禁止组件内裸写 axios/fetch；禁止 any。
- 所有危险操作二次确认；日志只读；手机号脱敏；临时密码只显示一次。
- 桌面 1440/1280/1024 不破版；暗色；i18n；键盘可访问性。
- 输出：每页 ASCII 线框 + 组件树 + API 字段映射 + 状态矩阵 + i18n key + 验收清单。

先只做 P0 四页；P1 保留入口与占位，不要虚构后端字段。
```
