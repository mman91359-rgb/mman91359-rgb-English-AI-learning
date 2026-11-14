<template>
  <AppLayout>
    <div class="flex flex-col md:flex-row justify-between items-start md:items-center gap-4">
      <div>
        <h2 class="font-display-lg text-display-lg text-on-surface mb-2">{{ greetingLine }}</h2>
        <p class="font-body-lg text-body-lg text-on-surface-variant">{{ $t('dashboard.readyForToday') }}</p>
      </div>
      <div class="flex flex-wrap items-center gap-3">
        <button
          class="group px-5 py-3 rounded-full font-label-lg text-label-lg flex items-center gap-2 border border-tertiary/20 bg-tertiary-container/20 text-tertiary transition-all duration-300 hover:-translate-y-0.5 hover:bg-tertiary-container/35 active:scale-95 disabled:opacity-60 disabled:cursor-not-allowed disabled:hover:translate-y-0"
          :disabled="userStore.todayCheckedIn || checkingIn"
          @click="handleCheckIn"
        >
          <AppIcon name="event_available" size="lg" class="transition-transform duration-300 group-hover:scale-110" />
          <Transition name="fade-slide" mode="out-in">
            <span :key="userStore.todayCheckedIn ? 'checked' : 'unchecked'">
              {{ userStore.todayCheckedIn
                ? $t('checkIn.checkedIn')
                : (userStore.previewSignInReward > 0
                  ? $t('checkIn.button', { reward: userStore.previewSignInReward })
                  : $t('checkIn.action')) }}
            </span>
          </Transition>
          <span
            v-if="!userStore.todayCheckedIn && userStore.checkInStreak > 0"
            class="font-label-md text-label-md px-2 py-0.5 rounded-full bg-tertiary/10"
          >{{ $t('checkIn.streak', { days: userStore.checkInStreak }) }}</span>
        </button>
        <button
          :class="btnPrimary"
          @click="startDailyLesson"
        >
          <AppIcon name="play_arrow" size="lg" />
          {{ $t('dashboard.startDailyLesson') }}
        </button>
      </div>
    </div>
    <CoinBurst :visible="rewardBurstVisible" :amount="rewardAmount" />
    <div class="grid grid-cols-1 md:grid-cols-12 gap-gutter">
      <!-- 每日词汇目标：新背 + 复习 -->
      <AppCard tone="surface" padding="regular" class="col-span-1 md:col-span-8 relative overflow-hidden">
        <div class="absolute -right-20 -top-20 w-64 h-64 bg-primary-container/10 rounded-full blur-3xl"></div>
        <div class="flex flex-col md:flex-row gap-8 items-center relative z-10">
          <div class="relative w-40 h-40 flex-shrink-0">
            <svg class="w-full h-full" viewBox="0 0 100 100">
              <circle class="text-surface-variant stroke-current" cx="50" cy="50" fill="transparent" r="40" stroke-width="8"></circle>
              <circle
                class="text-primary stroke-current progress-ring-circle"
                cx="50" cy="50" fill="transparent" r="40"
                :stroke-dasharray="251.2"
                :stroke-dashoffset="251.2 - (251.2 * newWordProgress.percent / 100)"
                stroke-linecap="round" stroke-width="8"
              ></circle>
            </svg>
            <div class="absolute inset-0 flex flex-col items-center justify-center">
              <span class="font-headline-lg text-headline-lg text-primary font-bold">{{ newWordProgress.percent }}%</span>
            </div>
          </div>
          <div class="flex-1 text-center md:text-left">
            <div class="flex items-center gap-2 justify-center md:justify-start mb-2">
              <AppIcon name="flag" size="lg" tone="primary" />
              <span class="font-label-lg text-label-lg text-primary uppercase tracking-wider">{{ $t('dashboard.dailyVocabularyGoal') }}</span>
            </div>
            <div class="flex items-center gap-2 justify-center md:justify-start mb-2">
              <h3 class="font-headline-lg text-headline-lg text-on-surface">{{ $t('dashboard.newWordsGoalTitle') }}</h3>
              <button
                :class="btnIconSm"
                :title="$t('dashboard.setGoal')"
                @click.stop="openVocabularyGoalDialog"
              >
                <AppIcon name="edit" size="md" class="text-outline" />
              </button>
            </div>
            <p class="font-body-md text-body-md text-on-surface-variant mb-5">
              {{ $t('dashboard.newWordsProgress', {
                completed: todayLearnedWords,
                total: dailyNewWordsTarget,
              }) }}
            </p>

            <div class="rounded-2xl bg-surface-container-low p-4">
              <div class="flex items-center justify-between font-label-md text-label-md text-on-surface-variant mb-2">
                <span class="flex items-center gap-1.5">
                  <AppIcon name="history_edu" size="lg" tone="tertiary" />
                  {{ $t('dashboard.reviewWordsGoalTitle') }}
                </span>
                <span>{{ todayReviewedWords }} / {{ dailyReviewWordsTarget }}</span>
              </div>
              <!-- 契约例外：渐变进度条保留手写。ProgressBar 只有单色档，
                   tertiary→primary 的渐变是本页唯一的「进行中」语义，改单色会丢信息。 -->
              <div class="h-2 w-full overflow-hidden rounded-full bg-surface-container-high">
                <div
                  class="h-full rounded-full bg-gradient-to-r from-tertiary to-primary transition-all duration-500 ease-out"
                  :style="{ width: reviewWordProgress.percent + '%' }"
                ></div>
              </div>
            </div>

            <div class="mt-3 flex flex-wrap gap-2 justify-center md:justify-start">
              <span class="bg-primary-container/15 text-primary px-3 py-1 rounded-xl font-label-md text-label-md">
                {{ $t('dashboard.learnedWords', { count: todayLearnedWords }) }}
              </span>
              <span class="bg-surface-variant/50 text-on-surface-variant px-3 py-1 rounded-xl font-label-md text-label-md">
                {{ $t('dashboard.reviewedWords', { count: todayReviewedWords }) }}
              </span>
            </div>
          </div>
        </div>
      </AppCard>
      <!-- 连续签到天数 -->
      <AppCard tone="surface" padding="regular" class="col-span-1 md:col-span-4 flex flex-col">
        <SectionHeader :title="$t('dashboard.streakDays')" :level="3">
          <template #actions>
            <AppIcon name="event_available" size="lg" filled tone="primary" />
          </template>
        </SectionHeader>
        <div class="flex items-end gap-2 mb-4">
          <span class="font-display-lg text-display-lg text-on-surface leading-none">{{ checkInStreak }}</span>
          <span class="font-body-lg text-body-lg text-on-surface-variant pb-1">{{ $t('stats.days') }}</span>
        </div>
        <div class="mt-auto flex items-center justify-between rounded-2xl bg-surface-container-low p-4">
          <span class="font-body-md text-body-md text-on-surface-variant">
            {{ userStore.todayCheckedIn ? $t('checkIn.checkedInTip') : $t('checkIn.notCheckedIn') }}
          </span>
          <AppIcon
            :name="userStore.todayCheckedIn ? 'check_circle' : 'radio_button_unchecked'"
            size="lg"
            :class="userStore.todayCheckedIn ? 'text-tertiary' : 'text-outline'"
          />
        </div>
      </AppCard>
      <!-- 学习量统计 -->
      <AppCard tone="surface" padding="regular" class="col-span-1 md:col-span-8">
        <div class="flex items-center justify-between mb-8">
          <div>
            <h3 class="font-headline-md text-headline-md text-on-surface mb-1">{{ $t('dashboard.studyVolume') }}</h3>
            <p class="font-body-md text-body-md text-on-surface-variant">
              {{ studySummaryText }}
            </p>
          </div>
          <div class="bg-surface-container-low rounded-full p-1 flex">
            <button
              :class="['px-4 py-1.5 rounded-full font-label-md text-label-md transition-all', studyPeriod === 'week' ? 'bg-surface-container-lowest dark:bg-surface-container-high shadow-soft-glow text-on-surface' : 'text-on-surface-variant hover:text-on-surface']"
              @click="studyPeriod = 'week'"
            >{{ $t('dashboard.week') }}</button>
            <button
              :class="['px-4 py-1.5 rounded-full font-label-md text-label-md transition-all', studyPeriod === 'month' ? 'bg-surface-container-lowest dark:bg-surface-container-high shadow-soft-glow text-on-surface' : 'text-on-surface-variant hover:text-on-surface']"
              @click="studyPeriod = 'month'"
            >{{ $t('dashboard.month') }}</button>
          </div>
        </div>
          <p class="font-body-sm text-body-sm text-on-surface-variant mb-4">{{ studySubtitle }}</p>
        <div class="h-48 flex items-end gap-1 border-b border-surface-variant pb-2">
          <div
            v-for="(bar, index) in studyBars"
            :key="index"
            class="bar-col flex-1 flex flex-col justify-end items-center gap-0.5 h-full relative"
          >
            <!-- 自定义悬浮提示 -->
            <div v-if="bar.hasData" class="bar-tooltip">
              <span class="font-label-md text-label-md">{{ bar.tooltip }}</span>
            </div>
            <template v-if="bar.hasData">
              <div
                class="w-3/4 max-w-12 bg-primary rounded-t-sm transition-all duration-500 cursor-pointer hover:bg-primary/80"
                :style="{ height: bar.vocab + '%' }"
              ></div>
            </template>
            <template v-else>
              <div class="w-3/4 max-w-12 bg-surface-variant/30 rounded-t-sm h-2"></div>
            </template>
          </div>
        </div>
        <div class="flex gap-1 mt-2">
          <span
            v-for="(label, index) in barLabels"
            :key="index"
            class="flex-1 text-center font-label-md text-label-md text-outline"
          >{{ label }}</span>
        </div>
      </AppCard>
      <!-- 继续学习 & 每日单词 -->
      <div class="col-span-1 md:col-span-4 flex flex-col gap-gutter">
        <div
          class="bg-surface rounded-3xl p-6 shadow-soft-glow border border-transparent hover:border-primary/20 transition-colors cursor-pointer group"
          @click="continueLearning"
        >
          <div class="w-12 h-12 rounded-full bg-secondary-container/20 text-secondary flex items-center justify-center mb-4 group-hover:scale-110 transition-transform">
            <AppIcon name="menu_book" size="lg" />
          </div>
          <h4 class="font-headline-md text-headline-md text-on-surface mb-1">{{ $t('dashboard.continueLearning') }}</h4>
          <p class="font-body-md text-body-md text-on-surface-variant">{{ continueInfo }}</p>
        </div>
        <div
          class="bg-surface rounded-3xl p-6 shadow-soft-glow relative overflow-hidden group cursor-pointer"
          @click="goToDailyWordDetail"
        >
          <div class="absolute right-0 top-0 w-32 h-32 bg-tertiary-container/10 rounded-bl-full z-0 transition-transform group-hover:scale-125"></div>
          <div class="relative z-10">
            <div class="flex items-center gap-2 mb-4">
              <AppIcon name="wb_sunny" size="lg" tone="tertiary" />
              <span class="font-label-md text-label-md text-on-surface-variant uppercase tracking-wider">{{ $t('dashboard.dailyWord') }}</span>
            </div>

            <template v-if="dailyWord">
              <div class="mb-1">
                <h4 class="font-display-lg text-display-lg text-on-surface leading-tight">{{ dailyWord.word }}</h4>
                <span class="font-body-sm text-body-sm text-outline">{{ dailyWord.phonetic }}</span>
              </div>

              <div class="flex items-center gap-2 mb-3">
                <span class="inline-block bg-tertiary-container/20 text-tertiary px-3 py-0.5 rounded-lg font-label-sm text-label-sm">{{ dailyWord.pos }}</span>
                <span class="font-body-md text-body-md text-on-surface">{{ dailyWord.translation }}</span>
              </div>

              <div class="bg-surface-container-low/50 rounded-xl p-3 mt-3">
                <p class="font-body-sm text-body-sm text-on-surface-variant italic leading-relaxed">"{{ dailyWord.example }}"</p>
                <p class="font-body-sm text-body-sm text-outline mt-1">{{ dailyWord.exampleTranslation }}</p>
              </div>

              <div class="flex items-center justify-between mt-3">
                <span class="font-label-sm text-label-sm text-outline">{{ dailyWord.level }}</span>
                <AppIcon name="arrow_forward" size="lg" class="text-outline group-hover:text-primary transition-colors" />
              </div>
            </template>

            <template v-else>
              <div class="py-4 flex flex-col items-center justify-center text-outline">
                <AppIcon name="hourglass" size="lg" class="mb-2 animate-pulse" />
                <span class="font-body-md text-body-md">{{ $t('common.loading') }}</span>
              </div>
            </template>
          </div>
        </div>
      </div>
    </div>

    <VocabularyGoalDialog
      :visible="showVocabularyGoalDialog"
      :new-words="userStore.dailyNewWords"
      :review-words="userStore.dailyReviewWords"
      :saving="goalSaving"
      :error="goalError"
      :min-new="userStore.minDailyNewWords"
      :max-new="userStore.maxDailyNewWords"
      :min-review="userStore.minDailyReviewWords"
      :max-review="userStore.maxDailyReviewWords"
      :submit-label="$t('vocabGoal.saveOnly')"
      @update:visible="showVocabularyGoalDialog = $event"
      @save="handleVocabularyGoalSave"
      @close="closeVocabularyGoalDialog"
    />
  </AppLayout>
