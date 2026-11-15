# 前端 UI 契约

> 适用工程：`English_AI/frontend`（Vue 3.5 + TS + Vite + Tailwind 3.4 + M3 令牌 + Material Symbols Outlined）
> 建立日期：2026-11-14　｜　性质：**规则契约 + 基础组件**，本轮**未在任何页面接线**
> 上游依据：`docs/前端UI审计与组件契约.md`（偏差统计）、`docs/管理员端UI设计契约V2.md` §8（禁止硬编码 hex/字号）

---

## 0. 本文件的效力边界

| 项 | 说明 |
|---|---|
| 本文件规定什么 | 圆角、内边距、阴影、图标、按钮、字号六项的唯一写法，以及 `components/ui/` 下 12 个基础组件的 props 契约 |
| 本文件不规定什么 | 页面布局结构、栅格、断点、动效时长；这些仍按各模块既有设计契约执行 |
| 数值来源 | 全部取自 `tailwind.config.js`、`src/assets/main.css`、`dist/assets/index-*.css` 三处现有令牌，**本轮未新增任何颜色、尺寸、阴影或字号** |
| 当前落地状态 | 契约已建立，12 个组件已创建。**「已迁」按两级口径分别记**：<br>**已迁至组件层：6 页**（HomeView / AssessView / Favorites / Vocabulary / History / LearningView）—— 圆角/图标/阴影/字号四类任意值清零，且页内主体结构已换成 `ui/` 组件；另有 4 个入口面板组件（`WritingEntryPanel` / `TranslationEntryPanel` / `ListeningEntryPanel` 及 LearningView 的语法、词汇 tab）同步迁完<br>**仅收敛任意值：18 页**（admin 的 Users / UserDetail / Questions / Notices / Activities / OperationLogs / JudgeReview + `TranslationPracticeView` / `ListeningQuizView` / `StatsView` + `VocabQuizView` / `GrammarQuizView` / `ErrorBookView` / `LoginView` / `RegisterView` / `ForgotPasswordView` / `ProfileView` / `PracticeView`）—— 只做了任意值/死类名的收敛，**未接** `AppIcon` / `AppCard`（答题页还保留无令牌的布局值与品牌色投影，`StatsView` 保留 10 处图形尺寸与配对字号行高，见 §11.1；`VocabQuiz` / `GrammarQuiz` 已接 `QuizProgressBar`）<br>**其余 10 页一处未改**。因此「全站已统一」这句话目前不成立，任何场合都不得这样表述；也不得把这两类称为「已迁」 |

---

## 1. 圆角（唯一四档）

| 用途 | 类名 | 实际值 | 令牌来源 |
|---|---|---|---|
| 卡片、弹窗面板、整块容器 | `rounded-3xl` | `1.5rem` = 24px | Tailwind 默认值（`borderRadius` 为 `extend`，未覆盖 `3xl`） |
| 内嵌块：区块卡片、输入框、表格单元 | `rounded-2xl` | `1rem` = 16px | Tailwind 默认值 |
| 控件：chip、小徽章 | `rounded-xl` | `0.75rem` = 12px | 项目 `tailwind.config.js` 显式声明 |
| 胶囊：状态标签、进度条 | `rounded-full` | `9999px` | 项目 `tailwind.config.js` 显式声明 |

> **按钮不在本节**：按钮的形状统一归 §5 管（底座固定 `rounded-full`），本节四档不适用于按钮。

**禁止**

- 禁止 `rounded-[24px]`、`rounded-[16px]`、`rounded-[12px]`、`rounded-[20px]` 等任意值写法。前三个是上表三档的**等值**书写（A 类），直接替换；`20px` 在令牌表里**没有等值档**（B 类），按 §11 处理：要么保留原值登记例外，要么经批准就近并入 `rounded-2xl` 并写明 −4px 位移。
- 禁止在同一视图内混用「卡片 `rounded-xl`」与「卡片 `rounded-3xl`」。审计已记录 20 处方角主按钮与胶囊按钮同屏冲突（`ErrorBookView`），该类混用不再新增。
- `rounded-lg`（8px）仅限 ≤24px 的小徽章内部，不得用于卡片。

---

## 2. 内边距（三档）

| 场景 | 类名 | 实际值 | 说明 |
|---|---|---|---|
| 大内容卡 | `p-8` | 32px | 内容主体卡片、弹窗正文、报告页段落容器（`AppCard padding="regular"`） |
| 标准卡 | `p-6` | 24px | 信息密度高的卡片、统计小卡、表格容器（`AppCard padding="compact"`） |
| 行卡 / 卡内嵌块 | `p-4` | 16px | 列表行卡片、卡内小统计块、嵌入块。**不套 `AppCard`** |
| 列表行（行式布局） | `px-4 py-3` | 左右 16 / 上下 12 | 仅 `ListRow` 的「卡片内行」，覆盖 History / ErrorBook / Favorites 的行式变体 |

`p-4` 之所以独立成档：Favorites 行卡、Vocabulary 统计卡 ×3 与行卡、History 行卡、AssessView 指标块 ×2、
HomeView 复习块与状态行、StatsView 三格 —— 同一值已 ≥10 处在用，逐个登记例外比立档更贵。

**圆角 ↔ 内边距 配对**

| 圆角 | 内边距 | 场景 |
|---|---|---|
| `rounded-3xl` | `p-8` | 大内容卡 |
| `rounded-3xl` | `p-6` | 标准卡（紧凑场景） |
| `rounded-2xl` | `p-6` | 内嵌块 |
| `rounded-2xl` | `p-4` | 行卡（列表行卡片，不套 `AppCard`） |
| `rounded-xl` | `p-4` | 小嵌入块（例句块、指标小块） |

> 前三条为原有配对；后两条是 P3.6 新增。行卡固定 `rounded-2xl + p-4`：
> 圆角保持 16px（与列表卡的视觉体量匹配），内边距收到 16px（避免行卡被撑胖）。

**禁止**

- 禁止 `p-5`、`p-7`、`px-5 py-2.5` 这类介于三档之间的自选值。`p-5` 仍是待收敛项，新代码不得再写。
- 同一列表内所有行必须同档；不得出现首行 `p-4`、次行 `p-5`。
- 圆角与内边距必须按上表配对，不得自选组合（如 `rounded-3xl + p-4`）。

---

## 3. 阴影（唯一一档）

| 用途 | 类名 | 实际值 |
|---|---|---|
| 所有需要抬升的容器 | `shadow-soft-glow` | `0 4px 20px rgba(51, 58, 72, 0.05)` |

**禁止**

- 禁止 `shadow-sm` / `shadow-md` / `shadow-lg` / `shadow-xl` / `shadow-2xl` 与 `shadow-soft-glow` 混用。`hover:shadow-md` 同样禁止。
- 禁止手写 `shadow-[0_4px_20px_rgba(51,58,72,0.05)]`。审计记录该字面量在 7 处重复出现，与令牌完全同值。

**已存在的历史别名（本轮不改，新代码不得使用）**

`src/assets/main.css` 里还有两个手写类，盒模型值与 `shadow-soft-glow` **逐字节相同**：

| 类名 | 位置 | 值 | 处置 |
|---|---|---|---|
| `.card-shadow` | `main.css:288` | `0 4px 20px rgba(51,58,72,0.05)` | 历史别名，新代码改用 `shadow-soft-glow` |
| `.soft-shadow` | `main.css:320` | 同上 | 同上（`BaseDialog` 在用） |

即：**阴影只有一档值，但历史上被起了三个名字**。收敛这三个名字需要动 `main.css` 与多个页面，不在本轮范围。

**登记例外：品牌色投影（白名单 + 语义约束）**

答题页的主按钮在渐变底色上叠了一层同色系投影，用于「彩色发光」而非「容器抬升」，语义与 `shadow-soft-glow` 不同。
本表是**唯一白名单**：颜色、模糊半径、用途三者都要对得上，缺一项即违规。

| 颜色 | 值 | 处数 | 语义 | 允许用在哪 |
|---|---|---|---|---|
| primary 紫 | `rgba(103,85,140,0.25)` | 2 | 主按钮发光 | 只许可点按钮 |
| secondary 青 | `rgba(12,103,128,0.25)` | 3 | 次按钮发光 | 同上 |
| tertiary 绿 | `rgba(0,110,32,0.25)` | 3 | 第三按钮发光 | 同上 |
| tertiary 绿 | `rgba(0,110,32,0.08)` | 1 | 正确反馈底晕 | 只许反馈态容器 |
| error 红 | `rgba(186,26,26,0.08)` | 1 | 错误反馈底晕 | 只许反馈态容器 |

合计 **10 处**（2026-11-15 实测）。`.25` 与 `.08` 是两种用法，不许互串：前者是可点按钮的发光，后者是反馈态容器的底色晕。
这 10 处**保留原值**，理由：改成 `shadow-soft-glow` 会让按钮从「彩色发光」退化为中性灰投影，与输入框的抬升感拉平。

两条硬规则：

