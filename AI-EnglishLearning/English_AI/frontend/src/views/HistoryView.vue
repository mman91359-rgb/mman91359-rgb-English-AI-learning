<template>
  <AppLayout>
    <!-- 顶部标题栏 -->
    <PageHeader :title="$t('app.title') + ' - ' + $t('learning.learningHistory')" back />

    <!-- 筛选栏 -->
    <div class="mb-6 space-y-3">
      <!-- 事件来源 tab：全部/答题/单词/写作 -->
      <div class="flex items-center gap-2">
        <span class="font-label-md text-label-md text-on-surface-variant shrink-0 w-16">{{ $t('learning.source') }}</span>
        <ChipGroup
          :model-value="sourceTab"
          :options="sourceTabFilters"
          size="sm"
          :aria-label="$t('learning.source')"
          @update:model-value="switchSourceTab($event as 'all' | 'answer' | 'word' | 'writing')"
        />
      </div>
      <!-- 模块类型筛选：单词/写作事件无模块维度，隐藏 -->
      <div v-if="showModuleFilter" class="flex items-center gap-2">
        <span class="font-label-md text-label-md text-on-surface-variant shrink-0 w-16">{{ $t('learning.moduleType') }}</span>
        <ChipGroup
          :model-value="moduleFilter"
          :options="moduleFilters"
          size="sm"
          :aria-label="$t('learning.moduleType')"
          @update:model-value="moduleFilter = $event as number; applyFilter()"
        />
      </div>
      <!-- 正确/错误筛选：仅答题与全部 tab 适用 -->
      <div v-if="showCorrectFilter" class="flex items-center gap-2">
        <span class="font-label-md text-label-md text-on-surface-variant shrink-0 w-16">{{ $t('learning.result') }}</span>
        <ChipGroup
          :model-value="correctFilter"
          :options="correctFilters"
          size="sm"
          :aria-label="$t('learning.result')"
          @update:model-value="correctFilter = $event as number; applyFilter()"
        />
      </div>
      <!-- 时间范围筛选 -->
      <div class="flex items-center gap-2">
        <span class="font-label-md text-label-md text-on-surface-variant shrink-0 w-16">{{ $t('learning.time') }}</span>
        <ChipGroup
          :model-value="timeRangeFilter"
          :options="timeRangeFilters"
          size="sm"
          :aria-label="$t('learning.time')"
          @update:model-value="timeRangeFilter = $event as string; applyFilter()"
        />
      </div>
      <!-- 词书筛选 -->
      <div v-if="wordBooks.length > 0" class="flex items-center gap-2">
        <span class="font-label-md text-label-md text-on-surface-variant shrink-0 w-16">{{ $t('learning.wordBook') }}</span>
        <ChipGroup
          :model-value="bookFilter"
          :options="bookFilters"
          size="sm"
          :aria-label="$t('learning.wordBook')"
          @update:model-value="bookFilter = $event as string; applyFilter()"
        />
      </div>
      <!-- 起止日期 -->
      <div class="flex items-center gap-2">
        <span class="font-label-md text-label-md text-on-surface-variant shrink-0 w-16">{{ $t('learning.dateRange') }}</span>
        <input
          v-model="startDate"
          type="date"
          class="bg-surface-container-lowest border border-outline-variant rounded-lg px-2 py-1 font-body-sm text-body-sm text-on-surface"
          @change="applyFilter()"
        />
        <span class="text-on-surface-variant">—</span>
        <input
          v-model="endDate"
          type="date"
          class="bg-surface-container-lowest border border-outline-variant rounded-lg px-2 py-1 font-body-sm text-body-sm text-on-surface"
          @change="applyFilter()"
        />
      </div>
      <!-- 一键重置：仅在有筛选条件时出现 -->
      <div v-if="hasActiveFilter" class="flex items-center gap-2">
        <span class="shrink-0 w-16"></span>
        <button :class="btnSecondarySm" @click="resetFilters">
          <AppIcon name="restart_alt" size="sm" class="mr-1" />
          {{ $t('learning.resetFilter') }}
        </button>
      </div>
    </div>

    <!-- 加载中 -->
    <LoadingState v-if="loading" />

    <ErrorState
      v-else-if="loadError"
      :message="loadError"
      :action-label="$t('common.retry')"
      @retry="load"
    />

    <!-- 空状态 -->
    <EmptyState
      v-else-if="hasNoResult"
      icon="filter_alt_off"
      :title="$t('learning.noFilterResult')"
      :action-label="$t('learning.resetFilter')"
      @action="resetFilters"
    />

    <!-- 历史记录列表 -->
    <div v-else class="space-y-3">
      <!-- 全部：统一时间线（答题 + 单词 + 写作），按日分组 -->
      <template v-if="sourceTab === 'all'">
        <div v-for="g in groupedTimeline" :key="g.key" class="space-y-3">
          <p class="font-label-sm text-label-sm text-on-surface-variant px-1 pt-1">{{ g.label }}</p>
          <div
            v-for="row in g.items"
            :key="row.source + '-' + row.id"
            class="bg-surface-container-lowest rounded-2xl shadow-soft-glow p-4 flex items-center gap-4"
          >
            <div class="w-10 h-10 rounded-full flex items-center justify-center shrink-0"
                 :class="row.source === 'WORD' ? wordEventTone(row.eventType || '').wrap : row.source === 'WRITING' ? 'bg-secondary-container/40' : (row.isCorrect ? 'bg-tertiary-container/40' : 'bg-error-container/40')">
              <AppIcon :name="timelineIcon(row)" size="lg"
                       :class="row.source === 'WORD' ? wordEventTone(row.eventType || '').icon : row.source === 'WRITING' ? 'text-secondary' : (row.isCorrect ? 'text-tertiary' : 'text-error')" />
            </div>
            <div class="flex-1 min-w-0">
              <p class="font-body-md text-body-md text-on-surface truncate">{{ timelineTitle(row) }}</p>
              <div class="flex items-center gap-3 mt-1">
                <span class="font-label-sm text-label-sm" :class="row.source === 'WORD' ? wordResultClass(row.result) : 'text-secondary'">
                  {{ timelineTag(row) }}
                </span>
                <span v-if="row.bookCode" class="font-label-sm text-label-sm text-on-surface-variant">{{ bookNameOf(row.bookCode) }}</span>
              </div>
            </div>
            <div class="text-right shrink-0">
              <span class="font-label-sm text-label-sm text-on-surface-variant block">
                {{ formatDateTime(row.createdAt, locale) }}
              </span>
            </div>
          </div>
        </div>
      </template>

      <!-- 单词事件记录，按日分组 -->
      <template v-else-if="sourceTab === 'word'">
        <div v-for="g in groupedWordHistory" :key="g.key" class="space-y-3">
          <p class="font-label-sm text-label-sm text-on-surface-variant px-1 pt-1">{{ g.label }}</p>
          <div
            v-for="w in g.items"
            :key="'word-' + w.id"
            class="bg-surface-container-lowest rounded-2xl shadow-soft-glow p-4 flex items-center gap-4"
          >
            <div class="w-10 h-10 rounded-full flex items-center justify-center shrink-0" :class="wordEventTone(w.eventType).wrap">
              <AppIcon :name="wordEventIcon(w.eventType)" size="lg" :class="wordEventTone(w.eventType).icon" />
            </div>
            <div class="flex-1 min-w-0">
              <p class="font-body-md text-body-md text-on-surface truncate">
                {{ w.word }}
              </p>
              <div class="flex items-center gap-3 mt-1">
                <span class="font-label-sm text-label-sm" :class="wordResultClass(w.result)">{{ wordEventLabel(w.eventType) }}</span>
                <span v-if="w.result" class="font-label-sm text-label-sm"
                      :class="w.result === 'CORRECT' ? 'text-tertiary' : 'text-error'">
                  {{ w.result === 'CORRECT' ? $t('learning.correctTag') : $t('learning.incorrectTag') }}
                </span>
                <span v-if="w.bookCode" class="font-label-sm text-label-sm text-on-surface-variant">{{ bookNameOf(w.bookCode) }}</span>
              </div>
            </div>
            <div class="text-right shrink-0">
              <span class="font-label-sm text-label-sm text-on-surface-variant block">
                {{ formatDateTime(w.createdAt, locale) }}
              </span>
            </div>
          </div>
        </div>
      </template>

      <!-- 写作记录，按日分组 -->
      <template v-else-if="sourceTab === 'writing'">
        <div v-for="g in groupedWritingHistory" :key="g.key" class="space-y-3">
          <p class="font-label-sm text-label-sm text-on-surface-variant px-1 pt-1">{{ g.label }}</p>
          <div
            v-for="e in g.items"
            :key="'writing-' + e.id"
            class="bg-surface-container-lowest rounded-2xl shadow-soft-glow p-4 flex items-center gap-4"
          >
            <div class="w-10 h-10 rounded-full flex items-center justify-center shrink-0 bg-secondary-container/40">
              <AppIcon name="edit_note" size="lg" class="text-secondary" />
            </div>
            <div class="flex-1 min-w-0">
              <p class="font-body-md text-body-md text-on-surface truncate">
                {{ e.topicTitle || e.topicKey }}
              </p>
              <div class="flex items-center gap-3 mt-1">
                <span class="font-label-sm text-label-sm text-secondary">
                  {{ e.aiScored === 1 ? `${e.weightedScore ?? '-'} 分` : '未评分' }}
                </span>
                <span v-if="e.wordCount" class="font-label-sm text-label-sm text-on-surface-variant">{{ e.wordCount }} 词</span>
              </div>
            </div>
            <div class="text-right shrink-0">
              <span class="font-label-sm text-label-sm text-on-surface-variant block">
                {{ formatDateTime(e.createdAt, locale) }}
              </span>
            </div>
          </div>
        </div>
      </template>

      <!-- 每条答题记录，按日分组 -->
      <template v-else>
      <div v-for="g in groupedAnswerHistory" :key="g.key" class="space-y-3">
      <p class="font-label-sm text-label-sm text-on-surface-variant px-1 pt-1">{{ g.label }}</p>
      <div
        v-for="item in g.items"
        :key="item.logId"
        class="bg-surface-container-lowest rounded-2xl shadow-soft-glow overflow-hidden hover:bg-surface-container/40 transition-colors"
      >
        <!-- 紧凑行（可点击展开） -->
        <div
          class="p-4 flex items-center gap-4 cursor-pointer select-none"
          @click="toggleExpand(item.logId)"
        >
          <!-- 正确/错误图标 -->
          <div
            class="w-10 h-10 rounded-full flex items-center justify-center shrink-0"
            :class="item.isCorrect ? 'bg-tertiary-container/40' : 'bg-error-container/40'"
          >
            <AppIcon
              :name="item.isCorrect ? 'check' : 'close'"
              size="lg"
              :class="item.isCorrect ? 'text-tertiary' : 'text-error'"
            />
          </div>
          <!-- 题目摘要 -->
          <div class="flex-1 min-w-0">
            <p class="font-body-md text-body-md text-on-surface truncate">
              <!-- 语法题显示知识点，其他题显示题干 -->
              {{ item.moduleType === 2 ? extractKnowledgePoint(item) : (item.stem || $t('learning.stem') + ' #' + item.questionId) }}
            </p>
            <div class="flex items-center gap-3 mt-1">
              <span
                class="font-label-sm text-label-sm"
                :class="item.moduleType === 1 ? 'text-primary' : 'text-secondary'"
              >
                {{ moduleName(item.moduleType, t, 5) }}
              </span>
              <span class="font-label-sm text-label-sm text-on-surface-variant">
                Lv.{{ item.difficultyLevel || '-' }}
              </span>
              <span class="font-label-sm text-label-sm text-on-surface-variant">
                {{ item.durationSeconds || 0 }}s
              </span>
            </div>
          </div>
          <!-- 时间与结果 -->
          <div class="text-right shrink-0">
            <span class="font-label-sm text-label-sm text-on-surface-variant block">
              {{ formatDateTime(item.createdAt, locale) }}
            </span>
            <span
              class="font-label-sm text-label-sm"
              :class="item.isCorrect ? 'text-tertiary' : 'text-error'"
            >
              {{ item.isCorrect ? $t('learning.correctTag') : $t('learning.incorrectTag') }}
            </span>
          </div>
          <!-- 展开箭头 -->
          <AppIcon
            name="expand_more"
            size="lg"
            class="shrink-0 transition-transform duration-200"
            :class="expandedLogId === item.logId ? 'rotate-180' : ''"
          />
        </div>

        <!-- 展开详情区 -->
        <div
          v-if="expandedLogId === item.logId"
          class="px-4 pb-4 border-t border-outline-variant/20"
        >
          <div class="pt-4 space-y-3">
            <!-- 语法题：直译 + 正确答案（关键词高亮） + 你的答案（错误提示） -->
            <template v-if="item.moduleType === 2">
              <!-- 直译 -->
              <div>
                <p class="font-label-sm text-label-sm text-on-surface-variant mb-1">{{ $t('learning.literalTranslation') }}</p>
                <p class="font-body-md text-body-md text-on-surface bg-surface-container-low p-3 rounded-xl leading-relaxed">
                  {{ extractLiteralTranslation(item) }}
                </p>
              </div>
              <!-- 正确答案（关键词高亮） -->
              <div>
                <p class="font-label-sm text-label-sm text-on-surface-variant mb-1">{{ $t('learning.correctAnswer') }}</p>
                <p class="font-body-md text-body-md text-on-tertiary-container font-semibold bg-tertiary-container/25 p-3 rounded-xl">
                  <span v-html="highlightKeyword(item)"></span>
                </p>
              </div>
              <!-- 你的答案（错误提示） -->
              <div>
                <p class="font-label-sm text-label-sm text-on-surface-variant mb-1">{{ $t('learning.yourAnswer') }}</p>
                <div>
                  <p
                    class="font-body-md text-body-md font-semibold"
                    :class="item.isCorrect ? 'text-tertiary' : 'text-error'"
                  >
                    {{ formatUserAnswer(item) }}
                  </p>
                  <!-- 错误提示 -->
                  <p v-if="!item.isCorrect" class="font-label-sm text-label-sm text-error/70 mt-1">
                    {{ getGrammarErrorHint(item) }}
                  </p>
                </div>
              </div>
            </template>
            <!-- 其他题：普通展示 -->
            <template v-else>
              <!-- 题目题干 -->
              <div>
                <p class="font-label-sm text-label-sm text-on-surface-variant mb-1">{{ $t('learning.stem') }}</p>
                <p class="font-body-md text-body-md text-on-surface bg-surface-container-low p-3 rounded-xl leading-relaxed">
                  {{ item.stem || $t('learning.stem') + ' #' + item.questionId }}
                </p>
              </div>
              <!-- 你的答案 -->
              <div>
                <p class="font-label-sm text-label-sm text-on-surface-variant mb-1">{{ $t('learning.yourAnswer') }}</p>
                <p
                  class="font-body-md text-body-md font-semibold"
                  :class="item.isCorrect ? 'text-tertiary' : 'text-error'"
                >
                  {{ formatUserAnswer(item) }}
                </p>
              </div>
              <!-- 正确答案（始终展示，方便对比） -->
              <div>
                <p class="font-label-sm text-label-sm text-on-surface-variant mb-1">{{ $t('learning.correctAnswer') }}</p>
                <p class="font-body-md text-body-md text-on-tertiary-container font-semibold">
                  {{ formatCorrectAnswer(item.correctAnswer) }}
                </p>
              </div>
            </template>
            <!-- 题目信息 -->
            <div class="flex items-center gap-4 pt-1">
              <span class="font-label-sm text-label-sm text-on-surface-variant">
                {{ $t('learning.moduleType') }}：{{ moduleName(item.moduleType, t, 5) }}
              </span>
              <span class="font-label-sm text-label-sm text-on-surface-variant">
                {{ $t('learning.difficulty') }}：Lv.{{ item.difficultyLevel || '-' }}
              </span>
              <span class="font-label-sm text-label-sm text-on-surface-variant">
                {{ $t('learning.questionType') }}：{{ item.questionType || '-' }}
              </span>
              <span class="font-label-sm text-label-sm text-on-surface-variant">
                {{ $t('learning.duration') }}：{{ item.durationSeconds || 0 }}{{ $t('learning.seconds') }}
              </span>
            </div>

          </div>
        </div>
      </div>
      </div>
      </template>

      <!-- 分页：统一用 total 判断，各 tab 的 total 都与自身接口同口径 -->
      <div v-if="totalPages > 1" class="flex justify-center gap-4 pt-4 pb-8">
        <button
          :class="btnSecondarySm"
          :disabled="page <= 1"
          @click="changePage(page - 1)"
        >
          {{ $t('common.prev') }}
        </button>
        <span class="flex items-center font-label-md text-label-md text-on-surface-variant">
          {{ page }} / {{ totalPages }}
        </span>
        <button
          :class="btnSecondarySm"
          :disabled="page >= totalPages"
          @click="changePage(page + 1)"
        >
          {{ $t('common.next') }}
        </button>
      </div>
    </div>
  </AppLayout>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import { useI18n } from 'vue-i18n'
