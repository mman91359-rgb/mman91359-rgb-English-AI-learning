/**
 * 按钮共用样式。
 * 层级（主 / 次 / 危险 / 幽灵 / 图标）与尺寸在此统一，四种交互态（hover、active、
 * focus-visible、disabled）随变体内置，调用方无需再单独书写状态类。
 *
 * 尺寸分三档，按容器密度选档，不要跨档混排：
 *   - 默认档 42px（py-2.5）：表单提交、弹窗底部、页面主 CTA
 *   - 小档   36px（py-2   ）：区块头部、卡片工具条、表格上方的并排动作
 *   - 图标档 40/36/32px   ：只有图标没有文字的场景，见 btnIcon 系列
 *
 * 新增按钮请直接从本文件引入，不要在页面里重复拼装按钮类名。
 */

/** 共享底座：布局、过渡、键盘焦点环、禁用态 */
const base =
  'inline-flex items-center justify-center gap-2 rounded-full font-label-lg text-label-lg transition-all duration-200 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-primary disabled:pointer-events-none disabled:opacity-60'

/** 主按钮：品牌色实心，一个视图内只保留一个主动作 */
export const btnPrimary = `${base} bg-primary px-5 py-2.5 text-on-primary hover:bg-primary/90 active:bg-primary/80`

/** 主按钮 · 大号全宽：登录、注册、提交等独立表单场景 */
export const btnPrimaryBlock = `${base} w-full bg-primary px-4 py-3.5 text-on-primary shadow-md hover:bg-primary/90 hover:shadow-lg active:scale-[0.98] active:bg-primary/80`

/** 次按钮：描边，与主按钮并排时的取消或次要动作 */
export const btnSecondary = `${base} border border-outline-variant px-5 py-2.5 text-on-surface-variant hover:bg-surface-container active:bg-surface-container-high`

/** 次按钮 · 大号全宽 */
export const btnSecondaryBlock = `${base} w-full border border-outline-variant px-4 py-3.5 text-on-surface-variant hover:bg-surface-container active:bg-surface-container-high`

/** 危险按钮：删除、禁用等不可逆操作 */
export const btnDanger = `${base} bg-error px-5 py-2.5 text-on-error hover:bg-error/90 active:bg-error/80`

/**
 * 备用按钮底座：焦点环用 outline-current，跟随按钮自身文字色。
 *
 * 不能靠「在 base 后面再写一个 outline-* 类」来覆盖——同特异性的工具类
 * 谁生效取决于 Tailwind 内部的生成顺序（由 color palette 的键序决定），
 * 不是类名在属性里的先后，结果不可预期。所以这里独立声明一份。
 */
const altBase =
  'inline-flex items-center justify-center gap-2 rounded-full font-label-lg text-label-lg transition-all duration-200 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-current disabled:pointer-events-none disabled:opacity-60'

/**
 * 危险描边按钮：与主按钮并排时的负向动作（「忘了」「不熟」）。
 *
 * 与 btnDanger 的区别只在视觉权重：实心红用于页面上的唯一危险动作，
 * 与另一个并排动作同屏时实心红过重，描边红能让两个按钮平级。
 */
export const btnDangerOutline = `${altBase} border border-error/30 bg-error/5 px-4 py-3 text-error hover:bg-error/10 active:bg-error/15`

/**
 * 第三色实心按钮：与主按钮并排的正向确认动作（如「记住了」）。
 *
 * 主按钮固定 bg-primary，一个视图内只保留一个主动作；
 * 与之并排的确认动作用第三色，避免两个主色按钮互相抢焦点。
 */
export const btnTertiary = `${altBase} bg-tertiary px-4 py-3 text-on-tertiary hover:bg-tertiary/90 active:bg-tertiary/80`

/** 弹窗并排双按钮 · 主：与次按钮各占一半宽度 */
export const btnDialogPrimary = `${base} flex-1 bg-primary px-4 py-3 text-on-primary hover:bg-primary/90 active:bg-primary/80`

/** 弹窗并排双按钮 · 次：填充式底色，与主按钮形成层级差 */
export const btnDialogSecondary = `${base} flex-1 bg-surface-container-low px-4 py-3 text-on-surface hover:bg-surface-container-high active:bg-surface-container`

