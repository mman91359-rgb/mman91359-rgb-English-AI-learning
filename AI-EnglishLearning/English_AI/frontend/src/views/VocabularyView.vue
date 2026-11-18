<template>
  <AppLayout>
    <PageHeader :title="$t('app.title') + ' - ' + $t('learning.myVocabulary')" back />

    <!-- 词书选择器 + 收藏入口 -->
    <div class="flex items-center gap-2 mb-4 overflow-x-auto">
      <span class="font-label-md text-label-md text-on-surface-variant shrink-0">{{ $t('learning.wordBook') }}</span>
      <div class="flex items-center gap-2 flex-1 overflow-x-auto">
        <button
          v-for="b in wordBooks"
          :key="b.code"
          class="px-3 py-1.5 rounded-full font-label-sm text-label-sm whitespace-nowrap transition-colors shrink-0"
          :class="activeBookCode === b.code ? 'bg-primary text-on-primary' : 'bg-surface-container-lowest text-on-surface-variant'"
          @click="switchBook(b.code)"
        >
          {{ b.name }}
        </button>
      </div>
      <button
        class="shrink-0 w-9 h-9 rounded-full flex items-center justify-center bg-surface-container-lowest text-on-surface-variant hover:bg-surface-container-low transition-colors"
        :title="$t('vocabulary.favoritesTitle')"
        @click="showFavorites = !showFavorites"
      >
        <AppIcon name="favorite" size="md" :tone="showFavorites ? 'primary' : undefined" />
      </button>
    </div>

    <!-- 收藏单词列表 -->
    <div v-if="showFavorites" class="bg-surface-container-lowest rounded-2xl p-4 shadow-soft-glow mb-6">
      <div class="flex items-center gap-2 mb-3">
        <AppIcon name="favorite" size="lg" tone="primary" />
        <span class="font-label-lg text-label-lg text-on-surface">{{ $t('vocabulary.favoritesCount', { count: favorites.length }) }}</span>
        <div class="ml-auto flex items-center gap-2">
          <span class="font-label-sm text-label-sm text-on-surface-variant">
            {{ $t('wordBook.favoriteParallel') }}
          </span>
          <Switch
            :model-value="favoriteParallel"
            :aria-label="$t('wordBook.favoriteParallel')"
            @update:model-value="toggleFavoriteParallel"
          />
        </div>
      </div>
      <div v-if="favorites.length === 0" class="font-body-sm text-body-sm text-on-surface-variant">{{ $t('vocabulary.noFavoriteWords') }}</div>
      <div v-else class="space-y-2">
        <div v-for="f in favorites" :key="f.id" class="flex items-center gap-3">
          <div class="flex-1 min-w-0">
            <div class="flex items-baseline gap-2 flex-wrap">
              <span class="font-body-md text-body-md text-on-surface">{{ f.word }}</span>
              <span v-if="f.pos" class="font-label-sm text-label-sm text-primary italic">{{ f.pos }}</span>
              <span v-if="f.phonetic" class="font-body-sm text-body-sm text-on-surface-variant">{{ f.phonetic }}</span>
            </div>
            <p class="font-body-sm text-body-sm text-on-surface-variant">{{ f.translation || $t('learning.noTranslation') }}</p>
          </div>
          <button :class="btnIcon" @click="toggleFavorite(f.word)">
            <AppIcon name="favorite" size="lg" tone="error" />
          </button>
        </div>
      </div>
    </div>

    <!-- 顶部统计卡片 -->
    <div class="grid grid-cols-3 gap-3 mb-6">
      <div class="bg-surface-container-lowest rounded-2xl p-4 shadow-soft-glow text-center">
        <p class="font-headline-lg text-headline-lg text-primary">{{ stats.total }}</p>
        <p class="font-label-md text-label-md text-on-surface-variant mt-1">{{ $t('vocabulary.totalWords') }}</p>
      </div>
      <div class="bg-surface-container-lowest rounded-2xl p-4 shadow-soft-glow text-center">
        <p class="font-headline-lg text-headline-lg text-tertiary">{{ stats.mastered }}</p>
        <p class="font-label-md text-label-md text-on-surface-variant mt-1">{{ $t('learning.mastered') }}</p>
      </div>
      <div
        class="bg-surface-container-lowest rounded-2xl p-4 shadow-soft-glow text-center cursor-pointer hover:bg-surface-container-low transition-colors"
        @click="goReview"
      >
        <p class="font-headline-lg text-headline-lg" :class="stats.review > 0 ? 'text-error' : 'text-on-surface-variant'">
          {{ stats.review }}
        </p>
        <p class="font-label-md text-label-md text-on-surface-variant mt-1">{{ $t('vocabulary.todayReview') }}</p>
      </div>
    </div>

    <!-- 智能添加单词 -->
    <form class="bg-surface-container-lowest rounded-2xl p-6 shadow-soft-glow mb-6" @submit.prevent="handleAdd">
      <div class="flex items-center gap-2 mb-3">
        <AppIcon name="library_add" size="lg" tone="primary" />
        <span class="font-label-lg text-label-lg text-on-surface">{{ $t('vocabulary.smartAddTitle') }}</span>
      </div>
      <div class="flex flex-col sm:flex-row gap-3">
        <input
          v-model="newWord"
          :class="[inputClassOnCard, 'flex-1']"
          :placeholder="$t('vocabulary.smartAddPlaceholder')"
          required
        />
        <button
          type="submit"
          :class="btnPrimary"
          :disabled="adding"
        >
          <AppIcon :name="adding ? 'progress_activity' : 'add'" size="sm" />
          {{ adding ? $t('vocabulary.aiGenerating') : $t('vocabulary.smartAdd') }}
        </button>
      </div>
      <p v-if="addHint" class="mt-2 font-body-sm text-body-sm text-on-surface-variant">{{ addHint }}</p>
    </form>

    <!-- 筛选标签 -->
    <div class="mb-4">
      <ChipGroup
        :model-value="activeTab"
        :options="tabs.map(tab => ({ value: tab.key, label: tab.label, count: tab.count }))"
        size="md"
        :wrap="false"
        :aria-label="$t('learning.myVocabulary')"
        @update:model-value="activeTab = $event as 'all' | 'review' | 'mastered'"
      />
    </div>

    <LoadingState v-if="loading" />

    <ErrorState
      v-else-if="loadError"
      :message="loadError"
      :action-label="$t('common.retry')"
      @retry="load"
    />

    <EmptyState
      v-else-if="filteredWords.length === 0"
      icon="bookmark_border"
      :title="emptyHint"
      :description="$t('learning.vocabularyEmptyHint')"
    />

    <div v-else class="space-y-3">
      <div
        v-for="w in filteredWords"
        :key="w.id"
        :class="[
          'bg-surface-container-lowest rounded-2xl p-4 shadow-soft-glow',
          w.isMastered ? 'opacity-60' : ''
        ]"
      >
        <div class="flex items-start gap-4">
          <!-- 掌握度圆圈 -->
          <button
            class="w-10 h-10 rounded-full flex items-center justify-center shrink-0 transition-colors"
            :class="w.isMastered ? 'bg-tertiary-container/40 text-on-tertiary-container' : 'bg-outline-variant/20 text-outline'"
            @click="handleToggle(w)"
            :title="$t('vocabulary.masteryLevel', { level: w.masteryLevel ?? 0 })"
          >
            <AppIcon :name="w.isMastered ? 'check_circle' : 'radio_button_unchecked'" size="lg" />
          </button>

          <div class="flex-1 min-w-0">
            <!-- 单词行：单词 + 词性 + 音标 -->
            <div class="flex items-baseline gap-3 flex-wrap">
              <p class="font-headline-lg text-headline-lg text-on-surface" :class="w.isMastered ? 'line-through' : ''">
                {{ w.word }}
              </p>
              <span v-if="w.pos" class="font-label-md text-label-md text-primary italic">{{ w.pos }}</span>
              <span v-if="w.phonetic" class="font-body-sm text-body-sm text-on-surface-variant">{{ w.phonetic }}</span>
            </div>
            <!-- 释义 -->
            <p class="font-body-md text-body-md text-on-surface-variant mt-1">
              {{ w.translation || $t('learning.noTranslation') }}
            </p>
            <!-- 例句 -->
            <div v-if="w.example" class="mt-2 pl-3 border-l-2 border-primary/40">
              <p class="font-body-sm text-body-sm text-on-surface italic">{{ w.example }}</p>
              <p v-if="w.exampleTranslation" class="font-body-sm text-body-sm text-on-surface-variant mt-0.5">
                {{ w.exampleTranslation }}
              </p>
            </div>
            <!-- 搭配 -->
            <p v-if="w.collocation" class="mt-2 font-body-sm text-body-sm text-on-surface-variant">
              <span class="text-outline">{{ $t('vocabulary.collocationLabel') }}</span>{{ w.collocation }}
            </p>
            <!-- 掌握度进度条 + 复习信息 -->
            <div class="mt-2 flex items-center gap-3">
              <div class="flex-1 flex items-center gap-1">
                <ProgressBar class="flex-1" :value="w.masteryLevel ?? 0" :max="5" size="sm" />
                <span class="font-label-sm text-label-sm text-on-surface-variant whitespace-nowrap">
                  Lv{{ w.masteryLevel ?? 0 }}/5
                </span>
              </div>
              <span v-if="w.nextReviewAt && !w.isMastered" class="font-label-sm text-label-sm text-on-surface-variant/70 whitespace-nowrap">
                <AppIcon name="schedule" size="lg" class="align-middle" />
                {{ formatReviewDate(w.nextReviewAt) }}
              </span>
            </div>
          </div>

          <div class="flex flex-col items-center gap-1">
            <button :class="btnIcon" @click="toggleFavorite(w.word)">
              <AppIcon :name="isFavorite(w.word) ? 'favorite' : 'favorite_border'" size="lg" :tone="isFavorite(w.word) ? 'primary' : undefined" />
            </button>
            <button :class="btnIcon" @click="handleFamiliar(w)">
              <AppIcon name="task_alt" size="lg" tone="warning" />
            </button>
            <button
              :class="btnIconDanger"
              @click="handleRemove(w)"
            >
              <AppIcon name="delete" size="lg" tone="error" />
            </button>
          </div>
        </div>
      </div>
    </div>

    <!-- ============ 复习模式弹窗 ============ -->
    <div
      v-if="reviewMode"
      class="fixed inset-0 z-[120] flex items-center justify-center bg-scrim/50 p-4"
      @click.self="exitReview"
    >
      <div
        ref="reviewPanelRef"
        role="dialog"
        aria-modal="true"
        aria-labelledby="review-dialog-title"
        tabindex="-1"
        class="w-full max-w-lg rounded-3xl bg-surface-container-lowest p-6 shadow-soft-glow focus:outline-none"
      >
        <div class="mb-4 flex items-center justify-between">
          <div class="flex items-center gap-2">
            <AppIcon name="school" size="lg" tone="primary" />
            <span id="review-dialog-title" class="font-headline-md text-headline-md text-on-surface">{{ $t('vocabulary.reviewMode') }}</span>
          </div>
          <button
            type="button"
            :class="btnIcon"
            :aria-label="$t('common.close')"
            @click="exitReview"
          >
            <AppIcon name="close" size="lg" />
          </button>
        </div>

        <!-- 复习进度 -->
        <div class="flex items-center justify-between mb-4">
          <span class="font-body-md text-body-md text-on-surface-variant">
            {{ reviewIndex + 1 }} / {{ reviewQueue.length }}
          </span>
          <div class="flex-1 mx-4">
            <ProgressBar :value="reviewIndex + 1" :max="reviewQueue.length" size="sm" />
          </div>
        </div>

        <div v-if="reviewQueue.length > 0 && currentReview">
          <!-- 卡片正面：单词 + 音标，点击/按钮翻面看释义 -->
          <!-- 契约例外：min-h-[200px] 在 spacing scale 里无等值档（48=192 / 52=208），
               保留原值而不是硬凑 192，避免复习卡片高度位移。 -->
          <div class="bg-background rounded-2xl p-8 min-h-[200px] flex flex-col items-center justify-center text-center">
            <p class="font-headline-lg text-headline-lg text-on-surface">{{ currentReview.word }}</p>
            <p v-if="currentReview.phonetic" class="font-body-md text-body-md text-on-surface-variant mt-2">
              {{ currentReview.phonetic }}
            </p>
            <p v-if="currentReview.pos" class="font-label-md text-label-md text-primary italic mt-1">
              {{ currentReview.pos }}
            </p>

            <transition name="fade">
              <div v-if="flipped" class="mt-4 w-full">
                <p class="font-body-lg text-body-lg text-on-surface">{{ currentReview.translation }}</p>
                <div v-if="currentReview.example" class="mt-3 pl-3 border-l-2 border-primary/40 text-left">
                  <p class="font-body-sm text-body-sm text-on-surface italic">{{ currentReview.example }}</p>
                  <p v-if="currentReview.exampleTranslation" class="font-body-sm text-body-sm text-on-surface-variant mt-0.5">
                    {{ currentReview.exampleTranslation }}
                  </p>
                </div>
              </div>
            </transition>

            <button
              v-if="!flipped"
              class="mt-6 px-4 py-2 bg-surface-container-low text-on-surface rounded-full font-label-md text-label-md hover:bg-surface-container transition-colors flex items-center gap-1"
              @click="flipped = true"
            >
              <AppIcon name="visibility" size="lg" />
              {{ $t('wordReview.showMeaning') }}
            </button>
          </div>

          <!-- 操作按钮：翻面后才可评价 -->
          <div class="grid grid-cols-2 gap-3 mt-4">
            <button
              class="py-3 bg-error-container/30 text-error rounded-xl font-label-md text-label-md hover:bg-error-container/50 transition-colors flex items-center justify-center gap-1"
              :disabled="!flipped || reviewing"
              @click="handleReview(false)"
            >
              <AppIcon :name="reviewing ? 'progress_activity' : 'close'" size="lg" />
              {{ $t('wordReview.forgot') }}
            </button>
            <button
              class="py-3 bg-tertiary-container/40 text-on-tertiary-container rounded-xl font-label-md text-label-md hover:bg-tertiary-container/60 transition-colors flex items-center justify-center gap-1"
              :disabled="!flipped || reviewing"
              @click="handleReview(true)"
            >
              <AppIcon :name="reviewing ? 'progress_activity' : 'check'" size="lg" />
              {{ $t('wordReview.remembered') }}
            </button>
          </div>
        </div>

        <!-- 复习完成 -->
        <div v-else class="py-12 text-center">
          <AppIcon name="celebration" size="3xl" tone="primary" />
          <p class="mt-4 font-headline-md text-headline-md text-on-surface">{{ $t('vocabulary.reviewDone') }}</p>
          <p class="mt-2 font-body-md text-body-md text-on-surface-variant">
            {{ $t('vocabulary.reviewSummary', { correct: reviewCorrect, wrong: reviewWrong }) }}
          </p>
          <button
            :class="['mt-6', btnPrimary]"
            @click="exitReview"
          >
            {{ $t('common.finish') }}
          </button>
        </div>
      </div>
    </div>
  </AppLayout>
