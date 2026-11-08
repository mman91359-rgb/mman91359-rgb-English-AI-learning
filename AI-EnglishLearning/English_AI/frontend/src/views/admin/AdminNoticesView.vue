<template>
  <div class="flex flex-col gap-6">
    <div class="flex flex-wrap items-center justify-between gap-4">
      <p class="font-body-md text-body-md text-on-surface-variant">{{ $t('adminConsole.notice.subtitle') }}</p>
      <button type="button" :class="btnPrimary" @click="editing = 'create'">
        <span class="material-symbols-outlined text-icon-md">add</span>
        {{ $t('adminConsole.notice.create') }}
      </button>
    </div>

    <AdminFilterBar :has-active-filters="hasFilters" @reset="clearFilters">
      <AdminFilterField :label="$t('adminConsole.common.keyword')" class-name="w-full sm:w-64">
        <AdminFilterSearch
          :model-value="readString(route.query, 'keyword') ?? ''"
          :placeholder="$t('adminConsole.notice.searchPlaceholder')"
          @update:model-value="setParams({ keyword: $event || undefined, page: undefined })"
        />
      </AdminFilterField>
      <AdminFilterField :label="$t('adminConsole.notice.colStatus')">
        <AdminFilterSelect
          :model-value="query.status"
          :options="statusOptions"
          :all-label="$t('adminConsole.common.all')"
          @update:model-value="setParams({ status: $event, page: undefined })"
        />
      </AdminFilterField>
      <AdminFilterField :label="$t('adminConsole.notice.colType')">
        <AdminFilterSelect
          :model-value="query.noticeType"
          :options="typeOptions"
          :all-label="$t('adminConsole.common.all')"
          @update:model-value="setParams({ noticeType: $event, page: undefined })"
        />
      </AdminFilterField>
      <AdminFilterField :label="$t('adminConsole.notice.colAudience')">
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
          :empty-title="hasFilters ? $t('adminConsole.notice.emptyFiltered') : $t('adminConsole.notice.empty')"
          :empty-description="hasFilters ? '' : $t('adminConsole.notice.emptyDesc')"
        >
          <template #cell-title="{ row }">
            <div class="flex min-w-0 flex-col">
              <span class="truncate font-medium text-on-surface">{{ row.title }}</span>
              <span class="truncate font-label-sm text-label-sm text-on-surface-variant">{{ row.content }}</span>
            </div>
          </template>
          <template #cell-noticeType="{ row }">
            <StatusBadge :tone="typeTone(row.noticeType)" :label="typeLabel(row.noticeType)" />
          </template>
          <template #cell-targetAudience="{ row }">
            <StatusBadge :tone="audienceTone(row.targetAudience)" :label="audienceLabel(row.targetAudience)" />
          </template>
          <template #cell-status="{ row }">
            <StatusBadge :tone="statusTone(row.status)" :label="statusLabel(row.status)" />
          </template>
          <template #cell-publishAt="{ row }">{{ formatAdminDateTime(row.publishAt) }}</template>
          <template #cell-expireAt="{ row }">{{ formatAdminDateTime(row.expireAt) }}</template>
          <template #cell-createdByName="{ row }">{{ row.createdByName ?? '—' }}</template>
          <template #cell-actions="{ row }">
            <div class="flex items-center justify-end gap-2">
              <template v-if="row.status === 'DRAFT'">
                <button type="button" class="flex items-center gap-1 rounded-full px-3 py-1.5 font-label-lg text-label-lg text-on-surface-variant hover:bg-surface-container-high" @click="editing = row">
                  <span class="material-symbols-outlined text-icon-sm">edit</span>
                  {{ $t('adminConsole.common.edit') }}
                </button>
                <button type="button" class="flex items-center gap-1 rounded-full bg-primary px-3 py-1.5 font-label-lg text-label-lg text-on-primary" @click="operation = { kind: 'publish', notice: row }">
                  <span class="material-symbols-outlined text-icon-sm">send</span>
                  {{ $t('adminConsole.notice.publish') }}
                </button>
                <button type="button" class="flex items-center gap-1 rounded-full bg-error px-3 py-1.5 font-label-lg text-label-lg text-on-error" @click="operation = { kind: 'delete', notice: row }">
                  <span class="material-symbols-outlined text-icon-sm">delete</span>
                  {{ $t('adminConsole.common.delete') }}
                </button>
              </template>
              <button v-else-if="row.status === 'PUBLISHED'" type="button" class="flex items-center gap-1 rounded-full border border-outline-variant px-3 py-1.5 font-label-lg text-label-lg text-on-surface-variant" @click="operation = { kind: 'expire', notice: row }">
                <span class="material-symbols-outlined text-icon-sm">unpublished</span>
                {{ $t('adminConsole.notice.expire') }}
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

    <NoticeEditorDrawer
      v-if="editing"
      :notice="editing === 'create' ? null : editing"
      @close="onEditorClose"
    />

    <ConfirmDialog
      v-if="operation"
      :open="true"
      :danger="operation.kind !== 'publish'"
      :title="$t(`adminConsole.notice.${operation.kind}Title`)"
      :target-name="operation.notice.title"
      :impact="operationImpact"
      :confirm-label="$t(`adminConsole.notice.${operation.kind}Confirm`)"
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
import NoticeEditorDrawer from '../../components/admin/NoticeEditorDrawer.vue'
import StatusBadge from '../../components/admin/StatusBadge.vue'
import ErrorState from '../../components/ui/ErrorState.vue'
import type { TableColumn } from '../../components/admin/tableTypes'
import { useAsyncData } from '../../composables/useAsyncData'
import { useToast } from '../../composables/useToast'
import {
  deleteNotice,
  expireNotice,
  getAdminErrorKey,
  getAdminNotices,
  publishNotice,
  type AdminNotice,
  type NoticeListQuery,
  type NoticeStatus,
  type NoticeType,
  type TargetAudience,
} from '../../api/admin'
import { AUDIENCE_META, NOTICE_STATUS_META, NOTICE_TYPE_META } from '../../utils/adminEnums'
import { formatAdminDateTime } from '../../utils/format'
import { compactQuery, readEnum, readPage, readSize, readString } from '../../utils/query'

