<template>
  <div class="w-full max-w-3xl mx-auto flex flex-col items-center px-gutter py-8">
    <!-- 完成态 -->
    <template v-if="finished">
      <AppIcon name="celebration" size="3xl" tone="primary" />
      <p class="mt-4 font-headline-md text-headline-md text-on-surface">{{ $t('wordReview.summaryTitle') }}</p>
      <p class="mt-2 font-body-md text-body-md text-on-surface-variant">
        {{ $t('wordReview.summaryText', { reviewed: reviewedCount, correct: goodCount }) }}
      </p>
      <button :class="[btnPrimary, 'mt-8']" @click="handleComplete">
        {{ $t('common.finish') }}
      </button>
    </template>

    <template v-else-if="currentWord">
      <div class="w-full flex items-center gap-4 mb-6">
        <QuizProgressBar :answered="reviewedCount" :total="total" />
      </div>
      <p class="w-full text-left font-label-sm text-label-sm text-tertiary">
        {{ phase === 'screen' ? $t('wordReview.phaseScreen') : $t('wordReview.phaseRotate') }}
      </p>

      <!-- 单词区 -->
      <div class="w-full flex flex-col items-center text-center py-6">
        <p class="font-display-lg text-display-lg text-on-surface">{{ currentWord.word }}</p>
        <p v-if="currentWord.phonetic" class="mt-3 font-body-lg text-body-lg text-on-surface-variant">
          {{ currentWord.phonetic }}
        </p>

        <!-- 阶段二：前端挖空例句 + 中文翻译（回想线索） -->
        <template v-if="phase === 'rotate'">
          <p v-if="maskedExample" class="mt-6 font-body-lg text-body-lg text-on-surface-variant">
            {{ maskedExample }}
          </p>
          <p v-if="currentWord.exampleTranslation" class="mt-2 font-body-md text-body-md text-on-surface-variant">
            {{ currentWord.exampleTranslation }}
          </p>
          <!-- 看释义对照 -->
          <template v-if="meaningRevealed">
            <p class="mt-6 font-headline-md text-headline-md text-on-surface">{{ currentWord.translation }}</p>
          </template>
        </template>
      </div>

      <!-- 评分反馈：SM-2 下次间隔 -->
      <div v-if="feedback" class="w-full flex flex-col items-center mt-2">
        <p class="font-body-md text-body-md text-on-surface-variant">
          {{ $t('wordReview.nextInDays', { days: feedback.intervalDays }) }}
        </p>
        <button :class="[btnPrimaryBlock, 'mt-6']" @click="nextWord">
          {{ $t('wordReview.next') }}
        </button>
      </div>

      <template v-else>
        <!-- 阶段一：熟悉度筛选，三档自评 -->
        <div v-if="phase === 'screen'" class="w-full grid grid-cols-3 gap-3 mt-2">
          <button :class="btnPrimaryBlock" :disabled="reviewing" @click="screen('GOOD')">
            {{ $t('wordReview.qualityGood') }}
          </button>
          <button :class="btnSecondaryBlock" :disabled="reviewing" @click="screen('HARD')">
            {{ $t('wordReview.qualityHard') }}
          </button>
          <button :class="[btnDanger, 'w-full']" :disabled="reviewing" @click="screen('AGAIN')">
            {{ $t('wordReview.qualityAgain') }}
          </button>
        </div>

        <!-- 阶段二：想起来了 / 没想起 + 看释义 -->
        <div v-else class="w-full flex flex-col gap-3 mt-2">
          <div class="grid grid-cols-2 gap-3">
            <button :class="btnPrimaryBlock" :disabled="reviewing" @click="rotateRecall(true)">
              {{ $t('wordReview.recalled') }}
            </button>
            <button :class="btnSecondaryBlock" :disabled="reviewing" @click="rotateRecall(false)">
              {{ $t('wordReview.notRecalled') }}
            </button>
          </div>
          <button v-if="!meaningRevealed" :class="btnSecondaryBlock" @click="meaningRevealed = true">
            {{ $t('wordReview.showMeaning') }}
          </button>
        </div>
      </template>
    </template>

    <!-- 空列表兜底 -->
    <template v-else>
      <p class="font-body-lg text-body-lg text-on-surface-variant">{{ $t('wordReview.empty') }}</p>
      <button :class="[btnPrimary, 'mt-6']" @click="handleComplete">
        {{ $t('common.finish') }}
      </button>
    </template>
  </div>
