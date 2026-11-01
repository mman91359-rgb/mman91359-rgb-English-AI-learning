<template>
  <AppLayout flush hide-coin-badge>
    <div class="flex-1 w-full max-w-container-max mx-auto px-gutter py-8 pb-24 md:pb-8">
      <button
        type="button"
        class="inline-flex items-center gap-1 text-on-surface-variant hover:text-primary transition-colors mb-6 font-label-lg text-label-lg"
        @click="router.push('/learning')"
      >
        <span class="material-symbols-outlined text-base">arrow_back_ios_new</span>
        {{ $t('listening.backToLearning') }}
      </button>

      <div class="flex flex-wrap items-center gap-3 mb-8">
        <h2 class="font-headline-lg text-headline-lg text-on-surface">{{ $t('translation.moduleTitle') }}</h2>
        <span class="bg-secondary-container/30 text-secondary font-label-md text-label-md px-3 py-1 rounded-full">
          {{ $t('translation.previewBadge') }}
        </span>
      </div>

      <div class="flex gap-2 mb-8 overflow-x-auto pb-2 scrollbar-hide">
        <button
          v-for="tab in tabs"
          :key="tab.key"
          type="button"
          class="px-6 py-2 rounded-full font-label-lg text-label-lg whitespace-nowrap transition-colors"
          :class="tab.key === 'translation'
            ? 'bg-on-surface text-surface'
            : 'text-on-surface-variant hover:bg-surface-container hover:text-on-surface'"
          @click="goTab(tab.key)"
        >{{ tab.label }}</button>
      </div>

      <div class="bg-secondary rounded-[24px] p-8 flex flex-col relative overflow-hidden mb-gutter">
        <div class="absolute -right-16 -top-16 w-56 h-56 bg-secondary-fixed/20 rounded-full blur-3xl"></div>
        <div class="relative z-10 text-on-secondary">
          <h3 class="font-headline-md text-headline-md mb-2">{{ $t('translation.practiceTitle') }}</h3>
          <p class="text-on-secondary/80 font-body-md text-body-md mb-6">{{ $t('translation.entryDescription') }}</p>

          <div class="mb-6">
            <div class="font-label-lg text-label-lg text-on-secondary/90 mb-3 flex items-center gap-1">
              <span class="material-symbols-outlined text-base">format_size</span>
              {{ $t('translation.chooseLength') }}
            </div>
            <div class="grid grid-cols-1 sm:grid-cols-3 gap-3">
              <label
                v-for="item in lengths"
                :key="item.value"
                class="cursor-pointer"
              >
                <input v-model="selectedLength" type="radio" :value="item.value" class="peer sr-only" />
                <div class="bg-surface-container-lowest/15 border-2 border-surface-container-lowest/30 peer-checked:border-surface-container-lowest peer-checked:bg-surface-container-lowest/25 rounded-[16px] p-4 transition-all">
                  <div class="flex items-center justify-between">
                    <span class="font-label-lg text-label-lg text-on-secondary">{{ item.label }}</span>
                    <span class="material-symbols-outlined text-on-secondary text-[18px]">{{ item.icon }}</span>
                  </div>
                  <p class="font-label-md text-label-md text-on-secondary/70 mt-1">{{ item.description }}</p>
                </div>
              </label>
            </div>
          </div>

          <button
            type="button"
            class="bg-surface-container-lowest text-secondary py-4 px-8 rounded-[16px] font-label-lg text-label-lg flex items-center justify-center gap-2 hover:bg-surface-container-lowest/90 transition-colors w-full sm:w-auto sm:inline-flex"
            @click="startPractice"
          >
            <span class="material-symbols-outlined">play_arrow</span>{{ $t('translation.startPractice') }}
          </button>
        </div>
      </div>

      <div class="grid grid-cols-1 md:grid-cols-12 gap-gutter">
        <div class="col-span-1 md:col-span-6 flex flex-col gap-4">
          <router-link to="/favorites" class="bg-surface-container-lowest rounded-[24px] p-6 shadow-[0_4px_20px_rgba(51,58,72,0.05)] flex items-center justify-between hover:bg-surface-container-lowest/80 transition-colors">
            <div class="flex items-center gap-4">
              <div class="w-10 h-10 rounded-full bg-error-container/30 flex items-center justify-center"><span class="material-symbols-outlined text-error" style="font-variation-settings: 'FILL' 1;">favorite</span></div>
              <span class="font-body-lg text-body-lg text-on-surface">{{ $t('translation.entryFavorites') }}</span>
            </div>
            <span class="material-symbols-outlined text-outline">chevron_right</span>
          </router-link>
          <router-link to="/error-book" class="bg-surface-container-lowest rounded-[24px] p-6 shadow-[0_4px_20px_rgba(51,58,72,0.05)] flex items-center justify-between hover:bg-surface-container-lowest/80 transition-colors">
            <div class="flex items-center gap-4">
              <div class="w-10 h-10 rounded-full bg-secondary-container/30 flex items-center justify-center"><span class="material-symbols-outlined text-secondary">build</span></div>
              <span class="font-body-lg text-body-lg text-on-surface">{{ $t('translation.entryErrors') }}</span>
            </div>
            <span class="material-symbols-outlined text-outline">chevron_right</span>
          </router-link>
        </div>
        <div class="col-span-1 md:col-span-6 flex flex-col gap-4">
          <router-link to="/history" class="bg-surface-container-lowest rounded-[24px] p-6 shadow-[0_4px_20px_rgba(51,58,72,0.05)] flex items-center justify-between hover:bg-surface-container-lowest/80 transition-colors">
            <div class="flex items-center gap-4">
              <div class="w-10 h-10 rounded-full bg-tertiary-container/30 flex items-center justify-center"><span class="material-symbols-outlined text-tertiary">hourglass_bottom</span></div>
              <span class="font-body-lg text-body-lg text-on-surface">{{ $t('translation.entryHistory') }}</span>
            </div>
            <span class="material-symbols-outlined text-outline">chevron_right</span>
          </router-link>
          <button type="button" class="bg-surface-container-lowest rounded-[24px] p-6 shadow-[0_4px_20px_rgba(51,58,72,0.05)] flex items-center justify-between hover:bg-surface-container-lowest/80 transition-colors text-left" @click="toast(t('translation.aiComingSoon'), 'info')">
            <div class="flex items-center gap-4">
              <div class="w-10 h-10 rounded-full bg-secondary-container/30 flex items-center justify-center"><span class="material-symbols-outlined text-secondary">psychology</span></div>
              <span class="font-body-lg text-body-lg text-on-surface">{{ $t('translation.entryAi') }}</span>
            </div>
            <span class="material-symbols-outlined text-outline">chevron_right</span>
          </button>
        </div>
      </div>

      <div class="mt-gutter bg-surface-container-lowest rounded-[24px] p-6 shadow-[0_4px_20px_rgba(51,58,72,0.05)]">
        <div class="flex items-center gap-4">
          <div class="w-10 h-10 rounded-full bg-secondary-container/20 flex items-center justify-center"><span class="material-symbols-outlined text-secondary">search</span></div>
          <span class="font-body-lg text-body-lg text-on-surface">{{ $t('translation.dictionary') }}</span>
        </div>
      </div>
    </div>
  </AppLayout>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import { useI18n } from 'vue-i18n'
import AppLayout from '../components/AppLayout.vue'
import { useToast } from '../composables/useToast'

const router = useRouter()
const { t } = useI18n()
const { show: toast } = useToast()

const selectedLength = ref('medium')
const tabs = [
  { key: 'vocab', label: t('learning.vocabTab') },
  { key: 'grammar', label: t('learning.grammarTab') },
  { key: 'translation', label: t('learning.translationTab') },
  { key: 'listening', label: t('learning.listeningTab') },
  { key: 'sentence', label: t('learning.sentenceTab') },
]
const lengths = [
  { value: 'short', label: t('translation.lengthShort'), description: t('translation.lengthShortDesc'), icon: 'short_text' },
  { value: 'medium', label: t('translation.lengthMedium'), description: t('translation.lengthMediumDesc'), icon: 'notes' },
  { value: 'long', label: t('translation.lengthLong'), description: t('translation.lengthLongDesc'), icon: 'subject' },
]

const goTab = (key: string) => {
  if (key === 'listening') {
    router.push('/listening')
    return
  }
  if (key !== 'translation') router.push('/learning')
}

const startPractice = () => {
  router.push({ path: '/translation/practice', query: { length: selectedLength.value } })
}
</script>
