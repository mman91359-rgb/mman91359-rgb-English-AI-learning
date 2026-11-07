# Recall·睿考 前端项目开发文档（V3）

**版本**：V3.2（2026-11-07 按代码事实二次校准）　|　**基线**：`refactor/reuse-baseline` 分支 `AI-EnglishLearning/English_AI/frontend/` 最新提交代码事实　|　**适用阶段**：听力/翻译/写作模块均已完成，管理员端 7 页已实装

> **V3.2 校准摘要**：路由已全部改为 `() => import()` 懒加载，主入口 chunk 约 218 kB（原单一 chunk 约 2,997 kB）；Element Plus 依赖保留但**不再全局注册**（与 §2 决策一致）；ECharts 改为 `echarts/core` 按需注册，仅统计页分包加载；AI 侧栏渲染已先转义再白名单格式化、词汇题干改为模板插值（消除 v-html 注入）；写作模块已接真实后端（`POST /exercise/writing/submit` 先落库后评分，失败降级 `aiScored=false`）。翻译/写作、管理员端细节以 `docs/` 下专项契约为准。

> **V3.1 校准摘要**：暗色主题已完整实现（`darkMode: "class"` + `stores/app.ts` 持久化）；StatsView 没有雷达图，雷达数据在 ProfileView 以列表展示；原型资源为仓库根 `页面/` 的 15 个亮色 + 6 个黑夜版；已新增 `/listening` 路由、`ListeningView.vue`、`AudioPlayer.vue`。

---

## 0. 文档声明（先读）

本文档的**技术栈、目录结构、路由、组件、设计语言**全部来自最新仓库 `frontend/` 源码核验（`package.json`、`src/router/index.ts`、`src/views/*`、`src/api/*`、`src/components/*`）与仓库 `页面/` 目录下**你亲手设计的 16 个 HTML 原型页面**。本版（V3）相比 V2 的关键修订：

1. **整合《项目设计文档》增量补丁**：产品设计原则（§5.5）、QuestionCard 状态机（§7.6）、StreamOutput 流式输出组件（§7.7）、新用户首次使用链路（§8.1）、回访用户每日练习链路（§8.2）、全链路联调验收清单（§9.2）。补丁中与真实代码冲突的色值（如天青 #06B6D4 等 Epop 描述）**一律以工程化的 M3 设计令牌为准**（§5.1 表），不引入与代码不符的色值。
2. **剔除游戏化**：成就体系、徽章、分享卡片等游戏化内容**全部移除**，不在本文档任何章节（含路线图）出现。
3. 前端设计语言确认为 **Material Design 3 设计令牌 + Tailwind**（主色 #67558c 紫、surface 色板、Inter 字体、Material Symbols 图标）。
4. Element Plus 依赖已安装但**代码未使用**——决策：保留依赖但规范禁用组件库混用（§2 与 §10）。
5. 听力页面已完成（`/listening` + `ListeningView.vue` + `AudioPlayer.vue`）；翻译/写作页面仍未开发（路由无 `/translation /writing`），计划见《后续开发任务书（Backlog）》。

---

## 1. 现状基线

| 维度 | 事实（最新仓库核验） |
|---|---|
| 目录 | `AI-EnglishLearning/English_AI/frontend/` |
| 框架 | Vue 3.5 + TypeScript（`<script setup>` 组合式） |
| 构建 | Vite 8（dev/build/preview/type-check） |
| 状态管理 | Pinia 3 |
| 路由 | Vue Router 5（createWebHistory，22 条路由，含 `/listening`） |
| 样式 | Tailwind CSS 3.4 + M3 设计令牌（tailwind.config 扩展色板/字体/圆角/间距） |
| 图标 | Material Symbols Outlined（非 Element Plus 图标） |
| UI 组件库 | Element Plus ^2.14.7 **已装未用**（决策：不启用，见 §2） |
| 图表 | ECharts 6（雷达图、热力图、柱状图） |
| HTTP | Axios（统一封装 `src/api/request.ts`） |
| 国际化 | vue-i18n 10 |
| 页面数 | 17 个视图（含 ListeningView） |
| API 模块 | 6 个：request / user / exercise / learning / ai / stats |
| 核心组件 | AppLayout / SideNavBar / BottomNavBar / TopAppBar / AiSidebar / AiSidebarContent / ToastNotification |
| 对接网关 | Vite 代理 `/api` → `http://localhost:8086` |

