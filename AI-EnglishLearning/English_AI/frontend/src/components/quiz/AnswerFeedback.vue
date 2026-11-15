<script setup lang="ts">
import AppIcon from '@/components/ui/AppIcon.vue'

const props = defineProps<{
  status: 'correct' | 'incorrect'
  label: string
}>()
</script>

<template>
  <div
    class="p-3 rounded-xl font-label-lg text-label-lg text-center flex items-center justify-center gap-1"
    :class="props.status === 'correct'
      ? 'bg-tertiary-container/30 text-on-tertiary-container'
      : 'bg-error-container/30 text-on-error-container'"
  >
    <AppIcon
      :name="props.status === 'correct' ? 'check_circle' : 'cancel'"
      size="lg"
      class="align-middle mr-1"
    />
    <span>{{ props.label }}</span>
  </div>
</template>
