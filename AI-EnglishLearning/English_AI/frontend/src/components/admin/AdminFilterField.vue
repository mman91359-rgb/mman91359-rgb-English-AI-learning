<template>
  <label class="flex flex-col gap-1.5" :class="className || 'w-full sm:w-44'">
    <span class="font-label-md text-label-md text-on-surface-variant">{{ label }}</span>
    <slot />
  </label>
</template>

<script setup lang="ts">
withDefaults(defineProps<{
  label: string
  className?: string
}>(), {
  className: '',
})
</script>
