<template>
  <p
    class="mt-2 flex items-start gap-1.5 pl-3"
    :class="tone === 'error' ? 'text-error' : 'text-on-surface-variant'"
    :role="tone === 'error' ? 'alert' : undefined"
  >
    <span class="material-symbols-outlined form-hint-icon shrink-0" aria-hidden="true">{{ resolvedIcon }}</span>
    <span class="min-w-0 font-body-sm text-body-sm leading-snug">{{ message }}</span>
  </p>
</template>

<script setup lang="ts">
import { computed } from 'vue'

/**
 * 表单提示行（校验错误 / 规则说明）。
 *
 * 单独抽组件是因为 main.css 把 Material Symbols 字体的字号固定在 24px，
 * 且该规则位于 Tailwind utilities 之后，页面里写 text-sm 根本不生效，
 * 导致图标比文字大一圈。这里用 scoped 属性选择器把图标定到 16px，与 14px 正文对齐。
 */
const props = withDefaults(defineProps<{
  message: string
  /** error=红色校验错误；hint=中性规则说明 */
  tone?: 'error' | 'hint'
  /** 覆盖默认图标（error / info） */
  icon?: string
}>(), {
  tone: 'error',
})

const resolvedIcon = computed(() => props.icon ?? (props.tone === 'error' ? 'error' : 'info'))
</script>

<style scoped>
.form-hint-icon {
  font-size: 16px;
  line-height: 20px;
}
</style>
