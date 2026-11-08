<template>
  <div class="flex flex-col rounded-[24px] border border-outline-variant/40 bg-surface-container-lowest shadow-soft-glow">
    <header class="flex items-center gap-2 px-6 pt-5">
      <span class="flex h-9 w-9 items-center justify-center rounded-full bg-tertiary-container/40 text-tertiary">
        <span class="material-symbols-outlined text-icon-md">rate_review</span>
      </span>
      <h2 class="font-headline-sm text-headline-sm text-on-surface">{{ $t('ai.panel.title') }}</h2>
    </header>

    <div class="px-6 py-4">
      <div v-if="loading" class="flex flex-col gap-3 py-6" aria-busy="true" aria-label="AI 正在分析">
        <div class="animate-shimmer h-3 w-1/3 rounded-full bg-gradient-to-r from-surface-container-low via-surface-container to-surface-container-low bg-[length:200%_100%]"></div>
        <div class="animate-shimmer h-4 w-full rounded-full bg-gradient-to-r from-surface-container-low via-surface-container to-surface-container-low bg-[length:200%_100%]"></div>
        <div class="animate-shimmer h-4 w-5/6 rounded-full bg-gradient-to-r from-surface-container-low via-surface-container to-surface-container-low bg-[length:200%_100%]"></div>
        <div class="animate-shimmer h-4 w-2/3 rounded-full bg-gradient-to-r from-surface-container-low via-surface-container to-surface-container-low bg-[length:200%_100%]"></div>
      </div>

      <div v-else-if="error" class="flex flex-col items-center gap-3 py-6 text-center">
        <span class="material-symbols-outlined text-4xl text-error">error</span>
        <p class="font-body-md text-body-md text-on-surface-variant">{{ error }}</p>
      </div>

      <component
        :is="templateComponent"
        v-else-if="data"
        :data="data"
        :score="data"
        @lookup="emit('lookup', $event)"
      />
    </div>

    <AiActionBar
      v-if="!loading && !error && data"
      :actions="actions"
      @copy="emit('copy')"
      @favorite="emit('favorite')"
      @add-error="emit('addError')"
      @add-vocab="emit('addVocab')"
      @mastered="emit('mastered')"
    />
  </div>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import AiActionBar from './AiActionBar.vue'
import WritingFeedback from './templates/WritingFeedback.vue'
import TranslationFeedback from './templates/TranslationFeedback.vue'
import ListeningFeedback from './templates/ListeningFeedback.vue'

type PanelType = 'writing' | 'translation' | 'listening'

/**
 * 通用 AI 输出面板外壳：统一卡片样式、加载/错误态、底部操作条，
 * 中间内容区按 type 动态渲染对应业务模板。
 */
const props = defineProps<{
  type: PanelType
  loading?: boolean
  error?: string
  data?: Record<string, unknown> | null
  actions?: {
    copy?: boolean
    favorite?: boolean
    addError?: boolean
    addVocab?: boolean
    mastered?: boolean
  }
}>()

const emit = defineEmits<{
  (e: 'lookup', word: string): void
  (e: 'copy'): void
  (e: 'favorite'): void
  (e: 'addError'): void
  (e: 'addVocab'): void
  (e: 'mastered'): void
}>()

const TEMPLATE_MAP: Record<PanelType, unknown> = {
  writing: WritingFeedback,
  translation: TranslationFeedback,
  listening: ListeningFeedback,
}

const templateComponent = computed(() => TEMPLATE_MAP[props.type])
</script>