1. **发光只许用于「可点按钮」与「反馈态容器」**，禁止装饰性使用（渐变头图、卡片角落光斑、hover 光晕等一律不许）。
2. **新增颜色前先改本节，改完才能进代码**。本节落后于代码时，以「改本节」为准，**不许把代码削到契约里**。

> **补登记录（2026-11-15）**：原表只登 3 色 6 处，实测为 4 色 10 处，属**事实违规**状态。
> 漏登的是 `AudioPlayer:27`（绿 `.25`）、`AudioPlayer:75`（青 `.25`）——该组件不在原审计范围；
> 新发现的是 `FeedbackPanel:74`（绿 `.08`）、`FeedbackPanel:75`（**红 `.08`，第 4 种颜色**）——原契约明写「不许新增第 4 种」，
> 现按语义例外补登：红色 `.08` 只服务「错误反馈底晕」，收敛成中性灰会让错题卡同时丢掉颜色与语义，属双损失。

---

## 4. 图标

### 4.1 尺寸只能走 `text-icon-*`

| 档位 | 类名 | 实际值 | 典型场景 |
|---|---|---|---|
| sm | `text-icon-sm` | 18px | 行内图标、按钮内图标、chip 内图标 |
| md | `text-icon-md` | 20px | 图标按钮、列表行首图标、卡片头图标 |
| lg | `text-icon-lg` | 24px | 页面级图标、空态图标、导航图标 |
| xl | `text-icon-xl` | 32px | 强调图标、结果页图标 |
| 2xl | `text-icon-2xl` | 36px | 大号展示图标 |

**禁止**

- 禁止 `text-base` / `text-lg` / `text-xl` / `text-2xl` / `text-3xl` 承载图标尺寸。这些类**不含 `text-icon-` 前缀**，会被 `main.css` 的兜底规则 `:where(.material-symbols-outlined):not([class*="text-icon-"]){font-size:24px}` 命中，实际渲染恒为 24px —— 写了等于没写。
- 禁止 `text-[14px]`、`text-[28px]` 等任意字号标注图标。
- 禁止用内联 `style="font-size:…"` 调整图标尺寸。

### 4.2 填充只能用 `filled` 布尔

| 写法 | 说明 |
|---|---|
| `filled` 布尔 → 输出 `.fill` 类 | `.material-symbols-outlined.fill { font-variation-settings: 'FILL' 1 }`（`main.css:261`） |

**禁止**手写 `font-variation-settings`，禁止 `style="font-variation-settings:'FILL' 1"`，禁止 `opsz` / `wght` 单独调节。

### 4.3 语义

图标默认 `aria-hidden="true"`。需要被读屏识别时，由调用方传 `aria-label`，不得依赖图标字形本身传达信息。

---

## 5. 按钮

**唯一来源：`src/components/ui/buttonStyles.ts`。** 按层级与尺寸选导出常量，不得在页面内拼装。

**按钮的形状与尺寸统一归本节，§1 圆角四档不适用于按钮。** 所有按钮底座固定 `rounded-full`，
调用方不得覆盖。

| 层级 | 默认档 (42px) | 小档 (36px) | 占位/全宽档 |
|---|---|---|---|
| 主 | `btnPrimary` | `btnPrimarySm` | `btnPrimaryBlock` |
| 次 | `btnSecondary` | `btnSecondarySm` | `btnSecondaryBlock` |
| 危险 | `btnDanger` | `btnDangerSm` | — |
| 幽灵 | `btnGhostSm` | — | — |
| 弹窗 | `btnDialogPrimary` / `btnDialogSecondary` | — | — |
| 图标 | `btnIcon` (40px) / `btnIconMd` (36px) / `btnIconSm` (32px) / `btnIconDanger` | — | — |
| 反色 | `btnPrimaryInverse` / `btnSecondaryInverse` | — | — |

> 反色档不复用 `base`：焦点环用 `focus-visible:outline-on-primary`，避免在 `bg-primary` 容器上与底色同色而不可见。
> 2026-11-15（`2a50d43`）新增 2 个导出常量，`buttonStyles.ts` 累计 **17 个** `export const`
> （按已提交状态计，口径同 §10「基线只认 HEAD」）。

**禁止**

- 禁止手写 `bg-primary px-* py-* rounded-*` 组合按钮。审计记录 20 处方角主按钮（`rounded-xl` + `py-4`）与令牌的 `rounded-full` 直接冲突。
- 禁止在 `bg-primary` 按钮上叠加 `rounded-xl`：所有按钮底座固定 `rounded-full`，形状不可由调用方覆盖。
- 禁止绕过 `btnIcon*` 手写 `h-8 w-8 rounded-full` 图标按钮（`AdminUsersView` 同一文件重复 5 次）。
- 禁止给按钮叠加 `text-[13px]` 等任意字号；按钮字号由 `font-label-lg` 底座锁定。

---

## 6. 字号（六档）

| 语义 | 类名（成对书写 `font-*` + `text-*`） | 实际值 |
|---|---|---|
| 正文 · 常规 | `font-body-md text-body-md` | 16px / 行高 24 / 400 |
| 正文 · 次要 | `font-body-sm text-body-sm` | 14px / 行高 20 / 400 |
| 标签 · 大 | `font-label-lg text-label-lg` | 14px / 行高 20 / 600 |
| 标签 · 小 | `font-label-md text-label-md` | 12px / 行高 16 / 500 |
| 标题 · 中 | `font-headline-md text-headline-md` | 24px / 行高 32 / 600 |
| 标题 · 大 | `font-headline-lg text-headline-lg` | 32px / 行高 40 / 600 |

**禁止**

- 禁止 `text-[13px]`、`text-[15px]`、`text-[10px]` 等任意值字号。审计发现 `StatsView:66` 的 `text-[10px]` 应改为 `text-label-xs`（10px，已有令牌）。
- 禁止只写 `text-body-md` 而不写 `font-body-md`。Tailwind 的 `text-*` 只带 `font-size`/`line-height`/`font-weight`，而 `font-*` 负责 `font-family`；本项目 `fontFamily` 显式声明了 Inter，漏写会退回系统字体。
- 禁止用 `text-sm` / `text-xs` 替代 `body-sm` / `label-md`。原生档位等于放弃 M3 的行高与字重。
- 层级不得超过两级跳：正文 16 → 标题 24 → 标题 32，不得在 14 与 24 之间自造 18/20 的正文档。

### 6.1 扩展档（2026-11-14 样板页接线时纳入）

§6 的六档是**核心六档**，不是白名单上限。以下令牌在 `tailwind.config.js` 中**已存在**（本轮未新增任何令牌），`HomeView` / `AssessView` 作为全站样板正在使用，现正式纳入契约：

| 语义 | 类名（仍须成对书写） | 实际值 | 样板页使用位置 |
|---|---|---|---|
| 展示 · 大 | `font-display-lg text-display-lg` | 48px / 行高 56 / 700 | HomeView 问候语、连续签到天数、每日单词主词 |
| 正文 · 大 | `font-body-lg text-body-lg` | 18px / 行高 28 / 400 | HomeView 问候副标题与天数单位、AssessView 题干 |
| 标签 · 微 | `font-label-sm text-label-sm` | 11px / 行高 16 / 500 | HomeView 词性徽章、单词等级标注 |

约束：

- 三档只用于**页面级展示位**（首屏问候、大数字、单词主词）与**长文本题干**；不得拿来替代 `body-md` / `label-md` 做普通正文，否则等于绕过六档。
- `display-lg` 与 `headline-lg` 不在同一页面共存：HomeView 用 48px 作首屏问候，AssessView 用 32px 作页面标题。同一页面出现「48 标题 + 32 标题」即视为跳级。

**仍未纳入**：`headline-sm`(20) / `label-xs`(10) / `sense-lg`(18/600) —— 样板页无调用点，等出现真实使用场景再议，不得提前使用。

---

## 7. 颜色（不在本轮新造，仅登记可用面）

`Tag` 需要的 5 个语义色**全部映射到已有令牌**，无新增色值：

| TagTone | 背景 | 文字 |
|---|---|---|
| `primary` | `bg-primary-container/30` | `text-primary` |
| `tertiary` | `bg-tertiary-container/50` | `text-on-tertiary-container` |
| `neutral` | `bg-surface-container-high` | `text-on-surface-variant` |
| `warning` | `bg-warning-container` | `text-on-warning-container` |
| `error` | `bg-error-container` | `text-on-error-container` |

**`TagTone` 与 admin 的 `BadgeTone` 不是同一套**，且本轮不合并（原因见 §9）。两者映射关系供将来迁移时查表：

| 现有 `BadgeTone` | 对应 `TagTone` |
|---|---|
| `success` | `tertiary` |
| `danger` | `error` |
| `info` | `primary` |
| `warning` | `warning` |
| `neutral` | `neutral` |

---

## 8. 组件契约（`components/ui/`，12 个）

