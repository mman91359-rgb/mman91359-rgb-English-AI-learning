import flat from './handoff.zh-CN'
import { deepMerge, nestMessages } from '../nest'

const base = nestMessages(flat, (key) => !key.startsWith('writing.'))

/** 组件中使用、但交接稿未覆盖的补充文案 */
const extra = {
  common: {
    loading: '加载中...',
    confirm: '确认',
  },
  nav: {
    backToLearning: '返回学习中心',
  },
  users: {
    actionSetPassword: '设置新密码',
    setPasswordTitle: '设置新密码',
    setPasswordTarget: '正在为 {name} 设置新密码。',
    setPasswordField: '新密码',
    setPasswordConfirmField: '确认新密码',
    setPasswordImpact: '保存后用户旧密码立即失效，请通过安全渠道告知用户新密码。',
    confirmSetPassword: '保存新密码',
    setPasswordToast: '用户密码已更新',
    passwordTooShort: '新密码不能少于 6 位',
    passwordMismatch: '两次输入的新密码不一致',
  },
  detail: {
    fields: {
      eloScore: 'ELO',
      vocabularyScore: '词汇',
      grammarScore: '语法',
      listeningScore: '听力',
      readingScore: '阅读',
      balance: '余额',
      totalEarned: '累计获得',
      checkInStreak: '连续签到',
      dailyNewWords: '每日新词',
      dailyReviewWords: '每日复习',
      vocabGroupSize: '每组词数',
      totalAnswered: '累计答题',
      correctRate: '正确率',
      totalStudySeconds: '学习时长',
      activeDays: '活跃天数',
      targetLevel: '目标级别',
      correctCount: '答对题数',
      errorCount: '答错题数',
      totalDurationSeconds: '累计学习秒数',
      totalHours: '累计小时',
      totalMinutes: '累计分钟',
      masteredWords: '已掌握单词',
      nationalRankPercent: '全国排名百分位',
      vocabularyComprehension: '词汇理解率',
      heatmapData: '学习热力图',
    },
  },
}

export default deepMerge(base, extra)
