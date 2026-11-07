import flat from './handoff.en-US'
import { deepMerge, nestMessages } from '../nest'

const base = nestMessages(flat, (key) => !key.startsWith('writing.'))

/** 组件中使用、但交接稿未覆盖的补充文案 */
const extra = {
  common: {
    loading: 'Loading...',
    confirm: 'Confirm',
  },
  nav: {
    backToLearning: 'Back to Learning',
  },
  users: {
    actionSetPassword: 'Set new password',
    setPasswordTitle: 'Set new password',
    setPasswordTarget: 'Setting a new password for {name}.',
    setPasswordField: 'New password',
    setPasswordConfirmField: 'Confirm new password',
    setPasswordImpact: 'The old password stops working immediately after saving. Share the new password through a secure channel.',
    confirmSetPassword: 'Save new password',
    setPasswordToast: 'User password updated',
    passwordTooShort: 'Password must be at least 6 characters',
    passwordTooLong: 'Password must be at most 72 characters',
    passwordMismatch: 'The two passwords do not match',
    roleConfirmTitle: 'Confirm role change?',
  },
  notice: {
    publishNoExpire: 'Never expires',
  },
  detail: {
    fields: {
      eloScore: 'ELO',
      vocabularyScore: 'Vocabulary',
      grammarScore: 'Grammar',
      listeningScore: 'Listening',
      readingScore: 'Reading',
      balance: 'Balance',
      totalEarned: 'Total earned',
      checkInStreak: 'Check-in streak',
      dailyNewWords: 'Daily new words',
      dailyReviewWords: 'Daily review words',
      vocabGroupSize: 'Words per group',
      totalAnswered: 'Answered',
      correctRate: 'Accuracy',
      totalStudySeconds: 'Study time',
      activeDays: 'Active days',
      targetLevel: 'Target level',
      correctCount: 'Correct answers',
      errorCount: 'Wrong answers',
      totalDurationSeconds: 'Total seconds',
      totalHours: 'Total hours',
      totalMinutes: 'Total minutes',
      masteredWords: 'Mastered words',
      nationalRankPercent: 'National percentile',
      vocabularyComprehension: 'Vocabulary comprehension',
      heatmapData: 'Study heatmap',
    },
  },
}

export default deepMerge(base, extra)
