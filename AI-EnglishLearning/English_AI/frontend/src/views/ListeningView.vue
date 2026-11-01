<template>
  <AppLayout>
    <div class="flex items-center gap-4 mb-6">
      <button
        type="button"
        class="p-2 hover:bg-surface-variant rounded-full transition-colors"
        :aria-label="$t('common.back')"
        @click="goBack"
      >
        <span class="material-symbols-outlined text-on-surface">arrow_back</span>
      </button>
      <div class="flex-1 min-w-0">
        <h2 class="font-headline-lg text-headline-lg text-on-surface">{{ $t('listening.title') }}</h2>
        <p class="font-body-md text-body-md text-on-surface-variant mt-1">
          {{ mode === 'quiz' ? $t('listening.progressLabel', { current: currentIndex + 1, total: questions.length }) : $t('listening.subtitle') }}
        </p>
      </div>
      <div v-if="mode === 'quiz'" class="text-right">
        <p class="font-label-md text-label-md text-on-surface-variant">{{ $t('listening.correctCount') }}</p>
        <p class="font-headline-md text-headline-md text-primary">{{ correctCount }} / {{ results.length }}</p>
      </div>
    </div>

    <LoadingState v-if="loading" :message="$t('common.loading')" />

    <ErrorState
      v-else-if="loadError"
      :message="loadError"
      :action-label="$t('common.retry')"
      @retry="loadQuestions"
    />

    <template v-else-if="mode === 'list'">
      <div v-if="stats" class="mb-6 bg-surface rounded-[24px] p-5 shadow-soft-glow flex items-center justify-between">
        <div>
          <p class="font-label-md text-label-md text-on-surface-variant">{{ $t('listening.overallAccuracy') }}</p>
          <p class="font-headline-md text-headline-md text-primary mt-1">{{ stats.correctRate }}%</p>
        </div>
        <div class="text-right font-label-md text-label-md text-on-surface-variant">
          <p>{{ $t('listening.answeredCount', { count: stats.totalAnswered }) }}</p>
          <p class="mt-1">{{ $t('listening.correctCountLabel', { count: stats.correctCount }) }}</p>
        </div>
      </div>

      <div class="mb-6">
        <p class="font-label-md text-label-md text-on-surface-variant mb-3">{{ $t('listening.typeFilter') }}</p>
        <div class="flex flex-wrap gap-2">
          <button
            v-for="option in typeOptions"
            :key="option.value"
            type="button"
            class="inline-flex items-center gap-2 px-4 py-2 rounded-full font-label-lg text-label-lg transition-colors"
            :class="selectedType === option.value
              ? 'bg-primary text-on-primary'
              : 'bg-surface-container-high text-on-surface-variant hover:text-primary'"
            @click="selectType(option.value)"
          >
            <span class="material-symbols-outlined text-[18px]">{{ option.icon }}</span>
            {{ option.label }}
          </button>
        </div>
      </div>

      <div v-if="questions.length === 0">
        <EmptyState
          icon="headphones"
          :title="$t('listening.emptyTitle')"
          :description="$t('listening.emptyDescription')"
          :action-label="$t('listening.backToLearning')"
          @action="goBack"
        />
      </div>

      <div v-else class="grid grid-cols-1 md:grid-cols-2 gap-4">
        <button
          v-for="(question, index) in questions"
          :key="question.id"
          type="button"
          class="text-left bg-surface rounded-[24px] p-6 shadow-soft-glow hover:shadow-[0_4px_20px_rgba(51,58,72,0.15)] transition-shadow"
          @click="startQuiz(index)"
        >
          <div class="flex items-center gap-2 mb-3">
            <span class="w-10 h-10 rounded-full bg-primary-container/30 flex items-center justify-center">
              <span class="material-symbols-outlined text-primary">headphones</span>
            </span>
            <span class="rounded-full bg-primary-container/20 text-primary px-2.5 py-1 font-label-md text-label-md">
              {{ typeLabel(question.listeningType) }}
            </span>
            <span class="font-label-md text-label-md text-on-surface-variant">Lv.{{ question.difficultyLevel }}</span>
            <span v-if="question.durationSeconds" class="ml-auto font-label-md text-label-md text-on-surface-variant">
              {{ formatDuration(question.durationSeconds) }}
            </span>
          </div>
          <p class="font-body-lg text-body-lg text-on-surface leading-relaxed">{{ question.stem }}</p>
          <p class="mt-3 font-label-md text-label-md text-primary">{{ $t('listening.startQuestion') }} →</p>
        </button>
      </div>
    </template>

    <div v-else-if="mode === 'quiz' && currentQuestion" class="grid grid-cols-1 lg:grid-cols-[minmax(0,1fr)_380px] gap-6 items-start">
      <div class="min-w-0">
        <div class="bg-surface rounded-2xl p-6 md:p-8 shadow-soft-glow mb-5">
          <div class="flex flex-wrap items-center gap-2 mb-3">
            <span class="rounded-full bg-primary-container/20 text-primary px-3 py-1 font-label-md text-label-md">
              {{ $t('listening.questionLabel', { index: currentIndex + 1 }) }}
            </span>
            <span class="rounded-full bg-tertiary-fixed/50 text-tertiary px-3 py-1 font-label-md text-label-md">
              {{ typeLabel(currentQuestion.listeningType) }}
            </span>
            <span class="font-label-md text-label-md text-on-surface-variant">Lv.{{ currentQuestion.difficultyLevel }}</span>
          </div>
          <p class="font-body-lg text-body-lg text-on-surface leading-relaxed">{{ currentQuestion.stem }}</p>
        </div>

        <AudioPlayer
          :key="currentQuestion.groupKey || 'q-' + currentQuestion.id"
          :src="currentQuestion.audioUrl || ''"
          :duration-seconds="currentQuestion.durationSeconds"
          :audio-total-seconds="currentQuestion.audioTotalSeconds"
          :audio-start-seconds="currentQuestion.audioStartSeconds"
          :audio-end-seconds="currentQuestion.audioEndSeconds"
          :question-start-seconds="currentQuestion.questionStartSeconds"
          :question-end-seconds="currentQuestion.questionEndSeconds"
          :transcript="submittedContent[currentQuestion.id]?.transcript || ''"
          :lrc-content="submittedContent[currentQuestion.id]?.lrcContent || ''"
          :disabled="submitting"
          @error="handleAudioError"
        />

        <div class="mt-5 space-y-3">
          <button
            v-for="option in parsedOptions"
            :key="option.key"
            type="button"
            class="w-full text-left p-4 md:p-5 rounded-xl border-2 transition-all font-body-md text-body-md"
            :class="optionClass(option.key)"
            :disabled="showResult || submitting"
            @click="selectAnswer(option.key)"
          >
            <div class="flex items-center gap-3">
              <span class="w-8 h-8 rounded-full flex items-center justify-center font-label-lg text-label-lg shrink-0" :class="optionKeyClass(option.key)">
                {{ option.key }}
              </span>
              <span class="flex-1">{{ option.text }}</span>
              <span v-if="showResult && submitResult?.correctAnswerKey === option.key" class="material-symbols-outlined text-green-600">check</span>
              <span v-else-if="showResult && selectedAnswer === option.key && !submitResult?.isCorrect" class="material-symbols-outlined text-red-500">close</span>
            </div>
          </button>
        </div>

        <button
          v-if="!showResult"
          type="button"
          class="w-full mt-5 bg-primary text-on-primary py-4 rounded-xl font-label-lg text-label-lg hover:bg-primary/90 transition-colors disabled:opacity-50 disabled:cursor-not-allowed"
          :disabled="!selectedAnswer || submitting"
          @click="submitCurrentAnswer"
        >
          {{ submitting ? $t('common.loading') : $t('learning.submit') }}
        </button>
      </div>

      <aside class="space-y-4 lg:sticky lg:top-24">
        <div v-if="!showResult" class="bg-surface rounded-2xl p-5 shadow-soft-glow">
          <div class="flex items-center gap-2 mb-3">
            <span class="material-symbols-outlined text-tertiary">tips_and_updates</span>
            <h3 class="font-headline-md text-headline-md text-on-surface">{{ $t('listening.howToListen') }}</h3>
          </div>
          <ol class="space-y-2 font-body-md text-body-md text-on-surface-variant list-decimal list-inside">
            <li>{{ $t('listening.stepArticle') }}</li>
            <li>{{ $t('listening.stepQuestion') }}</li>
            <li>{{ $t('listening.stepAnswer') }}</li>
          </ol>
          <p class="mt-4 font-label-md text-label-md text-on-surface-variant">
            {{ $t('listening.audioHint') }}
          </p>
        </div>

        <div v-else class="bg-surface rounded-2xl p-5 shadow-soft-glow">
          <div
            class="p-3 rounded-xl font-label-lg text-label-lg text-center mb-4"
            :class="submitResult?.isCorrect ? 'bg-green-50 text-green-700' : 'bg-red-50 text-red-700'"
          >
            <span class="material-symbols-outlined align-middle mr-1">{{ submitResult?.isCorrect ? 'check_circle' : 'cancel' }}</span>
            {{ submitResult?.isCorrect ? $t('learning.correct') : $t('learning.incorrect') }}
          </div>

          <div v-if="submitResult?.correctAnswer" class="mb-3">
            <p class="font-label-md text-label-md text-on-surface-variant mb-1">{{ $t('learning.correctAnswer') }}</p>
            <p class="font-body-md text-body-md text-primary font-semibold">
              {{ submitResult.correctAnswerKey || submitResult.correctAnswer }}
            </p>
          </div>

          <div v-if="submitResult?.analysis" class="mb-4">
            <p class="font-label-md text-label-md text-on-surface-variant mb-1">{{ $t('learning.analysis') }}</p>
            <p class="font-body-md text-body-md text-on-surface leading-relaxed">{{ submitResult.analysis }}</p>
          </div>

          <p v-if="submitResult?.heuristicHint" class="font-body-md text-body-md text-on-surface-variant mb-4">
            {{ submitResult.heuristicHint }}
          </p>

          <button
            type="button"
            class="w-full bg-primary text-on-primary py-3 rounded-xl font-label-lg text-label-lg hover:bg-primary/90 transition-colors"
            @click="nextQuestion"
          >
            {{ isLastQuestion ? $t('learning.viewResults') : $t('learning.next') }}
          </button>
        </div>
      </aside>
    </div>

    <div v-else-if="mode === 'summary'" class="max-w-3xl mx-auto">
      <div class="bg-surface rounded-[24px] p-8 shadow-soft-glow text-center mb-8">
        <span class="material-symbols-outlined text-5xl text-primary">headphones</span>
        <h3 class="font-headline-lg text-headline-lg text-on-surface mt-4">{{ $t('listening.completeTitle') }}</h3>
        <p class="font-body-lg text-body-lg text-on-surface-variant mt-2">
          {{ $t('listening.completeSummary', { correct: correctCount, total: questions.length, rate: accuracy }) }}
        </p>
        <div class="flex flex-col sm:flex-row gap-3 justify-center mt-6">
          <button
            type="button"
            class="bg-primary text-on-primary px-6 py-3 rounded-xl font-label-lg text-label-lg hover:bg-primary/90 transition-colors"
            @click="restart"
          >
            {{ $t('learning.practiceAgain') }}
          </button>
          <button
            type="button"
            class="border border-outline-variant text-on-surface px-6 py-3 rounded-xl font-label-lg text-label-lg hover:bg-surface-variant transition-colors"
            @click="goBack"
          >
            {{ $t('listening.backToLearning') }}
          </button>
        </div>
      </div>
    </div>
  </AppLayout>
