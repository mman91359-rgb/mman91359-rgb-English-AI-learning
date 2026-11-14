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

/**
 * 卡片内输入框：用于**容器本身已是 `bg-surface-container-lowest`** 的卡片里。
 *
 * `inputClassLg` 的底色就是 `surface-container-lowest`，放进同色卡片后只剩一圈描边，
 * 输入区与卡片融为一体（Favorites 搜索框、Vocabulary 智能添加都踩过这条）。
 * 本档改用 `bg-surface`，与卡片拉开一档；暗色下同理（容器越浅本档越深）。
 *
 * 选档规则：**输入框底色必须与所在容器差一档**。
 * 容器是 `container-lowest` → 用本档；容器是 `surface` → 用 `inputClassLg`。
 * 不要把两者叠用，也不要自行在调用处覆盖 `bg-*`。
 *
 * 色差只到 Δ7（亮）/ Δ5（暗）就够，**不要加深到 `container-low`**：
 * 可辨性由 1px 描边 + `focus:border-primary` + `focus:ring-2 ring-primary/20` 三层承担，
 * 加深底色会让输入框变成「凹槽」，与「卡片是白的」这个整体印象冲突。
 * 详见 `docs/前端UI契约.md` §11.3。
 */
export const inputClassOnCard = `${base} rounded-2xl bg-surface px-4 py-3.5 font-body-md text-body-md`

/**
 * 校验失败态：叠加在 inputClass / inputClassLg 之后使用。
 * 必须带 !（important）：Tailwind 按颜色名排序生成 .border-error 与 .border-outline-variant，
 * 前者排在前面，不加 important 会被底座边框色覆盖，导致校验失败时边框不变红。
 */
export const inputErrorClass = '!border-error focus:!border-error focus:!ring-error/20'
