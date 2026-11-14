<template>
  <AppCard tone="container-low" padding="compact">
    <div class="mb-2 flex items-center text-on-surface-variant">
      <AppIcon v-if="icon" :name="icon" size="md" :tone="iconTone" class="mr-2" />
      <span class="font-label-md text-label-md">{{ label }}</span>
    </div>
    <div
      class="font-headline-lg text-headline-lg"
      :class="isEmpty ? 'text-on-surface-variant' : 'text-on-surface'"
    >
      {{ displayValue }}<span
        v-if="unit && !isEmpty"
        class="ml-1 font-body-md text-body-md text-on-surface-variant"
      >{{ unit }}</span>
    </div>
  </AppCard>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import AppCard from './AppCard.vue'
import AppIcon from './AppIcon.vue'

/**
 * StatTile —— 单个指标卡（指标名 + 大数字 + 单位 + 语义图标）。
 *
 * 覆盖审计 §3-11 的 3 处同版式小卡（StatsView:12/22/31、VocabularyView:11、ProfileView:77）。
 *
 * ## 缺数据必须显示占位符，不是 0
 * value 为 null / undefined / '' 时渲染 placeholder（默认「—」），并用 on-surface-variant 降级配色。
 * 注意 **0 是有效数据**，不会走占位符分支 —— 「今天学习了 0 分钟」是事实，
 * 而「接口没返回」渲染成 0 是虚假信息（审计已把 AI 降级 0 分列为 🔴 风险）。
 *
 * ## 禁止用法
 * - 禁止在调用方写 `:value="data ?? 0"`。要用占位符就传 null，让组件决定，别在页面里吞掉缺失态。
 * - 禁止比率型指标不传 unit（% / 分 / 天），否则数字没有量纲。
 * - 禁止用 tone 表达「重要性」或「好坏」：tone 只标语义分类；同一组指标应保持同一 tone 或按维度区分。
 * - 禁止在 StatTile 外再包一层卡片，它自身已是 AppCard。
 */
const props = withDefaults(defineProps<{
  /** 指标名，label-md */
  label: string
  /** 指标值；null / undefined / '' 触发占位符，0 视为有效值 */
  value: number | string | null | undefined
  /** 单位，如 % / 天 / 分钟 */
  unit?: string
  /** 图标名（Material Symbols），走 AppIcon size=md */
  icon?: string
  /** 仅影响图标色 */
  tone?: 'primary' | 'secondary' | 'tertiary' | 'error' | 'neutral'
  /** 缺数据时显示的字符 */
  placeholder?: string
}>(), {
  unit: '',
  icon: '',
  tone: 'primary',
  placeholder: '—',
})

const isEmpty = computed(() => {
  const v = props.value
  return v === null || v === undefined || v === ''
})

const displayValue = computed(() => (isEmpty.value ? props.placeholder : props.value))

/**
 * StatTile 的 neutral 表达「无强调」，对应 AppIcon 的 variant（继承 on-surface-variant 系）。
 * AppIcon 没有 neutral 档：它的 current 是「不设色」，variant 才是「次要文字色」，语义不同不能混用。
 */
const ICON_TONE = {
  primary: 'primary',
  secondary: 'secondary',
  tertiary: 'tertiary',
  error: 'error',
  neutral: 'variant',
} as const

const iconTone = computed(() => ICON_TONE[props.tone])
</script>