/** 幽灵按钮：无边框，仅悬停时浮现底色 */
export const btnGhostSm = `${base} px-4 py-2 text-on-surface-variant hover:bg-surface-container-high/60 active:bg-surface-container-high`

/** ——— 反色档：品牌色容器（bg-primary）上的按钮 ——— */

/**
 * 反色按钮底座：形状、字号与常规档一致，唯一差别是焦点环用 on-primary。
 * 常规底座的 focus-visible:outline-primary 在品牌色容器上与底色同色，焦点环会不可见，
 * 所以这里不复用 base，而是单独声明一份。
 */
const inverseBase =
  'inline-flex items-center justify-center gap-2 rounded-full font-label-lg text-label-lg transition-all duration-200 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-on-primary disabled:pointer-events-none disabled:opacity-60'

/** 反色主按钮：品牌色容器上的主动作 */
export const btnPrimaryInverse = `${inverseBase} bg-on-primary px-5 py-2.5 text-primary hover:bg-on-primary/90 active:bg-on-primary/80`

/** 反色次按钮：品牌色容器上的次要动作 */
export const btnSecondaryInverse = `${inverseBase} border border-on-primary/40 px-5 py-2.5 text-on-primary hover:bg-on-primary/10 active:bg-on-primary/20`

/** ——— 小档 36px：区块头部与卡片工具条，图标配 text-icon-sm ——— */

/** 小档 · 主：区块内的唯一主动作（如报告页的重新生成） */
export const btnPrimarySm = `${base} bg-primary px-4 py-2 text-on-primary hover:bg-primary/90 active:bg-primary/80`

/** 小档 · 次：与主按钮并排的次级动作，描边样式 */
export const btnSecondarySm = `${base} border border-outline-variant px-4 py-2 text-on-surface-variant hover:bg-surface-container active:bg-surface-container-high`

/** 小档 · 危险：区块内的负向动作（停用、删除） */
export const btnDangerSm = `${base} bg-error px-4 py-2 text-on-error hover:bg-error/90 active:bg-error/80`

/** 图标按钮底座：定尺寸圆形，图标使用 text-icon-md */
const iconBase =
  'inline-flex shrink-0 items-center justify-center rounded-full text-on-surface-variant transition-colors hover:bg-surface-container-high hover:text-on-surface focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-primary disabled:pointer-events-none disabled:opacity-50'

/** 图标按钮 · 40px：页面返回、独立浮层关闭（图标 24px） */
export const btnIcon = `${iconBase} h-10 w-10`

/** 图标按钮 · 36px：顶栏、弹窗工具条（图标 20px） */
export const btnIconMd = `${iconBase} h-9 w-9`

/** 图标按钮 · 32px：表格行内操作、卡片角标 */
export const btnIconSm = `${iconBase} h-8 w-8`

/** 图标按钮 · 危险 40px：删除、移除收藏等负向操作 */
export const btnIconDanger =
  'inline-flex h-10 w-10 shrink-0 items-center justify-center rounded-full text-on-surface-variant transition-colors hover:bg-error-container/40 hover:text-error focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-error disabled:pointer-events-none disabled:opacity-50'

/** ——— 答题页矩形档 56px：全宽并排双按钮，方角 ——— */

/**
 * 答题页矩形档底座：用于答题结果页底部「返回 / 再来一次」并排按钮。
 *
 * 与 base 的差别只在形状与内距：rounded-xl（非 full）、py-4（56px 高，超出上列三档）；
 * 布局、过渡、焦点环、禁用态与 base 同源，键盘可达性由此补齐
 * （此前这三处页面手写串无 focus-visible，键盘 Tab 到按钮时没有焦点反馈）。
 *
 * 本档为 §5「按钮底座统一 rounded-full」的既定例外（2026-11-21 裁定）：
 * 56px 全宽长条按钮若用 rounded-full 会呈胶囊形，与 py-4 的高度比例不协调。
 */
const quizBase =
  'flex-1 inline-flex items-center justify-center rounded-xl py-4 font-label-lg text-label-lg transition-colors focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-primary disabled:pointer-events-none disabled:opacity-60'

/** 答题页矩形档 · 主：实心品牌色，答题结果页的「再来一次 / 再练一次」 */
export const btnQuizPrimary = `${quizBase} bg-primary text-on-primary hover:bg-primary/90`