> 8.1–8.8 为 P1 建立的 8 个组件，均已在页面接线（6 页）。
> 8.9–8.11 为 P3 增补的 `StatusBadge` / `Chip` / `ChipGroup`，8.12 为 P4 增补的 `EntryCard`；
> 这四个的 props 见各自文件头注释，本节尚未逐一登记（下一批补），查签名请直接读源码，勿凭本节推断。
>
> `EntryCard` 要点：固定 `rounded-3xl + p-6`（§2 标准卡档），`to` 有值渲染 `RouterLink`、
> 无值渲染 `button` 并抛 `click`；`description` 可选（Translation / Listening 的入口卡不传）；
> `iconAlpha` 只用于两张「词典」卡（`/20`，其余 `/30`）。`md:col-span-*` 不属组件，由调用方传入。

### 8.1 AppIcon

| prop | 类型 | 默认 | 说明 |
|---|---|---|---|
| `name` | `string` | 必填 | Material Symbols 连字名，如 `check` / `arrow_back` |
| `size` | `'sm'\|'md'\|'lg'\|'xl'\|'2xl'` | `'md'` | 映射到 `text-icon-*`：18/20/24/32/36px |
| `filled` | `boolean` | `false` | 输出 `.fill` 类 |
| `tone` | `'current'\|'primary'\|'secondary'\|'tertiary'\|'error'\|'warning'\|'variant'` | `'current'` | `current` 表示不设色、继承父级 |
| `ariaLabel` | `string` | `''` | 有值时取消 `aria-hidden` 并加 `role="img"` |

**禁止用法**

- 禁止用来承载 `text-icon-3xl`（48px）等表外档位。需要 48px 请直接用既有 `EmptyState` / `ErrorState`。
- 禁止 `size="inherit"`。`StreakDisplay`、`AppLogo` 依赖 scoped 的 `.flame-glyph` / `.logo-glyph`（特异性 (0,2,0)）继承外层字号，本轮不迁移，也不为该场景提供档位。
- 禁止用它替换 `StreakDisplay` 内部的火焰字形。

### 8.2 AppCard

| prop | 类型 | 默认 | 说明 |
|---|---|---|---|
| `tone` | `'surface'\|'container-low'\|'container-lowest'\|'container-high'` | `'container-low'` | 底色四档；`container-lowest` 为最亮一档，Favorites / Vocabulary / History 的卡片与列表行在用 |
| `padding` | `'compact'\|'regular'` | `'compact'` | `compact`=`p-6`(24px)，`regular`=`p-8`(32px) |
| `interactive` | `boolean` | `false` | 可点击态：渲染为 `<button>`，带 hover 底与 focus 环 |
| `shadow` | `boolean` | `true` | 是否带 `shadow-soft-glow`；嵌入已有卡片时关闭 |

**禁止用法**

- 禁止传 `class="rounded-[20px]"` 之类的圆角覆盖。圆角固定 `rounded-3xl`。
- 禁止用它包整页容器。它是「内容卡片」，页面外壳仍由 `AppLayout` 负责。
- `interactive` 为真时禁止再在内部嵌 `<button>` 或 `<a>`（嵌套可交互元素），要导航请用 `router.push` 或改回普通卡片。

### 8.3 PageHeader

| prop | 类型 | 默认 | 说明 |
|---|---|---|---|
| `title` | `string` | 必填 | 主标题，`headline-lg` |
| `subtitle` | `string` | `''` | 副标题，`body-sm` + `on-surface-variant` |
| `back` | `boolean` | `false` | 显示返回按钮（`btnIcon` + `arrow_back`） |
| `backTo` | `string` | `''` | 指定返回路由；留空则 `router.back()` |
| `flush` | `boolean` | `false` | 去掉自带 `mb-8`；容器已是 `space-y-*` 节奏时传 true |

slot：`#actions`（右侧动作区）、`#leading`（标题前的自定义元素）。

**禁止用法**

- 禁止在页面里再手写 `flex items-center gap-4 mb-8` + `arrow_back` 的标题栏（审计记录 4 处同构）。
- 禁止自行拼接 `{{ $t('app.title') }} - {{ 模块名 }}`。该拼接应由调用方传完整 `title` 决定，避免 4 种拼法各自漂移。
- 禁止用 `class="!mb-0"` 覆盖外边距：需要去掉 `mb-8` 时传 `flush` prop。
- 禁止一个页面出现两个 `PageHeader`。

> **已知偏离**：Favorites / Vocabulary / History 三页仍以 `:title="$t('app.title') + ' - ' + 模块名"` 的形式
> 传拼接串。渲染文本与迁移前逐字相同，但形态仍属本节禁止的「自行拼接」。
> 收敛需要新增 i18n key（改文案），不在表现层批次内，留待文案批次处理。

### 8.4 SectionHeader

| prop | 类型 | 默认 | 说明 |
|---|---|---|---|
| `title` | `string` | 必填 | 区块标题，`headline-md` |
| `subtitle` | `string` | `''` | 可选副说明 |
| `level` | `2\|3\|4` | `3` | 输出 `h2`/`h3`/`h4`，保证标题层级不跳级 |

slot：`#actions`（右侧操作，建议 `btnPrimarySm` / `btnSecondarySm`）。

**禁止用法**

- 禁止用 `PageHeader` 充当区块标题。`PageHeader` 带返回按钮与 32px 标题，用于页面级。
- 禁止手写 `flex justify-between items-center mb-6` + `headline-md` 的区块头（`StatsView:44` 等）。
- 禁止在 `#actions` 放主 CTA 大型按钮；区块内动作一律小档。

### 8.5 StatTile

| prop | 类型 | 默认 | 说明 |
|---|---|---|---|
| `label` | `string` | 必填 | 指标名，`label-md` |
| `value` | `number\|string\|null\|undefined` | 必填 | 数值；`null`/`undefined`/`''` 时显示占位符 |
| `unit` | `string` | `''` | 单位，`body-md` + `on-surface-variant` |
| `icon` | `string` | `''` | 图标名，走 `AppIcon size="md"` |
| `tone` | `'primary'\|'secondary'\|'tertiary'\|'error'\|'neutral'` | `'primary'` | 仅影响图标色 |
| `placeholder` | `string` | `'—'` | 缺数据时显示的字符 |

**禁止用法**

- 禁止在调用方做 `value ?? 0`。**缺数据显示占位符，不是 0** —— 把「没有数据」渲染成 0 是虚假信息，审计已把 AI 降级 0 分列为 🔴 风险。
- 禁止用 `StatTile` 承载比率型指标而不传 `unit`（如 `%`），否则数字含义不完整。
- 禁止在同一组统计里混用不同 `tone` 来表示「重要性」；`tone` 只表达语义分类。

### 8.6 ProgressBar

| prop | 类型 | 默认 | 说明 |
|---|---|---|---|
| `value` | `number` | 必填 | 当前值，自动夹取到 `[0, max]` |
| `max` | `number` | `100` | 上限；`max<=0` 时按 0 处理，避免除零 |
| `tone` | `'primary'\|'tertiary'\|'warning'\|'error'` | `'primary'` | 填充色 |
| `size` | `'sm'\|'md'\|'lg'` | `'md'` | `h-1.5`(6px) / `h-2`(8px) / `h-3`(12px) |
| `label` | `string` | `''` | 无障碍名称 |

**禁止用法**

- 禁止再手写 `<div class="w-full h-2 bg-surface-variant rounded-full overflow-hidden">` 这套（`AssessView:48`、`PracticeView:24`）。
- 禁止用内联 `style="width: …%"` 直接改填充宽度；宽度由 `value`/`max` 计算。
- 禁止用它替代 `QuizProgressBar` 的「奖杯 + 双层反白」形态。那套是答题专属，合并是 P2 的事。
- 禁止在 `max` 未定义的情况传入已换算好的百分比（应传 `max=100`）。

**已知例外**

| 位置 | 形态 | 为什么不用 ProgressBar |
|---|---|---|
| `HomeView` 每日复习目标条 | 手写 `<div>` + `bg-gradient-to-r from-tertiary to-primary` | `ProgressBar` 的 `tone` 只有单色四档，无法表达「进行中」的渐变语义；改单色会丢信息。按 §11 登记为例外，不视为待收敛项 |

### 8.7 Tag

| prop | 类型 | 默认 | 说明 |
|---|---|---|---|
| `tone` | `'primary'\|'tertiary'\|'neutral'\|'warning'\|'error'` | `'neutral'` | 5 档语义色，映射见 §7 |
| `size` | `'sm'\|'md'` | `'md'` | `sm`=`px-2 py-0.5`+`label-sm`，`md`=`px-2.5 py-1`+`label-md` |
| `label` | `string` | `''` | 文案；也可用默认 slot 传入 |

**禁止用法**

- 禁止传 `class="rounded-lg"` 或 `rounded-xl` 改形状。`Tag` 恒为 `rounded-full` 胶囊。
- 禁止用它实现 `StatusBadge` 的 `success`/`danger`/`info` 语义 —— 那是 admin 的 `BadgeTone`，查 §7 映射表转换后再用。
- 禁止在 `Tag` 内放图标以外的可交互元素（按钮、链接）。
- 禁止用它做「按钮」。可点击的筛选 chip 属于将来的 `ChipGroup`，不是 `Tag`。

### 8.8 ListRow

