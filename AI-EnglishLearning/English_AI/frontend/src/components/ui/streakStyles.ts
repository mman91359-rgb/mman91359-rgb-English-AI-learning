/**
 * 签到火焰档位表。
 *
 * 天数 → 一档视觉效果（尺寸 / 渐变 / 光晕 / 燃烧周期 / 火星）。
 * 与 `buttonStyles.ts`、`formStyles.ts` 同一约定：类名集中在此，组件只查表，
 * 调火焰观感改这里即可，不必进模板找 class。
 *
 * 火焰形状统一用 Material Symbols 的 `local_fire_department`，
 * 渐变靠 `bg-clip-text` 按字形裁切实现（图标字体本质是文字），
 * 火芯是同一图标缩小后叠在火身底部，形成双层火。
 */

export interface StreakTier {
  key: 'cold' | 'spark' | 'steady' | 'blaze' | 'inferno'
  /** 起始天数（含） */
  min: number
  /** 火焰字号令牌 */
  sizeClass: string
  /** 火身：纯色或「底部橙 → 顶部橙红」渐变 */
  bodyClass: string
  /** 火芯色，未点燃档位为 null（不渲染内层） */
  coreClass: string | null
  /** 光晕色，未点燃档位为 null */
  glowClass: string | null
  /** 主火苗周期，`0s` 表示完全静止 */
  duration: string
  /** 上升火星数量 */
  embers: number
}

const GRADIENT_BASE = 'bg-clip-text text-transparent'

export const STREAK_TIERS: StreakTier[] = [
  {
    key: 'cold',
    min: 0,
    sizeClass: 'text-icon-sm',
    bodyClass: 'text-outline-variant/60',
    coreClass: null,
    glowClass: null,
    duration: '0s',
    embers: 0,
  },
  {
    key: 'spark',
    min: 1,
    sizeClass: 'text-icon-md',
    bodyClass: `bg-gradient-to-t from-flame-mid/55 to-flame-mid ${GRADIENT_BASE}`,
    coreClass: null,
    glowClass: null,
    duration: '3.6s',
    embers: 0,
  },
  {
    key: 'steady',
    min: 3,
    sizeClass: 'text-icon-lg',
    bodyClass: `bg-gradient-to-t from-flame-mid to-flame-deep/90 ${GRADIENT_BASE}`,
    coreClass: 'text-flame-core/85',
    glowClass: 'bg-flame-mid/20',
    duration: '2.8s',
    embers: 0,
  },
  {
    key: 'blaze',
    min: 7,
    sizeClass: 'text-icon-xl',
    bodyClass: `bg-gradient-to-t from-flame-mid to-flame-deep ${GRADIENT_BASE}`,
    coreClass: 'text-flame-core',
    glowClass: 'bg-flame-mid/25',
    duration: '2.2s',
    embers: 2,
  },
  {
    key: 'inferno',
    min: 14,
    sizeClass: 'text-icon-2xl',
    bodyClass: `bg-gradient-to-t from-flame-mid to-flame-deep brightness-110 ${GRADIENT_BASE}`,
    coreClass: 'text-flame-core',
    glowClass: 'bg-flame-mid/30',
    duration: '1.8s',
    embers: 2,
  },
]

/** 取天数对应的档位，超出最高档则封顶 */
export function resolveStreakTier(days: number): StreakTier {
  const safeDays = Number.isFinite(days) && days > 0 ? Math.floor(days) : 0
  let matched = STREAK_TIERS[0]
  for (const tier of STREAK_TIERS) {
    if (safeDays >= tier.min) matched = tier
  }
  return matched
}
