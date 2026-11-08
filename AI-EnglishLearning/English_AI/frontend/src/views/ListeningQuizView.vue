<template>
  <AppLayout flush hide-top-bar>
    <template #topbar>
      <header class="h-20 sticky top-0 z-40 bg-background/80 backdrop-blur-md flex items-center justify-between px-gutter w-full max-w-[1192px] mx-auto">
        <div class="flex items-center gap-4 flex-1">
          <button
            type="button"
            class="p-2 rounded-full text-on-surface-variant hover:bg-surface-container-high/50 transition-all"
            :aria-label="$t('common.back')"
            @click="goBack"
          >
            <span class="material-symbols-outlined">arrow_back_ios_new</span>
          </button>
          <QuizProgressBar :answered="answeredCount" :total="questions.length || 5" />
        </div>
        <div class="flex items-center gap-2">
          <button
            type="button"
            class="p-2 rounded-full text-on-surface-variant hover:bg-surface-container-high/50 transition-all"
            :aria-label="appStore.isDark ? $t('topbar.switchToLight') : $t('topbar.switchToDark')"
            @click="appStore.toggleTheme"
          >
            <span class="material-symbols-outlined">{{ appStore.isDark ? 'light_mode' : 'dark_mode' }}</span>
          </button>
          <button
            type="button"
            class="p-2 rounded-full text-on-surface-variant hover:bg-surface-container-high/50 transition-all"
            :aria-label="$t('nav.settings')"
            @click="toast($t('common.comingSoon'), 'info')"
          >
            <span class="material-symbols-outlined">settings</span>
          </button>
          <div class="w-8 h-8 rounded-full bg-surface-variant flex items-center justify-center overflow-hidden">
            <span class="font-label-md text-label-md text-on-surface-variant">{{ avatarText }}</span>
          </div>
        </div>
      </header>
    </template>

    <div class="flex-1 w-full max-w-[1192px] mx-auto px-gutter py-8 pb-24 md:pb-8">
      <LoadingState v-if="loading" :message="$t('common.loading')" />
      <ErrorState
        v-else-if="loadError"
        :message="loadError"
        :action-label="$t('common.retry')"
        @retry="loadQuestions"
      />
      <EmptyState
        v-else-if="questions.length === 0"
        icon="headphones"
        :title="$t('listening.emptyTitle')"
        :description="$t('listening.emptyDescription')"
        :action-label="$t('listening.backToLearning')"
        @action="goBack"
      />

      <div v-else-if="showSummary" class="max-w-3xl mx-auto">
        <div class="bg-surface-container-lowest rounded-[24px] p-8 shadow-[0_4px_20px_rgba(51,58,72,0.05)] text-center">
          <span class="material-symbols-outlined text-icon-3xl text-primary">headphones</span>
          <h3 class="font-headline-lg text-headline-lg text-on-surface mt-4">{{ $t('listening.completeTitle') }}</h3>
          <p class="font-body-lg text-body-lg text-on-surface-variant mt-2">
            {{ $t('listening.completeSummary', { correct: correctCount, total: questions.length, rate: accuracy }) }}
          </p>
          <div class="flex flex-col sm:flex-row gap-3 justify-center mt-6">
            <button
              type="button"
              class="bg-primary text-on-primary px-6 py-3 rounded-xl font-label-lg text-label-lg hover:bg-primary/90 transition-colors"
              @click="restart"
            >{{ $t('learning.practiceAgain') }}</button>
            <button
              type="button"
              class="border border-outline-variant text-on-surface px-6 py-3 rounded-xl font-label-lg text-label-lg hover:bg-surface-variant transition-colors"
              @click="goBack"
            >{{ $t('listening.backToLearning') }}</button>
          </div>
        </div>
      </div>

      <div v-else-if="currentQuestion" class="flex flex-col lg:grid lg:grid-cols-[minmax(0,1fr)_340px] xl:grid-cols-[minmax(0,1fr)_360px] 2xl:grid-cols-[minmax(0,768px)_400px] justify-center gap-gutter flex-1">
        <section class="w-full max-w-3xl flex flex-col gap-6 min-w-0">
          <div class="bg-surface-container-lowest rounded-[24px] p-8 md:p-10 shadow-[0_4px_20px_rgba(51,58,72,0.05)] border border-outline-variant/20 relative flex flex-col">
            <div class="flex items-center justify-between mb-6">
              <div class="flex items-center gap-2">
                <span class="bg-tertiary-fixed/50 text-tertiary font-label-md text-label-md px-3 py-1 rounded-full flex items-center gap-1">
                  {{ $t('listening.questionLabel', { index: currentIndex + 1 }) }}
                  <span class="material-symbols-outlined text-[14px]">help</span>
                </span>
                <span class="bg-tertiary-container/20 text-tertiary font-label-md text-label-md px-3 py-1 rounded-full">
                  {{ typeLabel(currentQuestion.listeningType) }}
                </span>
              </div>
              <span class="bg-error text-on-error font-label-md text-label-md px-3 py-1 rounded-full shadow-sm">{{ $t('listening.newBadge') }}</span>
            </div>

            <StepIndicator :current="stepCurrent" />

            <AudioPlayer
              ref="audioRef"
              :src="currentQuestion.audioUrl || ''"
              :duration-seconds="currentQuestion.durationSeconds"
              :audio-total-seconds="currentQuestion.audioTotalSeconds"
              :audio-start-seconds="currentQuestion.audioStartSeconds"
              :audio-end-seconds="currentQuestion.audioEndSeconds"
              :question-start-seconds="currentQuestion.questionStartSeconds"
              :question-end-seconds="currentQuestion.questionEndSeconds"
              :disabled="submitting"
              @timeupdate="handleAudioTime"
              @error="handleAudioError"
            />

            <div class="mt-6">
              <div class="flex items-center justify-between mb-4">
                <div class="flex items-center gap-2">
                  <span class="material-symbols-outlined text-primary text-[20px]">quiz</span>
                  <span class="font-label-lg text-label-lg text-on-surface">{{ $t('listening.chooseAnswer') }}</span>
                </div>
                <button
                  type="button"
                  class="flex items-center gap-1.5 bg-primary-container/15 text-primary px-3 py-1.5 rounded-full font-label-md text-label-md hover:bg-primary-container/25 transition-colors"
                  @click="showHint = !showHint"
                >
                  <span class="material-symbols-outlined text-[16px]">lightbulb</span>{{ $t('listening.viewHint') }}
                </button>
              </div>
              <p v-if="showHint" class="mb-3 font-body-md text-body-md text-on-surface-variant bg-primary-container/10 rounded-xl p-3">
                {{ $t('listening.hintText') }}
              </p>

              <div class="grid grid-cols-1 gap-3">
                <button
                  v-for="option in parsedOptions"
                  :key="option.key"
                  type="button"
                  class="w-full text-left border-2 rounded-[16px] p-4 transition-all flex items-center gap-3"
                  :class="optionClass(option.key)"
                  :disabled="showResult || submitting"
                  @click="selectedAnswer = option.key"
                >
                  <span class="w-8 h-8 rounded-full flex items-center justify-center font-label-lg text-label-lg font-bold transition-colors" :class="optionKeyClass(option.key)">
                    {{ option.key }}
                  </span>
                  <span class="font-body-md text-body-md text-on-surface">{{ option.text }}</span>
                  <span v-if="showResult && submitResult?.correctAnswerKey === option.key" class="material-symbols-outlined text-tertiary ml-auto">check</span>
                  <span v-else-if="showResult && selectedAnswer === option.key && !submitResult?.isCorrect" class="material-symbols-outlined text-error ml-auto">close</span>
                </button>
              </div>
            </div>

            <div class="font-label-md text-label-md text-outline-variant pt-6">{{ sourceLabel }}</div>
          </div>

          <div class="flex items-center gap-3 mt-auto">
            <button
              type="button"
              class="flex-1 bg-gradient-to-r from-primary to-primary-fixed-dim text-on-primary py-4 rounded-[16px] font-label-lg text-label-lg flex items-center justify-center gap-2 hover:opacity-90 transition-opacity shadow-[0_4px_14px_rgba(103,85,140,0.25)]"
              @click="toggleRate"
            >
              <span class="material-symbols-outlined">speed</span>{{ playbackRate === 1 ? $t('listening.realSpeed') : '1.25x' }}
            </button>
            <button
              type="button"
              class="flex-1 bg-gradient-to-r from-secondary to-secondary-fixed-dim text-on-secondary py-4 rounded-[16px] font-label-lg text-label-lg flex items-center justify-center gap-2 hover:opacity-90 transition-opacity shadow-[0_4px_14px_rgba(12,103,128,0.25)]"
              @click="replayCurrent"
            >
              <span class="material-symbols-outlined">replay</span>{{ $t('listening.replay') }}
            </button>
            <button
              type="button"
              class="flex-1 bg-gradient-to-r from-tertiary to-tertiary-fixed-dim text-on-tertiary py-4 rounded-[16px] font-label-lg text-label-lg flex items-center justify-center gap-2 hover:opacity-90 transition-opacity shadow-[0_4px_14px_rgba(0,110,32,0.25)] disabled:opacity-60"
              :disabled="submitting"
              @click="handleNext"
            >
              <span class="material-symbols-outlined">{{ showResult ? 'arrow_forward' : 'check' }}</span>
              {{ showResult ? (isLastQuestion ? $t('learning.viewResults') : $t('learning.next')) : (submitting ? $t('common.loading') : $t('listening.submitAnswer')) }}
            </button>
          </div>
        </section>

        <aside class="w-full min-w-0 flex flex-col gap-4">
          <div class="flex items-center gap-2 mb-2">
            <span class="material-symbols-outlined text-tertiary">headphones</span>
            <h3 class="font-headline-md text-headline-md text-on-surface">{{ $t('listening.aiFeedback') }}</h3>
          </div>

          <FeedbackPanel
            :status="feedbackStatus"
            :message="feedbackMessage"
            :tags="feedbackTags"
            :show-favorite="showResult"
            @favorite="favoriteCurrent"
          />

          <TranscriptPanel
            :locked="!showResult"
            :transcript="currentContent?.transcript"
            :lrc-content="currentContent?.lrcContent"
            :current-time="audioAbsoluteTime"
            :range-start="currentQuestion.audioStartSeconds || 0"
            :range-end="currentQuestion.audioEndSeconds || currentQuestion.audioTotalSeconds || 0"
            @seek="handleTranscriptSeek"
            @favorite="favoriteCurrent"
          />

          <div class="bg-tertiary-container/15 rounded-[20px] p-5 border border-tertiary/20">
            <div class="flex items-center gap-2 mb-3">
              <span class="material-symbols-outlined text-tertiary text-[20px]">bookmark</span>
              <span class="font-label-lg text-label-lg text-tertiary">{{ $t('listening.corePhrases') }}</span>
            </div>
            <p class="font-body-md text-body-md text-on-surface-variant">{{ $t('listening.corePhrasesEmpty') }}</p>
          </div>
        </aside>
      </div>
    </div>
  </AppLayout>
