<template>
  <div class="grid grid-cols-1 gap-gutter md:grid-cols-12">
    <div class="relative flex flex-col overflow-hidden rounded-[24px] bg-warning p-8 md:col-span-8">
      <div class="pointer-events-none absolute -right-16 -top-16 h-56 w-56 rounded-full bg-warning-container/30 blur-3xl" aria-hidden="true" />
      <div class="relative z-10">
        <div class="mb-2 flex flex-wrap items-center gap-2">
          <h3 class="font-headline-md text-headline-md text-on-warning">{{ $t('writing.entry.title') }}</h3>
          <span class="rounded-full bg-on-warning/15 px-3 py-1 font-label-md text-label-md text-on-warning">
            {{ $t('writing.preview.badge') }}
          </span>
        </div>
        <p class="mb-6 font-body-md text-body-md text-on-warning/80">{{ $t('writing.entry.description') }}</p>

        <div class="mb-5">
          <div class="mb-3 flex items-center gap-1 font-label-lg text-label-lg text-on-warning/90">
            <span class="material-symbols-outlined text-icon-sm">category</span>
            {{ $t('writing.entry.typeLabel') }}
          </div>
          <div class="grid grid-cols-1 gap-3 sm:grid-cols-2">
            <button
              v-for="type in WRITING_TYPES"
              :key="type"
              type="button"
              class="flex items-center justify-between rounded-[16px] border-2 p-4 text-left transition-all"
              :class="selectedType === type
                ? 'border-surface-container-lowest bg-surface-container-lowest/25'
                : 'border-on-warning/30 bg-surface-container-lowest/10 hover:border-on-warning hover:bg-surface-container-lowest/20'"
              @click="selectedType = type"
            >
              <span class="flex items-center gap-3">
                <span class="material-symbols-outlined text-on-warning">{{ WRITING_TYPE_META[type].icon }}</span>
                <span class="flex flex-col gap-0.5">
                  <span class="font-label-lg text-label-lg text-on-warning">{{ $t(WRITING_TYPE_META[type].labelKey) }}</span>
                  <span class="font-label-md text-label-md text-on-warning/70">{{ $t(WRITING_TYPE_META[type].descKey) }}</span>
                </span>
              </span>
              <span v-if="selectedType === type" class="material-symbols-outlined text-on-warning">check_circle</span>
            </button>
          </div>
        </div>

        <div class="mb-6 flex flex-col gap-3 rounded-[16px] bg-on-warning/10 p-4 sm:flex-row sm:items-center sm:justify-between">
          <div class="flex items-center gap-2">
            <span class="font-label-lg text-label-lg text-on-warning/90">{{ $t('writing.entry.levelLabel') }}</span>
            <div class="flex rounded-full bg-on-warning/10 p-1">
              <button
                v-for="level in WRITING_LEVELS"
                :key="level"
                type="button"
                class="rounded-full px-4 py-1.5 font-label-lg text-label-lg transition-colors"
                :class="selectedLevel === level ? 'bg-surface-container-lowest text-warning' : 'text-on-warning/80'"
                @click="selectedLevel = level"
              >
                {{ $t(WRITING_LEVEL_LABEL_KEYS[level]) }}
              </button>
            </div>
          </div>
          <span class="font-label-md text-label-md text-on-warning/80">
            {{ $t('writing.entry.words', { min: LEVEL_WORD_RANGE[selectedLevel][0], max: LEVEL_WORD_RANGE[selectedLevel][1] }) }}
          </span>
        </div>

        <button
          type="button"
          class="flex w-full items-center justify-center gap-2 rounded-[16px] bg-surface-container-lowest px-8 py-4 font-label-lg text-label-lg text-warning transition-colors hover:bg-surface-container-lowest/90 sm:w-auto"
          @click="startPractice"
        >
          <span class="material-symbols-outlined">play_arrow</span>
          {{ $t('writing.entry.startPractice') }}
        </button>
      </div>
    </div>

    <div class="flex flex-col gap-4 md:col-span-4">
      <button type="button" class="flex items-center justify-between rounded-[24px] bg-surface-container-lowest p-6 text-left shadow-soft-glow transition-colors hover:bg-surface-container-lowest/80" @click="favoritesOpen = true">
        <span class="flex items-center gap-4">
          <span class="flex h-10 w-10 items-center justify-center rounded-full bg-error-container/30">
            <span class="material-symbols-outlined text-error" style="font-variation-settings: 'FILL' 1;">favorite</span>
          </span>
          <span class="flex flex-col gap-0.5">
            <span class="font-body-lg text-body-lg text-on-surface">{{ $t('writing.entry.favorites') }}</span>
            <span class="font-label-md text-label-md text-on-surface-variant">{{ $t('writing.entry.favoritesDesc') }}</span>
          </span>
        </span>
        <span class="material-symbols-outlined text-outline">chevron_right</span>
      </button>

      <button type="button" class="flex items-center justify-between rounded-[24px] bg-surface-container-lowest p-6 text-left shadow-soft-glow transition-colors hover:bg-surface-container-lowest/80" @click="router.push({ path: '/writing/history', query: { low: '1' } })">
        <span class="flex items-center gap-4">
          <span class="flex h-10 w-10 items-center justify-center rounded-full bg-secondary-container/30">
            <span class="material-symbols-outlined text-secondary">build</span>
          </span>
          <span class="flex flex-col gap-0.5">
            <span class="font-body-lg text-body-lg text-on-surface">{{ $t('writing.entry.errors') }}</span>
            <span class="font-label-md text-label-md text-on-surface-variant">{{ $t('writing.entry.errorsDesc') }}</span>
          </span>
        </span>
        <span class="material-symbols-outlined text-outline">chevron_right</span>
      </button>
    </div>

    <button type="button" class="flex items-center justify-between rounded-[24px] bg-surface-container-lowest p-6 text-left shadow-soft-glow transition-colors hover:bg-surface-container-lowest/80 md:col-span-4" @click="router.push('/writing/history')">
      <span class="flex items-center gap-4">
        <span class="flex h-10 w-10 items-center justify-center rounded-full bg-tertiary-container/30">
          <span class="material-symbols-outlined text-tertiary">hourglass_bottom</span>
        </span>
        <span class="flex flex-col gap-0.5">
          <span class="font-body-lg text-body-lg text-on-surface">{{ $t('writing.entry.history') }}</span>
          <span class="font-label-md text-label-md text-on-surface-variant">{{ $t('writing.entry.historyDesc') }}</span>
        </span>
      </span>
      <span class="material-symbols-outlined text-outline">chevron_right</span>
    </button>

    <button type="button" class="flex items-center justify-between rounded-[24px] bg-surface-container-lowest p-6 text-left shadow-soft-glow transition-colors hover:bg-surface-container-lowest/80 md:col-span-4" @click="openLatestReport">
      <span class="flex items-center gap-4">
        <span class="flex h-10 w-10 items-center justify-center rounded-full bg-primary-container/30">
          <span class="material-symbols-outlined text-primary">insights</span>
        </span>
        <span class="flex flex-col gap-0.5">
          <span class="font-body-lg text-body-lg text-on-surface">{{ $t('writing.entry.report') }}</span>
          <span class="font-label-md text-label-md text-on-surface-variant">{{ $t('writing.entry.reportDesc') }}</span>
        </span>
      </span>
      <span class="material-symbols-outlined text-outline">chevron_right</span>
    </button>

    <button type="button" class="flex items-center justify-between rounded-[24px] bg-surface-container-lowest p-6 text-left shadow-soft-glow transition-colors hover:bg-surface-container-lowest/80 md:col-span-4" @click="toast($t('writing.entry.aiComingSoon'), 'info')">
      <span class="flex items-center gap-4">
        <span class="flex h-10 w-10 items-center justify-center rounded-full bg-secondary-container/30">
          <span class="material-symbols-outlined text-secondary">psychology</span>
        </span>
        <span class="flex flex-col gap-0.5">
          <span class="font-body-lg text-body-lg text-on-surface">{{ $t('writing.entry.ai') }}</span>
          <span class="font-label-md text-label-md text-on-surface-variant">{{ $t('writing.entry.aiDesc') }}</span>
        </span>
      </span>
      <span class="material-symbols-outlined text-outline">chevron_right</span>
    </button>

    <WritingTopicPickerDialog
      v-model:visible="favoritesOpen"
      :title="$t('writing.entry.favorites')"
      :topics="favoriteTopics"
      :favorite-ids="favoriteIds"
      @select="startTopic"
      @toggle-favorite="toggleFavorite"
    />
  </div>