import AppLayout from '../components/AppLayout.vue'
import AppIcon from '@/components/ui/AppIcon.vue'
import ChipGroup from '@/components/ui/ChipGroup.vue'
import PageHeader from '@/components/ui/PageHeader.vue'
import LoadingState from '@/components/ui/LoadingState.vue'
import EmptyState from '@/components/ui/EmptyState.vue'
import ErrorState from '@/components/ui/ErrorState.vue'
import { useUserStore } from '@/stores/user'
import { moduleName } from '@/config/modules'
import { formatDateTime } from '@/utils/format'
import {
  getExerciseHistory,
  getWordLearnHistory,
  getWordBooks,
  getWritingHistory,
  getTimeline,
  type ExerciseHistoryVO,
  type UserWordLearnLogVO,
  type TimelineItemVO,
  type WritingHistoryVO,
} from '@/api/exercise'
import { btnSecondarySm } from '@/components/ui/buttonStyles'

const { t, locale } = useI18n()
const userStore = useUserStore()

// ========== 数据状态 ==========
const history = ref<ExerciseHistoryVO[]>([])
const wordHistory = ref<UserWordLearnLogVO[]>([])
const timeline = ref<TimelineItemVO[]>([])
const writingHistory = ref<WritingHistoryVO[]>([])
const loading = ref(true)
const loadError = ref('')
const page = ref(1)
const total = ref(0)
const size = 20

