import { ref } from 'vue'
import { ACTIVITY_EVENTS } from '@/config/session'

/**
 * 全局用户活动检测单例。
 * 学习计时与空闲登出共用同一个 lastActivityAt，避免重复监听。
 */
const lastActivityAt = ref(Date.now())
let started = false
let lastRecorded = 0

const touch = () => {
  const now = Date.now()
  // mousemove/scroll 很频繁，最多每 500ms 更新一次
  if (now - lastRecorded < 500) return
  lastRecorded = now
  lastActivityAt.value = now
}

const onVisibilityChange = () => {
  if (document.visibilityState === 'visible') {
    lastActivityAt.value = Date.now()
  }
}

const start = () => {
  if (started) return
  started = true
  ACTIVITY_EVENTS.forEach((event) => {
    window.addEventListener(event, touch, { passive: true })
  })
  document.addEventListener('visibilitychange', onVisibilityChange)
}

const stop = () => {
  if (!started) return
  started = false
  ACTIVITY_EVENTS.forEach((event) => {
    window.removeEventListener(event, touch)
  })
  document.removeEventListener('visibilitychange', onVisibilityChange)
}

export const useUserActivity = () => {
  start()
  return {
    lastActivityAt,
    touch,
    resetActivity: () => {
      lastActivityAt.value = Date.now()
      lastRecorded = lastActivityAt.value
    },
    start,
    stop,
  }
}
