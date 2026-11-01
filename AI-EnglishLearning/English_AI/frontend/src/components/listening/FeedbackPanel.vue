<template>
  <div class="border rounded-[20px] p-6 flex items-start gap-4" :class="cardClass">
    <div class="flex flex-col items-center gap-1 flex-shrink-0">
      <div class="w-10 h-10 rounded-full flex items-center justify-center" :class="iconCircleClass">
        <span class="material-symbols-outlined fill" :class="iconClass">{{ icon }}</span>
      </div>
      <span class="font-label-md text-label-md font-bold" :class="labelClass">{{ label }}</span>
    </div>

    <div class="flex-1 min-w-0">
      <p class="font-body-md text-body-md leading-relaxed" :class="messageClass">
        {{ message || $t('listening.feedbackIdle') }}
      </p>
      <div v-if="tags && tags.length" class="mt-3 flex flex-wrap gap-2">
        <span
          v-for="tag in tags"
          :key="tag"
          class="bg-surface-container-lowest/70 text-on-surface-variant font-label-md text-label-md px-2 py-1 rounded-md"
        >{{ tag }}</span>
      </div>
    </div>

    <button
      v-if="showFavorite"
      type="button"
      class="flex-shrink-0 p-2 rounded-full transition-colors"
      :class="favoriteClass"
      :aria-label="$t('listening.favorite')"
      @click="$emit('favorite')"
    >
      <span class="material-symbols-outlined">favorite_border</span>
    </button>
  </div>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { useI18n } from 'vue-i18n'

const props = withDefaults(defineProps<{
  status?: 'idle' | 'correct' | 'incorrect'
  message?: string
  tags?: string[]
  showFavorite?: boolean
}>(), {
  status: 'idle',
  tags: () => [],
  showFavorite: false,
})

defineEmits<{ favorite: [] }>()

const { t } = useI18n()

const label = computed(() => {
  if (props.status === 'correct') return t('listening.feedbackCorrect')
  if (props.status === 'incorrect') return t('listening.feedbackIncorrect')
  return t('listening.feedbackPendingLabel')
})

const icon = computed(() => {
  if (props.status === 'correct') return 'check'
  if (props.status === 'incorrect') return 'close'
  return 'auto_awesome'
})

const cardClass = computed(() => {
  if (props.status === 'correct') return 'bg-tertiary-container/20 border-tertiary/20 shadow-[0_4px_20px_rgba(0,110,32,0.08)]'
  if (props.status === 'incorrect') return 'bg-error-container/30 border-error/20 shadow-[0_4px_20px_rgba(186,26,26,0.08)]'
  return 'bg-surface-container-lowest border-outline-variant/20 shadow-[0_4px_20px_rgba(51,58,72,0.05)]'
})

const iconCircleClass = computed(() => {
  if (props.status === 'correct') return 'bg-tertiary/15'
  if (props.status === 'incorrect') return 'bg-error/20'
  return 'bg-primary-container/20'
})

const iconClass = computed(() => {
  if (props.status === 'correct') return 'text-tertiary'
  if (props.status === 'incorrect') return 'text-error'
  return 'text-primary'
})

const labelClass = computed(() => {
  if (props.status === 'correct') return 'text-tertiary'
  if (props.status === 'incorrect') return 'text-error'
  return 'text-primary'
})

const messageClass = computed(() => {
  if (props.status === 'correct') return 'text-on-tertiary-container'
  if (props.status === 'incorrect') return 'text-on-error-container'
  return 'text-on-surface-variant'
})

const favoriteClass = computed(() => {
  if (props.status === 'correct') return 'hover:bg-tertiary/10 text-tertiary'
  if (props.status === 'incorrect') return 'hover:bg-error/10 text-error'
  return 'hover:bg-primary/10 text-primary'
})
</script>
