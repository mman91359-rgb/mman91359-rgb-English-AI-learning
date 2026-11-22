<template>
  <button
    v-if="isLoggedIn"
    type="button"
    :class="stripClass"
    :aria-label="ariaLabel"
    @click="goSettings"
  >
    <template v-if="configured">
      <span class="rounded-full bg-primary/10 px-2.5 py-0.5 font-label-sm text-label-sm text-primary">
        {{ cetLevelLabel }}
      </span>
      <span class="font-label-md text-label-md text-on-surface-variant">
        <span class="font-headline-md text-headline-md text-primary tabular-nums">{{ daysLeft }}</span>
        {{ $t('examGoal.daysLeft') }}
      </span>
      <span class="hidden sm:inline font-label-md text-label-md text-on-surface-variant">
        <span class="mx-1.5 text-outline-variant">·</span>
        {{ $t('examGoal.target') }}
        <span class="font-headline-md text-headline-md text-on-surface tabular-nums">{{ userStore.targetScore }}</span>
      </span>
    </template>
    <template v-else>
      <AppIcon name="flag" size="md" tone="primary" />
      <span class="font-label-md text-label-md text-on-surface-variant">{{ $t('examGoal.setGoal') }}</span>
    </template>
  </button>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { useRouter } from 'vue-router'
import { useI18n } from 'vue-i18n'
import { useUserStore } from '@/stores/user'
import AppIcon from '@/components/ui/AppIcon.vue'

/**
 * ExamGoalStrip —— 顶栏备考目标展示条。
 *
 * 三条信息：考试等级 / 距考试天数 / 目标分（窄屏隐藏目标分）。
 * 未登录不渲染；已登录但未设置时显示「设置目标」引导，点击跳设置页。
 *
 * 倒计时按 Asia/Shanghai 当日零点计算：examDate 是 yyyy-MM-dd 纯日期串，
 * 用 UTC 解析后与「今天零点」相减，避免浏览器本地时区导致跨日漂移。
 * 过期（考试日期已过）显示 0 天并提示重新设置，由 aria-label 传达给读屏。
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

const ariaLabel = computed(() => {
  if (!configured.value) return t('examGoal.setGoal')
  const suffix = daysLeft.value === 0 ? ` · ${t('examGoal.expired')}` : ''
  return `${cetLevelLabel.value} · ${daysLeft.value}${t('examGoal.daysLeft')} · ${t('examGoal.target')}${userStore.targetScore}${suffix}`
})

const stripClass =
  'inline-flex shrink-0 items-center gap-2 rounded-full bg-surface-container-low px-3 py-1.5 transition-colors hover:bg-surface-container-high focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-primary'

const goSettings = () => router.push('/settings')
</script>
