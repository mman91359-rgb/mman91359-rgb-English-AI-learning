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

/** 弹窗并排双按钮 · 主：与次按钮各占一半宽度 */
export const btnDialogPrimary = `${base} flex-1 bg-primary px-4 py-3 text-on-primary hover:bg-primary/90 active:bg-primary/80`

/** 弹窗并排双按钮 · 次：填充式底色，与主按钮形成层级差 */
export const btnDialogSecondary = `${base} flex-1 bg-surface-container-low px-4 py-3 text-on-surface hover:bg-surface-container-high active:bg-surface-container`

/** 幽灵按钮：无边框，仅悬停时浮现底色 */
export const btnGhostSm = `${base} px-4 py-2 text-on-surface-variant hover:bg-surface-container-high/60 active:bg-surface-container-high`

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
