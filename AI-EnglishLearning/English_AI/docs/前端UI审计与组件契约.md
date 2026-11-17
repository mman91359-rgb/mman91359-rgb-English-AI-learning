# 前端 UI 审计与组件契约

> 审计对象：`English_AI/frontend`（Vue 3.5 + TS + Vite + Tailwind 3.4 + M3 令牌 + Material Symbols）
> 审计日期：2026-11-14　｜　性质：**只读审计**，未改动任何代码、未新增组件、未引入依赖
> 覆盖：`tailwind.config.js`、`src/assets/main.css`、`components/ui/*`（5 个）、`components/admin/*`（12 个）、`src/views` 全部 **34** 个页面、`mocks/writing.ts`、`api/writing.ts`、`services/writingScoring.ts`

---

## 0. 结论摘要

1. **存在 1 个 P0 级系统性缺陷：图标字号令牌全线失效。** `main.css` 的 `.material-symbols-outlined{font-size:24px}` 写在 `@tailwind utilities` 之后，与 `text-icon-*`、`text-lg` 等工具类同为单类选择器、同优先级，后写者胜。已在构建产物 `dist/assets/index-DPeJXL20.css` 中核对：工具类位于字节 39 681–41 369，图标规则位于 62 771。**结论：所有写在图标 `<span>` 上的字号类均为死代码，图标恒为 24px。** 这解释了「`text-icon-3xl` 的空态图标和 `text-sm` 的行内图标看起来一样大」的现象。修复点在 `main.css` 一处（改为 `@layer base` 或前移到 `@tailwind` 之前），但它决定后面 60 处图标字号是否可修——必须排在第 1 位。
2. **三套视觉语言并存**：`buttonStyles.ts`（胶囊 + 42/36px）、用户端页面（方角 `rounded-xl` + `py-4`）、答题页（手写卡 + 任意阴影）。主按钮形状分裂最严重：**20 处 `bg-primary` 按钮用 `rounded-xl`**，与令牌的 `rounded-full` 直接冲突。
3. **任意值泛滥但可归并**：任意圆角 **125** 处，其中 **99 处（79%）是 16px/24px**，而 `rounded-2xl`=16px、`rounded-3xl`=24px 已是 Tailwind 默认值——即 79% 的"例外"其实是令牌的重复书写。
4. **组件层：admin 端已成型、用户端在重造。** `StatusBadge`、`ConfirmDialog`、`AdminFilter*` 已被写作模块的用户端页面 import（`WritingHistoryView`、`WritingPracticeView`），说明"admin 私有"这个目录边界已被业务打穿；同时用户端有 6 处手写状态胶囊、4 处手写空/错态、2 处手写模态、1 处手写分页。
5. **假数据集中在写作模块 + localStorage**：写作 10 道静态题、3 组 mock 评分、降级 0 分占位报告，其余模块无造数，但有 6 处 localStorage/sessionStorage 承载业务状态，跨设备即丢。

---

## 1. 审计方法与判定依据

| 项 | 说明 |
|---|---|
| 读取方式 | 34 个 `.vue` 逐个整文件通读（非抽样），按 `views/` → `views/admin/` → `views/writing/` 三批推进 |
| 令牌基线 | `tailwind.config.js` 的 `borderRadius` / `fontSize` / `boxShadow` / `colors` + `main.css` 的 `--color-*` |
| 组件契约基线 | `buttonStyles.ts`（层级/尺寸/四态）、`formStyles.ts`（两档密度 + 校验态）、`docs/管理员端UI设计契约V2.md` §8「禁止硬编码 hex/字号」 |
| 失效判定 | 对"类名是否真的生效"不靠推测：取 `dist/assets/index-*.css` 实际字节序验证（见 §0.1 与 §2.1） |
| 计数口径 | 任意值 = `[…]` 语法；图标原生字号 = 图标 `<span>` 上出现 `text-xs/sm/base/lg/xl/2xl/3xl`；均含 `/60` 等修饰符 |

**不在本次范围**：交互逻辑 bug、接口契约、性能、i18n 完整性（仅在 §5 附一条观测）、无障碍全量（仅记录与组件重复相关的部分）。

---

## 2. 表 1 · 令牌使用偏差

> 「应改为」列给的是**可直接落地的类名**，不是抽象建议。凡涉及新增令牌的行，均注明"需先开令牌"。

### 2.1 P0 · 图标字号：60 处写法全部无效（根因 1 处）

**根因**：`src/assets/main.css:243-247` 的 `.material-symbols-outlined { font-size: 24px }` 位于 `@tailwind utilities`（`main.css:14`）之后。

**证据**：`dist/assets/index-DPeJXL20.css` 中 `.text-icon-md{…}` @40 979、`.text-lg{…}` @41 369，而 `.material-symbols-outlined{…font-size:24px…}` @62 771。同为 (0,1,0) 特异性，后者覆盖前者。

**修复点（1 处，不动 60 处）**：将 `main.css:243` 起的图标基础规则移入 `@layer base`，或整体前移到 `@tailwind base` 之前。修完后下列类名才开始按令牌渲染。

| 文件 | 行 | 现值 | 应改为 |
|---|---|---|---|
| `components/ui/EmptyState.vue` | 3 | `text-icon-3xl`（期望 48px，实渲染 24px） | 修根因后无需改类；若暂不修根因，改 `style="font-size:48px"` |
| `components/ui/LoadingState.vue` | 3 | `text-icon-2xl` | 同上 |
| `components/ui/ErrorState.vue` | 3 | `text-icon-3xl` | 同上 |
| `components/admin/AdminStatCard.vue` | 6 | `text-icon-md` | 同上 |
| `components/admin/BaseDrawer.vue` | 23 | `text-icon-md` | 同上 |

**分文件清单（图标改用原生字号，共 60 处 / 13 文件）**——修根因后需逐个映射到 `text-icon-sm/md/lg/xl/2xl/3xl`：

