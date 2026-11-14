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
| 当前落地状态 | 契约已建立，12 个组件已创建。**「已迁」按两级口径分别记**：<br>**已迁至组件层：6 页**（HomeView / AssessView / Favorites / Vocabulary / History / LearningView）—— 圆角/图标/阴影/字号四类任意值清零，且页内主体结构已换成 `ui/` 组件；另有 4 个入口面板组件（`WritingEntryPanel` / `TranslationEntryPanel` / `ListeningEntryPanel` 及 LearningView 的语法、词汇 tab）同步迁完<br>**仅收敛任意值：9 页**（admin 的 Users / UserDetail / Questions / Notices / Activities / OperationLogs / JudgeReview + `TranslationPracticeView` / `ListeningQuizView`）—— 只做了圆角、字号、阴影三类任意值替换，**未接** `AppIcon` / `AppCard`（答题页还保留 23 处无令牌的布局值与品牌色投影，见 §11.1）<br>**其余 19 页一处未改**。因此「全站已统一」这句话目前不成立，任何场合都不得这样表述；也不得把这两类 9 页称为「已迁」 |

---

## 1. 圆角（唯一四档）

| 用途 | 类名 | 实际值 | 令牌来源 |
|---|---|---|---|
| 卡片、弹窗面板、整块容器 | `rounded-3xl` | `1.5rem` = 24px | Tailwind 默认值（`borderRadius` 为 `extend`，未覆盖 `3xl`） |
| 内嵌块：区块卡片、输入框、表格单元 | `rounded-2xl` | `1rem` = 16px | Tailwind 默认值 |
| 控件：chip、小徽章 | `rounded-xl` | `0.75rem` = 12px | 项目 `tailwind.config.js` 显式声明 |
| 胶囊：状态标签、图标按钮、进度条 | `rounded-full` | `9999px` | 项目 `tailwind.config.js` 显式声明 |

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

**登记例外：品牌色投影（不收敛，也不许新增第 4 种颜色）**

答题页的主按钮在渐变底色上叠了一层同色系投影，用于「彩色发光」而非「容器抬升」，语义与 `shadow-soft-glow` 不同：

| 类名 | 用于 | 处数 |
|---|---|---|
| `shadow-[0_4px_14px_rgba(103,85,140,0.25)]` | primary 渐变按钮 | 2 |
| `shadow-[0_4px_14px_rgba(12,103,128,0.25)]` | secondary 渐变按钮 | 2 |
| `shadow-[0_4px_14px_rgba(0,110,32,0.25)]` | tertiary 渐变按钮 | 2 |

这 6 处**保留原值**，理由：改成 `shadow-soft-glow` 会让主按钮从「彩色发光」退化为中性灰投影，与输入框的抬升感拉平。新代码若要给按钮加发光，**必须复用上面三种中的一种**，不得自造第四种颜色或第二个模糊半径；要新增请先改本节。

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
> - 「修改 `views/` 下任何页面」→ **6 页已迁至组件层 + 9 页仅收敛任意值**，见 §0 落地状态

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

将来接线后的验收（供后续批次使用；基线已按 6 页已迁 + 7 页仅收敛后的实测值重算，2026-11-14）：

```bash
# 任意值圆角（目标 0；当前基线 37，已处理的 15 页/组件均为 0）
grep -ro "rounded-\[[0-9]*px\]" src | wc -l

# 图标用原生字号承载（目标 0；当前基线 43）
grep -rn "material-symbols-outlined[^\"]*text-\(xs\|sm\|base\|lg\|xl\|2xl\|3xl\)\b" src/views | wc -l

# 手写 soft-glow 字面量（目标 0；当前基线 3）
grep -rn "shadow-\[0_4px_20px_rgba(51,58,72,0.05)\]" src

# 不存在的色类（目标 0；当前基线 0 —— admin 审核页两处已于 P4 修正）
grep -rn "success-container\|text-success" src

# 组件层直写图标（目标 0；当前基线 107，已排除 AppIcon.vue 自身）
# 第二条只扫 views/，组件层的直写图标它看不见，必须单列一条
grep -rn "material-symbols-outlined" src/components --include=*.vue | grep -v "AppIcon.vue" | wc -l
```

