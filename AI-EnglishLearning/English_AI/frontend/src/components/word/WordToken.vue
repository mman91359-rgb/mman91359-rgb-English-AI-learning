<template>
  <button
    type="button"
    class="inline rounded px-0.5 font-body-md text-body-md text-on-surface transition-colors hover:bg-primary-container/40 hover:text-primary focus-visible:outline focus-visible:outline-2 focus-visible:outline-primary"
    @click.stop="emit('lookup', normalized)"
  >
    {{ text }}
  </button>
</template>

<script setup lang="ts">
import { computed } from 'vue'

/**
 * 可点击单词原子组件。
 * 把英文句子里的单个单词渲染为可点击 token，点击触发查词。
 * 只负责单词本身的点击交互，不影响外层排版（可嵌在段落/表格/对比列中）。
 */
const props = defineProps<{
  /** 单词原文（不含前后标点） */
  text: string
}>()

const emit = defineEmits<{
  (e: 'lookup', word: string): void
}>()

/** 去掉可能粘连的标点，保证查词用的原形 */
const normalized = computed(() => props.text.replace(/[^a-zA-Z'-]/g, ''))
</script>
