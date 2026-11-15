<template>
  <BaseDialog
    :visible="visible"
    :title="$t('checkIn.calendar.title')"
    max-width="max-w-2xl"
    @update:visible="emit('update:visible', $event)"
  >
    <!-- 月份切换 -->
    <div class="mb-5 flex items-center justify-between">
      <button
        type="button"
        :class="btnIconSm"
        :aria-label="$t('checkIn.calendar.prevMonth')"
        @click="onPrev"
      >
        <span class="material-symbols-outlined text-icon-md" aria-hidden="true">chevron_left</span>
      </button>
      <span class="font-label-lg text-label-lg text-on-surface tabular-nums sm:font-headline-sm sm:text-headline-sm">{{ monthLabel }}</span>
      <button
        type="button"
        :class="btnIconSm"
        :disabled="!canGoNext"
        :aria-label="$t('checkIn.calendar.nextMonth')"
        @click="onNext"
      >
        <span class="material-symbols-outlined text-icon-md" aria-hidden="true">chevron_right</span>
      </button>
    </div>

    <!-- 星期表头：与周条同一套 MON…SUN -->
    <div class="mb-3 grid grid-cols-7 gap-1 sm:gap-2">
      <span
        v-for="key in WEEKDAY_KEYS"
        :key="key"
        class="text-center font-label-md text-label-md tracking-wide text-outline sm:font-label-lg sm:text-label-lg"
      >
        {{ $t(`checkIn.weekday.${key}`) }}
      </span>
    </div>

    <!-- 加载失败：内联错误 + 重试，不让弹窗空着 -->
    <div v-if="error" class="flex flex-col items-center gap-3 py-10">
      <p class="font-body-sm text-body-sm text-error">{{ error }}</p>
      <button type="button" class="font-label-lg text-label-lg text-primary hover:underline" @click="emit('retry')">
        {{ $t('checkIn.calendar.retry') }}
      </button>
    </div>

    <!-- 骨架 -->
    <div v-else-if="loading && !loaded" class="grid grid-cols-7 gap-1 sm:gap-2" aria-hidden="true">
      <span
        v-for="i in 35"
        :key="i"
        class="mx-auto h-9 w-9 rounded-full bg-surface-container-high animate-pulse sm:h-14 sm:w-14"
      ></span>
    </div>

    <!-- 月网格：仅本月漏签日可点选 -->
    <div v-else class="grid grid-cols-7 gap-1 sm:gap-2" role="grid">
      <template v-for="(day, index) in days" :key="day ? day.date : `blank-${index}`">
        <span v-if="!day" role="gridcell"></span>
        <span v-else class="flex justify-center" role="gridcell">
          <button
            v-if="isSelectable(day)"
            type="button"
            :class="[CELL_BASE, cellClass(day), SELECTABLE_BASE]"
            :aria-label="`${day.dayOfMonth} ${stateText(day.state)}`"
            :aria-pressed="selectedDate === day.date"
            @click="selectDate(day)"
          >
            {{ day.dayOfMonth }}
          </button>
          <span
            v-else
            :class="[CELL_BASE, cellClass(day)]"
            :aria-label="`${day.dayOfMonth} ${stateText(day.state)}`"
          >
            {{ day.dayOfMonth }}
          </span>
        </span>
      </template>
    </div>

    <!-- 统计与图例 -->
    <div class="mt-6 border-t border-outline-variant/40 pt-5">
      <p v-if="monthCheckedCount === 0 && !loading" class="mb-4 font-body-sm text-body-sm text-on-surface-variant">
        {{ $t('checkIn.calendar.emptyMonth') }}
      </p>
      <div class="flex flex-wrap items-center gap-x-4 gap-y-2">
        <span class="flex items-center gap-2 font-body-sm text-body-sm text-on-surface-variant">
          <span class="h-3.5 w-3.5 rounded-full bg-primary"></span>
          {{ $t('checkIn.calendar.legendChecked') }}
        </span>
        <span class="flex items-center gap-2 font-body-sm text-body-sm text-on-surface-variant">
          <span class="h-3.5 w-3.5 rounded-full border-2 border-outline-variant"></span>
          {{ $t('checkIn.calendar.legendMissed') }}
        </span>
        <span class="flex items-center gap-2 font-body-sm text-body-sm text-on-surface-variant">
          <span class="h-3.5 w-3.5 rounded-full bg-primary outline outline-2 outline-offset-2 outline-primary"></span>
          {{ $t('checkIn.calendar.legendToday') }}
        </span>
        <span class="ml-auto font-body-sm text-body-sm text-outline tabular-nums">
          {{ $t('checkIn.calendar.stat', { days: monthCheckedCount, streak: streakDays }) }}
        </span>
      </div>
    </div>

    <!-- 补签结算区：版式参照 PracticeSettleCard（rounded-2xl + surface-container-low） -->
    <div v-if="selectedDate" class="mt-5 rounded-2xl bg-surface-container-low px-5 py-4">
      <p class="font-headline-sm text-headline-sm text-on-surface">
        {{ $t('checkIn.calendar.makeupSelected', { date: selectedDate }) }}
      </p>
      <p class="mt-1 font-body-sm text-body-sm text-on-surface-variant tabular-nums">
        {{ $t('checkIn.calendar.makeupCost', { coins: cost, yuan: yuanText }) }}
        · {{ $t('checkIn.calendar.makeupBalance', { balance: balance }) }}
      </p>
      <p class="mt-1 font-label-sm text-label-sm text-outline">
        {{ $t('coin.rateHint', { coins: rate }) }} · {{ $t('checkIn.calendar.makeupNote') }}
      </p>

      <!-- 阶段一：显眼的实心主色按钮，白字，通栏 -->
      <div v-if="!confirming" class="mt-4">
        <button
          type="button"
          :class="btnPrimaryBlock"
          :disabled="shortfall > 0"
          @click="confirming = true"
        >
          {{ $t('checkIn.calendar.makeupPay') }}
        </button>
        <p v-if="shortfall > 0" class="mt-2 font-label-sm text-label-sm text-error">
          {{ $t('checkIn.calendar.makeupShortfall', { coins: shortfall }) }}
        </p>
      </div>

      <!-- 阶段二：二次确认，避免误扣金币 -->
      <div v-else class="mt-4">
        <p class="font-body-md text-body-md text-on-surface">
          {{ $t('checkIn.calendar.makeupConfirmTitle') }}
        </p>
        <p class="mt-1 font-body-sm text-body-sm text-on-surface-variant">
          {{ $t('checkIn.calendar.makeupConfirmBody', { date: selectedDate, coins: cost }) }}
        </p>
        <div class="mt-4 flex gap-3">
          <button
            type="button"
            :class="btnDialogSecondary"
            :disabled="submitting"
            @click="confirming = false"
          >
            {{ $t('checkIn.calendar.makeupCancel') }}
          </button>
          <button
            type="button"
            :class="btnDialogPrimary"
            :disabled="submitting"
            @click="submitMakeup"
          >
            {{ submitting ? $t('common.loading') : $t('checkIn.calendar.makeupConfirm') }}
          </button>
        </div>
      </div>

      <p v-if="makeupError" class="mt-2 font-label-sm text-label-sm text-error">{{ makeupError }}</p>
    </div>
    <p v-else class="mt-4 font-body-sm text-body-sm text-on-surface-variant">
      {{ $t('checkIn.calendar.makeupSelectHint') }}
    </p>
  </BaseDialog>
