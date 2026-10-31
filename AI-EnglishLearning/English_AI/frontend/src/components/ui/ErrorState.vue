<template>
  <div class="flex flex-col items-center justify-center py-20 text-center">
    <span class="material-symbols-outlined text-6xl text-error">error_outline</span>
    <p class="mt-4 font-body-lg text-body-lg text-on-surface">{{ title || $t('common.error') }}</p>
    <p v-if="message" class="mt-2 font-body-md text-body-md text-on-surface-variant">{{ message }}</p>
    <button
      v-if="actionLabel"
      type="button"
      class="mt-4 rounded-full bg-primary px-5 py-2 font-label-sm text-label-sm text-on-primary transition-colors hover:bg-primary/90"
      @click="$emit('retry')"
    >
      {{ actionLabel }}
    </button>
  </div>
</template>

<script setup lang="ts">
withDefaults(defineProps<{
  message?: string
  title?: string
  actionLabel?: string
}>(), {
  message: '',
  title: '',
  actionLabel: '',
})

defineEmits<{
  (e: 'retry'): void
}>()
</script>
