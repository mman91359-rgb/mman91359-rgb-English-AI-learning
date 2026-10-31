<template>
  <BaseDialog :visible="visible" max-width="max-w-2xl" @close="skip">
          <!-- 顶部 -->
          <div class="flex items-start justify-between gap-4">
            <div>
              <div class="flex items-center gap-2">
                <span class="material-symbols-outlined text-tertiary text-2xl">history_edu</span>
                <h3 class="font-headline-md text-headline-md text-on-surface">{{ $t('wordReview.title') }}</h3>
              </div>
              <p class="mt-1 font-body-sm text-body-sm text-on-surface-variant">{{ $t('wordReview.desc') }}</p>
            </div>
            <button
              type="button"
              class="rounded-full p-2 text-on-surface-variant transition-colors hover:bg-surface-container-high hover:text-on-surface"
              :aria-label="$t('common.close')"
              @click="skip"
            >
              <span class="material-symbols-outlined">close</span>
            </button>
          </div>

          <!-- 进度 -->
          <div v-if="!finished" class="mt-5">
            <div class="mb-2 flex items-center justify-between font-label-md text-label-md text-on-surface-variant">
              <span>{{ $t('wordReview.progress', { current: Math.min(reviewedCount + 1, total), total }) }}</span>
              <span>{{ Math.round(progressPercent) }}%</span>
            </div>
            <div class="h-2 w-full overflow-hidden rounded-full bg-surface-container-high">
              <div
                class="h-full rounded-full bg-gradient-to-r from-tertiary to-primary transition-all duration-500 ease-out"
                :style="{ width: progressPercent + '%' }"
              ></div>
            </div>
          </div>

          <!-- 完成总结 -->
          <div v-if="finished" class="mt-8 flex flex-col items-center text-center">
            <div class="flex h-20 w-20 items-center justify-center rounded-full bg-tertiary-container/20">
              <span class="material-symbols-outlined text-tertiary text-5xl fill">task_alt</span>
            </div>
            <h4 class="mt-5 font-headline-md text-headline-md text-on-surface">{{ $t('wordReview.summaryTitle') }}</h4>
            <p class="mt-2 font-body-md text-body-md text-on-surface-variant">
              {{ $t('wordReview.summaryText', { reviewed: reviewedCount, correct: correctCount }) }}
            </p>
            <button
              type="button"
              class="mt-7 w-full max-w-xs rounded-full bg-primary px-7 py-3 font-label-lg text-label-lg text-on-primary transition-all hover:bg-primary/90 active:scale-[0.98]"
              @click="complete"
            >{{ $t('wordReview.startNew') }}</button>
          </div>

          <!-- 复习卡片 -->
          <div v-else-if="current" class="mt-6">
            <div class="mb-4 flex items-center justify-between">
              <span class="rounded-full bg-tertiary-container/15 px-3 py-1 font-label-md text-label-md text-tertiary">
                {{ mode === 'fill' ? $t('wordReview.fillMode') : $t('wordReview.cardMode') }}
              </span>
              <span class="font-label-md text-label-md text-on-surface-variant">
                {{ current.pos || $t('wordReview.word') }}
              </span>
            </div>

            <Transition name="fade-slide" mode="out-in">
              <!-- 填空模式 -->
              <div v-if="mode === 'fill'" :key="'fill-' + index" class="rounded-[22px] border border-outline-variant/40 bg-surface-container-lowest p-6">
                <p class="mb-5 text-center font-body-lg text-body-lg text-on-surface-variant">
                  {{ current.translation }}
                </p>
                <p class="mb-6 whitespace-pre-wrap text-center font-headline-md text-headline-md leading-relaxed text-on-surface">
                  {{ fillStem }}
                </p>
                <input
                  ref="fillInputRef"
                  v-model="fillAnswer"
                  type="text"
                  autocomplete="off"
                  :placeholder="$t('wordReview.answerPlaceholder')"
                  class="w-full rounded-[16px] border border-outline-variant bg-background px-4 py-3.5 text-center font-body-lg text-body-lg text-on-surface outline-none transition-all focus:border-primary focus:ring-1 focus:ring-primary"
                  :disabled="!!feedback || checking"
                  @keydown.enter="submitFill"
                />
                <button
                  type="button"
                  class="mt-4 w-full rounded-full bg-primary px-6 py-3 font-label-lg text-label-lg text-on-primary transition-all hover:bg-primary/90 active:scale-[0.98] disabled:opacity-50"
                  :disabled="checking || !fillAnswer.trim() || !!feedback"
                  @click="submitFill"
                >{{ checking ? $t('common.saving') : $t('wordReview.submit') }}</button>
              </div>

              <!-- 翻卡模式 -->
              <div v-else :key="'card-' + index" class="rounded-[22px] border border-outline-variant/40 bg-gradient-to-br from-surface-container-lowest to-surface-container-low p-8 text-center">
                <p class="font-headline-xl text-headline-xl font-bold text-on-surface">{{ current.word }}</p>
                <p v-if="current.phonetic" class="mt-2 font-body-md text-body-md text-on-surface-variant">{{ current.phonetic }}</p>
                <p v-if="current.pos" class="mt-1 font-label-md text-label-md text-tertiary">{{ current.pos }}</p>

                <div v-if="!revealed" class="mt-8">
                  <button
                    type="button"
                    class="rounded-full border border-outline-variant px-6 py-3 font-label-lg text-label-lg text-on-surface-variant transition-colors hover:bg-surface-container-high"
                    @click="revealed = true"
                  >{{ $t('wordReview.showMeaning') }}</button>
                </div>

                <div v-else class="mt-6">
                  <p class="font-body-lg text-body-lg text-on-surface">{{ current.translation }}</p>
                  <p v-if="current.example" class="mt-4 font-body-md text-body-md text-on-surface-variant italic">
                    {{ current.example }}
                  </p>
                  <div class="mt-7 flex gap-3">
                    <button
                      type="button"
                      class="flex-1 rounded-full border border-error/30 bg-error/5 px-4 py-3 font-label-lg text-label-lg text-error transition-colors hover:bg-error/10 disabled:opacity-50"
                      :disabled="checking || !!feedback"
                      @click="submitReview(false)"
                    >{{ $t('wordReview.forgot') }}</button>
                    <button
                      type="button"
                      class="flex-1 rounded-full bg-tertiary px-4 py-3 font-label-lg text-label-lg text-on-tertiary transition-colors hover:bg-tertiary/90 disabled:opacity-50"
                      :disabled="checking || !!feedback"
                      @click="submitReview(true)"
                    >{{ $t('wordReview.remembered') }}</button>
                  </div>
                </div>
              </div>
            </Transition>

            <!-- 反馈 -->
            <div
              v-if="feedback"
              class="mt-5 rounded-2xl border p-4"
              :class="feedback.correct
                ? 'border-tertiary/20 bg-tertiary-container/10'
                : 'border-error/20 bg-error/5'"
            >
              <div class="flex items-center gap-2">
                <span class="material-symbols-outlined" :class="feedback.correct ? 'text-tertiary' : 'text-error'">
                  {{ feedback.correct ? 'check_circle' : 'cancel' }}
                </span>
                <span class="font-label-lg text-label-lg" :class="feedback.correct ? 'text-tertiary' : 'text-error'">
                  {{ feedback.correct ? $t('wordReview.correct') : $t('wordReview.wrong') }}
                </span>
              </div>
              <p class="mt-2 font-body-md text-body-md text-on-surface">
                {{ $t('wordReview.correctAnswer') }}：<span class="font-bold">{{ current.word }}</span>
              </p>
              <p v-if="feedback.nextReviewAt" class="mt-1 font-body-sm text-body-sm text-on-surface-variant">
                {{ $t('wordReview.nextReview') }}：{{ formatShortDate(feedback.nextReviewAt) }}
              </p>
              <button
                type="button"
                class="mt-3 w-full rounded-full bg-primary px-6 py-2.5 font-label-lg text-label-lg text-on-primary transition-all hover:bg-primary/90 active:scale-[0.98]"
                @click="nextWord"
              >{{ $t('wordReview.next') }}</button>
            </div>
          </div>

          <!-- 底部跳过 -->
          <div v-if="!finished" class="mt-5 text-center">
            <button
              type="button"
              class="font-label-md text-label-md text-on-surface-variant transition-colors hover:text-primary"
              @click="skip"
            >{{ $t('wordReview.skip') }}</button>
          </div>
  </BaseDialog>
