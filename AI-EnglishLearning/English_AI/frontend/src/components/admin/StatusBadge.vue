<template>
  <span class="inline-flex items-center rounded-full px-2.5 py-1 font-label-md text-label-md" :class="badgeClass">
    {{ text || status }}
  </span>
</template>

<script setup lang="ts">
import { computed } from 'vue'

const props = defineProps<{
  status: string | number
  text?: string
}>()

const normalized = computed(() => String(props.status).toUpperCase())

const badgeClass = computed(() => {
  if (['1', 'APPROVED', 'PUBLISHED', 'ACTIVE'].includes(normalized.value)) {
    return 'bg-tertiary-container/25 text-tertiary'
  }
  if (['0', 'REJECTED', 'FAILED'].includes(normalized.value)) {
    return 'bg-error-container/40 text-error'
  }
  if (['PENDING', 'DRAFT', 'SCHEDULED'].includes(normalized.value)) {
    return 'bg-secondary-container/30 text-secondary'
  }
  return 'bg-surface-container-high text-on-surface-variant'
})
</script>
