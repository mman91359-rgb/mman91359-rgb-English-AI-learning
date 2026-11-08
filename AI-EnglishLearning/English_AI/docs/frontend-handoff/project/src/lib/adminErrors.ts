import type { MessageKey } from '@/i18n/zh-CN';

const ERROR_KEY_BY_STATUS: Partial<Record<number, MessageKey>> = {
  400: 'error.badRequest',
  401: 'error.unauthorized',
  403: 'error.forbidden',
  404: 'error.notFound',
  409: 'error.conflict',
};

/** 将接口错误映射为可展示的文案 key */
export function getAdminErrorKey(error: unknown): MessageKey {
  const status = typeof error === 'object' && error !== null && 'status' in error ? Number(error.status) : 0;
  return ERROR_KEY_BY_STATUS[status] ?? 'error.generic';
}
