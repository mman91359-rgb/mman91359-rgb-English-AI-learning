<template>
  <AppLayout flush hide-top-bar>
    <template #topbar>
      <div class="mx-auto flex h-20 w-full max-w-[1192px] items-center justify-between px-gutter">
        <button type="button" class="flex items-center gap-2 rounded-full px-3 py-2 font-label-lg text-label-lg text-on-surface-variant transition-colors hover:bg-surface-container-high/50" @click="router.push({ path: '/learning', query: { tab: 'writing' } })">
          <span class="material-symbols-outlined text-icon-md">arrow_back</span>
          {{ $t('writing.practice.backToLearning') }}
        </button>
        <span class="rounded-full bg-warning-container px-3 py-1 font-label-md text-label-md text-on-warning-container">
          {{ $t('writing.preview.badge') }}
        </span>
      </div>
    </template>

    <LoadingState v-if="loading" :message="$t('writing.common.loading')" />
    <ErrorState v-else-if="error" :message="error" :action-label="$t('writing.common.retry')" @retry="load" />
    <EmptyState v-else-if="!submission" icon="description" :title="$t('writing.report.notFound')" :action-label="$t('writing.entry.history')" @action="router.push('/writing/history')" />
    <div v-else class="mx-auto flex w-full max-w-[1192px] flex-col gap-6 px-gutter py-8 pb-24 md:pb-8">
      <section class="flex flex-col gap-6 rounded-2xl border border-outline-variant/40 bg-surface-container-lowest p-6 shadow-soft-glow md:flex-row md:items-center md:justify-between">
        <div class="flex items-center gap-6">
          <div
            class="relative flex h-28 w-28 shrink-0 items-center justify-center rounded-full"
            :style="{ background: `conic-gradient(rgb(var(--color-primary)) ${ratio}%, rgb(var(--color-surface-container-high)) 0)` }"
            :aria-label="$t('writing.report.scoreOf', { score: score.rawScore, max: SCORE_MAX })"
          >
            <span class="flex h-[88px] w-[88px] flex-col items-center justify-center rounded-full bg-surface-container-lowest">
              <span class="font-headline-lg text-headline-lg tabular-nums text-on-surface">{{ score.rawScore }}</span>
              <span class="font-label-sm text-label-sm text-on-surface-variant">/ {{ SCORE_MAX }}</span>
            </span>
          </div>
          <div class="flex flex-col gap-1">
            <span class="font-label-md text-label-md text-on-surface-variant">{{ $t('writing.report.title') }}</span>
            <span class="font-headline-sm text-headline-sm text-on-surface">{{ $t(SCORE_LEVEL_LABEL_KEYS[score.level]) }}</span>
            <span class="font-body-sm text-body-sm text-primary">
              {{ $t('writing.report.weighted') }}：{{ $t('writing.score.weightedValue', { score: score.weightedScore }) }}
            </span>
          </div>
        </div>
        <div class="flex flex-wrap gap-3">
          <button type="button" :class="btnSecondarySm" @click="router.push('/writing/history')">
            <span class="material-symbols-outlined text-icon-sm">history</span>
            {{ $t('writing.report.history') }}
          </button>
          <button type="button" :class="btnSecondarySm" @click="toggleFavorite">
            <span class="material-symbols-outlined text-icon-sm">{{ isFavorite ? 'favorite' : 'favorite_border' }}</span>
            {{ isFavorite ? $t('writing.report.unfavorite') : $t('writing.report.favorite') }}
          </button>
          <button type="button" :class="btnPrimarySm" @click="rewrite">
            <span class="material-symbols-outlined text-icon-sm">refresh</span>
            {{ $t('writing.report.again') }}
          </button>
        </div>
      </section>

      <div class="grid grid-cols-1 gap-6 lg:grid-cols-2">
        <section class="flex flex-col gap-4 rounded-2xl border border-outline-variant/40 bg-surface-container-lowest p-6 shadow-soft-glow">
          <h2 class="font-body-lg text-body-lg font-semibold text-on-surface">{{ $t('writing.report.dimensions') }}</h2>
          <WritingDimensionBar
            v-for="dimension in WRITING_DIMENSIONS"
            :key="dimension"
            :label="$t(DIMENSION_LABEL_KEYS[dimension])"
            :value="score.dimensions[dimension]"
            :max="DIMENSION_MAX"
          />
        </section>

        <section class="grid grid-cols-1 gap-6 sm:grid-cols-2 lg:grid-cols-1">
          <FeedbackList :title="$t('writing.report.strengths')" icon="thumb_up" :items="score.strengths" tone="success" />
          <FeedbackList :title="$t('writing.report.issues')" icon="priority_high" :items="score.issues" tone="warning" />
        </section>
      </div>

      <section class="flex flex-col gap-4">
        <h2 class="font-body-lg text-body-lg font-semibold text-on-surface">{{ $t('writing.report.corrections') }}</h2>
        <WritingCorrectionList :corrections="score.corrections" />
      </section>

      <section v-if="score.highlights.length" class="flex flex-col gap-4 rounded-2xl border border-outline-variant/40 bg-surface-container-lowest p-6 shadow-soft-glow">
        <h2 class="font-body-lg text-body-lg font-semibold text-on-surface">{{ $t('writing.report.highlights') }}</h2>
        <ul class="flex flex-col gap-2">
          <li v-for="sentence in score.highlights" :key="sentence" class="rounded-xl bg-primary-container/20 px-4 py-3 font-body-md text-body-md italic text-on-surface">
            {{ sentence }}
          </li>
        </ul>
      </section>

      <section class="flex flex-col gap-4 rounded-2xl border border-outline-variant/40 bg-surface-container-lowest p-6 shadow-soft-glow">
        <h2 class="font-body-lg text-body-lg font-semibold text-on-surface">{{ $t('writing.report.modelEssay') }}</h2>
        <p class="font-body-md text-body-md leading-relaxed text-on-surface">{{ score.modelEssay }}</p>
      </section>

      <section v-if="score.rewriteSuggestions.length" class="flex flex-col gap-4 rounded-2xl border border-outline-variant/40 bg-surface-container-lowest p-6 shadow-soft-glow">
        <h2 class="font-body-lg text-body-lg font-semibold text-on-surface">{{ $t('writing.report.rewriteSuggestions') }}</h2>
        <ul class="flex list-disc flex-col gap-1.5 pl-5 font-body-sm text-body-sm text-on-surface">
          <li v-for="item in score.rewriteSuggestions" :key="item">{{ item }}</li>
        </ul>
      </section>
    </div>
  </AppLayout>
