<template>
  <Teleport to="body">
    <Transition name="modal-fade">
      <div
        v-if="visible"
        class="fixed inset-0 z-[120] flex items-center justify-center bg-black/45 px-4 backdrop-blur-[2px]"
        role="dialog"
        aria-modal="true"
        @click.self="close"
      >
        <div class="modal-card w-full max-w-2xl rounded-[28px] bg-surface p-6 sm:p-8 soft-shadow" @click.stop>
          <!-- 标题 -->
          <div class="flex items-start justify-between gap-4 mb-2">
            <div class="flex items-center gap-3">
              <div class="flex h-12 w-12 items-center justify-center rounded-2xl bg-primary-container/20">
                <span class="material-symbols-outlined text-primary text-2xl">tune</span>
              </div>
              <div>
                <h3 class="font-headline-md text-headline-md text-on-surface">{{ $t('vocabGoal.title') }}</h3>
                <p class="font-body-sm text-body-sm text-on-surface-variant mt-1">{{ $t('vocabGoal.desc') }}</p>
              </div>
            </div>
            <button
              class="rounded-full p-2 text-on-surface-variant transition-colors hover:bg-surface-container-high hover:text-on-surface"
              type="button"
              :aria-label="$t('common.close')"
              @click="close"
            >
              <span class="material-symbols-outlined">close</span>
            </button>
          </div>

          <!-- 两项目标 -->
          <div class="mt-6 grid grid-cols-1 gap-4 sm:grid-cols-2">
            <!-- 新背 -->
            <div class="rounded-[22px] border border-primary/15 bg-gradient-to-br from-primary-container/15 to-surface-container-lowest p-5">
              <div class="flex items-center gap-3 mb-1">
                <span class="material-symbols-outlined text-primary text-2xl">fiber_new</span>
                <span class="font-label-lg text-label-lg text-on-surface">{{ $t('vocabGoal.newWordsTitle') }}</span>
              </div>
              <p class="font-body-sm text-body-sm text-on-surface-variant mb-4">{{ $t('vocabGoal.newWordsDesc') }}</p>

              <div class="flex items-center justify-between rounded-2xl bg-surface px-3 py-2 border border-outline-variant/60">
                <button
                  type="button"
                  class="flex h-9 w-9 items-center justify-center rounded-full text-on-surface-variant transition-colors hover:bg-surface-container-high hover:text-primary disabled:opacity-40"
                  :disabled="newInput <= minNew"
                  @click="adjustNew(-1)"
                >
                  <span class="material-symbols-outlined text-lg">remove</span>
                </button>
                <div class="flex items-baseline gap-1">
                  <input
                    v-model.number="newInput"
                    type="number"
                    inputmode="numeric"
                    :min="minNew"
                    :max="maxNew"
                    class="w-16 bg-transparent text-center font-headline-md text-headline-md text-on-surface outline-none"
                  />
                  <span class="font-body-sm text-body-sm text-on-surface-variant">{{ $t('vocabGoal.newWordsUnit') }}</span>
                </div>
                <button
                  type="button"
                  class="flex h-9 w-9 items-center justify-center rounded-full text-on-surface-variant transition-colors hover:bg-surface-container-high hover:text-primary disabled:opacity-40"
                  :disabled="newInput >= maxNew"
                  @click="adjustNew(1)"
                >
                  <span class="material-symbols-outlined text-lg">add</span>
                </button>
              </div>

              <div class="mt-3 flex flex-wrap gap-2">
                <button
                  v-for="value in newPresets"
                  :key="value"
                  type="button"
                  class="rounded-full px-3 py-1 font-label-md text-label-md transition-all"
                  :class="newInput === value
                    ? 'bg-primary text-on-primary'
                    : 'bg-surface text-on-surface-variant hover:bg-primary-container/20 hover:text-primary'"
                  @click="newInput = value"
                >{{ value }}</button>
              </div>
              <p class="mt-2 font-body-sm text-body-sm text-on-surface-variant/70">
                {{ $t('vocabGoal.range', { min: minNew, max: maxNew }) }}
              </p>
            </div>

            <!-- 复习 -->
            <div class="rounded-[22px] border border-tertiary/15 bg-gradient-to-br from-tertiary-container/10 to-surface-container-lowest p-5">
              <div class="flex items-center gap-3 mb-1">
                <span class="material-symbols-outlined text-tertiary text-2xl">history_edu</span>
                <span class="font-label-lg text-label-lg text-on-surface">{{ $t('vocabGoal.reviewWordsTitle') }}</span>
              </div>
              <p class="font-body-sm text-body-sm text-on-surface-variant mb-4">{{ $t('vocabGoal.reviewWordsDesc') }}</p>

              <div class="flex items-center justify-between rounded-2xl bg-surface px-3 py-2 border border-outline-variant/60">
                <button
                  type="button"
                  class="flex h-9 w-9 items-center justify-center rounded-full text-on-surface-variant transition-colors hover:bg-surface-container-high hover:text-tertiary disabled:opacity-40"
                  :disabled="reviewInput <= minReview"
                  @click="adjustReview(-1)"
                >
                  <span class="material-symbols-outlined text-lg">remove</span>
                </button>
                <div class="flex items-baseline gap-1">
                  <input
                    v-model.number="reviewInput"
                    type="number"
                    inputmode="numeric"
                    :min="minReview"
                    :max="maxReview"
                    class="w-16 bg-transparent text-center font-headline-md text-headline-md text-on-surface outline-none"
                  />
                  <span class="font-body-sm text-body-sm text-on-surface-variant">{{ $t('vocabGoal.reviewWordsUnit') }}</span>
                </div>
                <button
                  type="button"
                  class="flex h-9 w-9 items-center justify-center rounded-full text-on-surface-variant transition-colors hover:bg-surface-container-high hover:text-tertiary disabled:opacity-40"
                  :disabled="reviewInput >= maxReview"
                  @click="adjustReview(1)"
                >
                  <span class="material-symbols-outlined text-lg">add</span>
                </button>
              </div>

              <div class="mt-3 flex flex-wrap gap-2">
                <button
                  v-for="value in reviewPresets"
                  :key="value"
                  type="button"
                  class="rounded-full px-3 py-1 font-label-md text-label-md transition-all"
                  :class="reviewInput === value
                    ? 'bg-tertiary text-on-tertiary'
                    : 'bg-surface text-on-surface-variant hover:bg-tertiary-container/20 hover:text-tertiary'"
                  @click="reviewInput = value"
                >{{ value }}</button>
              </div>
              <p class="mt-2 font-body-sm text-body-sm text-on-surface-variant/70">
                {{ $t('vocabGoal.range', { min: minReview, max: maxReview }) }}
              </p>
            </div>
          </div>

          <!-- 汇总 + 错误 -->
          <div class="mt-5 flex items-center gap-2 rounded-2xl bg-surface-container-low px-4 py-3">
            <span class="material-symbols-outlined text-primary text-xl">auto_awesome</span>
            <span class="font-body-md text-body-md text-on-surface">
              {{ $t('vocabGoal.summary', { newWords: newInput, reviewWords: reviewInput }) }}
            </span>
          </div>
          <p v-if="displayError" class="mt-3 font-body-sm text-body-sm text-error">{{ displayError }}</p>

          <!-- 按钮 -->
          <div class="mt-6 flex flex-col-reverse gap-3 sm:flex-row sm:justify-end">
            <button
              type="button"
              class="rounded-full border border-outline-variant px-6 py-3 font-label-lg text-label-lg text-on-surface-variant transition-colors hover:bg-surface-container-high disabled:opacity-50"
              :disabled="saving"
              @click="close"
            >{{ $t('vocabGoal.cancel') }}</button>
            <button
              type="button"
              class="rounded-full bg-primary px-7 py-3 font-label-lg text-label-lg text-on-primary shadow-sm transition-all hover:bg-primary/90 hover:shadow-md active:scale-[0.98] disabled:cursor-not-allowed disabled:opacity-60"
              :disabled="saving"
              @click="submit"
            >
              {{ saving ? $t('common.saving') : (submitLabel || $t('vocabGoal.save')) }}
            </button>
          </div>
        </div>
      </div>
    </Transition>
  </Teleport>