// 事件来源 tab：all=全部 / answer=答题 / word=单词 / writing=写作
const sourceTab = ref<'all' | 'answer' | 'word' | 'writing'>('all')

const totalPages = computed(() => Math.max(1, Math.ceil(total.value / size)))

// ========== 筛选配置 ==========
const sourceTabFilters = computed(() => [
  { label: t('learning.all'), value: 'all' },
  { label: t('learning.tabAnswer'), value: 'answer' },
  { label: t('learning.tabWord'), value: 'word' },
  { label: t('learning.tabWriting'), value: 'writing' }
])

const bookFilters = computed(() => [
  { label: t('learning.all'), value: '' },
  ...wordBooks.value.map(b => ({ label: b.name, value: b.code }))
])

const moduleFilters = computed(() => [
  { label: t('learning.all'), value: 0 },
  { label: t('dashboard.moduleVocabulary'), value: 1 },
  { label: t('dashboard.moduleGrammar'), value: 2 },
  { label: t('dashboard.moduleTranslation'), value: 3 },
  { label: t('dashboard.moduleListening'), value: 4 }
])

const correctFilters = computed(() => [
  { label: t('learning.all'), value: -1 },
  { label: t('learning.correctLabel'), value: 1 },
  { label: t('learning.incorrectLabel'), value: 0 }
])

