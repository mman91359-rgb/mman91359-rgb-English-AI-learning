<template>
  <AppLayout>
    <h2 class="font-headline-lg text-headline-lg text-on-surface mb-8">{{ $t('learning.title') }}</h2>

    <!-- 分类标签 -->
    <div class="flex gap-2 mb-8 overflow-x-auto pb-2 scrollbar-hide">
      <button
        v-for="tab in tabs"
        :key="tab.key"
        :class="[
          'px-6 py-2 rounded-full font-label-lg text-label-lg whitespace-nowrap transition-colors',
          activeTab === tab.key
            ? 'bg-on-surface text-surface'
            : tab.available
              ? 'text-on-surface-variant hover:bg-surface-container hover:text-on-surface'
              : 'text-on-surface-variant/50 cursor-not-allowed'
        ]"
        @click="switchTab(tab.key)"
      >
        {{ tab.label }}
        <span v-if="!tab.available" class="ml-1 text-label-sm">{{ $t('learning.comingSoon') }}</span>
      </button>
    </div>

    <!-- ========== 语法 tab：与翻译/听力/写作一致的 8/4 布局 ========== -->
    <template v-if="activeTab === 'grammar'">
      <div class="grid grid-cols-1 md:grid-cols-12 gap-gutter">
        <div class="relative flex flex-col overflow-hidden rounded-[24px] bg-info p-8 md:col-span-8">
          <div class="pointer-events-none absolute -right-16 -top-16 h-56 w-56 rounded-full bg-info-container/30 blur-3xl" aria-hidden="true" />
          <div class="relative z-10">
            <h3 class="font-headline-md text-headline-md mb-2 text-on-info">{{ $t('learning.grammarPractice') }}</h3>
            <p class="mb-5 font-body-md text-body-md text-on-info/80">{{ $t('learning.grammarEntryDesc') }}</p>

            <div class="mb-6 flex flex-wrap items-center gap-3">
              <span class="font-label-lg text-label-lg text-on-info/90">{{ $t('learning.dailyTarget') }}</span>
              <div class="flex items-center gap-2 rounded-full bg-on-info/15 px-4 py-2 font-label-lg text-label-lg text-on-info">
                <template v-if="editingTarget">
                  <input
                    ref="targetInput"
                    v-model.number="editValue"
                    class="w-16 rounded bg-on-info/15 px-2 py-0.5 text-center text-on-info outline-none"
                    @keydown.enter="confirmTarget"
                    @keydown.escape="cancelTarget"
                    @blur="confirmTarget"
                  />
                  <span>{{ $t('learning.questions') }}</span>
                </template>
                <template v-else>
                  <span class="cursor-pointer" @click="startEditTarget">{{ dailyTarget }} {{ $t('learning.questions') }}</span>
                  <span class="material-symbols-outlined cursor-pointer text-sm" @click="startEditTarget">edit</span>
                </template>
              </div>
            </div>

            <button
              type="button"
              class="flex w-full items-center justify-center gap-2 rounded-[16px] bg-surface-container-lowest px-8 py-4 font-label-lg text-label-lg text-info transition-colors hover:bg-surface-container-lowest/90 sm:w-auto sm:inline-flex"
              @click="startPractice"
            >
              <span class="material-symbols-outlined">play_arrow</span>{{ $t('learning.grammarStart') }}
            </button>
          </div>
        </div>

        <div class="col-span-1 flex flex-col gap-4 md:col-span-4">
          <div
            class="flex cursor-pointer items-center justify-between rounded-[24px] bg-surface-container-lowest p-6 shadow-soft-glow transition-colors hover:bg-surface-container-lowest/80"
            @click="goToFavorites"
          >
            <div class="flex items-center gap-4">
              <div class="flex h-10 w-10 items-center justify-center rounded-full bg-error-container/30">
                <span class="material-symbols-outlined fill text-error">favorite</span>
              </div>
              <div class="flex flex-col gap-0.5">
                <span class="font-body-lg text-body-lg text-on-surface">{{ $t('learning.myFavorites') }}</span>
                <span class="font-label-md text-label-md text-on-surface-variant">{{ $t('learning.favoritesCount', { count: favoriteCount }) }}</span>
              </div>
            </div>
            <span class="material-symbols-outlined text-outline">chevron_right</span>
          </div>
          <div
            class="flex cursor-pointer items-center justify-between rounded-[24px] bg-surface-container-lowest p-6 shadow-soft-glow transition-colors hover:bg-surface-container-lowest/80"
            @click="goToErrorBook"
          >
            <div class="flex items-center gap-4">
              <div class="flex h-10 w-10 items-center justify-center rounded-full bg-secondary-container/30">
                <span class="material-symbols-outlined text-secondary">build</span>
              </div>
              <div class="flex flex-col gap-0.5">
                <span class="font-body-lg text-body-lg text-on-surface">{{ $t('learning.myErrorBook') }}</span>
                <span class="font-label-md text-label-md text-on-surface-variant">{{ $t('learning.errorCountLabel', { count: errorCount }) }}</span>
              </div>
            </div>
            <span class="material-symbols-outlined text-outline">chevron_right</span>
          </div>
        </div>

        <div
          class="col-span-1 flex cursor-pointer items-center justify-between rounded-[24px] bg-surface-container-lowest p-6 shadow-soft-glow transition-colors hover:bg-surface-container-lowest/80 md:col-span-4"
          @click="goToHistory"
        >
          <div class="flex items-center gap-4">
            <div class="flex h-10 w-10 items-center justify-center rounded-full bg-tertiary-container/30">
              <span class="material-symbols-outlined text-tertiary">hourglass_bottom</span>
            </div>
            <div class="flex flex-col gap-0.5">
              <span class="font-body-lg text-body-lg text-on-surface">{{ $t('learning.learningHistory') }}</span>
              <span class="font-label-md text-label-md text-on-surface-variant">{{ $t('learning.answeredCountLabel', { count: totalAnswered }) }}</span>
            </div>
          </div>
          <span class="material-symbols-outlined text-outline">chevron_right</span>
        </div>
        <div
          class="col-span-1 flex cursor-pointer items-center justify-between rounded-[24px] bg-surface-container-lowest p-6 shadow-soft-glow transition-colors hover:bg-surface-container-lowest/80 md:col-span-4"
          @click="goToStudiedGrammar"
        >
          <div class="flex items-center gap-4">
            <div class="flex h-10 w-10 items-center justify-center rounded-full bg-primary-container/30">
              <span class="material-symbols-outlined fill text-primary">hourglass</span>
            </div>
            <div class="flex flex-col gap-0.5">
              <span class="font-body-lg text-body-lg text-on-surface">{{ $t('learning.studiedGrammar') }}</span>
              <span class="font-label-md text-label-md text-on-surface-variant">{{ $t('learning.grammarPractice') }}</span>
            </div>
          </div>
          <span class="material-symbols-outlined text-outline">chevron_right</span>
        </div>
        <div
          class="col-span-1 flex cursor-pointer items-center justify-between rounded-[24px] bg-surface-container-lowest p-6 shadow-soft-glow transition-colors hover:bg-surface-container-lowest/80 md:col-span-4"
          @click="toastComingSoon"
        >
          <div class="flex items-center gap-4">
            <div class="flex h-10 w-10 items-center justify-center rounded-full bg-secondary-container/30">
              <span class="material-symbols-outlined text-secondary">psychology</span>
            </div>
            <div class="flex flex-col gap-0.5">
              <span class="font-body-lg text-body-lg text-on-surface">{{ $t('learning.aiQA') }}</span>
              <span class="font-label-md text-label-md text-on-surface-variant">{{ $t('learning.aiAssistant') }}</span>
            </div>
          </div>
          <span class="material-symbols-outlined text-outline">chevron_right</span>
        </div>
      </div>
    </template>

    <!-- ========== 听力 tab：复用学习中心的 8/4 布局 ========== -->
    <template v-else-if="activeTab === 'listening'">
      <ListeningEntryPanel />
    </template>

    <!-- ========== 翻译 tab：纯前端预览面板 ========== -->
    <template v-else-if="activeTab === 'translation'">
      <TranslationEntryPanel />
    </template>

    <!-- ========== 写作 tab：学习中心内的写作入口面板 ========== -->
    <template v-else-if="activeTab === 'writing'">
      <WritingEntryPanel />
    </template>

    <!-- ========== 其他 tab 原有布局 ========== -->
    <template v-else>
      <div class="grid grid-cols-1 md:grid-cols-12 gap-gutter">
        <!-- 主练习入口 -->
        <div
          class="col-span-1 md:col-span-8 bg-primary rounded-[24px] p-8 flex flex-col justify-between relative overflow-hidden min-h-[200px]"
        >
          <div class="pointer-events-none absolute -right-16 -top-16 h-56 w-56 rounded-full bg-primary-fixed/20 blur-3xl" aria-hidden="true" />
          <div class="relative z-10 text-on-primary">
            <h3 class="font-headline-md text-headline-md mb-2">{{ currentModuleName }}{{ $t('learning.practice') }}</h3>
            <p class="mb-5 font-body-sm text-body-sm text-on-primary/80">{{ $t('learning.vocabEntryDesc') }}</p>
            <div class="flex flex-wrap items-center gap-2">
              <span class="rounded-full bg-on-primary/15 px-3 py-1 font-label-md text-label-md">
                {{ $t('learning.newWordsGoal', { count: dailyNewWordsDisplay }) }}
              </span>
              <span class="rounded-full bg-on-primary/15 px-3 py-1 font-label-md text-label-md">
                {{ $t('learning.reviewWordsGoal', { count: dailyReviewWordsDisplay }) }}
              </span>
              <span class="material-symbols-outlined text-sm opacity-70">tune</span>
            </div>
            <p class="mt-4 font-body-sm text-body-sm text-on-primary/70">
              {{ $t('learning.tapToSetGoal') }}
            </p>
            <button
              type="button"
              class="mt-6 flex w-full items-center justify-center gap-2 rounded-[16px] bg-surface-container-lowest px-8 py-4 font-label-lg text-label-lg text-primary transition-colors hover:bg-surface-container-lowest/90 sm:w-auto sm:inline-flex"
              @click="openVocabularyGoalDialog"
            >
              <span class="material-symbols-outlined">play_arrow</span>{{ $t('learning.vocabStart') }}
            </button>
          </div>
        </div>

        <!-- 收藏 & 错题 -->
        <div class="col-span-1 md:col-span-4 flex flex-col gap-4">
          <div
            class="bg-surface-container-lowest rounded-[24px] p-6 shadow-soft-glow flex items-center justify-between cursor-pointer hover:bg-surface-container-lowest/80 transition-colors"
            @click="goToFavorites"
          >
            <div class="flex items-center gap-4">
              <div class="w-10 h-10 rounded-full bg-error-container/30 flex items-center justify-center">
                <span class="material-symbols-outlined text-error fill">favorite</span>
              </div>
              <div>
                <span class="font-body-lg text-body-lg text-on-surface block">{{ $t('learning.myFavorites') }}</span>
                <span class="font-label-md text-label-md text-on-surface-variant">{{ $t('learning.favoritesCount', { count: favoriteCount }) }}</span>
              </div>
            </div>
            <span class="material-symbols-outlined text-outline">chevron_right</span>
          </div>
          <div
            class="bg-surface-container-lowest rounded-[24px] p-6 shadow-soft-glow flex items-center justify-between cursor-pointer hover:bg-surface-container-lowest/80 transition-colors"
            @click="goToErrorBook"
          >
            <div class="flex items-center gap-4">
              <div class="w-10 h-10 rounded-full bg-secondary-container/30 flex items-center justify-center">
                <span class="material-symbols-outlined text-secondary">build</span>
              </div>
              <div>
                <span class="font-body-lg text-body-lg text-on-surface block">{{ $t('learning.myErrorBook') }}</span>
                <span class="font-label-md text-label-md text-on-surface-variant">{{ $t('learning.errorCountLabel', { count: errorCount }) }}</span>
              </div>
            </div>
            <span class="material-symbols-outlined text-outline">chevron_right</span>
          </div>
        </div>

        <!-- 学习历史 & 单词本 & AI问答 -->
        <div class="col-span-1 md:col-span-4 bg-surface-container-lowest rounded-[24px] p-6 shadow-soft-glow flex items-center justify-between cursor-pointer hover:bg-surface-container-lowest/80 transition-colors" @click="goToHistory">
          <div class="flex items-center gap-4">
            <div class="w-10 h-10 rounded-full bg-tertiary-container/30 flex items-center justify-center">
              <span class="material-symbols-outlined text-tertiary">hourglass_bottom</span>
            </div>
            <div>
              <span class="font-body-lg text-body-lg text-on-surface block">{{ $t('learning.learningHistory') }}</span>
              <span class="font-label-md text-label-md text-on-surface-variant">{{ $t('learning.answeredCountLabel', { count: totalAnswered }) }}</span>
            </div>
          </div>
          <span class="material-symbols-outlined text-outline">chevron_right</span>
        </div>
        <div class="col-span-1 md:col-span-4 bg-surface-container-lowest rounded-[24px] p-6 shadow-soft-glow flex items-center justify-between cursor-pointer hover:bg-surface-container-lowest/80 transition-colors" @click="goToVocabulary">
          <div class="flex items-center gap-4">
            <div class="w-10 h-10 rounded-full bg-primary-container/30 flex items-center justify-center">
              <span class="material-symbols-outlined text-primary">bookmark</span>
            </div>
            <div>
              <span class="font-body-lg text-body-lg text-on-surface block">{{ $t('learning.myVocabulary') }}</span>
              <span class="font-label-md text-label-md text-on-surface-variant">{{ $t('learning.wordBookCountLabel', { count: wordBookCount }) }}</span>
            </div>
          </div>
          <span class="material-symbols-outlined text-outline">chevron_right</span>
        </div>
        <div class="col-span-1 md:col-span-4 bg-surface-container-lowest rounded-[24px] p-6 shadow-soft-glow flex items-center justify-between cursor-pointer hover:bg-surface-container-lowest/80 transition-colors" @click="openAiChat">
          <div class="flex items-center gap-4">
            <div class="w-10 h-10 rounded-full bg-secondary-container/30 flex items-center justify-center">
              <span class="material-symbols-outlined text-secondary">psychology</span>
            </div>
            <div>
              <span class="font-body-lg text-body-lg text-on-surface block">{{ $t('learning.aiQA') }}</span>
              <span class="font-label-md text-label-md text-on-surface-variant">{{ $t('learning.aiAssistant') }}</span>
            </div>
          </div>
          <span class="material-symbols-outlined text-outline">chevron_right</span>
        </div>
      </div>

      <!-- 词典 -->
      <div class="mt-12">
        <h3 class="font-headline-md text-headline-md text-on-surface mb-6">{{ $t('learning.dictionary') }}</h3>
        <div class="col-span-1 md:col-span-4 bg-surface-container-lowest rounded-[24px] p-6 shadow-soft-glow flex items-center justify-between cursor-pointer hover:bg-surface-container-lowest/80 transition-colors" @click="toastComingSoon">
          <div class="flex items-center gap-4">
            <div class="w-10 h-10 rounded-full bg-secondary-container/20 flex items-center justify-center">
              <span class="material-symbols-outlined text-secondary">search</span>
            </div>
            <div>
              <span class="font-body-lg text-body-lg text-on-surface block">{{ $t('learning.englishDictionary') }}</span>
              <span class="font-label-md text-label-md text-on-surface-variant">{{ $t('learning.dictionaryHint') }}</span>
            </div>
          </div>
          <span class="material-symbols-outlined text-outline">chevron_right</span>
        </div>
      </div>
    </template>

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
  </AppLayout>