</template>

<script setup lang="ts">
import { computed, nextTick, onMounted, ref } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { useI18n } from 'vue-i18n'
import AppLayout from '../components/AppLayout.vue'
import AudioPlayer from '../components/AudioPlayer.vue'
import StepIndicator from '../components/listening/StepIndicator.vue'
import FeedbackPanel from '../components/listening/FeedbackPanel.vue'
import TranscriptPanel from '../components/listening/TranscriptPanel.vue'
import QuizProgressBar from '../components/quiz/QuizProgressBar.vue'
import LoadingState from '../components/ui/LoadingState.vue'
import EmptyState from '../components/ui/EmptyState.vue'
import ErrorState from '../components/ui/ErrorState.vue'
import { useUserStore } from '../stores/user'
import { useAppStore } from '../stores/app'
import { useToast } from '../composables/useToast'
import {
  addFavorite,
  selectListeningQuestions,
  submitListeningAnswer,
  type QuestionVO,
  type SubmitResponse,
} from '../api/exercise'

interface ParsedOption {
  key: string
  text: string
}

interface SubmittedContent {
  transcript?: string
  lrcContent?: string
}

const route = useRoute()
const router = useRouter()
const { t } = useI18n()
const { show: toast } = useToast()
const userStore = useUserStore()
const appStore = useAppStore()

