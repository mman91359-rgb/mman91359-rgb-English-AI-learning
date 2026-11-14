<template>
  <AppLayout flush hide-top-bar>
    <template #topbar>
      <header class="h-20 sticky top-0 z-40 bg-background/80 backdrop-blur-md flex items-center justify-between px-gutter w-full max-w-[1192px] mx-auto">
        <div class="flex items-center gap-4 flex-1">
          <button type="button" :class="btnIcon" :aria-label="$t('common.back')" @click="router.push({ path: '/learning', query: { tab: 'translation' } })">
            <span class="material-symbols-outlined">arrow_back_ios_new</span>
          </button>
          <QuizProgressBar :answered="answeredCount" :total="questions.length" />
        </div>
        <div class="flex items-center gap-2">
          <span class="bg-secondary-container/30 text-secondary font-label-md text-label-md px-3 py-1 rounded-full">{{ currentLevelLabel }}</span>
          <div class="w-8 h-8 rounded-full bg-surface-variant flex items-center justify-center overflow-hidden">
            <span class="font-label-md text-label-md text-on-surface-variant">{{ avatarText }}</span>
          </div>
        </div>
      </header>
    </template>

    <div class="flex-1 w-full max-w-[1192px] mx-auto px-gutter py-8 pb-24 md:pb-8">
      <!-- 加载 / 空态 -->
      <div v-if="loading" class="flex flex-col items-center justify-center py-24 gap-4 text-on-surface-variant">
        <span class="material-symbols-outlined text-icon-3xl animate-spin">progress_activity</span>
        <p class="font-body-lg">{{ $t('common.loading') }}</p>
      </div>

      <div v-else-if="!currentQuestion" class="flex flex-col items-center justify-center py-24 gap-4">
        <span class="material-symbols-outlined text-icon-3xl text-outline-variant">translate</span>
        <p class="font-body-lg text-on-surface-variant">{{ $t('translation.noQuestions') }}</p>
        <button type="button" class="px-6 py-3 bg-primary text-on-primary rounded-full font-label-lg" @click="router.push({ path: '/learning', query: { tab: 'translation' } })">
          {{ $t('common.back') }}
        </button>
      </div>

      <div v-else class="flex flex-col lg:grid lg:grid-cols-[minmax(0,1fr)_340px] xl:grid-cols-[minmax(0,1fr)_360px] 2xl:grid-cols-[minmax(0,768px)_400px] justify-center gap-gutter flex-1">
        <section class="w-full max-w-3xl flex flex-col gap-6 min-w-0">
          <div class="bg-surface-container-lowest rounded-3xl p-8 md:p-10 shadow-soft-glow border border-outline-variant/20 relative flex flex-col">
            <div class="flex items-center justify-between mb-8">
              <div class="flex items-center gap-2">
                <span class="bg-secondary-fixed/50 text-secondary font-label-md text-label-md px-3 py-1 rounded-full flex items-center gap-1">
                  {{ $t('translation.questionLabel', { index: currentIndex + 1, total: questions.length }) }}
                </span>
                <span class="bg-secondary-container/20 text-secondary font-label-md text-label-md px-3 py-1 rounded-full">{{ currentLevelLabel }}</span>
              </div>
              <span class="bg-error text-on-error font-label-md text-label-md px-3 py-1 rounded-full shadow-sm">{{ isCurrentPassage ? $t('translation.passageType') : $t('translation.shortType') }}</span>
            </div>

            <div class="flex items-center gap-2 mb-4">
              <span class="material-symbols-outlined text-secondary text-icon-sm">menu_book</span>
              <span class="font-label-md text-label-md text-on-surface-variant">{{ $t('translation.sourceLabel') }}</span>
            </div>

            <div class="bg-secondary-container/10 rounded-2xl p-6 mb-6">
              <div class="flex items-center gap-2 mb-3">
                <span class="material-symbols-outlined text-secondary text-icon-md">translate</span>
                <span class="font-label-lg text-label-lg text-secondary">{{ $t('translation.translatePrompt') }}</span>
              </div>
              <p class="font-headline-md text-headline-md text-on-surface leading-relaxed">{{ currentQuestion.stem }}</p>
            </div>

            <div class="flex flex-col gap-2 flex-1">
              <div class="flex items-center gap-2">
                <span class="material-symbols-outlined text-primary text-icon-md">edit</span>
                <span class="font-label-lg text-label-lg text-on-surface-variant">{{ $t('translation.yourTranslation') }}</span>
              </div>
              <textarea
                v-model="text"
                :disabled="submitted"
                class="w-full min-h-[140px] bg-surface-container-low border-2 border-outline-variant/30 focus:border-secondary focus:ring-0 focus:outline-none rounded-2xl p-4 font-body-lg text-body-lg text-on-surface resize-none transition-colors placeholder-outline-variant/40 disabled:opacity-70"
                :placeholder="$t('translation.placeholder')"
              ></textarea>
              <div class="flex items-center justify-between">
                <span class="font-label-md text-label-md text-outline-variant">{{ $t('translation.wordsCount', { count: wordCount }) }}</span>
              </div>
            </div>

            <p v-if="showHint && currentQuestion.analysis" class="mt-4 bg-primary-container/10 text-primary rounded-xl p-3 font-body-md text-body-md">
              {{ currentQuestion.analysis }}
            </p>

            <button
              v-if="!submitted"
              type="button"
              class="self-start mt-4 flex items-center gap-2 bg-primary-container/15 text-primary px-4 py-2 rounded-full font-label-lg text-label-lg hover:bg-primary-container/25 transition-colors"
              @click="showHint = !showHint"
            >
              <span class="material-symbols-outlined text-icon-sm">lightbulb</span>{{ $t('translation.viewHint') }}
            </button>
          </div>

          <div class="flex items-center gap-3 mt-auto">
            <button
              v-if="!submitted"
              type="button"
              class="flex-1 bg-gradient-to-r from-primary to-primary-fixed-dim text-on-primary py-4 rounded-2xl font-label-lg text-label-lg flex items-center justify-center gap-2 hover:opacity-90 transition-opacity shadow-[0_4px_14px_rgba(103,85,140,0.25)] disabled:opacity-60"
              :disabled="submitting"
              @click="submit"
            >
              <span class="material-symbols-outlined">{{ submitting ? 'progress_activity' : 'arrow_forward' }}</span>
              {{ submitting ? $t('common.loading') : $t('translation.submit') }}
            </button>
            <button
              v-else
              type="button"
              class="flex-1 bg-gradient-to-r from-tertiary to-tertiary-fixed-dim text-on-tertiary py-4 rounded-2xl font-label-lg text-label-lg flex items-center justify-center gap-2 hover:opacity-90 transition-opacity shadow-[0_4px_14px_rgba(0,110,32,0.25)]"
              @click="next"
            >
              <span class="material-symbols-outlined">arrow_forward</span>{{ currentIndex < questions.length - 1 ? $t('translation.nextQuestion') : $t('translation.finish') }}
            </button>
            <button
              v-if="!submitted"
              type="button"
              class="flex-1 bg-gradient-to-r from-secondary to-secondary-fixed-dim text-on-secondary py-4 rounded-2xl font-label-lg text-label-lg flex items-center justify-center gap-2 hover:opacity-90 transition-opacity shadow-[0_4px_14px_rgba(12,103,128,0.25)]"
              @click="reset"
            >
              <span class="material-symbols-outlined">replay</span>{{ $t('translation.reset') }}
            </button>
          </div>
        </section>

        <aside class="w-full min-w-0 flex flex-col gap-4">
          <div class="flex items-center gap-2 mb-2">
            <span class="material-symbols-outlined text-tertiary">spellcheck</span>
            <h3 class="font-headline-md text-headline-md text-on-surface">{{ $t('translation.aiFeedback') }}</h3>
          </div>

          <FeedbackPanel
            :status="feedbackStatus"
            :message="feedbackMessage"
            :tags="feedbackTags"
            :show-favorite="false"
          />

          <!--
            结构化反馈：参考译文 / 你的译文逐词对照。
            收藏入口由面板底部操作条承担，故上方判定卡不再重复渲染收藏按钮。
            hide-header：aside 顶部已有「AI 反馈」栏目标题，避免出现两个同名标题。
          -->
          <AiFeedbackPanel
            v-if="submitted && result"
            type="translation"
            hide-header
            :data="translationFeedback"
            :actions="{ favorite: true }"
            :favorited="isReferenceFavorited"
            @favorite="addReferenceToFavorites"
            @lookup="handleLookup"
          />

          <!-- 追问入口：打开 AI 面板并投一张可折叠的批改速览卡，不自动发问 -->
          <button
            v-if="submitted && result"
            type="button"
            class="flex h-11 w-full items-center justify-center gap-2 rounded-2xl border border-outline-variant/60 bg-surface-container-lowest font-label-lg text-label-lg text-on-surface-variant transition-colors hover:bg-surface-container-low"
            @click="askAi"
          >
            <span class="material-symbols-outlined text-icon-md" aria-hidden="true">forum</span>
            {{ $t('translation.askAi') }}
          </button>

          <div v-if="submitted && result?.suggestions?.length" class="bg-tertiary-container/15 rounded-2xl p-5 border border-tertiary/20">
            <div class="flex items-center gap-2 mb-3">
              <span class="material-symbols-outlined text-tertiary text-icon-md">bookmark</span>
              <span class="font-label-lg text-label-lg text-tertiary">{{ $t('translation.suggestions') }}</span>
            </div>
            <ul class="space-y-2">
              <li v-for="(s, i) in result.suggestions" :key="i" class="font-body-md text-body-md text-on-surface">{{ s }}</li>
            </ul>
          </div>
        </aside>
      </div>
    </div>

    <!-- 单词详情弹层：内部 Teleport 到 body，挂在哪一层都不影响定位 -->
    <WordDetailCard :word="lookupWord" :open="showWordDetail" @close="showWordDetail = false" />
  </AppLayout>
