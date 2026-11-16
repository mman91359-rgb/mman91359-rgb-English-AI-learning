<template>
  <AppLayout>
    <div class="max-w-3xl mx-auto space-y-6">
      <!-- flush：去掉 PageHeader 自带 mb-8，纵向节奏交给本页 space-y-6 统一管理 -->
      <PageHeader :title="$t('assess.title')" :subtitle="$t('notification.welcomeContent')" flush>
        <template #actions>
          <button :class="btnSecondary" @click="router.push('/dashboard')">
            稍后再测
          </button>
        </template>
      </PageHeader>

      <LoadingState v-if="loading" :message="$t('common.loading')" />

      <AppCard v-else-if="finished" tone="surface" padding="regular" class="text-center">
        <div class="w-20 h-20 mx-auto rounded-full bg-primary-container/20 flex items-center justify-center mb-4">
          <AppIcon name="workspace_premium" size="2xl" tone="primary" />
        </div>
        <h2 class="font-headline-lg text-headline-lg text-on-surface">{{ $t('assess.completed') }}</h2>
        <p class="mt-3 font-body-md text-body-md text-on-surface-variant">
          本次答对 {{ correctCount }} / {{ questions.length }} 题
        </p>
        <div class="mt-6 grid grid-cols-2 gap-4">
          <div class="rounded-xl bg-surface-container-low p-4">
            <p class="font-label-md text-label-md text-on-surface-variant">当前等级</p>
            <p class="mt-1 font-headline-md text-headline-md text-primary">{{ finalRadar?.eloLevel || '-' }}</p>
          </div>
          <div class="rounded-xl bg-surface-container-low p-4">
            <p class="font-label-md text-label-md text-on-surface-variant">能力分</p>
            <p class="mt-1 font-headline-md text-headline-md text-primary">{{ finalRadar?.eloScore || '-' }}</p>
          </div>
        </div>
        <button
          :class="['mt-8', btnPrimaryBlock]"
          @click="router.push('/dashboard')"
        >
          进入首页
        </button>
      </AppCard>

      <div v-else-if="currentQuestion" class="space-y-5">
        <ProgressBar :value="progressPercent" />

        <AppCard tone="surface" padding="regular">
          <div class="flex items-center justify-between mb-5">
            <Tag tone="primary" size="md">
              {{ moduleName(currentQuestion.moduleType, t) }} Lv.{{ currentQuestion.difficultyLevel }}
            </Tag>
            <span class="font-label-md text-label-md text-on-surface-variant">
              {{ currentIndex + 1 }} / {{ questions.length }}
            </span>
          </div>

          <p class="font-body-lg text-body-lg text-on-surface leading-relaxed mb-6">
            {{ currentQuestion.stem }}
          </p>

          <div v-if="parsedOptions.length > 0" class="space-y-3">
            <button
              v-for="opt in parsedOptions"
              :key="opt.key"
              class="w-full text-left p-4 rounded-xl border transition-all font-body-md text-body-md"
              :class="selectedAnswer === opt.key
                ? 'border-primary bg-primary-container/20 text-primary'
                : 'border-outline-variant/30 hover:border-primary/50 text-on-surface'"
              @click="selectedAnswer = opt.key"
            >
              {{ opt.key }}. {{ opt.text }}
            </button>
          </div>

          <input
            v-else
            v-model="selectedAnswer"
            :class="inputClassLg"
            :placeholder="$t('learning.inputAnswer')"
            @keyup.enter="submitCurrent"
          />

          <button
            :class="['mt-6', btnPrimaryBlock]"
            :disabled="submitting || !selectedAnswer.trim()"
            @click="submitCurrent"
          >
            {{ submitting ? '提交中...' : currentIndex === questions.length - 1 ? '完成测评' : '下一题' }}
          </button>
        </AppCard>
      </div>

      <EmptyState
        v-else
        icon="inbox"
        :title="$t('assess.emptyTitle')"
        :description="$t('assess.emptyDescription')"
        :action-label="$t('assess.backToHome')"
        @action="router.push('/dashboard')"
      />
    </div>
  </AppLayout>
</template>