</template>

<script setup lang="ts">
import { ref, computed, onMounted, watch } from 'vue'
import { useI18n } from 'vue-i18n'
import AppLayout from '../components/AppLayout.vue'
import AppIcon from '@/components/ui/AppIcon.vue'
import ChipGroup from '@/components/ui/ChipGroup.vue'
import Switch from '@/components/ui/Switch.vue'
import PageHeader from '@/components/ui/PageHeader.vue'
import ProgressBar from '@/components/ui/ProgressBar.vue'
import LoadingState from '@/components/ui/LoadingState.vue'
import EmptyState from '@/components/ui/EmptyState.vue'
import ErrorState from '@/components/ui/ErrorState.vue'
import { useUserStore } from '@/stores/user'
import { useModalBehavior } from '@/composables/useModalBehavior'
import {
  getVocabularyPage,
  addVocabularySmart,
  removeVocabulary,
  toggleMastered,
  markFamiliar,
  getReviewList,
  reviewWord,
  getWordBooks,
  addWordFavorite,
  removeWordFavorite,
  getWordFavorites,
  type VocabularyVO,
  type WordBookVO,
  type UserWordFavoriteVO,
} from '@/api/exercise'
import { btnIcon, btnIconDanger, btnPrimary } from '@/components/ui/buttonStyles'
import { inputClassOnCard } from '@/components/ui/formStyles'

