<template>
  <div class="group flex flex-col gap-4 rounded-[16px] border border-outline-variant/40 bg-surface-container-lowest p-6 shadow-soft-glow transition-all duration-300 hover:-translate-y-0.5 hover:border-primary/30">
    <div class="flex items-center justify-between">
      <span class="font-label-md text-label-md text-on-surface-variant">{{ label }}</span>
      <span class="flex h-10 w-10 items-center justify-center rounded-xl transition-transform duration-300 group-hover:scale-110" :class="toneClass">
        <span class="material-symbols-outlined text-icon-md">{{ icon }}</span>
      </span>
    </div>
    <div class="flex flex-col gap-1">
      <span class="font-headline-md text-headline-md tabular-nums text-on-surface">{{ value }}</span>
      <span v-if="hint" class="font-label-sm text-label-sm text-on-surface-variant">{{ hint }}</span>
    </div>
  </div>
</template>

<script setup lang="ts">
import { computed } from 'vue'

const props = withDefaults(defineProps<{
  label: string
  value: string | number
  icon: string
  hint?: string
  tone?: 'primary' | 'secondary' | 'tertiary' | 'warning' | 'error'
}>(), {
  tone: 'primary',
})

const toneClass = computed(() => {
  if (props.tone === 'secondary') return 'bg-secondary-container text-on-secondary-container'
  if (props.tone === 'tertiary') return 'bg-tertiary-container text-on-tertiary-container'
  if (props.tone === 'warning') return 'bg-warning-container text-on-warning-container'
  if (props.tone === 'error') return 'bg-error-container text-on-error-container'
  return 'bg-primary-container text-on-primary-container'
})
</script>
