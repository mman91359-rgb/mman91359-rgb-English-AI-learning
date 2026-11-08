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
        <span class="material-symbols-outlined text-[48px] animate-spin">progress_activity</span>
        <p class="font-body-lg">{{ $t('common.loading') }}</p>
      </div>

      <div v-else-if="!currentQuestion" class="flex flex-col items-center justify-center py-24 gap-4">
        <span class="material-symbols-outlined text-[48px] text-outline-variant">translate</span>
        <p class="font-body-lg text-on-surface-variant">{{ $t('translation.noQuestions') }}</p>
        <button type="button" class="px-6 py-3 bg-primary text-on-primary rounded-full font-label-lg" @click="router.push({ path: '/learning', query: { tab: 'translation' } })">
          {{ $t('common.back') }}
        </button>
      </div>

      <div v-else class="flex flex-col lg:grid lg:grid-cols-[minmax(0,1fr)_340px] xl:grid-cols-[minmax(0,1fr)_360px] 2xl:grid-cols-[minmax(0,768px)_400px] justify-center gap-gutter flex-1">
        <section class="w-full max-w-3xl flex flex-col gap-6 min-w-0">
          <div class="bg-surface-container-lowest rounded-[24px] p-8 md:p-10 shadow-[0_4px_20px_rgba(51,58,72,0.05)] border border-outline-variant/20 relative flex flex-col">
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
              <span class="material-symbols-outlined text-secondary text-[18px]">menu_book</span>
              <span class="font-label-md text-label-md text-on-surface-variant">{{ $t('translation.sourceLabel') }}</span>
            </div>

            <div class="bg-secondary-container/10 rounded-[16px] p-6 mb-6">
              <div class="flex items-center gap-2 mb-3">
                <span class="material-symbols-outlined text-secondary text-[20px]">translate</span>
                <span class="font-label-lg text-label-lg text-secondary">{{ $t('translation.translatePrompt') }}</span>
              </div>
              <p class="font-headline-md text-headline-md text-on-surface leading-relaxed">{{ currentQuestion.stem }}</p>
            </div>

            <div class="flex flex-col gap-2 flex-1">
              <div class="flex items-center gap-2">
                <span class="material-symbols-outlined text-primary text-[20px]">edit</span>
                <span class="font-label-lg text-label-lg text-on-surface-variant">{{ $t('translation.yourTranslation') }}</span>
              </div>
              <textarea
                v-model="text"
                :disabled="submitted"
                class="w-full min-h-[140px] bg-surface-container-low border-2 border-outline-variant/30 focus:border-secondary focus:ring-0 focus:outline-none rounded-[16px] p-4 font-body-lg text-body-lg text-on-surface resize-none transition-colors placeholder-outline-variant/40 disabled:opacity-70"
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
              <span class="material-symbols-outlined text-[18px]">lightbulb</span>{{ $t('translation.viewHint') }}
            </button>
          </div>

          <div class="flex items-center gap-3 mt-auto">
            <button
              v-if="!submitted"
              type="button"
              class="flex-1 bg-gradient-to-r from-primary to-primary-fixed-dim text-on-primary py-4 rounded-[16px] font-label-lg text-label-lg flex items-center justify-center gap-2 hover:opacity-90 transition-opacity shadow-[0_4px_14px_rgba(103,85,140,0.25)] disabled:opacity-60"
              :disabled="submitting"
              @click="submit"
            >
              <span class="material-symbols-outlined">{{ submitting ? 'progress_activity' : 'arrow_forward' }}</span>
              {{ submitting ? $t('common.loading') : $t('translation.submit') }}
            </button>
            <button
              v-else
              type="button"
              class="flex-1 bg-gradient-to-r from-tertiary to-tertiary-fixed-dim text-on-tertiary py-4 rounded-[16px] font-label-lg text-label-lg flex items-center justify-center gap-2 hover:opacity-90 transition-opacity shadow-[0_4px_14px_rgba(0,110,32,0.25)]"
              @click="next"
            >
              <span class="material-symbols-outlined">arrow_forward</span>{{ currentIndex < questions.length - 1 ? $t('translation.nextQuestion') : $t('translation.finish') }}
            </button>
            <button
              v-if="!submitted"
              type="button"
              class="flex-1 bg-gradient-to-r from-secondary to-secondary-fixed-dim text-on-secondary py-4 rounded-[16px] font-label-lg text-label-lg flex items-center justify-center gap-2 hover:opacity-90 transition-opacity shadow-[0_4px_14px_rgba(12,103,128,0.25)]"
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
            :show-favorite="submitted"
            @favorite="addReferenceToFavorites"
          />

          <div v-if="submitted" class="bg-surface-container-lowest rounded-[20px] p-5 shadow-[0_4px_20px_rgba(51,58,72,0.05)] border border-outline-variant/20">
            <div class="flex items-center gap-2 mb-3">
              <span class="material-symbols-outlined text-secondary text-[20px]">lightbulb</span>
              <span class="font-label-lg text-label-lg text-on-surface">{{ $t('translation.reference') }}</span>
            </div>
            <p class="font-body-lg text-body-lg text-on-surface leading-relaxed">{{ result?.correctAnswer }}</p>
          </div>

          <div v-if="submitted && result?.suggestions?.length" class="bg-tertiary-container/15 rounded-[20px] p-5 border border-tertiary/20">
            <div class="flex items-center gap-2 mb-3">
              <span class="material-symbols-outlined text-tertiary text-[20px]">bookmark</span>
              <span class="font-label-lg text-label-lg text-tertiary">{{ $t('translation.suggestions') }}</span>
            </div>
            <ul class="space-y-2">
              <li v-for="(s, i) in result.suggestions" :key="i" class="font-body-md text-body-md text-on-surface">{{ s }}</li>
            </ul>
          </div>
        </aside>
      </div>
    </div>
  </AppLayout>