const userStore = useUserStore()
const { t } = useI18n()
const words = ref<VocabularyVO[]>([])
const loading = ref(true)
const loadError = ref('')
const adding = ref(false)
const newWord = ref('')
const addHint = ref('')
const activeTab = ref<'all' | 'review' | 'mastered'>('all')

// ===== 词书与收藏 =====
const wordBooks = ref<WordBookVO[]>([])
const activeBookCode = ref('')
const favorites = ref<UserWordFavoriteVO[]>([])

/** 收藏词并行开关（本地乐观更新，失败回滚） */
const favoriteParallel = ref(false)
const showFavorites = ref(false)

// ===== 统计 =====
const stats = computed(() => ({
  total: words.value.length,
  mastered: words.value.filter(w => w.isMastered === 1).length,
  review: words.value.filter(w => w.isMastered === 0 && w.nextReviewAt && new Date(w.nextReviewAt) <= new Date()).length,
}))

// ===== 筛选 =====
const tabs = computed(() => [
  { key: 'all' as const, label: t('learning.all'), count: words.value.length },
  { key: 'review' as const, label: t('vocabulary.tabReview'), count: stats.value.review },
  { key: 'mastered' as const, label: t('learning.mastered'), count: stats.value.mastered },
])

const filteredWords = computed(() => {
  if (activeTab.value === 'review') {
    return words.value.filter(w => w.isMastered === 0 && w.nextReviewAt && new Date(w.nextReviewAt) <= new Date())
  }
  if (activeTab.value === 'mastered') {
    return words.value.filter(w => w.isMastered === 1)
  }
  return words.value
})

