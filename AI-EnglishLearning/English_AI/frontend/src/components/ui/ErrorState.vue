<template>
  <div class="flex flex-col items-center justify-center py-20 text-center" role="alert">
    <span class="material-symbols-outlined text-icon-3xl text-error" aria-hidden="true">error_outline</span>
    <p class="mt-4 font-body-lg text-body-lg text-on-surface">{{ title || $t('common.error') }}</p>
    <p v-if="message" class="mt-2 max-w-md font-body-md text-body-md text-on-surface-variant">{{ message }}</p>
    <button
      v-if="actionLabel"
      type="button"
      class="mt-4 rounded-full bg-primary px-5 py-2 font-label-sm text-label-sm text-on-primary transition-colors hover:bg-primary/90 active:bg-primary/80 focus:outline-none focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-primary"
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
