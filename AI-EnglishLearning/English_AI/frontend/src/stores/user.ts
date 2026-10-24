import { defineStore } from 'pinia'
import { ref, computed } from 'vue'
import {
  login as loginApi,
  register as registerApi,
  getPreference,
  updateVocabGroupSize as updateVocabGroupSizeApi,
  updateVocabularyGoals as updateVocabularyGoalsApi,
  type LoginRequest,
  type RegisterRequest,
  type LoginResponse,
  type PreferenceResponse,
} from '@/api/user'
import { getExerciseStats } from '@/api/exercise'
import { getCoinInfo, signIn as signInApi, type CheckInResult, type CoinInfo } from '@/api/coin'

function decodeJwtPayload(token: string): Record<string, unknown> | null {
  try {
    const payload = token.split('.')[1]
    // JWT 使用 base64url 编码，需要转换 + - / _ 为标准 base64
    const base64 = payload.replace(/-/g, '+').replace(/_/g, '/')
    return JSON.parse(atob(base64))
  } catch {
    return null
  }
}

function isTokenValid(token: string | null): boolean {
  if (!token) return false
  const payload = decodeJwtPayload(token)
  if (!payload || !payload.exp) return false
  return (payload.exp as number) * 1000 > Date.now()
}

export const useUserStore = defineStore('user', () => {
  // 使用 sessionStorage：刷新页面不丢失，关闭浏览器自动清除（无七天自动登录）
  const storedToken = sessionStorage.getItem('token')
  const validToken = isTokenValid(storedToken) ? storedToken : null
  const storedUser = validToken ? sessionStorage.getItem('user') : null
  if (storedToken && !validToken) {
    sessionStorage.removeItem('token')
    sessionStorage.removeItem('user')
  }
  const token = ref<string | null>(validToken)
  let parsedUser: LoginResponse | null = null
if (storedUser) {
  try {
    parsedUser = JSON.parse(storedUser)
  } catch {
    sessionStorage.removeItem('user')
  }
}
const user = ref<LoginResponse | null>(parsedUser)
  const isLoading = ref(false)

  const activeDays = ref(0)
  const masteredWords = ref(0)

  // 金币与签到
  const coinBalance = ref(0)
  const totalEarned = ref(0)
  const todayCheckedIn = ref(false)
  const checkInStreak = ref(0)
  const previewSignInReward = ref(0)
  const vocabGroupReward = ref(5)
  const vocabGroupDailyLimit = ref(3)
  const vocabGroupTodayCount = ref(0)
  const coinLoaded = ref(false)

  // 每组单词数量（null 表示尚未设置，仅用于金币组）
  const vocabGroupSize = ref<number | null>(null)
  const groupSizeMin = ref(5)
  const groupSizeMax = ref(50)
  const preferenceLoaded = ref(false)

  // 每日新背/复习单词目标（null 表示尚未设置）
  const dailyNewWords = ref<number | null>(null)
  const dailyReviewWords = ref<number | null>(null)
  const vocabularyGoalsConfigured = ref(false)
  const minDailyNewWords = ref(1)
  const maxDailyNewWords = ref(50)
  const minDailyReviewWords = ref(0)
  const maxDailyReviewWords = ref(50)

  const isLoggedIn = computed(() => isTokenValid(token.value) && !!user.value)
  const userId = computed(() => user.value?.userId)
  const username = computed(() => user.value?.username || '')
  const avatarUrl = computed(() => user.value?.avatarUrl || '')
  const phone = computed(() => user.value?.phone || '')

  /** 从后端获取用户学习统计数据 */
  const loadUserStats = async (): Promise<void> => {
    if (!userId.value) return
    try {
      const stats = await getExerciseStats(userId.value)
      if (stats) {
        activeDays.value = stats.activeDays || 0
        masteredWords.value = stats.masteredWords || 0
      }
    } catch (e) {
      console.warn('获取用户统计数据失败', e)
    }
  }

  /** 从后端获取金币与签到信息 */
  const loadCoinInfo = async (): Promise<void> => {
    if (!userId.value) return
    try {
      const info: CoinInfo = await getCoinInfo(userId.value)
      coinBalance.value = info.balance || 0
      totalEarned.value = info.totalEarned || 0
      todayCheckedIn.value = !!info.todayCheckedIn
      checkInStreak.value = info.checkInStreak || 0
      previewSignInReward.value = info.previewSignInReward || 0
      vocabGroupReward.value = info.vocabGroupReward || 0
      vocabGroupDailyLimit.value = info.vocabGroupDailyLimit || 0
      vocabGroupTodayCount.value = info.vocabGroupTodayCount || 0
      coinLoaded.value = true
    } catch (e) {
      console.warn('获取金币信息失败', e)
    }
  }

  /** 从后端获取每组单词数量 */
  const loadPreference = async (): Promise<void> => {
    if (!userId.value) return
    try {
      const preference: PreferenceResponse = await getPreference(userId.value)
      vocabGroupSize.value = preference.vocabGroupSize ?? null
      groupSizeMin.value = preference.minGroupSize || 5
      groupSizeMax.value = preference.maxGroupSize || 50
      dailyNewWords.value = preference.dailyNewWords ?? null
      dailyReviewWords.value = preference.dailyReviewWords ?? null
      vocabularyGoalsConfigured.value = !!preference.vocabularyGoalsConfigured
      minDailyNewWords.value = preference.minDailyNewWords || 1
      maxDailyNewWords.value = preference.maxDailyNewWords || 50
      minDailyReviewWords.value = preference.minDailyReviewWords || 0
      maxDailyReviewWords.value = preference.maxDailyReviewWords || 50
      preferenceLoaded.value = true
    } catch (e) {
      console.warn('获取学习偏好失败', e)
    }
  }

  /** 同时加载金币与偏好 */
  const loadUserExtras = async (): Promise<void> => {
    await Promise.all([loadCoinInfo(), loadPreference()])
  }

  /** 每日签到 */
  const signIn = async (): Promise<CheckInResult> => {
    if (!userId.value) {
      throw new Error('用户未登录')
    }
    const result = await signInApi(userId.value)
    coinBalance.value = result.balance || 0
    todayCheckedIn.value = true
    checkInStreak.value = result.streakDays || 0
    previewSignInReward.value = 0
    await loadCoinInfo()
    return result
  }

  /** 更新每组单词数量 */
  const setVocabGroupSize = async (size: number): Promise<PreferenceResponse> => {
    if (!userId.value) {
      throw new Error('用户未登录')
    }
    const preference = await updateVocabGroupSizeApi(userId.value, size)
    vocabGroupSize.value = preference.vocabGroupSize ?? null
    preferenceLoaded.value = true
    return preference
  }

  /** 更新每日新背/复习单词目标 */
  const setVocabularyGoals = async (newWords: number, reviewWords: number): Promise<PreferenceResponse> => {
    if (!userId.value) {
      throw new Error('用户未登录')
    }
    const preference = await updateVocabularyGoalsApi(userId.value, newWords, reviewWords)
    dailyNewWords.value = preference.dailyNewWords ?? null
    dailyReviewWords.value = preference.dailyReviewWords ?? null
    vocabularyGoalsConfigured.value = !!preference.vocabularyGoalsConfigured
    preferenceLoaded.value = true
    return preference
  }

  const login = async (data: LoginRequest): Promise<void> => {
    isLoading.value = true
    try {
      const response = await loginApi(data)
      token.value = response.token
      user.value = response
      sessionStorage.setItem('token', response.token)
      sessionStorage.setItem('user', JSON.stringify(response))
      // 登录成功后加载真实统计数据、金币与偏好
      await Promise.all([loadUserStats(), loadUserExtras()])
    } finally {
      isLoading.value = false
    }
  }

  const register = async (data: RegisterRequest): Promise<number> => {
    isLoading.value = true
    try {
      return await registerApi(data)
    } finally {
      isLoading.value = false
    }
  }

  const logout = (): void => {
    token.value = null
    user.value = null
    activeDays.value = 0
    masteredWords.value = 0
    coinBalance.value = 0
    totalEarned.value = 0
    todayCheckedIn.value = false
    checkInStreak.value = 0
    previewSignInReward.value = 0
    vocabGroupTodayCount.value = 0
    vocabGroupSize.value = null
    dailyNewWords.value = null
    dailyReviewWords.value = null
    vocabularyGoalsConfigured.value = false
    coinLoaded.value = false
    preferenceLoaded.value = false
    sessionStorage.removeItem('token')
    sessionStorage.removeItem('user')
  }

  const setUser = (newUser: LoginResponse): void => {
    user.value = newUser
    sessionStorage.setItem('user', JSON.stringify(newUser))
  }

  /** 更新头像URL（上传成功后调用） */
  const updateAvatar = (newAvatarUrl: string): void => {
    if (user.value) {
      user.value = { ...user.value, avatarUrl: newAvatarUrl }
      sessionStorage.setItem('user', JSON.stringify(user.value))
    }
  }

  /** 更新昵称（修改成功后调用） */
  const updateNickname = (newNickname: string): void => {
    if (user.value) {
      user.value = { ...user.value, nickname: newNickname }
      sessionStorage.setItem('user', JSON.stringify(user.value))
    }
  }

  /** 更新手机号（绑定成功后调用） */
  const updatePhone = (newPhone: string): void => {
    if (user.value) {
      user.value = { ...user.value, phone: newPhone }
      sessionStorage.setItem('user', JSON.stringify(user.value))
    }
  }

  return {
    token,
    user,
    isLoading,
    isLoggedIn,
    userId,
    username,
    avatarUrl,
    phone,
    activeDays,
    masteredWords,
    coinBalance,
    totalEarned,
    todayCheckedIn,
    checkInStreak,
    previewSignInReward,
    vocabGroupReward,
    vocabGroupDailyLimit,
    vocabGroupTodayCount,
    coinLoaded,
    vocabGroupSize,
    groupSizeMin,
    groupSizeMax,
    preferenceLoaded,
    dailyNewWords,
    dailyReviewWords,
    vocabularyGoalsConfigured,
    minDailyNewWords,
    maxDailyNewWords,
    minDailyReviewWords,
    maxDailyReviewWords,
    login,
    register,
    logout,
    setUser,
    updateAvatar,
    updateNickname,
    updatePhone,
    loadUserStats,
    loadCoinInfo,
    loadPreference,
    loadUserExtras,
    signIn,
    setVocabGroupSize,
    setVocabularyGoals,
  }
})


