<template>
  <div class="flex flex-col gap-6">
    <div class="flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
      <p class="font-body-md text-body-md text-on-surface-variant">{{ $t('adminConsole.question.subtitle') }}</p>
      <button
        type="button"
        class="flex items-center gap-2 rounded-full bg-primary px-5 py-2.5 font-label-lg text-label-lg text-on-primary"
        @click="generateOpen = true"
      >
        <span class="material-symbols-outlined text-icon-md">auto_awesome</span>
        {{ $t('adminConsole.question.generate') }}
      </button>
    </div>

    <div role="tablist" :aria-label="$t('adminConsole.question.tabsLabel')" class="flex flex-wrap gap-2">
      <button
        v-for="value in REVIEW_STATUSES"
        :key="value"
        type="button"
        role="tab"
        :aria-selected="status === value"
        class="h-9 rounded-full px-4 font-label-lg text-label-lg transition-colors"
        :class="status === value ? 'bg-primary text-on-primary shadow-soft-glow' : 'border border-outline-variant/40 bg-surface-container-lowest text-on-surface-variant hover:bg-surface-container-low'"
        @click="setParams({ status: value === 'PENDING' ? undefined : value, page: undefined })"
      >
        {{ reviewLabel(value) }}
      </button>
    </div>

    <AdminFilterBar
      :has-active-filters="hasFilters"
      @reset="setParams({ moduleType: undefined, targetLevel: undefined, keyword: undefined, page: undefined })"
    >
      <AdminFilterField :label="$t('adminConsole.question.filterModule')" class-name="w-full sm:w-36">
        <input
          type="number"
          min="1"
          :value="readString(route.query, 'moduleType') ?? ''"
          :class="inputClass"
          class="h-10 py-0"
          @input="setParams({ moduleType: ($event.target as HTMLInputElement).value || undefined, page: undefined })"
        />
      </AdminFilterField>
      <AdminFilterField :label="$t('adminConsole.question.filterLevel')">
        <AdminFilterSelect
          :model-value="query.targetLevel"
          :options="CET_LEVELS.map((value) => ({ value, label: value }))"
          :all-label="$t('adminConsole.common.all')"
          @update:model-value="setParams({ targetLevel: $event, page: undefined })"
        />
      </AdminFilterField>
      <AdminFilterField :label="$t('adminConsole.common.keyword')" class-name="w-full sm:w-64">
        <AdminFilterSearch
          :model-value="readString(route.query, 'keyword') ?? ''"
          :placeholder="$t('adminConsole.question.searchPlaceholder')"
          @update:model-value="setParams({ keyword: $event || undefined, page: undefined })"
        />
      </AdminFilterField>
    </AdminFilterBar>

    <section class="overflow-hidden rounded-[16px] border border-outline-variant/40 bg-surface-container-lowest shadow-soft-glow">
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
          :empty-title="hasFilters ? $t('adminConsole.question.emptyFiltered') : isPendingTab ? $t('adminConsole.question.emptyPending') : $t('adminConsole.question.empty')"
          :empty-description="hasFilters ? '' : $t('adminConsole.question.emptyDesc')"
        >
          <template #cell-stem="{ row }">
            <span class="line-clamp-2 max-w-md text-on-surface">{{ row.stem }}</span>
          </template>
          <template #cell-questionType="{ row }">
            <span class="font-mono font-label-md text-label-md">{{ row.questionType }}</span>
          </template>
          <template #cell-moduleType="{ row }">#{{ row.moduleType }}</template>
          <template #cell-targetLevel="{ row }">{{ row.targetLevel ?? '—' }}</template>
          <template #cell-status="{ row }">
            <StatusBadge :tone="reviewTone(row.status)" :label="reviewLabel(row.status)" />
          </template>
          <template #cell-createdAt="{ row }">
            <span class="whitespace-nowrap text-on-surface-variant">{{ formatAdminDateTime(row.createdAt) }}</span>
          </template>
          <template #cell-actions="{ row }">
            <div v-if="row.status === 'PENDING'" class="flex justify-end gap-2">
              <button type="button" class="flex items-center gap-1 rounded-full px-3 py-1.5 font-label-lg text-label-lg text-tertiary hover:bg-tertiary-container/20" @click="approveTarget = row">
                <span class="material-symbols-outlined text-icon-sm">check</span>
                {{ $t('adminConsole.question.approve') }}
              </button>
              <button type="button" class="flex items-center gap-1 rounded-full px-3 py-1.5 font-label-lg text-label-lg text-error hover:bg-error-container/40" @click="rejectTarget = row">
                <span class="material-symbols-outlined text-icon-sm">close</span>
                {{ $t('adminConsole.question.reject') }}
              </button>
            </div>
            <span v-else class="font-label-md text-label-md text-outline">—</span>
          </template>
          <template #expanded="{ row }">
            <div class="grid grid-cols-1 gap-6 md:grid-cols-2">
              <div class="flex flex-col gap-2">
                <span class="font-label-md text-label-md text-on-surface-variant">{{ $t('adminConsole.question.fieldOptions') }}</span>
                <ol v-if="parseOptions(row.options).length" class="flex list-inside list-decimal flex-col gap-1 font-body-sm text-body-sm text-on-surface">
                  <li v-for="(option, index) in parseOptions(row.options)" :key="index">{{ option }}</li>
                </ol>
                <span v-else class="font-body-sm text-body-sm text-on-surface-variant">—</span>
              </div>
              <dl class="flex flex-col gap-3 font-body-sm text-body-sm">
                <div>
                  <dt class="font-label-md text-label-md text-on-surface-variant">{{ $t('adminConsole.question.fieldAnswer') }}</dt>
                  <dd class="text-on-surface">{{ row.correctAnswer ?? '—' }}</dd>
                </div>
                <div>
                  <dt class="font-label-md text-label-md text-on-surface-variant">{{ $t('adminConsole.question.fieldExplanation') }}</dt>
                  <dd class="whitespace-pre-wrap text-on-surface">{{ row.analysis ?? '—' }}</dd>
                </div>
                <div>
                  <dt class="font-label-md text-label-md text-on-surface-variant">{{ $t('adminConsole.question.fieldKnowledge') }}</dt>
                  <dd class="text-on-surface">{{ row.knowledgePointName ?? '—' }}</dd>
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
      :open="approveTarget !== null"
      :title="$t('adminConsole.question.approveTitle')"
      :target-name="approveTarget?.stem.slice(0, 40) ?? ''"
      :impact="$t('adminConsole.question.approveImpact')"
      :confirm-label="$t('adminConsole.question.approveConfirm')"
      :loading="approving"
      @cancel="approveTarget = null"
      @confirm="confirmApprove"
    />

    <RejectQuestionDialog
      v-if="rejectTarget"
      :question="rejectTarget"
      @close="onRejectClose"
    />

    <GenerateQuestionsDialog
      v-if="generateOpen"
      @close="onGenerateClose"
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
import AdminFilterSearch from '../../components/admin/AdminFilterSearch.vue'
import AdminFilterSelect from '../../components/admin/AdminFilterSelect.vue'
import AdminPagination from '../../components/admin/AdminPagination.vue'
import ConfirmDialog from '../../components/admin/ConfirmDialog.vue'
import GenerateQuestionsDialog from '../../components/admin/GenerateQuestionsDialog.vue'
import RejectQuestionDialog from '../../components/admin/RejectQuestionDialog.vue'
import StatusBadge from '../../components/admin/StatusBadge.vue'
import ErrorState from '../../components/ui/ErrorState.vue'
import { inputClass } from '../../components/admin/formStyles'
import type { TableColumn } from '../../components/admin/tableTypes'
import { useAsyncData } from '../../composables/useAsyncData'
import { useToast } from '../../composables/useToast'
import { approveQuestion, getAdminErrorKey, getAdminQuestions, type AdminQuestion, type AdminQuestionQuery, type CetLevel, type ReviewStatus } from '../../api/admin'
import { REVIEW_STATUS_META } from '../../utils/adminEnums'
import { formatAdminDateTime } from '../../utils/format'
import { compactQuery, readEnum, readPage, readPositiveInt, readSize, readString } from '../../utils/query'

