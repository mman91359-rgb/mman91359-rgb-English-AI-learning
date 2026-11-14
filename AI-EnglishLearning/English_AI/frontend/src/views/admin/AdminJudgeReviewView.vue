<template>
  <div class="flex flex-col gap-6">
    <div class="flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
      <p class="font-body-md text-body-md text-on-surface-variant">{{ $t('adminConsole.judgeReview.subtitle') }}</p>
    </div>

    <div role="tablist" :aria-label="$t('adminConsole.judgeReview.tabsLabel')" class="flex flex-wrap gap-2">
      <button
        v-for="value in REVIEW_STATUSES"
        :key="value"
        type="button"
        role="tab"
        :aria-selected="status === value"
        class="h-9 rounded-full px-4 font-label-lg text-label-lg transition-colors"
        :class="status === value ? 'bg-primary text-on-primary shadow-soft-glow' : 'border border-outline-variant/40 bg-surface-container-lowest text-on-surface-variant hover:bg-surface-container-low'"
        @click="setParams({ status: value, page: undefined })"
      >
        {{ statusLabel(value) }}
      </button>
    </div>

    <AdminFilterBar
      :has-active-filters="hasFilters"
      @reset="setParams({ reason: undefined, questionId: undefined, page: undefined })"
    >
      <AdminFilterField :label="$t('adminConsole.judgeReview.colReason')">
        <AdminFilterSelect
          :model-value="query.reason"
          :options="reasonOptions"
          :all-label="$t('adminConsole.common.all')"
          @update:model-value="setParams({ reason: $event || undefined, page: undefined })"
        />
      </AdminFilterField>
      <AdminFilterField :label="$t('adminConsole.judgeReview.colQuestionId')" class-name="w-full sm:w-36">
        <input
          type="number"
          min="1"
          :value="readString(route.query, 'questionId') ?? ''"
          :class="inputClass"
          class="h-10 py-0"
          @input="setParams({ questionId: ($event.target as HTMLInputElement).value || undefined, page: undefined })"
        />
      </AdminFilterField>
    </AdminFilterBar>

    <section class="overflow-hidden rounded-2xl border border-outline-variant/40 bg-surface-container-lowest shadow-soft-glow">
      <ErrorState
        v-if="error"
        :message="error instanceof Error ? error.message : $t('adminConsole.error.generic')"
        :action-label="$t('adminConsole.common.retry')"
        @retry="reload"
      />
      <template v-else>
        <AdminDataTable
          :columns="columns"
          :rows="data?.records ?? []"
          :row-key="(row) => row.id"
          :loading="loading"
          :refreshing="refreshing"
          :empty-title="hasFilters ? $t('adminConsole.judgeReview.emptyFiltered') : $t('adminConsole.judgeReview.empty')"
          :empty-description="hasFilters ? '' : $t('adminConsole.judgeReview.emptyDesc')"
        >
          <template #cell-stem="{ row }">
            <span class="line-clamp-2 max-w-md text-on-surface">{{ row.stem ?? '—' }}</span>
          </template>
          <template #cell-userId="{ row }">#{{ row.userId }}</template>
          <template #cell-aiConfidence="{ row }">
            <span v-if="row.aiConfidence !== null && row.aiConfidence !== undefined" class="font-mono font-label-md text-label-md">
              {{ (row.aiConfidence * 15).toFixed(1) }}<span class="text-on-surface-variant">/15</span>
            </span>
            <span v-else class="text-outline">—</span>
          </template>
          <template #cell-scoreStatus="{ row }">
            <span
              v-if="row.logId === null || row.logId === undefined"
              class="font-label-sm text-label-sm text-outline"
            >
              — {{ $t('adminConsole.judgeReview.noBoundLog') }}
            </span>
            <span
              v-else
              class="inline-flex items-center gap-1 rounded-full px-2.5 py-0.5 font-label-sm text-label-sm"
              :class="row.curveScored && row.eloScored ? 'bg-tertiary-container/50 text-on-tertiary-container' : 'bg-warning-container text-on-warning-container'"
            >
              {{ row.curveScored && row.eloScored ? $t('adminConsole.judgeReview.scored') : $t('adminConsole.judgeReview.pendingScore') }}
            </span>
          </template>
          <template #cell-status="{ row }">
            <StatusBadge :tone="statusTone(row.status)" :label="statusLabel(row.status)" />
          </template>
          <template #cell-createdAt="{ row }">
            <span class="whitespace-nowrap text-on-surface-variant">{{ formatAdminDateTime(row.createdAt) }}</span>
          </template>
          <template #cell-actions="{ row }">
            <div v-if="row.status === 'PENDING'" class="flex justify-end gap-2">
              <button type="button" class="flex items-center gap-1 rounded-full px-3 py-1.5 font-label-lg text-label-lg text-tertiary hover:bg-tertiary-container/20" @click="resolveTarget = { row, verdict: 'PASS' }">
                <span class="material-symbols-outlined text-icon-sm">check</span>
                {{ $t('adminConsole.judgeReview.pass') }}
              </button>
              <button type="button" class="flex items-center gap-1 rounded-full px-3 py-1.5 font-label-lg text-label-lg text-error hover:bg-error-container/40" @click="resolveTarget = { row, verdict: 'FAIL' }">
                <span class="material-symbols-outlined text-icon-sm">close</span>
                {{ $t('adminConsole.judgeReview.fail') }}
              </button>
            </div>
            <span v-else class="font-label-md text-label-md text-outline">—</span>
          </template>
          <template #expanded="{ row }">
            <div class="grid grid-cols-1 gap-6 md:grid-cols-2">
              <div class="flex flex-col gap-3">
                <div>
                  <span class="font-label-md text-label-md text-on-surface-variant">{{ $t('adminConsole.judgeReview.fieldUserAnswer') }}</span>
                  <p class="mt-1 whitespace-pre-wrap rounded-xl bg-surface-container-low px-4 py-3 font-body-sm text-body-sm text-on-surface">{{ row.userAnswer ?? '—' }}</p>
                </div>
                <div>
                  <span class="font-label-md text-label-md text-on-surface-variant">{{ $t('adminConsole.judgeReview.fieldCorrectAnswer') }}</span>
                  <p class="mt-1 whitespace-pre-wrap rounded-xl bg-surface-container-low px-4 py-3 font-body-sm text-body-sm text-on-surface">{{ row.correctAnswer ?? '—' }}</p>
                </div>
              </div>
              <dl class="flex flex-col gap-3 font-body-sm text-body-sm">
                <div>
                  <dt class="font-label-md text-label-md text-on-surface-variant">{{ $t('adminConsole.judgeReview.fieldAiResult') }}</dt>
                  <dd class="text-on-surface">{{ row.aiResult ?? '—' }}</dd>
                </div>
                <div>
                  <dt class="font-label-md text-label-md text-on-surface-variant">{{ $t('adminConsole.judgeReview.fieldJudgeContext') }}</dt>
                  <dd class="whitespace-pre-wrap break-all text-on-surface">{{ row.judgeContext ?? '—' }}</dd>
                </div>
                <div v-if="row.reviewComment">
                  <dt class="font-label-md text-label-md text-on-surface-variant">{{ $t('adminConsole.judgeReview.fieldComment') }}</dt>
                  <dd class="text-on-surface">{{ row.reviewComment }}</dd>
                </div>
              </dl>
            </div>
          </template>
        </AdminDataTable>
        <AdminPagination
          v-if="data"
          :page="data.page"
          :size="data.size"
          :total="data.total"
          @update:page="setParams({ page: $event })"
          @update:size="setParams({ size: $event, page: undefined })"
        />
      </template>
    </section>

    <ConfirmDialog
      :open="resolveTarget !== null"
      :title="resolveTarget?.verdict === 'PASS' ? $t('adminConsole.judgeReview.passTitle') : $t('adminConsole.judgeReview.failTitle')"
      :target-name="resolveTarget ? `#${resolveTarget.row.id}` : ''"
      :impact="resolveTarget?.verdict === 'PASS' ? $t('adminConsole.judgeReview.passImpact') : $t('adminConsole.judgeReview.failImpact')"
      :confirm-label="resolveTarget?.verdict === 'PASS' ? $t('adminConsole.judgeReview.pass') : $t('adminConsole.judgeReview.fail')"
      :danger="resolveTarget?.verdict === 'FAIL'"
      :loading="resolving"
      @cancel="resolveTarget = null"
      @confirm="confirmResolve"
    />
  </div>
