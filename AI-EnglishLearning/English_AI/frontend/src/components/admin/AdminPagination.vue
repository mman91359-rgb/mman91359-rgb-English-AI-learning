<template>
  <div class="flex flex-col items-center justify-between gap-3 border-t border-outline-variant/40 px-4 py-4 sm:flex-row">
    <span class="font-label-md text-label-md text-on-surface-variant">
      {{ $t('adminConsole.pagination.total', { total }) }}
    </span>
    <div class="flex items-center gap-2">
      <label class="flex items-center gap-2 font-label-md text-label-md text-on-surface-variant">
        {{ $t('adminConsole.pagination.perPage') }}
        <select
          :value="size"
          class="h-9 rounded-lg border border-outline-variant/40 bg-surface px-2 font-label-md text-label-md text-on-surface"
          @change="$emit('update:size', Number(($event.target as HTMLSelectElement).value))"
        >
          <option v-for="option in PAGE_SIZE_OPTIONS" :key="option" :value="option">{{ option }}</option>
        </select>
      </label>
      <button
        type="button"
        class="h-9 rounded-lg border border-outline-variant/40 px-3 font-label-md text-label-md disabled:opacity-40"
        :disabled="page <= 1"
        @click="$emit('update:page', page - 1)"
      >
        {{ $t('adminConsole.pagination.prev') }}
      </button>
      <span class="px-2 font-label-md text-label-md text-on-surface">
        {{ $t('adminConsole.pagination.pageOf', { page, pages: totalPages }) }}
      </span>
      <button
        type="button"
        class="h-9 rounded-lg border border-outline-variant/40 px-3 font-label-md text-label-md disabled:opacity-40"
        :disabled="page >= totalPages"
        @click="$emit('update:page', page + 1)"
      >
        {{ $t('adminConsole.pagination.next') }}
      </button>
    </div>
  </div>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { PAGE_SIZE_OPTIONS } from '../../utils/query'

const props = defineProps<{ page: number; size: number; total: number }>()
defineEmits<{
  'update:page': [page: number]
  'update:size': [size: number]
}>()

const totalPages = computed(() => Math.max(1, Math.ceil(props.total / Math.max(1, props.size))))
</script>