</template>

<script setup lang="ts">
import { computed, onMounted, ref } from 'vue'
import { useRouter } from 'vue-router'
import { useI18n } from 'vue-i18n'
import AppLayout from '../components/AppLayout.vue'
import AudioPlayer from '../components/AudioPlayer.vue'
import LoadingState from '../components/ui/LoadingState.vue'
import EmptyState from '../components/ui/EmptyState.vue'
import ErrorState from '../components/ui/ErrorState.vue'
import { useUserStore } from '../stores/user'
import { useToast } from '../composables/useToast'
import {
  getListeningStats,
  selectListeningQuestions,
  submitListeningAnswer,
  type ListeningStats,
  type QuestionVO,
  type SubmitResponse,
} from '../api/exercise'

interface ParsedOption {
  key: string
  text: string
}

interface QuestionResult {
  questionId: number
  isCorrect: boolean
}

interface SubmittedContent {
  transcript?: string
  lrcContent?: string
}

const router = useRouter()
const { t } = useI18n()
const { show: toast } = useToast()
const userStore = useUserStore()

const mode = ref<'list' | 'quiz' | 'summary'>('list')
const questions = ref<QuestionVO[]>([])
const currentIndex = ref(0)
const selectedAnswer = ref('')
const showResult = ref(false)
const submitResult = ref<SubmitResponse | null>(null)
const submitting = ref(false)
const loading = ref(false)
const loadError = ref('')
const stats = ref<ListeningStats | null>(null)
const results = ref<QuestionResult[]>([])
const submittedContent = ref<Record<number, SubmittedContent>>({})
const selectedType = ref('')
const questionStartedAt = ref(Date.now())