const timeRangeFilters = computed(() => [
  { label: t('learning.allTime'), value: 'all' },
  { label: t('learning.today'), value: 'today' },
  { label: t('learning.thisWeek'), value: 'week' },
  { label: t('learning.thisMonth'), value: 'month' }
])

const moduleFilter = ref(0)
const correctFilter = ref(-1)
const timeRangeFilter = ref('all')
const bookFilter = ref('')

// 起止日期（自定义筛选，YYYY-MM-DD）
const startDate = ref('')
const endDate = ref('')

// 词书列表（用于词书筛选）
const wordBooks = ref<{ code: string; name: string }[]>([])

// ========== 展开状态 ==========
const expandedLogId = ref<number | null>(null)

const toggleExpand = (logId: number) => {
  expandedLogId.value = expandedLogId.value === logId ? null : logId
}

// ========== 时间范围计算辅助函数 ==========
const getTimeRangeStart = (range: string): Date | null => {
  const now = new Date()
  switch (range) {
    case 'today': {
      const start = new Date(now.getFullYear(), now.getMonth(), now.getDate())
      return start
    }
    case 'week': {
      const dayOfWeek = now.getDay()
      const diff = dayOfWeek === 0 ? 6 : dayOfWeek - 1
      const monday = new Date(now.getFullYear(), now.getMonth(), now.getDate() - diff)
      monday.setHours(0, 0, 0, 0)
      return monday
    }
    case 'month': {
      const start = new Date(now.getFullYear(), now.getMonth(), 1)
      return start
    }
    default:
      return null
  }
}

