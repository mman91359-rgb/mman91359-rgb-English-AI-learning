import type { WritingScore } from '../types/writing'

/** 三套示例评分，按作文内容确定性选择 */
export const WRITING_SCORE_FIXTURES: WritingScore[] = [
  {
    scoreVersion: 'mock-1',
    provider: 'MOCK',
    scoredAt: '',
    rawScore: 13,
    maxRawScore: 15,
    weightedScore: 92.3,
    level: 'EXCELLENT',
    dimensions: { content: 3, structure: 3, language: 3, vocabulary: 2, grammar: 2 },
    strengths: ['观点鲜明，开头直接回应题目', '段落之间衔接自然，逻辑清晰'],
    issues: ['个别表达仍可替换为更地道的搭配'],
    corrections: [
      {
        original: 'People should slow down their life.',
        suggestion: 'It is high time that people slowed down.',
        reason: '虚拟语气更委婉、更地道。',
        type: 'STRUCTURE',
      },
      {
        original: 'It is good for health.',
        suggestion: 'It contributes significantly to both physical and mental well-being.',
        reason: '“good”过于笼统，可替换为更具体的表达。',
        type: 'VOCABULARY',
      },
      {
        original: 'In a word , we should live slowly.',
        suggestion: 'In a word, we should live at a slower pace.',
        reason: '逗号前不应空格，且表达可更自然。',
        type: 'PUNCTUATION',
      },
    ],
    highlights: [
      'It is not about doing nothing, but about doing things with intention.',
      'Rather than chasing speed, we should seek meaning.',
    ],
    modelEssay:
      'In today\'s fast-paced world, the idea of "slow living" has gained increasing attention. It is not about rejecting progress, but about reclaiming time for what truly matters. Slowing down allows us to savor everyday moments, nurture relationships, and restore our mental well-being. Admittedly, a slower pace may not suit every career. Nevertheless, by setting aside time for reflection, we can make wiser choices. In short, slow living offers a balanced way to live with purpose.',
    rewriteSuggestions: ['尝试在第二段加入一个具体生活场景', '结尾可补充一条可执行的建议'],
  },
  {
    scoreVersion: 'mock-2',
    provider: 'MOCK',
    scoredAt: '',
    rawScore: 10,
    maxRawScore: 15,
    weightedScore: 71,
    level: 'PASS',
    dimensions: { content: 2, structure: 2, language: 2, vocabulary: 2, grammar: 2 },
    strengths: ['能够围绕题目展开，观点基本清楚', '使用了一些连接词组织段落'],
    issues: ['部分段落缺少过渡词', '个别句子主谓搭配不够完整', '词汇重复较多'],
    corrections: [
      {
        original: 'The life is very fast now.',
        suggestion: 'Life has become increasingly fast-paced.',
        reason: '“life”前不需要冠词，且可用更丰富的词汇表达节奏变化。',
        type: 'GRAMMAR',
      },
      {
        original: 'Many people thinks it is good.',
        suggestion: 'Many people think it is beneficial.',
        reason: '主谓一致错误，且“beneficial”更正式。',
        type: 'GRAMMAR',
      },
      {
        original: 'we can get more happy',
        suggestion: 'We can become happier.',
        reason: '句首字母应大写，“get more happy”搭配不自然。',
        type: 'SPELLING',
      },
    ],
    highlights: ['Slowing down does not mean falling behind.'],
    modelEssay:
      'Modern life moves quickly, but that does not mean we must move with it. A slower lifestyle can help us notice small joys and spend more time with the people we care about. Of course, we cannot ignore our responsibilities. What we need is a sensible balance between efficiency and rest. By planning our time carefully, we can enjoy both progress and peace.',
    rewriteSuggestions: ['为每个分论点补充一个例子', '检查主谓一致和冠词使用'],
  },
  {
    scoreVersion: 'mock-3',
    provider: 'MOCK',
    scoredAt: '',
    rawScore: 5,
    maxRawScore: 15,
    weightedScore: 35.5,
    level: 'POOR',
    dimensions: { content: 1, structure: 1, language: 1, vocabulary: 1, grammar: 1 },
    strengths: ['能够尝试表达个人态度'],
    issues: ['内容偏离题目要求，论据不足', '句子结构单一，语法错误较多', '缺少段落划分与过渡'],
    corrections: [
      {
        original: 'I think slow life is very very good.',
        suggestion: 'I believe that a slower lifestyle is beneficial in several ways.',
        reason: '避免重复使用“very”，并补全句子成分。',
        type: 'VOCABULARY',
      },
      {
        original: 'Because it can help us relax so we should do it.',
        suggestion: 'Because it helps us relax, we should make time for it.',
        reason: '“because”引导的原因状语从句需要与主句正确连接。',
        type: 'GRAMMAR',
      },
      {
        original: 'In my opinion ,we must slow.',
        suggestion: 'In my opinion, we should slow down.',
        reason: '逗号前后空格错误，且“slow”作动词时需搭配“down”。',
        type: 'PUNCTUATION',
      },
    ],
    highlights: [],
    modelEssay:
      'A balanced life requires both effort and rest. Although we live in a busy world, we can still choose to slow down in small ways, such as taking a walk or talking with family. These moments help us recover our energy. Therefore, we should learn to plan our time and leave room for rest.',
    rewriteSuggestions: ['先列提纲再写作，确保每段只讨论一个要点', '重点复习原因状语从句和主谓一致'],
  },
]

export const LEVEL_WORD_RANGE: Record<'CET4' | 'CET6', [number, number]> = {
  CET4: [120, 180],
  CET6: [150, 200],
}
