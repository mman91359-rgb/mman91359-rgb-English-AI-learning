export type WritingLevel = 'CET4' | 'CET6';

export type WritingTopicType = 'SHORT_ESSAY' | 'PRACTICAL' | 'ARGUMENTATIVE' | 'CHART' | 'LETTER';

export type WritingDimension = 'content' | 'structure' | 'language' | 'vocabulary' | 'grammar';

export type WritingCorrectionType = 'GRAMMAR' | 'VOCABULARY' | 'STRUCTURE' | 'SPELLING';

export type WritingScoreLevel = 'EXCELLENT' | 'GOOD' | 'PASS' | 'NEEDS_WORK';

export interface WritingTopic {
  id: string;
  type: WritingTopicType;
  level: WritingLevel;
  title: string;
  directions: string;
  requirements: string[];
  wordRange: [number, number];
  timeLimitSeconds: number;
  source?: string;
}

export interface WritingDraft {
  topicId: string;
  content: string;
  wordCount: number;
  updatedAt: string;
}

export interface WritingCorrection {
  original: string;
  suggestion: string;
  reason: string;
  type: WritingCorrectionType;
}

/** 总分满分 15 分，五个维度各 3 分 */
export interface WritingScore {
  total: number;
  level: WritingScoreLevel;
  dimensions: Record<WritingDimension, number>;
  strengths: string[];
  issues: string[];
  corrections: WritingCorrection[];
  highlights: string[];
  modelEssay: string;
}

/** 一次提交的作文记录，评分报告随记录一并保存 */
export interface WritingSubmission {
  id: string;
  topicId: string;
  wordCount: number;
  durationSeconds: number;
  totalScore: number;
  createdAt: string;
  report: WritingScore;
}