| prop | 类型 | 默认 | 说明 |
|---|---|---|---|
| `title` | `string` | 必填 | 主文案，`body-md`，超长截断 |
| `subtitle` | `string` | `''` | 副文案，`body-sm` + `on-surface-variant` |
| `clickable` | `boolean` | `false` | 整行可点击，带 hover 底与键盘焦点 |
| `divider` | `boolean` | `true` | 行底分隔线（`border-outline-variant/40`） |

slot：`#leading`（左侧图标圆/头像）、`#trailing`（右侧动作或状态）、`#default`（替换 title/subtitle 的自由内容）。

**禁止用法**

- 禁止在 `clickable` 行内再放 `<button>` 并同时绑定整行点击 —— 事件会双触发。
- 禁止用 `ListRow` 做表格行；admin 的表格继续用 `AdminDataTable`。
- 禁止给整行加 `shadow-soft-glow`。行是「卡片内的行」，抬升由外层 `AppCard` 负责。
- 禁止在 `#trailing` 放超过 2 个按钮；多动作请收进行内菜单。

---

## 9. 本轮明确不做的事（及原因）

> 本节记录 **P1 建立契约那个批次**的范围，不是当前约束。以下三行已被后续批次超越，其余仍有效：
>
> - `StatusBadge` 提升 → **已完成**（P3，commit `615ca6d`），现为 `ui/StatusBadge.vue`
> - 「修改 `admin/` 下任何文件」→ 已发生三批：P3（`615ca6d`）把 `admin/StatusBadge.vue` 改为转发壳、
>   `admin/tableTypes.ts` 改为 re-export `BadgeTone`；P4 修正 `AdminJudgeReviewView` 两处不存在的色类；
>   P4 收敛 `AdminChartCard` / `AdminFilterBar` / `AdminStatCard` / `NoticeEditorDrawer` 的圆角与内边距
> - 「修改 `views/` 下任何页面」→ **6 页已迁至组件层 + 10 页仅收敛任意值**，见 §0 落地状态

| 项 | 原因 |
|---|---|
| `admin/FormField`、`ConfirmDialog` 提升为 `ui/` 版本 | **仍推迟**：用户端暂无调用方，转发壳的 props 兼容无法被真实调用验证。等出现第一个真实调用点再做（`ChipGroup` 缺 `ConfirmDialog` 的批量操作场景是候选） |
| 修改 `admin/` 下任何文件 | 提升取消，admin 组件保持原状 |
| 修改 `views/` 下任何页面 | 本轮只建立契约与组件，接线是 P1/P2 的独立任务 |
| 修改 `i18n/locales` | `ConfirmDialog` 的提升一并推迟，无需新增 `common.confirm` / `common.cancel` 文案键 |
| 收敛 `card-shadow` / `soft-shadow` / `p-5` / `rounded-[20px]` | 需要动 `main.css` 与数十处页面，属迁移批次的工作，不是契约层的工作 |
| 提供 `AppIcon size="inherit"` | `StreakDisplay` / `AppLogo` 靠 scoped 类 (0,2,0) 继承外层字号，加 inherit 档会与之争抢特异性 |

---

## 10. 验收方式

本轮（契约 + 组件）验收：

1. `npm run type-check` 通过
2. `npm run build` 通过
3. `git status` 中的新增文件仅限 `components/ui/` 下 8 个 `.vue` 与本文件
4. 全站 `views/` 与 `components/` 既有文件零改动

将来接线后的验收（供后续批次使用；基线已按 6 页已迁 + 10 页仅收敛后的实测值重算，2026-11-15，StatsView 二批收口后）：

**基线一律以已提交状态为准**（`git grep … HEAD`），不取工作区。原因见下方第二条警示。

```bash
# L1a 任意值圆角（半径族，含 rounded-t/-b/-l/-r；目标 0；当前 31 @ ca365a1）
# ⚠️ 旧命令 grep -ro "rounded-\[[0-9]*px\]" 漏掉带方向后缀的形式（WordDetailCard 的 rounded-t-[28px]），
#    旧 L1b 的 grep -v "^rounded-" 又把这类一起滤掉，于是 37 + 149 = 186 ≠ 全量 187 —— 有 1 处谁都没数。
#    此处改用半径族正则，L1a + L1b 恒等于全量实测（当前 31 + 127 = 158）。
git grep -ohE "rounded(-[trblse]{1,2})?-\[[0-9]*px\]" HEAD -- "src/*.vue" "src/*.ts" | wc -l

# L1b 除圆角外其他属性的任意值（目标 0；当前 127 @ ca365a1）
git grep -ohE "[a-z-]+-\[[^]]*\]" HEAD -- "src/*.vue" "src/*.ts" | grep -vE "^rounded" | wc -l

# 图标字号是否为死类名（目标：全部换成 text-icon-lg，保 24px、零位移；当前 0 @ ca365a1 —— 已清零）
# ⚠️ 不要把这条的「目标 0」理解成「尺寸改成 20px」。这些处现状被兜底规则压成 24px，写什么都没生效。
#    目标是「让写法有效且像素不变」= 全换 text-icon-lg；尺寸要不要回到作者原意是**设计修正**，另立批。
git grep -n "material-symbols-outlined[^\"]*text-\(xs\|sm\|base\|lg\|xl\|2xl\|3xl\)\b" HEAD -- "src/views/*.vue" | wc -l

# 手写 soft-glow 字面量（目标 0；当前 0 @ ca365a1 —— 已清零）
git grep -n "shadow-\[0_4px_20px_rgba(51,58,72,0.05)\]" HEAD -- "src/*.vue" "src/*.ts"

# 不存在的色类（目标 0；当前 0 @ ca365a1 —— admin 审核页两处已于 P4 修正）
git grep -n "success-container\|text-success" HEAD -- "src/*.vue" "src/*.ts"

# 组件层直写图标（目标 0；当前 107 @ ca365a1，已排除 AppIcon.vue 自身）
# L2 只扫 views/，组件层的直写图标它看不见，必须单列一条
git grep -n "material-symbols-outlined" HEAD -- "src/components/*.vue" | grep -v "AppIcon.vue" | wc -l

# L6 非 M3 调色板直用（bg-white / text-black / green-* / red-* 等 Tailwind 调色板，目标 0；当前 11 @ ca365a1）
# 口径：**按类名出现计**。按「点位」计则更少（同一行的 `border-l-green-500` + `border-l-red-400` 算 1 处）——
# 类名口径可 grep 复现，点位口径会随写法漂移（把 border-l-green-500 拆成 border-l-4 + border-green-500 就从 1 变 2）。
git grep -oE "\b(bg|text|border|border-[lrtb]|from|via|to|ring|divide|placeholder)-(white|black|(gray|red|orange|amber|yellow|lime|green|emerald|teal|cyan|sky|blue|indigo|violet|purple|fuchsia|pink|rose|slate|zinc|neutral|stone)-(50|100|200|300|400|500|600|700|800|900|950))" HEAD -- "src/*.vue" "src/*.ts" | wc -l
```

> **PowerShell 下复跑本节命令的两条前置条件**（2026-11-15 实测）：
> 1. 先设 `[Console]::OutputEncoding = [System.Text.Encoding]::UTF8` 与 `$OutputEncoding`。
>    默认按 CP936 解码时，含中文注释的行会与下一行粘连（本次为 `ui/FormHint.vue:18`），
>    `-n` 口径少算 1 行：全量 108 而非 109、排除 `AppIcon.vue` 后 106 而非 107，与锚点 107 对不上。
>    `-o` 只输出 ASCII 匹配串，不受影响。L2 / L3 / L4 / L5 用 `-n` 输出整行，受本条约束；
>    L1a / L1b / L6 用 `-o`，不受约束。
> 2. 正则里的 `[^"]` 在 PowerShell 参数传递中会被吞引号并报 `Invalid range end`，须写 `[^\"]`。
>
> **L5 计数口径：按文件行计，以 `-n` 为准**（当前每行至多 1 处命中，`-n` 与 `-o` 同为 109）。
> 将来若出现同一行两处 `material-symbols-outlined`，两者会分叉，一律以 `-n` 为准，不用 `-o` / `-c` 求和覆写。