</template>

<script setup lang="ts">
import { ref, computed, watch } from 'vue'
import { useRouter, useRoute } from 'vue-router'
import { useI18n } from 'vue-i18n'
import AppLayout from '../components/AppLayout.vue'
import ListeningEntryPanel from '../components/listening/ListeningEntryPanel.vue'
import TranslationEntryPanel from '../components/translation/TranslationEntryPanel.vue'
import WritingEntryPanel from '../components/writing/WritingEntryPanel.vue'
import VocabularyGoalDialog from '@/components/VocabularyGoalDialog.vue'
import { useUserStore } from '@/stores/user'
import { useAiStore } from '@/stores/ai'
import { getErrorBook, getFavorites, getVocabulary } from '@/api/exercise'
import { getCurveStats } from '@/api/learning'
import { useToast } from '@/composables/useToast'

const { t } = useI18n()
const { show: toast } = useToast()
const userStore = useUserStore()
const aiStore = useAiStore()
const router = useRouter()
const route = useRoute()

// ========== 标签配置 ==========
// 标签顺序按截图：词汇 / 语法 / 翻译 / 听力 / 造句
const tabs = computed(() => [
  { key: 'vocab', label: t('learning.vocabTab'), moduleType: 1, available: true },
  { key: 'grammar', label: t('learning.grammarTab'), moduleType: 2, available: true },
  { key: 'translation', label: t('learning.translationTab'), moduleType: 3, available: true },
  { key: 'listening', label: t('learning.listeningTab'), moduleType: 4, available: true },
  { key: 'writing', label: t('learning.writingTab'), moduleType: 6, available: true },
])
const activeTab = ref('vocab')