const currentQuestion = computed(() => questions.value[currentIndex.value])
const isLastQuestion = computed(() => currentIndex.value >= questions.value.length - 1)
const correctCount = computed(() => results.value.filter(item => item.isCorrect).length)
const accuracy = computed(() => {
  if (questions.value.length === 0) return 0
  return Math.round((correctCount.value / questions.value.length) * 100)
})

const typeOptions = computed(() => [
  { value: '', label: t('listening.typeAll'), icon: 'apps' },
  { value: 'SHORT_DIALOGUE', label: t('listening.typeShortDialogue'), icon: 'chat' },
  { value: 'LONG_DIALOGUE', label: t('listening.typeLongDialogue'), icon: 'record_voice_over' },
  { value: 'PASSAGE', label: t('listening.typePassage'), icon: 'menu_book' },
  { value: 'LECTURE', label: t('listening.typeLecture'), icon: 'podcasts' },
  { value: 'NEWS', label: t('listening.typeNews'), icon: 'newspaper' },
  { value: 'OTHER', label: t('listening.typeOther'), icon: 'category' },
])

const parsedOptions = computed<ParsedOption[]>(() => {
  const options = currentQuestion.value?.options
  if (!options) return []
  try {
    const parsed: unknown = JSON.parse(options)
    if (Array.isArray(parsed)) {
      return parsed.map((item, index) => {
        const text = String(item)
        const match = text.match(/^([A-D])[.\s]*\s*(.+)/)
        if (match) return { key: match[1], text: match[2].trim() }
        return { key: String.fromCharCode(65 + index), text: text.trim() }
      })
    }
    if (parsed && typeof parsed === 'object') {
      return Object.entries(parsed as Record<string, unknown>).map(([key, value]) => ({
        key,
        text: String(value).replace(/^[A-D][.\s]*\s*/, '').trim(),
      }))
    }
    return []
  } catch {
    return []
  }
})