const emptyHint = computed(() => {
  if (activeTab.value === 'review') return t('vocabulary.emptyReview')
  if (activeTab.value === 'mastered') return t('vocabulary.emptyMastered')
  return t('learning.vocabularyEmpty')
})

// ===== 加载 =====
const load = async () => {
  const uid = userStore.userId
  if (!uid) return
  loading.value = true
  loadError.value = ''
  try {
    const res = await getVocabularyPage(uid, 1, 200, activeBookCode.value || undefined)
    words.value = res.records || []
  } catch (e) {
    console.warn('加载单词本失败', e)
    loadError.value = e instanceof Error ? e.message : t('vocabulary.loadFailed')
  } finally {
    loading.value = false
  }
}

// ===== 加载词书列表 =====
const loadWordBooks = async () => {
  try {
    wordBooks.value = await getWordBooks()
    // 默认选中第一本（basic_foundation）
    if (!activeBookCode.value && wordBooks.value.length > 0) {
      activeBookCode.value = wordBooks.value[0].code
    }
  } catch (e) {
    console.warn('加载词书列表失败', e)
  }
}

// ===== 切换词书 =====
const switchBook = async (code: string) => {
  activeBookCode.value = code
  await load()
}

// ===== 加载收藏 =====
const loadFavorites = async () => {
  const uid = userStore.userId
  if (!uid) return
  try {
    favorites.value = await getWordFavorites(uid)
  } catch (e) {
    console.warn('加载收藏失败', e)
  }
}

