import { onBeforeUnmount, ref, watch } from 'vue'
import type { Ref } from 'vue'
import { saveDraft } from '../api/writing'

export type DraftSaveStatus = 'idle' | 'saving' | 'saved' | 'error'

const DEFAULT_INTERVAL_MS = 10_000

/**
 * 每 10 秒自动保存；内容未变化时跳过；离开页面时兜底保存。
 * - 已写作秒数随草稿一起持久化，恢复草稿后倒计时按剩余时间续计
 * - 监听 pagehide / 页面隐藏，浏览器刷新或切后台也尽量落盘（最多损失一个间隔）
 */
export function useWritingDraft(
  topicId: () => string,
  content: Ref<string>,
  getElapsedSeconds: () => number = () => 0,
  intervalMs: number = DEFAULT_INTERVAL_MS,
) {
  const status = ref<DraftSaveStatus>('idle')
  const savedAt = ref<string | null>(null)
  let lastSaved = ''
  let saving = false
  let stopped = false

  const saveNow = async (): Promise<void> => {
    const id = topicId()
    if (stopped || !id || saving || content.value === lastSaved) return
    saving = true
    status.value = 'saving'
    try {
      const draft = await saveDraft(id, content.value, getElapsedSeconds())
      lastSaved = content.value
      savedAt.value = draft.updatedAt
      status.value = 'saved'
    } catch {
      status.value = 'error'
    } finally {
      saving = false
    }
  }

  const markSaved = (value: string, updatedAt: string | null) => {
    lastSaved = value
    savedAt.value = updatedAt
    status.value = 'idle'
  }

  /** 提交成功后停止自动保存，避免把已提交的草稿重新写回 localStorage */
  const stopAutoSave = () => {
    stopped = true
    clearInterval(timer)
  }

  const timer = setInterval(() => {
    void saveNow()
  }, intervalMs)

  // 浏览器刷新/关闭前兜底保存（onBeforeUnmount 在刷新时不触发）
  const onPageHide = () => {
    void saveNow()
  }
  const onVisibilityChange = () => {
    if (document.visibilityState === 'hidden') void saveNow()
  }
  window.addEventListener('pagehide', onPageHide)
  document.addEventListener('visibilitychange', onVisibilityChange)

  watch(content, () => {
    if (status.value === 'saved' || status.value === 'error') status.value = 'idle'
  })

  onBeforeUnmount(() => {
    clearInterval(timer)
    window.removeEventListener('pagehide', onPageHide)
    document.removeEventListener('visibilitychange', onVisibilityChange)
    void saveNow()
  })

  return { status, savedAt, saveNow, markSaved, stopAutoSave }
}