</template>

<script setup lang="ts">
import { computed, ref, watch } from 'vue'
import { useI18n } from 'vue-i18n'
import BaseDialog from '@/components/ui/BaseDialog.vue'
import {
  btnDialogPrimary,
  btnDialogSecondary,
  btnIconSm,
  btnPrimaryBlock,
} from '@/components/ui/buttonStyles'
import { makeupCheckIn } from '@/api/coin'
import { useUserStore } from '@/stores/user'
import { useToast } from '@/composables/useToast'
import { checkInStateLabelKey, type CheckInDay, type CheckInDayState } from '@/composables/useCheckInCalendar'

/**
 * 签到日历弹窗：当月网格 + 翻月 + 图例 + 补签结算。
 * 日期数据与月份状态在 useCheckInCalendar 里；补签的选中态与提交放在本组件，
 * 成功后通知父组件刷新日历，金币余额由 userStore 全局刷新。
 */
const props = withDefaults(defineProps<{
  visible: boolean
  monthLabel: string
  days: (CheckInDay | null)[]
  loading?: boolean
  loaded?: boolean
  error?: string
  canGoNext?: boolean
  monthCheckedCount?: number
  streakDays?: number
}>(), {
  loading: false,
  loaded: false,
  error: '',
  canGoNext: false,
  monthCheckedCount: 0,
  streakDays: 0,
})

