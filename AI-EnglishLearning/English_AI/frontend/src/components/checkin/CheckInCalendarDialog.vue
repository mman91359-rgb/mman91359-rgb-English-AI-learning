<template>
  <BaseDialog
    :visible="visible"
    :title="$t('checkIn.calendar.title')"
    max-width="max-w-md"
    @update:visible="emit('update:visible', $event)"
  >
    <!-- 月份切换 -->
    <div class="mb-4 flex items-center justify-between">
      <button
        type="button"
        :class="btnIconSm"
        :aria-label="$t('checkIn.calendar.prevMonth')"
        @click="emit('prev')"
      >
        <span class="material-symbols-outlined text-icon-md" aria-hidden="true">chevron_left</span>
      </button>
      <span class="font-label-lg text-label-lg text-on-surface tabular-nums">{{ monthLabel }}</span>
      <button
        type="button"
        :class="btnIconSm"
        :disabled="!canGoNext"
        :aria-label="$t('checkIn.calendar.nextMonth')"
        @click="emit('next')"
      >
        <span class="material-symbols-outlined text-icon-md" aria-hidden="true">chevron_right</span>
      </button>
    </div>

    <!-- 星期表头：与周条同一套 MON…SUN -->
    <div class="mb-2 grid grid-cols-7 gap-1">
      <span
        v-for="key in WEEKDAY_KEYS"
        :key="key"
        class="text-center font-label-sm text-label-sm tracking-wide text-outline"
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
    <div v-else-if="loading && !loaded" class="grid grid-cols-7 gap-1" aria-hidden="true">
      <span
        v-for="i in 35"
        :key="i"
        class="mx-auto h-9 w-9 rounded-full bg-surface-container-high animate-pulse"
      ></span>
    </div>

    <!-- 月网格 -->
    <div v-else class="grid grid-cols-7 gap-1" role="grid">
      <template v-for="(day, index) in days" :key="day ? day.date : `blank-${index}`">
        <span v-if="!day" role="gridcell"></span>
        <span v-else class="flex justify-center" role="gridcell">
          <span
            class="flex h-9 w-9 items-center justify-center rounded-full font-body-sm text-body-sm tabular-nums"
            :class="cellClass(day.state)"
            :aria-label="`${day.dayOfMonth} ${stateText(day.state)}`"
          >
            {{ day.dayOfMonth }}
          </span>
        </span>
      </template>
    </div>

    <!-- 统计与图例 -->
    <div class="mt-5 border-t border-outline-variant/40 pt-4">
      <p v-if="monthCheckedCount === 0 && !loading" class="mb-3 font-label-sm text-label-sm text-on-surface-variant">
        {{ $t('checkIn.calendar.emptyMonth') }}
      </p>
      <div class="flex flex-wrap items-center gap-x-4 gap-y-2">
        <span class="flex items-center gap-1.5 font-label-sm text-label-sm text-on-surface-variant">
          <span class="h-3 w-3 rounded-full bg-primary"></span>
          {{ $t('checkIn.calendar.legendChecked') }}
        </span>
        <span class="flex items-center gap-1.5 font-label-sm text-label-sm text-on-surface-variant">
          <span class="h-3 w-3 rounded-full border-2 border-outline-variant"></span>
          {{ $t('checkIn.calendar.legendMissed') }}
        </span>
        <span class="flex items-center gap-1.5 font-label-sm text-label-sm text-on-surface-variant">
          <span class="h-3 w-3 rounded-full bg-primary ring-2 ring-primary/25"></span>
          {{ $t('checkIn.calendar.legendToday') }}
        </span>
        <span class="ml-auto font-label-sm text-label-sm text-outline tabular-nums">
          {{ $t('checkIn.calendar.stat', { days: monthCheckedCount, streak: streakDays }) }}
        </span>
      </div>
    </div>
  </BaseDialog>
</template>

<script setup lang="ts">
import { useI18n } from 'vue-i18n'
import BaseDialog from '@/components/ui/BaseDialog.vue'
import { btnIconSm } from '@/components/ui/buttonStyles'
import { checkInStateLabelKey, type CheckInDay, type CheckInDayState } from '@/composables/useCheckInCalendar'

/**
 * 签到日历弹窗：当月网格 + 翻月 + 图例。
 * 数据与月份状态都在 useCheckInCalendar 里，这里只渲染与转发事件。
 */
withDefaults(defineProps<{
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
}>()

const { t } = useI18n()

const WEEKDAY_KEYS = ['mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun'] as const

const stateText = (state: CheckInDayState): string => t(checkInStateLabelKey(state))

const cellClass = (state: CheckInDayState): string => {
  switch (state) {
    case 'checked':
      return 'bg-primary text-on-primary'
    case 'today-checked':
      return 'bg-primary text-on-primary ring-2 ring-primary/25'
    case 'today-pending':
      return 'border-2 border-primary text-primary'
    case 'missed':
      return 'border-2 border-outline-variant text-on-surface-variant'
    case 'future':
      return 'text-outline/60'
    default:
      return 'text-outline/40'
  }
}
</script>
