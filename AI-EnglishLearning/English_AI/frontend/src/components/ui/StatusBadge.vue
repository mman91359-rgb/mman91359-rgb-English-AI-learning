<template>
  <span class="inline-flex items-center rounded-full px-2.5 py-1 font-label-md text-label-md" :class="toneClass">
    {{ label }}
  </span>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import type { BadgeTone } from './statusBadgeTypes'

/**
 * StatusBadge —— 状态结果胶囊（管理动作 / 流程结果语义）。
 *
 * 由 `components/admin/StatusBadge.vue` 原样提升而来，props 与视觉**逐字节一致**，
 * 因此 admin 侧 9 个调用点的渲染结果零变化。admin 里的同名文件已改为转发壳。
 *
 * ## 与 Tag 的分工（不要互相替代）
 * | 组件 | 语义 | 色档 | 典型用法 |
 * |---|---|---|---|
 * | `StatusBadge` | 某个动作/流程的**结果** | success / danger / warning / info / neutral | 审核状态、操作结果、投稿状态 |
 * | `Tag` | 内容的**分类** | primary / tertiary / neutral / warning / error | 模块名、单词词性、难度档 |
 *
 * 两者的圆角、内边距、字号恰好相同（`rounded-full` + `px-2.5 py-1` + `label-md`），
 * 但色档语义不同，**不合并**。需要分类标签请用 `Tag`，需要结果状态请用本组件。
 *
 * ## 禁止用法
 * - 禁止用本组件表达内容分类（如「词汇」「语法」）：那会把「分类」误读成「结果」。
 * - 禁止传 `class` 覆盖圆角或密度：密度只有 `px-2.5 py-1` 一档，与 admin 表格行高对齐。
 * - 禁止用它承载可点击动作，状态胶囊不是按钮。
 * - 禁止把纯文本状态改写成胶囊来「统一观感」：那属于新增可见元素，应先确认设计意图。
 */
const props = withDefaults(defineProps<{
  /** 语义档，见文件头的分工表 */
  tone?: BadgeTone
  /** 显示文案，按纯文本渲染 */
  label: string
}>(), {
  tone: 'neutral',
})

/**
 * 色档映射沿用 admin 原实现，含 `info` 走 `info-container`。
 * 此处刻意不改写成 `Tag` 的 `primary-container/30`：改色会波及 9 个 admin 调用点，
 * 提升的目标是「换位置不换表现」。
 */
const toneClass = computed(() => {
  if (props.tone === 'success') return 'bg-tertiary-container/50 text-on-tertiary-container'
  if (props.tone === 'danger') return 'bg-error-container text-on-error-container'
  if (props.tone === 'warning') return 'bg-warning-container text-on-warning-container'
  if (props.tone === 'info') return 'bg-info-container text-on-info-container'
  return 'bg-surface-container-high text-on-surface-variant'
})
</script>
