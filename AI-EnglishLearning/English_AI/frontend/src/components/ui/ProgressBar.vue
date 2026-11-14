<template>
  <div
    class="w-full overflow-hidden rounded-full bg-surface-variant"
    :class="heightClass"
    role="progressbar"
    aria-valuemin="0"
    :aria-valuenow="ariaValueNow"
    :aria-valuemax="safeMax"
    :aria-label="label || undefined"
  >
    <div
      class="h-full rounded-full transition-all"
      :class="toneClass"
      :style="{ width: percent + '%' }"
    />
  </div>
</template>

<script setup lang="ts">
import { computed } from 'vue'

/**
 * ProgressBar —— 线性进度条。
 *
 * 替代页面里手写的这段（AssessView:48、PracticeView:24 逐字相同）：
 *   <div class="w-full h-2 bg-surface-variant rounded-full overflow-hidden">
 *     <div class="h-full bg-primary transition-all" :style="{ width: pct + '%' }"></div>
 *   </div>
 *
 * 尺寸三档对应 Tailwind 默认高度：sm=h-1.5(6px) / md=h-2(8px) / lg=h-3(12px)。
 * md 与现有手写实现同高，接线时不会产生布局位移。
 *
 * ## 禁止用法
 * - 禁止在外部再用内联 style 改填充宽度：宽度由 value/max 计算并夹取到 [0, max]。
 * - 禁止用它替代 QuizProgressBar 的「奖杯 + 双层反白」形态，那是答题专属视觉，合并属 P2。
 * - 禁止传已换算好的百分比却不改 max（默认 max=100）；传 30/50 表示 60%，不是 30%。
 * - 禁止在同一个进度条上叠 shadow-soft-glow：进度条是纯色块，不需要抬升。
 */
const props = withDefaults(defineProps<{
  /** 当前值，自动夹取到 [0, max] */
  value: number
  /** 上限；<=0 时按 0% 处理，避免除零 */
  max?: number
  /** 填充色语义 */
  tone?: 'primary' | 'tertiary' | 'warning' | 'error'
  /** 尺寸档：sm=6px / md=8px / lg=12px */
  size?: 'sm' | 'md' | 'lg'
  /** 无障碍名称，如「答题进度」 */
  label?: string
}>(), {
  max: 100,
  tone: 'primary',
  size: 'md',
  label: '',
})

const HEIGHT_CLASS = {
  sm: 'h-1.5',
  md: 'h-2',
  lg: 'h-3',
} as const

const TONE_CLASS = {
  primary: 'bg-primary',
  tertiary: 'bg-tertiary',
  warning: 'bg-warning',
  error: 'bg-error',
} as const

const heightClass = computed(() => HEIGHT_CLASS[props.size])
const toneClass = computed(() => TONE_CLASS[props.tone])

/** max 非法（0 / 负数 / NaN）时钳到 1，使 clamped 归零，渲染 0% 而不是 NaN 宽度 */
const safeMax = computed(() => (Number.isFinite(props.max) && props.max > 0 ? props.max : 1))

const clamped = computed(() => {
  if (!Number.isFinite(props.value)) return 0
  return Math.min(Math.max(props.value, 0), safeMax.value)
})

const percent = computed(() => (clamped.value / safeMax.value) * 100)

/** 无障碍读数取整；小数进度（如 33.333）对读屏无意义 */
const ariaValueNow = computed(() => Math.round(clamped.value))
</script>
