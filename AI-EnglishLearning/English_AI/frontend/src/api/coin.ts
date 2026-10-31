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

/** GET /user/coin/info/{userId} */
export const getCoinInfo = (userId: number): Promise<CoinInfo> => {
  return get(`/user/coin/info/${userId}`)
}

/** POST /user/check-in */
export const signIn = (userId: number): Promise<CheckInResult> => {
  return post('/user/check-in', { userId })
}
