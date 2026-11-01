<template>
  <AppLayout flush hide-top-bar>
    <template #topbar>
      <header class="h-20 sticky top-0 z-40 bg-background/80 backdrop-blur-md flex items-center justify-between px-gutter w-full max-w-container-max mx-auto">
        <button type="button" class="p-2 rounded-full text-on-surface-variant hover:bg-surface-container-high/50 transition-all" :aria-label="$t('common.back')" @click="router.push('/translation')">
          <span class="material-symbols-outlined">arrow_back_ios_new</span>
        </button>
        <div class="flex items-center gap-1.5 text-secondary">
          <div class="relative w-10 h-10 rounded-full border-4 border-secondary/30 border-t-secondary flex items-center justify-center">
            <span class="font-label-md text-label-md text-secondary font-bold">1/1</span>
          </div>
          <span class="material-symbols-outlined text-secondary fill">emoji_events</span>
        </div>
        <div class="flex items-center gap-2">
          <span class="bg-secondary-container/30 text-secondary font-label-md text-label-md px-3 py-1 rounded-full">{{ $t('translation.previewBadge') }}</span>
          <div class="w-8 h-8 rounded-full bg-surface-variant flex items-center justify-center overflow-hidden">
            <span class="font-label-md text-label-md text-on-surface-variant">{{ avatarText }}</span>
          </div>
        </div>
      </header>
    </template>

    <div class="flex-1 w-full max-w-container-max mx-auto px-gutter py-8 pb-24 md:pb-8">
      <div class="mb-4 flex flex-wrap items-center gap-3">
        <span class="bg-secondary-container/30 text-secondary font-label-md text-label-md px-3 py-1 rounded-full">
          {{ $t('translation.previewBanner') }}
        </span>
        <div class="flex items-center gap-1 bg-surface-container-high rounded-full p-1">
          <button
            type="button"
            class="px-3 py-1 rounded-full font-label-md text-label-md transition-colors"
            :class="previewStatus === 'incorrect' ? 'bg-error-container/40 text-error' : 'text-on-surface-variant'"
            @click="previewStatus = 'incorrect'"
          >{{ $t('translation.feedbackIncorrect') }}</button>
          <button
            type="button"
            class="px-3 py-1 rounded-full font-label-md text-label-md transition-colors"
            :class="previewStatus === 'correct' ? 'bg-tertiary-container/30 text-tertiary' : 'text-on-surface-variant'"
            @click="previewStatus = 'correct'"
          >{{ $t('translation.feedbackCorrect') }}</button>
        </div>
      </div>

      <div class="flex flex-col lg:flex-row gap-gutter flex-1">
        <section class="flex-1 flex flex-col gap-6 min-w-0">
          <div class="bg-surface-container-lowest rounded-[24px] p-8 md:p-10 shadow-[0_4px_20px_rgba(51,58,72,0.05)] border border-outline-variant/20 relative flex flex-col">
            <div class="flex items-center justify-between mb-8">
              <div class="flex items-center gap-2">
                <span class="bg-secondary-fixed/50 text-secondary font-label-md text-label-md px-3 py-1 rounded-full flex items-center gap-1">
                  {{ $t('translation.questionLabel') }}
                  <span class="material-symbols-outlined text-[14px]">help</span>
                </span>
                <span class="bg-secondary-container/20 text-secondary font-label-md text-label-md px-3 py-1 rounded-full">{{ fixture.levelLabel }}</span>
              </div>
              <span class="bg-error text-on-error font-label-md text-label-md px-3 py-1 rounded-full shadow-sm">{{ $t('translation.newBadge') }}</span>
            </div>

            <div class="flex items-center gap-2 mb-4">
              <span class="material-symbols-outlined text-secondary text-[18px]">menu_book</span>
              <span class="font-label-md text-label-md text-on-surface-variant">{{ fixture.sourceLabel }}</span>
            </div>

            <div class="bg-secondary-container/10 rounded-[16px] p-6 mb-6">
              <div class="flex items-center gap-2 mb-3">
                <span class="material-symbols-outlined text-secondary text-[20px]">translate</span>
                <span class="font-label-lg text-label-lg text-secondary">{{ $t('translation.translatePrompt') }}</span>
              </div>
              <p class="font-headline-md text-headline-md text-on-surface leading-relaxed">{{ fixture.source }}</p>
            </div>

            <div class="flex flex-col gap-2 flex-1">
              <div class="flex items-center gap-2">
                <span class="material-symbols-outlined text-primary text-[20px]">edit</span>
                <span class="font-label-lg text-label-lg text-on-surface-variant">{{ $t('translation.yourTranslation') }}</span>
              </div>
              <textarea
                v-model="text"
                class="w-full min-h-[140px] bg-surface-container-low border-2 border-outline-variant/30 focus:border-secondary focus:ring-0 focus:outline-none rounded-[16px] p-4 font-body-lg text-body-lg text-on-surface resize-none transition-colors placeholder-outline-variant/40"
                :placeholder="$t('translation.placeholder')"
              ></textarea>
              <div class="flex items-center justify-between">
                <span class="font-label-md text-label-md text-outline-variant">{{ $t('translation.wordsCount', { count: wordCount }) }}</span>
                <span class="font-label-md text-label-md text-outline-variant">{{ $t('translation.suggestedWords', { min: fixture.suggestedWords[0], max: fixture.suggestedWords[1] }) }}</span>
              </div>
            </div>

            <p v-if="showHint" class="mt-4 bg-primary-container/10 text-primary rounded-xl p-3 font-body-md text-body-md">
              {{ fixture.hint }}
            </p>

            <button
              type="button"
              class="self-start mt-4 flex items-center gap-2 bg-primary-container/15 text-primary px-4 py-2 rounded-full font-label-lg text-label-lg hover:bg-primary-container/25 transition-colors"
              @click="showHint = !showHint"
            >
              <span class="material-symbols-outlined text-[18px]">lightbulb</span>{{ $t('translation.viewHint') }}
            </button>
          </div>

          <div class="flex items-center gap-3 mt-auto">
            <button
              type="button"
              class="flex-1 bg-gradient-to-r from-primary to-primary-fixed-dim text-on-primary py-4 rounded-[16px] font-label-lg text-label-lg flex items-center justify-center gap-2 hover:opacity-90 transition-opacity shadow-[0_4px_14px_rgba(103,85,140,0.25)]"
              @click="showHint = !showHint"
            >
              <span class="material-symbols-outlined">lightbulb</span>{{ $t('translation.viewHint') }}
            </button>
            <button
              type="button"
              class="flex-1 bg-gradient-to-r from-secondary to-secondary-fixed-dim text-on-secondary py-4 rounded-[16px] font-label-lg text-label-lg flex items-center justify-center gap-2 hover:opacity-90 transition-opacity shadow-[0_4px_14px_rgba(12,103,128,0.25)]"
              @click="reset"
            >
              <span class="material-symbols-outlined">replay</span>{{ $t('translation.reset') }}
            </button>
            <button
              type="button"
              class="flex-1 bg-gradient-to-r from-tertiary to-tertiary-fixed-dim text-on-tertiary py-4 rounded-[16px] font-label-lg text-label-lg flex items-center justify-center gap-2 hover:opacity-90 transition-opacity shadow-[0_4px_14px_rgba(0,110,32,0.25)] disabled:opacity-60"
              :disabled="submitting"
              @click="mockSubmit"
            >
              <span class="material-symbols-outlined">{{ submitting ? 'progress_activity' : 'arrow_forward' }}</span>
              {{ submitting ? $t('common.loading') : $t('translation.mockSubmit') }}
            </button>
          </div>
        </section>

        <aside class="lg:w-[380px] flex flex-col gap-4">
          <div class="flex items-center gap-2 mb-2">
            <span class="material-symbols-outlined text-primary">auto_awesome</span>
            <h3 class="font-headline-md text-headline-md text-on-surface">{{ $t('translation.aiFeedback') }}</h3>
          </div>

          <FeedbackPanel
            :status="feedbackStatus"
            :message="feedbackMessage"
            :tags="feedbackTags"
            :show-favorite="submitted"
            @favorite="toast($t('translation.previewUnavailable'), 'info')"
          />

          <div v-if="submitted" class="bg-surface-container-lowest rounded-[20px] p-5 shadow-[0_4px_20px_rgba(51,58,72,0.05)] border border-outline-variant/20">
            <div class="flex items-center gap-2 mb-3">
              <span class="material-symbols-outlined text-secondary text-[20px]">lightbulb</span>
              <span class="font-label-lg text-label-lg text-on-surface">{{ $t('translation.reference') }}</span>
            </div>
            <p class="font-body-lg text-body-lg text-on-surface leading-relaxed mb-3">
              <span v-for="(segment, index) in fixture.referenceSegments" :key="index" :class="segment.highlight ? 'text-secondary font-bold' : ''">{{ segment.text }}</span>
            </p>
            <div class="flex flex-wrap gap-2">
              <span v-for="phrase in fixture.keyPhrases" :key="phrase.en" class="bg-secondary-container/20 text-secondary font-label-md text-label-md px-2 py-1 rounded-md">{{ phrase.en }}</span>
            </div>
          </div>

          <div v-if="submitted" class="bg-tertiary-container/15 rounded-[20px] p-5 border border-tertiary/20">
            <div class="flex items-center gap-2 mb-3">
              <span class="material-symbols-outlined text-tertiary text-[20px]">bookmark</span>
              <span class="font-label-lg text-label-lg text-tertiary">{{ $t('translation.keyPhrases') }}</span>
            </div>
            <div class="space-y-2">
              <div v-for="phrase in fixture.keyPhrases" :key="phrase.en" class="flex items-center justify-between">
                <span class="font-body-md text-body-md text-on-surface font-medium">{{ phrase.cn }}</span>
                <span class="font-body-md text-body-md text-tertiary">{{ phrase.en }}</span>
              </div>
            </div>
          </div>
        </aside>
      </div>
    </div>
  </AppLayout>
