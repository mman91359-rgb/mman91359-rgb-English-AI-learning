/**
 * 签到火焰档位表。
 *
 * 输入「连续天数 + 今日是否已签到」，输出一整套火焰视觉参数
 * （尺寸 / 渐变 / 火芯 / 高光 / 光晕强度 / 燃烧周期 / 火星）。
 *
 * 与 `buttonStyles.ts`、`formStyles.ts` 同一约定：类名集中在此，组件只查表。
 * 调火焰观感改这里即可，不必进模板找 class。
 *
 * 火焰形状统一用 Material Symbols 的 `local_fire_department`：
 * - 渐变靠 `bg-clip-text` 按字形裁切实现（图标字体本质是文字）
 * - 火芯是同一图标缩小后叠在火身中部，形成「橙火包黄芯」的双层火
 * - 焰心高光再叠一层更小的亮色，只在 34px 以上开启（更小尺寸会糊成一团）
 */

export type StreakTierKey = 'spark' | 'steady' | 'blaze' | 'inferno'

export interface StreakTier {
  key: StreakTierKey
  /** 起始天数（含） */
  min: number
  /**
   * 火焰字号令牌。用火焰专用档位（`flame-*`）而非 `icon-*`：
   * icon 档位是给 UI 图标按 18/20/24/32 跳跃设计的，火焰需要更细的渐进，
   * 否则第 3~6 天只能停在 24px，和旁边的 24px 数字完全等重、显不出主体。
   */
  sizeClass: string
  /** 火身：底部亮橙 → 顶部橙红的字形裁切渐变 */
  bodyClass: string
  /** 火芯（内焰）颜色 */
  coreClass: string
  /** 焰心高光，低档位为 null */
  highlightClass: string | null
  /** 光晕基准缩放，高档位扩散更大 */
  auraScale: number
  /** 主火苗周期，`0s` 表示静止 */
  duration: string
  /** 常驻上升火星数量 */
  embers: number
}

const GRADIENT_BASE = 'bg-clip-text text-transparent'

export const STREAK_TIERS: StreakTier[] = [
  {
    key: 'spark',
    min: 1,
    sizeClass: 'text-flame-sm',
    bodyClass: `bg-gradient-to-t from-flame-mid/60 to-flame-mid ${GRADIENT_BASE}`,
    coreClass: 'text-flame-core/85',
    highlightClass: null,
    auraScale: 0.82,
    duration: '3.4s',
    embers: 0,
  },
  {
    key: 'steady',
    min: 3,
    sizeClass: 'text-flame-md',
    bodyClass: `bg-gradient-to-t from-flame-mid to-flame-deep/90 ${GRADIENT_BASE}`,
    coreClass: 'text-flame-core/90',
    highlightClass: null,
    auraScale: 1,
    duration: '2.8s',
    embers: 0,
  },
  {
    key: 'blaze',
    min: 7,
    sizeClass: 'text-flame-lg',
    bodyClass: `bg-gradient-to-t from-flame-mid to-flame-deep ${GRADIENT_BASE}`,
    coreClass: 'text-flame-core',
    highlightClass: 'text-flame-core',
    auraScale: 1.12,
    duration: '2.2s',
    embers: 2,
  },
  {
    key: 'inferno',
    min: 14,
    sizeClass: 'text-flame-xl',
    bodyClass: `bg-gradient-to-t from-flame-mid to-flame-deep brightness-110 ${GRADIENT_BASE}`,
    coreClass: 'text-flame-core',
    highlightClass: 'text-flame-core',
    auraScale: 1.25,
    duration: '1.8s',
    embers: 3,
  },
]

/** 组件实际消费的视觉描述，把「点亮 / 熄灭」也收进同一份表里 */
export interface StreakVisual {
  key: StreakTierKey | 'cold' | 'extinguished'
  lit: boolean
  sizeClass: string
  bodyClass: string
  coreClass: string | null
  highlightClass: string | null
  auraScale: number
  /** `0s` 表示完全静止 */
  duration: string
  embers: number
  /** 熄灭态的收缩比例：灰烬比燃烧时小一圈，复燃时才「窜」得起来 */
  quietScale: number
}

/** 取天数对应的燃烧档位，超出最高档则封顶 */
export function resolveStreakTier(days: number): StreakTier {
  const safeDays = Number.isFinite(days) && days > 0 ? Math.floor(days) : 0
  let matched = STREAK_TIERS[0]
  for (const tier of STREAK_TIERS) {
    if (safeDays >= tier.min) matched = tier
  }
  return matched
}

/**
 * 把「天数 + 今日是否已签到」解析成一套完整视觉。
 *
 * 未签到时一律回到熄灭态：火身转中性灰、火芯只留一点烧过的暗红、不摆动、
 * 不发光、缩小到 `quietScale`。已签到时按天数取档位。
 *
 * 灰用的是 `outline` 而不是更浅的 `outline-variant`——后者在亮色底上对比度
 * 只有 1.4:1，灰火会直接「消失」，看不出这里有块内容。
 */
export function resolveStreakVisual(days: number, lit: boolean): StreakVisual {
  const safeDays = Number.isFinite(days) && days > 0 ? Math.floor(days) : 0

  if (!lit) {
    // 从未签过到 vs 曾经烧过但今天还没续上，两者都灰，后者留一点余烬色
    const everLit = safeDays > 0
    return {
      key: everLit ? 'extinguished' : 'cold',
      lit: false,
      sizeClass: everLit ? resolveStreakTier(safeDays).sizeClass : 'text-flame-xs',
      bodyClass: everLit ? 'text-outline/75' : 'text-outline/50',
      coreClass: everLit ? 'text-flame-deep/12' : null,
      highlightClass: null,
      auraScale: 0,
      duration: '0s',
      embers: 0,
      quietScale: everLit ? 0.86 : 0.8,
    }
  }

  const tier = resolveStreakTier(safeDays)
  return {
    key: tier.key,
    lit: true,
    sizeClass: tier.sizeClass,
    bodyClass: tier.bodyClass,
    coreClass: tier.coreClass,
    highlightClass: tier.highlightClass,
    auraScale: tier.auraScale,
    duration: tier.duration,
    embers: tier.embers,
    quietScale: 1,
  }
}
