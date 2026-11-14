<template>
  <component
    :is="tag"
    :to="to || undefined"
    :type="to ? undefined : 'button'"
    :class="cardClass"
    @click="onClick"
  >
    <span class="flex min-w-0 items-center gap-4">
      <span :class="iconWrapClass">
        <AppIcon :name="icon" size="lg" :tone="tone" :filled="filled" />
      </span>
      <span class="flex min-w-0 flex-col gap-0.5">
        <span class="font-body-lg text-body-lg text-on-surface">{{ title }}</span>
        <span v-if="description" class="font-label-md text-label-md text-on-surface-variant">{{ description }}</span>
      </span>
    </span>
    <AppIcon name="chevron_right" size="lg" class="shrink-0 text-outline" />
  </component>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { RouterLink } from 'vue-router'
import AppIcon from './AppIcon.vue'

/**
 * EntryCard —— 模块入口卡（「图标圆 + 标题 + 副标题 + 箭头」骨架）。
 *
 * 覆盖 LearningView 的语法/词汇 tab、WritingEntryPanel、TranslationEntryPanel、
 * ListeningEntryPanel 共 26 张同构入口卡。三处原本分别是 `<div @click>`、`<button>`、
 * `<router-link>` 三种载体，本组件按 `to` 是否存在自动选择，并把 `<div @click>` 统一提升为
 * `<button>`（键盘可达）。
 *
 * ## 与 AppCard / StatTile 的分工
 * | 组件 | 语义 | 形态 |
 * |---|---|---|
 * | `EntryCard` | **去某处**的入口 | 图标圆 + 标题 + 可选副标题 + 右侧箭头 |
 * | `AppCard` | 一块内容容器 | 无箭头、无图标位 |
 * | `StatTile` | 一个**数值** | 左对齐数值 + 标签 |
 *
 * 不复用 `AppCard interactive` 的原因：它 hover 是实色 `bg-surface-container`，
 * 而入口卡是 `bg-surface-container-lowest/80`（同底半透明）；它也不支持 `RouterLink`。
 *
 * ## 禁止用法
 * - 禁止外部用 `class` 覆盖圆角或内边距：固定 `rounded-3xl + p-6`（契约 §2 标准卡档）。
 * - `md:col-span-*` 等栅格跨度**不属于本组件**，由调用方在外层 class 传入。
 * - 禁止用它承载「执行动作」（提交、删除）：那是按钮，不是入口。入口只负责跳转/开面板。
 */
const props = withDefaults(defineProps<{
  /** Material Symbols 连字名 */
  icon: string
  /** 主文案 */
  title: string
  /** 副文案；不传时只渲染标题（Translation / Listening 的入口卡均无副标题） */
  description?: string
  /** 图标语义色档，同时决定图标圆底色 */
  tone?: 'primary' | 'secondary' | 'tertiary' | 'error'
  /** 图标是否实心（favorite 一类） */
  filled?: boolean
  /** 跳转目标；有值时渲染 RouterLink，无值时渲染 button 并抛出 click */
  to?: string
  /**
   * 图标圆底色透明度档。默认 30（`bg-*-container/30`）。
   * 20 仅用于两张「词典」卡，属既有差异，保留以免视觉位移。
   */
  iconAlpha?: 20 | 30
}>(), {
  description: '',
  tone: 'primary',
  filled: false,
  to: '',
  iconAlpha: 30,
})

const emit = defineEmits<{ click: [] }>()

const tag = computed(() => (props.to ? RouterLink : 'button'))

/**
 * 图标圆底色：**必须是完整字面量**，禁止写成 `'bg-primary-container' + '/30'`。
 *
 * Tailwind 只扫描源码里的完整类名字符串，拼接出来的是运行时值，它看不见。
 * 一旦其他页面不再写这些字面量（例如迁移收口清掉旧卡），拼出来的类就再也生成不了 CSS，
 * 图标圆会**静默变透明** —— type-check 绿、build 绿，只有肉眼能发现。见契约 §11.4。
 */
const ICON_WRAP_ALPHA = {
  primary: { 20: 'bg-primary-container/20', 30: 'bg-primary-container/30' },
  secondary: { 20: 'bg-secondary-container/20', 30: 'bg-secondary-container/30' },
  tertiary: { 20: 'bg-tertiary-container/20', 30: 'bg-tertiary-container/30' },
  error: { 20: 'bg-error-container/20', 30: 'bg-error-container/30' },
} as const

const iconWrapClass = computed(
  () => `flex h-10 w-10 shrink-0 items-center justify-center rounded-full ${ICON_WRAP_ALPHA[props.tone][props.iconAlpha]}`,
)

const cardClass = computed(() => [
  'flex items-center justify-between rounded-3xl bg-surface-container-lowest p-6 text-left shadow-soft-glow transition-colors hover:bg-surface-container-lowest/80',
])

const onClick = () => {
  if (!props.to) emit('click')
}
</script>
