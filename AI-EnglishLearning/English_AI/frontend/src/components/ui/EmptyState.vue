<template>
  <div class="flex flex-col items-center justify-center py-20 text-center">
    <span class="material-symbols-outlined text-icon-3xl text-outline" aria-hidden="true">{{ icon }}</span>
    <p class="mt-4 font-body-lg text-body-lg text-on-surface-variant">{{ title }}</p>
    <p v-if="description" class="mt-2 max-w-md font-body-md text-body-md text-on-surface-variant/80">{{ description }}</p>
    <slot name="action" />
    <button
      v-if="actionLabel"
      type="button"
      :class="['mt-4', btnSecondarySm]"
      @click="$emit('action')"
    >
      {{ actionLabel }}
    </button>
  </div>
</template>

<script setup lang="ts">
import { btnSecondarySm } from './buttonStyles'

withDefaults(defineProps<{
  icon?: string
  title: string
  description?: string
  actionLabel?: string
}>(), {
  icon: 'inbox',
  description: '',
  actionLabel: '',
})

defineEmits<{
  (e: 'action'): void
}>()
</script>
