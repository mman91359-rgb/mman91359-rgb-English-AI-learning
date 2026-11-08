<template>
  <div class="flex flex-col items-center justify-center gap-3 py-20 text-on-surface-variant" role="status" aria-live="polite">
    <span
      class="material-symbols-outlined animate-spin text-icon-2xl text-primary motion-reduce:animate-none"
      aria-hidden="true"
    >
      progress_activity
    </span>
    <p class="font-body-md text-body-md">{{ message || $t('common.loading') }}</p>
  </div>
</template>

<script setup lang="ts">
defineProps<{
  message?: string
}>()
</script>
