import { defineStore } from 'pinia'
import { ref, computed } from 'vue'
import {
  login as loginApi,
  register as registerApi,
  refreshAuth as refreshAuthApi,
  logoutAuth,
  getPreference,
  updateVocabGroupSize as updateVocabGroupSizeApi,
  updateVocabularyGoals as updateVocabularyGoalsApi,
  updateActiveWordBook as updateActiveWordBookApi,
  updateIncludeFavoriteWords as updateIncludeFavoriteWordsApi,
  updateExamGoal as updateExamGoalApi,
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
  // 记住我改造：Access Token 只存内存（Pinia state），不落 sessionStorage。
  // 刷新页面后靠 HttpOnly Cookie 里的 Refresh Token 静默换回新 Access Token。
  // 这样 XSS 拿不到长效凭证，关浏览器后 7 天内仍可自动恢复登录态。
  const token = ref<string | null>(null)
  const user = ref<LoginResponse | null>(null)
  const isLoading = ref(false)
  /** 是否已完成「静默刷新」尝试（防重复刷新） */
  const refreshAttempted = ref(false)

  const activeDays = ref(0)
  const masteredWords = ref(0)
  /** 学习统计是否已从后端加载（登录后改为后台拉取，首屏据此占位） */
  const statsLoaded = ref(false)

  // 金币与签到
  const coinBalance = ref(0)
  const totalEarned = ref(0)
  const todayCheckedIn = ref(false)
  const checkInStreak = ref(0)
  /**
   * 签到成功的递增信号，仅供 UI 播放复燃动画使用。
   * 不能靠监听 todayCheckedIn 从 false → true：首次加载金币信息时它也会这样变，
   * 那时候不该放动画。只有真正调用 signIn() 才自增。
   */
  const signInNonce = ref(0)
  const previewSignInReward = ref(0)
  const vocabGroupReward = ref(5)
  const vocabGroupDailyLimit = ref(3)
  const vocabGroupTodayCount = ref(0)
  /** 补签定价与展示汇率，取自后端 /user/coin/info，不在前端写死 */
  const makeupCostCoins = ref(600)
  const coinsPerYuan = ref(100)
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

  // 当前选中的词书ID（null 表示未选）
  const activeWordBookId = ref<number | null>(null)

  // 新词队列是否并行收藏词：true = 收藏词优先于词书词
  const includeFavoriteWords = ref(false)

  // 备考目标（考试日期 yyyy-MM-dd / 目标分），null 表示尚未设置
  const examDate = ref<string | null>(null)
  const targetScore = ref<number | null>(null)
  const examGoalConfigured = ref(false)

  const isLoggedIn = computed(() => isTokenValid(token.value) && !!user.value)
  const userId = computed(() => user.value?.userId)
  const username = computed(() => user.value?.username || '')
  const avatarUrl = computed(() => user.value?.avatarUrl || '')
  const phone = computed(() => user.value?.phone || '')
  const roles = computed(() => user.value?.roles || '')
  const isAdmin = computed(() => roles.value.split(',').map(role => role.trim()).includes('ROLE_ADMIN'))

  /** 从后端获取用户学习统计数据 */
  const loadUserStats = async (): Promise<void> => {
    if (!userId.value) return
    try {
      const stats = await getExerciseStats(userId.value)
      if (stats) {
        activeDays.value = stats.activeDays || 0
        masteredWords.value = stats.masteredWords || 0
      }
      statsLoaded.value = true
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
      makeupCostCoins.value = info.makeupCostCoins || 600
      coinsPerYuan.value = info.coinsPerYuan || 100
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
      activeWordBookId.value = preference.activeWordBookId ?? null
      includeFavoriteWords.value = !!preference.includeFavoriteWords
      examDate.value = preference.examDate ?? null
      targetScore.value = preference.targetScore ?? null
      examGoalConfigured.value = !!preference.examGoalConfigured
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
    // 重复签到（alreadyCheckedIn）没有真正「点着」，不触发复燃
    if (!result.alreadyCheckedIn) signInNonce.value += 1
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

  /** 更新当前词书 */
  const setActiveWordBook = async (wordBookId: number): Promise<PreferenceResponse> => {
    if (!userId.value) {
      throw new Error('用户未登录')
    }
    const preference = await updateActiveWordBookApi(userId.value, wordBookId)
    activeWordBookId.value = preference.activeWordBookId ?? null
    preferenceLoaded.value = true
    return preference
  }

  /** 开启/关闭「收藏词并行」：开启后收藏词优先进入新词队列 */
  const setIncludeFavoriteWords = async (enabled: boolean): Promise<PreferenceResponse> => {
    if (!userId.value) {
      throw new Error('用户未登录')
    }
    const preference = await updateIncludeFavoriteWordsApi(userId.value, enabled)
    includeFavoriteWords.value = !!preference.includeFavoriteWords
    preferenceLoaded.value = true
    return preference
  }

  /** 更新备考目标，并把考试等级同步到当前登录态 */
  const setExamGoal = async (date: string, score: number, cetLevel: string): Promise<PreferenceResponse> => {
    if (!userId.value) {
      throw new Error('用户未登录')
    }
    const preference = await updateExamGoalApi({
      userId: userId.value,
      examDate: date,
      targetScore: score,
      cetLevel,
    })
    examDate.value = preference.examDate ?? null
    targetScore.value = preference.targetScore ?? null
    examGoalConfigured.value = !!preference.examGoalConfigured
    // 等级回写 sys_user 后同步内存登录态，顶栏展示条立即读到新等级
    if (user.value) {
      user.value = { ...user.value, cetLevel }
    }
    preferenceLoaded.value = true
    return preference
  }

  const login = async (data: LoginRequest): Promise<void> => {
    isLoading.value = true
    try {
      const response = await loginApi(data)
      token.value = response.token
      user.value = response
      refreshAttempted.value = true
      // 登录成功后立即返回，统计数据/金币/偏好改为后台拉取，避免拖慢跳转
      // 两个 loader 内部均有 try/catch，失败只打 warn，不影响登录态
      void loadUserStats()
      void loadUserExtras()
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

  const logout = async (): Promise<void> => {
    // 先调后端登出（吊销 Refresh Token + 清 Cookie），失败也继续清本地态
    try {
      await logoutAuth()
    } catch (e) {
      console.warn('后端登出失败，忽略并清理本地态', e)
    }
    token.value = null
    user.value = null
    refreshAttempted.value = false
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
    activeWordBookId.value = null
    examDate.value = null
    targetScore.value = null
    examGoalConfigured.value = false
    coinLoaded.value = false
    preferenceLoaded.value = false
    statsLoaded.value = false
  }

  const setUser = (newUser: LoginResponse): void => {
    user.value = newUser
  }

  /**
   * 静默刷新：页面加载/刷新后调用，用 Cookie 里的 Refresh Token 换回 Access Token。
   * 成功后恢复登录态，失败则保持未登录（由路由守卫决定跳转）。
   * 并发安全：同一时间只允许一次刷新（refreshAttempted 标记 + 调用方加锁）。
   */
  const refreshAuth = async (): Promise<boolean> => {
    if (refreshAttempted.value && token.value) {
      // 已登录，无需重复刷新
      return true
    }
    if (refreshAttempted.value) {
      // 已尝试过且失败，不再重复
      return false
    }
    refreshAttempted.value = true
    try {
      const response = await refreshAuthApi()
      token.value = response.token
      user.value = response
      void loadUserStats()
      void loadUserExtras()
      return true
    } catch (e) {
      console.warn('静默刷新失败，需要重新登录', e)
      return false
    }
  }

  /** 更新头像URL（上传成功后调用） */
  const updateAvatar = (newAvatarUrl: string): void => {
    if (user.value) {
      user.value = { ...user.value, avatarUrl: newAvatarUrl }
    }
  }

  /** 更新昵称（修改成功后调用） */
  const updateNickname = (newNickname: string): void => {
    if (user.value) {
      user.value = { ...user.value, nickname: newNickname }
    }
  }

  /** 更新手机号（绑定成功后调用） */
  const updatePhone = (newPhone: string): void => {
    if (user.value) {
      user.value = { ...user.value, phone: newPhone }
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
    roles,
    isAdmin,
    activeDays,
    masteredWords,
    statsLoaded,
    coinBalance,
    totalEarned,
    todayCheckedIn,
    checkInStreak,
    signInNonce,
    previewSignInReward,
    vocabGroupReward,
    vocabGroupDailyLimit,
    vocabGroupTodayCount,
    makeupCostCoins,
    coinsPerYuan,
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
    activeWordBookId,
    includeFavoriteWords,
    examDate,
    targetScore,
    examGoalConfigured,
    setIncludeFavoriteWords,
    setExamGoal,
    login,
    register,
    logout,
    refreshAuth,
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
    setActiveWordBook,
  }
})