</template>
<script setup lang="ts">
import { ref, computed, onUnmounted, watch } from 'vue'
import { useI18n } from 'vue-i18n'
import { useRoute } from 'vue-router'
import AppLayout from '../components/AppLayout.vue'
import CoinBurst from '@/components/CoinBurst.vue'
import VocabularyGoalDialog from '@/components/VocabularyGoalDialog.vue'
import AppCard from '@/components/ui/AppCard.vue'
import AppIcon from '@/components/ui/AppIcon.vue'
import SectionHeader from '@/components/ui/SectionHeader.vue'
import { btnIconSm, btnPrimary } from '@/components/ui/buttonStyles'
import { useToast } from '@/composables/useToast'
import { useUserStore } from '@/stores/user'
import { moduleName } from '@/config/modules'
import { getDailyWord, getExerciseStats } from '@/api/exercise'
import type { DailyWordVO } from '@/api/exercise'
import { getReviewTasks } from '@/api/learning'
import type { ReviewTaskVO } from '@/api/learning'
const { t, locale } = useI18n()
const { show: toast } = useToast()
const userStore = useUserStore()
const route = useRoute()
// 昵称兜底走 i18n，英文模式下不能冒出中文占位
const nickname = computed(() => userStore.user?.nickname || userStore.user?.username || t('dashboard.guestName'))
// 时间问候语
const greetingText = computed(() => {
  const hour = new Date().getHours()
  if (hour < 12) return t('dashboard.greeting.morning')
  if (hour < 18) return t('dashboard.greeting.afternoon')
  return t('dashboard.greeting.evening')
})
// 完整问候句：中英文标点不同，整句交给 locale 决定
const greetingLine = computed(() =>
  t('dashboard.greetingWithName', { greeting: greetingText.value, name: nickname.value })
)
// ========== 每日签到 ==========
const checkingIn = ref(false)
const rewardBurstVisible = ref(false)
const rewardAmount = ref(0)
let burstTimer: number | null = null

