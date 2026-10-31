/**
 * 日期/数字格式化工具。
 * 保留各页面原有的 Intl 选项，避免迁移后展示格式变化。
 */
export function formatDate(
  value: string | number | Date,
  locale: string = 'zh-CN',
  options: Intl.DateTimeFormatOptions = { year: 'numeric', month: 'long', day: 'numeric' },
): string {
  if (!value) return ''
  const date = new Date(value)
  if (Number.isNaN(date.getTime())) return String(value)
  return date.toLocaleDateString(locale, options)
}

export function formatShortDate(value: string | number | Date, locale: string = 'zh-CN'): string {
  return formatDate(value, locale, { year: 'numeric', month: '2-digit', day: '2-digit' })
}

export function formatDateTime(
  value: string | number | Date,
  locale: string = 'zh-CN',
  options: Intl.DateTimeFormatOptions = { month: 'short', day: 'numeric', hour: '2-digit', minute: '2-digit' },
): string {
  if (!value) return ''
  const date = new Date(value)
  if (Number.isNaN(date.getTime())) return String(value)
  return date.toLocaleString(locale, options)
}

export function formatNumber(value: number | string, locale?: string): string {
  const number = Number(value)
  if (Number.isNaN(number)) return String(value)
  return number.toLocaleString(locale)
}