const audioRef = ref<InstanceType<typeof AudioPlayer> | null>(null)
const questions = ref<QuestionVO[]>([])
const currentIndex = ref(0)
const selectedAnswer = ref('')
const showResult = ref(false)
const submitResult = ref<SubmitResponse | null>(null)
const submitting = ref(false)
const loading = ref(false)
const loadError = ref('')
const showSummary = ref(false)
const showHint = ref(false)
const results = ref<{ questionId: number; isCorrect: boolean }[]>([])
const submittedContent = ref<Record<number, SubmittedContent>>({})
const audioAbsoluteTime = ref(0)
const playbackRate = ref(1)

const currentQuestion = computed(() => questions.value[currentIndex.value])
const currentContent = computed(() => {
  const id = currentQuestion.value?.id
  return id == null ? undefined : submittedContent.value[id]
})
const isLastQuestion = computed(() => currentIndex.value >= questions.value.length - 1)
const correctCount = computed(() => results.value.filter(item => item.isCorrect).length)
const answeredCount = computed(() => results.value.length)
const accuracy = computed(() => questions.value.length === 0 ? 0 : Math.round((correctCount.value / questions.value.length) * 100))
const avatarText = computed(() => (userStore.username || 'U').slice(0, 1).toUpperCase())
const stepCurrent = computed(() => (showResult.value || selectedAnswer.value ? 3 : 2))