const emit = defineEmits<{
  (e: 'update:visible', value: boolean): void
  (e: 'prev'): void
  (e: 'next'): void
  (e: 'retry'): void
  (e: 'makeupSuccess'): void
}>()

const { t } = useI18n()
const userStore = useUserStore()
const { show: toast } = useToast()

const WEEKDAY_KEYS = ['mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun'] as const

/** 日期格共用尺寸；选中与状态色由 cellClass 追加 */
const CELL_BASE =
  'flex h-9 w-9 items-center justify-center rounded-full font-body-md text-body-md tabular-nums transition-colors sm:h-14 sm:w-14 sm:font-body-lg sm:text-body-lg'
const SELECTABLE_BASE =
  'cursor-pointer hover:bg-surface-container-high focus-visible:ring-2 focus-visible:ring-primary active:scale-95'

const selectedDate = ref<string | null>(null)
const confirming = ref(false)
const submitting = ref(false)
const makeupError = ref('')

/** 定价、汇率、余额都取自后端 /user/coin/info，不在前端写死 */
const cost = computed(() => userStore.makeupCostCoins || 600)
const rate = computed(() => userStore.coinsPerYuan || 100)
const balance = computed(() => userStore.coinBalance ?? 0)
const shortfall = computed(() => Math.max(0, cost.value - balance.value))
const yuanText = computed(() => String(Math.round(cost.value / (rate.value || 100))))

const pad = (n: number): string => String(n).padStart(2, '0')
const now = new Date()
/** 后端只接受本月补签；日历可以翻到上月，那里的漏签日不可选 */
const currentMonth = `${now.getFullYear()}-${pad(now.getMonth() + 1)}`

const isSelectable = (day: CheckInDay): boolean =>
  day.state === 'missed' && day.date.slice(0, 7) === currentMonth

const selectDate = (day: CheckInDay): void => {
  if (!isSelectable(day) || submitting.value) return
  selectedDate.value = selectedDate.value === day.date ? null : day.date
  confirming.value = false
  makeupError.value = ''
}

const resetSelection = (): void => {
  selectedDate.value = null
  confirming.value = false
  makeupError.value = ''
}

const onPrev = (): void => {
  resetSelection()
  emit('prev')
}

const onNext = (): void => {
  resetSelection()
  emit('next')
}

const submitMakeup = async (): Promise<void> => {
  const userId = userStore.userId
  const date = selectedDate.value
  if (!userId || !date || submitting.value) return
  submitting.value = true
  makeupError.value = ''
  try {
    await makeupCheckIn(userId, date)
    await userStore.loadCoinInfo()
    toast(t('checkIn.calendar.makeupSuccess'), 'success')
    resetSelection()
    emit('makeupSuccess')
  } catch (e) {
    makeupError.value = e instanceof Error ? e.message : t('checkIn.calendar.makeupFailed')
  } finally {
    submitting.value = false
  }
}

// 关闭弹窗时清掉选中态，避免下次打开还停留在上次的日期
watch(() => props.visible, (value) => {
  if (!value) resetSelection()
})

const stateText = (state: CheckInDayState): string => t(checkInStateLabelKey(state))

const cellClass = (day: CheckInDay): string => {
  // 选中态用 error 色外圈，与「今天」的 primary 外圈区分
  if (selectedDate.value === day.date) {
    return 'bg-primary text-on-primary outline outline-2 outline-offset-2 outline-error'
  }
  switch (day.state) {
    case 'checked':
      return 'bg-primary text-on-primary'
    // 今天统一用「外圈 + 留白」标记：与「已签到」的纯实心圆一眼可分
    case 'today-checked':
      return 'bg-primary text-on-primary outline outline-2 outline-offset-2 outline-primary'
    case 'today-pending':
      return 'bg-primary/10 text-primary outline outline-2 outline-offset-2 outline-primary'
    case 'missed':
      return 'border-2 border-outline-variant text-on-surface-variant'
    case 'future':
      return 'text-outline/60'
    default:
      return 'text-outline/40'
  }
}
</script>