</template>

<script setup lang="ts">
import { computed, onMounted, ref } from 'vue'
import { useRouter } from 'vue-router'
import { useI18n } from 'vue-i18n'
import WritingTopicPickerDialog from './WritingTopicPickerDialog.vue'
import { useToast } from '../../composables/useToast'
import { fetchFavoriteIds, fetchSubmissions, fetchWritingTopics, setFavorite } from '../../api/writing'
import type { WritingLevel, WritingTopic, WritingTopicType } from '../../types/writing'
import {
  LEVEL_WORD_RANGE,
  WRITING_LEVELS,
  WRITING_LEVEL_LABEL_KEYS,
  WRITING_TYPE_META,
  WRITING_TYPES,
} from '../../utils/writing'

const router = useRouter()
const { t } = useI18n()
const { show: toast } = useToast()

const topics = ref<WritingTopic[]>([])
const favoriteIds = ref<string[]>([])
const latestSubmissionId = ref<string | null>(null)
const selectedType = ref<WritingTopicType>('SHORT_ESSAY')
const selectedLevel = ref<WritingLevel>('CET4')
const favoritesOpen = ref(false)

const favoriteTopics = computed(() => topics.value.filter((topic) => favoriteIds.value.includes(topic.id)))

const startPractice = () => {
  void router.push({
    path: '/writing/practice',
    query: { type: selectedType.value, level: selectedLevel.value },
  })
}

const startTopic = (topicId: string) => {
  favoritesOpen.value = false
  const topic = topics.value.find((item) => item.id === topicId)
  void router.push({
    path: '/writing/practice',
    query: topic ? { topic: topic.id, type: topic.type, level: topic.level } : { topic: topicId },
  })
}

const toggleFavorite = async (topicId: string) => {
  const next = !favoriteIds.value.includes(topicId)
  const previous = favoriteIds.value
  favoriteIds.value = next ? [...previous, topicId] : previous.filter((id) => id !== topicId)
  try {
    await setFavorite(topicId, next)
  } catch {
    favoriteIds.value = previous
    toast(t('writing.library.favoriteFailed'), 'error')
  }
}

const openLatestReport = () => {
  if (latestSubmissionId.value) {
    void router.push({ path: '/writing/report', query: { submission: latestSubmissionId.value } })
  } else {
    void router.push('/writing/history')
  }
}

onMounted(async () => {
  const [loadedTopics, loadedFavorites, submissions] = await Promise.all([
    fetchWritingTopics(),
    fetchFavoriteIds(),
    fetchSubmissions(),
  ])
  topics.value = loadedTopics
  favoriteIds.value = loadedFavorites
  latestSubmissionId.value = submissions[0]?.id ?? null
})
</script>
