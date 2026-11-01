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
      <h2 class="font-headline-lg text-headline-lg text-on-surface mb-8">{{ $t('listening.moduleTitle') }}</h2>

      <div class="flex gap-2 mb-8 overflow-x-auto pb-2 scrollbar-hide">
        <button
          v-for="tab in tabs"
          :key="tab.key"
          type="button"
          class="px-6 py-2 rounded-full font-label-lg text-label-lg whitespace-nowrap transition-colors"
          :class="tab.key === 'listening'
            ? 'bg-on-surface text-surface'
            : 'text-on-surface-variant hover:bg-surface-container hover:text-on-surface'"
          @click="goTab(tab.key)"
        >{{ tab.label }}</button>
      </div>

      <div class="bg-tertiary rounded-[24px] p-8 flex flex-col relative overflow-hidden mb-gutter">
        <div class="absolute -right-16 -top-16 w-56 h-56 bg-tertiary-fixed/20 rounded-full blur-3xl"></div>
        <div class="relative z-10 text-on-tertiary">
          <h3 class="font-headline-md text-headline-md mb-2">{{ $t('listening.practiceTitle') }}</h3>
          <p class="text-on-tertiary/80 font-body-md text-body-md mb-6">{{ $t('listening.entryDescription') }}</p>

          <div class="mb-6">
            <div class="font-label-lg text-label-lg text-on-tertiary/90 mb-3 flex items-center gap-1">
              <span class="material-symbols-outlined text-base">category</span>
              {{ $t('listening.chooseType') }}
            </div>
            <div class="grid grid-cols-1 sm:grid-cols-2 gap-3">
              <ListeningTypeCard
                v-model="selectedType"
                value="NEWS"
                :label="$t('listening.typeNews')"
                :description="$t('listening.typeNewsDesc')"
                icon="chat"
              />
              <ListeningTypeCard
                v-model="selectedType"
                value="LONG_DIALOGUE"
                :label="$t('listening.typeLongDialogue')"
                :description="$t('listening.typeLongDialogueDesc')"
                icon="record_voice_over"
              />
              <ListeningTypeCard
                v-model="selectedType"
                value="PASSAGE"
                :label="$t('listening.typePassage')"
                :description="$t('listening.typePassageDesc')"
                icon="podcasts"
              />
              <ListeningTypeCard
                v-model="selectedType"
                value=""
                :label="$t('listening.typeExamOrder')"
                :description="$t('listening.typeExamOrderDesc')"
                icon="format_list_numbered"
              />
            </div>
          </div>

          <button
            type="button"
            class="bg-surface-container-lowest text-tertiary py-4 px-8 rounded-[16px] font-label-lg text-label-lg flex items-center justify-center gap-2 hover:bg-surface-container-lowest/90 transition-colors w-full sm:w-auto sm:inline-flex"
            @click="startPractice"
          >
            <span class="material-symbols-outlined">play_arrow</span>{{ $t('listening.startPractice') }}
          </button>
        </div>
      </div>

      <ListeningBentoLinks />
    </div>
  </AppLayout>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import { useI18n } from 'vue-i18n'
import AppLayout from '../components/AppLayout.vue'
import ListeningTypeCard from '../components/listening/ListeningTypeCard.vue'
import ListeningBentoLinks from '../components/listening/ListeningBentoLinks.vue'

const router = useRouter()
const { t } = useI18n()
const selectedType = ref('')

const tabs = [
  { key: 'vocab', label: t('learning.vocabTab') },
  { key: 'grammar', label: t('learning.grammarTab') },
  { key: 'translation', label: t('learning.translationTab') },
  { key: 'listening', label: t('learning.listeningTab') },
  { key: 'sentence', label: t('learning.sentenceTab') },
]

const goTab = (key: string) => {
  if (key === 'translation') {
    router.push('/translation')
    return
  }
  if (key !== 'listening') router.push('/learning')
}

const startPractice = () => {
  router.push({
    path: '/listening/quiz',
    query: selectedType.value ? { type: selectedType.value } : {},
  })
}
</script>
