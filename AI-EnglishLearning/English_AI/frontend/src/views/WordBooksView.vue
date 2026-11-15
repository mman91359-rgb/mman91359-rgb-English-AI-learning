<template>
  <AppLayout flush>
    <PageHeader
      :title="$t('wordBook.title')"
      :subtitle="$t('wordBook.subtitle')"
      flush
    />

    <div class="mt-6 space-y-6">
      <LoadingState v-if="loading" />

      <ErrorState
        v-else-if="loadError"
        :title="$t('wordBook.loadFailed')"
        :message="loadError"
        :action-label="$t('common.retry')"
        @retry="load"
      />

      <EmptyState
        v-else-if="books.length === 0"
        icon="library_books"
        :title="$t('wordBook.noBooks')"
      />

      <template v-else>
        <!-- 当前词书：展示这本书的整体进度与下一步动作 -->
        <section
          v-if="activeBook"
          class="relative overflow-hidden rounded-3xl bg-primary p-6 text-on-primary sm:p-8"
        >
          <div
            class="pointer-events-none absolute -right-16 -top-16 h-56 w-56 rounded-full bg-primary-fixed/20 blur-3xl"
            aria-hidden="true"
          />
          <div class="relative z-10 flex flex-col gap-6 lg:flex-row lg:items-end lg:justify-between">
            <div class="max-w-2xl">
              <div class="mb-3 flex flex-wrap items-center gap-2">
                <Tag tone="neutral" size="md">
                  {{ hasActiveBook ? $t('wordBook.current') : $t('wordBook.notSelected') }}
                </Tag>
                <Tag v-if="activeBook.level" tone="neutral" size="md">
                  {{ activeBook.level }}
                </Tag>
              </div>
              <h2 class="font-headline-lg text-headline-lg">{{ activeBook.name }}</h2>
              <p v-if="activeBook.description" class="mt-2 max-w-xl font-body-sm text-body-sm text-on-primary/80">
                {{ activeBook.description }}
              </p>

              <div class="mt-6 grid grid-cols-2 gap-3 sm:grid-cols-4">
                <div class="rounded-2xl bg-on-primary/10 p-4">
                  <p class="font-headline-md text-headline-md">{{ heroStats.total }}</p>
                  <p class="mt-1 font-label-sm text-label-sm text-on-primary/70">{{ $t('wordBook.total') }}</p>
                </div>
                <div class="rounded-2xl bg-on-primary/10 p-4">
                  <p class="font-headline-md text-headline-md">{{ heroStats.learned }}</p>
                  <p class="mt-1 font-label-sm text-label-sm text-on-primary/70">{{ $t('wordBook.learned') }}</p>
                </div>
                <div class="rounded-2xl bg-on-primary/10 p-4">
                  <p class="font-headline-md text-headline-md">{{ heroStats.toLearn }}</p>
                  <p class="mt-1 font-label-sm text-label-sm text-on-primary/70">{{ $t('wordBook.toLearn') }}</p>
                </div>
                <div class="rounded-2xl bg-on-primary/10 p-4">
                  <p class="font-headline-md text-headline-md">{{ heroStats.todayPlan }}</p>
                  <p class="mt-1 font-label-sm text-label-sm text-on-primary/70">{{ $t('wordBook.todayPlan') }}</p>
                </div>
              </div>
            </div>

            <div class="w-full shrink-0 lg:w-80">
              <div class="mb-2 flex items-center justify-between font-label-md text-label-md">
                <span class="text-on-primary/70">{{ $t('wordBook.progress') }}</span>
                <span>{{ progressPercent(activeBook) }}%</span>
              </div>
              <ProgressBar
                :value="heroStats.learned"
                :max="Math.max(heroStats.total, 1)"
                tone="tertiary"
                size="lg"
                :label="$t('wordBook.progress')"
              />
              <div class="mt-4 flex flex-wrap gap-3">
                <button
                  type="button"
                  :class="btnPrimaryInverse"
                  :disabled="switchingCode === activeBook.code"
                  @click="hasActiveBook ? startLearning(activeBook) : setActiveBook(activeBook)"
                >
                  <AppIcon :name="hasActiveBook ? 'play_arrow' : 'check'" size="sm" />
                  {{ hasActiveBook ? $t('wordBook.learning') : $t('wordBook.setActive') }}
                </button>
                <button
                  type="button"
                  :class="btnSecondaryInverse"
                  @click="openWordList(activeBook)"
                >
                  <AppIcon name="format_list_bulleted" size="sm" />
                  {{ $t('wordBook.viewWords') }}
                </button>
              </div>
            </div>
          </div>
        </section>

        <!-- 词书陈列 -->
        <section>
          <div class="mb-4 flex items-end justify-between gap-4">
            <div>
              <h3 class="font-headline-md text-headline-md text-on-surface">{{ $t('wordBook.allBooks') }}</h3>
              <p class="mt-1 font-body-sm text-body-sm text-on-surface-variant">{{ $t('wordBook.listHint') }}</p>
            </div>
            <span class="shrink-0 font-label-md text-label-md text-on-surface-variant">
              {{ $t('wordBook.bookCount', { count: books.length }) }}
            </span>
          </div>

          <div class="grid grid-cols-1 gap-4 md:grid-cols-2 xl:grid-cols-3">
            <article
              v-for="book in books"
              :key="book.code"
              class="flex flex-col rounded-3xl border bg-surface-container-lowest p-6 shadow-soft-glow transition-colors"
              :class="isActive(book) ? 'border-primary' : 'border-outline-variant/40'"
            >
              <div class="flex items-start justify-between gap-3">
                <div class="flex min-w-0 items-start gap-3">
                  <div
                    class="flex h-12 w-12 shrink-0 items-center justify-center rounded-2xl"
                    :class="bookTone(book.code)"
                  >
                    <AppIcon name="menu_book" size="lg" />
                  </div>
                  <div class="min-w-0">
                    <h4 class="truncate font-headline-sm text-headline-sm text-on-surface">{{ book.name }}</h4>
                    <p class="mt-1 font-label-md text-label-md text-on-surface-variant">
                      {{ book.level }}<span v-if="book.code"> · {{ book.code }}</span>
                    </p>
                  </div>
                </div>
                <Tag v-if="isActive(book)" tone="primary" size="sm">
                  {{ $t('wordBook.active') }}
                </Tag>
              </div>

              <p class="mt-3 line-clamp-2 min-h-10 font-body-sm text-body-sm text-on-surface-variant">
                {{ book.description || '—' }}
              </p>

              <div class="mt-4 flex items-center justify-between font-label-md text-label-md">
                <span class="text-on-surface-variant">{{ $t('wordBook.totalWords', { count: statsFor(book).total }) }}</span>
                <span class="font-bold text-primary">{{ progressPercent(book) }}%</span>
              </div>
              <ProgressBar
                class="mt-2"
                :value="statsFor(book).learned"
                :max="Math.max(statsFor(book).total, 1)"
                tone="primary"
                size="sm"
                :label="$t('wordBook.progress')"
              />

              <div class="mt-3 grid grid-cols-3 gap-2 text-center">
                <div class="rounded-xl bg-surface-container-low p-4">
                  <p class="font-label-lg text-label-lg text-on-surface">{{ statsFor(book).learned }}</p>
                  <p class="font-label-sm text-label-sm text-on-surface-variant">{{ $t('wordBook.learned') }}</p>
                </div>
                <div class="rounded-xl bg-surface-container-low p-4">
                  <p class="font-label-lg text-label-lg text-on-surface">{{ statsFor(book).mastered }}</p>
                  <p class="font-label-sm text-label-sm text-on-surface-variant">{{ $t('wordBook.mastered') }}</p>
                </div>
                <div class="rounded-xl bg-surface-container-low p-4">
                  <p class="font-label-lg text-label-lg text-on-surface">{{ statsFor(book).toLearn }}</p>
                  <p class="font-label-sm text-label-sm text-on-surface-variant">{{ $t('wordBook.toLearn') }}</p>
                </div>
              </div>
              <div class="mt-2 flex items-center justify-between font-label-sm text-label-sm text-on-surface-variant">
                <span>{{ $t('wordBook.familiar') }} {{ statsFor(book).familiar }}</span>
                <span>{{ $t('wordBook.todayPlan') }} {{ statsFor(book).todayPlan }}</span>
              </div>

              <div class="mt-4 flex flex-wrap gap-2">
                <button
                  v-if="!isActive(book)"
                  type="button"
                  :class="btnSecondarySm"
                  :disabled="switchingCode === book.code"
                  @click="setActiveBook(book)"
                >
                  <AppIcon name="check" size="sm" />
                  {{ $t('wordBook.setActive') }}
                </button>
                <button
                  v-else
                  type="button"
                  :class="btnPrimarySm"
                  :disabled="switchingCode === book.code"
                  @click="startLearning(book)"
                >
                  <AppIcon name="play_arrow" size="sm" />
                  {{ $t('wordBook.learning') }}
                </button>
                <button type="button" :class="btnSecondarySm" @click="openWordList(book)">
                  <AppIcon name="format_list_bulleted" size="sm" />
                  {{ $t('wordBook.viewWords') }}
                </button>
              </div>
            </article>
          </div>
        </section>
      </template>
    </div>

    <!-- 词书单词表：页内弹窗，不新增二级详情页 -->
    <BaseDialog
      :visible="wordDialogVisible"
      :title="$t('wordBook.wordsTitle', { name: selectedBook?.name || '' })"
      max-width="max-w-4xl"
      @update:visible="wordDialogVisible = $event"
      @close="wordDialogVisible = false"
    >
      <div class="space-y-4">
        <div class="flex flex-col gap-3 sm:flex-row">
          <input
            v-model="wordKeyword"
            :class="[inputClass, 'flex-1']"
            :placeholder="$t('wordBook.searchPlaceholder')"
            @keydown.enter.prevent="searchWords"
          />
          <button type="button" :class="btnPrimary" @click="searchWords">
            <AppIcon name="search" size="sm" />
            {{ $t('wordBook.search') }}
          </button>
        </div>

        <!-- 分类筛选：全部 / 未学习 / 复习中 / 复习完成 / 已标熟（后端 SQL 层过滤，分页同口径） -->
        <ChipGroup
          :model-value="wordFilter"
          :options="wordFilterOptions"
          size="md"
          :wrap="true"
          :aria-label="$t('wordBook.filterGroupLabel')"
          @update:model-value="onWordFilterChange"
        />

        <div class="flex flex-wrap items-center justify-between gap-2">
          <p class="font-label-md text-label-md text-on-surface-variant">
            {{ $t('wordBook.wordsCount', { count: wordTotal }) }}
          </p>
          <p v-if="selectedBook" class="font-label-md text-label-md text-on-surface-variant">
            {{ selectedBook.code }}
          </p>
        </div>

        <LoadingState v-if="wordsLoading" :message="$t('common.loading')" />

        <ErrorState
          v-else-if="wordsError"
          :title="$t('wordBook.loadFailed')"
          :message="wordsError"
          :action-label="$t('common.retry')"
          @retry="loadWords"
        />

        <EmptyState
          v-else-if="words.length === 0"
          icon="search_off"
          :title="$t('wordBook.noWords')"
        />

        <div v-else class="space-y-2">
          <div
            v-for="item in words"
            :key="`${item.word}-${item.rankNo}`"
            class="flex items-start gap-3 rounded-2xl bg-surface-container-low p-4"
          >
            <span class="mt-1 w-10 shrink-0 text-right font-label-sm text-label-sm text-on-surface-variant">
              {{ item.rankNo ?? '-' }}
            </span>
            <div class="min-w-0 flex-1">
              <div class="flex flex-wrap items-baseline gap-x-2 gap-y-1">
                <span class="font-headline-sm text-headline-sm text-on-surface">{{ item.word }}</span>
                <span v-if="item.pos" class="font-label-sm text-label-sm italic text-primary">{{ item.pos }}</span>
                <span v-if="item.phonetic" class="font-body-sm text-body-sm text-on-surface-variant">
                  {{ item.phonetic }}
                </span>
                <Tag :tone="statusTone(item)" size="sm" class="ml-auto">
                  {{ statusLabel(item) }}
                </Tag>
              </div>
              <p class="mt-1 font-body-sm text-body-sm text-on-surface-variant">
                {{ item.translation || '—' }}
              </p>
              <p v-if="item.example" class="mt-1 truncate font-body-sm text-body-sm text-on-surface-variant/80">
                {{ item.example }}
              </p>
            </div>
          </div>
        </div>

        <div v-if="!wordsLoading && !wordsError && wordTotal > 0" class="flex items-center justify-between gap-3 pt-2">
          <button
            type="button"
            :class="btnSecondarySm"
            :disabled="wordPage <= 1"
            @click="changeWordPage(-1)"
          >
            {{ $t('wordBook.pagePrev') }}
          </button>
          <span class="font-label-md text-label-md text-on-surface-variant">
            {{ $t('wordBook.pageInfo', { page: wordPage, pages: wordPageCount }) }}
          </span>
          <button
            type="button"
            :class="btnSecondarySm"
            :disabled="wordPage >= wordPageCount"
            @click="changeWordPage(1)"
          >
            {{ $t('wordBook.pageNext') }}
          </button>
        </div>
      </div>
    </BaseDialog>
  </AppLayout>
