import { computed, ref } from 'vue'
import { useI18n } from 'vue-i18n'
import { getCheckInRecords } from '@/api/coin'
import { useUserStore } from '@/stores/user'

/**
 * 签到日历的数据与状态推导。
 *
 * 只负责「拿数据 + 算状态」，不负责渲染，供首页与个人资料页共用，
 * 避免两处各写一遍日期推算（这类代码一旦分叉，两页的圆圈就会对不上）。
 */

/** 单日状态：签到 / 漏签 / 今天已签 / 今天未签 / 尚未到 / 首签之前（空白） */
export type CheckInDayState =
  | 'checked'
  | 'missed'
  | 'today-checked'
  | 'today-pending'
  | 'future'
  | 'idle'

export interface CheckInDay {
  /** yyyy-MM-dd */
  date: string
  /** MON / TUE … */
  label: string
  state: CheckInDayState
  /** 当月日历里的日号；周条不显示 */
  dayOfMonth: number | null
}

const WEEKDAY_KEYS = ['mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun'] as const

const pad = (n: number): string => String(n).padStart(2, '0')

/** 本地时区的 yyyy-MM-dd，不用 toISOString（那是 UTC，会差一天） */
const toKey = (d: Date): string => `${d.getFullYear()}-${pad(d.getMonth() + 1)}-${pad(d.getDate())}`

const addDays = (d: Date, n: number): Date => {
  const next = new Date(d.getTime())
  next.setDate(next.getDate() + n)
  return next
}

const startOfDay = (d: Date): Date => {
  const next = new Date(d.getTime())
  next.setHours(0, 0, 0, 0)
  return next
}

/** 本周周一（周一为一周起点） */
const mondayOf = (d: Date): Date => {
  const base = startOfDay(d)
  const offset = (base.getDay() + 6) % 7
  return addDays(base, -offset)
}

export function useCheckInCalendar() {
  const { t } = useI18n()
  const userStore = useUserStore()

  const today = startOfDay(new Date())
  const todayKey = toKey(today)

  /** 日历当前展示的月份，yyyy-MM */
  const month = ref(`${today.getFullYear()}-${pad(today.getMonth() + 1)}`)

  const checkedDates = ref<Set<string>>(new Set())
  const earliestDate = ref<string | null>(null)
  const streakDays = ref(0)
  const loading = ref(false)
  /** 首次成功加载过（区分「正在加载」与「加载完但没数据」，避免骨架屏闪烁） */
  const loaded = ref(false)
  const error = ref('')

  /** 只允许翻到本月，不允许翻到未来 */
  const canGoNext = computed(() => month.value < todayKey.slice(0, 7))

  const weekStart = computed(() => mondayOf(today))

  const monthParts = computed(() => {
    const [year, m] = month.value.split('-').map(Number)
    return { year, month: m }
  })

  const stateOf = (dateKey: string): CheckInDayState => {
    if (dateKey > todayKey) return 'future'
    if (checkedDates.value.has(dateKey)) {
      return dateKey === todayKey ? 'today-checked' : 'checked'
    }
    if (dateKey === todayKey) return 'today-pending'
    // 首签之前的日子用户还没开始用，画成漏签会冤枉人
    if (earliestDate.value && dateKey < earliestDate.value) return 'idle'
    return 'missed'
  }

  /** 本周七天（周一起） */
  const weekDays = computed<CheckInDay[]>(() =>
    WEEKDAY_KEYS.map((key, i) => {
      const dateKey = toKey(addDays(weekStart.value, i))
      return { date: dateKey, label: t(`checkIn.weekday.${key}`), state: stateOf(dateKey), dayOfMonth: null }
    }),
  )

  /** 当月网格：前导空位用 null 补齐，保证周一起排 */
  const monthDays = computed<(CheckInDay | null)[]>(() => {
    const { year, month: m } = monthParts.value
    const first = new Date(year, m - 1, 1)
    const leading = (first.getDay() + 6) % 7
    const total = new Date(year, m, 0).getDate()

    const cells: (CheckInDay | null)[] = Array.from({ length: leading }, () => null)
    for (let day = 1; day <= total; day += 1) {
      const dateKey = `${year}-${pad(m)}-${pad(day)}`
      cells.push({
        date: dateKey,
        label: t(`checkIn.weekday.${WEEKDAY_KEYS[(leading + day - 1) % 7]}`),
        state: stateOf(dateKey),
        dayOfMonth: day,
      })
    }
    while (cells.length % 7 !== 0) cells.push(null)
    return cells
  })

  /** 本月已签到的天数（只统计当月，不受区间请求影响） */
  const monthCheckedCount = computed(() => {
    let count = 0
    for (const day of monthDays.value) {
      if (day && (day.state === 'checked' || day.state === 'today-checked')) count += 1
    }
    return count
  })

  const monthLabel = computed(() =>
    t('checkIn.calendar.monthLabel', { year: monthParts.value.year, month: monthParts.value.month }),
  )

  /** 拉取「当月首尾 ∪ 本周首尾」的并集区间，一次覆盖卡片周条与日历网格 */
  const reload = async (): Promise<void> => {
    const userId = userStore.userId
    if (!userId) return

    loading.value = true
    error.value = ''
    try {
      const { year, month: m } = monthParts.value
      const monthStart = new Date(year, m - 1, 1)
      const monthEnd = new Date(year, m, 0)
      const from = monthStart < weekStart.value ? monthStart : weekStart.value
      const weekEnd = addDays(weekStart.value, 6)
      const to = monthEnd > weekEnd ? monthEnd : weekEnd

      const res = await getCheckInRecords(userId, toKey(from), toKey(to))
      checkedDates.value = new Set(res.records.map((item) => item.date))
      earliestDate.value = res.earliestDate
      streakDays.value = res.streakDays ?? 0
      loaded.value = true
    } catch {
      error.value = t('checkIn.calendar.loadFailed')
    } finally {
      loading.value = false
    }
  }

  const prevMonth = (): void => {
    const { year, month: m } = monthParts.value
    const prev = new Date(year, m - 2, 1)
    month.value = `${prev.getFullYear()}-${pad(prev.getMonth() + 1)}`
    void reload()
  }

  const nextMonth = (): void => {
    if (!canGoNext.value) return
    const { year, month: m } = monthParts.value
    const next = new Date(year, m, 1)
    month.value = `${next.getFullYear()}-${pad(next.getMonth() + 1)}`
    void reload()
  }

  const stateText = (state: CheckInDayState): string => t(checkInStateLabelKey(state))

  return {
    month,
    monthParts,
    monthLabel,
    monthDays,
    monthCheckedCount,
    weekDays,
    streakDays,
    loading,
    loaded,
    error,
    canGoNext,
    todayKey,
    reload,
    prevMonth,
    nextMonth,
    stateText,
  }
}

/** 单日状态 → i18n key，供展示组件直接取文案 */
export const checkInStateLabelKey = (state: CheckInDayState): string => {
  switch (state) {
    case 'checked':
      return 'checkIn.calendar.stateChecked'
    case 'today-checked':
      return 'checkIn.calendar.stateTodayChecked'
    case 'today-pending':
      return 'checkIn.calendar.stateTodayPending'
    case 'future':
      return 'checkIn.calendar.stateFuture'
    case 'missed':
      return 'checkIn.calendar.stateMissed'
    default:
      return ''
  }
}