> 基线值来自 `docs/前端UI审计与组件契约.md` §7，随每批迁移完成后更新本节。**每次更新必须重跑上面六条命令取实数，不许估算或按批减扣。**
>
> **每条基线后面挂提交锚点（`当前 N @ <short-sha>`）**：`HEAD` 会往前走，不挂锚点的数字过两个月就无从对账——
> 有人拿契约里的 31 去核，跑出来 27，会以为漏改了 7 处，而不是「契约写的是旧状态」。
> 锚点必须与本段数字**在同一次提交里**更新：改数字就改锚点，锚点不动的数字一律视为无效。
>
> **交付里写「工作区状态」时，一律贴命令输出，不写形容词**：`git status --porcelain | wc -l` + 若有则列文件名。
> 「工作区干净」这种说法曾在 2026-11-15 被打回过一次——当时实际有 3 个未提交文件（`i18n/en-US.ts`、`i18n/zh-CN.ts`、`HistoryView.vue`），与本批无交集，但陈述本身不实。
> 数字能核，形容词不能。
>
> **锚点 = 达成该数值的那次提交，不是 `HEAD`**。复核仍用 `HEAD`；若 `HEAD` 上跑出来的数 ≠ 锚点数值，先查中间提交有没有动过任意值，然后二选一：
> ① 更新锚点（数值变了）；② 在锚点旁注明 `@ 71549f6 + 中间未变`（数值没变，只是 `HEAD` 前进了）。
> 2026-11-15 实测过一次：`HEAD` 已走到 `2cbebfc`、锚点仍是 `@ 71549f6`，两处数值完全相同，属第 ② 种，不必改数字。
>
> **2026-11-15 复核（`2a50d43`）**：`HEAD` 已走到 `2a50d43`，`ca365a1..HEAD` 共 **5 个提交**
> （`176f81c` / `67e4a94` / `b3da9e9` / `1f48795` / `2a50d43`），七条基线实测仍为
> `31 / 127 / 0 / 0 / 0 / 107 / 11`，逐条未变，属规则 ②，**锚点保持 `@ ca365a1` 不变**，不改数字、不改锚点。
> 其中 `2a50d43` 给 `buttonStyles.ts` 扩了反色两档（见 §5），不影响任意值与图标计数。
> 每批交付前先跑 `git log -1` 确认 `HEAD` 未再前进。
>
> **`2a50d43` 的 commit message 写「L1b 88→88」**：穷举 11 种口径（含只扫 `views` 78 / 只扫 `*.vue` 126 /
> 去重 68 / 按行 136 / 全量含 `rounded` 158）与历史锚点（127 / 127 / 133）均得不出 88，
> **来源不可考，一律以 §10 口径 127 为准，不附归因**。该 message 排版亦有破损，数字段落不作证据。
>
> **盘点图标字号时的三个「非档位但合法」值**（2026-11-15 定位，勿当成漏网）：
> `32px` = `AppLogo` 的 `.logo-glyph` 继承外层 `text-icon-xl`；`35px` ×2 = `StreakDisplay` 的 `.flame-glyph` 外体与内心，外层是 `text-flame-sm`（`streakStyles.ts:52`，完整字面量）；
> 两者都靠 scoped 类 `font-size:1em` 继承，按 §8.1 **豁免**，不在 L2/L1b 的待办里。
>
> ⚠️ 第一条命令会把**注释里的示例**一并计入：`ui/AppCard.vue:22-23` 的 `rounded-[20px]` 是禁用示例，
> 不是真实代码。因此 L1a 的 31 中有 2 处属注释，**实际待迁移 29 处**。后续批次收口时不必消灭这 2 处，
> 除非改写注释措辞。其余各条命令同理，凡命中注释需人工排除。
>
> ⚠️ **为什么命令里带 `HEAD`**：基线一旦取工作区，别人的在途改动会让数字自己漂。
> 2026-11-15 本批实测就撞上过：同一棵代码，`HEAD` 读到 L1b **145**（`min-h` 8），工作区读到 **146**（`min-h` 9），
> 差值来自 `VocabQuizView.vue` 里一行**尚未提交**的 `min-h-[220px]`。两份报表各自都没错，但谁也说服不了谁。
> 规则定死：**基线只认已提交状态**。要看本批进度就临时去掉 `HEAD`，并与 `HEAD` 的差值逐条对上，对不上就说明有在途改动。
>
> **L1 为什么必须拆成 L1a / L1b**：§11.1 的规则管的是「所有属性上的任意值」，基线却长期只统计圆角。
> 结果是「本批改了 7 处」与「基线只减 3」在两份报表里永远对不上 —— 不是改少了，是另外 4 处（`h-[12px]`→`h-3`、`w-[12px]`→`w-3`）
> 根本不在旧基线里。拆开后每批可写「A 类 N 处（L1a −a、L1b −b）」，两边能相加对上。

当前 L1a 31 / L1b 127 / 0 / 0 / 0 / 107 / L6 11 的残留分布（供下一批选题参考）：

| 指标 | 主要残留位置 |
|---|---|
| 任意值圆角 L1a 31 | `ProfileView`(8)、`ErrorBookView`(3)、`WordReviewDialog`(3)、`WordDetailCard`(2，含 1 处 `rounded-t-[28px]`)、`AppCard` 注释(2)、`AiCard`(2)、`VocabularyGoalDialog`(2)、`AudioPlayer`(2)，其余 7 处各 1（`LoginView` / `RegisterView` / `ForgotPasswordView` / `ForbiddenView` / `GrammarQuizView` / `TranscriptPanel` / `FeedbackPanel`）。`StatsView`、`WritingScorePanel`、`ListeningTypeCard`、`AiFeedbackPanel` 已归零 |
| 图标原生字号 43 | `ErrorBookView`、`PracticeView`、`GrammarQuizView`、`VocabQuizView`、`ProfileView`、`LoginView`、`RegisterView`、`ForgotPasswordView` |
| soft-glow 字面量 3 | `FeedbackPanel:76`、`TranscriptPanel:2`、`VocabQuizView:113` |
| 不存在的色类 0 | 已清零。`AdminJudgeReviewView:83` 改 `bg-tertiary-container/50 text-on-tertiary-container`、`:96` 改 `text-tertiary hover:bg-tertiary-container/20`，依据 §7 的 `success → tertiary` 映射，与 `AdminQuestionsView:94` 的既有写法逐字一致 |
| 组件层直写图标 107 | `AiSidebarContent`(12)、`VocabularyGoalDialog`(9)、`AudioPlayer`(6)、`AiActionBar`(5)、`TopAppBar`(5)、`WritingScorePanel`(4)、`WordDetailCard`(4)、`AiCard`(4)、`admin/AdminTopbar`(4)、`admin/AdminSidebar`(4)、`WordReviewDialog`(4)。<br>其中 **10 处属 `ui/` 组件自身**（`AppLogo` 3、`StreakDisplay` 3、`FormHint` 2、`EmptyState` / `ErrorState` 各 1），按 §8.1 **全部豁免**：前两者靠 scoped 类继承字号，`FormHint` 需 16px、`EmptyState`/`ErrorState` 需 48px，`AppIcon` 均无对应档。<br>真实待迁 = 107 − 10 = **97**（`LoadingState` / `BaseDialog` 两处已改完） |

**L1b 的属性分组只贴命令产物，不手填表格**（手填必然与总数对不上，2026-11-15 就发生过一次：表内可见项相加 137，而 L1b 实为 145）：

```bash
git grep -ohE "[a-z-]+-\[[^]]*\]" HEAD -- "src/*.vue" "src/*.ts" | grep -vE "^rounded" | sed 's/-\[.*//' | sort | uniq -c | sort -rn
```

```
     19 shadow
     16 scale
     14 max-w
      9 min-h
      9 grid-cols
      8 w
      7 text
      7 z
      6 h
      6 bg
      5 gap
      4 min-w
      3 max-h
      2 transition
      2 ml
      2 leading
      2 -translate-y
      1 tracking
      1 pt
      1 border-t
      1 border-r
      1 border-l
      1 backdrop-blur
```

**各项之和 = 19+16+14+9+9+8+7+7+6+6+5+4+3+2+2+2+2+1+1+1+1+1+1 = 127 = L1b 总数。** 对不上就说明表被手改过，重跑命令覆盖。

**`shadow` 22 处的 A/B 已全部处置完（2026-11-15）**：等于 `shadow-soft-glow` 的 **3 处已改 → 0**（`TranscriptPanel:2`、`FeedbackPanel:76`、`VocabQuizView:113`，L3 归零）；`AiCard:29` 的「软阴影 + 内嵌 1px 环」**1 处 → 保留**（原子复合阴影，理由见 §11.1）；**品牌色 10 处 → §3 白名单例外**；**中性黑 8 处保留**（`GrammarQuizView` 7 处 + `VocabQuizView` 1 处，均为「词块抬升」语义，无等值令牌）。`scale` 16 处仍未分类。

**图标尺寸的全量口径（两条命令分工，不是口径分裂）**：

```
图标尺寸不统一的全量 = L2（具名档用错，如 text-xl）
                     + L1b 的 text 子组里属于图标的任意值（如 text-[20px]）
2026-11-15 收口前 = 43 + 9 = 52
2026-11-15 收口后 = 0 + 0 = 0（L2 43 处全换 text-icon-lg；9 处任意字号已在上批清零）
```

两条命令各管一半，**报总数时必须两个都提**，只说 L2 会漏掉任意值那一半。不把 L2 正则扩成「也匹配 `text-[Npx]`」的理由：L2 的定义就是「具名原生字号」，一扩会让历史基线突变、与过去所有批次不可比。

> **但这两类写法的实际渲染都是 24px（2026-11-15 实测）**：`main.css:274` 的
> `:where(.material-symbols-outlined):not([class*="text-icon-"]){font-size:24px}` 声明在 `@tailwind utilities` 之后，
> 与 `.text-[20px]` 同为 (0,1,0)，**同特异性后置者胜**，于是 `text-[20px]` / `text-[16px]` / `text-xl` 全被吃掉，图标恒 24px。
> 所以这两类都是**死类名**：修的时候要按「实际渲染 24px」判断是否等值，不能按字面值算 ——
> `text-[20px]`→`text-icon-md` 看着等值，实际是 24px→20px 的 −4px 位移；`text-[20px]`→`text-icon-lg` 才是零位移。

