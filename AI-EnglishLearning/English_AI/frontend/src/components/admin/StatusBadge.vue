<template>
  <UiStatusBadge :tone="tone" :label="label" />
</template>

<script setup lang="ts">
import UiStatusBadge from '../ui/StatusBadge.vue'
import type { BadgeTone } from '../ui/statusBadgeTypes'

/**
 * 转发壳：`StatusBadge` 已提升到 `components/ui/StatusBadge.vue`。
 *
 * 保留本文件的原因：admin 侧 8 个页面 + `OverviewPanels` + `writing/WritingHistoryView`
 * 共 9 处 `import StatusBadge from '.../admin/StatusBadge.vue'`。改这些 import 路径
 * 属于「改 admin 页面」，本轮明确不做。这里用同签名纯转发，调用点零改动、渲染零变化。
 *
 * ## 禁止用法
 * - 禁止在本文件里新增任何逻辑或样式：它必须是纯转发。
 *   任何表现差异都应改 `ui/StatusBadge.vue`，让 admin 与用户端一起生效。
 * - 禁止新代码继续 import 本文件；新代码一律从 `components/ui/StatusBadge.vue` 引入。
 */
withDefaults(defineProps<{
  /** 语义档，取值与 ui 版本一致 */
  tone?: BadgeTone
  /** 显示文案，按纯文本渲染 */
  label: string
}>(), {
  tone: 'neutral',
})
</script>
