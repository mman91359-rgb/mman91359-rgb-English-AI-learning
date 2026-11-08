<template>
  <div class="flex flex-col gap-6">
    <div class="flex flex-wrap items-center justify-between gap-4">
      <p class="font-body-md text-body-md text-on-surface-variant">{{ $t('adminConsole.activity.subtitle') }}</p>
      <button type="button" :class="btnPrimary" @click="editing = 'create'">
        <span class="material-symbols-outlined text-icon-md">add</span>
        {{ $t('adminConsole.activity.create') }}
      </button>
    </div>

    <AdminFilterBar :has-active-filters="hasFilters" @reset="clearFilters">
      <AdminFilterField :label="$t('adminConsole.common.keyword')" class-name="w-full sm:w-64">
        <AdminFilterSearch
          :model-value="readString(route.query, 'keyword') ?? ''"
          :placeholder="$t('adminConsole.activity.searchPlaceholder')"
          @update:model-value="setParams({ keyword: $event || undefined, page: undefined })"
        />
      </AdminFilterField>
      <AdminFilterField :label="$t('adminConsole.activity.colStatus')">
        <AdminFilterSelect
          :model-value="query.status"
          :options="statusOptions"
          :all-label="$t('adminConsole.common.all')"
          @update:model-value="setParams({ status: $event, page: undefined })"
        />
      </AdminFilterField>
      <AdminFilterField :label="$t('adminConsole.activity.colType')">
        <AdminFilterSelect
          :model-value="query.activityType"
          :options="typeOptions"
          :all-label="$t('adminConsole.common.all')"
          @update:model-value="setParams({ activityType: $event, page: undefined })"
        />
      </AdminFilterField>
      <AdminFilterField :label="$t('adminConsole.activity.colAudience')">
        <AdminFilterSelect
          :model-value="query.targetAudience"
          :options="audienceOptions"
          :all-label="$t('adminConsole.common.all')"
          @update:model-value="setParams({ targetAudience: $event, page: undefined })"
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
          :empty-title="hasFilters ? $t('adminConsole.activity.emptyFiltered') : $t('adminConsole.activity.empty')"
          :empty-description="hasFilters ? '' : $t('adminConsole.activity.emptyDesc')"
        >
          <template #cell-title="{ row }">
            <div class="flex min-w-0 flex-col">
              <span class="truncate font-medium text-on-surface">{{ row.title }}</span>
              <span class="truncate font-label-sm text-label-sm text-on-surface-variant">{{ row.summary }}</span>
            </div>
          </template>
          <template #cell-activityType="{ row }">
            <StatusBadge :tone="typeTone(row.activityType)" :label="typeLabel(row.activityType)" />
          </template>
          <template #cell-targetAudience="{ row }">
            <StatusBadge :tone="audienceTone(row.targetAudience)" :label="audienceLabel(row.targetAudience)" />
          </template>
          <template #cell-status="{ row }">
            <StatusBadge :tone="activityStatusMeta(row).tone" :label="$t(activityStatusMeta(row).labelKey)" />
          </template>
          <template #cell-time="{ row }">
            <span class="whitespace-nowrap text-on-surface-variant">
              {{ formatAdminDateTime(row.startAt) }} → {{ formatAdminDateTime(row.endAt) }}
            </span>
          </template>
          <template #cell-sortOrder="{ row }"><span class="tabular-nums">{{ row.sortOrder }}</span></template>
          <template #cell-actions="{ row }">
            <div class="flex items-center justify-end gap-2">
              <template v-if="row.status === 'DRAFT'">
                <button type="button" class="flex items-center gap-1 rounded-full px-3 py-1.5 font-label-lg text-label-lg text-on-surface-variant hover:bg-surface-container-high" @click="editing = row">
                  <span class="material-symbols-outlined text-icon-sm">edit</span>
                  {{ $t('adminConsole.common.edit') }}
                </button>
                <button type="button" class="flex items-center gap-1 rounded-full bg-primary px-3 py-1.5 font-label-lg text-label-lg text-on-primary" @click="operation = { kind: 'publish', activity: row }">
                  <span class="material-symbols-outlined text-icon-sm">rocket_launch</span>
                  {{ $t('adminConsole.activity.publish') }}
                </button>
                <button type="button" class="flex items-center gap-1 rounded-full bg-error px-3 py-1.5 font-label-lg text-label-lg text-on-error" @click="operation = { kind: 'delete', activity: row }">
                  <span class="material-symbols-outlined text-icon-sm">delete</span>
                  {{ $t('adminConsole.common.delete') }}
                </button>
              </template>
              <button v-else-if="row.status === 'PUBLISHED'" type="button" class="flex items-center gap-1 rounded-full border border-outline-variant px-3 py-1.5 font-label-lg text-label-lg text-on-surface-variant" @click="operation = { kind: 'end', activity: row }">
                <span class="material-symbols-outlined text-icon-sm">stop_circle</span>
                {{ $t('adminConsole.activity.end') }}
              </button>
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

    <ActivityEditorDrawer
      v-if="editing"
      :activity="editing === 'create' ? null : editing"
      @close="onEditorClose"
    />

    <ConfirmDialog
      v-if="operation"
      :open="true"
      :danger="operation.kind !== 'publish'"
      :title="$t(`adminConsole.activity.${operation.kind}Title`)"
      :target-name="operation.activity.title"
      :impact="operationImpact"
      :confirm-label="$t(`adminConsole.activity.${operation.kind}Confirm`)"
      :loading="submitting"
      @cancel="operation = null"
      @confirm="runOperation"
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
import { btnPrimary } from '@/components/ui/buttonStyles'
import AdminPagination from '../../components/admin/AdminPagination.vue'
import ConfirmDialog from '../../components/admin/ConfirmDialog.vue'
import ActivityEditorDrawer from '../../components/admin/ActivityEditorDrawer.vue'
import StatusBadge from '../../components/admin/StatusBadge.vue'
import ErrorState from '../../components/ui/ErrorState.vue'
import type { TableColumn } from '../../components/admin/tableTypes'
import { useAsyncData } from '../../composables/useAsyncData'
import { useToast } from '../../composables/useToast'
import {
  deleteActivity,
  endActivity,
  getAdminActivities,
  getAdminErrorKey,
  publishActivity,
  type ActivityListQuery,
  type ActivityStatus,
  type ActivityType,
  type AdminActivity,
  type TargetAudience,
} from '../../api/admin'
import { ACTIVITY_STATUS_META, ACTIVITY_TYPE_META, AUDIENCE_META, activityStatusMeta } from '../../utils/adminEnums'
import { formatAdminDateTime } from '../../utils/format'
import { compactQuery, readEnum, readPage, readSize, readString } from '../../utils/query'

