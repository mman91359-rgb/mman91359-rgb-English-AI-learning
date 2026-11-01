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

export function formatNumber(value: number | string | null | undefined, locale?: string): string {
  if (value === null || value === undefined) return '—'
  const number = Number(value)
  if (Number.isNaN(number)) return String(value)
  return number.toLocaleString(locale)
}

/** 管理端统一时间格式：yyyy-MM-dd HH:mm，空值显示 — */
export function formatAdminDateTime(value: string | number | Date | null | undefined): string {
  if (!value) return '—'
  const date = new Date(typeof value === 'string' ? value.replace(' ', 'T') : value)
  if (Number.isNaN(date.getTime())) return String(value)
  const pad = (n: number) => String(n).padStart(2, '0')
  return `${date.getFullYear()}-${pad(date.getMonth() + 1)}-${pad(date.getDate())} ${pad(date.getHours())}:${pad(date.getMinutes())}`
}

/** 后端时间字符串转 datetime-local 控件值 */
export function toInputDateTime(value: string | null | undefined): string {
  if (!value) return ''
  return formatAdminDateTime(value).replace(' ', 'T')
}

/** datetime-local 控件值转后端时间字符串 */
export function fromInputDateTime(value: string): string | undefined {
  if (!value) return undefined
  return `${value.replace('T', ' ')}:00`
}

export function displayOrDash(value: unknown): string {
  if (value === null || value === undefined || value === '') return '—'
  if (typeof value === 'object') return JSON.stringify(value)
  return String(value)
}

export function formatStudyDuration(seconds: number | null | undefined): string {
  if (seconds === null || seconds === undefined) return '—'
  const hours = Math.floor(seconds / 3600)
  const minutes = Math.floor((seconds % 3600) / 60)
  return `${hours}h ${minutes}m`
}

/** 手机号脱敏展示（后端已脱敏，此处兜底处理未脱敏的 11 位号码） */
export function maskPhone(value: string | null | undefined): string {
  if (!value) return '—'
  return /^\d{11}$/.test(value) ? `${value.slice(0, 3)}****${value.slice(7)}` : value
}