| 文件 | 处数 | 代表行（现值 → 应改为） |
|---|---|---|
| `views/GrammarQuizView.vue` | 14 | `:18 text-2xl`→`text-icon-lg`；`:103/:117/:121 text-sm`→`text-icon-sm`；`:105/:193 text-base`→`text-icon-md`；`:128 text-xs`→`text-icon-sm`；`:181 text-3xl`→`text-icon-xl`；`:249/:255 text-lg`→`text-icon-md`；`:266/:274 text-xl`→`text-icon-md` |
| `views/VocabQuizView.vue` | 8 | `:119/:289 text-[14px]`→`text-icon-sm`；`:271/:284/:302 text-[28px]`→`text-icon-lg`；`:172/:176/:256/:314 text-2xl/xl`→`text-icon-md` |
| `views/ErrorBookView.vue` | 8 | `:25 text-2xl`→`text-icon-lg`；`:64 text-lg`→`text-icon-md`；`:137/:154/:228/:268/:269 text-sm`→`text-icon-sm`；`:158 text-2xl`→`text-icon-lg` |
| `views/VocabularyView.vue` | 7 | `:34 text-xl`→`text-icon-md`；`:49/:105 text-lg`→`text-icon-md`；`:146 text-sm`→`text-icon-sm`；`:232/:244/:252 text-base`→`text-icon-md` |
| `views/ProfileView.vue` | 6 | `:18 text-[80px]`→`text-icon-3xl`（并评估是否该降至 48px）；`:36 text-xl`→`text-icon-md`；`:79/:84/:89/:102 text-3xl`→`text-icon-lg` |
| `views/HomeView.vue` | 6 | `:26 text-xs`→`text-icon-sm`；`:47/:112/:225 text-2xl`→`text-icon-lg`；`:61 text-xl`→`text-icon-md`；`:71 text-lg`→`text-icon-md`；`:84 text-base`→`text-icon-md`；`:219 text-sm`→`text-icon-sm` |
| `views/ListeningQuizView.vue` | 5 | `:86 text-[14px]`→`text-icon-sm`；`:122 text-[16px]`→`text-icon-sm`；`:114/:167/:222 text-[20px]`→`text-icon-md` |
| `views/TranslationPracticeView.vue` | 5 | `:23/:28 text-[48px]`→`text-icon-3xl`；`:49/:87 text-[18px]`→`text-icon-sm`；`:55/:63/:163 text-[20px]`→`text-icon-md` |
| `views/PracticeView.vue` | 2 | `:134 text-lg`→`text-icon-md`；`:196 text-sm`→`text-icon-sm` |
| `views/LoginView.vue` | 2 | `:47 text-2xl`→`text-icon-lg`；`:60 text-3xl`→`text-icon-xl` |
| `views/RegisterView.vue` | 2 | `:47 text-2xl`→`text-icon-lg`；`:60 text-3xl`→`text-icon-xl` |
| `views/LearningView.vue` | 2 | `:50 text-sm`→`text-icon-sm`；`:179 text-sm`→`text-icon-sm` |
| `views/FavoritesView.vue` | 1 | `:83 text-base`→`text-icon-md` |
| `views/ForgotPasswordView.vue` | 1 | `:25 text-3xl`→`text-icon-xl` |
| `views/HistoryView.vue` | 1 | `:111 text-lg`→`text-icon-md` |
| `views/StatsView.vue` | 1 | `:66 text-[10px]`（文本，非图标）→`text-label-xs` |
| `views/writing/WritingReportView.vue` | 1（观测） | `:26 h-[88px] w-[88px]` 环形内径，非常规尺寸，见 2.2 |

### 2.2 任意圆角：125 处，其中 99 处等于已存在的默认令牌

**取值分布（`src/**/*.vue` 全量）**：

| 现值 | 处数 | 等价令牌 | 应改为 |
|---|---|---|---|
| `rounded-[24px]` | 55 | `rounded-3xl` = 24px | `rounded-3xl` |
| `rounded-[16px]` | 44 | `rounded-2xl` = 16px | `rounded-2xl` |
| `rounded-[20px]` | 12 | 无令牌 | **需先开令牌** `20px`（列表卡专用），或并入 `rounded-2xl` |
| `rounded-[22px]` | 4 | 无令牌 | `rounded-3xl`（22→24 视觉无感） |
| `rounded-[12px]` | 3 | `rounded-xl` = 12px | `rounded-xl` |
| `rounded-[28px]` | 2 | 无令牌 | `rounded-3xl` |
| `rounded-[10px]` | 2 | 无令牌 | `rounded-xl` |
| `rounded-[8px]` | 1 | `rounded-lg` = 8px | `rounded-lg` |
| `rounded-[32px]` | 1 | 无令牌 | `rounded-3xl` |
| `rounded-[2px]` | 1 | 无令牌 | 新增 `rounded-xs`，或直接用 `rounded-sm` |

**按文件分布（views 层）**：`LearningView 15`、`HomeView 11`、`TranslationPracticeView 8`、`ProfileView 8`、`ListeningQuizView 8`、`VocabularyView 5`、`StatsView 4`、`ErrorBookView 3`、`AdminUserDetailView 3`、`OverviewPanels 2`、`FavoritesView 2`、其余 12 文件各 1。

**代表行**：

