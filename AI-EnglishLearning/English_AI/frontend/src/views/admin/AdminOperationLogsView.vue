<template>
  <div class="flex flex-col gap-6">
    <p class="font-body-md text-body-md text-on-surface-variant">{{ $t('adminConsole.logs.subtitle') }}</p>

    <AdminFilterBar :has-active-filters="hasFilters" @reset="clearFilters">
      <AdminFilterField :label="$t('adminConsole.logs.filterOperatorId')" class-name="w-full sm:w-36">
        <input
          type="number"
          min="1"
          :value="readString(route.query, 'operatorId') ?? ''"
          :class="inputClass"
          class="h-10 py-0"
          @input="setParams({ operatorId: ($event.target as HTMLInputElement).value || undefined, page: undefined })"
        />
      </AdminFilterField>
      <AdminFilterField :label="$t('adminConsole.logs.filterAction')" class-name="w-full sm:w-56">
        <AdminFilterSearch
          :model-value="readString(route.query, 'action') ?? ''"
          :placeholder="$t('adminConsole.logs.actionPlaceholder')"
          @update:model-value="setParams({ action: $event || undefined, page: undefined })"
        />
      </AdminFilterField>
      <AdminFilterField :label="$t('adminConsole.logs.filterTargetType')" class-name="w-full sm:w-44">
        <AdminFilterSearch
          :model-value="readString(route.query, 'targetType') ?? ''"
          :placeholder="$t('adminConsole.logs.targetPlaceholder')"
          @update:model-value="setParams({ targetType: $event || undefined, page: undefined })"
        />
      </AdminFilterField>
      <AdminFilterField :label="$t('adminConsole.logs.colResult')">
        <AdminFilterSelect
          :model-value="query.result"
          :options="resultOptions"
          :all-label="$t('adminConsole.common.all')"
          @update:model-value="setParams({ result: $event, page: undefined })"
        />
      </AdminFilterField>
      <AdminFilterField :label="$t('adminConsole.logs.filterStart')" class-name="w-full sm:w-52">
        <input
          type="datetime-local"
          :value="startInput"
          :class="inputClass"
          class="h-10 py-0"
          @change="setParams({ startTime: fromInputDateTime(($event.target as HTMLInputElement).value), page: undefined })"
        />
      </AdminFilterField>
      <AdminFilterField :label="$t('adminConsole.logs.filterEnd')" class-name="w-full sm:w-52">
        <input
          type="datetime-local"
          :value="endInput"
          :class="inputClass"
          class="h-10 py-0"
          @change="setParams({ endTime: fromInputDateTime(($event.target as HTMLInputElement).value), page: undefined })"
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
          :empty-title="hasFilters ? $t('adminConsole.logs.emptyFiltered') : $t('adminConsole.logs.empty')"
          :empty-description="hasFilters ? '' : $t('adminConsole.logs.emptyDesc')"
        >
          <template #cell-createdAt="{ row }">
            <span class="whitespace-nowrap text-on-surface-variant">{{ formatAdminDateTime(row.createdAt) }}</span>
          </template>
          <template #cell-operatorName="{ row }">{{ displayOrDash(row.operatorName) }}</template>
          <template #cell-action="{ row }"><span class="font-medium">{{ row.action }}</span></template>
          <template #cell-target="{ row }">
            <span class="text-on-surface-variant">{{ row.targetType }}<template v-if="row.targetId"> #{{ row.targetId }}</template></span>
          </template>
          <template #cell-result="{ row }">
            <StatusBadge :tone="resultTone(row.result)" :label="resultLabel(row.result)" />
          </template>
          <template #cell-ip="{ row }"><span class="font-mono font-label-md text-label-md">{{ displayOrDash(row.ip) }}</span></template>
          <template #expanded="{ row }">
            <dl class="grid grid-cols-1 gap-4 md:grid-cols-2">
              <div class="flex flex-col gap-1">
                <dt class="font-label-md text-label-md text-on-surface-variant">{{ $t('adminConsole.logs.detail') }}</dt>
                <dd>
                  <pre class="max-h-64 overflow-auto whitespace-pre-wrap rounded-xl bg-surface-container-lowest p-4 font-mono font-label-md text-label-md text-on-surface">{{ formatDetail(row.detail) }}</pre>
                </dd>
              </div>
              <div class="flex flex-col gap-3 font-body-sm text-body-sm">
                <div>
                  <dt class="font-label-md text-label-md text-on-surface-variant">{{ $t('adminConsole.logs.traceId') }}</dt>
                  <dd class="break-all font-mono font-label-md text-label-md text-on-surface">{{ displayOrDash(row.traceId) }}</dd>
                </div>
                <div>
                  <dt class="font-label-md text-label-md text-on-surface-variant">{{ $t('adminConsole.logs.userAgent') }}</dt>
                  <dd class="break-all text-on-surface">{{ displayOrDash(row.userAgent) }}</dd>
                </div>
              </div>
            </dl>
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
  </div>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { useI18n } from 'vue-i18n'