const typeKeys: Record<string, string> = {
  SHORT_DIALOGUE: 'listening.typeShortDialogue',
  LONG_DIALOGUE: 'listening.typeLongDialogue',
  PASSAGE: 'listening.typePassage',
  LECTURE: 'listening.typeLecture',
  NEWS: 'listening.typeNews',
  OTHER: 'listening.typeOther',
}
const typeLabel = (type?: string) => (type && typeKeys[type] ? t(typeKeys[type]) : t('listening.typeOther'))

const sourceLabel = computed(() => {
  const group = currentQuestion.value?.groupKey || ''
  const exam = group.startsWith('cet6-2022-12-1') ? '2022.12 CET6' : t('listening.practiceTitle')
  return `[${t('listening.source')}] ${exam} · ${typeLabel(currentQuestion.value?.listeningType)}`
})

const feedbackStatus = computed<'idle' | 'correct' | 'incorrect'>(() => {
  if (!showResult.value) return 'idle'
  return submitResult.value?.isCorrect ? 'correct' : 'incorrect'
})
const feedbackMessage = computed(() => {
  if (!showResult.value) return t('listening.feedbackPending')
  return submitResult.value?.analysis || submitResult.value?.heuristicHint || ''
})
const feedbackTags = computed(() => [typeLabel(currentQuestion.value?.listeningType), t('listening.title')])

const parsedOptions = computed<ParsedOption[]>(() => {
  const options = currentQuestion.value?.options
  if (!options) return []
  try {
    const parsed: unknown = JSON.parse(options)
    if (Array.isArray(parsed)) {
      return parsed.map((item, index) => {
        const text = String(item)
        const match = text.match(/^([A-D])(?:[.、)）]|\s+)\s*(.+)$/)
        if (match) return { key: match[1], text: match[2].trim() }
        return { key: String.fromCharCode(65 + index), text: text.trim() }
      })
    }
    if (parsed && typeof parsed === 'object') {
      return Object.entries(parsed as Record<string, unknown>).map(([key, value]) => ({
        key,
        text: String(value).replace(/^[A-D](?:[.、)）]|\s+)\s*/, '').trim(),
      }))
    }
    return []
  } catch {
    return []
  }
})