| 文件:行 | 现值 | 应改为 |
|---|---|---|
| `views/ForbiddenView.vue:3` | `rounded-[24px]` | `rounded-3xl` |
| `views/LoginView.vue:57` / `RegisterView.vue:57` / `ForgotPasswordView.vue:22` | `rounded-[24px]` | `rounded-3xl` |
| `views/HomeView.vue:10,30,41,109,129` | `rounded-[16px]` / `rounded-[24px]` 混排 | 卡 `rounded-3xl`、按钮 `rounded-2xl` |
| `views/HomeView.vue:98,101,208,212` | `rounded-[12px]` / `rounded-[8px]` | `rounded-xl` / `rounded-lg` |
| `views/ProfileView.vue:4` | `rounded-[32px]` | `rounded-3xl` |
| `views/ProfileView.vue:9,99,119,163,251,260,269,278` | `rounded-3xl`(默认) 与 `rounded-[24px]` 混用 | 统一 `rounded-3xl` |
| `views/StatsView.vue:43,109,122` | `rounded-[24px]` | `rounded-3xl` |
| `views/StatsView.vue:87` | `rounded-[2px]` | 新增 `rounded-xs` |
| `views/ErrorBookView.vue:23,85,319` | `rounded-[20px]` | 见上，开 20px 令牌 |
| `views/FavoritesView.vue:10,48` | `rounded-[20px]` | 同上 |
| `views/VocabularyView.vue:12,16,20,32` | `rounded-[16px]` / `rounded-[20px]` | `rounded-2xl` |
| `views/LearningView.vue:28,57,67,82,99,114,129,166,186,197,212,229,241,253` | `rounded-[24px]` / `rounded-[16px]` | `rounded-3xl` / `rounded-2xl` |
| `views/admin/AdminUsersView.vue:59` 等 6 个 admin 页面 | `rounded-[16px]`（表格容器） | `rounded-2xl` |
| `views/writing/WritingPracticeView.vue`（经 `WritingAnswerSheet`） | 见组件内 | 同规则 |

### 2.3 任意阴影：7 处重复定义了 `shadow-soft-glow`

`shadow-[0_4px_20px_rgba(51,58,72,0.05)]` 与 `tailwind.config.js:143` 的 `boxShadow.soft-glow` **完全同值**。

| 文件:行 | 现值 | 应改为 |
|---|---|---|
| `views/ListeningQuizView.vue:58` | `shadow-[0_4px_20px_rgba(51,58,72,0.05)]` | `shadow-soft-glow` |
| `views/ListeningQuizView.vue:81` | 同上 | `shadow-soft-glow` |
| `views/TranslationPracticeView.vue:37` | 同上 | `shadow-soft-glow` |
| `views/VocabQuizView.vue:113` | 同上 | `shadow-soft-glow` |
| `components/listening/TranscriptPanel.vue:2` | 同上 | `shadow-soft-glow` |
| `components/listening/FeedbackPanel.vue:76` | 同上 | `shadow-soft-glow` |
| `components/ai/AiCard.vue:29` | 同值 + `inset` 描边 | 拆为 `shadow-soft-glow` + `ring-1 ring-outline-variant/60` |

**自定义阴影（无令牌，需决策）**：

| 文件:行 | 现值 | 应改为 |
|---|---|---|
| `views/GrammarQuizView.vue:95` | `shadow-[0_4px_24px_rgba(0,0,0,0.06)]` | `shadow-soft-glow` |
| `views/GrammarQuizView.vue:151,233,261,270` | `shadow-[0_2px_8px/_10px_rgba(0,0,0,0.08)]` | 新增 `shadow-token-sm`（词块专用），否则退回 `shadow-sm` |
| `views/GrammarQuizView.vue:237,280` | `hover:shadow-[0_4px_16px_rgba(0,0,0,0.12)]` | 同上 |
| `views/VocabQuizView.vue:160` | `focus:shadow-[0_0_0_3px_rgba(0,0,0,0.05)]` | `focus:ring-2 focus:ring-primary/20`（与 `formStyles` 一致） |
| `views/ListeningQuizView.vue:155,176,183`；`views/TranslationPracticeView.vue:95,105,113` | `shadow-[0_4px_14px_rgba(103,85,140,0.25)]` 等 6 处渐变按钮投影 | 新增 `shadow-cta-primary/secondary/tertiary` 三档，或统一 `shadow-md` |

### 2.4 非约定形状与 po 档：主按钮两套语言

`buttonStyles.ts` 的 `base` 固定 `rounded-full` + `py-2.5`(42px) / `py-2`(36px)；用户端有 **20 处** 主按钮写成方角 + `py-4`(56px)。

| 文件:行 | 现值 | 应改为 |
|---|---|---|
| `views/PracticeView.vue:103,140,218` | `bg-primary … py-4 rounded-xl` | `btnPrimaryBlock`（或新增 `btnPrimaryLg` 保持 56px 但形状回归胶囊） |
| `views/AssessView.vue:40,89` | 同上 | 同上 |
| `views/GrammarQuizView.vue:322`；`views/VocabQuizView.vue:402` | 同上 | 同上 |
| `views/ErrorBookView.vue:249` | `py-2.5 rounded-xl` | `btnPrimarySm` |
| `views/FavoritesView.vue:80`，`views/VocabularyView.vue:46,266` | `px-4/6 py-2/3 … rounded-xl` | `btnSecondarySm` / `btnPrimarySm` |
| `views/ProfileView.vue:282` | `py-2 rounded-xl` | `btnPrimarySm` |
| `views/ListeningQuizView.vue:67,72` | `px-6 py-3 rounded-xl` | `btnPrimary` / `btnSecondary` |
| `views/ListeningQuizView.vue:155,176,183`；`views/TranslationPracticeView.vue:95,105,113` | `py-4 rounded-[16px]` 渐变 | 新增 `btnCta`（渐变变体）← **形状与尺寸需一次定死** |
| `views/AssessView.vue:12` | `px-5 py-2.5 rounded-xl border` | `btnSecondary` |

> **决策点**：`rounded-xl` 方角按钮是"答题页专属风格"（更像答题卡）还是"漏改"？本审计建议按后者处理——因为同一页面内既出现 `rounded-xl` 主按钮又出现 `rounded-full` 取消按钮（`ErrorBookView:249/257`），风格冲突在一个视口内可见。

### 2.5 未定义色类：2 处静默失效

`tailwind.config.js` 无 `success` 色。以下类**不存在，编译后不产生任何样式**，表现为"徽章没有底色、文字为默认色"：

