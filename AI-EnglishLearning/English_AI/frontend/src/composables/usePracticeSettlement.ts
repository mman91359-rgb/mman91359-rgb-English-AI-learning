import { ref } from 'vue'
import { newPracticeBatchKey, settlePractice } from '@/api/exercise'
import type { PracticeSettleResult } from '@/api/exercise'

/**
 * 练习组积分结算。
 *
 * <p>一组题开始前调用 {@link startBatch} 生成分组键，每次提交答题时带上它，
 * 整组做完后调用 {@link settleBatch} 结算。服务端按分组键聚合答题日志，
 * 前端不参与得分计算，也无法通过伪造对错影响积分。</p>
 */
export function usePracticeSettlement() {
  /** 本组结算键 */
  const batchKey = ref('')
  /** 本组结算结果，null 表示尚未结算 */
  const batchSettle = ref<PracticeSettleResult | null>(null)
  /** 结算请求进行中 */
  const batchSettling = ref(false)

  /** 开始新的一组练习：重新生成结算键并清空上一组结果 */
  const startBatch = (moduleType: number): void => {
    batchKey.value = newPracticeBatchKey(moduleType)
    batchSettle.value = null
  }

  /** 结算当前组；重复调用受 batchSettling 保护，服务端另有幂等键兜底 */
  const settleBatch = async (userId: number | null | undefined): Promise<void> => {
    if (!userId || !batchKey.value || batchSettling.value) return
    batchSettling.value = true
    try {
      batchSettle.value = await settlePractice(userId, batchKey.value)
    } catch (e) {
      console.warn('练习积分结算失败', e)
    } finally {
      batchSettling.value = false
    }
  }

  return { batchKey, batchSettle, batchSettling, startBatch, settleBatch }
}
