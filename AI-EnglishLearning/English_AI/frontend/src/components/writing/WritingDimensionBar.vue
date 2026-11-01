<template>
  <div class="flex flex-col gap-2">
    <div class="flex items-center justify-between font-label-md text-label-md text-on-surface">
      <span>{{ label }}</span>
      <span class="tabular-nums text-on-surface-variant">{{ value }} / {{ max }}</span>
    </div>
    <div class="h-2 overflow-hidden rounded-full bg-surface-container-high">
      <div
        class="h-full rounded-full bg-primary transition-all duration-500"
        :style="{ width: Math.min(100, Math.max(0, (value / max) * 100)) + '%' }"
      />
    </div>
  </div>
</template>

<script setup lang="ts">
withDefaults(defineProps<{
  label: string
  value: number
  max?: number
}>(), {
  max: 3,
})
</script>
