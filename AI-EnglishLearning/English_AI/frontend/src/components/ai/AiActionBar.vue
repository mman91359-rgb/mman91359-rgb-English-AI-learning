<template>
  <div class="flex flex-wrap items-center gap-1 border-t border-outline-variant/40 px-4 py-3">
    <button
      v-if="actions.copy"
      type="button"
      class="flex h-9 items-center gap-1.5 rounded-full px-3 font-label-md text-label-md text-on-surface-variant transition-colors hover:bg-surface-container-high"
      @click="emit('copy')"
    >
      <AppIcon name="content_copy" size="md" />
      <span>{{ $t('ai.action.copy') }}</span>
    </button>
    <button
      v-if="actions.favorite"
      type="button"
      class="flex h-9 items-center gap-1.5 rounded-full px-3 font-label-md text-label-md transition-colors hover:bg-surface-container-high"
      :class="favorited ? 'text-error' : 'text-on-surface-variant'"
      :aria-pressed="favorited"
      @click="emit('favorite')"
    >
      <AppIcon :name="favorited ? 'favorite' : 'favorite_border'" size="md" :filled="favorited" />
      <span>{{ favorited ? $t('ai.action.favorited') : $t('ai.action.favorite') }}</span>
    </button>
    <button
      v-if="actions.addError"
      type="button"
      class="flex h-9 items-center gap-1.5 rounded-full px-3 font-label-md text-label-md text-on-surface-variant transition-colors hover:bg-surface-container-high"
      @click="emit('addError')"
    >
      <AppIcon name="error" size="md" />
      <span>{{ $t('ai.action.addError') }}</span>
    </button>
    <button
      v-if="actions.addVocab"
      type="button"
      class="flex h-9 items-center gap-1.5 rounded-full px-3 font-label-md text-label-md text-on-surface-variant transition-colors hover:bg-surface-container-high"
      @click="emit('addVocab')"
    >
      <AppIcon name="bookmark" size="md" />
      <span>{{ $t('ai.action.addVocab') }}</span>
    </button>
    <button
      v-if="actions.mastered"
      type="button"
      class="flex h-9 items-center gap-1.5 rounded-full px-3 font-label-md text-label-md text-on-surface-variant transition-colors hover:bg-surface-container-high"
      @click="emit('mastered')"
    >
      <AppIcon name="task_alt" size="md" />
      <span>{{ $t('ai.action.mastered') }}</span>
    </button>
  </div>
</template>

<script setup lang="ts">
/**
 * 通用 AI 操作条：复制/收藏/加错题本/加单词本/标记掌握。
 * 通过 props 控制显示哪些按钮，事件由父组件处理。
 * 收藏按钮由父组件传 favorited 驱动图标与颜色（空心 → 红色实心）。
 */
import AppIcon from '../ui/AppIcon.vue'

withDefaults(defineProps<{
  actions?: {
    copy?: boolean
    favorite?: boolean
    addError?: boolean
    addVocab?: boolean
    mastered?: boolean
  }
  /** 当前内容是否已收藏 */
  favorited?: boolean
}>(), {
  actions: () => ({}),
  favorited: false,
})

const emit = defineEmits<{
  (e: 'copy'): void
  (e: 'favorite'): void
  (e: 'addError'): void
  (e: 'addVocab'): void
  (e: 'mastered'): void
}>()
</script>