// ========== 筛选变更时重置页码并重新加载 ==========
const applyFilter = () => {
  page.value = 1
  load()
}

const switchSourceTab = (tab: 'all' | 'answer' | 'word' | 'writing') => {
  sourceTab.value = tab
  applyFilter()
}

/**
 * 转成本地时区的时间字符串（不带 Z）。
 * 后端按 Asia/Shanghai 存 datetime，前端若发 toISOString()（UTC+Z）会差 8 小时，
 * 这里统一发本地时间，避免时区换算带来的筛选偏差。
 */
const toLocalDateTime = (d: Date): string => {
  const p = (n: number) => String(n).padStart(2, '0')
  return `${d.getFullYear()}-${p(d.getMonth() + 1)}-${p(d.getDate())}T${p(d.getHours())}:${p(d.getMinutes())}:${p(d.getSeconds())}`
}

// ========== 数据加载 ==========
// 计算筛选起止时间（优先自定义日期，其次快捷时间范围）
const resolveTimeRange = (): { start?: string; end?: string } => {
  let start: string | undefined
  let end: string | undefined
  if (startDate.value) {
    start = toLocalDateTime(new Date(startDate.value + 'T00:00:00'))
  } else if (timeRangeFilter.value !== 'all') {
    const s = getTimeRangeStart(timeRangeFilter.value)
    if (s) start = toLocalDateTime(s)
  }
  if (endDate.value) {
    end = toLocalDateTime(new Date(endDate.value + 'T23:59:59'))
  }
  return { start, end }
}

// ========== 单词事件展示辅助 ==========
const wordEventLabel = (eventType: string): string => {
  const map: Record<string, string> = {
    LEARN: t('learning.eventLearn'),
    REVIEW: t('learning.eventReview'),
    MASTER: t('learning.eventMaster'),
    FAVORITE: t('learning.eventFavorite'),
    UNFAVORITE: t('learning.eventUnfavorite'),
    FAMILIAR: t('learning.eventFamiliar'),
    UNFAMILIAR: t('learning.eventUnfamiliar'),
  }
  return map[eventType] || eventType
}