</template>

<script setup lang="ts">
import { computed, ref, watch } from 'vue'
import { useI18n } from 'vue-i18n'

interface Props {
  visible: boolean
  newWords?: number | null
  reviewWords?: number | null
  saving?: boolean
  error?: string
  submitLabel?: string
  minNew?: number
  maxNew?: number
  minReview?: number
  maxReview?: number
}

const props = withDefaults(defineProps<Props>(), {
  newWords: null,
  reviewWords: null,
  saving: false,
  error: '',
  submitLabel: '',
  minNew: 1,
  maxNew: 50,
  minReview: 0,
  maxReview: 50,
})

const emit = defineEmits<{
  (e: 'update:visible', value: boolean): void
  (e: 'save', payload: { newWords: number; reviewWords: number }): void
  (e: 'close'): void
}>()

const { t } = useI18n()
const newInput = ref(10)
const reviewInput = ref(5)
const localError = ref('')

const newPresets = [5, 10, 15, 20]
const reviewPresets = [0, 5, 10, 15]

const displayError = computed(() => localError.value || props.error)

const syncInputs = () => {
  newInput.value = props.newWords ?? 10
  reviewInput.value = props.reviewWords ?? 5
  localError.value = ''
}

watch(() => props.visible, (visible) => {
  if (visible) syncInputs()
})

watch(() => [props.newWords, props.reviewWords], () => {
  if (props.visible) syncInputs()
})

const adjustNew = (delta: number) => {
  const next = Number(newInput.value || props.minNew) + delta
  newInput.value = Math.max(props.minNew, Math.min(props.maxNew, next))
}

const adjustReview = (delta: number) => {
  const next = Number(reviewInput.value || props.minReview) + delta
  reviewInput.value = Math.max(props.minReview, Math.min(props.maxReview, next))
}

const close = () => {
  if (props.saving) return
  emit('update:visible', false)
  emit('close')
}

const submit = () => {
  const newWords = Number(newInput.value)
  const reviewWords = Number(reviewInput.value)
  if (!Number.isInteger(newWords) || newWords < props.minNew || newWords > props.maxNew) {
    localError.value = t('vocabGoal.invalidNew', { min: props.minNew, max: props.maxNew })
    return
  }
  if (!Number.isInteger(reviewWords) || reviewWords < props.minReview || reviewWords > props.maxReview) {
    localError.value = t('vocabGoal.invalidReview', { min: props.minReview, max: props.maxReview })
    return
  }
  localError.value = ''
  emit('save', { newWords, reviewWords })
}
</script>
