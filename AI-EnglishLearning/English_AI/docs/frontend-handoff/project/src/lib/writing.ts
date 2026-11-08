import type { MessageKey } from '@/i18n/zh-CN';
import type {
  WritingCorrectionType,
  WritingDimension,
  WritingLevel,
  WritingScoreLevel,
  WritingTopicType,
} from '@/types/writing';

export const WRITING_TYPES: readonly WritingTopicType[] = ['SHORT_ESSAY', 'PRACTICAL', 'ARGUMENTATIVE', 'CHART', 'LETTER'];

export const WRITING_LEVELS: readonly WritingLevel[] = ['CET4', 'CET6'];

export const WRITING_TYPE_META: Record<WritingTopicType, { icon: string; labelKey: MessageKey; descKey: MessageKey }> = {
  SHORT_ESSAY: { icon: 'edit_note', labelKey: 'writing.type.SHORT_ESSAY', descKey: 'writing.typeDesc.SHORT_ESSAY' },
  PRACTICAL: { icon: 'mail', labelKey: 'writing.type.PRACTICAL', descKey: 'writing.typeDesc.PRACTICAL' },
  ARGUMENTATIVE: { icon: 'forum', labelKey: 'writing.type.ARGUMENTATIVE', descKey: 'writing.typeDesc.ARGUMENTATIVE' },
  CHART: { icon: 'bar_chart', labelKey: 'writing.type.CHART', descKey: 'writing.typeDesc.CHART' },
  LETTER: { icon: 'drafts', labelKey: 'writing.type.LETTER', descKey: 'writing.typeDesc.LETTER' },
};

export const WRITING_LEVEL_LABEL_KEYS: Record<WritingLevel, MessageKey> = {
  CET4: 'writing.levelCET4',
  CET6: 'writing.levelCET6',
};

/** 建议字数范围，与题目数据中的 wordRange 口径一致 */
export const LEVEL_WORD_RANGE: Record<WritingLevel, [number, number]> = {
  CET4: [120, 180],
  CET6: [150, 200],
};

export const WRITING_DIMENSIONS: readonly WritingDimension[] = ['content', 'structure', 'language', 'vocabulary', 'grammar'];

export const DIMENSION_LABEL_KEYS: Record<WritingDimension, MessageKey> = {
  content: 'writing.dim.content',
  structure: 'writing.dim.structure',
  language: 'writing.dim.language',
  vocabulary: 'writing.dim.vocabulary',
  grammar: 'writing.dim.grammar',
};

export const SCORE_MAX = 15;
export const DIMENSION_MAX = 3;
/** 低于该分数的作文进入错题本 */
export const PASS_SCORE = 9;

export const SCORE_LEVEL_LABEL_KEYS: Record<WritingScoreLevel, MessageKey> = {
  EXCELLENT: 'writing.level.EXCELLENT',
  GOOD: 'writing.level.GOOD',
  PASS: 'writing.level.PASS',
  NEEDS_WORK: 'writing.level.NEEDS_WORK',
};

export const CORRECTION_TYPE_LABEL_KEYS: Record<WritingCorrectionType, MessageKey> = {
  GRAMMAR: 'writing.correction.GRAMMAR',
  VOCABULARY: 'writing.correction.VOCABULARY',
  STRUCTURE: 'writing.correction.STRUCTURE',
  SPELLING: 'writing.correction.SPELLING',
};

export const SCORING_STEP_KEYS: readonly MessageKey[] = [
  'writing.step.grammar',
  'writing.step.structure',
  'writing.step.vocabulary',
  'writing.step.report',
];

/** 统计英文单词数，按空白切分 */
export function countWords(text: string): number {
  const trimmed = text.trim();
  return trimmed ? trimmed.split(/\s+/).length : 0;
}