</template>

<script setup lang="ts">
import { computed, onMounted, ref } from 'vue'
import { useRouter } from 'vue-router'
import { useI18n } from 'vue-i18n'
import AppLayout from '@/components/AppLayout.vue'
import PageHeader from '@/components/ui/PageHeader.vue'
import LoadingState from '@/components/ui/LoadingState.vue'
import ErrorState from '@/components/ui/ErrorState.vue'
import EmptyState from '@/components/ui/EmptyState.vue'
import ProgressBar from '@/components/ui/ProgressBar.vue'
import AppIcon from '@/components/ui/AppIcon.vue'
import BaseDialog from '@/components/ui/BaseDialog.vue'
import Tag from '@/components/ui/Tag.vue'
import ChipGroup from '@/components/ui/ChipGroup.vue'
import {
  btnPrimary,
  btnPrimaryInverse,
  btnPrimarySm,
  btnSecondaryInverse,
  btnSecondarySm,
} from '@/components/ui/buttonStyles'
import { inputClass } from '@/components/ui/formStyles'
import { useToast } from '@/composables/useToast'
import { useUserStore } from '@/stores/user'
import {
  getWordBooks,
  getWordBookStats,
  getWordBookWords,
  type WordBookVO,
  type WordBookStatsVO,
  type WordBookWordVO,
  type WordBookWordFilter,
} from '@/api/exercise'