const typeLabel = (type?: string) => {
  if (!type) return t('listening.typeOther')
  const option = typeOptions.value.find(item => item.value === type)
  return option?.label || type
}

const formatDuration = (seconds: number) => {
  const total = Math.max(0, Math.round(seconds))
  const minutes = Math.floor(total / 60)
  const remain = total % 60
  return `${String(minutes).padStart(2, '0')}:${String(remain).padStart(2, '0')}`
}

const optionClass = (key: string) => {
  if (showResult.value) {
    if (submitResult.value?.correctAnswerKey === key) {
      return 'border-green-500 bg-green-50 text-green-800'
    }
    if (selectedAnswer.value === key && !submitResult.value?.isCorrect) {
      return 'border-red-400 bg-red-50 text-red-700'
    }
  }
  if (selectedAnswer.value === key) {
    return 'border-primary bg-primary-container/20 text-primary'
  }
  return 'border-outline-variant/30 hover:border-primary/50 text-on-surface'
}

const optionKeyClass = (key: string) => {
  if (showResult.value && submitResult.value?.correctAnswerKey === key) {
    return 'bg-green-500 text-white'
  }
  if (showResult.value && selectedAnswer.value === key && !submitResult.value?.isCorrect) {
    return 'bg-red-400 text-white'
  }
  if (selectedAnswer.value === key) {
    return 'bg-primary text-on-primary'
  }
  return 'bg-surface-container-high text-on-surface-variant'
}

const errorMessage = (error: unknown, fallback: string) => {
  return error instanceof Error && error.message ? error.message : fallback
}

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
    questions.value = await selectListeningQuestions(userId, 5, selectedType.value || undefined)
    results.value = []
    submittedContent.value = {}
    currentIndex.value = 0
    mode.value = 'list'
    try {
      stats.value = await getListeningStats(userId)
    } catch {
      stats.value = null
    }
  } catch (error) {
    loadError.value = errorMessage(error, t('listening.loadError'))
  } finally {
    loading.value = false
  }
}

const selectType = (value: string) => {
  if (selectedType.value === value) return
  selectedType.value = value
  void loadQuestions()
}

const startQuiz = (index: number) => {
  currentIndex.value = index
  mode.value = 'quiz'
  resetQuestionState()
}

const selectAnswer = (key: string) => {
  if (showResult.value || submitting.value) return
  selectedAnswer.value = key
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
      durationSeconds: Math.max(1, Math.round((Date.now() - questionStartedAt.value) / 1000)),
    })
    submitResult.value = response
    showResult.value = true
    results.value.push({ questionId: question.id, isCorrect: response.isCorrect })
    submittedContent.value = {
      ...submittedContent.value,
      [question.id]: {
        transcript: response.transcript,
        lrcContent: response.lrcContent,
      },
    }
  } catch (error) {
    toast(errorMessage(error, t('listening.submitError')), 'error')
  } finally {
    submitting.value = false
  }
}

const nextQuestion = () => {
  if (isLastQuestion.value) {
    mode.value = 'summary'
    return
  }
  currentIndex.value += 1
  resetQuestionState()
}

const resetQuestionState = () => {
  selectedAnswer.value = ''
  showResult.value = false
  submitResult.value = null
  questionStartedAt.value = Date.now()
}

const restart = () => {
  void loadQuestions()
}

const goBack = () => {
  if (mode.value === 'quiz' || mode.value === 'summary') {
    mode.value = 'list'
    return
  }
  router.push('/learning')
}

const handleAudioError = (message: string) => {
  toast(message || t('listening.audioError'), 'warning')
}

onMounted(() => {
  void loadQuestions()
})
</script>
