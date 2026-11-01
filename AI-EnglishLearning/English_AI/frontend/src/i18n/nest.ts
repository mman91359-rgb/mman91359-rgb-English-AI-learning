type NestedMessages = Record<string, unknown>

/** 把 `a.b.c` 形式的扁平 key 转成 vue-i18n 需要的嵌套对象 */
export function nestMessages(flat: Record<string, string>, filter?: (key: string) => boolean): NestedMessages {
  const result: NestedMessages = {}
  Object.entries(flat).forEach(([key, value]) => {
    if (filter && !filter(key)) return
    const parts = key.split('.')
    let node = result
    parts.slice(0, -1).forEach((part) => {
      const next = node[part]
      if (!next || typeof next !== 'object') node[part] = {}
      node = node[part] as NestedMessages
    })
    node[parts[parts.length - 1]] = value
  })
  return result
}

/** 递归合并文案，后者覆盖前者 */
export function deepMerge(base: NestedMessages, extra: NestedMessages): NestedMessages {
  const result: NestedMessages = { ...base }
  Object.entries(extra).forEach(([key, value]) => {
    const current = result[key]
    if (current && typeof current === 'object' && value && typeof value === 'object' && !Array.isArray(value)) {
      result[key] = deepMerge(current as NestedMessages, value as NestedMessages)
    } else {
      result[key] = value
    }
  })
  return result
}
