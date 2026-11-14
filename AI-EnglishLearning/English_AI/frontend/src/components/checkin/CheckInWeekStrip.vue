<template>
  <div>
    <div v-if="showSkeleton" class="grid grid-cols-7 gap-1" aria-hidden="true">
      <div v-for="i in 7" :key="i" class="flex flex-col items-center gap-2">
        <span class="h-2.5 w-7 rounded-full bg-surface-container-high animate-pulse"></span>
        <span class="h-8 w-8 rounded-full bg-surface-container-high animate-pulse"></span>
      </div>
    </div>

    <div v-else class="grid grid-cols-7 gap-1" role="list">
      <div
        v-for="day in days"
        :key="day.date"
        class="flex min-w-0 flex-col items-center gap-2"
        role="listitem"
      >
        <span class="font-label-sm text-label-sm tracking-wide" :class="labelClass(day.state)">
          {{ day.label }}
        </span>
        <span class="flex h-8 w-8 items-center justify-center rounded-full" :class="circleClass(day.state)">
          <AppIcon
            v-if="day.state === 'checked' || day.state === 'today-checked'"
            name="check"
            size="sm"
          />
          <span v-else-if="day.state === 'today-pending'" class="h-1.5 w-1.5 rounded-full bg-current"></span>
        </span>
        <span class="sr-only">{{ stateText(day.state) }}</span>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { useI18n } from 'vue-i18n'
import AppIcon from '@/components/ui/AppIcon.vue'
import { checkInStateLabelKey, type CheckInDay, type CheckInDayState } from '@/composables/useCheckInCalendar'

/**
 * 本周签到条：MON…SUN + 小圆圈。
 *
 * 纯展示组件，状态全部由 useCheckInCalendar 推导后传入，
 * 保证首页与个人资料页的圆圈语义完全一致。
 */
const props = withDefaults(defineProps<{
  days: CheckInDay[]
  loading?: boolean
  /** 是否已完成首次加载；未完成且正在加载时显示骨架 */
  loaded?: boolean
}>(), {
  loading: false,
  loaded: false,
})

const { t } = useI18n()

const showSkeleton = computed(() => props.loading && !props.loaded)

const stateText = (state: CheckInDayState): string => t(checkInStateLabelKey(state))

const labelClass = (state: CheckInDayState): string => {
  if (state === 'checked' || state === 'today-checked') return 'text-primary'
  if (state === 'missed') return 'text-on-surface-variant'
  return 'text-outline'
}

const circleClass = (state: CheckInDayState): string => {
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
      return 'border-2 border-dashed border-outline-variant/60 text-outline'
    default:
      return 'border-2 border-dashed border-outline-variant/40 text-outline'
  }
}
</script>
