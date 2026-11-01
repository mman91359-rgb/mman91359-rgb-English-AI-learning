import type {
  WritingCorrectionType,
  WritingDimension,
  WritingLevel,
  WritingScoreLevel,
  WritingTopicType,
} from '../types/writing'

export const WRITING_TYPES: readonly WritingTopicType[] = ['SHORT_ESSAY', 'PRACTICAL', 'ARGUMENTATIVE', 'CHART', 'LETTER']
export const WRITING_LEVELS: readonly WritingLevel[] = ['CET4', 'CET6']

export const WRITING_TYPE_META: Record<WritingTopicType, { icon: string; labelKey: string; descKey: string }> = {
  SHORT_ESSAY: { icon: 'edit_note', labelKey: 'writing.type.SHORT_ESSAY', descKey: 'writing.typeDesc.SHORT_ESSAY' },
  PRACTICAL: { icon: 'mail', labelKey: 'writing.type.PRACTICAL', descKey: 'writing.typeDesc.PRACTICAL' },
  ARGUMENTATIVE: { icon: 'forum', labelKey: 'writing.type.ARGUMENTATIVE', descKey: 'writing.typeDesc.ARGUMENTATIVE' },
  CHART: { icon: 'bar_chart', labelKey: 'writing.type.CHART', descKey: 'writing.typeDesc.CHART' },
  LETTER: { icon: 'drafts', labelKey: 'writing.type.LETTER', descKey: 'writing.typeDesc.LETTER' },
}

export const WRITING_LEVEL_LABEL_KEYS: Record<WritingLevel, string> = {
  CET4: 'writing.levelCET4',
  CET6: 'writing.levelCET6',
}

export const LEVEL_WORD_RANGE: Record<WritingLevel, [number, number]> = {
  CET4: [120, 180],
  CET6: [150, 200],
}

export const WRITING_DIMENSIONS: readonly WritingDimension[] = ['content', 'structure', 'language', 'vocabulary', 'grammar']

export const DIMENSION_LABEL_KEYS: Record<WritingDimension, string> = {
  content: 'writing.dim.content',
  structure: 'writing.dim.structure',
  language: 'writing.dim.language',
  vocabulary: 'writing.dim.vocabulary',
  grammar: 'writing.dim.grammar',
}

export const SCORE_MAX = 15
export const DIMENSION_MAX = 3
export const PASS_SCORE = 9

export const SCORE_LEVEL_LABEL_KEYS: Record<WritingScoreLevel, string> = {
  EXCELLENT: 'writing.level.EXCELLENT',
  GOOD: 'writing.level.GOOD',
  PASS: 'writing.level.PASS',
  NEEDS_WORK: 'writing.level.NEEDS_WORK',
  POOR: 'writing.level.POOR',
}

export const CORRECTION_TYPE_LABEL_KEYS: Record<WritingCorrectionType, string> = {
  GRAMMAR: 'writing.correction.GRAMMAR',
  VOCABULARY: 'writing.correction.VOCABULARY',
  STRUCTURE: 'writing.correction.STRUCTURE',
  SPELLING: 'writing.correction.SPELLING',
  PUNCTUATION: 'writing.correction.PUNCTUATION',
}

export const SCORING_STEP_KEYS: readonly string[] = [
  'writing.step.grammar',
  'writing.step.structure',
  'writing.step.vocabulary',
  'writing.step.report',
]

export function scoreLevelOf(rawScore: number): WritingScoreLevel {
  if (rawScore >= 13) return 'EXCELLENT'
  if (rawScore >= 11) return 'GOOD'
  if (rawScore >= 9) return 'PASS'
  if (rawScore >= 6) return 'NEEDS_WORK'
  return 'POOR'
}
