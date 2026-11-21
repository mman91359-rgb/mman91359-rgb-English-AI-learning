import { ref, computed, watch } from 'vue'

export interface Notification {
  id: string
  titleKey: string
  contentKey: string
  titleParams?: Record<string, string | number>
  contentParams?: Record<string, string | number>
  /** 创建时刻的毫秒时间戳；相对时间在渲染时现算，不落库 */
  createdAt: number
  read: boolean
  type: 'system' | 'reminder' | 'achievement' | 'level'
}

const STORAGE_KEY = 'notifications'

/**
 * 把毫秒时间戳格式化成相对时间。
 *
 * 为什么不在写入时算好字符串：那样存进 localStorage 后就被冻住了，
 * 第二天打开仍会显示「刚刚」。这里改成渲染时现算。
 */
export function relativeTime(createdAt: number): string {
  const diff = Date.now() - createdAt
  if (diff < 60_000) return '刚刚'
  if (diff < 3_600_000) return `${Math.floor(diff / 60_000)}分钟前`
  if (diff < 86_400_000) return `${Math.floor(diff / 3_600_000)}小时前`
  return `${Math.floor(diff / 86_400_000)}天前`
}

/**
 * 兼容迁移：旧数据存的是 `time` 相对时间字符串、没有 `createdAt`。
 * 按「N分钟/小时/天前」反解成时间戳，避免老记录全部变成「刚刚」。
 */
function migrateLegacy(item: unknown): Notification | null {
  if (!item || typeof item !== 'object') return null
  const raw = item as Record<string, unknown>
  if (typeof raw.id !== 'string' || typeof raw.titleKey !== 'string' || typeof raw.contentKey !== 'string') {
    return null
  }
  let createdAt = typeof raw.createdAt === 'number' ? raw.createdAt : Date.now()
  if (typeof raw.createdAt !== 'number') {
    const match = String(raw.time ?? '').match(/(\d+)(分钟|小时|天)前/)
    if (match) {
      const amount = Number(match[1])
      const unitMs = match[2] === '分钟' ? 60_000 : match[2] === '小时' ? 3_600_000 : 86_400_000
      createdAt = Date.now() - amount * unitMs
    }
  }
  const typed = raw.type
  const type: Notification['type'] =
    typed === 'reminder' || typed === 'achievement' || typed === 'level' ? typed : 'system'
  return {
    id: raw.id,
    titleKey: raw.titleKey,
    contentKey: raw.contentKey,
    titleParams: raw.titleParams as Notification['titleParams'],
    contentParams: raw.contentParams as Notification['contentParams'],
    createdAt,
    read: Boolean(raw.read),
    type,
  }
}

/**
 * 读取本地通知。
 *
 * 历史版本会在这里植入两条 `read: false` 的虚构种子（欢迎语 + 每日提醒），
 * 导致红点从首次进入就常亮、点开却是假消息。后端 `/notification/list` 就绪前
 * 通知列表理应为空，交由 TopAppBar 的空状态承接，故不再种入。
 */
function loadFromStorage(): Notification[] {
  try {
    const raw = localStorage.getItem(STORAGE_KEY)
    if (!raw) return []
    const parsed: unknown = JSON.parse(raw)
    if (!Array.isArray(parsed)) return []
    return parsed.map(migrateLegacy).filter((x): x is Notification => x !== null)
  } catch {
    return []
  }
}

const notifications = ref<Notification[]>(loadFromStorage())

function persist() {
  localStorage.setItem(STORAGE_KEY, JSON.stringify(notifications.value))
}

export function useNotifications() {
  const unreadCount = computed(() => notifications.value.filter((n) => !n.read).length)

  const markAsRead = (id: string) => {
    const n = notifications.value.find((x) => x.id === id)
    if (n) {
      n.read = true
      persist()
    }
  }

  const markAllRead = () => {
    notifications.value.forEach((n) => (n.read = true))
    persist()
  }

  const add = (
    titleKey: string,
    contentKey: string,
    type: Notification['type'] = 'system',
    params?: { titleParams?: Record<string, string | number>; contentParams?: Record<string, string | number> },
  ) => {
    const id = `n-${Date.now()}-${Math.random().toString(36).slice(2, 7)}`
    notifications.value.unshift({
      id,
      titleKey,
      contentKey,
      titleParams: params?.titleParams,
      contentParams: params?.contentParams,
      createdAt: Date.now(),
      read: false,
      type,
    })
    if (notifications.value.length > 50) {
      notifications.value = notifications.value.slice(0, 50)
    }
    persist()
    return id
  }

  const clearAll = () => {
    notifications.value = []
    persist()
  }

  // 监听：答题后自动添加成就通知
  watch(
    () => localStorage.getItem('lastExerciseResult'),
    (raw) => {
      if (!raw) return
      try {
        const result = JSON.parse(raw)
        if (result.correctCount >= 10) {
          add(
            'notification.achievementTitle',
            'notification.achievementContent',
            'achievement',
            {
              contentParams: { count: result.correctCount, accuracy: result.accuracy },
            },
          )
        }
      } catch { /* ignore */ }
    },
  )

  return {
    notifications,
    unreadCount,
    markAsRead,
    markAllRead,
    add,
    clearAll,
    relativeTime,
  }
}
