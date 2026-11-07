<template>
  <div class="flex flex-wrap items-center gap-1 border-t border-outline-variant/40 px-4 py-3">
    <button
      v-if="actions.copy"
      type="button"
      class="flex h-9 items-center gap-1.5 rounded-full px-3 font-label-md text-label-md text-on-surface-variant transition-colors hover:bg-surface-container-high"
      @click="emit('copy')"
    >
      <span class="material-symbols-outlined text-icon-md">content_copy</span>
      <span>{{ $t('ai.action.copy') }}</span>
    </button>
    <button
      v-if="actions.favorite"
      type="button"
      class="flex h-9 items-center gap-1.5 rounded-full px-3 font-label-md text-label-md text-on-surface-variant transition-colors hover:bg-surface-container-high"
      @click="emit('favorite')"
    >
      <span class="material-symbols-outlined text-icon-md">bookmark_add</span>
      <span>{{ $t('ai.action.favorite') }}</span>
    </button>
    <button
      v-if="actions.addError"
      type="button"
      class="flex h-9 items-center gap-1.5 rounded-full px-3 font-label-md text-label-md text-on-surface-variant transition-colors hover:bg-surface-container-high"
      @click="emit('addError')"
    >
      <span class="material-symbols-outlined text-icon-md">error</span>
      <span>{{ $t('ai.action.addError') }}</span>
    </button>
    <button
      v-if="actions.addVocab"
      type="button"
      class="flex h-9 items-center gap-1.5 rounded-full px-3 font-label-md text-label-md text-on-surface-variant transition-colors hover:bg-surface-container-high"
      @click="emit('addVocab')"
    >
      <span class="material-symbols-outlined text-icon-md">bookmark</span>
      <span>{{ $t('ai.action.addVocab') }}</span>
    </button>
    <button
      v-if="actions.mastered"
      type="button"
      class="flex h-9 items-center gap-1.5 rounded-full px-3 font-label-md text-label-md text-on-surface-variant transition-colors hover:bg-surface-container-high"
      @click="emit('mastered')"
    >
      <span class="material-symbols-outlined text-icon-md">task_alt</span>
      <span>{{ $t('ai.action.mastered') }}</span>
    </button>
  </div>
</template>

<script setup lang="ts">
/**
 * 通用 AI 操作条：复制/收藏/加错题本/加单词本/标记掌握。
 * 通过 props 控制显示哪些按钮，事件由父组件处理。
 */
withDefaults(defineProps<{
  actions?: {
    copy?: boolean
    favorite?: boolean
    addError?: boolean
    addVocab?: boolean
    mastered?: boolean
  }
}>(), {
  actions: () => ({}),
})

const emit = defineEmits<{
  (e: 'copy'): void
  (e: 'favorite'): void
  (e: 'addError'): void
  (e: 'addVocab'): void
  (e: 'mastered'): void
}>()
</script>
