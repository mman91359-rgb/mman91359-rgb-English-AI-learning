<template>
  <div class="flex flex-col items-center justify-center py-20 text-center" role="alert">
    <AppIcon name="error_outline" size="3xl" tone="error" />
    <p class="mt-4 font-body-lg text-body-lg text-on-surface">{{ title || $t('common.error') }}</p>
    <p v-if="message" class="mt-2 max-w-md font-body-md text-body-md text-on-surface-variant">{{ message }}</p>
    <button
      v-if="actionLabel"
      type="button"
      :class="['mt-4', btnPrimarySm]"
      @click="$emit('retry')"
    >
      {{ actionLabel }}
    </button>
  </div>
</template>

<script setup lang="ts">
import { btnPrimarySm } from './buttonStyles'
import AppIcon from './AppIcon.vue'

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