const currentTab = computed(() => {
  return tabs.value.find(tab => tab.key === activeTab.value) || tabs.value[0]
})

const currentModuleType = computed(() => {
  return currentTab.value.moduleType
})

const currentModuleName = computed(() => {
  const names: Record<string, string> = {
    vocab: t('learning.vocabTab'),
    grammar: t('learning.grammarTab'),
    translation: t('learning.translationTab'),
    listening: t('learning.listeningTab'),
    writing: t('learning.writingTab'),
  }
  return names[activeTab.value] || t('learning.vocabTab')
})

const DAILY_TARGET_KEY_VOCAB = 'dailyTarget_vocab'
const DAILY_TARGET_KEY_GRAMMAR = 'dailyTarget_grammar'

const defaultTargets: Record<string, number> = {
  vocab: 20,
  grammar: 10,
}

const getTargetKey = () => {
  if (activeTab.value === 'grammar') return DAILY_TARGET_KEY_GRAMMAR
  return DAILY_TARGET_KEY_VOCAB
}

const getDefaultTarget = () => {
  return defaultTargets[activeTab.value] || 20
}

const dailyTarget = ref(Number(localStorage.getItem(getTargetKey())) || getDefaultTarget())

const editingTarget = ref(false)
const editValue = ref(dailyTarget.value)
const targetInput = ref<HTMLInputElement | null>(null)

