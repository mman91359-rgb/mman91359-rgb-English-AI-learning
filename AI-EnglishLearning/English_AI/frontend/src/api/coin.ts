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
