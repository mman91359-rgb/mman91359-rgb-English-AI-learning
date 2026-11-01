import { WRITING_SCORE_FIXTURES } from '../mocks/writing'
import type { WritingScore, WritingTopic } from '../types/writing'

export interface WritingScoringInput {
  topic: WritingTopic
  content: string
  wordCount: number
  durationSeconds: number
}

export interface WritingScoringService {
  score(input: WritingScoringInput): Promise<WritingScore>
}

function hashText(text: string): number {
  let hash = 0
  for (let index = 0; index < text.length; index += 1) {
    hash = (hash * 31 + text.charCodeAt(index)) | 0
  }
  return Math.abs(hash)
}

/** 预览模式评分：按作文长度与内容哈希确定性选择 fixture，同一篇作文结果稳定 */
export class MockWritingScoringService implements WritingScoringService {
  async score(input: WritingScoringInput): Promise<WritingScore> {
    const [minWords, maxWords] = input.topic.wordRange
    let index = hashText(`${input.topic.id}:${input.content}`) % WRITING_SCORE_FIXTURES.length
    if (input.wordCount < minWords * 0.6) index = 2
    else if (input.wordCount > maxWords * 0.95) index = 0

    const fixture = WRITING_SCORE_FIXTURES[index]
    return {
      ...fixture,
      scoredAt: new Date().toISOString(),
      weightedScore: Math.round((fixture.rawScore / fixture.maxRawScore) * 106.5 * 10) / 10,
      dimensions: { ...fixture.dimensions },
      strengths: [...fixture.strengths],
      issues: [...fixture.issues],
      corrections: fixture.corrections.map((item) => ({ ...item })),
      highlights: [...fixture.highlights],
      rewriteSuggestions: [...fixture.rewriteSuggestions],
    }
  }
}

export const writingScoringService: WritingScoringService = new MockWritingScoringService()
