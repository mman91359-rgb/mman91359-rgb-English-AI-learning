<template>
  <component
    :is="interactive ? 'button' : 'div'"
    :type="interactive ? 'button' : undefined"
    :class="cardClass"
  >
    <slot />
  </component>
</template>

<script setup lang="ts">
import { computed } from 'vue'

/**
 * AppCard —— 内容卡片的唯一容器。
 *
 * 圆角固定 rounded-3xl（24px），内边距只有两档：compact=p-6（24px）/ regular=p-8（32px）。
 * 阴影固定 shadow-soft-glow，不带 hover:shadow-md 之类的第二档。
 *
 * ## 禁止用法
 * - 禁止传 class="rounded-[20px]" / "rounded-xl" 覆盖圆角：圆角是契约的一部分，不是可选项。
 *   历史页面里的 rounded-[20px] 属 125 处任意值之一，接线时一并收敛，不在本组件内兼容。
 * - 禁止用它包整页容器。页面外壳由 AppLayout 负责，AppCard 只描述「一块内容」。
 * - interactive 为真时禁止在内部再嵌 button / a：那会形成可交互元素嵌套，
 *   点击会冒泡到整卡，出现一次操作触发两次。要导航请用 router.push。
 * - 禁止给 padding="regular" 的卡片再手动加 p-* 类，两者会叠加成不对称间距。
 */
const props = withDefaults(defineProps<{
  /** 底色三档：surface / container-low / container-high */
  tone?: 'surface' | 'container-low' | 'container-high'
  /** 内边距档：compact=24px，regular=32px */
  padding?: 'compact' | 'regular'
  /** 可点击态：渲染为 button，带 hover 底与键盘焦点环 */
  interactive?: boolean
  /** 是否带软阴影；嵌入已有卡片时关闭 */
  shadow?: boolean
}>(), {
  tone: 'container-low',
  padding: 'compact',
  interactive: false,
  shadow: true,
})

const TONE_CLASS = {
  surface: 'bg-surface',
  'container-low': 'bg-surface-container-low',
  'container-high': 'bg-surface-container-high',
} as const

const PADDING_CLASS = {
  compact: 'p-6',
  regular: 'p-8',
} as const

const cardClass = computed(() => [
  'rounded-3xl',
  TONE_CLASS[props.tone],
  PADDING_CLASS[props.padding],
  props.shadow ? 'shadow-soft-glow' : '',
  props.interactive
    ? 'w-full text-left transition-colors hover:bg-surface-container focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-primary'
    : '',
])
</script>
