<template>
  <AppLayout flush hide-top-bar>
    <template #topbar>
      <div class="mx-auto flex h-20 w-full max-w-[1192px] items-center justify-between px-gutter">
        <button type="button" :class="btnGhostSm" @click="router.push({ path: '/learning', query: { tab: 'writing' } })">
          <span class="material-symbols-outlined text-icon-sm">arrow_back</span>
          {{ $t('writing.practice.backToLearning') }}
        </button>
        <span class="rounded-full bg-warning-container px-3 py-1 font-label-md text-label-md text-on-warning-container">
          {{ $t('writing.preview.badge') }}
        </span>
      </div>
    </template>

    <div class="mx-auto flex w-full max-w-[1192px] flex-col gap-6 px-gutter py-8 pb-24 md:pb-8">
      <div class="flex flex-col gap-2">
        <h1 class="font-headline-lg text-headline-lg text-on-surface">{{ $t('writing.history.title') }}</h1>
        <p class="font-body-md text-body-md text-on-surface-variant">{{ $t('writing.history.desc') }}</p>
      </div>

      <AdminFilterBar :has-active-filters="hasFilters" @reset="clearFilters">
        <AdminFilterField :label="$t('writing.history.type')">
          <AdminFilterSelect
            :model-value="filterType"
            :options="typeOptions"
            :all-label="$t('writing.history.filterAll')"
            @update:model-value="setParams({ type: $event })"
          />
        </AdminFilterField>
        <AdminFilterField :label="$t('writing.history.level')">
          <AdminFilterSelect
            :model-value="filterLevel"
            :options="levelOptions"
            :all-label="$t('writing.history.filterAll')"
            @update:model-value="setParams({ level: $event })"
          />
        </AdminFilterField>
        <AdminFilterField :label="$t('writing.history.dateFrom')">
          <input type="date" :value="filterDateFrom" :class="inputClass" class="h-10 py-0" @change="setParams({ dateFrom: ($event.target as HTMLInputElement).value || undefined })" />
        </AdminFilterField>
        <AdminFilterField :label="$t('writing.history.dateTo')">
          <input type="date" :value="filterDateTo" :class="inputClass" class="h-10 py-0" @change="setParams({ dateTo: ($event.target as HTMLInputElement).value || undefined })" />
        </AdminFilterField>
        <AdminFilterField :label="$t('writing.history.scoreMin')" class-name="w-full sm:w-28">
          <input type="number" min="0" max="15" :value="filterScoreMin" :class="inputClass" class="h-10 py-0" @change="setParams({ scoreMin: ($event.target as HTMLInputElement).value || undefined })" />
        </AdminFilterField>
        <AdminFilterField :label="$t('writing.history.scoreMax')" class-name="w-full sm:w-28">
          <input type="number" min="0" max="15" :value="filterScoreMax" :class="inputClass" class="h-10 py-0" @change="setParams({ scoreMax: ($event.target as HTMLInputElement).value || undefined })" />
        </AdminFilterField>
        <div class="flex items-center gap-2">
          <button
            type="button"
            class="flex h-10 items-center gap-1 rounded-xl px-3 font-label-lg text-label-lg transition-colors"
            :class="filterFavorites ? 'bg-error-container/50 text-on-error-container' : 'text-on-surface-variant hover:bg-surface-container-high'"
            :aria-pressed="filterFavorites"
            @click="setParams({ favorites: filterFavorites ? undefined : '1' })"
          >
            <span class="material-symbols-outlined text-icon-sm">{{ filterFavorites ? 'favorite' : 'favorite_border' }}</span>
            {{ $t('writing.history.favoritesOnly') }}
          </button>
          <button
            type="button"
            class="flex h-10 items-center gap-1 rounded-xl px-3 font-label-lg text-label-lg transition-colors"
            :class="filterLow ? 'bg-warning-container text-on-warning-container' : 'text-on-surface-variant hover:bg-surface-container-high'"
            :aria-pressed="filterLow"
            @click="setParams({ low: filterLow ? undefined : '1' })"
          >
            <span class="material-symbols-outlined text-icon-sm">priority_high</span>
            {{ $t('writing.history.lowScoresOnly') }}
          </button>
        </div>
      </AdminFilterBar>

      <section class="rounded-2xl border border-outline-variant/40 bg-surface-container-lowest p-6 shadow-soft-glow">
        <h2 class="font-body-lg text-body-lg font-semibold text-on-surface">{{ $t('writing.history.trend') }}</h2>
        <p v-if="trendItems.length === 0" class="mt-4 font-body-sm text-body-sm text-on-surface-variant">{{ $t('writing.history.trendEmpty') }}</p>
        <div v-else class="mt-4 flex h-32 items-end gap-2">
          <div v-for="item in trendItems" :key="item.id" class="flex flex-1 flex-col items-center gap-1">
            <span class="font-label-sm text-label-sm tabular-nums text-on-surface-variant">{{ item.score }}</span>
            <div class="w-full rounded-t-lg bg-primary/70" :style="{ height: Math.max(4, ((item.score ?? 0) / SCORE_MAX) * 100) + '%' }" />
            <span class="font-label-xs text-label-xs text-outline">{{ item.createdAt.slice(5, 10) }}</span>
          </div>
        </div>
      </section>

      <LoadingState v-if="loading" :message="$t('writing.common.loading')" />
      <ErrorState v-else-if="error" :message="error" :action-label="$t('writing.common.retry')" @retry="load" />
      <EmptyState v-else-if="items.length === 0" icon="edit_note" :title="emptyTitle" />
      <ul v-else class="overflow-hidden rounded-2xl border border-outline-variant/40 bg-surface-container-lowest shadow-soft-glow">
        <li v-for="item in items" :key="item.id" class="flex flex-col gap-3 border-b border-outline-variant/40 p-5 transition-colors last:border-b-0 hover:bg-surface-container-low md:flex-row md:items-center">
          <button type="button" class="flex min-w-0 flex-1 items-center gap-4 text-left" @click="openItem(item)">
            <span class="flex h-10 w-10 shrink-0 items-center justify-center rounded-xl bg-secondary-container/60 text-on-secondary-container">
              <span class="material-symbols-outlined text-icon-md">{{ item.type ? typeIcon(item.type) : 'edit_note' }}</span>
            </span>
            <span class="flex min-w-0 flex-col gap-1">
              <span class="truncate font-body-lg text-body-lg font-semibold text-on-surface">{{ item.title }}</span>
              <span class="font-body-sm text-body-sm text-on-surface-variant">{{ formatAdminDateTime(item.createdAt) }}</span>
            </span>
          </button>
          <div class="flex flex-wrap items-center gap-x-6 gap-y-2 font-body-sm text-body-sm text-on-surface-variant md:justify-end">
            <span class="tabular-nums">{{ $t('writing.history.words', { count: item.wordCount }) }}</span>
            <span class="tabular-nums">{{ formatDuration(item.durationSeconds) }}</span>
            <span class="tabular-nums text-on-surface">{{ item.score === null ? '—' : $t('writing.history.scoreValue', { score: item.score }) }}</span>
            <StatusBadge :tone="statusMeta(item.status).tone" :label="$t(statusMeta(item.status).labelKey)" />
            <button
              type="button"
              class="flex h-9 w-9 items-center justify-center rounded-xl transition-colors"
              :class="favoriteIds.includes(item.topicId) ? 'text-error' : 'text-outline hover:bg-surface-container-high hover:text-on-surface'"
              :aria-label="favoriteIds.includes(item.topicId) ? $t('writing.entry.unfavorite') : $t('writing.entry.favorite')"
              @click.stop="toggleFavorite(item.topicId)"
            >
              <span class="material-symbols-outlined text-icon-md">{{ favoriteIds.includes(item.topicId) ? 'favorite' : 'favorite_border' }}</span>
            </button>
          </div>
        </li>
      </ul>
    </div>
  </AppLayout>