import AdminDataTable from '../../components/admin/AdminDataTable.vue'
import AdminFilterBar from '../../components/admin/AdminFilterBar.vue'
import AdminFilterField from '../../components/admin/AdminFilterField.vue'
import AdminFilterSearch from '../../components/admin/AdminFilterSearch.vue'
import AdminFilterSelect from '../../components/admin/AdminFilterSelect.vue'
import AdminPagination from '../../components/admin/AdminPagination.vue'
import StatusBadge from '../../components/admin/StatusBadge.vue'
import ErrorState from '../../components/ui/ErrorState.vue'
import { inputClass } from '@/components/ui/formStyles'
import type { TableColumn } from '../../components/admin/tableTypes'
import { useAsyncData } from '../../composables/useAsyncData'
import { getOperationLogs, type AuditResult, type OperationLogQuery } from '../../api/admin'
import { AUDIT_RESULT_META } from '../../utils/adminEnums'
import { displayOrDash, formatAdminDateTime, fromInputDateTime, toInputDateTime } from '../../utils/format'
import { compactQuery, readEnum, readPage, readPositiveInt, readSize, readString } from '../../utils/query'

const route = useRoute()
const router = useRouter()
const { t } = useI18n()

const AUDIT_RESULTS: readonly AuditResult[] = ['SUCCESS', 'FAIL']
const resultOptions = computed(() => AUDIT_RESULTS.map((value) => ({ value, label: t(AUDIT_RESULT_META[value].labelKey) })))
const resultTone = (value: AuditResult) => AUDIT_RESULT_META[value].tone
const resultLabel = (value: AuditResult) => t(AUDIT_RESULT_META[value].labelKey)

const query = computed<OperationLogQuery>(() => ({
  page: readPage(route.query),
  size: readSize(route.query),
  operatorId: readPositiveInt(route.query, 'operatorId'),
  action: readString(route.query, 'action'),
  targetType: readString(route.query, 'targetType'),
  result: readEnum(route.query, 'result', AUDIT_RESULTS),
  startTime: readString(route.query, 'startTime'),
  endTime: readString(route.query, 'endTime'),
}))

const hasFilters = computed(() => ['operatorId', 'action', 'targetType', 'result', 'startTime', 'endTime'].some((key) => route.query[key] !== undefined))
const startInput = computed(() => toInputDateTime(readString(route.query, 'startTime')))
const endInput = computed(() => toInputDateTime(readString(route.query, 'endTime')))

const { data, error, loading, refreshing, reload } = useAsyncData(
  () => getOperationLogs(query.value),
  () => [route.query],
)

const columns = computed<TableColumn[]>(() => [
  { key: 'createdAt', header: t('adminConsole.logs.colTime') },
  { key: 'operatorName', header: t('adminConsole.logs.colOperator') },
  { key: 'action', header: t('adminConsole.logs.colAction') },
  { key: 'target', header: t('adminConsole.logs.colTarget') },
  { key: 'result', header: t('adminConsole.logs.colResult') },
  { key: 'ip', header: t('adminConsole.logs.colIp') },
])

const formatDetail = (detail: string | null): string => {
  if (!detail) return '—'
  try {
    return JSON.stringify(JSON.parse(detail), null, 2)
  } catch {
    return detail
  }
}

const setParams = (patch: Record<string, string | number | undefined>) => {
  const next = compactQuery({ ...(route.query as Record<string, string | number | undefined>), ...patch })
  void router.replace({ query: next })
}

const clearFilters = () => setParams({
  operatorId: undefined,
  action: undefined,
  targetType: undefined,
  result: undefined,
  startTime: undefined,
  endTime: undefined,
  page: undefined,
})
</script>
