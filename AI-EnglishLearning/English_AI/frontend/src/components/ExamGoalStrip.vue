<template>
  <button
    v-if="isLoggedIn"
    type="button"
    :class="stripClass"
    :aria-label="ariaLabel"
    @click="goSettings"
  >
    <template v-if="configured">
      <template v-if="expired">
        <AppIcon name="event_repeat" size="md" tone="current" />
        <span class="font-label-md text-label-md text-on-warning-container">{{ $t('examGoal.expired') }}</span>
        <span class="hidden sm:inline font-label-md text-label-md text-on-warning-container underline decoration-on-warning-container/50">{{ $t('examGoal.updateNext') }}</span>
      </template>
      <template v-else>
        <span class="rounded-full bg-warning/15 px-2.5 py-0.5 font-label-sm text-label-sm text-on-warning-container">
          {{ cetLevelLabel }}
        </span>
        <span class="font-label-md text-label-md text-on-warning-container/90">
          <span class="font-headline-md text-headline-md text-on-warning-container tabular-nums">{{ daysLeft }}</span>
          {{ $t('examGoal.daysLeft') }}
        </span>
        <span class="hidden sm:inline-block h-4 w-px bg-on-warning-container/30" aria-hidden="true"></span>
        <span class="hidden sm:inline font-label-md text-label-md text-on-warning-container/90">
          {{ $t('examGoal.target') }}<span class="font-headline-md text-headline-md text-on-warning-container tabular-nums">{{ userStore.targetScore }}</span>{{ $t('examGoal.scoreUnit') }}
        </span>
      </template>
    </template>
    <template v-else>
      <AppIcon name="flag" size="md" tone="current" />
      <span class="font-label-md text-label-md text-on-warning-container">{{ $t('examGoal.setGoal') }}</span>
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

// 款式 D：琥珀浅底胶囊（warning-container + on-warning-container），暖色更抓眼。
// 焦点环走 on-warning-container：与文字同语义色，在浅琥珀底上清晰可见；
// 图标 tone 用 current 继承父级深棕（AppIcon 的 12 档 tone 无 onWarningContainer）。
const stripClass =
  'inline-flex shrink-0 items-center gap-2 rounded-full bg-warning-container px-3.5 py-1.5 transition hover:brightness-95 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-on-warning-container'

const goSettings = () => router.push('/settings')
</script>