const loadTarget = () => {
  dailyTarget.value = Number(localStorage.getItem(getTargetKey())) || getDefaultTarget()
}

const startEditTarget = () => {
  editValue.value = dailyTarget.value
  editingTarget.value = true
  setTimeout(() => targetInput.value?.focus(), 0)
}

const confirmTarget = () => {
  const v = Math.max(1, Math.min(999, editValue.value || getDefaultTarget()))
  dailyTarget.value = v
  localStorage.setItem(getTargetKey(), String(v))
  editingTarget.value = false
}

const cancelTarget = () => {
  editingTarget.value = false
}

// ========== 每日词汇目标弹窗 ==========
const showVocabularyGoalDialog = ref(false)
const goalSaving = ref(false)
const goalError = ref('')
const dailyNewWordsDisplay = computed(() => userStore.dailyNewWords ?? 10)
const dailyReviewWordsDisplay = computed(() => userStore.dailyReviewWords ?? 5)

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
    await router.push('/vocab-quiz')
  } catch (e) {
    goalError.value = e instanceof Error ? e.message : t('vocabGoal.saveFailed')
    toast(goalError.value, 'error')
  } finally {
    goalSaving.value = false
  }
}

const applyTabFromQuery = () => {
  const tab = route.query.tab
  if (typeof tab === 'string' && tabs.value.some(item => item.key === tab)) {
    activeTab.value = tab
  }
}
applyTabFromQuery()
loadTarget()
watch(() => route.query.tab, applyTabFromQuery)