</template>

<script setup lang="ts">
import { computed, onMounted, ref } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { useI18n } from 'vue-i18n'
import AppLayout from '../../components/AppLayout.vue'
import EmptyState from '../../components/ui/EmptyState.vue'
import ErrorState from '../../components/ui/ErrorState.vue'
import LoadingState from '../../components/ui/LoadingState.vue'
import { btnPrimarySm, btnSecondarySm } from '../../components/ui/buttonStyles'
import WritingCorrectionList from '../../components/writing/WritingCorrectionList.vue'
import WritingDimensionBar from '../../components/writing/WritingDimensionBar.vue'
import { useToast } from '../../composables/useToast'
import { fetchFavoriteIds, fetchSubmission, fetchSubmissions, setFavorite } from '../../api/writing'
import type { WritingSubmission } from '../../types/writing'
import {
  DIMENSION_LABEL_KEYS,
  DIMENSION_MAX,
  SCORE_LEVEL_LABEL_KEYS,
  SCORE_MAX,
  WRITING_DIMENSIONS,
} from '../../utils/writing'
import FeedbackList from './components/FeedbackList.vue'

const route = useRoute()
const router = useRouter()
const { t } = useI18n()
const { show: toast } = useToast()

const loading = ref(true)
const error = ref('')
const submission = ref<WritingSubmission | null>(null)
const favoriteIds = ref<string[]>([])

const score = computed(() => submission.value!.report)
const ratio = computed(() => Math.round((score.value.rawScore / SCORE_MAX) * 100))
const isFavorite = computed(() => Boolean(submission.value && favoriteIds.value.includes(submission.value.topicId)))

const load = async () => {
  loading.value = true
  error.value = ''
  try {
    const id = typeof route.query.submission === 'string' ? route.query.submission : ''
    const [loadedSubmission, favorites] = await Promise.all([
      id ? fetchSubmission(id) : Promise.resolve(null),
      fetchFavoriteIds(),
    ])
    favoriteIds.value = favorites
    // 仅在未指定 id 时才回退到最近一条；显式 id 无效应显示 notFound
    if (loadedSubmission) {
      submission.value = loadedSubmission
    } else if (!id) {
      const submissions = await fetchSubmissions()
      submission.value = submissions[0] ?? null
    } else {
      submission.value = null
    }
  } catch (e) {
    error.value = e instanceof Error ? e.message : t('writing.common.error')
  } finally {
    loading.value = false
  }
}

const toggleFavorite = async () => {
  if (!submission.value) return
  const topicId = submission.value.topicId
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

const rewrite = () => {
  if (!submission.value) return
  void router.push({ path: '/writing/practice', query: { topic: submission.value.topicId } })
}

onMounted(load)
</script>
