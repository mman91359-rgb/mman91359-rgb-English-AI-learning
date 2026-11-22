import { del, get, post } from './request'

/** 后端 PageResult 包装 */
interface PageResult<T> {
  records: T[]
  total: number
  page: number
  size: number
}

/** 个人通知类型（后端下发小写四值） */
export type NotificationType = 'system' | 'reminder' | 'achievement' | 'level'

/** 后端 NotificationVO — 字段已在 VO 层转换，前端直接用 */
export interface NotificationVO {
  id: string
  type: NotificationType
  titleKey: string
  contentKey: string
  titleParams: Record<string, unknown> | null
  contentParams: Record<string, unknown> | null
  createdAt: number
  read: boolean
}

/** 红点未读汇总：公告线 + 个人通知线合计 */
export interface UnreadCountVO {
  notice: number
  personal: number
  total: number
}

const NOTIFICATION_BASE = '/user/notifications'

/** 通知分页列表 */
export function fetchNotifications(
  page = 1,
  size = 20,
  unreadOnly = false,
): Promise<PageResult<NotificationVO>> {
  return get<PageResult<NotificationVO>>(NOTIFICATION_BASE, { page, size, unreadOnly })
}

/** 单条标记已读，返回影响行数（已读再点返回 0） */
export function markNotificationRead(id: string): Promise<number> {
  return post<number>(`${NOTIFICATION_BASE}/${encodeURIComponent(id)}/read`)
}

/** 全部标记已读，返回影响行数 */
export function markAllNotificationsRead(): Promise<number> {
  return post<number>(`${NOTIFICATION_BASE}/read-all`)
}

/** 清空通知（逻辑删除），返回影响行数 */
export function clearNotifications(): Promise<number> {
  return del<number>(NOTIFICATION_BASE)
}

/** 红点唯一来源：公告 + 个人通知合计 */
export function fetchUnreadCount(): Promise<UnreadCountVO> {
  return get<UnreadCountVO>('/user/notices/unread-count')
}