</template>

<script setup lang="ts">
import { computed, ref } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { useI18n } from 'vue-i18n'
import AppLayout from '../components/AppLayout.vue'
import FeedbackPanel from '../components/listening/FeedbackPanel.vue'
import { useToast } from '../composables/useToast'
import { useUserStore } from '../stores/user'
import { getTranslationFixture } from '../mocks/translationPreview'

const route = useRoute()
const router = useRouter()
const { t } = useI18n()
const { show: toast } = useToast()
const userStore = useUserStore()

const fixture = getTranslationFixture(typeof route.query.length === 'string' ? route.query.length : 'medium')
const text = ref('')
const showHint = ref(false)
const submitted = ref(false)
const submitting = ref(false)
const previewStatus = ref<'incorrect' | 'correct'>('incorrect')

const wordCount = computed(() => text.value.trim() ? text.value.trim().split(/\s+/).length : 0)
const avatarText = computed(() => (userStore.username || 'U').slice(0, 1).toUpperCase())
const feedback = computed(() => fixture.feedback[previewStatus.value])
const feedbackStatus = computed(() => (submitted.value ? feedback.value.status : 'idle'))
const feedbackMessage = computed(() => (submitted.value ? feedback.value.message : t('translation.feedbackPending')))
const feedbackTags = computed(() => (submitted.value ? feedback.value.tags : []))

const mockSubmit = () => {
  if (!text.value.trim()) {
    toast(t('translation.emptyAnswer'), 'warning')
    return
  }
  submitting.value = true
  window.setTimeout(() => {
    submitted.value = true
    submitting.value = false
  }, 500)
}

const reset = () => {
  text.value = ''
  showHint.value = false
  submitted.value = false
  submitting.value = false
  previewStatus.value = 'incorrect'
}
</script>
