<template>
  <div class="flex flex-col sm:flex-row items-center justify-between gap-3 pt-4">
    <span class="font-label-md text-label-md text-on-surface-variant">{{ $t('admin.total', { count: total }) }}</span>
    <div class="flex items-center gap-2">
      <select
        :value="size"
        class="h-9 rounded-lg border border-outline-variant/40 bg-surface px-2 font-label-md text-label-md text-on-surface"
        @change="$emit('update:size', Number(($event.target as HTMLSelectElement).value))"
      >
        <option v-for="option in [20, 50, 100]" :key="option" :value="option">{{ option }}</option>
      </select>
      <button
        type="button"
        class="px-3 h-9 rounded-lg border border-outline-variant/40 font-label-md text-label-md disabled:opacity-40"
        :disabled="page <= 1"
        @click="$emit('update:page', page - 1)"
      >{{ $t('admin.previous') }}</button>
      <span class="font-label-md text-label-md text-on-surface px-2">{{ page }} / {{ totalPages }}</span>
      <button
        type="button"
        class="px-3 h-9 rounded-lg border border-outline-variant/40 font-label-md text-label-md disabled:opacity-40"
        :disabled="page >= totalPages"
        @click="$emit('update:page', page + 1)"
      >{{ $t('admin.next') }}</button>
    </div>
  </div>
</template>

<script setup lang="ts">
import { computed } from 'vue'

const props = defineProps<{ page: number; size: number; total: number }>()
defineEmits<{
  'update:page': [page: number]
  'update:size': [size: number]
}>()

const totalPages = computed(() => Math.max(1, Math.ceil(props.total / Math.max(1, props.size))))
</script>