</template>

<script setup lang="ts">
import { computed, ref } from 'vue'
import { useI18n } from 'vue-i18n'
import AppIcon from '../ui/AppIcon.vue'
import QuizProgressBar from '../quiz/QuizProgressBar.vue'
import { btnDanger, btnPrimary, btnPrimaryBlock, btnSecondaryBlock } from '../ui/buttonStyles'
import { reviewWord, type ReviewQuality, type VocabularyVO } from '@/api/exercise'
import { useUserStore } from '@/stores/user'
import { useToast } from '@/composables/useToast'
import { shuffle } from '@/utils/array'

const props = defineProps<{ words: VocabularyVO[] }>()
const emit = defineEmits<{
  complete: [payload: { reviewed: number; correct: number }]
}>()

const { t } = useI18n()
const userStore = useUserStore()
const { show: toast } = useToast()

type Phase = 'screen' | 'rotate'
/** 轮换队列项：携带筛选阶段决定的 pending 档（HARD / AGAIN） */
interface RotateItem { word: VocabularyVO; pending: Exclude<ReviewQuality, 'GOOD'> }

const phase = ref<Phase>('screen')
const screenQueue = ref<VocabularyVO[]>(shuffle([...props.words]))
/** 轮换队列：模糊/不认识的词，pending 档决定想起后的评分 */
const rotateQueue = ref<RotateItem[]>([])
const total = props.words.length
const reviewedCount = ref(0)
const goodCount = ref(0)
const meaningRevealed = ref(false)
const reviewing = ref(false)
const finished = ref(false)
const feedback = ref<{ intervalDays: number } | null>(null)

const currentWord = computed<VocabularyVO | null>(() =>
  phase.value === 'screen'
    ? (screenQueue.value[0] ?? null)
    : (rotateQueue.value[0]?.word ?? null)
)
/** 前端正则挖 example：word（不区分大小写，含变形后缀）替换为 ____；example 为空则退化为空 */
const maskedExample = computed(() => {
  const example = currentWord.value?.example
  const word = currentWord.value?.word
  if (!example || !word || phase.value !== 'rotate') return ''
  const escaped = word.replace(/[.*+?^${}()|[\]\\]/g, '\\$&')
  return example.replace(new RegExp(`\\b${escaped}\\w*\\b`, 'gi'), '____')
})

const doReview = async (word: VocabularyVO, quality: ReviewQuality) => {
  reviewing.value = true
  try {
    const updated = await reviewWord(word.id, { userId: userStore.userId!, quality })
    reviewedCount.value++
    if (quality === 'GOOD') goodCount.value++
    feedback.value = { intervalDays: updated.intervalDays ?? 1 }
  } catch (e) {
    toast(e instanceof Error ? e.message : t('wordReview.saveFailed'), 'error')
  } finally {
    reviewing.value = false
  }
}

/** 阶段一：认识→GOOD 出队；模糊/不认识→携带 pending 进轮换队列（暂不评分） */
const screen = (quality: ReviewQuality) => {
  const word = currentWord.value
  if (!word || reviewing.value) return
  if (quality === 'GOOD') {
    void doReview(word, 'GOOD')
  } else {
    rotateQueue.value = [...rotateQueue.value, { word, pending: quality }]
    nextWord()
  }
}

/** 阶段二：想起→按 pending 档评分出队；没想起→回队尾 */
const rotateRecall = (recalled: boolean) => {
  const item = rotateQueue.value[0]
  if (!item || reviewing.value) return
  if (recalled) {
    void doReview(item.word, item.pending)
  } else {
    meaningRevealed.value = false
    rotateQueue.value = [...rotateQueue.value.slice(1), item]
  }
}

const nextWord = () => {
  feedback.value = null
  meaningRevealed.value = false

  if (phase.value === 'screen') {
    screenQueue.value = screenQueue.value.slice(1)
    if (screenQueue.value.length === 0) {
      if (rotateQueue.value.length === 0) finished.value = true
      else {
        rotateQueue.value = shuffle([...rotateQueue.value])
        phase.value = 'rotate'
      }
    }
  } else {
    rotateQueue.value = rotateQueue.value.slice(1)
    if (rotateQueue.value.length === 0) finished.value = true
  }
}

const handleComplete = () => {
  emit('complete', { reviewed: reviewedCount.value, correct: goodCount.value })
}
</script>