const { t } = useI18n()
const router = useRouter()
const userStore = useUserStore()
const { show: toast } = useToast()

const loading = ref(true)
const loadError = ref('')
const books = ref<WordBookVO[]>([])
const stats = ref<Record<string, WordBookStatsVO>>({})
const switchingCode = ref('')

const wordDialogVisible = ref(false)
const selectedCode = ref('')
const words = ref<WordBookWordVO[]>([])
const wordTotal = ref(0)
const wordPage = ref(1)
const wordSize = 20
const wordKeyword = ref('')
const wordFilter = ref<WordBookWordFilter>('ALL')
const wordsLoading = ref(false)
const wordsError = ref('')
let wordRequestToken = 0

const wordFilterOptions = computed(() => [
  { value: 'ALL' as WordBookWordFilter, label: t('wordBook.filterAll') },
  { value: 'NEW' as WordBookWordFilter, label: t('wordBook.filterNew') },
  { value: 'LEARNING' as WordBookWordFilter, label: t('wordBook.filterLearning') },
  { value: 'MASTERED' as WordBookWordFilter, label: t('wordBook.filterMastered') },
  { value: 'FAMILIAR' as WordBookWordFilter, label: t('wordBook.filterFamiliar') },
])

const activeBook = computed(() => {
  const current = books.value.find(book => book.id === userStore.activeWordBookId)
  return current || books.value[0]
})

