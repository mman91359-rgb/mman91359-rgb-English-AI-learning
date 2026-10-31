import { watch } from 'vue'
import { useRoute } from 'vue-router'
import { useUserStore } from '@/stores/user'
import { reportStudySession } from '@/api/exercise'
import { useUserActivity } from '@/composables/useUserActivity'
import {
  IDLE_PAUSE_MS,
  MAX_TICK_SECONDS,
  SESSION_TICK_MS,
  STUDY_REPORT_INTERVAL_MS,
} from '@/config/session'

/**
 * 学习会话计时单例。
 * 进入带 meta.studyTracked 的页面开始计时，3 分钟无操作暂停；
 * 每 30 秒上报本会话累计活跃秒数，离开学习区/页面隐藏时 flush。
 */
let initialized = false
let sessionKey: string | null = null
let sessionStartedAt = 0
let activeSeconds = 0
let lastReportedSeconds = 0
let lastTickAt = 0
let tickTimer: number | null = null
let reportTimer: number | null = null

const { lastActivityAt, touch } = useUserActivity()

const createSessionKey = (): string => {
  if (typeof crypto !== 'undefined' && typeof crypto.randomUUID === 'function') {
    return crypto.randomUUID()
  }
  return `${Date.now()}-${Math.random().toString(36).slice(2, 10)}`
}

const tick = () => {
  if (!sessionKey) return
  const now = Date.now()
  if (lastTickAt === 0) {
    lastTickAt = now
    return
  }
  const delta = Math.min((now - lastTickAt) / 1000, MAX_TICK_SECONDS)
  lastTickAt = now
  const visible = document.visibilityState === 'visible'
  const active = now - lastActivityAt.value < IDLE_PAUSE_MS
  if (visible && active) {
    activeSeconds += delta
  }
}

const buildBody = (userId: number) => ({
  userId,
  sessionKey: sessionKey as string,
  activeSeconds: Math.floor(activeSeconds),
  sessionStartedAt,
})

const report = async (keepalive = false): Promise<void> => {
  const userStore = useUserStore()
  const userId = userStore.userId
  if (!sessionKey || !userId) return
  const seconds = Math.floor(activeSeconds)
  if (seconds <= lastReportedSeconds && !keepalive) return
  lastReportedSeconds = seconds
  const body = buildBody(userId)
  if (keepalive) {
    const token = sessionStorage.getItem('token')
    void fetch('/api/exercise/study-session/report', {
      method: 'POST',
      keepalive: true,
      headers: {
        'Content-Type': 'application/json',
        ...(token ? { Authorization: `Bearer ${token}` } : {}),
      },
      body: JSON.stringify(body),
    }).catch(() => undefined)
    return
  }
  try {
    await reportStudySession(body)
  } catch (e) {
    console.warn('学习会话上报失败', e)
  }
}

const clearTimers = () => {
  if (tickTimer !== null) {
    window.clearInterval(tickTimer)
    tickTimer = null
  }
  if (reportTimer !== null) {
    window.clearInterval(reportTimer)
    reportTimer = null
  }
}

const startSession = () => {
  if (sessionKey) return
  sessionKey = createSessionKey()
  sessionStartedAt = Date.now()
  activeSeconds = 0
  lastReportedSeconds = 0
  lastTickAt = sessionStartedAt
  tickTimer = window.setInterval(tick, SESSION_TICK_MS)
  reportTimer = window.setInterval(() => report(false), STUDY_REPORT_INTERVAL_MS)
}

const stopSession = async (sendReport: boolean): Promise<void> => {
  if (!sessionKey) return
  tick()
  // 用 keepalive 上报：请求头在调用时同步读取 token，不会因随后登出而丢失
  if (sendReport) await report(true)
  clearTimers()
  sessionKey = null
  sessionStartedAt = 0
  activeSeconds = 0
  lastReportedSeconds = 0
  lastTickAt = 0
}

export const useStudySession = () => {
  const route = useRoute()
  const userStore = useUserStore()

  const isTracked = () => route.meta.studyTracked === true

  const syncRoute = async (): Promise<void> => {
    if (!userStore.isLoggedIn) {
      await stopSession(false)
      return
    }
    if (isTracked()) {
      startSession()
    } else {
      await stopSession(true)
    }
  }

  if (!initialized) {
    initialized = true
    watch(() => route.fullPath, () => void syncRoute(), { immediate: true })
    watch(() => userStore.isLoggedIn, (loggedIn) => {
      if (loggedIn) {
        void syncRoute()
      } else {
        void stopSession(false)
      }
    })
    document.addEventListener('visibilitychange', () => {
      if (document.visibilityState === 'visible') {
        // 回到前台时重置计时起点，不把后台时间计入
        lastTickAt = Date.now()
        touch()
      } else {
        void report(true)
      }
    })
    window.addEventListener('pagehide', () => void report(true))
  }

  return {
    isSessionActive: () => sessionKey !== null,
    flush: async () => {
      tick()
      await report(true)
    },
    flushAndStop: () => stopSession(true),
    stop: () => stopSession(false),
  }
}
