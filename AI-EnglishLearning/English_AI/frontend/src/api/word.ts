import { get } from './request'

/**
 * 单词详情（统一查词入口）。
 * 前端组件只依赖本文件，不直接依赖 ai-service 的地址与 DTO。
 * 当前内部指向 ai-service 的 /ai/word-detail（C1 阶段），
 * 将来演进到 C3（本地词典优先 + AI 回退）时，只需改本文件实现，组件契约不变。
 */
export interface WordDetail {
    /** 单词原形 */
    word: string
    /** 音标，如 /ˈsɜːkəmstəns/ */
    phonetic: string
    /** 词性，如 n./v./adj. */
    pos: string
    /** 中文释义 */
    translation: string
    /** 英文例句 */
    example: string
    /** 例句中文翻译 */
    exampleTranslation: string
    /** 常见搭配，分号分隔 */
    collocation: string
}

/**
 * 查询单词详情。
 * @param word 英文单词
 */
export function getWordDetail(word: string): Promise<WordDetail> {
    return get<WordDetail>('/ai/word-detail', { word })
}
