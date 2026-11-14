<template>
  <div class="grid grid-cols-1 md:grid-cols-12 gap-gutter">
    <div class="md:col-span-8 bg-tertiary rounded-3xl p-8 flex flex-col relative overflow-hidden">
      <div class="absolute -right-16 -top-16 w-56 h-56 bg-tertiary-fixed/20 rounded-full blur-3xl"></div>
      <div class="relative z-10 text-on-tertiary">
        <h3 class="font-headline-md text-headline-md mb-2">{{ $t('listening.practiceTitle') }}</h3>
        <p class="text-on-tertiary/80 font-body-md text-body-md mb-6">{{ $t('listening.entryDescription') }}</p>

        <div class="mb-6">
          <div class="font-label-lg text-label-lg text-on-tertiary/90 mb-3 flex items-center gap-1">
            <AppIcon name="category" size="lg" />
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
          class="bg-surface-container-lowest text-tertiary py-4 px-8 rounded-2xl font-label-lg text-label-lg flex items-center justify-center gap-2 hover:bg-surface-container-lowest/90 transition-colors w-full sm:w-auto sm:inline-flex"
          @click="startPractice"
        >
          <AppIcon name="play_arrow" size="lg" />{{ $t('listening.startPractice') }}
        </button>
      </div>
    </div>

    <div class="md:col-span-4 flex flex-col gap-4">
      <EntryCard to="/favorites" icon="favorite" tone="error" filled :title="$t('listening.entryFavorites')" />

      <EntryCard to="/error-book" icon="build" tone="secondary" :title="$t('listening.entryErrors')" />
    </div>

    <EntryCard to="/history" icon="hourglass_bottom" tone="tertiary" :title="$t('listening.entryHistory')" class="md:col-span-4" />

    <EntryCard icon="forum" tone="secondary" :title="$t('listening.entryAi')" class="md:col-span-4" @click="showAiComingSoon" />

    <EntryCard to="/stats" icon="graphic_eq" tone="primary" :title="$t('listening.entryStats')" class="md:col-span-4" />
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import { useI18n } from 'vue-i18n'
import ListeningTypeCard from './ListeningTypeCard.vue'
import EntryCard from '../ui/EntryCard.vue'
import AppIcon from '../ui/AppIcon.vue'
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
