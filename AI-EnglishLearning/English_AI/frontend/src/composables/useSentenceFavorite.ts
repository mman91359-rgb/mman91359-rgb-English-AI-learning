import { ref } from 'vue'
import { useUserStore } from '@/stores/user'
import { addFavorite, getFavorites, removeFavorite } from '@/api/exercise'

/**
 * 句子收藏开关（词汇 / 语法 / 练习 / 听力 / 翻译共用）。
 *
 * 后端只提供扁平收藏列表，没有"单条是否已收藏"的查询接口，
 * 因此进入页面先拉一次全量，用 sentenceText 建索引：
 * - 回显已收藏（红色实心爱心），刷新后状态不丢；
 * - 取消收藏时按文本反查记录 id 再调删除接口。
 *
 * 同一句文本即视为同一条收藏（与后端去重口径一致）。
 */
export function useSentenceFavorite() {
  const userStore = useUserStore()

  /** sentenceText → 收藏记录 id */
  const index = ref<Map<string, number>>(new Map())
  /** 正在提交的句子，避免连点产生重复请求 */
  const pending = ref<Set<string>>(new Set())

  const keyOf = (text: string) => text.trim()

  /** 拉取当前用户全部收藏，建立文本索引。失败只告警，不影响页面主流程 */
  const load = async () => {
    const userId = userStore.userId
    if (!userId) return
    try {
      const list = await getFavorites(userId)
      index.value = new Map((list ?? []).map((item) => [keyOf(item.sentenceText), item.id]))
    } catch (e) {
      console.warn('加载收藏列表失败', e)
    }
  }

  /** 是否已收藏；空文本恒为 false */
  const isFavorited = (text: string): boolean => {
    const key = keyOf(text)
    return key.length > 0 && index.value.has(key)
  }

  /** 该句子是否正在提交 */
  const isPending = (text: string): boolean => pending.value.has(keyOf(text))

  /**
   * 切换收藏状态。
   * @param moduleType 模块类型（1词汇 2语法 3翻译 4听力…），写入收藏记录供收藏页按模块筛选；由调用练习页传入
   * @returns 切换后的状态（true=已收藏）；未登录、文本为空或正在提交时返回 null
   * @throws 请求失败时抛出，由调用方 toast；索引保持原状
   */
  const toggle = async (text: string, questionId?: number, moduleType?: number): Promise<boolean | null> => {
    const userId = userStore.userId
    const key = keyOf(text)
    if (!userId || !key || pending.value.has(key)) return null

    pending.value = new Set(pending.value).add(key)
    try {
      const existId = index.value.get(key)
      if (existId !== undefined) {
        await removeFavorite(existId, userId)
        const next = new Map(index.value)
        next.delete(key)
        index.value = next
        return false
      }
      const created = await addFavorite({ userId, sentenceText: key, questionId, moduleType })
      const next = new Map(index.value)
      next.set(key, created.id)
      index.value = next
      return true
    } finally {
      const rest = new Set(pending.value)
      rest.delete(key)
      pending.value = rest
    }
  }

  return { load, isFavorited, isPending, toggle }
}
