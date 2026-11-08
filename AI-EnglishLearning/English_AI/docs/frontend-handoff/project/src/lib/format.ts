const EMPTY_TEXT = '—';

/** 将后端 "yyyy-MM-dd HH:mm:ss" 或 ISO 字符串格式化为 "yyyy-MM-dd HH:mm" */
export function formatDateTime(value: string | null | undefined): string {
  if (!value) return EMPTY_TEXT;
  const date = new Date(value.replace(' ', 'T'));
  if (Number.isNaN(date.getTime())) return value;
  const pad = (n: number) => String(n).padStart(2, '0');
  return `${date.getFullYear()}-${pad(date.getMonth() + 1)}-${pad(date.getDate())} ${pad(date.getHours())}:${pad(date.getMinutes())}`;
}

/** 后端时间字符串转 datetime-local 控件值 */
export function toInputDateTime(value: string | null | undefined): string {
  if (!value) return '';
  return formatDateTime(value).replace(' ', 'T');
}

/** datetime-local 控件值转后端时间字符串 */
export function fromInputDateTime(value: string): string | undefined {
  if (!value) return undefined;
  return `${value.replace('T', ' ')}:00`;
}

export function formatNumber(value: number | null | undefined, locale: string): string {
  if (value === null || value === undefined) return EMPTY_TEXT;
  return value.toLocaleString(locale);
}

export function formatStudyDuration(seconds: number | null | undefined): string {
  if (seconds === null || seconds === undefined) return EMPTY_TEXT;
  const hours = Math.floor(seconds / 3600);
  const minutes = Math.floor((seconds % 3600) / 60);
  return `${hours}h ${minutes}m`;
}

export function displayOrDash(value: string | number | boolean | null | undefined): string {
  if (value === null || value === undefined || value === '') return EMPTY_TEXT;
  return String(value);
}

/** 手机号脱敏展示（后端已脱敏，此处兜底处理未脱敏的11位号码） */
export function maskPhone(value: string | null | undefined): string {
  if (!value) return EMPTY_TEXT;
  return /^\d{11}$/.test(value) ? `${value.slice(0, 3)}****${value.slice(7)}` : value;
}
