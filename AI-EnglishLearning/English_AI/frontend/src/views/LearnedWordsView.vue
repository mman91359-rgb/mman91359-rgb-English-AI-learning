<template>
  <AppLayout flush>
    <PageHeader
      :title="$t('learnedWords.title')"
      :subtitle="$t('learnedWords.subtitle')"
      flush
    />

    <div class="mx-auto w-full max-w-3xl">
      <!-- 控制条：词数 + 日期筛选 + 分类 tab（吸顶，滚动时始终可见） -->
      <div class="sticky top-0 z-20 bg-background py-4">
        <div class="flex items-center justify-between gap-4">
          <p class="font-headline-md text-headline-md text-on-surface">
            {{ totalWords }}
            <span class="font-label-md text-label-md text-on-surface-variant">
              {{ $t('learnedWords.wordsUnit') }}
            </span>
          </p>
          <button
            type="button"
            :class="btnSecondarySm"
            :aria-label="$t('learnedWords.filterByDate')"
            @click="dateFilterVisible = true"
          >
            <AppIcon name="filter_list" size="sm" />
            {{ $t('learnedWords.filterByDate') }}
          </button>
        </div>

        <!-- 多选入口：仅「已标熟」分类需要（批量取消标熟） -->
        <div v-if="activeTab === 'FAMILIAR' && !multiSelect" class="mt-3 flex justify-end">
          <button type="button" :class="btnGhostSm" @click="multiSelect = true">
            <AppIcon name="checklist" size="sm" />
            {{ $t('learnedWords.multiSelect') }}
          </button>
        </div>

        <div class="mt-4">
          <ChipGroup
            :model-value="activeTab"
            :options="tabOptions"
            size="md"
            :wrap="false"
            :aria-label="$t('learnedWords.tabGroupLabel')"
            @update:model-value="onTabChange"
          />
        </div>

        <div
          v-if="filterDate"
          class="mt-3 flex items-center justify-between rounded-2xl bg-surface-container-low px-4 py-3"
        >
          <span class="font-label-md text-label-md text-on-surface-variant">
            {{ $t('learnedWords.filteredBy', { date: formatDate(filterDate) }) }}
          </span>
          <button
            type="button"
            :class="btnGhostSm"
            @click="clearDateFilter"
          >
            {{ $t('learnedWords.clearFilter') }}
          </button>
        </div>
      </div>

      <LoadingState v-if="loading" />

      <ErrorState
        v-else-if="loadError"
        :title="$t('learnedWords.loadFailed')"
        :message="loadError"
        :action-label="$t('common.retry')"
        @retry="load()"
      />

      <EmptyState
        v-else-if="groups.length === 0"
        icon="bookmark_border"
        :title="$t('learnedWords.emptyTitle')"
        :description="$t('learnedWords.emptyDesc')"
      />

      <!-- 日期分组列表 -->
      <div v-else class="pb-24">
        <section v-for="g in groups" :key="g.date" class="mb-6">
          <h3
            class="sticky top-28 z-10 bg-background py-2 font-label-md text-label-md text-on-surface-variant"
          >
            {{ formatDate(g.date) }}
            <span class="ml-2">{{ g.count }} {{ $t('learnedWords.wordsUnit') }}</span>
          </h3>

          <div class="rounded-2xl bg-surface-container-lowest shadow-soft-glow">
            <ListRow
              v-for="w in g.words"
              :key="w.id"
              :title="w.word"
              :subtitle="w.translation || ''"
              :clickable="false"
            >
              <template #leading>
                <input
                  v-if="multiSelect"
                  type="checkbox"
                  class="h-4 w-4 shrink-0 accent-primary"
                  :checked="selectedIds.has(w.id)"
                  :aria-label="$t('learnedWords.selectWord', { word: w.word })"
                  @click.stop
                  @change="toggleSelect(w.id)"
                />
              </template>

              <template #default>
                <p class="truncate font-headline-sm text-headline-sm text-on-surface">{{ w.word }}</p>
                <p class="mt-0.5 truncate font-body-sm text-body-sm text-on-surface-variant">
                  <span v-if="w.pos" class="italic">{{ w.pos }} · </span>{{ w.translation || '—' }}
                </p>
              </template>

              <template #trailing>
                <Tag
                  :tone="statusTone(w.status)"
                  size="sm"
                  :class="canCancelFamiliar(w) ? 'cursor-pointer' : ''"
                  @click="canCancelFamiliar(w) ? cancelFamiliar(w) : undefined"
                >
                  {{ statusLabel(w.status) }}
                </Tag>
              </template>
            </ListRow>
          </div>
        </section>

        <div v-if="hasMore" class="flex justify-center">
          <button type="button" :class="btnSecondary" :disabled="loadingMore" @click="loadMore">
            <AppIcon name="expand_more" size="sm" />
            {{ loadingMore ? $t('common.loading') : $t('learnedWords.loadMore') }}
          </button>
        </div>
      </div>
    </div>

    <!-- 多选模式下的底部批量操作条 -->
    <div
      v-if="multiSelect"
      class="fixed inset-x-0 bottom-0 z-30 border-t border-outline-variant/40 bg-surface-container-lowest px-6 py-4"
    >
      <div class="mx-auto flex max-w-3xl items-center justify-between gap-4">
        <span class="font-label-lg text-label-lg text-on-surface">
          {{ $t('learnedWords.selectedCount', { count: selectedIds.size }) }}
        </span>
        <div class="flex items-center gap-3">
          <button type="button" :class="btnGhostSm" @click="exitMultiSelect">
            {{ $t('common.close') }}
          </button>
          <button
            type="button"
            :class="btnDanger"
            :disabled="selectedIds.size === 0"
            @click="batchCancelFamiliar"
          >
            <AppIcon name="undo" size="sm" />
            {{ $t('learnedWords.batchCancelFamiliar') }}
          </button>
        </div>
      </div>
    </div>

    <!-- 按日期筛选 -->
    <BaseDialog
      :visible="dateFilterVisible"
      :title="$t('learnedWords.filterByDate')"
      max-width="max-w-md"
      @update:visible="dateFilterVisible = $event"
      @close="dateFilterVisible = false"
    >
      <div class="space-y-2">
        <button
          type="button"
          :class="filterDate === '' ? 'w-full rounded-2xl bg-surface-container-high px-4 py-3 text-left' : 'w-full rounded-2xl px-4 py-3 text-left hover:bg-surface-container'"
          @click="clearDateFilter"
        >
          <span class="font-label-lg text-label-lg text-on-surface">
            {{ $t('learnedWords.allDates') }}
          </span>
        </button>
        <button
          v-for="d in dateGroups"
          :key="d.date"
          type="button"
          :class="filterDate === d.date ? 'w-full rounded-2xl bg-surface-container-high px-4 py-3 text-left' : 'w-full rounded-2xl px-4 py-3 text-left hover:bg-surface-container'"
          @click="applyDateFilter(d.date)"
        >
          <span class="font-label-lg text-label-lg text-on-surface">{{ formatDate(d.date) }}</span>
          <span class="ml-2 font-label-md text-label-md text-on-surface-variant">
            {{ d.count }} {{ $t('learnedWords.wordsUnit') }}
          </span>
        </button>
      </div>
    </BaseDialog>
  </AppLayout>
