import { computed, ref, watch } from 'vue'

/**
 * 通用异步数据加载：统一 loading / error / data / reload。
 * 使用请求序号避免旧请求覆盖新请求。
 */
export function useAsyncData<T>(loader: () => Promise<T>, deps: () => readonly unknown[] = () => []) {
  const data = ref<T | null>(null) as { value: T | null }
  const error = ref<unknown>(null)
  const loading = ref(true)
  const refreshing = computed(() => loading.value && data.value !== null)

  let requestId = 0

  const reload = async () => {
    const currentId = ++requestId
    loading.value = true
    error.value = null
    try {
      const result = await loader()
      if (currentId !== requestId) return
      data.value = result
    } catch (e) {
      if (currentId !== requestId) return
      error.value = e
      data.value = null
    } finally {
      if (currentId === requestId) loading.value = false
    }
  }

  watch(deps, reload, { immediate: true })

  return { data, error, loading, refreshing, reload }
}
