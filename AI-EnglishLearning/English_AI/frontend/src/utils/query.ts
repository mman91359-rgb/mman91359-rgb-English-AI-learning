import type { LocationQuery, LocationQueryRaw } from 'vue-router'

export const PAGE_SIZE_OPTIONS = [20, 50, 100] as const

function pick(value: LocationQuery[string]): string | undefined {
  if (Array.isArray(value)) return value[0] || undefined
  return value || undefined
}

export function readString(query: LocationQuery, key: string): string | undefined {
  return pick(query[key])
}

export function readPage(query: LocationQuery): number {
  const page = Number(pick(query.page))
  return Number.isInteger(page) && page >= 1 ? page : 1
}

export function readSize(query: LocationQuery): number {
  const size = Number(pick(query.size))
  return (PAGE_SIZE_OPTIONS as readonly number[]).includes(size) ? size : PAGE_SIZE_OPTIONS[0]
}

export function readEnum<T extends string>(query: LocationQuery, key: string, values: readonly T[]): T | undefined {
  const value = pick(query[key])
  return values.find((item) => item === value)
}

export function readNumberEnum<T extends number>(query: LocationQuery, key: string, values: readonly T[]): T | undefined {
  const raw = pick(query[key])
  if (raw === undefined) return undefined
  return values.find((item) => String(item) === raw)
}

export function readPositiveInt(query: LocationQuery, key: string): number | undefined {
  const value = Number(pick(query[key]))
  return Number.isInteger(value) && value > 0 ? value : undefined
}

/** 清空值为空的查询参数，避免 URL 出现 `?keyword=` */
export function compactQuery(patch: LocationQueryRaw): LocationQueryRaw {
  const next: LocationQueryRaw = {}
  Object.entries(patch).forEach(([key, value]) => {
    if (value === undefined || value === null || value === '') return
    next[key] = value
  })
  return next
}
