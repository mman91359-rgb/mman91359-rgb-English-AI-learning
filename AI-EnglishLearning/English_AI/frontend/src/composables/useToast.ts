import { ref } from 'vue'

export interface Toast {
  id: string
  message: string
  type: 'success' | 'error' | 'warning' | 'info'
  duration: number
}

const toasts = ref<Toast[]>([])

/** 每条提示的计时状态：剩余毫秒数与本轮开始时间，用于悬停暂停后从剩余时间续算 */
interface TimerState {
  timer: ReturnType<typeof setTimeout> | null
  remaining: number
  startedAt: number
}

const timers = new Map<string, TimerState>()

let counter = 0

const startTimer = (id: string, ms: number) => {
  if (ms <= 0) return
  const state = timers.get(id) ?? { timer: null, remaining: ms, startedAt: 0 }
  state.remaining = ms
  state.startedAt = Date.now()
  state.timer = setTimeout(() => removeToast(id), ms)
  timers.set(id, state)
}

const removeToast = (id: string) => {
  const state = timers.get(id)
  if (state?.timer) clearTimeout(state.timer)
  timers.delete(id)
  toasts.value = toasts.value.filter(t => t.id !== id)
}

export function useToast() {
  /** 弹出提示，duration 传 0 表示不自动关闭；返回 id 便于外部精细控制 */
  const show = (message: string, type: Toast['type'] = 'info', duration: number = 3000) => {
    const id = `toast-${++counter}`
    toasts.value.push({ id, message, type, duration })
    startTimer(id, duration)
    return id
  }

  /** 悬停/聚焦时暂停：记录本轮已消耗的时间，留待 resume 续算 */
  const pause = (id: string) => {
    const state = timers.get(id)
    if (!state?.timer) return
    clearTimeout(state.timer)
    state.timer = null
    state.remaining = Math.max(0, state.remaining - (Date.now() - state.startedAt))
  }

  /** 移出/失焦后从剩余时间继续倒计时，避免长文案被硬切断 */
  const resume = (id: string) => {
    const state = timers.get(id)
    if (!state || state.timer) return
    if (state.remaining <= 0) {
      removeToast(id)
      return
    }
    startTimer(id, state.remaining)
  }

  return { toasts, show, remove: removeToast, pause, resume }
}