const wordEventIcon = (eventType: string): string => {
  const map: Record<string, string> = {
    LEARN: 'school',
    REVIEW: 'schedule',
    MASTER: 'check_circle',
    FAVORITE: 'favorite',
    UNFAVORITE: 'heart_broken',
    FAMILIAR: 'task_alt',
    UNFAMILIAR: 'undo',
  }
  return map[eventType] || 'circle'
}

// ========== 统一时间线展示辅助 ==========
const timelineIcon = (row: TimelineItemVO): string => {
  if (row.source === 'WORD') return wordEventIcon(row.eventType || '')
  if (row.source === 'WRITING') return 'edit_note'
  return row.isCorrect === 1 ? 'check' : 'close'
}

const timelineTitle = (row: TimelineItemVO): string => {
  if (row.source === 'WORD') return row.word || '-'
  if (row.source === 'WRITING') return row.topicTitle || t('learning.tabWriting')
  return row.stem || `${t('learning.stem')} #${row.questionId}`
}

const timelineTag = (row: TimelineItemVO): string => {
  if (row.source === 'WORD') {
    const base = wordEventLabel(row.eventType || '')
    // 答题类单词事件（新学/复习/掌握）带作答结果，与事件类型一起展示
    if (row.result === 'CORRECT') return `${base} · ${t('learning.correctTag')}`
    if (row.result === 'WRONG') return `${base} · ${t('learning.incorrectTag')}`
    return base
  }
  if (row.source === 'WRITING') {
    return row.weightedScore != null ? `${row.weightedScore} 分` : t('learning.tabWriting')
  }
  return row.isCorrect === 1 ? t('learning.correctTag') : t('learning.incorrectTag')
}

/** 单词事件标签颜色：答对用 tertiary、答错用 error，无结果显示主色 */
const wordResultClass = (result?: string): string => {
  if (result === 'CORRECT') return 'text-tertiary'
  if (result === 'WRONG') return 'text-error'
  return 'text-primary'
}

/**
 * 单词事件的图标配色：不同类型事件用不同语义色，
 * 避免新学/复习/收藏在时间线里长得一模一样。
 */
const wordEventTone = (eventType: string): { wrap: string; icon: string } => {
  switch (eventType) {
    case 'LEARN':
      return { wrap: 'bg-primary-container/40', icon: 'text-primary' }
    case 'REVIEW':
      return { wrap: 'bg-tertiary-container/40', icon: 'text-tertiary' }
    case 'MASTER':
      return { wrap: 'bg-tertiary-container/60', icon: 'text-tertiary' }
    case 'FAVORITE':
      return { wrap: 'bg-secondary-container/50', icon: 'text-secondary' }
    case 'FAMILIAR':
      return { wrap: 'bg-warning-container/50', icon: 'text-warning' }
    case 'UNFAVORITE':
    case 'UNFAMILIAR':
      return { wrap: 'bg-surface-container-high', icon: 'text-on-surface-variant' }
    default:
      return { wrap: 'bg-primary-container/40', icon: 'text-primary' }
  }
}

/** 词书 code → 中文名（词书列表未加载或未知 code 时回落 code） */
const bookNameOf = (code?: string): string => {
  if (!code) return ''
  const hit = wordBooks.value.find(b => b.code === code)
  return hit ? hit.name : code
}

/** 日期分组标签：今天 / 昨天 / 具体日期 */
const dayLabel = (dateKey: string): string => {
  if (!dateKey) return t('learning.unknownDate')
  const now = new Date()
  const pad = (n: number) => String(n).padStart(2, '0')
  const todayKey = `${now.getFullYear()}-${pad(now.getMonth() + 1)}-${pad(now.getDate())}`
  if (dateKey === todayKey) return t('learning.today')
  const y = new Date(now)
  y.setDate(y.getDate() - 1)
  const yKey = `${y.getFullYear()}-${pad(y.getMonth() + 1)}-${pad(y.getDate())}`
  if (dateKey === yKey) return t('learning.yesterday')
  const parts = dateKey.split('-')
  if (parts.length === 3) {
    return locale.value === 'zh-CN'
      ? `${parts[0]}年${Number(parts[1])}月${Number(parts[2])}日`
      : new Date(dateKey + 'T00:00:00').toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' })
  }
  return dateKey
}

/** 按自然日把列表切成若干段，保持后端返回的时间倒序 */
const groupByDay = <T extends { createdAt?: string }>(list: T[]) => {
  const buckets = new Map<string, T[]>()
  for (const item of list) {
    const key = item.createdAt ? item.createdAt.slice(0, 10) : ''
    const arr = buckets.get(key)
    if (arr) arr.push(item)
    else buckets.set(key, [item])
  }
  return Array.from(buckets.entries()).map(([key, items]) => ({
    key: key || 'unknown',
    label: dayLabel(key),
    items,
  }))
}

