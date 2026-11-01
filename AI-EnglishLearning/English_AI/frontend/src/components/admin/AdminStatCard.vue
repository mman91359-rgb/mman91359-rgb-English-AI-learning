<template>
  <div class="bg-surface-container-lowest rounded-[20px] p-5 shadow-soft-glow border border-outline-variant/20">
    <div class="flex items-start justify-between gap-3">
      <div>
        <p class="font-label-md text-label-md text-on-surface-variant">{{ label }}</p>
        <p class="font-headline-lg text-headline-lg text-on-surface mt-2">{{ value }}</p>
      </div>
      <span class="w-10 h-10 rounded-full flex items-center justify-center" :class="toneClass">
        <span class="material-symbols-outlined">{{ icon }}</span>
      </span>
    </div>
    <p v-if="hint" class="font-label-md text-label-md text-on-surface-variant mt-3">{{ hint }}</p>
  </div>
</template>

<script setup lang="ts">
import { computed } from 'vue'

const props = withDefaults(defineProps<{
  label: string
  value: string | number
  icon: string
  hint?: string
  tone?: 'primary' | 'secondary' | 'tertiary' | 'error'
}>(), {
  tone: 'primary',
})

const toneClass = computed(() => {
  if (props.tone === 'secondary') return 'bg-secondary-container/30 text-secondary'
  if (props.tone === 'tertiary') return 'bg-tertiary-container/25 text-tertiary'
  if (props.tone === 'error') return 'bg-error-container/40 text-error'
  return 'bg-primary-container/20 text-primary'
})
</script>