const handleCheckIn = async () => {
  if (userStore.todayCheckedIn) {
    toast(t('checkIn.already'), 'info')
    return
  }
  if (checkingIn.value) return
  checkingIn.value = true
  try {
    const result = await userStore.signIn()
    if (result.alreadyCheckedIn) {
      toast(t('checkIn.already'), 'info')
      return
    }
    rewardAmount.value = result.reward
    rewardBurstVisible.value = true
    if (burstTimer !== null) window.clearTimeout(burstTimer)
    burstTimer = window.setTimeout(() => {
      rewardBurstVisible.value = false
    }, 1200)
    toast(t('checkIn.success', { reward: result.reward }), 'success')
  } catch (e) {
    const message = e instanceof Error ? e.message : t('checkIn.error')
    toast(message, 'error')
  } finally {
    checkingIn.value = false
  }
}

onUnmounted(() => {
  if (burstTimer !== null) window.clearTimeout(burstTimer)
})

// ========== 每日词汇目标（新背 + 复习） ==========
const todayLearnedWords = ref(0)
const todayReviewedWords = ref(0)
const dailyNewWordsTarget = computed(() => userStore.dailyNewWords ?? 10)
const dailyReviewWordsTarget = computed(() => userStore.dailyReviewWords ?? 5)

const newWordProgress = computed(() => {
  const completed = todayLearnedWords.value
  const total = dailyNewWordsTarget.value
  const percent = total > 0 ? Math.min(100, Math.round((completed / total) * 100)) : 100
  return {
    percent,
    completed,
    total,
    remaining: Math.max(0, total - completed),
  }
})

