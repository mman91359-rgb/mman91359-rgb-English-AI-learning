<template>
  <div class="flex-1 max-w-md mx-auto relative flex items-center">
    <div class="absolute left-0 top-1/2 -translate-y-1/2 -ml-2 bg-white dark:bg-surface shadow-lg rounded-full w-14 h-14 flex items-center justify-center z-10 border-4 border-background dark:border-surface">
      <span class="material-symbols-outlined text-secondary text-2xl" style="font-variation-settings: 'FILL' 1;">emoji_events</span>
    </div>
    <div
      class="w-full h-12 bg-surface-container-high rounded-full overflow-hidden ml-4 relative"
      role="progressbar"
      :aria-valuemin="0"
      :aria-valuemax="total"
      :aria-valuenow="answered"
      :aria-valuetext="`${answered}/${total}`"
    >
      <div
        class="h-full bg-primary dark:bg-primary/80 transition-all duration-500 ease-out"
        :style="{ width: percent + '%' }"
      ></div>
      <!-- 轨道底色层：压在未填充段 -->
      <span class="absolute inset-0 flex items-center justify-center text-lg font-bold text-on-surface-variant" aria-hidden="true">
        {{ answered }}/{{ total }}
      </span>
      <!-- 填充层反白：按进度横向裁切，与填充色同步过渡 -->
      <span
        class="absolute inset-0 flex items-center justify-center text-lg font-bold text-on-primary transition-all duration-500 ease-out"
        :style="{ clipPath: `inset(0 ${100 - percent}% 0 0)` }"
        aria-hidden="true"
      >
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