</template>

<script setup lang="ts">
import { computed, onMounted, ref } from 'vue'
import { useRouter } from 'vue-router'
import { useI18n } from 'vue-i18n'
import AppLayout from '../components/AppLayout.vue'
import FeedbackPanel from '../components/listening/FeedbackPanel.vue'
import QuizProgressBar from '../components/quiz/QuizProgressBar.vue'
import { useToast } from '../composables/useToast'
import { useUserStore } from '../stores/user'
import { selectTranslationQuestions, submitTranslation, isPassageTranslation } from '../api/translation'
import { addFavorite } from '../api/exercise'
import type { QuestionVO } from '../api/exercise'
import type { SubmitResponse } from '../api/exercise'
import { btnIcon } from '@/components/ui/buttonStyles'

const router = useRouter()
const { t } = useI18n()
const { show: toast } = useToast()
const userStore = useUserStore()

const questions = ref<QuestionVO[]>([])
const currentIndex = ref(0)
const text = ref('')
const showHint = ref(false)
const submitted = ref(false)
const submitting = ref(false)
const loading = ref(true)
const result = ref<SubmitResponse | null>(null)

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

onMounted(async () => {
  const userId = userStore.userId
  if (!userId) {
    router.push('/login')
    return
  }
  try {
    questions.value = await selectTranslationQuestions(userId, 5)
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
    })
    result.value = res
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
  } else {
    router.push({ path: '/learning', query: { tab: 'translation' } })
  }
}

const reset = () => {
  text.value = ''
  showHint.value = false
  submitted.value = false
  result.value = null
}

const addReferenceToFavorites = async () => {
  if (!result.value?.correctAnswer || !userStore.userId) return
  try {
    await addFavorite({
      userId: userStore.userId,
      sentenceText: result.value.correctAnswer,
      questionId: currentQuestion.value?.id,
    })
    toast(t('translation.favoriteAdded'), 'success')
  } catch (e: any) {
    toast(e?.message || t('translation.favoriteFailed'), 'error')
  }
}
</script>
