<template>
  <LoadingState v-if="loading && rows.length === 0" :message="$t('adminConsole.common.loading')" />
  <EmptyState v-else-if="rows.length === 0" :title="emptyTitle" :description="emptyDescription">
    <template v-if="$slots['empty-action']" #action>
      <slot name="empty-action" />
    </template>
  </EmptyState>
  <div v-else class="overflow-x-auto transition-opacity duration-200" :class="refreshing ? 'opacity-60' : ''">
    <table class="w-full min-w-[720px] border-collapse font-body-sm text-body-sm">
      <thead class="sticky top-0 z-10 bg-surface-container-low">
        <tr class="font-label-md text-label-md text-on-surface-variant">
          <th v-if="hasExpanded" class="w-12 px-4 py-3" :aria-label="$t('adminConsole.table.expand')" />
          <th
            v-for="column in columns"
            :key="column.key"
            :style="column.width ? { width: column.width } : undefined"
            class="whitespace-nowrap px-4 py-3 font-medium"
            :class="alignClass(column.align)"
          >
            {{ column.header }}
          </th>
        </tr>
      </thead>
      <tbody>
        <template v-for="row in rows" :key="rowKey(row)">
          <tr
            class="h-admin-table-row border-b border-outline-variant/40 transition-colors duration-150 hover:bg-surface-container-low"
            :class="expandedKey === rowKey(row) ? 'bg-surface-container-low' : ''"
          >
            <td v-if="hasExpanded" class="px-4">
              <button
                type="button"
                :class="btnIconSm"
                :aria-expanded="expandedKey === rowKey(row)"
                :aria-label="$t('adminConsole.table.expand')"
                @click="toggleExpanded(rowKey(row))"
              >
                <span
                  class="material-symbols-outlined text-icon-md transition-transform duration-200"
                  :class="expandedKey === rowKey(row) ? 'rotate-180' : ''"
                >
                  expand_more
                </span>
              </button>
            </td>
            <td
              v-for="column in columns"
              :key="column.key"
              class="px-4 py-2 align-middle text-on-surface"
              :class="alignClass(column.align)"
            >
              <slot :name="`cell-${column.key}`" :row="row" :value="cellValue(row, column.key)">
                {{ cellValue(row, column.key) }}
              </slot>
            </td>
          </tr>
          <tr v-if="hasExpanded && expandedKey === rowKey(row)" class="border-b border-outline-variant/40 bg-surface-container-low">
            <td :colspan="columns.length + 1" class="px-6 py-4">
              <slot name="expanded" :row="row" />
            </td>
          </tr>
        </template>
      </tbody>
    </table>
  </div>
</template>

<script setup lang="ts" generic="T">
import { computed, ref, useSlots } from 'vue'
import EmptyState from '../ui/EmptyState.vue'
import LoadingState from '../ui/LoadingState.vue'
import type { TableColumn } from './tableTypes'
import { btnIconSm } from '@/components/ui/buttonStyles'

withDefaults(defineProps<{
  columns: TableColumn[]
  rows: T[]
  rowKey: (row: T) => string | number
  loading: boolean
  refreshing?: boolean
  emptyTitle: string
  emptyDescription?: string
}>(), {
  refreshing: false,
  emptyDescription: '',
})

const slots = useSlots()
const hasExpanded = computed(() => Boolean(slots.expanded))
const expandedKey = ref<string | number | null>(null)

const alignClass = (align: TableColumn['align'] = 'left') => ({
  'text-left': align === 'left',
  'text-right': align === 'right',
  'text-center': align === 'center',
})

const cellValue = (row: T, key: string): string => {
  const value = (row as Record<string, unknown>)[key]
  return value === null || value === undefined ? '—' : String(value)
}

const toggleExpanded = (key: string | number) => {
  expandedKey.value = expandedKey.value === key ? null : key
}
</script>
