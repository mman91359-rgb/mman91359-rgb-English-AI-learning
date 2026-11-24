<!--
  词汇练习页面
  两种模式（由路由 query.mode 决定）：
    - new    → 新学两阶段（VocabNewSession）：词义识别 + 句子填词
    - review → 复习三档评分（VocabReviewSession）：GOOD/HARD/AGAIN
  视觉：左侧 SideNavBar + 顶部返回栏 + 沉浸式大背景 + 底部 AI 侧栏
-->
<template>
  <div class="bg-background text-on-background min-h-screen flex">
    <!-- 左侧导航栏 -->
    <SideNavBar />

    <!-- 主内容区 + AI侧边栏 容器 -->
    <div class="flex-1 flex min-w-0">
      <main class="w-full max-w-3xl mx-auto flex flex-col min-h-screen relative">
        <!-- 顶部栏：返回 + 新学进度条 + 后台操作 -->
        <header class="h-20 sticky top-0 z-40 bg-background/80 backdrop-blur-md flex items-center justify-between px-gutter w-full">
          <div class="flex items-center gap-4 flex-1">
            <button
              :class="btnIcon"
              :aria-label="$t('common.back')"
              @click="goBack"
            >
              <AppIcon name="arrow_back_ios_new" size="lg" />
            </button>
          </div>

          <div class="flex items-center gap-2">
            <button
              :class="btnIcon"
              :aria-label="appStore.isDark ? $t('topbar.switchToLight') : $t('topbar.switchToDark')"
              @click="appStore.toggleTheme"
            >
              <AppIcon :name="appStore.isDark ? 'light_mode' : 'dark_mode'" size="lg" />
            </button>
            <button
              :class="['relative', btnIcon]"
              :aria-label="$t('topbar.notifications')"
            >
              <AppIcon name="notifications" size="lg" />
              <span class="absolute top-2 right-2 w-2 h-2 bg-error rounded-full"></span>
            </button>
            <button
              :class="btnIcon"
              :aria-label="$t('topbar.currentLanguage')"
              @click="cycleLanguage"
            >
              <AppIcon name="language" size="lg" />
            </button>
            <div
              class="w-8 h-8 rounded-full bg-primary text-on-primary ml-2 flex items-center justify-center cursor-pointer hover:ring-2 hover:ring-primary/50 hover:scale-105 active:scale-95 transition-all text-sm font-bold select-none overflow-hidden"
              :title="userStore.username || ''"
              :aria-label="$t('profile.userInfo')"
              role="button"
              tabindex="0"
              @click="router.push('/profile')"
              @keydown.enter="router.push('/profile')"
            >
              <img v-if="quizAvatarUrl" :src="quizAvatarUrl" :alt="$t('profile.userInfo')" class="w-full h-full object-cover" />
              <span v-else>{{ avatarText }}</span>
            </div>
          </div>
        </header>

        <!-- 题目画布 -->
        <div class="flex-1 w-full max-w-container-max mx-auto px-gutter py-8 flex flex-col relative">
          <LoadingState v-if="loading" class="flex-1" :message="$t('common.loading')" />

          <!-- 复习模式：沉浸式三档评分 -->
          <VocabReviewSession
            v-else-if="vocabMode === 'review'"
            :words="reviewWords"
            @complete="handleReviewComplete"
          />

          <!-- 新学模式：两阶段（词义识别 → 句子填词） -->
          <VocabNewSession
            v-else-if="vocabMode === 'new'"
            @complete="goBack"
          />

          <EmptyState
            v-else
            class="flex-1"
            icon="inbox"
            :title="$t('learning.noQuestions')"
            :action-label="$t('learning.backToHub')"
            @action="goBack"
          />
        </div>
      </main>

      <!-- AI 侧边栏（inline 模式） -->
      <AiSidebar mode="inline" />
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
    :submit-label="$t('vocabGoal.save')"
    @update:visible="showVocabularyGoalDialog = $event"
    @save="handleVocabularyGoalSave"
    @close="closeVocabularyGoalDialog"
  />
</template>