const groupedTimeline = computed(() => groupByDay(timeline.value))
const groupedWordHistory = computed(() => groupByDay(wordHistory.value))
const groupedAnswerHistory = computed(() => groupByDay(history.value))
const groupedWritingHistory = computed(() => groupByDay(writingHistory.value))

/** 当前 tab 是否没有任何数据（用于空态判断） */
const hasNoResult = computed(() => {
  switch (sourceTab.value) {
    case 'word':
      return wordHistory.value.length === 0
    case 'writing':
      return writingHistory.value.length === 0
    case 'answer':
      return history.value.length === 0
    default:
      return timeline.value.length === 0
  }
})

/** 一键清空全部筛选条件 */
const resetFilters = () => {
  moduleFilter.value = 0
  correctFilter.value = -1
  timeRangeFilter.value = 'all'
  bookFilter.value = ''
  startDate.value = ''
  endDate.value = ''
  page.value = 1
  load()
}

/** 当前 tab 是否适用「模块 / 答题结果」筛选：单词与写作事件没有这两个维度 */
const showModuleFilter = computed(() => sourceTab.value === 'all' || sourceTab.value === 'answer')
const showCorrectFilter = computed(() => sourceTab.value === 'all' || sourceTab.value === 'answer')

/** 筛选区是否有任何条件被改动（决定重置按钮是否高亮） */
const hasActiveFilter = computed(() =>
  moduleFilter.value !== 0 || correctFilter.value !== -1 ||
  timeRangeFilter.value !== 'all' || !!bookFilter.value ||
  !!startDate.value || !!endDate.value
)

// ========== 数据加载 ==========
const load = async () => {
  const uid = userStore.userId
  if (!uid) return
  loading.value = true
  loadError.value = ''
  expandedLogId.value = null
  try {
    const { start, end } = resolveTimeRange()

    if (sourceTab.value === 'word') {
      // 单词事件：新学/复习/收藏/忽略/掌握
      const res = await getWordLearnHistory(uid, page.value, size, undefined, bookFilter.value || undefined, start, end)
      wordHistory.value = res.records || []
      total.value = res.total || 0
      history.value = []
      timeline.value = []
      writingHistory.value = []
    } else if (sourceTab.value === 'writing') {
      // 写作：数据源是 writing_essay，不是 user_exercise_log（后者 module_type=6 永远为 0）
      const res = await getWritingHistory(uid, page.value, size, start, end)
      writingHistory.value = res.records || []
      total.value = res.total || 0
      history.value = []
      wordHistory.value = []
      timeline.value = []
    } else if (sourceTab.value === 'answer') {
      // 答题
      const res = await getExerciseHistory(uid, page.value, size, moduleFilter.value, correctFilter.value >= 0 ? correctFilter.value : undefined, start, end)
      history.value = res.records || []
      total.value = res.total || 0
      wordHistory.value = []
      timeline.value = []
      writingHistory.value = []
    } else {
      // 全部：后端 UNION 统一时间线，count 与分页同一口径（不再前端相加估算）
      const res = await getTimeline(uid, page.value, size, start, end)
      timeline.value = res.records || []
      total.value = res.total || 0
      history.value = []
      wordHistory.value = []
      writingHistory.value = []
    }
  } catch (e) {
    console.warn('加载学习历史失败', e)
    loadError.value = e instanceof Error ? e.message : '加载学习历史失败'
  } finally {
    loading.value = false
  }
}

const changePage = (p: number) => {
  page.value = p
  load()
  window.scrollTo({ top: 0, behavior: 'smooth' })
}

// ========== 答案显示格式化 ==========
/**
 * 旧数据中 userAnswer 可能存的是选项字母（A/B/C/D），对词语排序/造句题不直观。
 * 如果 userAnswer 是单字母且 correctAnswer 以该字母开头（如 "A. the full sentence"），
 * 则提取 correctAnswer 的纯文本部分展示。
 */
const formatUserAnswer = (item: ExerciseHistoryVO): string => {
  const ua = (item.userAnswer || '').trim()
  const ca = (item.correctAnswer || '').trim()
  // 仅当 userAnswer 是单字母 A-D 时尝试转换
  if (/^[A-Da-d]$/.test(ua) && ca.length > 1) {
    const caClean = ca.replace(/^[A-Da-d][.、)]?\s*/, '').trim()
    if (caClean) return caClean
  }
  return ua || t('learning.unanswered')
}

/**
 * 旧数据中 correctAnswer 可能存为 "A. the full sentence" 格式，
 * 提取纯文本部分展示（更直观）。
 */
