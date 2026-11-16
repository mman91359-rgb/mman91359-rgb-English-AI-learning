/**
 * 每日学习目标的默认口径。
 *
 * 两组数值语义不同，故分开定义，不合并：
 * - homeDailyDefaults：首页/学习中心「每日词汇任务」的兜底值（新词 10 / 复习 5），
 *   对应用户尚未设置 userStore.dailyNewWords / dailyReviewWords 时的 ?? 兜底。
 * - learningDailyTargets：学习中心本地目标（vocab 20 / grammar 10），
 *   对应 defaultTargets 本地表的初始值。
 *
 * 抽到此处供多页共用，消除原来散落在各视图里的重复字面量。
 */

/** 首页/学习中心每日词汇任务兜底值（用户未设置偏好时使用） */
export const homeDailyDefaults = {
  /** 每日新词数 */
  newWords: 10,
  /** 每日复习数 */
  reviewWords: 5,
} as const

/** 学习中心本地目标初始值（与首页兜底口径不同，保持独立） */
export const learningDailyTargets = {
  vocab: 20,
  grammar: 10,
} as const
