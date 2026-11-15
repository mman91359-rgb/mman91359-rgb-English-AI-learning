import { get, post } from './request'

/** 金币信息与签到状态 */
export interface CoinInfo {
  userId: number
  balance: number
  totalEarned: number
  todayCheckedIn: boolean
  checkInStreak: number
  previewSignInReward: number
  vocabGroupReward: number
  vocabGroupDailyLimit: number
  vocabGroupTodayCount: number
}

/** 签到结果 */
export interface CheckInResult {
  alreadyCheckedIn: boolean
  reward: number
  baseReward: number
  streakBonus: number
  milestoneReward: number
  balance: number
  streakDays: number
}

/** 单日签到记录（签到日历用） */
export interface CheckInRecordVO {
  /** 签到日期 yyyy-MM-dd */
  date: string
  /** 当日获得金币 */
  rewardCoins: number
  /** 签到时的连续天数 */
  streakDays: number
}

/** 签到日历：区间内的签到记录 */
export interface CheckInCalendarVO {
  /** 今天是否已签到 */
  todayCheckedIn: boolean
  /** 当前连续签到天数 */
  streakDays: number
  /** 最早一条签到日期；无记录为 null，用于把「首签之前」渲染成空白而非漏签 */
  earliestDate: string | null
  /** 区间内的签到记录，按日期升序 */
  records: CheckInRecordVO[]
}

/** 单条金币流水 */
export interface CoinTransactionVO {
  /** 流水ID，同时是游标分页的排序键 */
  id: number
  /** 变动值：正数为获得，负数为消耗 */
  amount: number
  /** 业务类型：CHECK_IN / CHECK_IN_MILESTONE / VOCAB_GROUP */
  bizType: string
  /** 后端写入的中文描述，直接展示 */
  description: string
  /** 变动后余额；极端并发回填失败时为 null */
  balanceAfter: number | null
  /** 流水时间，形如 2026-11-15T13:03:59 */
  createdAt: string
}

/** 金币流水页：账户概览 + 一页流水 */
export interface CoinLedgerVO {
  userId: number
  balance: number
  totalEarned: number
  /** 累计消耗；当前无扣减出口，恒为 0 */
  totalSpent: number
  /** 本月消耗，同上恒为 0 */
  monthSpent: number
  /** 当前页流水，按 id 倒序 */
  items: CoinTransactionVO[]
  /** 各业务类型全量笔数，供筛选胶囊显示计数；不受当前筛选影响 */
  bizTypeCounts: Record<string, number>
  /** 下一页游标；hasMore 为 false 时为 null */
  nextCursor: number | null
  hasMore: boolean
}

/** GET /user/coin/info/{userId} */
export const getCoinInfo = (userId: number): Promise<CoinInfo> => {
  return get(`/user/coin/info/${userId}`)
}

/** POST /user/check-in */
export const signIn = (userId: number): Promise<CheckInResult> => {
  return post('/user/check-in', { userId })
}

/**
 * GET /user/check-in/records/{userId}?from=&to=
 * from / to 均为 yyyy-MM-dd，闭区间
 */
export const getCheckInRecords = (
  userId: number,
  from: string,
  to: string,
): Promise<CheckInCalendarVO> => {
  return get(`/user/check-in/records/${userId}`, { from, to })
}

/**
 * GET /user/coin/ledger/{userId}?cursor=&size=&bizType=
 * cursor 为上一页最后一条流水ID，首页不传；size 默认 20、上限 50；
 * bizType 不传表示全部，未知值后端返回空列表
 */
export const getCoinLedger = (
  userId: number,
  cursor?: number | null,
  size: number = 20,
  bizType?: string | null,
): Promise<CoinLedgerVO> => {
  const params: Record<string, number | string> = { size }
  if (cursor) params.cursor = cursor
  if (bizType) params.bizType = bizType
  return get(`/user/coin/ledger/${userId}`, params)
}