const reviewWordProgress = computed(() => {
  const completed = todayReviewedWords.value
  const total = dailyReviewWordsTarget.value
  const percent = total > 0 ? Math.min(100, Math.round((completed / total) * 100)) : 100
  return {
    percent,
    completed,
    total,
    remaining: Math.max(0, total - completed),
  }
})

const showVocabularyGoalDialog = ref(false)
const goalSaving = ref(false)
const goalError = ref('')

const openVocabularyGoalDialog = async () => {
  if (!userStore.userId) {
    toast(t('learning.pleaseLogin'), 'warning')
    return
  }
  if (!userStore.preferenceLoaded) {
    await userStore.loadPreference()
  }
  goalError.value = ''
  showVocabularyGoalDialog.value = true
}

const closeVocabularyGoalDialog = () => {
  showVocabularyGoalDialog.value = false
  goalError.value = ''
}

const handleVocabularyGoalSave = async (payload: { newWords: number; reviewWords: number }) => {
  goalSaving.value = true
  goalError.value = ''
  try {
    await userStore.setVocabularyGoals(payload.newWords, payload.reviewWords)
    showVocabularyGoalDialog.value = false
    await loadHomeData()
    toast(t('vocabGoal.saved'), 'success')
  } catch (e) {
    goalError.value = e instanceof Error ? e.message : t('vocabGoal.saveFailed')
    toast(goalError.value, 'error')
  } finally {
    goalSaving.value = false
  }
}
// ========== 连续签到天数 ==========
const checkInStreak = computed(() => userStore.checkInStreak)
// ========== 学习量统计 ==========
const studyPeriod = ref<'week' | 'month'>('week')
const weeklyAverage = ref(0)
interface StudyBar {
  hasData: boolean
  vocab: number
  grammar: number
  translation: number
  listening: number
  isToday: boolean
  /** 原始数值（周视图为分钟数，月视图为答题数） */
  rawValue: number
  /** 悬浮提示文案 */
  tooltip: string
}
// ========== 学习量柱状图（使用后端真实数据） ==========
const realWeekMinutes = ref<number[]>([])
const realMonthQuestions = ref<number[]>([])
const studyBars = computed<StudyBar[]>(() => {
  const isWeek = studyPeriod.value === 'week'
  const data = isWeek ? realWeekMinutes.value : realMonthQuestions.value
  const placeholderCount = isWeek ? 7 : 12
  if (!data || data.length === 0) {
    return Array(placeholderCount).fill(null).map(() => ({
      hasData: false, vocab: 0, grammar: 0, translation: 0, listening: 0, isToday: false, rawValue: 0, tooltip: ''
    }))
  }
  const maxValue = Math.max(...data, 1)
  // 计算今天在数组中的索引（后端按周一到周日返回，需要找到今天是周几）
  const todayIdx = isWeek ? getTodayWeekIndex() : -1
  return data.map((value, i) => {
    const percent = Math.round((value / maxValue) * 100)
    const tooltip = isWeek
      ? t('dashboard.chartMinutes', { count: value })
      : t('dashboard.chartQuestions', { count: value })
    return {
      hasData: value > 0,
      vocab: percent,
      grammar: 0,
      translation: 0,
      listening: 0,
      isToday: i === todayIdx,
      rawValue: value,
      tooltip,
    }
  })
})
const barLabels = computed(() => {
  if (studyPeriod.value === 'week') {
    return getWeekDayLabels()
  }
  // 月份标签跟随当前语言：zh-CN 得到「1月」，en-US 得到「Jan」
  return Array.from({ length: 12 }, (_, i) =>
    new Intl.DateTimeFormat(locale.value, { month: 'short' }).format(new Date(2024, i, 1)),
  )
})
/** 获取今天在本周数组中的索引（0=周一, 6=周日） */
function getTodayWeekIndex(): number {
  const dayOfWeek = new Date().getDay()
  return dayOfWeek === 0 ? 6 : dayOfWeek - 1
}
/** 获取本周一到周日的星期标签（M/T/W/T/F/S/S） */
function getWeekDayLabels(): string[] {
  const labels = ['M', 'T', 'W', 'T', 'F', 'S', 'S']
  return labels
}
// 学习量图表副标题（随视图切换）
const studySubtitle = computed(() => {
  return studyPeriod.value === 'week'
    ? t('dashboard.weeklyStudyMinutes')
    : t('dashboard.yearlyQuestionsByMonth', { year: new Date().getFullYear() })
})
// 学习量标题下方的统计摘要（随视图切换）
const studySummaryText = computed(() => {
  if (studyPeriod.value === 'week') {
    return t('dashboard.weeklyAverageQuestions', { count: weeklyAverage.value })
  }
  // 月视图：本月总答题数（取 yearlyMonthQuestions 最后一个元素，即当前月份）
  const currentMonthQuestions = realMonthQuestions.value.length > 0
    ? realMonthQuestions.value[new Date().getMonth()]
    : 0
  return t('dashboard.monthAnswered', { count: currentMonthQuestions })
})
// ========== 继续学习 ==========
const continueInfo = ref(t('dashboard.unitInfo', { unit: 1 }))
const reviewTasks = ref<ReviewTaskVO[]>([])
// ========== 每日单词 ==========
const dailyWord = ref<DailyWordVO | null>(null)
// ========== 加载真实学习量数据 ==========
const loadStatsData = async () => {
  const uid = userStore.userId
  if (!uid) return
  try {
    const stats = await getExerciseStats(uid)
    if (stats?.recentWeekMinutes) {
      realWeekMinutes.value = stats.recentWeekMinutes
    }
    if (stats?.yearlyMonthQuestions) {
      realMonthQuestions.value = stats.yearlyMonthQuestions
    }
    // 本周平均每天答题数（由后端计算并返回）
    if (stats?.weeklyAverageQuestions !== undefined) {
      weeklyAverage.value = stats.weeklyAverageQuestions
    }
    // 今日新学/复习数量（后端按日期统计）
    todayLearnedWords.value = stats?.todayLearnedWords || 0
    todayReviewedWords.value = stats?.todayReviewedWords || 0
  } catch (e) {
    console.warn('获取学习量统计失败', e)
  }
}
// ========== 加载数据 ==========
const loadHomeData = async () => {
  await Promise.all([
    loadStatsData(),
    userStore.loadCoinInfo(),
    userStore.loadPreference(),
  ])
  const userId = userStore.userId
  if (!userId) return
  try {
    const tasks = await getReviewTasks(userId)
    reviewTasks.value = tasks || []
    if (tasks && tasks.length > 0) {
      const firstTask = tasks[0]
      continueInfo.value = t('dashboard.reviewTasksPending', {
        count: tasks.length,
        module: moduleName(firstTask.moduleType, t, 1),
      })
    } else {
      continueInfo.value = t('dashboard.reviewTasksDone')
    }
  } catch (e) {
    console.warn('Failed to load review tasks', e)
  }
  try {
    const cetLevel = userStore.user?.cetLevel || 'CET4'
    const word = await getDailyWord(cetLevel)
    dailyWord.value = word
  } catch (e) {
    console.warn('Failed to load daily word', e)
    dailyWord.value = null
  }
}
const startDailyLesson = () => {
  window.location.href = '/learning'
}
const continueLearning = () => {
  window.location.href = '/learning'
}
const goToDailyWordDetail = () => {
  if (dailyWord.value) {
    window.location.href = '/learning'
  }
}
watch(() => userStore.userId, (newId) => {
  if (newId) loadHomeData()
}, { immediate: true })

// 每次进入首页都刷新数据（练习完回来时进度能更新）
watch(() => route.path, (newPath) => {
  if (newPath === '/' || newPath === '/home') {
    if (userStore.userId) loadHomeData()
  }
})
</script>

<style scoped>
/* 柱形图悬浮提示 */
.bar-tooltip {
  position: absolute;
  top: -32px;
  left: 50%;
  transform: translateX(-50%);
  background: rgb(var(--color-inverse-surface) / 0.92);
  color: rgb(var(--color-inverse-on-surface));
  padding: 4px 10px;
  border-radius: 8px;
  white-space: nowrap;
  pointer-events: none;
  opacity: 0;
  transition: opacity 0.2s ease;
  z-index: 10;
}
/* 小三角箭头 */
.bar-tooltip::after {
  content: '';
  position: absolute;
  bottom: -5px;
  left: 50%;
  transform: translateX(-50%);
  border-left: 5px solid transparent;
  border-right: 5px solid transparent;
  border-top: 5px solid rgba(30, 30, 40, 0.88);
}
/* 悬停时显示提示 */
.bar-col:hover .bar-tooltip {
  opacity: 1;
}
</style>
