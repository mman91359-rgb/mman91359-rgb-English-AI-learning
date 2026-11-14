<template>
  <div class="mb-6 flex flex-wrap items-center justify-between gap-4">
    <div class="min-w-0">
      <component :is="tag" class="font-headline-md text-headline-md text-on-surface">
        {{ title }}
      </component>
      <p v-if="subtitle" class="mt-1 font-body-sm text-body-sm text-on-surface-variant">
        {{ subtitle }}
      </p>
    </div>
    <div v-if="$slots.actions" class="flex shrink-0 items-center gap-2">
      <slot name="actions" />
    </div>
  </div>
</template>

<script setup lang="ts">
import { computed } from 'vue'

/**
 * SectionHeader —— 区块级标题（24px 标题 + 右侧操作）。
 *
 * 覆盖审计里反复手写的 `flex justify-between items-center mb-6` + headline-md 区块头
 * （StatsView:44、VocabularyView、ProfileView 等）。
 *
 * ## 禁止用法
 * - 禁止用 PageHeader 充当区块标题：那是 32px + 返回钮的页面级组件，放区块里会与页面标题抢层级。
 * - 禁止在 #actions 放默认档大按钮（btnPrimary）；区块内动作一律小档 btnPrimarySm / btnSecondarySm。
 * - 禁止跳级使用 level：页面标题是 h1 时，区块从 h2 起；不要出现 h1 → h4。
 * - 禁止把 title 留空只放 actions —— 那样用普通 flex 容器即可。
 */
const props = withDefaults(defineProps<{
  /** 区块标题 */
  title: string
  /** 可选副说明 */
  subtitle?: string
  /** 标题层级，输出 h2 / h3 / h4，保证不跳级 */
  level?: 2 | 3 | 4
}>(), {
  subtitle: '',
  level: 3,
})

const tag = computed(() => `h${props.level}`)
</script>
