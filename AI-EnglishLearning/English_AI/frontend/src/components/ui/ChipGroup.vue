<template>
  <div
    role="group"
    :aria-label="ariaLabel || undefined"
    :class="containerClass"
  >
    <Chip
      v-for="option in options"
      :key="String(option.value)"
      :label="option.label"
      :count="option.count"
      :size="size"
      :selected="isSelected(option.value)"
      :disabled="option.disabled"
      @click="pick(option.value)"
    />
  </div>
</template>

<script lang="ts">
/** 单个筛选项；`count` 会渲染成文案后的 `(n)` */
export interface ChipOption {
  value: string | number
  label: string
  count?: number | string
  disabled?: boolean
}

/** 受控值：单选为标量，多选为数组 */
export type ChipValue = string | number
</script>

<script setup lang="ts">
import { computed } from 'vue'
import Chip from './Chip.vue'

/**
 * ChipGroup —— 一组筛选胶囊（单选 / 多选，受控 `v-model`）。
 *
 * 迁移自两处手写实现：
 * - `VocabularyView`：3 项单选、带 `(count)`、`px-4 py-2` + `label-md`、容器横向滚动
 * - `HistoryView`：3 组单选、`px-4 py-1.5` + `label-sm`、`flex-wrap`、每组前置字段标签
 *
 * 本组件只负责「一组胶囊的容器 + 选中逻辑 + 无障碍角色」，**不负责**字段标签
 * （如 History 的「模块类型 / 结果 / 时间」`w-16` 标签），标签留在组外由页面排版。
 *
 * ## 无障碍
 * 容器统一 `role="group"`（单选、多选都是 group），子项是**原生 button** 加 `aria-pressed`。
 * 不用 `radiogroup`/`radio`：那会让读屏期待「方向键切换 + 组内单一 tab stop」，
 * 而实现里两者都没有，键盘用户反而更难用；也不用 `checkbox`，因为这里是筛选而非表单勾选。
 * 容器名称请务必传 `ariaLabel`，否则读屏读到的是几个没有名字的分组。
 *
 * ## 禁止用法
 * - 禁止用它承载静态标签：不可点的分类请用 `Tag`，结果状态请用 `StatusBadge`。
 * - 禁止在单选模式下传数组：`multiple=false` 时 `modelValue` 必须是标量，
 *   传数组会被当作「无选中」，不会报错但界面无选中态。
 * - 禁止在组内混装不同 `size`：同一组只允许一档密度。
 * - 禁止用 `class` 覆盖容器布局（`flex-wrap` 请用 `wrap` prop 控制）；
 *   `wrap=false` 时容器是横向滚动，页面需自行保证父级有可用宽度。
 * - 禁止把 `count` 当作业务数据的唯一出口：它只用于展示，筛选逻辑仍由页面 computed 决定。
 */
const props = withDefaults(defineProps<{
  /** 当前选中值；单选传标量，多选传数组 */
  modelValue: ChipValue | ChipValue[]
  /** 选项列表 */
  options: ChipOption[]
  /** 是否多选；默认单选 */
  multiple?: boolean
  /** 密度档，见 Chip */
  size?: 'sm' | 'md'
  /** 是否换行；false 时横向滚动（用于窄屏一行放不下且不希望折行的场景） */
  wrap?: boolean
  /**
   * 组的无障碍名称，如「模块类型」「时间范围」。
   * 不给的话读屏会把三个组连续读成三个没有名字的分组，用户无法分辨在筛什么。
   * 页面上的可见字段标签（History 的 `w-16` 那列）不能替代它：那是视觉标签，不进无障碍树。
   */
  ariaLabel?: string
}>(), {
  multiple: false,
  size: 'md',
  wrap: true,
  ariaLabel: '',
})

const emit = defineEmits<{
  'update:modelValue': [value: ChipValue | ChipValue[]]
}>()

/** 容器只负责排列；换行与横滚是两种互斥布局，用 wrap 切换 */
const containerClass = computed(() => [
  'flex items-center gap-2',
  props.wrap ? 'flex-wrap' : 'overflow-x-auto pb-1',
])

const selectedList = computed<ChipValue[]>(() => {
  const v = props.modelValue
  if (Array.isArray(v)) return v
  return v === null || v === undefined ? [] : [v]
})

const isSelected = (value: ChipValue) => selectedList.value.includes(value)

/**
 * 单选：直接替换为新值（不允许取消选中，否则筛选会失去「当前条件」的落点）。
 * 多选：命中则移除，未命中则追加，保持点击顺序。
 */
const pick = (value: ChipValue) => {
  if (!props.multiple) {
    emit('update:modelValue', value)
    return
  }
  const current = selectedList.value
  const next = current.includes(value)
    ? current.filter(v => v !== value)
    : [...current, value]
  emit('update:modelValue', next)
}
</script>