> **结论**：前端是「M3 设计令牌 + Tailwind 自研组件」的移动端优先学习 SPA（顶栏 + 侧边导航 + 底部导航 + AI 侧边栏），由你自绘的 HTML 原型（`页面/` 目录）工程化而来。后续所有页面开发必须沿用该设计语言。

---

## 2. 技术栈与版本锁定（唯一性声明）

| 技术 | 版本 | 状态 |
|---|---|---|
| Vue | ^3.5.38 | ✅ 使用中 |
| TypeScript | ~6.0（vue-tsc ^3.3.5 严格检查） | ✅ 使用中 |
| Vite | ^8.0.16 | ✅ 使用中 |
| Vue Router | ^5.1.0 | ✅ 使用中 |
| Pinia | ^3.0.4 | ✅ 使用中 |
| Tailwind CSS | ^3.4.19 | ✅ 使用中 |
| ECharts | ^6.1.0 | ✅ 使用中 |
| Axios | ^1.7.2 | ✅ 使用中 |
| vue-i18n | ^10.0.8 | ✅ 使用中 |
| Element Plus | ^2.14.7 | ⚠️ 依赖已装，代码未使用 |
| unplugin-icons / @iconify-json/ep | — | ⚠️ 已装未用 |
| vite-plugin-vue-devtools | ^8.1.2 | ✅ 开发辅助 |

**技术决策（发展唯一性）**：全站 UI 采用 **Tailwind + M3 设计令牌 + Material Symbols 图标**；**Element Plus 仅保留依赖不引入组件**（避免两套风格混用、包体积膨胀）。若未来确需表单/表格重型组件，由统一封装层引入，禁止页面级随意 import。

---

## 3. 工程结构与目录规范

```
frontend/
├── index.html
├── package.json / vite.config.ts / tsconfig.json / tailwind.config.*
├── public/
└── src/
    ├── main.ts                    # 入口：App + Pinia + Router + i18n
    ├── App.vue
    ├── api/                       # 6 个模块（唯一数据出口）
    │   ├── request.ts             # Axios：baseURL=/api、token 注入、Result 解包、401 处理
    │   ├── user.ts / exercise.ts / learning.ts / ai.ts / stats.ts
    ├── router/index.ts            # 22 条路由 + 全局守卫
    ├── stores/                    # Pinia：user 等
    ├── i18n/                      # 多语言词条
    ├── composables/               # useToast 等
    ├── components/                # 公共组件（7 个）
    ├── views/                     # 16 个页面
    ├── styles/                    # Tailwind 入口 + 全局样式
    └── assets/ / utils/ / types/
```

**约定**：页面 → `views/`；公共组件 → `components/`；API 调用只允许在 `api/*.ts`；DTO 类型集中在 `types/` 或 api 模块内导出。

---

## 4. 页面与路由清单（16 页面 / 21 路由）

| 路由 | 视图 | 说明 |
|---|---|---|
| `/login` | LoginView | 登录（无守卫） |
| `/register` | RegisterView | 注册（无守卫） |
| `/` | 重定向 | 已登录 → `/dashboard`，未登录 → `/login` |
| `/dashboard` | HomeView | 首页（每日目标进度环/连续打卡/学习量柱状图/每日单词） |
| `/learning` | LearningView | 学习中心 |
| `/learning/practice` | PracticeView | 练习作答（QuestionCard） |
| `/listening` | ListeningView | 听力练习（列表 → 播放 → 作答 → 判分） |
| `/assess` | AssessView | ELO 定级测试 |
| `/vocabulary` | VocabularyView | 生词本 |
| `/vocab-quiz` | VocabQuizView | 词汇测验 |
| `/grammar-quiz` | GrammarQuizView | 语法测验 |
| `/error-book` | ErrorBookView | 错题本 |
| `/favorites` | FavoritesView | 收藏句子 |
| `/history` | HistoryView | 学习历史 |
| `/stats` | StatsView | 学习统计（热力图 / 7 日柱状图；雷达数据在 ProfileView） |
| `/profile` | ProfileView | 个人中心 |
| `/settings` 及子路由 | SettingsView | 设置 |
| `/logout` | — | 登出跳转 |
| `/admin/questions` | AdminQuestions | AI 题目审核管理 |

**路由守卫**：`requiresAuth` 元信息 + 全局 `beforeEach`；未登录访问受保护页 → `/login?redirect=...`；已登录访问公开页 → `/dashboard`。

---

## 5. 设计系统（M3 设计令牌）