| 文件:行 | 现值 | 应改为 |
|---|---|---|
| `views/admin/AdminJudgeReviewView.vue:83` | `bg-success-container text-on-success-container` | `bg-tertiary-container text-on-tertiary-container` |
| `views/admin/AdminJudgeReviewView.vue:96` | `text-success hover:bg-success-container/20` | `text-tertiary hover:bg-tertiary-container/30` |

> 这是本次唯一"写了但完全不生效"的色类问题；其余 `text-tertiary` 等语义正确。

### 2.6 硬编码底色 / 色值

| 文件:行 | 现值 | 应改为 |
|---|---|---|
| `views/GrammarQuizView.vue:22,95,151,196,233,261,270` | `bg-white dark:bg-surface…`（7 处） | `bg-surface-container-lowest`（暗色自动跟随，无需 `dark:` 分支） |
| `views/VocabQuizView.vue:30`；`components/quiz/QuizProgressBar.vue:3` | `bg-white dark:bg-surface` | `bg-surface-container-lowest` |
| `views/HomeView.vue:581` | `border-top: 5px solid rgba(30,30,40,0.88)` | `rgb(var(--color-inverse-surface) / 0.92)`（与同文件 `:562` 已用的令牌对齐） |
| `views/StatsView.vue:210` | 中文阈值数组字面量 | 移入 `i18n`（见 §5 补充观测） |

---

## 3. 表 2 · 重复模式清单（同语义独立实现 ≥3 次）

| # | 语义名 | 出现文件（处数） | 各实现的差异点 | 建议组件名 |
|---|---|---|---|---|
| 1 | **答题选项按钮**（A/B/C/D 圆标 + 选中/正确/错误三态） | `PracticeView.vue:43-79`、`AssessView.vue:66-78`、`ListeningQuizView.vue:129-146`、`ErrorBookView.vue:183-198` 与 `337-352`（同文件内两套） | 边框宽度 `border` vs `border-2`；选中色 `primary` vs `tertiary`；圆标尺寸 `w-8` 统一但字号 `text-label-lg` vs `text-sm`；ErrorBook 版少了圆标内的 ✓/✗ 图标 | `ui/QuizOptionList.vue`（props: `options` / `modelValue` / `reveal` / `correctKey`；slot: `#key`） |
| 2 | **答题判定反馈条**（✓/✗ + 文案，30% 容器色） | `PracticeView.vue:111-118`、`VocabQuizView.vue:188-197`、`GrammarQuizView.vue:186-195`、`ErrorBookView.vue:232-242` | 内边距 `p-3` vs `p-4`；错误态文字色 `text-error`（Grammar）vs `text-on-error-container`（其余）；图标尺寸 `mr-1` 位置不一 | `ui/AnswerFeedback.vue`（props: `correct` / `label`；统一用 `on-*-container`） |
| 3 | **整宽收藏按钮** | `PracticeView.vue:127-138`、`VocabQuizView.vue:227-237`、`GrammarQuizView.vue:203-213` | **三者 markup 几乎逐字相同**，仅 `py-3` 一致、`rounded-xl` 一致；差异只在 `aria-pressed` 有无（Grammar 有） | `ui/FavoriteSentenceButton.vue`（props: `favorited`；emit: `toggle`） |
| 4 | **结果页三栏统计**（大数字 + 标签 + 百分比） | `PracticeView.vue:166-179`、`VocabQuizView.vue:350-363`、`GrammarQuizView.vue:298-311` | 字号 `font-display-lg` 一致；标签文案键不同；Vocab 三栏为 已掌握/尝试/正确率（语义不同但版式同）；Grammar 标题 `headline-md` 而另两处 `headline-lg` | `ui/ResultStats.vue`（props: `items: {value,label,tone}[]`） |
| 5 | **页面标题栏**（返回图标钮 + `headline-lg` 标题） | `FavoritesView.vue:3-8`、`VocabularyView.vue:3-8`、`HistoryView.vue:3-9`、`ErrorBookView.vue:3-8` | 标题拼接方式：前两处 `{{ $t('app.title') }} - {{ X }}`，History 同、ErrorBook 同 → 4 处完全同构；`mb-8` vs `mb-6` 不一致 | `ui/PageHeader.vue`（props: `title` / `back` / `#actions`） |
| 6 | **筛选 chip 组**（`rounded-full` + 选中实心 primary） | `HistoryView.vue:16-30 / 35-49 / 54-68`（同文件 3 套）、`ErrorBookView.vue:45-59`、`VocabularyView.vue:57-70`、`LearningView.vue:6-23`、`AdminQuestionsView.vue:15-28`、`AdminJudgeReviewView.vue:7-20` | 字号 `label-sm`（用户端）vs `label-lg`（admin）；高度 `py-1.5` vs `h-9`；未选中底 `surface-container-lowest` vs `border`；`LearningView` 用 `bg-on-surface text-surface` 反色（唯一） | `ui/ChipGroup.vue`（props: `items` / `modelValue` / `size`：`sm|md`） |
| 7 | **入口卡**（圆角卡 + 圆形图标底 + 标题/副标题 + `chevron_right`） | `LearningView.vue:66-142`（6 处）、`ProfileView.vue:251-277`（3 处）、`components/listening/ListeningEntryPanel.vue`（6 处）、`components/translation/TranslationEntryPanel.vue`（6 处）、`components/writing/WritingEntryPanel.vue`（5 处） | 图标圆 `w-10 h-10`（Learning）vs `w-12 h-12`（Profile/Panels）；底色 `/30` vs `/20`；卡片 `rounded-[24px]` vs `rounded-[16px]`；hover 位移 `-translate-y-1`（Profile）vs 仅背景变（其余） | `ui/EntryCard.vue`（props: `icon` / `tone` / `title` / `desc` / `to`；slot `#trailing`） |
| 8 | **状态胶囊**（`rounded-full` + 容器色/文字色配对） | `FavoritesView.vue:68-73`、`ProfileView.vue:132-139` 与 `166-171`、`AssessView.vue:54-56`、`ErrorBookView.vue:89-96`、`AdminJudgeReviewView.vue:82-86`、`AdminActivitiesView.vue:69-75` | **`StatusBadge` 已存在却只有 admin 在用**；用户端 6 处手写，内边距 `px-2 py-0.5` / `px-3 py-1` / `px-2.5 py-0.5` 三档，字号 `text-xs` / `label-sm` / `label-md` 三种 | `ui/Badge.vue`（即 `StatusBadge` 提升，见 §4） |
| 9 | **答题页顶栏**（返回 + 进度/奖杯 + 主题/语言/头像） | `VocabQuizView.vue:17-102`、`GrammarQuizView.vue:11-85`、`ListeningQuizView.vue:4-37`、`TranslationPracticeView.vue:4-17`、`WritingPracticeView.vue:4-49` | 前两者**手写整套**（含奖杯进度条、四按钮组）；后三者走 `AppLayout #topbar` slot；按钮顺序在 5 个页面里各不相同（主题/通知/语言/设置 排列各异）；`QuizProgressBar` 已存在但前两者内联重写 | `layout/QuizHeader.vue`（props: `progress` / `actions`）+ 复用 `QuizProgressBar` |
| 10 | **手写模态**（`fixed inset-0 z-[120]` + `bg-scrim/xx` + panel + `useModalBehavior`） | `VocabularyView.vue:163-273`（`bg-scrim/50`）、`ErrorBookView.vue:278-417`（`bg-scrim/40`）、对照 `ui/BaseDialog.vue:6`（`bg-scrim/45` + `backdrop-blur-[2px]`） | scrim 透明度 3 个值；圆角 `rounded-3xl` vs `rounded-2xl`；关闭钮 `btnIcon` vs `btnIconSm`；标题层级 `headline-md` vs `headline-sm` | 直接用 `ui/BaseDialog.vue`（无新增） |
| 11 | **统计小卡**（数值 + 标签，3 列） | `StatsView.vue:11-40`、`VocabularyView.vue:11-29`、`ProfileView.vue:77-93` | 阴影 `card-shadow`（Stats）vs `shadow-soft-glow` vs 无；数值色 `text-primary/tertiary/error` vs 全 `on-background`；分隔线 Style 不同 | `ui/StatTile.vue`（或复用提升后的 `StatCard`，见 §4） |
| 12 | **图标按钮**（`h-8 w-8 rounded-full` + hover 底色 + focus 环） | `AdminUsersView.vue:102,105,108,111,114`（同一文件 5 次逐字重复）、`HistoryView.vue:151-156`、`VocabularyView.vue:99-106`、`ErrorBookView.vue:299-306` | `AdminUsersView` 的 5 段 class 字符串完全一致（`hover:scale-110 hover:bg-primary-container/30`）却未用 `btnIconSm`；用户端用 `btnIconSm` 但缺 `scale` | `btnIconSm`（已存在）+ 若需 hover 动效则加 `btnIconSmHover` |

