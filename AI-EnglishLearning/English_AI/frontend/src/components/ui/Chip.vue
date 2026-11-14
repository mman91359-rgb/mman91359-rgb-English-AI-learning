<template>
  <button
    type="button"
    :aria-pressed="selected"
    :disabled="disabled"
    class="inline-flex shrink-0 items-center whitespace-nowrap rounded-full transition-colors focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-primary disabled:pointer-events-none disabled:opacity-50"
    :class="[sizeClass, selected ? SELECTED_CLASS : UNSELECTED_CLASS]"
    @click="emit('click')"
  >
    <slot>{{ label }}</slot>
    <span v-if="hasCount" class="ml-1 opacity-70">({{ count }})</span>
  </button>
</template>

<script setup lang="ts">
import { computed } from 'vue'

/**
 * Chip —— 可点击的筛选胶囊。**只能由 `ChipGroup` 驱动**，不单独使用。
 *
 * ## 与 Tag / StatusBadge / 按钮的三条界线（硬红线）
 * | 组件 | 可点击 | 语义 | 选中态 |
 * |---|---|---|---|
 * | `Chip` | ✅ 是 | 筛选条件 | 有（`aria-pressed`） |
 * | `Tag` | ❌ 否 | 静态分类 | 无 |
 * | `StatusBadge` | ❌ 否 | 结果状态 | 无 |
 * | `btnPrimary` 等 | ✅ 是 | 执行动作 | 无（只有 hover/active） |
 *
 * 即：**不许把 Tag 当 Chip 用**（静态标签不可点），**也不许把 Chip 当按钮用**
 * （筛选条件有选中态，动作按钮没有）。需要提交/追加/删除请用 `buttonStyles` 常量。
 *
 * ## 禁止用法
 * - 禁止传 `class` 改圆角：筛选胶囊恒为 `rounded-full`，形状是识别「可点筛选」的视觉线索。
 * - 禁止自绘选中态颜色；选中/未选中两档在本文件内固定。
 * - 禁止在 Chip 内放图标按钮或二次交互元素：整颗胶囊就是一个点击目标。
 * - 禁止用它承载表单提交（`type="submit"`），它只发 `click`。
 */
const props = withDefaults(defineProps<{
  /** 文案；也可用默认 slot 传入（slot 优先） */
  label?: string
  /** 计数后缀，渲染为 `(n)`；不传则不显示 */
  count?: number | string
  /** 密度档：sm=py-1.5+label-sm，md=py-2+label-md */
  size?: 'sm' | 'md'
  /** 是否选中，由 ChipGroup 传入 */
  selected?: boolean
  /** 是否禁用 */
  disabled?: boolean
  /**
   * @deprecated 已废弃，无效果。
   * 早期版本把原生 button 覆写成 `role="radio"` / `role="checkbox"`，但读屏会按 radio 的
   * 规范期待「方向键切换 + 组内单一 tab stop」，实现里两者都没有，键盘用户反而更难用。
   * 现在改回原生 button + `aria-pressed`，语义诚实、键盘行为就是原生 button。
   * 该 prop 仅保留以兼容旧调用，ChipGroup 已不再传入，新代码不要使用。
   */
  role?: 'radio' | 'checkbox'
}>(), {
  label: '',
  count: undefined,
  size: 'md',
  selected: false,
  disabled: false,
  role: undefined,
})

const emit = defineEmits<{
  click: []
}>()

/** 字号与内边距两档，与迁移前的 Vocabulary（md）/ History（sm）实测值一致 */
const SIZE_CLASS = {
  sm: 'px-4 py-1.5 font-label-sm text-label-sm',
  md: 'px-4 py-2 font-label-md text-label-md',
} as const

const SELECTED_CLASS = 'bg-primary text-on-primary'
const UNSELECTED_CLASS = 'bg-surface-container-lowest text-on-surface-variant hover:bg-surface-container hover:text-on-surface'

const sizeClass = computed(() => SIZE_CLASS[props.size])

/** count 传 0 时仍应显示「(0)」，只有 undefined/null 才算没传 */
const hasCount = computed(() => props.count !== undefined && props.count !== null && props.count !== '')
</script>