const hasActiveBook = computed(() =>
  books.value.some(book => book.id === userStore.activeWordBookId))

const heroStats = computed(() => statsFor(activeBook.value))

const selectedBook = computed(() =>
  books.value.find(book => book.code === selectedCode.value) || books.value[0])

const wordPageCount = computed(() =>
  Math.max(1, Math.ceil(wordTotal.value / wordSize)))

const isActive = (book: WordBookVO) => book.id === userStore.activeWordBookId

/** 统计尚未加载完成时，用词书总词数兜底，避免卡片显示 0/0。 */
const statsFor = (book?: WordBookVO): WordBookStatsVO => {
  if (!book) {
    return { bookCode: '', total: 0, learned: 0, mastered: 0, familiar: 0, toLearn: 0, todayPlan: 0 }
  }
  return stats.value[book.code] || {
    bookCode: book.code,
    total: book.total,
    learned: 0,
    mastered: 0,
    familiar: 0,
    toLearn: book.total,
    todayPlan: 0,
  }
}

const progressPercent = (book: WordBookVO) => {
  const current = statsFor(book)
  if (current.total <= 0) return 0
  return Math.min(100, Math.round((current.learned / current.total) * 100))
}

const BOOK_TONES: Record<string, string> = {
  basic_500: 'bg-primary-container text-on-primary-container',
  cet4_outline: 'bg-secondary-container text-on-secondary-container',
  cet6_outline: 'bg-tertiary-container text-on-tertiary-container',
  cet4_high: 'bg-info-container text-on-info-container',
  cet6_high: 'bg-warning-container text-on-warning-container',
}

