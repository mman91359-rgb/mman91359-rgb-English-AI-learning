<template>
  <div class="flex flex-col items-center justify-center gap-3 py-20 text-on-surface-variant" role="status" aria-live="polite">
    <AppIcon
      name="progress_activity"
      size="2xl"
      tone="primary"
      class="animate-spin motion-reduce:animate-none"
    />
    <p class="font-body-md text-body-md">{{ message || $t('common.loading') }}</p>
  </div>
</template>

<script setup lang="ts">
import AppIcon from './AppIcon.vue'

defineProps<{
  message?: string
}>()
</script>