watch(activeTab, () => {
  loadTarget()
})

// ========== 统计数据 ==========
const favoriteCount = ref(0)
const errorCount = ref(0)
const totalAnswered = ref(0)
const wordBookCount = ref(0)

// ========== 加载学习中心数据 ==========
const loadLearningData = async () => {
  const userId = userStore.userId
  if (!userId) return

  try {
    const errors = await getErrorBook(userId)
    errorCount.value = errors?.length || 0
  } catch (e) {
    console.warn('获取错题本失败', e)
    errorCount.value = 0
  }

  try {
    const favs = await getFavorites(userId)
    favoriteCount.value = favs?.length || 0
  } catch (e) {
    console.warn('获取收藏数失败', e)
    favoriteCount.value = 0
  }

  try {
    const words = await getVocabulary(userId)
    wordBookCount.value = words?.length || 0
  } catch (e) {
    console.warn('获取单词本数量失败', e)
    wordBookCount.value = 0
  }

  try {
    const stats = await getCurveStats(userId)
    totalAnswered.value = stats?.totalQuestions || 0
  } catch (e) {
    console.warn('获取曲线统计失败', e)
  }
}

// ========== 练习入口 ==========
const startPractice = () => {
  const userId = userStore.userId
  if (!userId) {
    toast(t('learning.pleaseLogin'), 'warning')
    return
  }
  if (!currentTab.value.available) {
    toastComingSoon()
    return
  }
  // 词汇先打开每日目标弹窗，语法/其他模块走原有入口
  if (currentModuleType.value === 1) {
    void openVocabularyGoalDialog()
  } else if (currentModuleType.value === 2) {
    router.push('/grammar-quiz')
  } else if (currentModuleType.value === 3) {
    router.push('/translation/practice')
  } else if (currentModuleType.value === 4) {
    router.push('/listening')
  } else {
    router.push({ path: '/learning/practice', query: { moduleType: currentModuleType.value, count: dailyTarget.value } })
  }
}

const switchTab = (key: string) => {
  const target = tabs.value.find(tab => tab.key === key)
  if (target && !target.available) {
    toastComingSoon()
    return
  }
  activeTab.value = key
  router.replace({ path: '/learning', query: key === 'vocab' ? {} : { tab: key } })
}

// ========== 开发中功能提示 ==========
const toastComingSoon = () => {
  toast(t('common.comingSoon'), 'info')
}

// ========== AI 问答 ==========
const openAiChat = () => {
  aiStore.open({ contextType: 'general' })
}

// ========== 导航 ==========
const goToFavorites = () => {
  router.push('/favorites')
}

const goToErrorBook = () => {
  router.push('/error-book')
}

const goToHistory = () => {
  router.push('/history')
}

const goToVocabulary = () => {
  router.push('/vocabulary')
}

// 学习过的语法：复用错题本（语法模块）
const goToStudiedGrammar = () => {
  router.push('/error-book')
}

watch(() => userStore.userId, (newId) => {
  if (newId) {
    void userStore.loadPreference()
    loadLearningData()
  }
}, { immediate: true })

// 导航回学习中心时自动刷新数据
watch(() => route.path, (newPath) => {
  if (newPath === '/learning') loadLearningData()
})
</script>