</template>

<script setup lang="ts">
import { computed, ref } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { useI18n } from 'vue-i18n'
import AdminDataTable from '../../components/admin/AdminDataTable.vue'
import AdminFilterBar from '../../components/admin/AdminFilterBar.vue'
import AdminFilterField from '../../components/admin/AdminFilterField.vue'
import AdminFilterSelect from '../../components/admin/AdminFilterSelect.vue'
import AdminPagination from '../../components/admin/AdminPagination.vue'
import ConfirmDialog from '../../components/admin/ConfirmDialog.vue'
import StatusBadge from '../../components/admin/StatusBadge.vue'
import ErrorState from '../../components/ui/ErrorState.vue'
import { inputClass } from '@/components/ui/formStyles'
import type { TableColumn } from '../../components/admin/tableTypes'
import type { BadgeTone } from '../../components/admin/tableTypes'
import { useAsyncData } from '../../composables/useAsyncData'
import { useToast } from '../../composables/useToast'
import {
  getAdminErrorKey,
  getJudgeReviews,
  resolveJudgeReview,
  type JudgeReviewAdminItem,
  type JudgeReviewAdminQuery,
  type JudgeReviewStatus,
} from '../../api/admin'
import { formatAdminDateTime } from '../../utils/format'
import { compactQuery, readEnum, readPositiveInt, readPage, readSize, readString } from '../../utils/query'

