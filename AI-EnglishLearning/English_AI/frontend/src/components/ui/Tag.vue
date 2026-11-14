<template>
  <span
    class="inline-flex items-center whitespace-nowrap rounded-full"
    :class="[toneClass, sizeClass]"
  >
    <slot>{{ label }}</slot>
  </span>
</template>

<script setup lang="ts">
import { computed } from 'vue'

/**
 * Tag —— 状态/分类胶囊（用户端语义五档）。
 *
 * 覆盖审计 §3-8 的 6 处手写状态胶囊：它们此前内边距分 px-2 py-0.5 / px-3 py-1 /
 * px-2.5 py-0.5 三档、字号分 text-xs / label-sm / label-md 三种，同一屏内出现两种密度。
 * 本组件只保留两档，md 与 admin StatusBadge 的 px-2.5 py-1 + label-md 对齐。
 *
 * ## 与 admin 的 StatusBadge 不是同一套
 * StatusBadge 的 BadgeTone 是 success|danger|warning|info|neutral，语义偏「管理动作结果」；
 * Tag 的 TagTone 是 primary|tertiary|neutral|warning|error，语义偏「内容分类」。
 * 两者不合并：本轮无用户端调用方，合并无法被真实调用验证。迁移时按契约 §7 的映射表转换
 * （success→tertiary、danger→error、info→primary）。
 *
 * ## 禁止用法
 * - 禁止传 class="rounded-lg" / "rounded-xl" 改形状：Tag 恒为胶囊，形状不可覆盖。
 * - 禁止用它做可点击的筛选 chip —— chip 有选中态与键盘语义，属将来的 ChipGroup。
 * - 禁止在 Tag 内放 button / a 等可交互元素。
 * - 禁止用 tone="error" 表达「危险操作入口」：Tag 只描述状态，不承担动作语义，动作请用 btnDanger。
 */
const props = withDefaults(defineProps<{
  /** 语义色五档，全部映射已有令牌，无新增色值 */
  tone?: 'primary' | 'tertiary' | 'neutral' | 'warning' | 'error'
  /** 密度档：sm=px-2 py-0.5+label-sm，md=px-2.5 py-1+label-md */
  size?: 'sm' | 'md'
  /** 文案；也可用默认 slot 传入（slot 优先） */
  label?: string
}>(), {
  tone: 'neutral',
  size: 'md',
  label: '',
})

const TONE_CLASS = {
  primary: 'bg-primary-container/30 text-primary',
  tertiary: 'bg-tertiary-container/50 text-on-tertiary-container',
  neutral: 'bg-surface-container-high text-on-surface-variant',
  warning: 'bg-warning-container text-on-warning-container',
  error: 'bg-error-container text-on-error-container',
} as const

const SIZE_CLASS = {
  sm: 'px-2 py-0.5 font-label-sm text-label-sm',
  md: 'px-2.5 py-1 font-label-md text-label-md',
} as const

const toneClass = computed(() => TONE_CLASS[props.tone])
const sizeClass = computed(() => SIZE_CLASS[props.size])
</script>