---

## 4. 表 3 · 组件缺口与重叠

> 判定依据之一：**目录边界已被业务打穿**——`WritingHistoryView.vue:129-132` import 了 `admin/AdminFilterBar`、`AdminFilterField`、`AdminFilterSelect`、`admin/StatusBadge`；`WritingPracticeView.vue:130` import 了 `admin/ConfirmDialog`。这说明"管理端专属"已不成立。

| 组件 | 现状 | 处置 | 理由 |
|---|---|---|---|
| `admin/StatusBadge.vue` | 用户端 6 处手写同语义胶囊（§3-8） | **提升为公共** `ui/Badge.vue` | 已被写作模块跨域 import；用户端重复实现 6 次，是三张表里性价比最高的一个组件 |
| `admin/ConfirmDialog.vue` | 用户端无二次确认组件；`ErrorBookView.vue:749` 用原生 `confirm()`；`WritingPracticeView` 跨域 import | **提升为公共** `ui/ConfirmDialog.vue` | 原生 `confirm()` 与 M3 弹窗并列出现，是可见的体验断层；已有实现可直接复用，成本≈移动文件 |
| `admin/AdminFilterBar / Field / Select / Search`（4 个） | 已被 `WritingHistoryView` 使用；用户端筛选靠 §3-6 手写 chip | **提升为公共** `ui/FilterBar` 家族 | 提升后 `HistoryView` 的三行筛选可整体替换；需保留 chip 形态（`AdminFilterSelect` 是原生 `<select>`，与用户端 chip 语言不同）→ 建议提升为 `FilterBar` 容器 + `FilterChips` 两个出口 |
| `admin/AdminPagination.vue` | `HistoryView.vue:246-264` 手写上一页/下一页 | **提升为公共** `ui/Pagination.vue` | 用户端只需要"上一页/页码/下一页"精简版，可作为 `variant="simple"` |
| `admin/AdminStatCard.vue` | 用户端 3 处同版式小卡（§3-11） | **提升为公共** `ui/StatCard.vue` | 结构（label + icon 圆底 + 大数字 + hint）完全可复用；仅需放宽 `tone` 到用户端色板 |
| `admin/UserAvatar.vue` | `VocabQuizView.vue:89-100`、`GrammarQuizView.vue:72-83` 手写 8×8 首字母头像；`ListeningQuizView.vue:33-35`、`TranslationPracticeView.vue:13-15`、`WritingPracticeView.vue:45-47` 再各手写一次 = **5 处** | **提升为公共** `ui/UserAvatar.vue` | 5 处实现里 3 处不支持图片、2 处支持，行为不一致；admin 版已实现 size/图片/兜底 |
| `admin/FormField.vue` | 用户端表单只有 `FormHint`（错误行），无 label/必填/ARIA 关联 | **提升为公共** `ui/FormField.vue` | 用户端表单（登录/注册/设置）靠裸 `<input>` + 无 label，与 admin 的 `aria-describedby` 自动同步能力差一个层级 |
| `admin/AdminDataTable.vue` | 用户端列表全部是卡片流（错题/单词/历史/收藏） | **保持不变** | 用户端是移动优先卡片，套表格会破坏版式；强行提升反而制造第二套不一致 |
| `admin/BaseDrawer.vue` | 用户端无抽屉场景 | **保持不变** | 无消费方，提升等于制造无人使用的公共件 |
| `admin/AdminChartCard.vue` | 用户端图表是 ECharts（`StatsView`、`AbilityRadarChart`） | **暂不处理** | 形态不同（纯 div 条形 vs canvas），合并需重写渲染层，收益低于风险 |
| `admin/ActivityEditorDrawer.vue` / `NoticeEditorDrawer.vue` / `GenerateQuestionsDialog.vue` / `RejectQuestionDialog.vue` / `UserActionDialog.vue` | 业务专属，字段强绑定 admin 契约 | **保持不变** | 提升会把 admin 业务字段泄进 `ui/`，违背分层 |
| `admin/tableTypes.ts` / `userActionTypes.ts` | 类型随组件走 | **随提升迁移** | `BadgeTone` 应随 `Badge` 迁到 `ui/types.ts`；`UserAction` 留在 admin |