const optionClass = (key: string) => {
  if (showResult.value) {
    if (submitResult.value?.correctAnswerKey === key) return 'border-tertiary bg-tertiary-container/10'
    if (selectedAnswer.value === key && !submitResult.value?.isCorrect) return 'border-error bg-error-container/20'
  }
  if (selectedAnswer.value === key) return 'border-tertiary bg-tertiary-container/10'
  return 'border-outline-variant/30 hover:border-tertiary/50'
}

const optionKeyClass = (key: string) => {
  if (showResult.value && submitResult.value?.correctAnswerKey === key) return 'bg-tertiary text-on-tertiary'
  if (showResult.value && selectedAnswer.value === key && !submitResult.value?.isCorrect) return 'bg-error text-on-error'
  if (selectedAnswer.value === key) return 'bg-tertiary text-on-tertiary'
  return 'bg-surface-variant/50 text-on-surface-variant'
}

const errorMessage = (error: unknown, fallback: string) => (error instanceof Error && error.message ? error.message : fallback)

const loadQuestions = async () => {
  const userId = userStore.userId
  if (!userId) {
    toast(t('learning.pleaseLogin'), 'warning')
    router.push('/login')
    return
  }
  loading.value = true
  loadError.value = ''
  try {
    const type = typeof route.query.type === 'string' ? route.query.type : ''
    questions.value = await selectListeningQuestions(userId, 5, type || undefined)
    currentIndex.value = 0
    selectedAnswer.value = ''
    showResult.value = false
    submitResult.value = null
    showSummary.value = false
    results.value = []
    submittedContent.value = {}
    audioAbsoluteTime.value = 0
  } catch (error) {
    loadError.value = errorMessage(error, t('listening.loadError'))
  } finally {
    loading.value = false
  }
}

const handleAudioTime = (payload: { absoluteTime: number }) => {
  audioAbsoluteTime.value = payload.absoluteTime
}

const submitCurrentAnswer = async () => {
  const question = currentQuestion.value
  const userId = userStore.userId
  if (!question || !userId || !selectedAnswer.value || submitting.value) return
  submitting.value = true
  try {
    const response = await submitListeningAnswer({
      userId,
      questionId: question.id,
      userAnswer: selectedAnswer.value,
      durationSeconds: 1,
    })
    submitResult.value = response
    showResult.value = true
    results.value.push({ questionId: question.id, isCorrect: response.isCorrect })
    submittedContent.value = {
      ...submittedContent.value,
      [question.id]: { transcript: response.transcript, lrcContent: response.lrcContent },
    }
  } catch (error) {
    toast(errorMessage(error, t('listening.submitError')), 'error')
  } finally {
    submitting.value = false
  }
}

const handleNext = async () => {
  if (!showResult.value) {
    if (!selectedAnswer.value) {
      toast(t('listening.pleaseSelect'), 'warning')
      return
    }
    await submitCurrentAnswer()
    return
  }
  if (isLastQuestion.value) {
    showSummary.value = true
    return
  }
  currentIndex.value += 1
  selectedAnswer.value = ''
  showResult.value = false
  submitResult.value = null
  showHint.value = false
  audioAbsoluteTime.value = 0
}

const replayCurrent = () => {
  audioRef.value?.replay()
}

const toggleRate = () => {
  playbackRate.value = playbackRate.value === 1 ? 1.25 : 1
  audioRef.value?.setPlaybackRate(playbackRate.value)
}

const handleTranscriptSeek = (seconds: number) => {
  audioRef.value?.setRange('article')
  void nextTick(() => audioRef.value?.seekToAbsolute(seconds))
}

const favoriteCurrent = async () => {
  const question = currentQuestion.value
  const userId = userStore.userId
  if (!question || !userId) return
  const sentence = currentContent.value?.transcript || question.stem
  try {
    await addFavorite({ userId, sentenceText: sentence, questionId: question.id })
    toast(t('listening.favorited'), 'success')
  } catch {
    toast(t('listening.favoriteFailed'), 'error')
  }
}

const handleAudioError = (message: string) => toast(message || t('listening.audioError'), 'warning')
const restart = () => void loadQuestions()
const goBack = () => router.push({ path: '/learning', query: { tab: 'listening' } })

onMounted(() => {
  void loadQuestions()
})
</script>
