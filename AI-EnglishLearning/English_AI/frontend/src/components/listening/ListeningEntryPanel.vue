<template>
  <div class="grid grid-cols-1 md:grid-cols-12 gap-gutter">
    <div class="md:col-span-8 bg-tertiary rounded-[24px] p-8 flex flex-col relative overflow-hidden">
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
            <ListeningTypeCard v-model="selectedType" value="NEWS" :label="$t('listening.typeNews')" :description="$t('listening.typeNewsDesc')" icon="chat" />
            <ListeningTypeCard v-model="selectedType" value="LONG_DIALOGUE" :label="$t('listening.typeLongDialogue')" :description="$t('listening.typeLongDialogueDesc')" icon="record_voice_over" />
            <ListeningTypeCard v-model="selectedType" value="PASSAGE" :label="$t('listening.typePassage')" :description="$t('listening.typePassageDesc')" icon="podcasts" />
            <ListeningTypeCard v-model="selectedType" value="" :label="$t('listening.typeExamOrder')" :description="$t('listening.typeExamOrderDesc')" icon="format_list_numbered" />
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

    <div class="md:col-span-4 flex flex-col gap-4">
      <router-link to="/favorites" class="bg-surface-container-lowest rounded-[24px] p-6 shadow-soft-glow flex items-center justify-between hover:bg-surface-container-lowest/80 transition-colors">
        <div class="flex items-center gap-4">
          <div class="w-10 h-10 rounded-full bg-error-container/30 flex items-center justify-center">
            <span class="material-symbols-outlined text-error" style="font-variation-settings: 'FILL' 1;">favorite</span>
          </div>
          <span class="font-body-lg text-body-lg text-on-surface">{{ $t('listening.entryFavorites') }}</span>
        </div>
        <span class="material-symbols-outlined text-outline">chevron_right</span>
      </router-link>

      <router-link to="/error-book" class="bg-surface-container-lowest rounded-[24px] p-6 shadow-soft-glow flex items-center justify-between hover:bg-surface-container-lowest/80 transition-colors">
        <div class="flex items-center gap-4">
          <div class="w-10 h-10 rounded-full bg-secondary-container/30 flex items-center justify-center">
            <span class="material-symbols-outlined text-secondary">build</span>
          </div>
          <span class="font-body-lg text-body-lg text-on-surface">{{ $t('listening.entryErrors') }}</span>
        </div>
        <span class="material-symbols-outlined text-outline">chevron_right</span>
      </router-link>
    </div>

    <router-link to="/history" class="md:col-span-4 bg-surface-container-lowest rounded-[24px] p-6 shadow-soft-glow flex items-center justify-between hover:bg-surface-container-lowest/80 transition-colors">
      <div class="flex items-center gap-4">
        <div class="w-10 h-10 rounded-full bg-tertiary-container/30 flex items-center justify-center">
          <span class="material-symbols-outlined text-tertiary">hourglass_bottom</span>
        </div>
        <span class="font-body-lg text-body-lg text-on-surface">{{ $t('listening.entryHistory') }}</span>
      </div>
      <span class="material-symbols-outlined text-outline">chevron_right</span>
    </router-link>

    <button type="button" class="md:col-span-4 bg-surface-container-lowest rounded-[24px] p-6 shadow-soft-glow flex items-center justify-between hover:bg-surface-container-lowest/80 transition-colors text-left" @click="showAiComingSoon">
      <div class="flex items-center gap-4">
        <div class="w-10 h-10 rounded-full bg-secondary-container/30 flex items-center justify-center">
          <span class="material-symbols-outlined text-secondary">psychology</span>
        </div>
        <span class="font-body-lg text-body-lg text-on-surface">{{ $t('listening.entryAi') }}</span>
      </div>
      <span class="material-symbols-outlined text-outline">chevron_right</span>
    </button>

    <router-link to="/stats" class="md:col-span-4 bg-surface-container-lowest rounded-[24px] p-6 shadow-soft-glow flex items-center justify-between hover:bg-surface-container-lowest/80 transition-colors">
      <div class="flex items-center gap-4">
        <div class="w-10 h-10 rounded-full bg-primary-container/30 flex items-center justify-center">
          <span class="material-symbols-outlined text-primary">graphic_eq</span>
        </div>
        <span class="font-body-lg text-body-lg text-on-surface">{{ $t('listening.entryStats') }}</span>
      </div>
      <span class="material-symbols-outlined text-outline">chevron_right</span>
    </router-link>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import { useI18n } from 'vue-i18n'
import ListeningTypeCard from './ListeningTypeCard.vue'
import { useToast } from '../../composables/useToast'

const router = useRouter()
const { t } = useI18n()
const { show: toast } = useToast()
const selectedType = ref('')

const startPractice = () => {
  router.push({ path: '/listening/quiz', query: selectedType.value ? { type: selectedType.value } : {} })
}

const showAiComingSoon = () => toast(t('listening.entryAiComingSoon'), 'info')
</script>
