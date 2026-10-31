import { watch } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { useI18n } from 'vue-i18n'
import { useUserStore } from '@/stores/user'
import { useUserActivity } from '@/composables/useUserActivity'
import { useToast } from '@/composables/useToast'
import { IDLE_LOGOUT_MS } from '@/config/session'

interface IdleLogoutOptions {
  /** 登出前回调，通常用于 flush 学习会话 */
  onIdle?: () => void | Promise<void>
}

/**
 * 全站空闲自动登出。
 * 每 10 秒检查一次，后台标签页被节流时依赖时间戳而非定时器精度。
 */
export const useIdleLogout = (options: IdleLogoutOptions = {}) => {
  const route = useRoute()
  const router = useRouter()
  const userStore = useUserStore()
  const { t } = useI18n()
  const { show } = useToast()
  const { lastActivityAt, resetActivity } = useUserActivity()

  let timer: number | null = null
  let loggingOut = false

  const check = async () => {
    if (loggingOut || !userStore.isLoggedIn) return
    if (!route.meta.requiresAuth) return
    if (Date.now() - lastActivityAt.value < IDLE_LOGOUT_MS) return

    loggingOut = true
    try {
      await options.onIdle?.()
    } catch (e) {
      console.warn('空闲登出前 flush 失败', e)
    }
    userStore.logout()
    resetActivity()
    show(t('session.idleLogout'), 'warning', 5000)
    try {
      await router.replace({ path: '/login', query: { reason: 'idle' } })
    } finally {
      loggingOut = false
    }
  }

  const onVisibilityChange = () => {
    void check()
  }

  const start = () => {
    if (timer !== null) return
    timer = window.setInterval(() => void check(), 10_000)
    document.addEventListener('visibilitychange', onVisibilityChange)
  }

  const stop = () => {
    if (timer !== null) {
      window.clearInterval(timer)
      timer = null
    }
    document.removeEventListener('visibilitychange', onVisibilityChange)
  }

  start()
  watch(() => userStore.isLoggedIn, (loggedIn) => {
    if (loggedIn) {
      resetActivity()
    }
  })

  return { start, stop, check }
}
