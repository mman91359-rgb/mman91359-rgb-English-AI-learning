<template>
  <button
    v-if="isLoggedIn"
    type="button"
    :class="tier.strip"
    :aria-label="ariaLabel"
    @click="goSettings"
  >
    <template v-if="configured">
      <template v-if="expired">
        <AppIcon name="event_repeat" size="md" tone="current" />
        <span class="font-label-md text-label-md" :class="tier.text">{{ $t('examGoal.expired') }}</span>
        <span class="hidden sm:inline font-label-md text-label-md" :class="tier.link">{{ $t('examGoal.updateNext') }}</span>
      </template>
      <template v-else>
        <span class="rounded-full px-2.5 py-0.5 font-label-sm text-label-sm" :class="tier.chip">
          {{ cetLevelLabel }}
        </span>
        <span class="font-label-md text-label-md" :class="tier.muted">
          <span class="font-headline-md text-headline-md tabular-nums" :class="tier.text">{{ daysLeft }}</span>
          {{ $t('examGoal.daysLeft') }}
        </span>
        <span class="hidden sm:inline-block h-4 w-px" :class="tier.divider" aria-hidden="true"></span>
        <span class="hidden sm:inline font-label-md text-label-md" :class="tier.muted">
          {{ $t('examGoal.target') }}<span class="font-headline-md text-headline-md tabular-nums" :class="tier.text">{{ userStore.targetScore }}</span>{{ $t('examGoal.scoreUnit') }}
        </span>
      </template>
    </template>
    <template v-else>
      <AppIcon name="flag" size="md" tone="current" />
      <span class="font-label-md text-label-md" :class="tier.text">{{ $t('examGoal.setGoal') }}</span>
    </template>
  </button>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { useRouter } from 'vue-router'
import { useI18n } from 'vue-i18n'
import { useUserStore } from '@/stores/user'
import AppIcon from '@/components/ui/AppIcon.vue'
import { toDateString } from '@/config/examCalendar'

/**
 * ExamGoalStrip —— 顶栏备考目标展示条。
 *
 * 三条信息：考试等级 / 距考试天数 / 目标分（窄屏隐藏目标分）。
 * 未登录不渲染；已登录但未设置时显示「设置目标」引导，点击跳设置页。
 *
 * 倒计时按 Asia/Shanghai 当日零点计算：examDate 是 yyyy-MM-dd 纯日期串，
 * 用 UTC 解析后与「今天零点」相减，避免浏览器本地时区导致跨日漂移。
 * 过期（考试日期严格早于今天）显示「考试已过 · 更新到下一场」引导，点击跳设置页
 * ——设置弹窗会用官方日历表预填下一场日期；官方尚未公布时由用户手动确认。
 */
const { t } = useI18n()
const router = useRouter()
const userStore = useUserStore()

const isLoggedIn = computed(() => userStore.isLoggedIn)
const configured = computed(() => userStore.examGoalConfigured)

const cetLevelLabel = computed(() =>
  (userStore.user?.cetLevel || 'CET4') === 'CET6' ? 'CET-6' : 'CET-4',
)

/** 距考试天数：UTC 口径的「今天零点」与考试日零点之差；过期记 0 */
const daysLeft = computed(() => {
  const dateStr = userStore.examDate
  if (!dateStr) return 0
  const exam = Date.parse(`${dateStr}T00:00:00Z`)
  if (Number.isNaN(exam)) return 0
  const now = new Date()
  const todayUtc = Date.UTC(now.getFullYear(), now.getMonth(), now.getDate())
  return Math.max(0, Math.round((exam - todayUtc) / 86400000))
})

/** 严格过期：考试日期早于今天（考试当天 daysLeft=0 但仍算有效） */
const expired = computed(() => {
  const dateStr = userStore.examDate
  return !!dateStr && dateStr < toDateString(new Date())
})

const ariaLabel = computed(() => {
  if (!configured.value) return t('examGoal.setGoal')
  if (expired.value) return `${t('examGoal.expired')} · ${t('examGoal.updateNext')}`
  return `${cetLevelLabel.value} · ${daysLeft.value}${t('examGoal.daysLeft')} · ${t('examGoal.target')}${userStore.targetScore}`
})

/**
 * 按剩余天数分三档配色（样式同构、只换语义色）：
 *   >30 天  充裕 · 蓝   info-container
 *   8–30 天 适中 · 琥珀 warning-container（当前默认）
 *   ≤7 天   紧迫 · 红   error-container
 * 过期态与「未设置」引导态保持琥珀（失效/中性 ≠ 紧迫），走独立分支。
 *
 * 类名纪律：三档 class 全部写完整字面量、在表中穷举，禁止 `${tone}` 动态拼接
 * —— Tailwind 扫不到拼接出的类。图标 tone 统一 current：继承各档文字色，
 * AppIcon 的 12 档 tone 没有 onInfoContainer/onWarningContainer/onErrorContainer。
 */
type TierClasses = {
  strip: string
  chip: string
  text: string
  muted: string
  divider: string
  link: string
}

const TIER: Record<'calm' | 'moderate' | 'urgent', TierClasses> = {
  calm: {
    strip: 'inline-flex shrink-0 items-center gap-2 rounded-full px-3.5 py-1.5 bg-info-container transition hover:brightness-95 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-on-info-container',
    chip: 'bg-info/15 text-on-info-container',
    text: 'text-on-info-container',
    muted: 'text-on-info-container/90',
    divider: 'bg-on-info-container/30',
    link: 'underline decoration-on-info-container/50',
  },
  moderate: {
    strip: 'inline-flex shrink-0 items-center gap-2 rounded-full px-3.5 py-1.5 bg-warning-container transition hover:brightness-95 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-on-warning-container',
    chip: 'bg-warning/15 text-on-warning-container',
    text: 'text-on-warning-container',
    muted: 'text-on-warning-container/90',
    divider: 'bg-on-warning-container/30',
    link: 'underline decoration-on-warning-container/50',
  },
  urgent: {
    strip: 'inline-flex shrink-0 items-center gap-2 rounded-full px-3.5 py-1.5 bg-error-container transition hover:brightness-95 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-on-error-container',
    chip: 'bg-error/15 text-on-error-container',
    text: 'text-on-error-container',
    muted: 'text-on-error-container/90',
    divider: 'bg-on-error-container/30',
    link: 'underline decoration-on-error-container/50',
  },
}

/** 选档：未设置/过期 → 琥珀；否则按天数 7/30 分界 */
const tier = computed<TierClasses>(() => {
  if (!configured.value || expired.value) return TIER.moderate
  if (daysLeft.value <= 7) return TIER.urgent
  if (daysLeft.value <= 30) return TIER.moderate
  return TIER.calm
})

const goSettings = () => router.push('/settings')
</script>