**另需新增（当前完全缺失，非"提升"）**：

| 缺口 | 影响页面 | 说明 |
|---|---|---|
| `ui/QuizOptionList` / `ui/AnswerFeedback` / `ui/ResultStats` / `ui/FavoriteSentenceButton` | 5 个答题页 | §3-1~4 的四件套，是答题链路统一的最小集合 |
| `ui/PageHeader` | 4 个列表页 | §3-5；顺带解决"`app.title + 模块名`" 拼接重复 |
| `ui/EmptyInline`（区块级空态） | `ErrorBookView:70-79`、`VocabularyView:259-271`、`ProfileView:185-195` | 现有 `EmptyState` 是整页级（`py-20`），区块级无处可用，导致 3 处手写 |
| `ui/ChipGroup` | 4 文件 6 处 | §3-6 |
| `ui/EntryCard` | 5 文件 26 处 | §3-7；**这是覆盖页数最多的一个缺口** |

**确认的重叠（同一能力两份实现）**：

| 能力 | 已存在 | 重复实现 | 建议 |
|---|---|---|---|
| 答题进度条 | `components/quiz/QuizProgressBar.vue` | `VocabQuizView.vue:29-61`、`GrammarQuizView.vue:21-47`（含奖杯 + 双层 clipPath 反白） | 把"奖杯 + 反白"能力合并进 `QuizProgressBar`，删除内联版 |
| 空/错/载态 | `ui/EmptyState` / `ErrorState` / `LoadingState` | `ProfileView.vue:174-195`（骨架 + 手写错误态）、`TranslationPracticeView.vue:22-33`（手写加载/空态）、`HomeView.vue:223-228`（手写 loading） | 迁移到既有三件套；`ProfileView` 的雷达骨架屏可保留（有独立价值）但错误态必须换 |
| 模态 | `ui/BaseDialog` | `VocabularyView` 复习弹窗、`ErrorBook` 同类题弹窗 | 换用 `BaseDialog` |

---

## 5. 表 4 · 假数据清单

> 按要求**不建议删除**，只标注治理方式。风险分级：🔴 会被误当真结果　🟡 换设备/换人即失效　⚪️ 仅展示层兜底

### 5.1 静态题库

| 位置 | 内容 | 风险 | 治理方式 |
|---|---|---|---|
| `src/mocks/writing.ts:4-136` | 10 道写作题（5 类 × CET4/6） | 🔴 学生端可正常练习提交，题面不在库 | 保留为 `PREVIEW_TOPICS`，在 `types/writing.ts` 标注 `source: 'mock'`；后端题库就绪后按 `topicKey` 切源，mock 转 fallback |
| `src/api/writing.ts:15` (`TOPIC_CACHE`) + `:49-51` (`fetchWritingTopics`) | 直接 `Promise.resolve(静态数组)`，签名与真实 API 一致 | 🔴 调用方无法区分真假 | 返回值加 `isPreview: true`，页面顶部已有 `writing.preview.badge` 可作为消费点 |
| `src/services/writingScoring.ts:24-44` | 按 `hash(topicId+content)` 确定性选 3 组 fixture；字数越界强制 0 号/2 号 | 🔴 分数由哈希决定，无评分语义 | 保留为 `MockWritingScoringService`（接口已抽象）；接入真实评分后仅切换 `writingScoringService` 实例 |
| `src/mocks/writing.ts:139-251` | 3 套完整评分（13/10/5 分） | 🟡 与 `mocks` 同生命周期 | 同上，随 3 一起下线 |
| `views/AssessView.vue:155-163` | 本地 `moduleName` 硬编码表 `{1:'词汇',2:'语法',3:'翻译',4:'听力'}` | 🟡 与 `@/config/modules` 双份口径（后者已有 6 模块） | 改为 `import { moduleName } from '@/config/modules'`，与 `PracticeView:235` 一致 |
| `views/ListeningQuizView.vue:317` | `group.startsWith('cet6-2022-12-1') ? '2022.12 CET6' : …` | 🟡 真题来源写死一套 | 由后端返回 `sourceLabel`，前端不做前缀判断 |
| `views/HomeView.vue:451` | `getWeekDayLabels()` 返回 `['M','T','W','T','F','S','S']` | ⚪️ 英文单字母，中文环境不切换 | 并入 `i18n` 的 `stats.weekdays` |

### 5.2 AI 降级占位

