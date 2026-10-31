<template>
  <div class="flex flex-col items-center justify-center py-20 text-center">
    <span class="material-symbols-outlined text-6xl text-outline">{{ icon }}</span>
    <p class="mt-4 font-body-lg text-body-lg text-on-surface-variant">{{ title }}</p>
    <p v-if="description" class="mt-2 font-body-md text-body-md text-on-surface-variant/60">{{ description }}</p>
    <button
      v-if="actionLabel"
      type="button"
      class="mt-4 rounded-full border border-outline-variant px-5 py-2 font-label-sm text-label-sm text-on-surface-variant transition-colors hover:bg-surface-variant"
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
