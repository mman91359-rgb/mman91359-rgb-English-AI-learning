<template>
  <section class="flex flex-col gap-6 rounded-[16px] border border-outline-variant/40 bg-surface-container-lowest p-6 shadow-soft-glow">
    <header class="flex flex-col gap-1">
      <h2 class="font-headline-sm text-headline-sm text-on-surface">{{ title }}</h2>
      <p v-if="description" class="font-body-sm text-body-sm text-on-surface-variant">{{ description }}</p>
    </header>

    <p v-if="total === 0" class="py-8 text-center font-body-sm text-body-sm text-on-surface-variant">
      {{ $t('adminConsole.chart.noData') }}
    </p>
    <ul v-else class="flex flex-col gap-4">
      <li v-for="item in data" :key="item.label" class="flex flex-col gap-2">
        <div class="flex items-center justify-between font-body-sm text-body-sm">
          <span class="text-on-surface-variant">{{ item.label }}</span>
          <span class="font-semibold tabular-nums text-on-surface">{{ formatNumber(item.value, locale) }}</span>
        </div>
        <div class="h-2 overflow-hidden rounded-full bg-surface-container-high">
          <div
            class="h-full origin-left rounded-full transition-[width] duration-700 ease-out"
            :class="barClassName"
            :style="{ width: widthOf(item.value) + '%' }"
          />
        </div>
      </li>
    </ul>
  </section>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { useI18n } from 'vue-i18n'
import { formatNumber } from '../../utils/format'

interface BarDatum {
  label: string
  value: number
}

const props = withDefaults(defineProps<{
  title: string
  description?: string
  data: BarDatum[]
  barClassName?: string
}>(), {
  description: '',
  barClassName: 'bg-primary',
})

const { locale } = useI18n()
const max = computed(() => Math.max(0, ...props.data.map((item) => item.value)))
const total = computed(() => props.data.reduce((sum, item) => sum + item.value, 0))
const widthOf = (value: number) => (max.value > 0 ? Math.round((value / max.value) * 100) : 0)
</script>
