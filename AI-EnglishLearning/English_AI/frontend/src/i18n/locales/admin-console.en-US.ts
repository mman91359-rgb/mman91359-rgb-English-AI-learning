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
