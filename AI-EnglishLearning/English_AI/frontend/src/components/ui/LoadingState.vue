<template>
  <div class="flex flex-col items-center justify-center gap-3 py-20 text-on-surface-variant">
    <span class="material-symbols-outlined text-4xl text-primary animate-spin">progress_activity</span>
    <p class="font-body-md text-body-md">{{ message || $t('common.loading') }}</p>
  </div>
</template>

<script setup lang="ts">
defineProps<{
  message?: string
}>()
</script>
