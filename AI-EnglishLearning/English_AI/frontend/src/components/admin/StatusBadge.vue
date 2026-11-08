<template>
  <span class="inline-flex items-center rounded-full px-2.5 py-1 font-label-md text-label-md" :class="toneClass">
    {{ label }}
  </span>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import type { BadgeTone } from './tableTypes'

const props = withDefaults(defineProps<{
  tone?: BadgeTone
  label: string
}>(), {
  tone: 'neutral',
})

const toneClass = computed(() => {
  if (props.tone === 'success') return 'bg-tertiary-container/50 text-on-tertiary-container'
  if (props.tone === 'danger') return 'bg-error-container text-on-error-container'
  if (props.tone === 'warning') return 'bg-warning-container text-on-warning-container'
  if (props.tone === 'info') return 'bg-info-container text-on-info-container'
  return 'bg-surface-container-high text-on-surface-variant'
})
</script>