> 基线值来自 `docs/前端UI审计与组件契约.md` §7，随每批迁移完成后更新本节。**每次更新必须重跑上面四条命令取实数，不许估算或按批减扣。**
>
> ⚠️ 第一条命令会把**注释里的示例**一并计入：`ui/AppCard.vue:22-23` 的 `rounded-[20px]` 是禁用示例，
> 不是真实代码。因此 53 中有 2 处属注释，**实际待迁移 51 处**。后续批次收口时不必消灭这 2 处，
> 除非改写注释措辞。其余三条命令同理，凡命中注释需人工排除。

当前 37 / 43 / 3 / 0 / 107 的残留分布（供下一批选题参考）：

| 指标 | 主要残留位置 |
|---|---|
| 任意值圆角 37 | `ProfileView`(8)、`StatsView`(4)、`ErrorBookView`(3)、`WordReviewDialog`(3)、`AppCard` 注释(2)、`AiCard`(2)、`VocabularyGoalDialog`(2)、`AudioPlayer`(2)，其余 12 处各 1（`LoginView` / `RegisterView` / `ForgotPasswordView` / `ForbiddenView` / `GrammarQuizView` / `WritingScorePanel` / `WordDetailCard` / `TranscriptPanel` / `ListeningTypeCard` / `FeedbackPanel` / `AiFeedbackPanel`） |
| 图标原生字号 43 | `ErrorBookView`、`PracticeView`、`GrammarQuizView`、`VocabQuizView`、`ProfileView`、`LoginView`、`RegisterView`、`ForgotPasswordView` |
| soft-glow 字面量 3 | `FeedbackPanel:76`、`TranscriptPanel:2`、`VocabQuizView:113` |
| 不存在的色类 0 | 已清零。`AdminJudgeReviewView:83` 改 `bg-tertiary-container/50 text-on-tertiary-container`、`:96` 改 `text-tertiary hover:bg-tertiary-container/20`，依据 §7 的 `success → tertiary` 映射，与 `AdminQuestionsView:94` 的既有写法逐字一致 |
| 组件层直写图标 107 | `AiSidebarContent`(12)、`VocabularyGoalDialog`(9)、`AudioPlayer`(6)、`AiActionBar`(5)、`TopAppBar`(5)、`WritingScorePanel`(4)、`WordDetailCard`(4)、`AiCard`(4)、`admin/AdminTopbar`(4)、`admin/AdminSidebar`(4)、`WordReviewDialog`(4)。<br>其中 **10 处属 `ui/` 组件自身**（`AppLogo` 3、`StreakDisplay` 3、`FormHint` 2、`EmptyState` / `ErrorState` 各 1），按 §8.1 **全部豁免**：前两者靠 scoped 类继承字号，`FormHint` 需 16px、`EmptyState`/`ErrorState` 需 48px，`AppIcon` 均无对应档。<br>真实待迁 = 107 − 10 = **97**（`LoadingState` / `BaseDialog` 两处已改完） |

---

## 11. 两条硬规则

### 11.1 任意值分两类，不许混称「等值」

| 类 | 判定 | 处置 | 记录要求 |
|---|---|---|---|
| **A 类** | 契约内存在**逐像素相等**的令牌（24 / 16 / 12 / 8px） | 直接替换 | 交付说明可写「等值替换」，无需额外授权 |
| **B 类** | 契约内**没有等值档**（20px / 200px / 13px / 52px …） | 二选一：① 保留原值，登记例外；② 经批准就近取档 | **必须写明「就近对齐」与实际像素位移**，禁止写成「等值」 |

理由：「等值」与「就近取档」是两种不同的授权。前者不改像素，后者改，必须逐条登记，否则交付说明里看不出任何位移。

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
| 品牌色投影 6 处 | 见 §3「登记例外」表，语义是彩色发光 |

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
