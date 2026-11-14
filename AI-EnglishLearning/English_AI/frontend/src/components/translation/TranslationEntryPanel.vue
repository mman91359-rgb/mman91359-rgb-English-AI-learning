<template>
  <div class="grid grid-cols-1 md:grid-cols-12 gap-gutter">
    <div class="md:col-span-8 bg-secondary rounded-3xl p-8 flex flex-col relative overflow-hidden">
      <div class="absolute -right-16 -top-16 w-56 h-56 bg-secondary-fixed/20 rounded-full blur-3xl"></div>
      <div class="relative z-10 text-on-secondary">
        <div class="flex flex-wrap items-center gap-2 mb-2">
          <h3 class="font-headline-md text-headline-md">{{ $t('translation.practiceTitle') }}</h3>
          <span class="bg-surface-container-lowest/20 text-on-secondary font-label-md text-label-md px-3 py-1 rounded-full">{{ $t('translation.previewBadge') }}</span>
        </div>
        <p class="text-on-secondary/80 font-body-md text-body-md mb-6">{{ $t('translation.entryDescription') }}</p>

        <div class="mb-6">
          <div class="font-label-lg text-label-lg text-on-secondary/90 mb-3 flex items-center gap-1">
            <AppIcon name="format_size" size="lg" />
            {{ $t('translation.chooseLength') }}
          </div>
          <div class="grid grid-cols-1 sm:grid-cols-3 gap-3">
            <label v-for="item in lengths" :key="item.value" class="cursor-pointer">
              <input v-model="selectedLength" type="radio" :value="item.value" class="peer sr-only" />
              <div class="bg-surface-container-lowest/15 border-2 border-surface-container-lowest/30 peer-checked:border-surface-container-lowest peer-checked:bg-surface-container-lowest/25 rounded-2xl p-4 transition-all">
                <div class="flex items-center justify-between">
                  <span class="font-label-lg text-label-lg text-on-secondary">{{ item.label }}</span>
                  <AppIcon :name="item.icon" size="sm" class="text-on-secondary" />
                </div>
                <p class="font-label-md text-label-md text-on-secondary/70 mt-1">{{ item.description }}</p>
              </div>
            </label>
          </div>
        </div>

        <button
          type="button"
          class="bg-surface-container-lowest text-secondary py-4 px-8 rounded-2xl font-label-lg text-label-lg flex items-center justify-center gap-2 hover:bg-surface-container-lowest/90 transition-colors w-full sm:w-auto sm:inline-flex"
          @click="startPractice"
        >
          <AppIcon name="play_arrow" size="lg" />{{ $t('translation.startPractice') }}
        </button>
      </div>
    </div>

    <div class="md:col-span-4 flex flex-col gap-4">
      <EntryCard to="/favorites" icon="favorite" tone="error" filled :title="$t('translation.entryFavorites')" />

      <EntryCard to="/error-book" icon="build" tone="secondary" :title="$t('translation.entryErrors')" />
    </div>

    <EntryCard to="/history" icon="hourglass_bottom" tone="tertiary" :title="$t('translation.entryHistory')" class="md:col-span-4" />

    <EntryCard icon="forum" tone="secondary" :title="$t('translation.entryAi')" class="md:col-span-4" @click="toast(t('translation.aiComingSoon'), 'info')" />

    <EntryCard icon="search" tone="secondary" :icon-alpha="20" :title="$t('translation.dictionary')" class="md:col-span-4" @click="toast(t('translation.previewUnavailable'), 'info')" />
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import { useI18n } from 'vue-i18n'
import { useToast } from '../../composables/useToast'
import EntryCard from '../ui/EntryCard.vue'
import AppIcon from '../ui/AppIcon.vue'

const router = useRouter()
const { t } = useI18n()
const { show: toast } = useToast()
const selectedLength = ref('medium')
const lengths = [
  { value: 'short', label: t('translation.lengthShort'), description: t('translation.lengthShortDesc'), icon: 'short_text' },
  { value: 'medium', label: t('translation.lengthMedium'), description: t('translation.lengthMediumDesc'), icon: 'notes' },
  { value: 'long', label: t('translation.lengthLong'), description: t('translation.lengthLongDesc'), icon: 'subject' },
]
const startPractice = () => {
  router.push({ path: '/translation/practice', query: { length: selectedLength.value } })
}
</script>