</template>

<script setup lang="ts">
import { computed, onMounted, ref } from 'vue'
import { useRouter } from 'vue-router'
import { useI18n } from 'vue-i18n'
import AppLayout from '../components/AppLayout.vue'
import FeedbackPanel from '../components/listening/FeedbackPanel.vue'
import AiFeedbackPanel from '../components/ai/AiFeedbackPanel.vue'
import QuizProgressBar from '../components/quiz/QuizProgressBar.vue'
import WordDetailCard from '../components/word/WordDetailCard.vue'
import { useToast } from '../composables/useToast'
import { useUserStore } from '../stores/user'
import { useAiStore } from '../stores/ai'
import { selectTranslationQuestions, submitTranslation, isPassageTranslation } from '../api/translation'
import { useSentenceFavorite } from '@/composables/useSentenceFavorite'
import { usePracticeSettlement } from '@/composables/usePracticeSettlement'
import type { QuestionVO } from '../api/exercise'
import type { SubmitResponse } from '../api/exercise'
import { btnIcon } from '@/components/ui/buttonStyles'

const router = useRouter()
const { t } = useI18n()
const { show: toast } = useToast()
const userStore = useUserStore()
const aiStore = useAiStore()
const sentenceFavorite = useSentenceFavorite()

const questions = ref<QuestionVO[]>([])
const currentIndex = ref(0)
const text = ref('')
const showHint = ref(false)
const submitted = ref(false)
const submitting = ref(false)
const loading = ref(true)
const result = ref<SubmitResponse | null>(null)
/**
 * 本次提交的答题记录ID。
 * AI 对话流只存 recordId，展开卡片时用它反查题干/译文/解析，
 * 因此必须在提交成功的那一刻抓住，切题后即失效。
 */
