import { computed, onBeforeUnmount, ref, watch } from 'vue'

/**
 * 倒计时：默认立即开始；归零时只触发一次 onExpire。
 * 剩余不足 5 分钟时 danger=true，供页面切换为错误色。
 */
export function useCountdown(totalSeconds: number, onExpire?: () => void, autoStart = true) {
  const remaining = ref(Math.max(0, totalSeconds))
  const running = ref(false)
  let timer: ReturnType<typeof setInterval> | null = null
  let expired = false

  const stop = () => {
    if (timer) {
      clearInterval(timer)
      timer = null
    }
    running.value = false
  }

  const start = () => {
    if (running.value || remaining.value <= 0) return
    running.value = true
    timer = setInterval(() => {
      remaining.value = Math.max(0, remaining.value - 1)
    }, 1000)
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
