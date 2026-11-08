<template>
  <div class="relative w-full">
    <div ref="chartRef" class="h-[280px] w-full"></div>
    <!-- 全维度无数据时的引导文案：不画假数据，也不放插画 -->
    <p
      v-if="allEmpty"
      class="pointer-events-none absolute inset-0 flex items-center justify-center px-10 text-center font-label-md text-label-md text-on-surface-variant"
    >
      {{ $t('profile.ability.emptyHint') }}
    </p>
  </div>
</template>

<script setup lang="ts">
import { computed, nextTick, onBeforeUnmount, onMounted, ref, watch } from 'vue'
import * as echarts from 'echarts/core'
import { RadarChart } from 'echarts/charts'
import { RadarComponent, TooltipComponent } from 'echarts/components'
import { CanvasRenderer } from 'echarts/renderers'
import type { ECharts } from 'echarts/core'
import { useAppStore } from '@/stores/app'

echarts.use([RadarChart, RadarComponent, TooltipComponent, CanvasRenderer])

/** 雷达图单轴数据：label 已由页面做好 i18n，组件不感知业务语义 */
export interface RadarAxisItem {
  label: string
  /** 0~100 */
  score: number
  /** false 表示该维度暂无数据，tooltip 显示「—」 */
  hasData: boolean
}

const props = defineProps<{
  items: RadarAxisItem[]
}>()

const appStore = useAppStore()
const chartRef = ref<HTMLDivElement | null>(null)
let chart: ECharts | null = null

const allEmpty = computed(() => props.items.every((item) => !item.hasData))

/**
 * 读取 main.css 里的 M3 颜色变量，避免在图表里写死 hex。
 * 变量格式为 "R G B"，转换为 rgba() 供 ECharts 使用。
 */
function tokenRgb(name: string, fallback: string): string {
  const raw = getComputedStyle(document.documentElement).getPropertyValue(name).trim()
  return raw || fallback
}

function rgba(rgb: string, alpha: number): string {
  return `rgba(${rgb.split(/\s+/).join(',')},${alpha})`
}

const render = (): void => {
  if (!chart) return

  const primary = tokenRgb('--color-primary', '103 85 140')
  const onSurface = tokenRgb('--color-on-surface', '25 28 30')
  const onSurfaceVariant = tokenRgb('--color-on-surface-variant', '73 69 79')
  const outlineVariant = tokenRgb('--color-outline-variant', '203 196 208')
  const surfaceLowest = tokenRgb('--color-surface-container-lowest', '255 255 255')

  chart.setOption(
    {
      tooltip: {
        trigger: 'item',
        backgroundColor: rgba(surfaceLowest, 0.96),
        borderColor: rgba(outlineVariant, 0.8),
        borderWidth: 1,
        padding: [8, 12],
        textStyle: { color: rgba(onSurface, 1), fontSize: 12, fontFamily: 'Inter' },
        formatter: (params: unknown) => {
          const payload = params as { value?: number[] }
          const values = Array.isArray(payload.value) ? payload.value : []
          return props.items
            .map((item, index) => {
              const text = item.hasData ? String(values[index] ?? 0) : '—'
              return `${item.label}：${text}`
            })
            .join('<br/>')
        },
      },
      radar: {
        center: ['50%', '52%'],
        radius: '58%',
        splitNumber: 4,
        indicator: props.items.map((item) => ({ name: item.label, max: 100 })),
        axisName: {
          color: rgba(onSurfaceVariant, 1),
          fontSize: 11,
          fontFamily: 'Inter',
        },
        axisLine: { lineStyle: { color: rgba(outlineVariant, 0.6) } },
        splitLine: { lineStyle: { color: rgba(outlineVariant, 0.5) } },
        // 只留线条，不铺底色，保持克制
        splitArea: { show: false },
      },
      series: [
        {
          type: 'radar',
          symbol: 'circle',
          symbolSize: 5,
          lineStyle: { width: 2, color: rgba(primary, 1) },
          itemStyle: { color: rgba(primary, 1) },
          areaStyle: { color: rgba(primary, 0.16) },
          emphasis: {
            lineStyle: { width: 2 },
            areaStyle: { color: rgba(primary, 0.24) },
          },
          data: [
            {
              value: props.items.map((item) => (item.hasData ? item.score : 0)),
            },
          ],
        },
      ],
    },
    true,
  )
}

const handleResize = (): void => {
  chart?.resize()
}

onMounted(() => {
  if (!chartRef.value) return
  chart = echarts.init(chartRef.value, undefined, { renderer: 'canvas' })
  render()
  window.addEventListener('resize', handleResize)
})

onBeforeUnmount(() => {
  window.removeEventListener('resize', handleResize)
  chart?.dispose()
  chart = null
})

watch(() => props.items, () => render(), { deep: true })

// 主题切换后 CSS 变量已更新，下一帧重绘取新色值
watch(() => appStore.isDark, () => nextTick(() => render()))
</script>