<script setup lang="ts">
import { computed, onMounted, onUnmounted, ref, watch } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { useI18n } from 'vue-i18n'
import SideNavBar from '@/components/SideNavBar.vue'
import AiSidebar from '@/components/AiSidebar.vue'
import LoadingState from '@/components/ui/LoadingState.vue'
import EmptyState from '@/components/ui/EmptyState.vue'
import AppIcon from '@/components/ui/AppIcon.vue'
import VocabularyGoalDialog from '@/components/VocabularyGoalDialog.vue'
import VocabReviewSession from '@/components/vocab/VocabReviewSession.vue'
import VocabNewSession from '@/components/vocab/VocabNewSession.vue'
import { useUserStore } from '@/stores/user'
import { useAppStore } from '@/stores/app'
import { useAiStore } from '@/stores/ai'
import { useToast } from '@/composables/useToast'
import { getReviewList, type VocabularyVO } from '@/api/exercise'
import { btnIcon } from '@/components/ui/buttonStyles'

const router = useRouter()
const route = useRoute()
const { t } = useI18n()
const userStore = useUserStore()
const appStore = useAppStore()
const aiStore = useAiStore()
const { show: toast } = useToast()

const loading = ref(true)

// 每日目标弹窗
const showVocabularyGoalDialog = ref(false)
const goalSaving = ref(false)
const goalError = ref('')

// 复习阶段
const reviewWords = ref<VocabularyVO[]>([])
const reviewCompleted = ref(false)

// 本次练习模式：'review'（复习）或 'new'（新学，默认）
const vocabMode = computed<'review' | 'new'>(() => route.query.mode === 'review' ? 'review' : 'new')

const goBack = () => {
  if (window.history.length > 1) router.back()
  else router.push('/learning')
}

const cycleLanguage = () => {
  const langs = ['zh-CN', 'en-US']
  const idx = langs.indexOf(appStore.language)
  appStore.setLanguage(langs[(idx + 1) % langs.length])
}

const avatarText = computed(() => {
  const name = userStore.user?.username || userStore.username || ''
  return name ? name.charAt(0).toUpperCase() : 'M'
})

const quizAvatarUrl = computed(() => {
  const url = userStore.avatarUrl
  return url ? `/api${url}` : ''
})

// ========== 每日目标 ==========
const promptVocabularyGoalsIfNeeded = async (): Promise<boolean> => {
  if (!userStore.preferenceLoaded) await userStore.loadPreference()
  if (!userStore.vocabularyGoalsConfigured) {
    goalError.value = ''
    showVocabularyGoalDialog.value = true
    loading.value = false
    return true
  }
  return false
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
    await startSession()
  } catch (e) {
    goalError.value = e instanceof Error ? e.message : t('vocabGoal.saveFailed')
    toast(goalError.value, 'error')
  } finally {
    goalSaving.value = false
  }
}

const handleReviewComplete = async (payload: { reviewed: number; correct: number }) => {
  reviewCompleted.value = true
  if (payload.reviewed > 0) {
    toast(t('wordReview.summaryText', { reviewed: payload.reviewed, correct: payload.correct }), 'success')
  }
  loading.value = false
  goBack()
}

const startReviewOnly = async () => {
  const userId = userStore.userId
  if (!userId) {
    router.push('/login')
    return
  }
  loading.value = true
  reviewWords.value = []
  try {
    const due = await getReviewList(userId)
    reviewWords.value = due || []
    loading.value = false
    if (reviewWords.value.length === 0) toast(t('wordReview.empty'), 'info')
  } catch (e) {
    console.warn('加载复习单词失败', e)
    loading.value = false
    toast(t('wordReview.loadFailed'), 'error')
  }
}

const startSession = async () => {
  if (vocabMode.value === 'review') {
    await startReviewOnly()
    return
  }
  // 新学：词包由 VocabNewSession 在挂载时自行加载
  loading.value = false
}

// ========== 生命周期 ==========
onMounted(async () => {
  aiStore.setInlineMode(true)
  if (userStore.userId) {
    const needsGoal = await promptVocabularyGoalsIfNeeded()
    if (!needsGoal) await startSession()
  } else {
    loading.value = false
  }
})
onUnmounted(() => {
  aiStore.setInlineMode(false)
})
watch(() => userStore.userId, async (id) => {
  if (!id) return
  reviewCompleted.value = false
  const needsGoal = await promptVocabularyGoalsIfNeeded()
  if (!needsGoal) await startSession()
})
</script>