const bookTone = (code: string) =>
  BOOK_TONES[code] || 'bg-primary-container text-on-primary-container'

const statusLabel = (item: WordBookWordVO) => {
  if (item.status === 'FAMILIAR') return t('wordBook.statusFamiliar')
  if (item.status === 'MASTERED' || item.isMastered === 1) return t('wordBook.statusMastered')
  if (item.status === 'REVIEWING') return t('wordBook.statusReviewing')
  if (item.status === 'LEARNING') return t('wordBook.statusLearning')
  return t('wordBook.statusNew')
}

/** 学习状态 → Tag 语义色（契约 §7 的 TagTone 五档，不自造配色） */
const statusTone = (item: WordBookWordVO): 'primary' | 'tertiary' | 'warning' | 'neutral' => {
  if (item.status === 'FAMILIAR') return 'warning'
  if (item.status === 'MASTERED' || item.isMastered === 1) return 'tertiary'
  if (item.status === 'REVIEWING' || item.status === 'LEARNING') return 'primary'
  return 'neutral'
}

const load = async () => {
  loading.value = true
  loadError.value = ''
  try {
    if (!userStore.userId) {
      throw new Error('用户未登录')
    }
    if (!userStore.preferenceLoaded) {
      await userStore.loadPreference()
    }
    const list = await getWordBooks()
    books.value = list

    const statEntries = await Promise.all(list.map(async (book) => {
      try {
        const item = await getWordBookStats(book.code, userStore.userId!)
        return [book.code, item] as const
      } catch {
        return null
      }
    }))
    const statMap: Record<string, WordBookStatsVO> = {}
    statEntries.forEach((entry) => {
      if (entry) statMap[entry[0]] = entry[1]
    })
    stats.value = statMap

    if (list.length > 0 && !selectedCode.value) {
      const current = list.find(book => book.id === userStore.activeWordBookId)
      selectedCode.value = current?.code || list[0].code
    }
  } catch (e) {
    loadError.value = e instanceof Error ? e.message : t('wordBook.loadFailed')
  } finally {
    loading.value = false
  }
}

const setActiveBook = async (book: WordBookVO) => {
  if (isActive(book)) return
  switchingCode.value = book.code
  try {
    await userStore.setActiveWordBook(book.id)
    toast(t('wordBook.setActiveSuccess'), 'success')
  } catch (e) {
    toast(t('wordBook.switchFailed'), 'error')
  } finally {
    switchingCode.value = ''
  }
}

const startLearning = async (book: WordBookVO) => {
  switchingCode.value = book.code
  try {
    if (!isActive(book)) {
      await userStore.setActiveWordBook(book.id)
    }
    await router.push({ path: '/vocab-quiz', query: { mode: 'new' } })
  } catch (e) {
    toast(t('wordBook.switchFailed'), 'error')
  } finally {
    switchingCode.value = ''
  }
}

const openWordList = (book: WordBookVO) => {
  selectedCode.value = book.code
  wordDialogVisible.value = true
  wordPage.value = 1
  wordKeyword.value = ''
  void loadWords()
}

const loadWords = async () => {
  const book = selectedBook.value
  if (!book || !userStore.userId) return

  const token = ++wordRequestToken
  wordsLoading.value = true
  wordsError.value = ''
  try {
    const page = await getWordBookWords(
      book.code,
      userStore.userId,
      wordPage.value,
      wordSize,
      wordKeyword.value,
      wordFilter.value,
    )
    if (token !== wordRequestToken) return
    words.value = page.records || []
    wordTotal.value = page.total || 0
    wordPage.value = page.page || 1
  } catch (e) {
    if (token !== wordRequestToken) return
    wordsError.value = e instanceof Error ? e.message : t('wordBook.loadFailed')
    words.value = []
    wordTotal.value = 0
  } finally {
    if (token === wordRequestToken) wordsLoading.value = false
  }
}

const searchWords = () => {
  wordPage.value = 1
  void loadWords()
}

/** 切换词表分类：后端按状态过滤，页码回到第一页 */
const onWordFilterChange = (filter: unknown) => {
  wordFilter.value = filter as WordBookWordFilter
  wordPage.value = 1
  void loadWords()
}

const changeWordPage = (delta: number) => {
  const next = wordPage.value + delta
  if (next < 1 || next > wordPageCount.value) return
  wordPage.value = next
  void loadWords()
}

onMounted(() => {
  void load()
})
</script>
