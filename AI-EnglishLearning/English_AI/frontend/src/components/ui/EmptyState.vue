<template>
  <div class="flex flex-col items-center justify-center py-20 text-center">
    <span class="material-symbols-outlined text-icon-3xl text-outline" aria-hidden="true">{{ icon }}</span>
    <p class="mt-4 font-body-lg text-body-lg text-on-surface-variant">{{ title }}</p>
    <p v-if="description" class="mt-2 max-w-md font-body-md text-body-md text-on-surface-variant/80">{{ description }}</p>
    <slot name="action" />
    <button
      v-if="actionLabel"
      type="button"
      class="mt-4 rounded-full border border-outline-variant px-5 py-2 font-label-sm text-label-sm text-on-surface-variant transition-colors hover:bg-surface-variant active:bg-surface-container focus:outline-none focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-primary"
      @click="$emit('action')"
    >
      {{ actionLabel }}
    </button>
  </div>
</template>

<script setup lang="ts">
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