---

## 11. 硬规则

### 11.1 任意值分两类，不许混称「等值」

**适用范围**：本节的 A/B 判定**对所有属性通用，不只圆角** —— `h-[12px]`→`h-3` 与 `rounded-[24px]`→`rounded-3xl` 是同一种操作（逐像素相等的换名），`shadow-[…]` / `text-[…]` / `gap-[…]` / `max-w-[…]` 同理。任何一批都不得只给圆角做分类，再把其他属性的任意值笼统记为「保留」。基线的口径也据此拆成 §10 的 L1a（圆角）/ L1b（其他属性），两边必须能相加对上。

| 类 | 判定 | 处置 | 记录要求 |
|---|---|---|---|
| **A 类** | 契约内存在**逐像素相等**的令牌（24 / 16 / 12 / 8 / 2px …） | 直接替换 | 交付说明可写「等值替换」，无需额外授权 |
| **B 类** | 契约内**没有等值档**（20px / 200px / 13px / 52px …） | 二选一：① 保留原值，登记例外；② 经批准就近取档 | **必须写明「就近对齐」与实际像素位移**，禁止写成「等值」 |

理由：「等值」与「就近取档」是两种不同的授权。前者不改像素，后者改，必须逐条登记，否则交付说明里看不出任何位移。

**判定细则（可复算，不许凭档位名猜）**：

