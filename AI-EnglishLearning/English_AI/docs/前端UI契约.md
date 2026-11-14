# 前端 UI 契约

> 适用工程：`English_AI/frontend`（Vue 3.5 + TS + Vite + Tailwind 3.4 + M3 令牌 + Material Symbols Outlined）
> 建立日期：2026-11-14　｜　性质：**规则契约 + 基础组件**，本轮**未在任何页面接线**
> 上游依据：`docs/前端UI审计与组件契约.md`（偏差统计）、`docs/管理员端UI设计契约V2.md` §8（禁止硬编码 hex/字号）

---

## 0. 本文件的效力边界

| 项 | 说明 |
|---|---|
| 本文件规定什么 | 圆角、内边距、阴影、图标、按钮、字号六项的唯一写法，以及 `components/ui/` 下 8 个基础组件的 props 契约 |
| 本文件不规定什么 | 页面布局结构、栅格、断点、动效时长；这些仍按各模块既有设计契约执行 |
| 数值来源 | 全部取自 `tailwind.config.js`、`src/assets/main.css`、`dist/assets/index-*.css` 三处现有令牌，**本轮未新增任何颜色、尺寸、阴影或字号** |
| 当前落地状态 | 契约已建立，8 个组件已创建，**但 34 个页面一处未改**。因此「全站已统一」这句话目前不成立，任何场合都不得这样表述 |

---

## 1. 圆角（唯一四档）

| 用途 | 类名 | 实际值 | 令牌来源 |
|---|---|---|---|
| 卡片、弹窗面板、整块容器 | `rounded-3xl` | `1.5rem` = 24px | Tailwind 默认值（`borderRadius` 为 `extend`，未覆盖 `3xl`） |
| 内嵌块：区块卡片、输入框、表格单元 | `rounded-2xl` | `1rem` = 16px | Tailwind 默认值 |
| 控件：按钮、chip、小徽章 | `rounded-xl` | `0.75rem` = 12px | 项目 `tailwind.config.js` 显式声明 |
| 胶囊：状态标签、图标按钮、进度条 | `rounded-full` | `9999px` | 项目 `tailwind.config.js` 显式声明 |

**禁止**

- 禁止 `rounded-[24px]`、`rounded-[16px]`、`rounded-[12px]`、`rounded-[20px]` 等任意值写法。前三个是上表三档的重复书写；`20px` 无令牌，一律并入 `rounded-2xl`。
- 禁止在同一视图内混用「卡片 `rounded-xl`」与「卡片 `rounded-3xl`」。审计已记录 20 处方角主按钮与胶囊按钮同屏冲突（`ErrorBookView`），该类混用不再新增。
- `rounded-lg`（8px）仅限 ≤24px 的小徽章内部，不得用于卡片。

---

## 2. 内边距（卡片两档 + 列表行一档）

| 场景 | 类名 | 实际值 | 说明 |
|---|---|---|---|
| 卡片 · 紧凑 | `p-6` | 24px | 信息密度高的卡片、统计小卡、表格容器 |
| 卡片 · 常规 | `p-8` | 32px | 内容主体卡片、弹窗正文、报告页段落容器 |
| 列表行 | `px-4 py-3` | 左右 16px / 上下 12px | 所有「一行一个条目」的列表项，覆盖 History / ErrorBook / Favorites |

**禁止**

- 禁止 `p-5`、`p-7`、`px-5 py-2.5` 这类介于两档之间的自选值。`p-5` 目前在 Favorites / ErrorBook 共 30+ 处，属待收敛项，新代码不得再写。
- 同一列表内所有行必须同档；不得出现首行 `p-4`、次行 `p-5`。
- 卡片内边距与卡片圆角必须配对使用：`rounded-3xl` 配 `p-8`（或紧凑场景 `p-6`），不得 `rounded-3xl` 配 `p-4`。

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

## 8. 组件契约（`components/ui/`，8 个）

> 全部为**纯新增**文件，未修改任何既有文件，未在 `views/` 接线。因此下表的「替换对象」列是**未来接线时的对照**，不是已完成的替换。

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
| `tone` | `'surface'\|'container-low'\|'container-high'` | `'container-low'` | 底色三档 |
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

slot：`#actions`（右侧动作区）、`#leading`（标题前的自定义元素）。

**禁止用法**

- 禁止在页面里再手写 `flex items-center gap-4 mb-8` + `arrow_back` 的标题栏（审计记录 4 处同构）。
- 禁止自行拼接 `{{ $t('app.title') }} - {{ 模块名 }}`。该拼接应由调用方传完整 `title` 决定，避免 4 种拼法各自漂移。
- 禁止一个页面出现两个 `PageHeader`。

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

| 项 | 原因 |
|---|---|
| `admin/FormField`、`ConfirmDialog`、`StatusBadge` 提升为 `ui/` 版本 | 本轮无用户端调用方，**转发壳的 props 兼容无法被真实调用验证**。提升推迟到 P2 出现第一个用户端调用点时再做，届时可用真实页面回归 |
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

将来接线后的验收（供后续批次使用）：

```bash
# 任意值圆角（目标 0；当前基线 125）
grep -ro "rounded-\[[0-9]*px\]" src | wc -l

# 图标用原生字号承载（目标 0；当前基线 60）
grep -rn "material-symbols-outlined[^\"]*text-\(xs\|sm\|base\|lg\|xl\|2xl\|3xl\)\b" src/views | wc -l

# 手写 soft-glow 字面量（目标 0；当前基线 7）
grep -rn "shadow-\[0_4px_20px_rgba(51,58,72,0.05)\]" src

# 不存在的色类（目标 0；当前基线 2）
grep -rn "success-container\|text-success" src
```

> 基线值来自 `docs/前端UI审计与组件契约.md` §7，随每批迁移完成后更新本节。