</template>

<script setup lang="ts">
import { computed, nextTick, ref, watch } from 'vue'
import { useI18n } from 'vue-i18n'
import BaseDialog from './ui/BaseDialog.vue'
import { useUserStore } from '@/stores/user'
import { reviewWord, type VocabularyVO } from '@/api/exercise'
import { useToast } from '@/composables/useToast'
import { shuffle } from '@/utils/array'
import { formatShortDate } from '@/utils/format'

interface Props {
  visible: boolean
  words: VocabularyVO[]
}

const props = defineProps<Props>()

const emit = defineEmits<{
  (e: 'update:visible', value: boolean): void
  (e: 'complete', payload: { reviewed: number; correct: number; skipped?: boolean }): void
}>()

const { t } = useI18n()
const { show: toast } = useToast()
const userStore = useUserStore()

const queue = ref<VocabularyVO[]>([])
const index = ref(0)
const reviewedCount = ref(0)
const correctCount = ref(0)
const revealed = ref(false)
const fillAnswer = ref('')
const fillInputRef = ref<HTMLInputElement | null>(null)
const checking = ref(false)
const finished = ref(false)
const feedback = ref<{ correct: boolean; nextReviewAt?: string } | null>(null)

const total = computed(() => queue.value.length)
const current = computed<VocabularyVO | null>(() => queue.value[index.value] || null)
const progressPercent = computed(() => {
  if (total.value === 0) return 100
  return Math.min(100, (reviewedCount.value / total.value) * 100)
})

