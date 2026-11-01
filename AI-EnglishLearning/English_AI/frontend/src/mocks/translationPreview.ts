/**
 * 翻译模块纯前端预览数据。
 * 不调用任何后端接口，仅用于还原静态设计稿的样式与交互。
 */

export interface TranslationFeedback {
  status: 'correct' | 'incorrect'
  message: string
  tags: string[]
}

export interface TranslationReferenceSegment {
  text: string
  highlight?: boolean
}

export interface TranslationKeyPhrase {
  cn: string
  en: string
}

export interface TranslationFixture {
  id: string
  levelLabel: string
  source: string
  sourceLabel: string
  suggestedWords: [number, number]
  hint: string
  referenceSegments: TranslationReferenceSegment[]
  keyPhrases: TranslationKeyPhrase[]
  feedback: {
    correct: TranslationFeedback
    incorrect: TranslationFeedback
  }
}

const commonReference = 'The company is famous worldwide for its high-quality products and has maintained an industry-leading position over the past decade.'

export const translationFixtures: Record<'short' | 'medium' | 'long', TranslationFixture> = {
  short: {
    id: 'translation-preview-short',
    levelLabel: '短句翻译',
    source: '这家公司以高质量的产品闻名于世。',
    sourceLabel: '[来源] 样式预览 · 短句',
    suggestedWords: [5, 10],
    hint: '可用 be famous for / high-quality products。',
    referenceSegments: [
      { text: 'The company is ' },
      { text: 'famous worldwide', highlight: true },
      { text: ' for its high-quality products.' },
    ],
    keyPhrases: [
      { cn: '闻名于世', en: 'be famous worldwide' },
      { cn: '高质量产品', en: 'high-quality products' },
    ],
    feedback: {
      correct: {
        status: 'correct',
        message: '翻译准确，"be famous worldwide" 和 "high-quality products" 使用自然。',
        tags: ['be famous worldwide', '用词准确'],
      },
      incorrect: {
        status: 'incorrect',
        message: '"闻名于世" 不建议直译为 "famous in the world"，更自然的是 "be famous worldwide"。',
        tags: ['be famous for', '搭配'],
      },
    },
  },
  medium: {
    id: 'translation-preview-medium',
    levelLabel: '中句翻译',
    source: '这家公司以高质量的产品闻名于世，并且在过去的十年里一直保持着行业领先地位。',
    sourceLabel: '[来源] 样式预览 · 中句',
    suggestedWords: [10, 20],
    hint: '注意并列句结构：and / moreover；"保持领先地位" 可用 maintain an industry-leading position。',
    referenceSegments: [
      { text: 'The company is ' },
      { text: 'famous worldwide', highlight: true },
      { text: ' for its high-quality products and has ' },
      { text: 'maintained an industry-leading position', highlight: true },
      { text: ' over the past decade.' },
    ],
    keyPhrases: [
      { cn: '闻名于世', en: 'be famous worldwide' },
      { cn: '行业领先', en: 'industry-leading' },
      { cn: '过去十年', en: 'over the past decade' },
    ],
    feedback: {
      correct: {
        status: 'correct',
        message: '句式完整，两个并列谓语使用 "and" 连接自然；"maintained an industry-leading position" 准确对应“保持行业领先地位”。',
        tags: ['famous worldwide', '并列句结构'],
      },
      incorrect: {
        status: 'incorrect',
        message: '句式结构有问题。"闻名于世" 应使用 "be famous worldwide" 或 "be world-renowned"，而非直译。另外 "并且" 在英文中更适合用 "and" 或 "moreover" 连接两个并列句。',
        tags: ['be famous for', '并列句结构'],
      },
    },
  },
  long: {
    id: 'translation-preview-long',
    levelLabel: '长句翻译',
    source: '尽管这家公司在过去十年里一直保持着行业领先地位，但随着越来越多的竞争者进入市场，它仍然需要持续投入研发，以维持高质量产品带来的优势。',
    sourceLabel: '[来源] 样式预览 · 长句',
    suggestedWords: [20, 40],
    hint: '注意让步状语 although / even though，以及目的状语 to maintain...。',
    referenceSegments: [
      { text: 'Although the company has ' },
      { text: 'maintained an industry-leading position', highlight: true },
      { text: ' over the past decade, it still needs to keep investing in R&D as more competitors enter the market, so as to ' },
      { text: 'maintain the advantage', highlight: true },
      { text: ' brought by its high-quality products.' },
    ],
    keyPhrases: [
      { cn: '行业领先地位', en: 'industry-leading position' },
      { cn: '持续投入研发', en: 'keep investing in R&D' },
      { cn: '维持优势', en: 'maintain the advantage' },
    ],
    feedback: {
      correct: {
        status: 'correct',
        message: '让步状语和目的状语处理得当，逻辑关系清晰，"keep investing in R&D" 与 "maintain the advantage" 使用准确。',
        tags: ['although', '目的状语'],
      },
      incorrect: {
        status: 'incorrect',
        message: '长句逻辑关系不够清晰。建议用 "Although..." 引导让步状语，再用 "so as to..." 表达目的；"维持优势" 可用 "maintain the advantage"。',
        tags: ['让步状语', 'so as to'],
      },
    },
  },
}

export const getTranslationFixture = (length?: string): TranslationFixture => {
  if (length === 'short' || length === 'long' || length === 'medium') {
    return translationFixtures[length]
  }
  return translationFixtures.medium
}

export { commonReference }