</template>

<script setup lang="ts">
import { computed, onMounted, ref } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { useI18n } from 'vue-i18n'
import AppLayout from '../../components/AppLayout.vue'
import AdminFilterBar from '../../components/admin/AdminFilterBar.vue'
import AdminFilterField from '../../components/admin/AdminFilterField.vue'
import AdminFilterSelect from '../../components/admin/AdminFilterSelect.vue'
import StatusBadge from '../../components/admin/StatusBadge.vue'
import EmptyState from '../../components/ui/EmptyState.vue'
import ErrorState from '../../components/ui/ErrorState.vue'
import LoadingState from '../../components/ui/LoadingState.vue'
import { inputClass } from '@/components/ui/formStyles'
import { btnGhostSm } from '@/components/ui/buttonStyles'
import type { BadgeTone } from '../../components/admin/tableTypes'
import { fetchDrafts, fetchFavoriteIds, fetchSubmissions, fetchWritingTopics, setFavorite } from '../../api/writing'
import type { WritingHistoryItem, WritingSubmissionStatus, WritingTopic, WritingTopicType } from '../../types/writing'
import { formatAdminDateTime } from '../../utils/format'
import { useToast } from '../../composables/useToast'
import { compactQuery, readEnum, readString } from '../../utils/query'
import {
  PASS_SCORE,
  SCORE_MAX,
  WRITING_LEVELS,
  WRITING_LEVEL_LABEL_KEYS,
  WRITING_TYPE_META,
  WRITING_TYPES,
} from '../../utils/writing'