const logId = ref<number | null>(null)

/** 练习组结算：整组翻译做完后按分组键结算积分 */
const { batchKey, batchSettle, startBatch, settleBatch } = usePracticeSettlement()

const currentQuestion = computed(() => questions.value[currentIndex.value] ?? null)
const answeredCount = computed(() => submitted.value ? currentIndex.value + 1 : currentIndex.value)
const isCurrentPassage = computed(() => currentQuestion.value ? isPassageTranslation(currentQuestion.value.stem) : false)
const currentLevelLabel = computed(() => {
  if (!currentQuestion.value) return ''
  return isCurrentPassage.value ? t('translation.passageType') : t('translation.shortType')
})
const wordCount = computed(() => text.value.trim() ? text.value.trim().split(/\s+/).length : 0)
const avatarText = computed(() => (userStore.username || 'U').slice(0, 1).toUpperCase())

const feedbackStatus = computed<'idle' | 'correct' | 'incorrect'>(() => {
  if (!submitted.value || !result.value) return 'idle'
  return result.value.isCorrect ? 'correct' : 'incorrect'
})
const feedbackMessage = computed(() => {
  if (!submitted.value || !result.value) return t('translation.feedbackPending')
  return result.value.heuristicHint || (result.value.isCorrect ? t('translation.correctHint') : t('translation.incorrectHint'))
})
const feedbackTags = computed(() => {
  if (!submitted.value || !result.value) return []
  const tags: string[] = []
  if (result.value.isSemanticMatch) tags.push(t('translation.semanticMatch'))
  if (result.value.matchedLevel != null) tags.push(`L${result.value.matchedLevel}`)
  return tags
})

/**
 * 结构化反馈数据。
 * 只映射 TranslationFeedback 声明过的字段，aiReason 故意留空：
 * 判定结论（heuristicHint）已由上方 FeedbackPanel 承担，两边都展示同一句话会显得重复。
 * userAnswer 取 text 的当前值即可——提交后 textarea 被禁用，reset/next 会同时清空 submitted。
 */
