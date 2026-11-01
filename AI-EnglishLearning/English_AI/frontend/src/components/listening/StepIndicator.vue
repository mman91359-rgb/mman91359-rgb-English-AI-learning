<template>
  <div class="flex items-center gap-2 mb-6">
    <div class="flex items-center gap-1.5" :class="current >= 1 ? 'text-tertiary' : 'text-outline'">
      <span class="w-6 h-6 rounded-full flex items-center justify-center font-label-md text-label-md font-bold" :class="current >= 1 ? 'bg-tertiary text-on-tertiary' : 'bg-surface-variant text-outline'">1</span>
      <span class="font-label-md text-label-md" :class="current >= 1 ? 'font-bold' : ''">{{ $t('listening.stepListenArticle') }}</span>
    </div>
    <div class="flex-1 h-0.5 rounded-full" :class="current >= 2 ? 'bg-tertiary/30' : 'bg-outline-variant/40'"></div>
    <div class="flex items-center gap-1.5" :class="current >= 2 ? 'text-tertiary' : 'text-outline'">
      <span class="w-6 h-6 rounded-full flex items-center justify-center font-label-md text-label-md font-bold" :class="current >= 2 ? 'bg-tertiary text-on-tertiary' : 'bg-surface-variant text-outline'">2</span>
      <span class="font-label-md text-label-md" :class="current >= 2 ? 'font-bold' : ''">{{ $t('listening.stepListenQuestion') }}</span>
    </div>
    <div class="flex-1 h-0.5 rounded-full" :class="current >= 3 ? 'bg-tertiary/30' : 'bg-outline-variant/40'"></div>
    <div class="flex items-center gap-1.5" :class="current >= 3 ? 'text-tertiary' : 'text-outline'">
      <span class="w-6 h-6 rounded-full flex items-center justify-center font-label-md text-label-md font-bold" :class="current >= 3 ? 'bg-tertiary text-on-tertiary' : 'bg-surface-variant text-outline'">3</span>
      <span class="font-label-md text-label-md" :class="current >= 3 ? 'font-bold' : ''">{{ $t('listening.stepChooseAnswer') }}</span>
    </div>
  </div>
</template>

<script setup lang="ts">
defineProps<{ current: number }>()
</script>