### 5.1 色彩（M3 亮色为主，`dark` 类切换黑夜版；已实现持久化）

| 令牌 | 值 | 用途 |
|---|---|---|
| `bg-background` / `bg-surface` | #f8f9fc / #f8f9fc | 页面底/卡片底 |
| `bg-surface-container-lowest/low` | #ffffff / #f2f3f6 | 卡片/输入框 |
| `text-on-surface` / `text-on-surface-variant` | #191c1e / #49454f | 主文字/次文字 |
| `text-primary` / `bg-primary` | #67558c（紫） | 品牌主色/主按钮 |
| `bg-primary-container` | #b19cd9 | 选中态底 |
| `text-tertiary` / `bg-tertiary-container` | #006e20 / #57bb5d | 每日单词等强调 |
| `text-error` / `bg-error-container` | #ba1a1a / #ffdad6 | 错误/驳回 |
| `text-outline` / `outline-variant` | #7a757f / #cbc4d0 | 边框/占位 |
| 黑夜版 | `dark:bg-inverse-surface` 等 | `页面/黑夜版/` 有完整原型 |

### 5.2 字体/字号/圆角/间距
- 字体：Inter（headline/body/label/display 各档）。
- 字号令牌：`text-display-lg(48px)` / `headline-lg(32px)` / `headline-md(24px)` / `body-lg(18px)` / `body-md(16px)` / `label-lg(14px)` / `label-md(12px)`。
- 圆角：`rounded-[16px]`（卡片）/ `rounded-[24px]`（大卡片）/ `rounded-full`（按钮/标签）/ `rounded-xl`（输入框）。
- 间距：`px-margin-page(40px)` / `px-gutter(24px)` / `w-sidebar-width(280px)` / `max-w-container-max(1200px)`。

### 5.3 图标
- **Material Symbols Outlined**（Google Fonts），示例：`school`、`auto_stories`、`local_fire_department`、`menu_book`、`wb_sunny`、`progress_activity`（loading）、`auto_awesome`（AI 出题）。
- 不引入 Element Plus 图标库。

### 5.4 动效
- 页面入场 fade-in-up；进度条滑动 progress-slide；按钮点击 scale(0.96) 微缩 + hover 上浮发光；全局背景可挂 Three.js 3D shader（`待开发界面.html` 已有实现，可选）。

### 5.5 产品设计原则（增量补丁，已工程化为 M3 令牌）
| 设计维度 | 规范 |
|---|---|
| 核心原则 | 轻量化、卡片化、数据可视化驱动、移动端优先 |
| 卡片风格 | 去线框化，仅用 box-shadow 表现层级，圆角统一 12~16px（对应 `rounded-[16px]` 等令牌） |
| 交互动效 | 答题状态切换 300ms 缓动；AI 流式输出打字机效果 |
| 图表风格 | ECharts 雷达图 + 柱状图，配色与 M3 主色系统一（#67558c 系） |
| 布局策略 | Mobile-First，移动端最大宽度 450px，桌面端居中显示 |

> 说明：《项目设计文档》中的 Epop 色彩描述（天青 #06B6D4 等）为设计愿景，**与真实代码 M3 令牌冲突，以真实令牌为准**，不写入工程规范。

---

## 6. 数据层与接口对接规范

### 6.1 Axios 封装（`api/request.ts`）
- `baseURL = '/api'`（Vite 代理 → 8086）；请求拦截注入 `Authorization: Bearer <token>`；响应拦截 `Result<T>` 解包，401 → 清登录态跳 `/login`。
- SSE（`/ai/chat`、`/ai/score`）不走 Axios，用 fetch + ReadableStream，复用 AiSidebarContent 流式渲染。

### 6.2 关键类型（与后端 DTO 对齐，来自 `api/exercise.ts`）
- `QuestionVO`：id/moduleType(1词汇 2语法 3翻译 4听力 5造句 6写作)/difficultyLevel(1~8)/questionType/stem/options/correctAnswer?/hint?/analysis?/showAnswer?/audioUrl?/transcript?/durationSeconds?（后三者仅听力题有值，transcript 提交后才下发）。
- `SubmitResponse`：isCorrect/userAnswer/correctAnswer/analysis/**traceId**/heuristicHint?/errorType?/suggestions?/isSemanticMatch?。
- `UserExerciseStats`：totalAnswered/correctRate/totalHours/streakDays/**heatmapData**/**recentWeekMinutes**/**yearlyMonthQuestions**/**todayVocabAnswered**。
- `VocabularyVO`：word/translation/phonetic/pos/example/exampleTranslation/collocation/masteryLevel/nextReviewAt。
- `PendingQuestion`：moduleType/targetLevel/difficultyLevel/questionType/stem/options/correctAnswer/analysis/knowledgePointName/status(PENDING/APPROVED/REJECTED)/reviewComment。
- `DailyWordVO`：word/phonetic/translation/pos/example/exampleTranslation/level。