const formatCorrectAnswer = (correctAnswer: string): string => {
  if (!correctAnswer) return '-'
  const ca = correctAnswer.trim()
  // 如果格式是 "A. text" → 提取 text 部分
  const match = ca.match(/^[A-Da-d][.、)]?\s*(.+)/)
  if (match && match[1]) return match[1]
  return ca
}

/**
 * 从 analysis 中提取知识点（analysis 格式：知识点||直译）
 */
const extractKnowledgePoint = (item: ExerciseHistoryVO): string => {
  const analysis = item.analysis || ''
  const sepIdx = analysis.indexOf('||')
  if (sepIdx >= 0) {
    return analysis.substring(0, sepIdx).trim() || t('learning.defaultKnowledgePoint')
  }
  return analysis.trim() || t('learning.defaultKnowledgePoint')
}

/**
 * 从 analysis 中提取直译（analysis 格式：知识点||直译）
 */
const extractLiteralTranslation = (item: ExerciseHistoryVO): string => {
  const analysis = item.analysis || ''
  const sepIdx = analysis.indexOf('||')
  if (sepIdx >= 0) {
    return analysis.substring(sepIdx + 2).trim() || item.stem || '-'
  }
  return item.stem || '-'
}

/**
 * 语法题正确答案关键词高亮：从 correctAnswer 中提取关键词，用下划线高亮显示
 * 关键词来源于知识点描述中的关键词（如 since, for, if, were 等）
 */
const highlightKeyword = (item: ExerciseHistoryVO): string => {
  const correctSentence = item.stem || formatCorrectAnswer(item.correctAnswer) || ''
  const knowledgePoint = extractKnowledgePoint(item)
  
  const keywords = new Set<string>()
  const keywordPatterns = [
    /\bsince\b/i, /\bfor\b/i, /\bif\b/i, /\bwere\b/i, /\bhad\b/i,
    /\bwould\b/i, /\bcould\b/i, /\bshould\b/i, /\bmight\b/i,
    /\bhave\b/i, /\bhas\b/i, /\bbeen\b/i, /\bbeing\b/i,
    /\bdid\b/i, /\bwas\b/i, /\bbeen\b/i, /\bthat\b/i, /\bwhich\b/i,
    /\bwho\b/i, /\bwhom\b/i, /\bwhose\b/i, /\bwhen\b/i, /\bwhere\b/i,
    /\bwhy\b/i, /\bbecause\b/i, /\balthough\b/i, /\bthough\b/i,
    /\bwhile\b/i, /\buntil\b/i, /\bunless\b/i, /\bthan\b/i, /\bas\b/i
  ]
  
  keywordPatterns.forEach(pattern => {
    if (pattern.test(knowledgePoint)) {
      const match = knowledgePoint.match(pattern)
      if (match) keywords.add(match[0].toLowerCase())
    }
  })
  
  if (keywords.size === 0) {
    return escapeHtml(correctSentence)
  }
  
  const escaped = escapeHtml(correctSentence)
  const keywordRegex = new RegExp(`\\b(${Array.from(keywords).join('|')})\\b`, 'gi')
  return escaped.replace(keywordRegex, '<u>$1</u>')
}

/**
 * HTML转义
 */
const escapeHtml = (str: string): string => {
  const map: Record<string, string> = {
    '&': '&amp;',
    '<': '&lt;',
    '>': '&gt;',
    '"': '&quot;',
    "'": '&#039;'
  }
  return str.replace(/[&<>"']/g, m => map[m])
}

/**
 * 根据知识点给出语法错误提示
 */
const getGrammarErrorHint = (item: ExerciseHistoryVO): string => {
  const knowledgePoint = extractKnowledgePoint(item)
  const hints: Record<string, string> = {
    '虚拟语气': t('history.grammarHint.subjunctive'),
    'since': t('history.grammarHint.conjunction'),
    'for': t('history.grammarHint.conjunction'),
    '条件状语': t('history.grammarHint.conditional'),
    '定语从句': t('history.grammarHint.relativeClause'),
    '时态': t('history.grammarHint.tense'),
    '主谓一致': t('history.grammarHint.subjectVerb'),
    '比较级': t('history.grammarHint.comparative'),
    '被动语态': t('history.grammarHint.passive'),
    '情态动词': t('history.grammarHint.modal')
  }
  for (const [keyword, hint] of Object.entries(hints)) {
    if (knowledgePoint.includes(keyword)) {
      return hint
    }
  }
  return t('history.grammarHint.default')
}

onMounted(async () => {
  // 加载词书列表（用于词书筛选）
  try {
    wordBooks.value = await getWordBooks()
  } catch (e) {
    console.warn('加载词书列表失败', e)
  }
  load()
})
</script>