1. **先取令牌实际值**。权威来源两个，必须一致：`node -e "const t=require('tailwindcss/defaultTheme');console.log(t.borderRadius.sm, t.lineHeight['3'], t.spacing['3'])"` 与构建产物 `dist/assets/index-*.css` 里的 `.rounded-sm{border-radius:.125rem}`。本项目 `tailwind.config.js` 用 `extend` 覆盖，**未被覆盖的档位仍是框架默认值**，不能因为「配置里没写」就断定档位不存在。
2. **字号与行高要分开判**。`text-[…]` 的 fontSize 令牌把行高捆在一起（`label-xs` = 10/**14**，`tailwind.config.js:125），所以 `text-[10px]`→`label-xs` 会连带把行高 +2px，属**位移**，不能用。但 `leading-[12px]` 有独立令牌 `leading-3` = 12px，**可以单独换**，换完配对关系仍是 10/12（2026-11-15 已按此改完 `StatsView` 两处）。
3. **配对登记写清「谁不能动、谁可以动」**。只说「成对保留」会让后来者以为两个都不能碰；必须写成「`text-[10px]` 不动（无等值字号档），行高由 `leading-3` 承担」。
4. **位移为 0 才是 A 类**。只要算出来的 px 有变化（哪怕 1px），就是 B 类就近取档，必须逐条登记位移，禁止写成「等值」。

已发生的 A 类 —— **已改**（零位移，无需登记位移，只记依据）：

| 位置 | 原值 | 现值 | 等值依据 |
|---|---|---|---|
| `StatsView:87` 热力图格子 | `rounded-[2px]` | `rounded-sm` | 0.125rem = 2px；同文件 `:51` 图例方块原本就在用 `rounded-sm` |
| `StatsView:66,73` 标签 | `leading-[12px]` | `leading-3` | 0.75rem = 12px |
| `WritingScorePanel:2`、`AiFeedbackPanel:2` | `rounded-[24px]` | `rounded-3xl` | 1.5rem = 24px |
| `ListeningTypeCard:10` | `rounded-[16px]` | `rounded-2xl` | 1rem = 16px |
| `TranscriptPanel:2`、`FeedbackPanel:76` | `shadow-[0_4px_20px_rgba(51,58,72,0.05)]` | `shadow-soft-glow` | 配置值逐字相同；实测两种写法的 computed `box-shadow` 都是 `rgba(51,58,72,0.05) 0px 4px 20px 0px` |
| 9 处图标字号：`AudioPlayer:18/32/59/66/80/107`、`TranscriptPanel:5/16`、`ListeningTypeCard:13` | `text-[20px]`×6、`text-[24px]`×2、`text-[16px]`×1 | `text-icon-lg` | 兜底规则使这些值**实际都渲染 24px**（见 §10 说明）；`text-icon-lg` = 24/24，零位移 |
| `VocabQuizView` 题目卡 `shadow-[0_4px_20px_rgba(51,58,72,0.05)]` | `shadow-soft-glow` | 配置同值（L3 就此归零） |
| `VocabQuizView:119/271/284/289/302` 图标字号（`text-[14px]`×2、`text-[28px]`×3） | `text-icon-lg` | 同「9 处」同理：实际渲染 24px → 24px |
| **全站 41 处具名档图标字号**（`ErrorBook` 8、`GrammarQuiz` 11、`VocabQuiz` 8、`Profile` 6、`Login` 2、`Register` 2、`Practice` 2、`ForgotPassword` 1） | `text-sm/lg/base/xl/2xl/3xl` | `text-icon-lg` | 全部在 `.material-symbols-outlined` 上，被兜底压成 24px；换 `text-icon-lg` 零位移，且让写法首次生效 |

> **那 9 处图标字号的特殊说明**：作者写的是 20px / 16px，但 `main.css:274` 的兜底规则从未让它们生效（图标恒 24px）。
> 本批一律换 `text-icon-lg`（24px），**保持用户当前看到的像素不变**，顺带把死类名变成有效类名（行为自此可预期）。
> 若要恢复作者原意（20/16px），属**设计变更**，必须另立「设计修正批」并带截图，不得混在等值替换里。

已发生的 B 类 —— **已改**（逐条登记位移）：

| 位置 | 原值 | 现值 | 位移 | 说明 |
|---|---|---|---|---|
| Favorites 行卡、搜索外框 | `rounded-[20px]` | `rounded-2xl` 16px | −4px | 20px 无令牌，就近并入 16px |
| Favorites 搜索外框 | `p-5` 20px | `p-6` 24px | +4px | 归入 §2 标准卡档 |
| Favorites 行卡 | `p-5` 20px | `p-4` 16px | −4px | 归入 §2 行卡档，与 `rounded-2xl` 配对 |
| Favorites 模块标签 | `text-xs` 12px | `Tag size="sm"` → `label-sm` 11px | −1px | `Tag` 无 12px 档 |
| `NoticeEditorDrawer:50` 通知预览块 | `p-5` 20px | `p-4` 16px | −4px | 归入 §2 卡内嵌块档，与 `rounded-2xl` 配对；同批唯一一处档外内边距 |

**保留**（要么已进契约，要么是真例外）：

| 位置 | 处理 |
|---|---|
| Vocabulary 统计卡 ×3、Vocabulary 行卡、History 行卡、AssessView 指标块 ×2、HomeView 复习块与状态行、StatsView 三格（均 `p-4`） | **已由 §2 第三档「行卡 / 卡内嵌块」覆盖**，属契约内写法，不再是例外，也不必逐条登记 |
| Vocabulary 复习卡 `min-h-[200px]` | **真例外**：spacing 只有 48=192 / 52=208，无 200px 等值档，保留原值以免卡片高度位移 |
| `LearningView:131` 词汇大卡 `min-h-[200px]` | **真例外**，同上。同一 200px 值在项目内共 2 处，都不改动 |
| 答题页布局值：`max-w-[1192px]` ×4、`grid-cols-[minmax(0,1fr)_340px]` 等三档响应式栅格 ×6 | **真例外**：内容宽度上限与三档断点栅格，Tailwind 无对应令牌，且改动会直接改变两栏比例 |
| 答题页 `min-h-[140px]`（翻译输入域） | **真例外**：与 200px 同理，spacing 无 140 等值档 |
| 答题页图标 `text-[14px]`（帮助）/ `text-[16px]`（提示灯泡） | **真例外**：`AppIcon` 档位为 18/20/24/32/36，两者都落在档位空档上。就近取 18px 会改变小标签内的行高 |
| 听力音量条 `w-[3px]` ×3 + `gap-[2px]` | **真例外**：音频波形条的条宽与间隙，属图形尺寸不是排版间距，不受 §2 管辖 |
| 品牌色投影 **10 处** | 见 §3「登记例外」表（白名单 + 语义约束），语义是彩色发光（`.25`）或反馈底晕（`.08`）。2026-11-15 补登 4 处，其中 error 红是第 4 种颜色 |
| `AiCard:29` 展开态卡片 `shadow-[0_4px_20px_rgba(51,58,72,0.05),inset_0_0_0_1px_rgb(var(--outline-variant)/0.6)]` | **保留（原子复合阴影）**：拆成 `shadow-soft-glow` + `ring-1 ring-inset ring-outline-variant/60` 会**改变层叠顺序** —— 原文是 `drop → inset`（drop 在上），Tailwind 的 ring 排在 shadow 前，拆分后变成 inset 在上。1px inset 贴边、肉眼大概率不可辨，但严格不是 bit 级等价；且 `ring-outline-variant/60` 依赖 `outline-variant` 为 `<alpha-value>` 形式色名，写错会**静默不生成、卡片丢 1px 描边而构建全绿**（与 §11.4 同一类失败模式）。要清需在 `tailwind.config.js` 加 `boxShadow.cardRing`，门槛 ≥3 处复用，当前仅 1 处 |
| `AudioPlayer:16,64`、`TranscriptPanel:2`、`FeedbackPanel:2` 的 `rounded-[20px]` | **保留（`rounded-[20px]` + `p-5` 自成一对，20/20）**：只把圆角改成 `rounded-2xl`(16px) 而 padding 不动，就变成 16/20 —— 该组合不在 §2 配对表里（表里是 `rounded-3xl↔p-8`、`rounded-2xl↔p-6`、`rounded-xl↔p-4`）；要配对就得连 padding 一起改，那是尺寸变更。共 4 处，未到立 `20px` 第四档的门槛（`p-4` 当年 ≥10 处才立），等凑够再一次性立档 |
| `AiCard:14,38` 的 `rounded-[10px]` | **保留**：8px(`rounded-lg`) = −2 与 12px(`rounded-xl`) = +2 **等距**，没有更近的一侧，任选都是硬凑 |
| `VocabularyGoalDialog:27,82` 的 `rounded-[22px]` | **待裁**：`rounded-3xl` = 24px，+2px。两张对比卡，+2 视觉可接受，可下批与其它 22px 统一 |
| `VocabularyGoalDialog:156` 的 `scale-[0.98]` | **待裁**：scale 无 0.98 档（最近 `scale-95`，压感 −0.03）。按钮按下反馈，改则手感变弱 |
| `WordDetailCard:6,15` 的 `rounded-[28px]` / `rounded-t-[28px]` / `max-h-[85dvh]` / `z-[130]` | **待裁（底部面板形状族）**：28px→24px 为 −4px，且 `rounded-t` 与 `sm:` 两处必须同时改；`85dvh`、`130` 均无档（`z-[120]` 已有 `BaseDrawer` 先例）。建议整体立「sheet 形状」一组再动，不要单点改 |
| `GrammarQuizView:95` 的 `rounded-[28px]` | **保留（2026-11-15 裁定）**：全量仅 2 处（本处题目卡 + `WordDetailCard` sheet），都是大面积容器专用圆角，−4px 会削弱容器感；与 sheet 同族，等立「大容器圆角」档 |
| `VocabQuizView` 焦点环 `focus:shadow-[0_0_0_3px_rgba(0,0,0,0.05)]` | **保留（2026-11-15 裁定）**：改 `focus:ring-4` 是 3px→4px 的 +1px，且 shadow→ring 换绘制层，与 `AiCard:29` 同因，收益仅 −1 处 |
| `VocabQuizView` 结果明细 `min-h-[220px]` | 保留：spacing 无 220 档（`min-h-[200px]` 同族），改则卡片高度位移 |
| 7 处 `bg-white dark:bg-*`（`QuizProgressBar:3` + `GrammarQuizView` 6） | **登记待定（亮暗配对错位）**：亮色只有 `surface-container-lowest` 等于纯白，但它的暗色是 `15,14,20` ≠ 现状 `20,19,26`；`surface` 暗色对得上、亮色是 `248,249,252` 差 7 阶。**无零位移解**，属设计决策（这块到底该是 surface 还是 container-lowest），未定前不动 |
| `ProfileView:20` `bg-black/40` | **A 类待做**：`bg-scrim/40` 逐像素等值 —— `--color-scrim: 0 0 0` 且注释写明「不随主题变化，始终纯黑」，`black` 与 `scrim` 同值 |
| `ProfileView:21` `text-white` | **B 类保留**：`on-primary` 亮色 `255,255,255` 但暗色 `56,38,87`，没有跨主题恒白的前景令牌，换过去暗色会变紫 |
| `PracticeView:192` 的 `border-l-green-500` / `border-l-red-400` | **登记**：与 `VocabQuiz:373` 同一违规，本批只改 Vocab（Practice 属在途批次），提交后同处置（`tertiary` / `error`） |
| `StatsView` 热力图 `text-[10px]`×2 | **保留**：字号 10px 无等值档；`label-xs` 是 10/**14**，行高不等值。行高已由 `leading-3`（12px）承担，两者构成 10/12 配对 |
| `StatsView` 热力图 `gap-[3px]`×2 | **保留（图形尺寸）**：列间距与 `heatmapGrid.colWidth = 15`（12+3，`StatsView:293`）联动，改间隙会让月份标签的 `left` 偏移算错 |
| `StatsView` 热力图 `min-w-[680px]`×1 | **保留**：53 列固定宽栅格的横向滚动保底宽度，无等值档 |
| `StatsView` 图表 `h-[300px]`×1 | **保留**：ECharts 容器高度，spacing 无 300 档（`h-72`=288 / `h-80`=320） |
| `StatsView` 星期标签 `pt-[18px]`×1 | **保留**：4.5 无档（`pt-4`=16 / `pt-5`=20），改则星期标签与热力图首行纵向错位 |
| `ErrorBookView` `rounded-[20px]`×3 · `max-h-[85dvh]` · `min-h-[100px]` · `min-w-[50px]` · `w-[90vw]` · `z-[120]` | **整页不进本批，只登记**：A 类为 0，唯一可动的是 3 处 `rounded-[20px]`→`rounded-2xl`（−4px、无收益）；该页是答题族（审计第 3 批）成员，后续要整体迁 `QuizOptionList` / `AnswerFeedback`，现在单独改一趟等于同页改两次。`z-[120]` 与 `BaseDrawer` 同值，沿用既有先例 |

**一条判定纪律（2026-11-15 的教训）**：`StatsView` 这两项一度被归到「B 类 · 一律保留」，理由是「批指令这么写的」。但 B 类的定义是「契约内没有等值档」，而 `rounded-sm`/`leading-3` 恰好**逐像素等值**——把它们记进 B 类表，等于用一句指令把定义改错了。正确做法是：**分类冲突时先提判**（附令牌实测值 + 构建产物证据），由裁定方决定改或显式豁免，不得自行并入 B 类表蒙过去。裁定结果已并入上方「A 类 —— 已改」。

**动别人的在途文件之前，先看它干不干净**（2026-11-15 新增）：

> 改任何页面级文件（哪怕只是等值换类名），先跑 `git status --porcelain -- <file>`；
> **该文件有未提交改动就只登记、不动**，等对方提交后再做。
> 理由：等值替换不改语义，但会混进对方的 `git diff`，对方一保存就冲突，而且他的 review 会看到一堆不属于他的改动。
> 2026-11-15 的答题族批恰好碰到 `ProfileView` / `PracticeView` 是干净的，所以只动了图标字号、8 处圆角未碰——这是**运气，不是流程**。

**答题族抽组件的差异登记（2026-11-15 裁定，不擅自统一）**

> 以下是**设计差异**，不是任意值 A/B 分类，故单列于此，不并入上方「保留」表——
> 塞进 A/B 表会把「无等值档」与「两页本来就该不一样」混为一谈。

| # | 位置 | Vocab | Grammar |
|---|---|---|---|
| 1 | 答案明细背景 | `bg-surface-container-low` | `bg-white dark:bg-*`（L6 违规，按裁定不动） |
| 2 | 明细 padding | `p-4` | `p-3` |
| 3 | 明细 label 字号 | `label-sm`(11) | `text-xs`(12) |
| 4 | 明细 value 字号 | `body-md`(16/24) | `text-sm`(14/20) |
| 5 | 明细形态 | 3 行 + warning 框 | 1 行 |
| 6 | 结果卡标题字号 | `headline-lg` | `headline-md` |

H9 答案明细块**不抽组件**，两页各自保留；`AnswerFeedback` 只覆盖 H8 反馈条。
第 6 处字号差异同样保留：`ResultStats` 不接管标题。

### 11.2 删除非法阴影时必须同时给出替代反馈

`shadow-sm` / `shadow-md` 等非法阴影若承担「可交互」提示，删除时必须同时补一种替代反馈，**边框 / 底色 / 位移三者取一**。只删不加＝制造退化。

已按此处理的四处：

| 位置 | 删除项 | 替代 |
|---|---|---|
| `HistoryView` 行卡片（整行可点） | `hover:shadow-md` | `hover:bg-surface-container/40` + `transition-colors`（底色） |
| `Favorites` 行卡片（行不可点） | `hover:shadow-md` | 无需替代：行本身无点击，标题已有 `hover:underline` |
| `Vocabulary` 行卡片（行不可点） | `hover:shadow-md` | 无需替代：行内只有按钮可点 |
| `HomeView` 每日单词卡（整卡可点） | `hover:shadow-md` | 装饰色块 `group-hover:scale-*` 放大（位移） |

### 11.3 卡片内输入框靠描边界定，不靠底色差

卡片内输入框用 `inputClassOnCard`（底色 `surface`），与 `container-lowest` 卡片的色差只有
Δ7（亮）/ Δ5（暗）。**这是刻意的，不是没做到位**，不要再加深到 `container-low`：

- 可辨性由三层承担：1px `border-outline-variant`、`focus:border-primary`、`focus:ring-2 ring-primary/20`；
- M3 的卡片内输入框本来就靠描边而非底色凹槽界定；
- 加深成 `container-low` 会让输入框看起来像「凹槽」，与「卡片是白的」这个统一印象打架。

判断标准：把页面缩到 100% 缩放、正常亮度下能一眼找到输入区即可，不追求色块式对比。

### 11.4 Tailwind 类名必须是完整字面量，禁止 `${var}` 拼接

**规则**：凡是带透明度后缀（`bg-*/NN`、`text-*/NN`、`border-*/NN`、`ring-*/NN`、`hover:bg-*/NN`）的类名，
必须在源码里以**完整字符串**出现，禁止拆成「前缀 + `/NN`」两段再拼接。

```ts
// ❌ 禁止：两个片段都不是 Tailwind 认识的类名，拼出来的值它看不见
const MAP = { primary: 'bg-primary-container' }
const alpha = '/30'
const cls = `${MAP.primary}${alpha}`

