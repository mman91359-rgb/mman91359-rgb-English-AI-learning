export const PAGE_SIZE_OPTIONS = [20, 50, 100] as const;

export function readPage(params: URLSearchParams): number {
  const page = Number(params.get('page'));
  return Number.isInteger(page) && page >= 1 ? page : 1;
}

export function readSize(params: URLSearchParams): number {
  const size = Number(params.get('size'));
  return (PAGE_SIZE_OPTIONS as readonly number[]).includes(size) ? size : PAGE_SIZE_OPTIONS[0];
}

export function readString(params: URLSearchParams, key: string): string | undefined {
  return params.get(key) || undefined;
}

export function readEnum<T extends string>(params: URLSearchParams, key: string, values: readonly T[]): T | undefined {
  const value = params.get(key);
  return values.find((item) => item === value);
}

export function readNumberEnum<T extends number>(params: URLSearchParams, key: string, values: readonly T[]): T | undefined {
  const raw = params.get(key);
  if (raw === null) return undefined;
  return values.find((item) => String(item) === raw);
}

export function readPositiveInt(params: URLSearchParams, key: string): number | undefined {
  const value = Number(params.get(key));
  return Number.isInteger(value) && value > 0 ? value : undefined;
}