const translationFeedback = computed<Record<string, unknown>>(() => ({
  referenceAnswer: result.value?.correctAnswer ?? '',
  userAnswer: text.value.trim(),
}))

/**
 * 逐词查词：点原文/译文里的单词 → 打开单词详情弹层。
 * WordToken 已清掉粘连标点，但仍可能剩下纯符号（如破折号）归一化后为空，
 * 这种直接忽略，否则会打开一个空白弹层。
 * 弹层自己负责拉数据、收藏、Esc 关闭与滚动锁，页面只管开关。
 */
const lookupWord = ref('')
const showWordDetail = ref(false)

const handleLookup = (word: string) => {
  if (!word) return
  lookupWord.value = word
  showWordDetail.value = true
}

onMounted(async () => {
  const userId = userStore.userId
  if (!userId) {
    router.push('/login')
    return
  }
  void sentenceFavorite.load()
  try {
    questions.value = await selectTranslationQuestions(userId, 5)
    // 本组翻译题共用一个结算键
    startBatch(3)
    if (questions.value.length === 0) {
      toast(t('translation.noQuestions'), 'info')
    }
  } catch (e: any) {
    toast(e?.message || t('translation.loadFailed'), 'error')
  } finally {
    loading.value = false
  }
})

const submit = async () => {
  if (!text.value.trim()) {
    toast(t('translation.emptyAnswer'), 'warning')
    return
  }
  if (!currentQuestion.value || !userStore.userId) return
  submitting.value = true
  try {
    const res = await submitTranslation({
      userId: userStore.userId,
      questionId: currentQuestion.value.id,
      userAnswer: text.value.trim(),
      moduleType: 3,
      batchKey: batchKey.value || undefined,
    })
    result.value = res
    logId.value = res.logId ?? null
    submitted.value = true
  } catch (e: any) {
    toast(e?.message || t('translation.submitFailed'), 'error')
  } finally {
    submitting.value = false
  }
}

const next = () => {
  if (currentIndex.value < questions.value.length - 1) {
    currentIndex.value++
    text.value = ''
    submitted.value = false
    result.value = null
    showHint.value = false
    logId.value = null
    // 切题时关掉查词弹层，避免弹层里还留着上一题的词
    showWordDetail.value = false
  } else {
    void finishBatch()
  }
}

/**
 * 最后一题完成后结算本组积分，再返回翻译练习入口。
 * 该页没有独立结算页，用 toast 给出本次得分与未达标原因。
 */
const finishBatch = async () => {
  await settleBatch(userStore.userId)
  const settle = batchSettle.value
  if (settle?.points && settle.points > 0) {
    toast(t('learning.practiceSettle.earned', { points: settle.points }), 'success')
  } else if (settle && !settle.qualified && !settle.reason) {
    toast(t('learning.practiceSettle.notQualified', { accuracy: settle.accuracy }), 'info')
  }
  router.push({ path: '/learning', query: { tab: 'translation' } })
}

const reset = () => {
  text.value = ''
  showHint.value = false
  submitted.value = false
  result.value = null
  logId.value = null
  showWordDetail.value = false
}

/**
 * 追问入口：打开 AI 面板并投一张翻译批改速览卡。
 * 不自动发问——预设提问会直接消耗一次模型调用，且未必是用户想问的。
 * 卡片只带 recordId，正文由 AI 卡展开时按 id 回捞。
 */
const askAi = () => {
  if (!currentQuestion.value) return
  if (!logId.value) {
    toast(t('ai.card.recordNotFound'), 'warning')
    return
  }
  aiStore.open({
    contextType: 'translation',
    questionContent: currentQuestion.value.stem,
    userAnswer: text.value.trim(),
  })
  aiStore.injectFeedback('translation', String(logId.value), true)
}

/** 收藏的是参考译文，回显须用同一文本 */
const favoriteText = computed(() => result.value?.correctAnswer ?? '')
const isReferenceFavorited = computed(() => sentenceFavorite.isFavorited(favoriteText.value))

const addReferenceToFavorites = async () => {
  if (!favoriteText.value || !userStore.userId) return
  try {
    const state = await sentenceFavorite.toggle(favoriteText.value, currentQuestion.value?.id)
    if (state === true) toast(t('translation.favoriteAdded'), 'success')
  } catch (e) {
    toast(e instanceof Error ? e.message : t('translation.favoriteFailed'), 'error')
  }
}
</script>