| 位置 | 内容 | 风险 | 治理方式 |
|---|---|---|---|
| `src/api/writing.ts:132-149` (`degradedReport`) | 评分失败返回 `rawScore:0 / level:'NEEDS_WORK' / issues:['AI 评分暂不可用…']` | 🔴 **0 分会被当成真实得分**展示在报告页与历史趋势图 | 报告页对 `scoreVersion==='degraded'` 显示"未评分"态而非 0 分。勘误（2026-11-17）：原文称「`degraded` 的 `status` 是 `'FAILED'`，趋势图已过滤 ✓」属审计漏判——后端 `aiScored=false` 经 `toSubmission` 确实推导为 `FAILED`，但 `WritingHistoryView` 曾硬编码 `status:'SCORED'` 覆盖该值，导致趋势图误收 0 分。已于 `9f99c03` 修正为 `status: submission.status`，并按 `scoreVersion` 显示中性「未评分」徽章；报告页/提交页 toast/本地面板/AI 成绩卡/AI 上下文均已按 `degraded` 降级（批次 2–5）。 |
| `views/ListeningQuizView.vue:325-328` | `feedbackMessage` 无解析时回退 `listening.feedbackPending` | ⚪️ 文案层兜底，可接受 | 保留 |
| `views/ListeningQuizView.vue:220-226` | "核心短语"固定输出 `corePhrasesEmpty` | ⚪️ | 保留，但区块标题应标注"暂无"而非留白 |
| `views/TranslationPracticeView.vue:256-258` | `handleLookup` 只 toast "查词功能开发中" | ⚪️ 点击有反馈，无死链 | 保留 |
| `views/writing/*`（`aiComingSoon` 系列） | `WritingEntryPanel` 的 AI 入口 toast 占位 | ⚪️ | 保留 |

### 5.3 本地 localStorage / sessionStorage

| 位置 | 键名 | 风险 | 治理方式 |
|---|---|---|---|
| `src/api/writing.ts:27-42` | `recall:writing:{userId}:drafts` / `:favorites` | 🟡 写作草稿与收藏仅存本机 | 全量迁到后端（`/exercise/writing/draft`），localStorage 转离线缓存 |
| `src/composables/useNotifications.ts:15-45` | `notifications`（2 条种子通知 + 相对时间"刚刚/2小时前"） | 🔴 通知永不消失、永远"未读"，红点常亮 | 后端通知接口就绪后删除 `seedNotifications`；红点改为由未读数驱动 |
| `views/LearningView.vue:355-391` | `dailyTarget_vocab` / `dailyTarget_grammar` | 🟡 与 `userStore.dailyNewWords` 双份目标口径 | 并入用户偏好（`userStore.setVocabularyGoals`），删除本地键 |
| `views/GrammarQuizView.vue:811,839` | 读同一 `dailyTarget_grammar` | 🟡 同上 | 同上 |
| `views/PracticeView.vue:322-361` | `practice-progress-{moduleType}`（**含完整题目数组与判题结果**） | 🟡 数据量可达数百 KB，超 5MB 配额即静默失败 | 改为只存 `{ids, answers}`，或迁到服务端续答 |
| `views/VocabQuizView.vue:691-748` | `vocab-session-progress:v2`（含词池/队列/连击数） | 🟡 会话态跨标签页冲突 | 同上；至少加 `try/catch` 兜底（当前 `:723` 无保护） |
| `views/stores/user.ts:207` / `request.ts:34` | `token` / `user`（sessionStorage） | 🟡 属既定方案，非假数据 | 保留 |

### 5.4 页面硬编码数字

| 位置 | 数值 | 风险 | 治理方式 |
|---|---|---|---|
| `views/HomeView.vue:323-324` | `dailyNewWords ?? 10`、`dailyReviewWords ?? 5` | 🟡 与 `LearningView:358-361`（vocab:20/grammar:10）、`ProfileView` 口径不一致 | 抽 `config/learningDefaults.ts` 单点 |
| `views/LearningView.vue:358-361` | `{ vocab: 20, grammar: 10 }` | 🟡 同上 | 同上 |
| `views/VocabQuizView.vue:994` | 连续答对 `Math.min(3, …)` = 3 次判定掌握 | ⚪️ 业务参数，但散落在视图里 | 抽 `config/constants.ts`（`MASTERY_STREAK`） |
| `views/ListeningQuizView.vue:385` / `views/TranslationPracticeView.vue:268` / `views/ErrorBookView.vue:799` | `selectListeningQuestions(…, 5)`、`selectTranslationQuestions(…, 5)`、`generateSimilar({count:5})` | ⚪️ 三处都是 5，无命名 | 抽 `DEFAULT_SET_SIZE` |
| `views/StatsView.vue:197,210` | 星期标签 `['一'…'日']`、档位 `['0分钟','1~10分钟',…]` | 🔴 中文硬编码，英文界面下混排 | 移入 `i18n`（`stats.weekdays` / `stats.minutesTiers`） |
| `views/StatsView.vue:336,361` | ECharts tooltip `'学习时长: {value} 分钟'`、y 轴名 `'分钟'` | 🔴 同上 | 同上 |
| `views/VocabQuizView.vue:644-661` | `instantHintMessage` 4 段中文兜底文案 | 🔴 同上 | 移入 `i18n`（`learning.instantHint.*`） |
| `views/HistoryView.vue:497-515` | `getGrammarErrorHint` 10 条中文语法提示 | 🔴 同上 | 移入 `i18n` 或由后端返回 |
| `views/AssessView.vue:15,27,31,35,43,93` | "稍后再测/本次答对/当前等级/能力分/进入首页/完成测评" | 🔴 整页中文直写 | 补 `assess.*` 键 |
| `views/VocabularyView.vue:14,18,27,35,41,50,119,130,179,233,245,253,261,263,269` | 15 处中文直写（单词总数/已掌握/智能添加/没记住/记住了…） | 🔴 同上 | 补 `vocabulary.*` 键 |
| `views/ProfileView.vue:33,343,347,358,360` | "上传中…/请选择图片文件/头像更新成功/昵称不能为空" | 🔴 同上 | 补 `profile.*` 键 |
| `views/ErrorBookView.vue:26,270,294,376,380,383,398,405,413` | 同类题弹窗整段中文 | 🔴 同上 | 补 `errorBook.*` 键 |