const route = useRoute()
const router = useRouter()
const { t } = useI18n()
const { show: toast } = useToast()

const REVIEW_STATUSES: readonly ReviewStatus[] = ['PENDING', 'APPROVED', 'REJECTED']
const CET_LEVELS: readonly CetLevel[] = ['CET4', 'CET6']

const reviewTone = (value: ReviewStatus) => REVIEW_STATUS_META[value].tone
const reviewLabel = (value: ReviewStatus) => t(REVIEW_STATUS_META[value].labelKey)

const approveTarget = ref<AdminQuestion | null>(null)
const rejectTarget = ref<AdminQuestion | null>(null)
const generateOpen = ref(false)
const approving = ref(false)

const query = computed<AdminQuestionQuery>(() => ({
  page: readPage(route.query),
  size: readSize(route.query),
  status: readEnum(route.query, 'status', REVIEW_STATUSES) ?? 'PENDING',
  moduleType: readPositiveInt(route.query, 'moduleType'),
  targetLevel: readEnum(route.query, 'targetLevel', CET_LEVELS),
  keyword: readString(route.query, 'keyword'),
}))

const status = computed(() => query.value.status ?? 'PENDING')
const isPendingTab = computed(() => status.value === 'PENDING')
const hasFilters = computed(() => ['moduleType', 'targetLevel', 'keyword'].some((key) => route.query[key] !== undefined))

const { data, error, loading, refreshing, reload } = useAsyncData(
  () => getAdminQuestions(query.value),
  () => [route.query],
)

const columns = computed<TableColumn[]>(() => [
  { key: 'stem', header: t('adminConsole.question.colStem') },
  { key: 'questionType', header: t('adminConsole.question.colType') },
  { key: 'moduleType', header: t('adminConsole.question.colModule') },
  { key: 'targetLevel', header: t('adminConsole.question.colLevel') },
  { key: 'status', header: t('adminConsole.question.colStatus') },
  { key: 'createdAt', header: t('adminConsole.question.colCreatedAt') },
  { key: 'actions', header: t('adminConsole.common.actions'), align: 'right' },
])

const setParams = (patch: Record<string, string | number | undefined>) => {
  const next = compactQuery({ ...(route.query as Record<string, string | number | undefined>), ...patch })
  void router.replace({ query: next })
}

const parseOptions = (options: string | null): string[] => {
  if (!options) return []
  try {
    const parsed: unknown = JSON.parse(options)
    if (!Array.isArray(parsed)) return [options]
    return parsed.map((item) => (typeof item === 'string' ? item : JSON.stringify(item)))
  } catch {
    return [options]
  }
}

const confirmApprove = async () => {
  if (!approveTarget.value) return
  approving.value = true
  try {
    await approveQuestion(approveTarget.value.id)
    toast(t('adminConsole.question.approveToast'), 'success')
    approveTarget.value = null
    await reload()
  } catch (e) {
    toast(t(getAdminErrorKey(e)), 'error')
  } finally {
    approving.value = false
  }
}

const onRejectClose = (changed: boolean) => {
  rejectTarget.value = null
  if (changed) void reload()
}

const onGenerateClose = (generated: boolean) => {
  generateOpen.value = false
  if (generated) void reload()
}
</script>