// ===== 收藏切换 =====
/** 收藏词并行开关：先本地翻转（乐观更新），保存失败回滚 */
const toggleFavoriteParallel = async (enabled: boolean) => {
  const uid = userStore.userId
  if (!uid) return
  const previous = favoriteParallel.value
  favoriteParallel.value = enabled
  try {
    await userStore.setIncludeFavoriteWords(enabled)
  } catch (e) {
    favoriteParallel.value = previous
    console.warn('更新收藏词并行开关失败', e)
  }
}

/** 偏好在别处被改动时（例如词书中心切换），同步到本地开关 */
watch(() => userStore.includeFavoriteWords, (value) => {
  favoriteParallel.value = value
})

const toggleFavorite = async (word: string) => {
  const uid = userStore.userId
  if (!uid) return
  try {
    const exists = favorites.value.some(f => f.word === word.toLowerCase())
    if (exists) {
      await removeWordFavorite(uid, word)
      favorites.value = favorites.value.filter(f => f.word !== word.toLowerCase())
    } else {
      await addWordFavorite(uid, word)
      await loadFavorites()
    }
  } catch (e) {
    console.warn('切换收藏失败', e)
  }
}

// ===== 标熟单词 =====
// 「忽略」与「标熟」已合并：这是用户唯一可操作的排除动作，
// 标熟后该词退出新词池与复习队列，但仍计入已学（可在「已学词库」页取消标熟）。
const handleFamiliar = async (w: VocabularyVO) => {
  const uid = userStore.userId
  if (!uid) return
  try {
    await markFamiliar(w.id, uid, true)
    await load()
  } catch (e) {
    console.warn('标记标熟失败', e)
  }
}

// ===== 是否已收藏 =====
const isFavorite = (word: string): boolean => {
  return favorites.value.some(f => f.word === word.toLowerCase())
}