type NoticeOperationKind = 'publish' | 'expire' | 'delete'

const route = useRoute()
const router = useRouter()
const { t } = useI18n()
const { show: toast } = useToast()

const NOTICE_STATUSES: readonly NoticeStatus[] = ['DRAFT', 'PUBLISHED', 'EXPIRED']
const NOTICE_TYPES: readonly NoticeType[] = ['SYSTEM', 'REMINDER', 'ACTIVITY']
const AUDIENCES: readonly TargetAudience[] = ['ALL', 'CET4', 'CET6']

const editing = ref<AdminNotice | 'create' | null>(null)
const operation = ref<{ kind: NoticeOperationKind; notice: AdminNotice } | null>(null)
const submitting = ref(false)

const statusOptions = computed(() => NOTICE_STATUSES.map((value) => ({ value, label: t(NOTICE_STATUS_META[value].labelKey) })))
const typeOptions = computed(() => NOTICE_TYPES.map((value) => ({ value, label: t(NOTICE_TYPE_META[value].labelKey) })))
const audienceOptions = computed(() => AUDIENCES.map((value) => ({ value, label: t(AUDIENCE_META[value].labelKey) })))
const typeTone = (value: NoticeType) => NOTICE_TYPE_META[value].tone
const typeLabel = (value: NoticeType) => t(NOTICE_TYPE_META[value].labelKey)
const audienceTone = (value: TargetAudience) => AUDIENCE_META[value].tone
const audienceLabel = (value: TargetAudience) => t(AUDIENCE_META[value].labelKey)
const statusTone = (value: NoticeStatus) => NOTICE_STATUS_META[value].tone
const statusLabel = (value: NoticeStatus) => t(NOTICE_STATUS_META[value].labelKey)

const query = computed<NoticeListQuery>(() => ({
  page: readPage(route.query),
  size: readSize(route.query),
  status: readEnum(route.query, 'status', NOTICE_STATUSES),
  noticeType: readEnum(route.query, 'noticeType', NOTICE_TYPES),
  targetAudience: readEnum(route.query, 'targetAudience', AUDIENCES),
  keyword: readString(route.query, 'keyword'),
}))

const hasFilters = computed(() => ['keyword', 'status', 'noticeType', 'targetAudience'].some((key) => route.query[key] !== undefined))

const { data, error, loading, refreshing, reload } = useAsyncData(
  () => getAdminNotices(query.value),
  () => [route.query],
)

const columns = computed<TableColumn[]>(() => [
  { key: 'title', header: t('adminConsole.notice.colTitle') },
  { key: 'noticeType', header: t('adminConsole.notice.colType') },
  { key: 'targetAudience', header: t('adminConsole.notice.colAudience') },
  { key: 'status', header: t('adminConsole.notice.colStatus') },
  { key: 'publishAt', header: t('adminConsole.notice.colPublishAt') },
  { key: 'expireAt', header: t('adminConsole.notice.colExpireAt') },
  { key: 'createdByName', header: t('adminConsole.notice.colCreator') },
  { key: 'actions', header: t('adminConsole.common.actions'), align: 'right' },
])

const operationImpact = computed(() => {
  if (!operation.value) return ''
  const { kind, notice } = operation.value
  if (kind === 'publish') {
    return t('adminConsole.notice.publishImpact', {
      audience: t(AUDIENCE_META[notice.targetAudience].labelKey),
      publishAt: notice.publishAt ? formatAdminDateTime(notice.publishAt) : t('adminConsole.notice.publishNow'),
      expireAt: notice.expireAt ? formatAdminDateTime(notice.expireAt) : t('adminConsole.notice.publishNoExpire'),
    })
  }
  return t(`adminConsole.notice.${kind}Impact`)
})

const setParams = (patch: Record<string, string | number | undefined>) => {
  const next = compactQuery({ ...(route.query as Record<string, string | number | undefined>), ...patch })
  void router.replace({ query: next })
}

const clearFilters = () => setParams({ keyword: undefined, status: undefined, noticeType: undefined, targetAudience: undefined, page: undefined })

const onEditorClose = (saved: boolean) => {
  editing.value = null
  if (saved) void reload()
}

const runOperation = async () => {
  if (!operation.value) return
  submitting.value = true
  try {
    const { kind, notice } = operation.value
    if (kind === 'publish') await publishNotice(notice.id)
    if (kind === 'expire') await expireNotice(notice.id)
    if (kind === 'delete') await deleteNotice(notice.id)
    toast(t(`adminConsole.notice.${kind}Toast`), 'success')
    operation.value = null
    await reload()
  } catch (e) {
    toast(t(getAdminErrorKey(e)), 'error')
  } finally {
    submitting.value = false
  }
}
</script>
