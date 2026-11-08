/**
 * 表单控件共用样式。
 * 颜色、边框、聚焦、禁用等状态在此统一，仅按使用场景分「紧凑 / 宽松」两档密度。
 * 新增表单请直接从本文件引入，不要在页面里重复书写控件类名。
 */

/** 共享底座：边框、文字、占位符、聚焦环、禁用态 */
const base =
  'w-full border border-outline-variant text-on-surface placeholder:text-outline transition-colors focus:border-primary focus:outline-none focus:ring-2 focus:ring-primary/20 disabled:cursor-not-allowed disabled:opacity-60'

/** 紧凑密度：管理端表格、抽屉、筛选栏 */
export const inputClass = `${base} rounded-xl bg-surface-container-lowest px-4 py-2.5 font-body-sm text-body-sm`

/** 宽松密度：用户端登录、注册、设置等独立表单 */
export const inputClassLg = `${base} rounded-2xl bg-surface-container-lowest px-4 py-3.5 font-body-md text-body-md`

/** 校验失败态：叠加在 inputClass / inputClassLg 之后使用 */
export const inputErrorClass = 'border-error focus:border-error focus:ring-error/20'
