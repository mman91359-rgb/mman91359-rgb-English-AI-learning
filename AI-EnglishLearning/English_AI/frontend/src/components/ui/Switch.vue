<template>
  <button
    type="button"
    role="switch"
    :aria-checked="modelValue"
    :aria-label="ariaLabel"
    :disabled="disabled"
    :class="[trackClass, disabled ? 'cursor-not-allowed opacity-60' : 'cursor-pointer']"
    @click="emit('update:modelValue', !modelValue)"
  >
    <span :class="knobClass" />
  </button>
</template>

<script setup lang="ts">
import { computed } from 'vue'

/**
 * 开关（Material Design 3 Switch）。
 *
 * ## 尺寸与契约
 * - 轨道 48×28（`w-12 h-7`），滑块 24×24（`w-6 h-6`），位移 20（`translate-x-5`）。
 *   全部走 Tailwind 标准间距档，无任意值。
 * - 圆角只用 `rounded-full`（契约 §1 四档之一）；本组件不设内边距类，
 *   滑块用绝对定位 + `left-0.5/top-0.5` 定位，因此不涉及契约 §2 的内边距三档。
 * - 不用阴影、不用图标、不用文字，不触发 §3/§4/§6 条款。
 *
 * ## tone
 * - `default`：普通页面底色上使用。未选轨道 `surface-container-highest`，
 *   选中轨道 `primary`，滑块反色。
 * - `inverse`：品牌色容器（`bg-primary`）内部使用。未选轨道 `on-primary/30`，
 *   选中轨道 `on-primary`、滑块 `primary`；焦点环用 `on-primary` 才在紫底上可见。
 *   少了这一档，`primary` 轨道会与紫色容器同色，开关看上去像没开。
 *
 * ## 用法
 * ```vue
 * <Switch v-model="includeFavorite" tone="inverse" :aria-label="$t('x.label')" />
 * ```
 * 需要在点击外部区域也能切换时，用 `<label>` 包住并让 Switch 的 aria-label 指向说明文字。
 */
const props = withDefaults(defineProps<{
  /** 开关状态，绑定用 v-model */
  modelValue: boolean
  /** 禁用态 */
  disabled?: boolean
  /** 无障碍标签；开关旁边有可见文字时仍建议提供 */
  ariaLabel?: string
  /** 配色档：普通底色 / 品牌色容器内 */
  tone?: 'default' | 'inverse'
}>(), {
  disabled: false,
  ariaLabel: '',
  tone: 'default',
})

const emit = defineEmits<{
  (e: 'update:modelValue', value: boolean): void
}>()

const FOCUS = 'focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2'

const trackClass = computed(() => {
  const base = 'relative h-7 w-12 rounded-full transition-colors duration-200'
  if (props.tone === 'inverse') {
    return props.modelValue
      ? `${base} bg-on-primary ${FOCUS} focus-visible:outline-on-primary`
      : `${base} bg-on-primary/30 ${FOCUS} focus-visible:outline-on-primary`
  }
  return props.modelValue
    ? `${base} bg-primary ${FOCUS} focus-visible:outline-primary`
    : `${base} bg-surface-container-highest ${FOCUS} focus-visible:outline-primary`
})

const knobClass = computed(() => {
  const base = 'absolute left-0.5 top-0.5 h-6 w-6 rounded-full transition-transform duration-200'
  const offset = props.modelValue ? 'translate-x-5' : 'translate-x-0'
  if (props.tone === 'inverse') {
    return `${base} ${offset} ${props.modelValue ? 'bg-primary' : 'bg-on-primary'}`
  }
  return `${base} ${offset} ${props.modelValue ? 'bg-on-primary' : 'bg-outline'}`
})
</script>