interface HistoryRow extends WritingHistoryItem {
  updatedAt: string
}

const route = useRoute()
const router = useRouter()
const { t } = useI18n()
const { show: toast } = useToast()

const loading = ref(true)
const error = ref('')
const topics = ref<WritingTopic[]>([])
const submissions = ref<Awaited<ReturnType<typeof fetchSubmissions>>>([])
const drafts = ref<Awaited<ReturnType<typeof fetchDrafts>>>([])
const favoriteIds = ref<string[]>([])

const filterType = computed(() => readEnum(route.query, 'type', WRITING_TYPES))
const filterLevel = computed(() => readEnum(route.query, 'level', WRITING_LEVELS))
const filterDateFrom = computed(() => readString(route.query, 'dateFrom') ?? '')
const filterDateTo = computed(() => readString(route.query, 'dateTo') ?? '')
const filterScoreMin = computed(() => readString(route.query, 'scoreMin') ?? '')
const filterScoreMax = computed(() => readString(route.query, 'scoreMax') ?? '')
const filterFavorites = computed(() => route.query.favorites === '1')
const filterLow = computed(() => route.query.low === '1')
const typeOptions = computed(() => WRITING_TYPES.map((value) => ({ value, label: t(WRITING_TYPE_META[value].labelKey) })))
const levelOptions = computed(() => WRITING_LEVELS.map((value) => ({ value, label: t(WRITING_LEVEL_LABEL_KEYS[value]) })))
const typeIcon = (value: WritingTopicType) => WRITING_TYPE_META[value].icon

const hasFilters = computed(() => ['type', 'level', 'dateFrom', 'dateTo', 'scoreMin', 'scoreMax', 'favorites', 'low'].some((key) => route.query[key] !== undefined))

const topicById = computed(() => new Map(topics.value.map((topic) => [topic.id, topic])))