</template>

<script setup lang="ts">
import { computed, onMounted, ref } from 'vue'
import { useI18n } from 'vue-i18n'
import AppLayout from '@/components/AppLayout.vue'
import PageHeader from '@/components/ui/PageHeader.vue'
import LoadingState from '@/components/ui/LoadingState.vue'
import ErrorState from '@/components/ui/ErrorState.vue'
import EmptyState from '@/components/ui/EmptyState.vue'
import ListRow from '@/components/ui/ListRow.vue'
import Tag from '@/components/ui/Tag.vue'
import AppIcon from '@/components/ui/AppIcon.vue'
import BaseDialog from '@/components/ui/BaseDialog.vue'
import ChipGroup from '@/components/ui/ChipGroup.vue'
import { btnDanger, btnGhostSm, btnSecondary, btnSecondarySm } from '@/components/ui/buttonStyles'
import { useToast } from '@/composables/useToast'
import { useUserStore } from '@/stores/user'
import {
  batchUnfamiliar,
  getLearnedDateGroups,
  getLearnedWords,
  markFamiliar,
  type LearnedWordDateVO,
  type LearnedWordTab,
  type LearnedWordVO,
} from '@/api/exercise'

const { t } = useI18n()
const userStore = useUserStore()
const { show: toast } = useToast()

/** 每个日期组最多取的词条数；单日学 200 词不现实，足够覆盖 */
const WORDS_PER_GROUP = 200
/** 一页加载几个日期组 */
const GROUP_PAGE_SIZE = 5

interface DateGroup {
  date: string
  count: number
  words: LearnedWordVO[]
}

const loading = ref(true)
const loadingMore = ref(false)
const loadError = ref('')
const activeTab = ref<LearnedWordTab>('LEARNING')
const dateGroups = ref<LearnedWordDateVO[]>([])
const groups = ref<DateGroup[]>([])
const groupPage = ref(1)
const hasMore = ref(false)
const totalWords = ref(0)
const filterDate = ref('')
const dateFilterVisible = ref(false)
const multiSelect = ref(false)
const selectedIds = ref<Set<number>>(new Set())

