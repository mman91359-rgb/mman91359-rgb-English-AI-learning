import { del, get, post, put } from './request'

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

// ========== 公告线（广播，来自 sys_notice） ==========
// 与管理端 /admin/notices 不是一套：那条是发布入口，这里是用户侧阅读入口。
// 红点按 §7.1 方案 3 合并了两条线，所以通知页必须能读到公告，
// 否则会出现「红点亮着、点开却看不到任何东西」。

/** 公告 VO（后端 UserNoticeVO） */
export interface NoticeVO {
  id: number
  title: string
  content: string
  noticeType: string
  /** 发布时间（ISO-8601） */
  publishAt: string
  read: boolean
}

/** 公告列表，按发布时间倒序；公告量小，一次取全 */
export function fetchNotices(page = 1, size = 100): Promise<PageResult<NoticeVO>> {
  return get<PageResult<NoticeVO>>('/user/notices', { page, size })
}

/** 单条公告已读 */
export function markNoticeRead(id: number): Promise<boolean> {
  return put<boolean>(`/user/notices/${id}/read`)
}

/** 全部公告已读，返回本次新标记条数 */
export function markAllNoticesRead(): Promise<number> {
  return put<number>('/user/notices/read-all')
}