### 6.3 Long 精度
- 后端 Long 序列化为字符串；前端类型定义为 `string | number`，运算前 `Number()`。

### 6.4 分页
- `/exercise/history/{userId}?page&size` → `{ records, total, page, size }`。

### 6.5 对接红线
- 页面不直接传 userId：从 `userStore.userId` 取；后端以网关透传 `X-User-Id` 为准。
- 新增后端接口必须同步新增 `api/*.ts` 封装；禁止组件内裸 axios。

---

## 7. 核心组件规范

### 7.1 布局与导航组件
| 组件 | 职责 | 要点 |
|---|---|---|
| `AppLayout.vue` | 整体布局 | 顶栏 + 侧边栏(280px) + 底部导航 + 内容区 + AiSidebar 插槽 |
| `TopAppBar.vue` | 顶部栏 | 搜索/通知/主题切换/语言/头像 |
| `SideNavBar.vue` | 桌面侧边导航 | 激活态 `border-l-2 border-primary` |
| `BottomNavBar.vue` | 移动底部导航 | 核心入口 |
| `ToastNotification.vue` | 全局轻提示 | 响应拦截器自动弹错 |

### 7.2 AI 侧边栏（产品差异化核心）
- `AiSidebar.vue` + `AiSidebarContent.vue`：SSE 流式对话；contextType 区分通用/题目讲解/作文批改/口语评分；断线重试；打字机渲染。**后续听力/写作模块的 AI 交互复用此套流式渲染。**

### 7.3 AI 出题工作台
- `AdminQuestions.vue`：状态 Tab（待审核/已通过/已驳回）+ AI 出题弹窗 + 通过/驳回弹窗——管理员后台样板，后续听力/写作管理页复用此模式。

### 7.4 答题主流程
- PracticeView/QuizView 状态流：`待作答 → 作答中 → 提交中 → 判分结果(正确/错误/语义匹配)`；提交后展示标准答案 + AI 启发提示 + 收藏/错题按钮。

### 7.5 图表封装
- StatsView 内联 ECharts 绘制 7 日柱状图，热力图为手写 div 网格；**没有雷达图**。雷达数据在 ProfileView 以列表展示（词汇/语法/翻译/听力）。后续沉淀为 ChartRadar/ChartBar/ChartHeatmap 公共组件（Backlog T-304）。

### 7.6 QuestionCard 状态机规范（增量补丁）
**四种状态**：`UNANSWERED → SUBMITTING → CORRECT / WRONG → EXPLAINED`

| 状态 | UI 表现 | 用户操作 |
|---|---|---|
| UNANSWERED | 题干 + 选项/输入框正常展示，提交按钮可点 | 选择/输入答案后提交 |
| SUBMITTING | 提交按钮 loading，选项禁用 | 等待接口返回 |
| CORRECT | 正确选项背景变绿，显示反馈文字，3 秒后自动下一题 | 可手动「下一题」 |
| WRONG | 用户选项变红，正确选项变绿，展示标准答案与解析 | 手动「下一题」，给足解析阅读时间 |

**Props**：`question`、`submitState`、`feedbackData`、`mode`（practice/review/assess）。

### 7.7 StreamOutput 流式输出组件（增量补丁）
- 监听 SSE 数据流，逐字打字机效果输出；支持 Markdown 渲染（marked + highlight.js）；加载态三点跳动动画，收到首字符后消失。
- 复用场景：AI 答疑侧边栏、主观题 AI 批改反馈、写作评分流式展示。

---

## 8. 关键用户链路（增量补丁）

### 8.1 新用户首次使用完整链路
1. 注册页：填写用户名、密码、选择目标考试（四级/六级）。
2. 定级引导：注册成功后弹窗提示「开始 AI 水平测试」。
3. 定级进行：依次展示 20 题，顶部进度条（1/20 → 20/20），每题答完立即显示结果。
4. 定级完成：展示 ELO 分、等级判定、雷达图、学习路径建议。
5. 进入首页：基于定级结果生成今日推荐学习任务。

