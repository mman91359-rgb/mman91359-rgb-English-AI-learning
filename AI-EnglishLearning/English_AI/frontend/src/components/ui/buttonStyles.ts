/**
 * 按钮共用样式。
 * 层级（主 / 次 / 危险 / 幽灵 / 图标）与尺寸在此统一，四种交互态（hover、active、
 * focus-visible、disabled）随变体内置，调用方无需再单独书写状态类。
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
export const btnGhost = `${base} px-4 py-2 text-on-surface-variant hover:bg-surface-container-high/60 active:bg-surface-container-high`

/** 图标按钮底座：定尺寸圆形，图标使用 text-icon-md */
const iconBase =
  'inline-flex shrink-0 items-center justify-center rounded-full text-on-surface-variant transition-colors hover:bg-surface-container-high hover:text-on-surface focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-primary disabled:pointer-events-none disabled:opacity-50'

/** 图标按钮 · 40px：弹窗关闭、列表行操作 */
export const btnIcon = `${iconBase} h-10 w-10`

/** 图标按钮 · 32px：卡片角标、紧凑工具条 */
export const btnIconSm = `${iconBase} h-8 w-8`