const canFill = (word: VocabularyVO): boolean => {
  if (!word.example || !word.word) return false
  return word.example.toLowerCase().includes(word.word.toLowerCase())
}

const mode = computed<'fill' | 'card'>(() => {
  if (!current.value) return 'card'
  // 交替使用翻卡与填空；没有可用例句时回退翻卡
  return index.value % 2 === 0 && canFill(current.value) ? 'fill' : 'card'
})

const fillStem = computed(() => {
  const word = current.value
  if (!word?.example || !word.word) return ''
  const lowerExample = word.example.toLowerCase()
  const lowerWord = word.word.toLowerCase()
  const position = lowerExample.indexOf(lowerWord)
  if (position < 0) return word.example
  return `${word.example.slice(0, position)}___${word.example.slice(position + word.word.length)}`
})

const reset = () => {
  queue.value = shuffle(props.words || [])
  index.value = 0
  reviewedCount.value = 0
  correctCount.value = 0
  revealed.value = false
  fillAnswer.value = ''
  checking.value = false
  finished.value = false
  feedback.value = null
  nextTick(() => {
    if (mode.value === 'fill') fillInputRef.value?.focus()
  })
}

watch(() => props.visible, (visible) => {
  if (visible) reset()
})

watch(() => props.words, () => {
  if (props.visible) reset()
})

const submitReview = async (isCorrect: boolean) => {
  const word = current.value
  if (!word || checking.value || feedback.value) return
  checking.value = true
  try {
    const updated = await reviewWord(word.id, {
      userId: userStore.userId as number,
      isCorrect,
    })
    reviewedCount.value++
    if (isCorrect) correctCount.value++
    feedback.value = {
      correct: isCorrect,
      nextReviewAt: updated.nextReviewAt,
    }
  } catch (e) {
    const message = e instanceof Error ? e.message : t('wordReview.saveFailed')
    toast(message, 'error')
  } finally {
    checking.value = false
  }
}

const submitFill = () => {
  const word = current.value
  if (!word || feedback.value || !fillAnswer.value.trim()) return
  const isCorrect = fillAnswer.value.trim().toLowerCase() === word.word.trim().toLowerCase()
  void submitReview(isCorrect)
}

const nextWord = () => {
  feedback.value = null
  revealed.value = false
  fillAnswer.value = ''
  if (index.value + 1 >= queue.value.length) {
    finished.value = true
    index.value = queue.value.length
    return
  }
  index.value++
  nextTick(() => {
    if (mode.value === 'fill') fillInputRef.value?.focus()
  })
}

const complete = () => {
  emit('complete', { reviewed: reviewedCount.value, correct: correctCount.value })
  emit('update:visible', false)
}

const skip = () => {
  emit('complete', {
    reviewed: reviewedCount.value,
    correct: correctCount.value,
    skipped: true,
  })
  emit('update:visible', false)
}

</script>
