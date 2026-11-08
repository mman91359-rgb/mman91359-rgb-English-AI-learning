<template>
  <div class="flex-1 max-w-md mx-auto relative flex items-center">
    <div class="absolute left-0 top-1/2 -translate-y-1/2 -ml-2 bg-white dark:bg-surface shadow-lg rounded-full w-14 h-14 flex items-center justify-center z-10 border-4 border-background dark:border-surface">
      <span class="material-symbols-outlined text-secondary text-2xl" style="font-variation-settings: 'FILL' 1;">emoji_events</span>
    </div>
    <div class="w-full h-12 bg-surface-container-high rounded-full overflow-hidden ml-4 relative flex items-center">
      <div
        class="h-full bg-primary dark:bg-primary/80 transition-all duration-500 ease-out"
        :style="{ width: percent + '%' }"
      ></div>
      <span class="absolute inset-0 flex items-center justify-center text-lg font-bold text-primary">
        {{ answered }}/{{ total }}
      </span>
    </div>
  </div>
</template>

<script setup lang="ts">
import { computed } from 'vue'

const props = defineProps<{
  answered: number
  total: number
}>()

const percent = computed(() => (props.total > 0 ? Math.min(100, Math.round((props.answered / props.total) * 100)) : 0))
</script>
