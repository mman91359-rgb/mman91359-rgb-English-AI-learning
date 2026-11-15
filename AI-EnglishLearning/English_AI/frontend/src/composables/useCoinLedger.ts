import { ref } from 'vue'
import { getCoinLedger, type CoinTransactionVO } from '@/api/coin'
import { useUserStore } from '@/stores/user'

/**
 * 金币流水分页状态。
 *
 * 分页口径是 keyset（游标 = 上一页最后一条 id），不是页码：
 * 流水只增不改，翻页期间新增记录不会把旧记录挤到下一页，也不会出现重复条目。
 * 账户四个统计（余额 / 累计获得 / 累计消耗 / 本月消耗）只在首页请求时刷新。
 */
export function useCoinLedger(pageSize: number = 20) {
  const userStore = useUserStore()

  const items = ref<CoinTransactionVO[]>([])
  /** 未加载时保持 null，页面显示占位符而不是 0 */
  const balance = ref<number | null>(null)
  const totalEarned = ref<number | null>(null)
  const totalSpent = ref<number | null>(null)
  const monthSpent = ref<number | null>(null)
  const nextCursor = ref<number | null>(null)
  const hasMore = ref(false)
  const loading = ref(false)
  const loadingMore = ref(false)
  const error = ref('')
  /** 是否已完成过一次请求（区分「还没加载」与「加载完为空」） */
  const loaded = ref(false)
  /** 当前业务类型筛选；null = 全部 */
  const bizType = ref<string | null>(null)
  /** 各类型全量笔数（与筛选无关），由首页请求带回 */
  const counts = ref<Record<string, number>>({})
  /** 请求序号：切换筛选时让在途的 loadMore 失效，避免旧页覆盖新结果 */
  let requestToken = 0

  /** 首页 / 重试：整体重置 */
  const load = async (): Promise<void> => {
    const userId = userStore.userId
    if (!userId) {
      error.value = 'not-logged-in'
      return
    }
    loading.value = true
    error.value = ''
    const token = ++requestToken
    try {
      const page = await getCoinLedger(userId, null, pageSize, bizType.value)
      if (token !== requestToken) return
      items.value = page.items
      balance.value = page.balance
      totalEarned.value = page.totalEarned
      totalSpent.value = page.totalSpent
      monthSpent.value = page.monthSpent
      nextCursor.value = page.nextCursor
      hasMore.value = page.hasMore
      counts.value = page.bizTypeCounts ?? {}
      loaded.value = true
    } catch (e) {
      error.value = e instanceof Error ? e.message : 'load-failed'
    } finally {
      loading.value = false
    }
  }

  /** 追加下一页；没有下一页或正在请求时直接返回 */
  const loadMore = async (): Promise<void> => {
    const userId = userStore.userId
    if (!userId || !hasMore.value || nextCursor.value === null || loadingMore.value || loading.value) {
      return
    }
    loadingMore.value = true
    error.value = ''
    const token = requestToken
    try {
      const page = await getCoinLedger(userId, nextCursor.value, pageSize, bizType.value)
      if (token !== requestToken) return
      items.value = items.value.concat(page.items)
      nextCursor.value = page.nextCursor
      hasMore.value = page.hasMore
    } catch (e) {
      error.value = e instanceof Error ? e.message : 'load-failed'
    } finally {
      loadingMore.value = false
    }
  }

  /** 切换类型：清空当前列表与游标后重新拉首页；counts 由首页响应刷新 */
  const setBizType = (next: string | null): void => {
    if (bizType.value === next) return
    bizType.value = next
    items.value = []
    nextCursor.value = null
    hasMore.value = false
    void load()
  }

  /** 空态判定：请求完成、无错误、无数据 */
  const isEmpty = (): boolean => loaded.value && !loading.value && !error.value && items.value.length === 0

  return {
    items,
    balance,
    totalEarned,
    totalSpent,
    monthSpent,
    hasMore,
    loading,
    loadingMore,
    error,
    loaded,
    bizType,
    counts,
    load,
    loadMore,
    setBizType,
    isEmpty,
  }
}
