import { get } from './request'

/**
 * 常考等级标记：标注该义项在四级 / 六级中的考查归属。
 * 后端字典当前尚未提供该字段，前端预留；缺失时按「非考点义」渲染。
 */
export type ExamLevel = 'cet4' | 'cet6' | 'both'

/** 单个义项：词性 + 释义，可带常考标记 */
export interface WordSense {
    /** 词性，如 n./v./adj. */
    pos: string
    /** 中文释义 */
    meaning: string
    /** 常考等级；null 或缺省表示非考点义 */
    examLevel?: ExamLevel | null
}

/** 常用搭配：英文短语 + 中文释义（中文可为空） */
export interface WordCollocation {
    phrase: string
    translation: string
}

/** 例句：英文 + 中文翻译（中文可为空） */
export interface WordExample {
    en: string
    cn: string
}

/** 英美音标，任一可缺失 */
export interface WordPhonetics {
    us?: string
    uk?: string
}

/**
 * 原始响应结构：兼容后端新旧两种返回。
 * 旧字段（pos / translation / collocation / example）为单个字符串，
 * 新字段（senses / collocations / examples）为结构化数组。
 */
export interface WordDetailRaw {
    word: string
    phonetic?: string
    phonetics?: WordPhonetics
    pos?: string
    translation?: string
    senses?: WordSense[]
    collocation?: string
    collocations?: WordCollocation[]
    example?: string
    exampleTranslation?: string
    examples?: WordExample[]
    tags?: string[]
}

/**
 * 单词详情（组件侧统一结构）。
 * 结构化字段直接给组件用，字符串拆分与新旧兼容收敛在 normalizeWordDetail 内。
 */
export interface WordDetail {
    /** 单词原形 */
    word: string
    /** 默认音标（优先美音） */
    phonetic: string
    /** 英美音标 */
    phonetics: WordPhonetics
    /** 义项列表，后端无释义时为空数组 */
    senses: WordSense[]
    /** 常用搭配 */
    collocations: WordCollocation[]
    /** 例句 */
    examples: WordExample[]
    /** 标签，如「四六级高频」；后端未提供时为空数组 */
    tags: string[]
}

/**
 * 把后端响应归一化为组件结构。
 * 旧版单字段（分号分隔的搭配、单条例句）在这里折叠成数组，
 * 组件层不再做兼容判断。
 * @param raw 后端原始响应
 */
export function normalizeWordDetail(raw: WordDetailRaw): WordDetail {
    const senses: WordSense[] = raw.senses?.length
        ? raw.senses
        : raw.translation
            ? [{ pos: raw.pos ?? '', meaning: raw.translation, examLevel: null }]
            : []

    const collocations: WordCollocation[] = raw.collocations?.length
        ? raw.collocations
        : (raw.collocation ?? '')
            .split(/[;；]/)
            .map((item) => item.trim())
            .filter((item) => item.length > 0)
            .map((phrase) => ({ phrase, translation: '' }))

    const examples: WordExample[] = raw.examples?.length
        ? raw.examples
        : raw.example
            ? [{ en: raw.example, cn: raw.exampleTranslation ?? '' }]
            : []

    const phonetics: WordPhonetics = raw.phonetics ?? {}

    return {
        word: raw.word,
        phonetic: raw.phonetic ?? phonetics.us ?? phonetics.uk ?? '',
        phonetics,
        senses,
        collocations,
        examples,
        tags: raw.tags ?? [],
    }
}

/**
 * 查询单词详情。
 * 当前内部指向 ai-service 的 /ai/word-detail，
 * 将来演进到本地词典优先 + AI 回退时只需改本文件实现，组件契约不变。
 * @param word 英文单词
 */
export async function getWordDetail(word: string): Promise<WordDetail> {
    const raw = await get<WordDetailRaw>('/ai/word-detail', { word })
    return normalizeWordDetail(raw)
}