// ✅ 正确：完整字面量，Tailwind 扫得到
const MAP = { primary: { 20: 'bg-primary-container/20', 30: 'bg-primary-container/30' } }
const cls = MAP.primary[30]
```

**为什么这条必须单列**：Tailwind 的 JIT 是**文本扫描**，不是运行时求值。拼接出来的类名没有任何
CSS 规则与之对应，而浏览器对未知类名**不报错**。

随之而来的失败是**静默的**：`type-check` 绿、`build` 绿、控制台无警告，只有肉眼能看出元素少了底色。

更隐蔽的是它**会假装能用**：只要项目里任何其他地方还写着同一个完整字面量，那个类就会被生成，
拼接的写法于是「工作正常」——直到那些字面量被清理掉的那一批，这个组件才突然坏掉，
而 git blame 会指向很久以前那次「没问题」的改动。`EntryCard` 就踩过这个坑（2026-11-14 修复，
commit `5e20a84`）：26 张卡的图标圆一度全靠其他页面的字面量续命。

**验收方式**（可复现，不必改代码）：

```bash
# 正向：只有该组件自己作为扫描源时，类是否仍能生成
npx tailwindcss -c tailwind.config.js -i src/assets/main.css --content "./src/components/ui/XxxCard.vue" -o /tmp/only.css
grep -c 'bg-primary-container\\/30' /tmp/only.css   # 期望 ≥1
```

**自查口径**：在 `src/components/ui/` 或任何 `.ts` 类名常量里看到 `` `${...}` `` 且包含 `bg-` / `text-` /
`border-` 前缀时，先确认拼接结果是否含 `/NN`；含则必须改写。

> 与本条无关（不要误伤）：`buttonStyles.ts` 的 `` `${base} bg-primary hover:bg-primary/90` `` 是安全的
> —— `base` 是布局类，`bg-primary` 与 `hover:bg-primary/90` 本身就是完整字面量。
> 只有「把带斜杠的类拆成两段」才是违规。

### 11.5 等值替换的验收：以计算样式为准，截图只作佐证

**规则**：任何一批「A 类等值替换」，交付前必须跑一段**计算样式探针**（Playwright `getComputedStyle`），
把被改元素的关键属性实测出来，与改动前逐项相等；截图只用来证明「页面能渲染」，**不能用来证明「没变」**。

**为什么不能只截图**：12px→12px、24px→24px 这类改动，肉眼看不出差别，截图既证明不了等值，也证明不了零位移；
反过来，截图能一眼看出的，往往已经是整块塌掉级别的退化，那时早就晚了。像素级等值只有计算样式能作证。

本批（`StatsView`）的实测值与判定：

| 探针 | 实测 | 判定 | 来源 |
|---|---|---|---|
| 热力图格子 | `12px × 12px`，圆角 `2px` | 与 `w-[12px] h-[12px] rounded-[2px]` 逐项相等 | 页面探针 11-14 + 离线探针 11-15 |
| 网格间距 | `column-gap: 3px` / `row-gap: 3px`，`grid-template-rows: 12px ×7` | 未动，且 `h-3` 解析出来正是 12px | 页面探针 11-14 + 离线探针 11-15 |
| 卡片圆角 | `24px`（3 张卡） | `rounded-3xl` = 1.5rem = 24px | 页面探针 11-14 + 离线探针 11-15 |
| 标签行高 | `font-size: 10px` / `line-height: 12px` / `height: 12px` | `leading-3` = 0.75rem = 12px，10/12 配对未破 | 离线探针 11-15 |
| 格子数 / 图表高 | 371 格 / `300px` | 数据与容器未受影响 | 页面探针 11-14 |
| 横向溢出 | `scrollWidth − clientWidth = 0` | 换类名没有引入横向滚动 | 页面探针 11-14 |

> **两种探针的分工**：页面探针（登录 → SPA 内导航 → `getComputedStyle`）同时验证「数据渲染 + 样式」，但要求
> 前端与 8081/8086 全在跑；**服务停着时用离线探针**——写一个只 `<link>` 构建产物 `dist/assets/index-*.css` 的空页面，
> 放上被测类名的元素，量 `getComputedStyle`。两者读的是同一份 CSS，令牌解析值等价，但离线探针证明不了数据与布局，
> 交付时必须标明用的是哪一种。2026-11-15 本批就是服务全停、只跑了离线探针，故未附新截图。

**截图脚本必须先断言页面没有 `vite-error-overlay`**：

```js
const hasOverlay = await page.evaluate(() => !!document.querySelector('vite-error-overlay'))
if (hasOverlay) throw new Error('存在 vite-error-overlay，本张截图不可信，先修编译错误')
```

理由：Vite 的编译失败会盖一层全屏浮层，截图拍下来是「有页面、有导航、内容区空/被盖住」，看上去像「页面正常」，
实际是编译挂了。2026-11-14 本批截图时就撞到过一次（dev server 热更新瞬间报错，重试即消失）——
**这种截图如果直接交，等于用一张假图签字**。同一脚本里还要一并断言 API 无 4xx/5xx、控制台无 error。

**组件替换的追加验收：数同类容器的出现次数，不看截图**

用 `<QuizProgressBar>` 替换 `VocabQuiz` / `GrammarQuiz` 里手抄的进度条时，组件根节点自带
`<div class="flex-1 max-w-md mx-auto relative flex items-center">`，而两页**外层也有同款 div**。
直接在现有 wrapper 里插组件会得到「双层 `max-w-md`」，宽度被压一半 —— 而这个变化**截图上几乎看不出来**（看起来只是"窄了点"）。

验收命令（数出现次数，必须为 1）：

```js
document.querySelectorAll('.max-w-md').length   // 期望 1；若为 2 说明外层没删
```

同理适用于任何「组件自带 layout 外壳」的替换（`AppCard` 自带圆角+内边距、`PageHeader` 自带间距）：
**替换前先确认页面侧是否已有等价外壳，有就一起删**。

**待补证据（2026-11-15 登记，不许忘）**

| 项 | 状态 | 补法 |
|---|---|---|
| `VocabQuizView` 结果页色条（`border-l-tertiary` / `border-l-error`）**缺页面级截图** | ⏳ 触发条件：下次进答题族批次（四件套接入）时一并截 | 触发条件为 `VocabQuizView.vue:579` 的 `isLastQuestion`：`activeQueue.value.length === 1 && q != null && (streaks.value[q.id] || 0) >= 3`，即「队列仅剩 1 题」与「该词连续答对 ≥3 次」同时满足才出现（原写的「连续答对 3 次」不充分）；色值已实测（`rgb(34,197,94)→rgb(0,110,32)`、`rgb(248,113,113)→rgb(186,26,26)`），但 4px 竖线的**位置**只有截图能证 |
| 进度条「整块替换未新增 DOM 层级」的**反向计数**（`ca365a1^` 上量 `max-w-md` 次数） | ✅ 已闭合（静态旁证） | 三层计数：旧 `VocabQuizView.vue` `max-w-md`=1（页面 wrapper，**无 `v-if`，结构恒定**）、新文件=0（wrapper 随块删除）、新文件+组件根=1。模板结构决定渲染后必然 1 层，比「当前这次运行时量到 1」更强 |

### 11.6 组件接入时的事件边界（2026-11-15 裁定）

硬规则「只改表现层、接口 / computed / 事件一律不动」的原始语义是**不改行为**，不是「不改文件字符」。据此：

- **允许纯转发改名**：`@click="selectedAnswer = option.key"` → `@select="selectedAnswer = $event"`、
  `@click="handleFavorite"` → `@toggle="handleFavorite"`。组件只 `emit`、不判断，
  不得在事件路径里加业务分支（条件性 emit、改 payload、吞事件一律不许）。
- **类名判断不算越界**：`optionClass` / `optionKeyClass` 由搬入组件的函数承担，属表现层逻辑，
  不是「事件改动」。
- **原函数体逐字复用时须归一化可选布尔**：别名层写 `isCorrect: props.isCorrect !== false`
  （`undefined` → `true`），保证函数体里的 `!isCorrect` 不会把正确选项误标红；
  `git diff` 应显示「删除 + 新增相同内容」。别名层只做映射，不承担业务语义、不往里加判断。