const allItems = computed<HistoryRow[]>(() => {
  const submissionItems: HistoryRow[] = submissions.value.map((submission) => {
    const topic = topicById.value.get(submission.topicId)
    return {
      id: submission.id,
      topicId: submission.topicId,
      title: topic?.title ?? t('writing.history.unknownTopic'),
      type: topic?.type ?? null,
      score: submission.rawScore,
      wordCount: submission.wordCount,
      durationSeconds: submission.durationSeconds,
      createdAt: submission.createdAt,
      status: 'SCORED',
      updatedAt: submission.createdAt,
    }
  })
  const draftItems: HistoryRow[] = drafts.value.map((draft) => {
    const topic = topicById.value.get(draft.topicId)
    return {
      id: `draft-${draft.topicId}`,
      topicId: draft.topicId,
      title: topic?.title ?? t('writing.history.unknownTopic'),
      type: topic?.type ?? null,
      score: null,
      wordCount: draft.wordCount,
      durationSeconds: 0,
      createdAt: draft.updatedAt,
      status: 'DRAFT',
      updatedAt: draft.updatedAt,
    }
  })
  return [...submissionItems, ...draftItems].sort((a, b) => b.createdAt.localeCompare(a.createdAt))
})

const items = computed(() => allItems.value.filter((item) => {
  if (filterType.value && item.type !== filterType.value) return false
  if (filterLevel.value) {
    const topic = topicById.value.get(item.topicId)
    if (topic?.level !== filterLevel.value) return false
  }
  const day = item.createdAt.slice(0, 10)
  if (filterDateFrom.value && day < filterDateFrom.value) return false
  if (filterDateTo.value && day > filterDateTo.value) return false
  if (filterScoreMin.value && (item.score === null || item.score < Number(filterScoreMin.value))) return false
  if (filterScoreMax.value && (item.score === null || item.score > Number(filterScoreMax.value))) return false
  if (filterFavorites.value && !favoriteIds.value.includes(item.topicId)) return false
  if (filterLow.value && (item.score === null || item.score >= PASS_SCORE)) return false
  return true
}))

const trendItems = computed(() => allItems.value
  .filter((item) => item.status === 'SCORED' && item.score !== null)
  .sort((a, b) => a.createdAt.localeCompare(b.createdAt))
  .slice(-10))

const emptyTitle = computed(() => (filterFavorites.value ? t('writing.history.emptyFavorites') : t('writing.history.empty')))

const load = async () => {
  loading.value = true
  error.value = ''
  try {
    const [loadedTopics, loadedSubmissions, loadedDrafts, favorites] = await Promise.all([
      fetchWritingTopics(),
      fetchSubmissions(),
      fetchDrafts(),
      fetchFavoriteIds(),
    ])
    topics.value = loadedTopics
    submissions.value = loadedSubmissions
    drafts.value = loadedDrafts
    favoriteIds.value = favorites
  } catch (e) {
    error.value = e instanceof Error ? e.message : t('writing.common.error')
  } finally {
    loading.value = false
  }
}

const setParams = (patch: Record<string, string | undefined>) => {
  const next = compactQuery({ ...(route.query as Record<string, string | undefined>), ...patch })
  void router.replace({ query: next })
}

const clearFilters = () => setParams({
  type: undefined,
  level: undefined,
  dateFrom: undefined,
  dateTo: undefined,
  scoreMin: undefined,
  scoreMax: undefined,
  favorites: undefined,
  low: undefined,
})

const statusMeta = (status: WritingSubmissionStatus): { tone: BadgeTone; labelKey: string } => {
  if (status === 'SCORED') return { tone: 'success', labelKey: 'writing.status.SCORED' }
  if (status === 'DRAFT') return { tone: 'neutral', labelKey: 'writing.status.DRAFT' }
  if (status === 'SCORING') return { tone: 'info', labelKey: 'writing.status.SCORING' }
  return { tone: 'danger', labelKey: 'writing.status.FAILED' }
}

const formatDuration = (seconds: number): string => {
  if (!seconds) return '—'
  const minutes = Math.floor(seconds / 60)
  const rest = seconds % 60
  return `${minutes}:${String(rest).padStart(2, '0')}`
}

const openItem = (item: HistoryRow) => {
  if (item.status === 'DRAFT') {
    void router.push({ path: '/writing/practice', query: { topic: item.topicId } })
  } else {
    void router.push({ path: '/writing/report', query: { submission: item.id } })
  }
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

onMounted(load)
</script>