type ActivityOperationKind = 'publish' | 'end' | 'delete'

const route = useRoute()
const router = useRouter()
const { t } = useI18n()
const { show: toast } = useToast()

const ACTIVITY_STATUSES: readonly ActivityStatus[] = ['DRAFT', 'PUBLISHED', 'ENDED']
const ACTIVITY_TYPES: readonly ActivityType[] = ['BANNER', 'CONTENT']
const AUDIENCES: readonly TargetAudience[] = ['ALL', 'CET4', 'CET6']

const editing = ref<AdminActivity | 'create' | null>(null)
const operation = ref<{ kind: ActivityOperationKind; activity: AdminActivity } | null>(null)
const submitting = ref(false)

const statusOptions = computed(() => ACTIVITY_STATUSES.map((value) => ({ value, label: t(ACTIVITY_STATUS_META[value].labelKey) })))
const typeOptions = computed(() => ACTIVITY_TYPES.map((value) => ({ value, label: t(ACTIVITY_TYPE_META[value].labelKey) })))
const audienceOptions = computed(() => AUDIENCES.map((value) => ({ value, label: t(AUDIENCE_META[value].labelKey) })))
const typeTone = (value: ActivityType) => ACTIVITY_TYPE_META[value].tone
const typeLabel = (value: ActivityType) => t(ACTIVITY_TYPE_META[value].labelKey)
const audienceTone = (value: TargetAudience) => AUDIENCE_META[value].tone
const audienceLabel = (value: TargetAudience) => t(AUDIENCE_META[value].labelKey)

const query = computed<ActivityListQuery>(() => ({
  page: readPage(route.query),
  size: readSize(route.query),
  status: readEnum(route.query, 'status', ACTIVITY_STATUSES),
  activityType: readEnum(route.query, 'activityType', ACTIVITY_TYPES),
  targetAudience: readEnum(route.query, 'targetAudience', AUDIENCES),
  keyword: readString(route.query, 'keyword'),
}))

const hasFilters = computed(() => ['keyword', 'status', 'activityType', 'targetAudience'].some((key) => route.query[key] !== undefined))

const { data, error, loading, refreshing, reload } = useAsyncData(
  () => getAdminActivities(query.value),
  () => [route.query],
)

const columns = computed<TableColumn[]>(() => [
  { key: 'title', header: t('adminConsole.activity.colTitle') },
  { key: 'activityType', header: t('adminConsole.activity.colType') },
  { key: 'targetAudience', header: t('adminConsole.activity.colAudience') },
  { key: 'status', header: t('adminConsole.activity.colStatus') },
  { key: 'time', header: t('adminConsole.activity.colTime') },
  { key: 'sortOrder', header: t('adminConsole.activity.colSort'), align: 'right' },
  { key: 'actions', header: t('adminConsole.common.actions'), align: 'right' },
])

const operationImpact = computed(() => {
  if (!operation.value) return ''
  const { kind, activity } = operation.value
  if (kind === 'publish') {
    return t('adminConsole.activity.publishImpact', {
      audience: t(AUDIENCE_META[activity.targetAudience].labelKey),
      start: formatAdminDateTime(activity.startAt),
      end: formatAdminDateTime(activity.endAt),
    })
  }
  return t(`adminConsole.activity.${kind}Impact`)
})

const setParams = (patch: Record<string, string | number | undefined>) => {
  const next = compactQuery({ ...(route.query as Record<string, string | number | undefined>), ...patch })
  void router.replace({ query: next })
}

const clearFilters = () => setParams({ keyword: undefined, status: undefined, activityType: undefined, targetAudience: undefined, page: undefined })

const onEditorClose = (saved: boolean) => {
  editing.value = null
  if (saved) void reload()
}

const runOperation = async () => {
  if (!operation.value) return
  submitting.value = true
  try {
    const { kind, activity } = operation.value
    if (kind === 'publish') await publishActivity(activity.id)
    if (kind === 'end') await endActivity(activity.id)
    if (kind === 'delete') await deleteActivity(activity.id)
    toast(t(`adminConsole.activity.${kind}Toast`), 'success')
    operation.value = null
    await reload()
  } catch (e) {
    toast(t(getAdminErrorKey(e)), 'error')
  } finally {
    submitting.value = false
  }
}
</script>
