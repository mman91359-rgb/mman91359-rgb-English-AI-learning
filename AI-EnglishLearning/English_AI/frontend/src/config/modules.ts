/**
 * 模块类型与来源的统一映射。
 * 页面只拿 i18n key，具体翻译由调用方传入的 t 完成。
 */
export type Translate = (key: string) => string

export const MODULE_NAME_KEYS: Record<number, string> = {
  1: 'dashboard.moduleVocabulary',
  2: 'dashboard.moduleGrammar',
  3: 'dashboard.moduleTranslation',
  4: 'dashboard.moduleListening',
  5: 'learning.moduleSentenceMaking',
  6: 'dashboard.moduleWriting',
}

export const MODULE_SOURCE_TYPES: Record<string, number> = {
  vocab: 1,
  grammar: 2,
  translation: 3,
  listening: 4,
  writing: 6,
}

export function moduleName(type: number, t: Translate, fallbackType = 0): string {
  const key = MODULE_NAME_KEYS[type] || MODULE_NAME_KEYS[fallbackType]
  return key ? t(key) : ''
}

export function moduleTypeFromSource(source: string): number | null {
  if (!source) return null
  return MODULE_SOURCE_TYPES[source.toLowerCase()] ?? null
}