### 8.2 回访用户每日练习链路
1. 首页：展示「今日待复习 N 题」红点提醒 + 快捷入口。
2. 选择模块：词汇 / 语法。
3. 答题中：题目卡片展示，填空题 500ms 防抖触发引导提示。
4. 提交答案：本地立即展示结果动画（乐观 UI）。
5. 完成总结：正确率、新增错题数、ELO 变化。
6. 后台静默：触发遗忘曲线更新，下次打开首页复习数字更新。

---

## 9. 联调验收清单

### 9.1 现有验收项（V2 保留）
- 注册/登录、定级 20 题、首页数据展示、词汇练习完整流程、答错进错题本、遗忘曲线触发、Token 失效跳登录。

### 9.2 全链路联调验证顺序（增量补丁）
| 序号 | 验证项 | 通过标准 |
|---|---|---|
| 1 | 注册新用户 | 注册成功自动登录，跳转定级页 |
| 2 | 完成 20 题定级 | 正常逐题展示，完成后跳结果页，user_ability_radar ELO 变化 |
| 3 | 首页数据展示 | 雷达图、待复习数、柱状图均有真实数据 |
| 4 | 词汇练习完整流程 | 拉 10 题 → 答题 → 提交 → 解析 → 翻页 → 完成弹窗 |
| 5 | 答错进错题本 | 答错 1 题后，错题本页面可见 |
| 6 | 遗忘曲线触发 | 答题后刷新首页，「待复习」数字从 0 变为 > 0 |
| 7 | Token 失效处理 | 修改 Token 为随机值后刷新，自动跳回登录页 |

---

## 10. 当前缺口与整改清单

| 优先级 | 缺口 | 状态 / 建议 |
|---|---|---|
| ✅ | 听力页面 | 已完成：`/listening` + `ListeningView` + `AudioPlayer` |
| ✅ | 暗色主题 | 已完成：`darkMode: "class"` + `stores/app.ts` 持久化 |
| P0 | 翻译/写作页面未开发 | 按 Backlog Sprint 2 落地 `/translation /writing` |
| P1 | Element Plus 依赖已装未用 | 保持禁用，避免两套风格混用 |
| P1 | SSE 断线重连 | AiSidebar 增加重试与 loading 态 |
| ✅ | 路由懒加载 | 已完成（2026-11-07）：全部路由 `() => import()` 分包，主入口 chunk 约 218 kB |
| P2 | 图表组件未抽公共封装 | ChartRadar/ChartBar/ChartHeatmap |

---

## 11. 未来路线图（不含游戏化）

| 阶段 | 目标 | 关键任务 |
|---|---|---|
| ✅ 已完成 | 听力模块 | `/listening` 列表 → 播放 → 作答 → 判分 → 原文/解析；`listening_score` 联动 |
| 近期 | 翻译模块 | `/translation` 作答（AI 语义判分展示），可把造句作为子模式 |
| 中期 | 写作模块 | `/writing` 作文编辑器（SSE 流式评分+分项得分），module_type=6 |
| 远期 | 体验增强 | 模拟考试(/mock-exam)、学习数据驾驶舱、路由懒加载、图表组件 |

> **产品明确不做**：成就体系、徽章、排行榜、分享卡片等游戏化设计，全站保持一致的学习工具定位。

---

## 12. 前端开发规范（AI 编程与人工共用）

1. **不混用组件库**：Tailwind + M3 令牌 + Material Symbols，禁用 `el-*` 组件（除非统一封装决策）。
2. 页面/组件分层：`views/` 页面、`components/` 公共组件，复用优先。
3. 数据访问收敛：API 只存在于 `api/*.ts`；组件经 store / composables 取数。
4. 类型先行：所有出入参定义 TS 类型（与后端 DTO 对齐），禁止 `any`。
5. AI 交互统一：走 AiSidebar / `api/ai.ts`，SSE 渲染复用 AiSidebarContent。
6. 设计令牌：颜色/字号/圆角/间距一律用 Tailwind 语义类，禁止写死 hex（§5）。
7. 提交规范：`feat(web): 描述` / `fix(web): 描述`。
8. **开发前先看 HTML 原型**（`页面/` 目录）作为交互与视觉第一参照，再在 Vue 工程落地。

---

*文档依据：mman91359-rgb-English-AI-learning@最新提交 frontend 源码 + `页面/` 16 个 HTML 原型 + 《项目设计文档》增量补丁（色值/组件库已按真实 M3 代码修正）。*