/** 答题页矩形档 · 次：卡片底色描边，与主按钮并排各占一半 */
export const btnQuizSecondary = `${quizBase} bg-surface text-on-surface border border-outline-variant hover:bg-surface-variant`

/** ——— 行内档 32px：后台表格操作列「图标 + 文字」小按钮 ——— */

/**
 * 行内档底座：admin 表格 `#cell-actions` 列的专用形态，32px 高、胶囊形、图标配 `size="sm"`。
 *
 * 与 `base` 的差别在密度：更矮（`py-1.5` 而非 `py-2.5`）、更紧（`gap-1` 而非 `gap-2`）。
 * 六个音调共用同一底座，统一补齐 hover / active / focus-visible / disabled ——
 * 原手写串里 `bg-primary`、`bg-error`、`border` 三档全部没有悬停反馈，
 * 表格里鼠标划过时按钮毫无变化，这是本次收敛顺带修掉的缺陷。
 *
 * 注意：本档不做「一个视图只留一个主动作」的限制。后台表格每行都要有
 * 发布 / 删除等动作，实心色仅用于标示该行的主操作，多行之间不构成视觉竞争。
 */
const rowBtnBase =
  'flex items-center gap-1 rounded-full px-3 py-1.5 font-label-lg text-label-lg transition-colors focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-primary disabled:pointer-events-none disabled:opacity-60'

/** 行内档 · 中性：编辑等不改变数据的动作 */
export const btnRowNeutral = `${rowBtnBase} text-on-surface-variant hover:bg-surface-container-high active:bg-surface-container`

/** 行内档 · 主色：该行的主操作（发布、上架） */
export const btnRowPrimary = `${rowBtnBase} bg-primary text-on-primary hover:bg-primary/90 active:bg-primary/80`

/** 行内档 · 危险实心：该行的不可逆动作（删除） */
export const btnRowDanger = `${rowBtnBase} bg-error text-on-error hover:bg-error/90 active:bg-error/80`

/** 行内档 · 描边：状态切换（结束、下架），需要与实心动作区分权重时用 */
export const btnRowOutline = `${rowBtnBase} border border-outline-variant text-on-surface-variant hover:bg-surface-container active:bg-surface-container-high`

/** 行内档 · 第三色文字：审核通过这类正向判定，不抢主色 */
export const btnRowTertiary = `${rowBtnBase} text-tertiary hover:bg-tertiary-container/20 active:bg-tertiary-container/30`

/** 行内档 · 错误文字：审核驳回这类负向判定，与通过按钮并排时两色平级 */
export const btnRowDangerText = `${rowBtnBase} text-error hover:bg-error-container/40 active:bg-error-container/60`

/** ——— 行内图标档 32px：表格操作列里「只有图标」的主色强调按钮 ——— */

/**
 * 行内图标档：admin 表格 `#cell-actions` 列内只有图标、没有文字的操作按钮
 * （用户列表的查看 / 重置密码 / 改角色等）。
 *
 * 与 `btnIconSm` 是**两套语义，不可互换**：
 *   - `btnIconSm` 是中性工具件：hover 只提亮到 `surface-container-high`，无位移反馈；
 *   - 本档是行内主操作：hover 强调到主色（`primary-container/30` + `text-primary`），
 *     并用 `scale-110` / `scale-95` 给出悬停与按下的位移反馈，
 *     使鼠标在密集表格中能定位到当前行。
 *
 * 因此收口时没有把这几处塞进 `btnIconSm` —— 那会同时丢掉主色强调和缩放反馈，
 * 属于改视觉而非整理代码（2026-11-21 裁定，见契约 §5 行内档说明）。
 *
 * 注意：`AdminUsersView` 的禁用 / 启用按钮颜色随行状态切换（`text-error` ↔
 * `text-on-surface-variant`），仍保留 `class` + `:class` 双写，不并入本档。
 */
export const btnIconAction =
  'flex h-8 w-8 shrink-0 items-center justify-center rounded-full text-on-surface-variant transition-all duration-200 hover:scale-110 hover:bg-primary-container/30 hover:text-primary active:scale-95 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-primary disabled:pointer-events-none disabled:opacity-50'