const route = useRoute()
const router = useRouter()
const { t } = useI18n()
const { show: toast } = useToast()

const REVIEW_STATUSES: readonly JudgeReviewStatus[] = ['PENDING', 'REVIEWED']

const REASON_OPTIONS = ['MANUAL', 'MISMATCH', 'AI_LOW_CONFIDENCE', 'TRANSLATION_LOW_SCORE']

const statusTone = (value: JudgeReviewStatus): BadgeTone => (value === 'PENDING' ? 'warning' : 'success')
const statusLabel = (value: JudgeReviewStatus) => t(`adminConsole.judgeReview.status.${value}`)
const reasonLabel = (value: string) => t(`adminConsole.judgeReview.reason.${value}`)

const reasonOptions = computed(() => REASON_OPTIONS.map((value) => ({ value, label: reasonLabel(value) })))

const resolveTarget = ref<{ row: JudgeReviewAdminItem; verdict: 'PASS' | 'FAIL' } | null>(null)
const resolving = ref(false)

const query = computed<JudgeReviewAdminQuery>(() => ({
  page: readPage(route.query),
  size: readSize(route.query),
  status: readEnum(route.query, 'status', REVIEW_STATUSES) ?? 'PENDING',
  reason: readString(route.query, 'reason'),
  questionId: readPositiveInt(route.query, 'questionId'),
}))

const status = computed(() => query.value.status ?? 'PENDING')
const hasFilters = computed(() => ['reason', 'questionId'].some((key) => route.query[key] !== undefined))

const { data, error, loading, refreshing, reload } = useAsyncData(
  () => getJudgeReviews(query.value),
  () => [route.query],
)

const columns = computed<TableColumn[]>(() => [
  { key: 'stem', header: t('adminConsole.judgeReview.colStem') },
  { key: 'userId', header: t('adminConsole.judgeReview.colUserId') },
  { key: 'aiConfidence', header: t('adminConsole.judgeReview.colAiScore') },
  { key: 'scoreStatus', header: t('adminConsole.judgeReview.colScoreStatus') },
  { key: 'status', header: t('adminConsole.judgeReview.colStatus') },
  { key: 'createdAt', header: t('adminConsole.judgeReview.colCreatedAt') },
  { key: 'actions', header: t('adminConsole.common.actions'), align: 'right' },
])

const setParams = (patch: Record<string, string | number | undefined>) => {
  const next = compactQuery({ ...(route.query as Record<string, string | number | undefined>), ...patch })
  void router.replace({ query: next })
}

const confirmResolve = async () => {
  if (!resolveTarget.value) return
  resolving.value = true
  try {
    await resolveJudgeReview(resolveTarget.value.row.id, resolveTarget.value.verdict)
    toast(t(resolveTarget.value.verdict === 'PASS' ? 'adminConsole.judgeReview.passToast' : 'adminConsole.judgeReview.failToast'), 'success')
    resolveTarget.value = null
    await reload()
  } catch (e) {
    toast(t(getAdminErrorKey(e)), 'error')
  } finally {
    resolving.value = false
  }
}
</script>
