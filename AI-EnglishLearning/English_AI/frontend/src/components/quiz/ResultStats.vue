<script setup lang="ts">
interface StatItem {
  value: string | number
  label: string
  highlight?: boolean
}

const props = defineProps<{
  stats: StatItem[]
}>()
</script>

<template>
  <div class="flex items-center justify-center gap-8 mt-6">
    <div v-for="(item, index) in props.stats" :key="index" class="text-center">
      <p
        class="font-display-lg text-display-lg font-bold"
        :class="item.highlight ? 'text-primary' : 'text-on-surface'"
      >{{ item.value }}</p>
      <p class="font-label-md text-label-md text-on-surface-variant">{{ item.label }}</p>
    </div>
  </div>
</template>
