/**
 * CET 官方笔试日期表。
 *
 * 数据来源：中国教育考试网（cet.neea.edu.cn / www.neea.edu.cn）历年报名公告，
 * 最近一次核对：2026-11-22。只收录官方已公布的确切日期。
 *
 * 为什么不按「每年 6 月 / 12 月第 N 个周六」自动推算：
 *   1. 官方每年年初才公布具体日期，推算值可能与实际差一周；
 *   2. 考次并不固定在某个周六序号 —— 2026 年 6 月 13 日、12 月 12 日
 *      都是当月第二个周六，而非某些资料所说的「第三个周六」；
 *   3. 遇疫情等特殊情况可能延期或拆分考次（2020 年即为例外）。
 * 因此宁可缺日期时提示用户手动设置，也不写入推算的假日期。
 *
 * 维护方式：每年年初官方公布新考次后，在此表按日期升序追加一条。
 */
export interface ExamDateEntry {
  /** 考试日期，yyyy-MM-dd */
  date: string
  /** 展示用考次名称 */
  label: string
}

/** 官方已公布的 CET 笔试日期，按日期升序 */
export const OFFICIAL_EXAM_DATES: readonly ExamDateEntry[] = [
  { date: '2025-12-13', label: '2025年下半年' },
  { date: '2026-06-13', label: '2026年上半年' },
  { date: '2026-12-12', label: '2026年下半年' },
]

const pad = (value: number): string => String(value).padStart(2, '0')

/** 本地日期的 yyyy-MM-dd 串（与 exam_date 字段、日期输入框口径一致） */
export const toDateString = (date: Date): string =>
  `${date.getFullYear()}-${pad(date.getMonth() + 1)}-${pad(date.getDate())}`

/**
 * 取指定日期之后的下一场官方考试日期。
 * yyyy-MM-dd 是定长补零格式，字符串比较等价于日期比较。
 * 官方尚未公布下一场时返回 null —— 调用方须提示用户手动设置，不得推算假日期。
 */
export const getNextOfficialExamDate = (from: Date = new Date()): string | null => {
  const today = toDateString(from)
  return OFFICIAL_EXAM_DATES.find((entry) => entry.date >= today)?.date ?? null
}
