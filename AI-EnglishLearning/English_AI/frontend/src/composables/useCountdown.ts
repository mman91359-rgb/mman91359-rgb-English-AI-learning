import { computed, onBeforeUnmount, ref, watch } from 'vue'

/**
 * 倒计时：以时间戳为基准，后台标签页定时器被节流时剩余时间仍然准确。
 * 默认立即开始；归零时只触发一次 onExpire。
 * 剩余不足 5 分钟时 danger=true，供页面切换为错误色。
 */
export function useCountdown(totalSeconds: number, onExpire?: () => void, autoStart = true) {
  const remaining = ref(Math.max(0, totalSeconds))
  const running = ref(false)
  let timer: ReturnType<typeof setInterval> | null = null
  let endsAt = 0
  let expired = false

  const stop = () => {
    if (timer) {
      clearInterval(timer)
      timer = null
    }
    running.value = false
  }

  const tick = () => {
    const next = Math.max(0, Math.round((endsAt - Date.now()) / 1000))
    remaining.value = next
    if (next <= 0) stop()
  }

  const start = () => {
    if (running.value || remaining.value <= 0) return
    // 时间戳基准：切后台再回来，按真实流逝时间扣减
    endsAt = Date.now() + remaining.value * 1000
    running.value = true
    timer = setInterval(tick, 1000)
  }

  const reset = (seconds: number = totalSeconds) => {
    stop()
    expired = false
    remaining.value = Math.max(0, seconds)
    start()
  }

  watch(remaining, (value) => {
    if (value > 0 || expired) return
    expired = true
    stop()
    onExpire?.()
  })

  if (autoStart) start()
  onBeforeUnmount(stop)

  const formatted = computed(() => {
    const minutes = Math.floor(remaining.value / 60)
    const seconds = remaining.value % 60
    return `${String(minutes).padStart(2, '0')}:${String(seconds).padStart(2, '0')}`
  })

  const danger = computed(() => remaining.value > 0 && remaining.value <= 300)

  return { remaining, formatted, running, danger, start, stop, reset }
}
