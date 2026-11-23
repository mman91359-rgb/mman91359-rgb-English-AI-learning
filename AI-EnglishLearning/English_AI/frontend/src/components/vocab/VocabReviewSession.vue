<template>
  <div class="w-full max-w-3xl mx-auto flex flex-col items-center px-gutter py-8">
    <!-- 完成态 -->
    <template v-if="finished">
      <AppIcon name="celebration" size="3xl" tone="primary" />
      <p class="mt-4 font-headline-md text-headline-md text-on-surface">{{ $t('wordReview.summaryTitle') }}</p>
      <p class="mt-2 font-body-md text-body-md text-on-surface-variant">
        {{ $t('wordReview.summaryText', { reviewed: reviewedCount, correct: correctCount }) }}
      </p>
      <button :class="[btnPrimary, 'mt-8']" @click="handleComplete">
        {{ $t('common.finish') }}
      </button>
    </template>

    <!-- 复习中：沉浸式大背景，不用小卡片包裹 -->
    <template v-else-if="current">
      <div class="w-full flex items-center gap-4 mb-8">
        <QuizProgressBar :answered="reviewedCount" :total="total" />
      </div>

      <div class="w-full flex flex-col items-center text-center py-8">
        <p class="font-display-lg text-display-lg text-on-surface">{{ current.word }}</p>
        <p v-if="current.phonetic" class="mt-3 font-body-lg text-body-lg text-on-surface-variant">
          {{ current.phonetic }}
        </p>
        <p v-if="current.pos" class="mt-1 font-label-sm text-label-sm text-tertiary">{{ current.pos }}</p>
        <p v-if="current.example" class="mt-6 font-body-lg text-body-lg text-on-surface-variant">
          {{ current.example }}
        </p>

        <template v-if="revealed">
          <p class="mt-6 font-headline-md text-headline-md text-on-surface">{{ current.translation }}</p>
          <p v-if="current.exampleTranslation" class="mt-3 font-body-md text-body-md text-on-surface-variant">
            {{ current.exampleTranslation }}
          </p>
        </template>
      </div>

      <!-- 评分反馈：展示后端 SM-2 算出的下次间隔，再进入下一词 -->
      <div v-if="feedback" class="w-full flex flex-col items-center mt-2">
        <p class="font-body-md text-body-md text-on-surface-variant">
          {{ $t('wordReview.nextInDays', { days: feedback.intervalDays }) }}
        </p>
        <button :class="[btnPrimaryBlock, 'mt-6']" @click="nextWord">
          {{ $t('wordReview.next') }}
        </button>
      </div>

      <!-- 操作区：先看释义，再三档自评（单次即离队，不做连对） -->
      <template v-else>
        <button v-if="!revealed" :class="btnSecondaryBlock" @click="revealed = true">
          {{ $t('wordReview.showMeaning') }}
        </button>
        <div v-else class="w-full grid grid-cols-3 gap-3 mt-2">
          <button :class="btnPrimaryBlock" :disabled="reviewing" @click="rate('GOOD')">
            {{ $t('wordReview.qualityGood') }}
          </button>
          <button :class="btnSecondaryBlock" :disabled="reviewing" @click="rate('HARD')">
            {{ $t('wordReview.qualityHard') }}
          </button>
          <button :class="[btnDanger, 'w-full']" :disabled="reviewing" @click="rate('AGAIN')">
            {{ $t('wordReview.qualityAgain') }}
          </button>
        </div>
      </template>
    </template>

    <!-- 空列表兜底（正常由父组件提前拦截） -->
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

const queue = ref<VocabularyVO[]>(shuffle([...props.words]))
const total = props.words.length
const reviewedCount = ref(0)
const correctCount = ref(0)
const revealed = ref(false)
const reviewing = ref(false)
const finished = ref(false)
const feedback = ref<{ intervalDays: number } | null>(null)

const current = computed(() => queue.value[0] ?? null)

const rate = async (quality: ReviewQuality) => {
  const word = current.value
  if (!word || reviewing.value || !userStore.userId) return
  reviewing.value = true
  try {
    const updated = await reviewWord(word.id, {
      userId: userStore.userId,
      quality,
    })
    reviewedCount.value++
    if (quality === 'GOOD') correctCount.value++
    feedback.value = { intervalDays: updated.intervalDays ?? 1 }
  } catch (e) {
    toast(e instanceof Error ? e.message : t('wordReview.saveFailed'), 'error')
  } finally {
    reviewing.value = false
  }
}

const nextWord = () => {
  feedback.value = null
  revealed.value = false
  queue.value = queue.value.slice(1)
  if (queue.value.length === 0) finished.value = true
}

const handleComplete = () => {
  emit('complete', { reviewed: reviewedCount.value, correct: correctCount.value })
}
</script>