**补充观测（不在四类内，但与 UI 一致性直接相关）**：`i18n` 绕过共 **约 40 处**，集中在 `AssessView`、`VocabularyView`、`ErrorBookView`、`ProfileView`、`StatsView`、`VocabQuizView`。这批页面在 `en-US` 下必然是中英混排——建议在 §6 的第 3、4 批迁移中一并处理（同一文件本来就要改）。

---

## 6. 表 5 · 迁移顺序

**优先序公式**：`优先级 = 被复用组件数（覆盖广度） ÷ 风险系数`。风险系数按"是否触及判题链路 / 续答状态 / 会话存储"给 1（纯展示）/ 2（本地状态）/ 3（判题或续答）。

| 批次 | 页面 | 本批引入/使用的公共件 | 覆盖广度 | 风险 | 为什么排这一批 |
|---|---|---|---|---|---|
| **第 1 批**（令牌归一，零结构改动） | ① `LoginView`　② `RegisterView`　③ `ForgotPasswordView` | `inputClassLg` / `FormHint` / `btnPrimaryBlock` / `Logo`（均已就位，只需清 `rounded-[24px]`、`text-3xl`、`h-[52px]`、空 `btnIcon`） | 3 页但**统一了 4 个共用件的调用方式** | ★1 纯展示，无判题无存储 | 这 3 页是表单族模板；改完即可冻结"认证类页面范式"，后续新增页面直接抄。同时可顺手验证 §2.1 根因修复是否让 `text-icon-*` 生效——**用最小的页面验证最大的改动** |
| **第 2 批**（列表族，回收 4 处手写） | ① `FavoritesView`　② `VocabularyView`　③ `HistoryView` | `ui/Badge`（提升）、`ui/PageHeader`（新）、`ui/ChipGroup`（新）、`ui/Pagination`（提升）、`EmptyState`/`ErrorState`（复用） | **每页 4–5 个公共件**，是全项目覆盖最密的一批 | ★1~2（仅 `VocabularyView` 有复习弹窗） | 3 页共用"标题栏 + chip 筛选 + 卡片列表 + 空/错态"同一骨架，一次抽取三页同时受益；`VocabularyView` 的手写模态正好验证 `ui/BaseDialog` 可替代性 |
| **第 3 批**（答题族前半，建立答题契约） | ① `AssessView`　② `PracticeView`　③ `ErrorBookView` | `ui/QuizOptionList`、`ui/AnswerFeedback`、`ui/ResultStats`、`ui/FavoriteSentenceButton`（4 件新增）、`ui/ConfirmDialog`（提升，替换 `confirm()`） | 4 个新组件 × 3 页，且后续 4 个答题页直接复用 | ★2（`ErrorBookView` 有本地判分兜底，`PracticeView` 有 sessionStorage 续答） | 先把"选项 / 反馈 / 结果 / 收藏"四件套在**逻辑最简单的三页**上定型（无连击、无语音、无拖拽）；`PracticeView` 是答题页的"标准形态"，定型后 `VocabQuiz`/`GrammarQuiz` 只是套壳 |
| **第 4 批**（答题族后半，收口重灾区） | ① `VocabQuizView`　② `GrammarQuizView`　③ `ListeningQuizView` | `layout/QuizHeader`（新）、`QuizProgressBar`（合并奖杯+反白）、`ui/UserAvatar`（提升）、第 3 批四件套 | 5 个共用件 × 3 页；同时消化 §2.1 中 27 处图标、§2.3 中 13 处阴影 | ★3（判题 + 连击 + 语音 + 续答 + 拖拽，四类状态全在这一批） | 风险最高，必须放在契约已冻结之后：`VocabQuiz`/`GrammarQuiz` 是唯一"整套手写顶栏 + 手写卡片 + 手写阴影"的页面（占全部任意阴影的 54%），改它们只能一次到位，不能边改边定契约 |

**未列入首批的 22 页**（`HomeView`、`StatsView`、`ProfileView`、`SettingsView`、`LearningView`、`TranslationPracticeView`、`writing/*` 3 页、`admin/*` 7 页、`Forbidden`、`components` 内嵌面板 5 个）按同一公式续排：

- `admin/*` 7 页实际已高度合规（`rounded-[16px]` 是唯一系统性偏差，机械替换即可，风险 ★0）→ 可随时插入任一批次作为"低成本搭车"。
- `HomeView` / `ProfileView` / `StatsView` / `LearningView` 四页是 §3-7（`EntryCard`）与 §3-11（`StatTile`）的主战场，建议作为第 5 批整体推进（≥26 处重复实现集中在此）。
- `writing/*` 3 页受 §5.1 假数据治理约束，**等写作题库接后端后再迁**，否则等于给 mock 版式做二次投入。

---

## 7. 交付边界与验收口径

**本次未做**（按要求）：未改动任何 `.vue` / `.ts` / `.css` / 配置；未新增文件至 `src/`；未提出任何新增依赖。

**每批完成后的验收（可直接照做）**：

1. `npm run type-check` 与 `npm run build` 通过（无新增警告）。
2. `dist/assets/index-*.css` 中 `.material-symbols-outlined{font-size` 的字节位置 **小于** 任一 `.text-icon-` 与 `.text-lg{` —— 这是 §2.1 已修复的机器可验证判据。
3. 全量残留扫描应归零（或下降到已登记白名单）：
   - `grep -ro "rounded-\[[0-9]*px\]" src | wc -l`
   - `grep -rn "material-symbols-outlined[^\"]*text-\(xs\|sm\|base\|lg\|xl\|2xl\|3xl\)\b" src/views | wc -l`
   - `grep -rn "shadow-\[0_4px_20px_rgba(51,58,72,0.05)\]" src`
   - `grep -rn "success-container\|text-success" src`（应为 0）
4. 暗色模式逐页目视：`bg-white` 归零后不应再出现"暗色下白卡片"。

**当前基线值（供回归对比）**：任意圆角 125 / 图标原生字号 60 / `soft-glow` 重复 7 / 未定义色类 2 / 方角主按钮 20 / `bg-white` 9 / i18n 直写约 40。