<script setup lang="ts">
import { computed, onMounted, ref } from 'vue'
import { useI18n } from 'vue-i18n'
import { useRouter } from 'vue-router'
import AppLayout from '@/components/AppLayout.vue'
import AppCard from '@/components/ui/AppCard.vue'
import AppIcon from '@/components/ui/AppIcon.vue'
import PageHeader from '@/components/ui/PageHeader.vue'
import ProgressBar from '@/components/ui/ProgressBar.vue'
import Tag from '@/components/ui/Tag.vue'
import LoadingState from '@/components/ui/LoadingState.vue'
import EmptyState from '@/components/ui/EmptyState.vue'
import { btnPrimaryBlock, btnSecondary } from '@/components/ui/buttonStyles'
import { inputClassLg } from '@/components/ui/formStyles'
import { getAssessQuestions, getQuestionById, type QuestionVO } from '@/api/exercise'
import { moduleName } from '@/config/modules'
import { submitAssessAnswer } from '@/api/user'
import { useUserStore } from '@/stores/user'
import { useToast } from '@/composables/useToast'

const router = useRouter()
const userStore = useUserStore()
const { t } = useI18n()
const { show: toast } = useToast()

const loading = ref(true)
const submitting = ref(false)
const questions = ref<QuestionVO[]>([])
const currentIndex = ref(0)
const selectedAnswer = ref('')
const correctCount = ref(0)
const finished = ref(false)
const finalRadar = ref<any>(null)

const currentQuestion = computed(() => questions.value[currentIndex.value] || null)
const progressPercent = computed(() =>
  questions.value.length > 0 ? ((currentIndex.value + 1) / questions.value.length) * 100 : 0
)

const parsedOptions = computed(() => {
  const q = currentQuestion.value
  if (!q?.options) return []
  try {
    const opts = JSON.parse(q.options)
    if (!Array.isArray(opts)) return []
    return opts.map((item: string, index: number) => {
      const match = String(item).match(/^([A-D])[.\s]*\s*(.+)/)
      if (match) return { key: match[1], text: match[2].trim() }
      return { key: String.fromCharCode(65 + index), text: String(item).trim() }
    })
  } catch {
    return []
  }
})

const normalize = (value: string) => value.trim().toLowerCase().replace(/\s+/g, ' ')

const isAnswerCorrect = (answer: string, correctAnswer: string) => {
  const userAnswer = normalize(answer)
  const correct = normalize(correctAnswer)
  if (!userAnswer || !correct) return false
  if (userAnswer === correct) return true

  const correctKey = correct.match(/^[a-d]/)?.[0] || ''
  if (correctKey && userAnswer === correctKey) return true

  const option = parsedOptions.value.find(opt => opt.key.toLowerCase() === correctKey)
  return !!option && userAnswer === normalize(option.text)
}

const loadQuestions = async () => {
  loading.value = true
  try {
    questions.value = await getAssessQuestions()
  } catch (e) {
    console.warn('加载定级测评题失败', e)
    toast('测评题加载失败，请稍后重试', 'error')
  } finally {
    loading.value = false
  }
}

const submitCurrent = async () => {
  const userId = userStore.userId
  const q = currentQuestion.value
  const answer = selectedAnswer.value.trim()
  if (!userId || !q || !answer || submitting.value) return

  submitting.value = true
  try {
    const fullQuestion = await getQuestionById(q.id, true)
    const isCorrect = isAnswerCorrect(answer, fullQuestion.correctAnswer || '')
    if (isCorrect) correctCount.value++

    finalRadar.value = await submitAssessAnswer({
      userId,
      difficultyLevel: q.difficultyLevel,
      moduleType: q.moduleType,
      isCorrect,
    })

    if (currentIndex.value >= questions.value.length - 1) {
      finished.value = true
      await userStore.loadUserStats()
    } else {
      currentIndex.value++
      selectedAnswer.value = ''
    }
  } catch (e) {
    console.warn('提交定级测评失败', e)
    toast('提交失败，请稍后重试', 'error')
  } finally {
    submitting.value = false
  }
}

onMounted(() => {
  if (!userStore.userId) {
    router.push('/login')
    return
  }
  loadQuestions()
})
</script>
