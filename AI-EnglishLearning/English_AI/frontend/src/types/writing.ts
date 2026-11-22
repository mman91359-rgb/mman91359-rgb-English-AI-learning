export type WritingLevel = 'CET4' | 'CET6'

export type WritingTopicType = 'SHORT_ESSAY' | 'PRACTICAL' | 'ARGUMENTATIVE' | 'CHART' | 'LETTER'

export type WritingDimension = 'content' | 'structure' | 'language' | 'vocabulary' | 'grammar'

export type WritingCorrectionType = 'GRAMMAR' | 'VOCABULARY' | 'STRUCTURE' | 'SPELLING' | 'PUNCTUATION'

export type WritingScoreLevel = 'EXCELLENT' | 'GOOD' | 'PASS' | 'NEEDS_WORK' | 'POOR'

export type WritingSubmissionStatus = 'SCORED' | 'DRAFT' | 'SCORING' | 'FAILED'

export interface WritingTopic {
  id: string
  type: WritingTopicType
  level: WritingLevel
  title: string
  directions: string
  topic: string
  requirements: string[]
  wordRange: [number, number]
  timeLimitSeconds: number
  source?: string
  outlineHints: string[]
  usefulExpressions: string[]
}

export interface WritingDraft {
  topicId: string
  content: string
  wordCount: number
  updatedAt: string
  /** 已写作秒数：恢复草稿后倒计时按剩余时间继续，而不是重置满 30 分钟 */
  elapsedSeconds?: number
}

export interface WritingCorrection {
  original: string
  suggestion: string
  reason: string
  type: WritingCorrectionType
}

/** 总分满分 15 分，五个维度各 3 分；weightedScore = rawScore / 15 * 106.5 */
export interface WritingScore {
  scoreVersion: string
  provider: 'MOCK' | 'LLM'
  scoredAt: string
  rawScore: number
  maxRawScore: 15
  weightedScore: number
  level: WritingScoreLevel
  dimensions: Record<WritingDimension, number>
  strengths: string[]
  issues: string[]
  corrections: WritingCorrection[]
  highlights: string[]
  modelEssay: string
  rewriteSuggestions: string[]
}

export interface WritingSubmission {
  id: string
  topicId: string
  content: string
  wordCount: number
  durationSeconds: number
  rawScore: number
  weightedScore: number
  status: WritingSubmissionStatus
  createdAt: string
  report: WritingScore
}

export interface WritingHistoryItem {
  id: string
  topicId: string
  title: string
  type: WritingTopicType | null
  score: number | null
  wordCount: number
  durationSeconds: number
  createdAt: string
  status: WritingSubmissionStatus
}
