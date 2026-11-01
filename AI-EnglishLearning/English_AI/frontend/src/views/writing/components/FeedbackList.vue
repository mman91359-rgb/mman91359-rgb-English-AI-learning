<template>
  <div class="flex flex-col gap-3 rounded-2xl border border-outline-variant/40 bg-surface-container-lowest p-6 shadow-soft-glow">
    <div class="flex items-center gap-2">
      <span class="flex h-8 w-8 items-center justify-center rounded-lg" :class="toneClass">
        <span class="material-symbols-outlined text-icon-sm">{{ icon }}</span>
      </span>
      <h3 class="font-body-lg text-body-lg font-semibold text-on-surface">{{ title }}</h3>
    </div>
    <ul class="flex list-disc flex-col gap-1.5 pl-5 font-body-sm text-body-sm text-on-surface">
      <li v-for="item in items" :key="item">{{ item }}</li>
    </ul>
  </div>
</template>

<script setup lang="ts">
import { computed } from 'vue'

const props = defineProps<{
  title: string
  icon: string
  items: string[]
  tone: 'success' | 'warning'
}>()

const toneClass = computed(() => (props.tone === 'success' ? 'bg-tertiary-container/30 text-tertiary' : 'bg-warning-container/40 text-warning'))
</script>
