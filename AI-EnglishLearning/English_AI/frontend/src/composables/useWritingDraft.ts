import { onBeforeUnmount, ref, watch } from 'vue'
import type { Ref } from 'vue'
import { saveDraft } from '../api/writing'

export type DraftSaveStatus = 'idle' | 'saving' | 'saved' | 'error'

const DEFAULT_INTERVAL_MS = 10_000

/** 每 10 秒自动保存；内容未变化时跳过；离开页面时兜底保存 */
export function useWritingDraft(
  topicId: () => string,
  content: Ref<string>,
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
      const draft = await saveDraft(id, content.value)
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

  watch(content, () => {
    if (status.value === 'saved' || status.value === 'error') status.value = 'idle'
  })

  onBeforeUnmount(() => {
    clearInterval(timer)
    void saveNow()
  })

  return { status, savedAt, saveNow, markSaved, stopAutoSave }
}