const tabOptions = computed(() => [
  { value: 'LEARNING' as LearnedWordTab, label: t('learnedWords.tabLearning') },
  { value: 'MASTERED' as LearnedWordTab, label: t('learnedWords.tabMastered') },
  { value: 'FAMILIAR' as LearnedWordTab, label: t('learnedWords.tabFamiliar') },
])

const statusLabel = (status?: string) => {
  if (status === 'FAMILIAR') return t('learnedWords.statusFamiliar')
  if (status === 'MASTERED') return t('learnedWords.statusMastered')
  return t('learnedWords.statusLearning')
}

const statusTone = (status?: string): 'primary' | 'tertiary' | 'warning' => {
  if (status === 'FAMILIAR') return 'warning'
  if (status === 'MASTERED') return 'tertiary'
  return 'primary'
}

/** 已标熟的词可取消标熟 */
const canCancelFamiliar = (w: LearnedWordVO) => w.status === 'FAMILIAR'

/** 日期格式化：后端已返回 yyyy-MM-dd 字符串，这里只拼字符串，不做 Date 转换（会差 8 小时） */
const formatDate = (d: string) => {
  const parts = d.split('-')
  if (parts.length !== 3) return d
  return `${parts[0]}年${Number(parts[1])}月${Number(parts[2])}日`
}

const load = async () => {
  const uid = userStore.userId
  if (!uid) {
    loading.value = false
    loadError.value = t('learnedWords.notLoggedIn')
    return
  }
  loading.value = true
  loadError.value = ''
  try {
    const dates = await getLearnedDateGroups(uid, activeTab.value)
    dateGroups.value = dates
    totalWords.value = dates.reduce((sum, d) => sum + d.count, 0)
    await loadGroupPage(1, true)
  } catch (e) {
    loadError.value = e instanceof Error ? e.message : t('learnedWords.loadFailed')
  } finally {
    loading.value = false
  }
}

/** 加载第 page 页的日期组及其词条 */
const loadGroupPage = async (page: number, replace: boolean) => {
  const uid = userStore.userId
  if (!uid) return
  const start = (page - 1) * GROUP_PAGE_SIZE
  const slice = filterDate.value
    ? dateGroups.value.filter(d => d.date === filterDate.value)
    : dateGroups.value.slice(start, start + GROUP_PAGE_SIZE)

  const results = await Promise.all(
    slice.map(d =>
      getLearnedWords(uid, activeTab.value, d.date, 1, WORDS_PER_GROUP).catch(() => ({
        records: [] as LearnedWordVO[], total: 0, page: 1, size: WORDS_PER_GROUP,
      })),
    ),
  )

  const newGroups: DateGroup[] = slice.map((d, i) => ({
    date: d.date,
    count: d.count,
    words: results[i].records,
  }))

  if (replace) {
    groups.value = newGroups
  } else {
    groups.value = [...groups.value, ...newGroups]
  }

  groupPage.value = page
  hasMore.value = !filterDate.value && start + GROUP_PAGE_SIZE < dateGroups.value.length
}

const loadMore = async () => {
  loadingMore.value = true
  try {
    await loadGroupPage(groupPage.value + 1, false)
  } catch (e) {
    toast(e instanceof Error ? e.message : t('learnedWords.loadFailed'), 'error')
  } finally {
    loadingMore.value = false
  }
}

const onTabChange = (tab: unknown) => {
  activeTab.value = tab as LearnedWordTab
  filterDate.value = ''
  groupPage.value = 1
  void load()
}

const applyDateFilter = (date: string) => {
  filterDate.value = date
  dateFilterVisible.value = false
  void load()
}

const clearDateFilter = () => {
  filterDate.value = ''
  dateFilterVisible.value = false
  void load()
}

const cancelFamiliar = async (w: LearnedWordVO) => {
  const uid = userStore.userId
  if (!uid) return
  try {
    await markFamiliar(w.id, uid, false)
    toast(t('learnedWords.familiarCancelled'), 'success')
    await load()
  } catch (e) {
    toast(e instanceof Error ? e.message : t('learnedWords.actionFailed'), 'error')
  }
}

const toggleSelect = (id: number) => {
  const next = new Set(selectedIds.value)
  if (next.has(id)) {
    next.delete(id)
  } else {
    next.add(id)
  }
  selectedIds.value = next
}

const exitMultiSelect = () => {
  multiSelect.value = false
  selectedIds.value = new Set()
}

const batchCancelFamiliar = async () => {
  const uid = userStore.userId
  if (!uid || selectedIds.value.size === 0) return
  try {
    const count = await batchUnfamiliar(uid, [...selectedIds.value])
    toast(t('learnedWords.batchCancelled', { count }), 'success')
    exitMultiSelect()
    await load()
  } catch (e) {
    toast(e instanceof Error ? e.message : t('learnedWords.actionFailed'), 'error')
  }
}

onMounted(() => {
  void load()
})
</script>
