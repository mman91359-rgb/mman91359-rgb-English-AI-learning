import { ref, watch } from 'vue'

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

/**
 * 把毫秒时间戳格式化成相对时间。
 *
 * 渲染时现算、不做缓存：缓存会把「刚刚」冻住，第二天打开仍显示刚刚。
 */
export function relativeTime(createdAt: number): string {
  const diff = Date.now() - createdAt
  if (diff < 60_000) return '刚刚'
  if (diff < 3_600_000) return `${Math.floor(diff / 60_000)}分钟前`
  if (diff < 86_400_000) return `${Math.floor(diff / 3_600_000)}小时前`
  return `${Math.floor(diff / 86_400_000)}天前`
}

/**
 * 答题成就通知的产生逻辑（过渡态）。
 *
 * 通知的列表、已读、清空与红点已全部走服务端（见 api/notification.ts）。
 * 本文件**不再读写 localStorage**：历史实现里的 loadFromStorage / persist 会让
 * 「本地有、服务端没有」的通知绕过服务端红点，出现「红点亮、点开是空列表」。
 *
 * 保留 add 与 watch 是因为产生逻辑尚未迁到后端（需先定触发点：结算后？签到后？）。
 * 后端写入落地后，本文件与 TopAppBar 里的调用一起删除。
 */
const pending = ref<Notification[]>([])

export function useNotifications() {
  const add = (
    titleKey: string,
    contentKey: string,
    type: Notification['type'] = 'system',
    params?: { titleParams?: Record<string, string | number>; contentParams?: Record<string, string | number> },
  ) => {
    const id = `n-${Date.now()}-${Math.random().toString(36).slice(2, 7)}`
    pending.value.unshift({
      id,
      titleKey,
      contentKey,
      titleParams: params?.titleParams,
      contentParams: params?.contentParams,
      createdAt: Date.now(),
      read: false,
      type,
    })
    if (pending.value.length > 50) {
      pending.value = pending.value.slice(0, 50)
    }
    return id
  }

  // 监听：答题后自动添加成就通知。lastExerciseResult 目前全仓无写入方，不会触发。
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
            { contentParams: { count: result.correctCount, accuracy: result.accuracy } },
          )
        }
      } catch { /* ignore */ }
    },
  )

  return {
    notifications: pending,
    add,
    relativeTime,
  }
}
