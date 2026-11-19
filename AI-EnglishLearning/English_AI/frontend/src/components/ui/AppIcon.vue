<template>
  <span
    class="material-symbols-outlined"
    :class="[sizeClass, toneClass, { fill: filled }]"
    :aria-hidden="ariaLabel ? undefined : 'true'"
    :role="ariaLabel ? 'img' : undefined"
    :aria-label="ariaLabel || undefined"
  >{{ name }}</span>
</template>

<script setup lang="ts">
import { computed } from 'vue'

/**
 * AppIcon —— Material Symbols Outlined 的唯一渲染入口。
 *
 * ## 为什么必须用 text-icon-* 而不是 text-lg / text-xl
 * `src/assets/main.css` 里有一条兜底规则：
 *   :where(.material-symbols-outlined):not([class*="text-icon-"]){font-size:24px}
 * 它只放过 class 里带 `text-icon-` 前缀的元素。写 `text-lg` / `text-xl` / `text-2xl`
 * 的图标**不含该前缀**，会被兜底规则命中，实际渲染恒为 24px —— 写了等于没写。
 * 审计记录的 60 处「图标尺寸无效」全部是这个原因。
 *
 * ## 禁止用法
 * - 禁止传 size="inherit"：StreakDisplay / AppLogo 靠 scoped 的 .flame-glyph /
 *   .logo-glyph（特异性 0,2,0）继承外层字号，加 inherit 档会与之争抢特异性。
 * - 禁止在外部叠 text-[14px] / text-base 等类覆盖尺寸，冲突时以兜底规则为准，结果不可预期。
 * - 禁止用内联 style 写 font-size 或 font-variation-settings；填充只走 filled 布尔。
 */
const props = withDefaults(defineProps<{
  /** Material Symbols 连字名，如 check / arrow_back / search */
  name: string
  /** 尺寸档，映射到 text-icon-*：sm=18 / md=20 / lg=24 / xl=32 / 2xl=36 / 3xl=48 */
  size?: 'sm' | 'md' | 'lg' | 'xl' | '2xl' | '3xl'
  /** 是否使用实心字形（输出 .fill 类） */
  filled?: boolean
  /** 颜色语义；current 表示不设色、继承父级；variant 等价 text-on-surface-variant（历史命名，不更名）；
   *  onPrimary / onTertiary 用于对应实底上的前景图标（与 onSurface 同一族） */
  tone?: 'current' | 'primary' | 'secondary' | 'tertiary' | 'error' | 'warning' | 'variant'
    | 'outline' | 'outlineVariant' | 'onSurface' | 'onPrimary' | 'onTertiary'
  /** 有值时取消 aria-hidden 并加 role="img"，供读屏识别 */
  ariaLabel?: string
}>(), {
  size: 'md',
  filled: false,
  tone: 'current',
  ariaLabel: '',
})

/** 尺寸类名表：键必须是带 text-icon- 前缀的令牌，见文件头说明 */
const SIZE_CLASS = {
  sm: 'text-icon-sm',
  md: 'text-icon-md',
  lg: 'text-icon-lg',
  xl: 'text-icon-xl',
  '2xl': 'text-icon-2xl',
  '3xl': 'text-icon-3xl',
} as const

const sizeClass = computed(() => SIZE_CLASS[props.size])

const TONE_CLASS: Record<NonNullable<typeof props.tone>, string> = {
  current: '',
  primary: 'text-primary',
  secondary: 'text-secondary',
  tertiary: 'text-tertiary',
  error: 'text-error',
  warning: 'text-warning',
  variant: 'text-on-surface-variant',
  outline: 'text-outline',
  outlineVariant: 'text-outline-variant',
  onSurface: 'text-on-surface',
  onPrimary: 'text-on-primary',
  onTertiary: 'text-on-tertiary',
}

const toneClass = computed(() => TONE_CLASS[props.tone])
</script>
