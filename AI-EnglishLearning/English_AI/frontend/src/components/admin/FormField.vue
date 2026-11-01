<template>
  <label class="flex flex-col gap-2">
    <span class="flex items-center gap-1 font-label-lg text-label-lg text-on-surface">
      {{ label }}
      <span v-if="required" class="text-error">*</span>
    </span>
    <slot />
    <span v-if="error" class="font-label-md text-label-md text-error">{{ error }}</span>
    <span v-else-if="hint" class="font-label-md text-label-md text-on-surface-variant">{{ hint }}</span>
  </label>
</template>

<script setup lang="ts">
withDefaults(defineProps<{
  label: string
  required?: boolean
  hint?: string
  error?: string
}>(), {
  required: false,
})
</script>