// ===== 智能添加 =====
const handleAdd = async () => {
  const uid = userStore.userId
  if (!uid || !newWord.value.trim()) return
  adding.value = true
  addHint.value = ''
  try {
    const vo = await addVocabularySmart({
      userId: uid,
      word: newWord.value.trim(),
      source: 'manual',
    })
    words.value.unshift(vo)
    newWord.value = ''
    addHint.value = t('vocabulary.aiCompleted')
  } catch (e: any) {
    addHint.value = t('vocabulary.addFailed') + (e?.message || t('vocabulary.tryLater'))
  } finally {
    adding.value = false
    setTimeout(() => (addHint.value = ''), 4000)
  }
}

const handleToggle = async (w: VocabularyVO) => {
  const uid = userStore.userId
  if (!uid) return
  try {
    const updated = await toggleMastered(w.id, uid)
    const idx = words.value.findIndex(v => v.id === w.id)
    if (idx >= 0) words.value[idx] = updated
  } catch (e) {
    console.warn('切换掌握状态失败', e)
  }
}

const handleRemove = async (w: VocabularyVO) => {
  const uid = userStore.userId
  if (!uid) return
  try {
    await removeVocabulary(w.id, uid)
    words.value = words.value.filter(v => v.id !== w.id)
  } catch (e) {
    console.warn('删除单词失败', e)
  }
}

// ===== 日期格式化 =====
const formatReviewDate = (dateStr: string) => {
  const d = new Date(dateStr)
  const now = new Date()
  const today = new Date(now.getFullYear(), now.getMonth(), now.getDate())
  const target = new Date(d.getFullYear(), d.getMonth(), d.getDate())
  const diff = Math.round((target.getTime() - today.getTime()) / 86400000)
  if (diff < 0) return t('vocabulary.overdue')
  if (diff === 0) return t('vocabulary.dueToday')
  return t('vocabulary.daysLater', { days: diff })
}

// ===== 复习模式 =====
const reviewMode = ref(false)
const reviewPanelRef = ref<HTMLElement | null>(null)
const reviewQueue = ref<VocabularyVO[]>([])
const reviewIndex = ref(0)
const flipped = ref(false)
const reviewing = ref(false)
const reviewCorrect = ref(0)
const reviewWrong = ref(0)

const currentReview = computed(() =>
  reviewIndex.value < reviewQueue.value.length ? reviewQueue.value[reviewIndex.value] : null
)

const goReview = async () => {
  const uid = userStore.userId
  if (!uid) return
  try {
    const list = await getReviewList(uid)
    if (list.length === 0) {
      reviewQueue.value = []
      reviewIndex.value = 0
      reviewCorrect.value = 0
      reviewWrong.value = 0
      reviewMode.value = true
      return
    }
    reviewQueue.value = list
    reviewIndex.value = 0
    flipped.value = false
    reviewCorrect.value = 0
    reviewWrong.value = 0
    reviewMode.value = true
  } catch (e) {
    console.warn('加载复习列表失败', e)
  }
}

const handleReview = async (isCorrect: boolean) => {
  const uid = userStore.userId
  const cur = currentReview.value
  if (!uid || !cur || reviewing.value) return
  reviewing.value = true
  try {
    const updated = await reviewWord(cur.id, { userId: uid, isCorrect })
    // 更新主列表中对应单词
    const idx = words.value.findIndex(v => v.id === cur.id)
    if (idx >= 0) words.value[idx] = updated
    if (isCorrect) reviewCorrect.value++
    else reviewWrong.value++
    // 下一张
    reviewIndex.value++
    flipped.value = false
    if (reviewIndex.value >= reviewQueue.value.length) {
      // 复习完成，刷新统计
      await load()
    }
  } catch (e) {
    console.warn('提交复习结果失败', e)
  } finally {
    reviewing.value = false
  }
}

const exitReview = () => {
  reviewMode.value = false
  flipped.value = false
}

useModalBehavior({
  isOpen: () => reviewMode.value,
  container: reviewPanelRef,
  onEscape: exitReview,
})

onMounted(async () => {
  await loadWordBooks()
  await loadFavorites()
  await load()
  if (!userStore.preferenceLoaded) {
    await userStore.loadPreference()
  }
  favoriteParallel.value = userStore.includeFavoriteWords
})
</script>

<style scoped>
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.3s ease;
}
.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}
</style>
