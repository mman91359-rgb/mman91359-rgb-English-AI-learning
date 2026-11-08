/**
 * 命令式绘制场景（ECharts 画布、canvas、动态内联样式）的颜色取值工具。
 *
 * 这些地方拿不到 Tailwind 语义类，只能用字符串颜色，因此在运行时从
 * `--color-*` CSS 变量读当前主题的实际色值，避免把 hex 写死在代码里。
 * 注意：读取结果不随主题切换自动更新，调用方需自行把 `appStore.isDark`
 * 作为依赖（computed 依赖或 watch）来触发重绘。
 */

/** 令牌名 -> rgb/rgba 字符串；令牌不存在时返回 transparent，便于发现拼写错误 */
export const cssColor = (token: string, alpha = 1): string => {
  if (typeof window === 'undefined') return 'transparent'
  const raw = getComputedStyle(document.documentElement)
    .getPropertyValue(`--color-${token}`)
    .trim()
  if (!raw) return 'transparent'
  const [r, g, b] = raw.split(/\s+/).map(Number)
  if ([r, g, b].some((value) => Number.isNaN(value))) return 'transparent'
  return alpha >= 1 ? `rgb(${r}, ${g}, ${b})` : `rgba(${r}, ${g}, ${b}, ${alpha})`
}
