<template>
  <div class="flex flex-col gap-6">
    <p class="font-body-md text-body-md text-on-surface-variant">{{ $t('adminConsole.users.subtitle') }}</p>

    <AdminFilterBar :has-active-filters="hasFilters" @reset="clearFilters">
      <AdminFilterField :label="$t('adminConsole.users.filterKeyword')" class-name="w-full sm:w-64">
        <AdminFilterSearch
          :model-value="query.keyword ?? ''"
          :placeholder="$t('adminConsole.users.searchPlaceholder')"
          @update:model-value="setParams({ keyword: $event || undefined, page: undefined })"
        />
      </AdminFilterField>
      <AdminFilterField :label="$t('adminConsole.users.filterRole')">
        <AdminFilterSelect
          :model-value="query.role"
          :options="roleOptions"
          :all-label="$t('adminConsole.common.all')"
          @update:model-value="setParams({ role: $event, page: undefined })"
        />
      </AdminFilterField>
      <AdminFilterField :label="$t('adminConsole.users.filterStatus')">
        <AdminFilterSelect
          :model-value="query.status"
          :options="statusOptions"
          :all-label="$t('adminConsole.common.all')"
          @update:model-value="setParams({ status: $event, page: undefined })"
        />
      </AdminFilterField>
      <AdminFilterField :label="$t('adminConsole.users.filterCet')">
        <AdminFilterSelect
          :model-value="query.cetLevel"
          :options="cetOptions"
          :all-label="$t('adminConsole.common.all')"
          @update:model-value="setParams({ cetLevel: $event, page: undefined })"
        />
      </AdminFilterField>
      <AdminFilterField :label="$t('adminConsole.users.filterRegisteredFrom')">
        <input
          type="date"
          :value="query.startDate ?? ''"
          :class="inputClass"
          class="h-10 py-0"
          @change="setParams({ startDate: ($event.target as HTMLInputElement).value || undefined, page: undefined })"
        />
      </AdminFilterField>
      <AdminFilterField :label="$t('adminConsole.users.filterRegisteredTo')">
        <input
          type="date"
          :value="query.endDate ?? ''"
          :class="inputClass"
          class="h-10 py-0"
          @change="setParams({ endDate: ($event.target as HTMLInputElement).value || undefined, page: undefined })"
        />
      </AdminFilterField>
    </AdminFilterBar>

    <p v-if="dateInvalid" class="font-label-md text-label-md text-error">{{ $t('adminConsole.users.dateRangeInvalid') }}</p>

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
          :empty-title="hasFilters ? $t('adminConsole.users.emptyFiltered') : $t('adminConsole.users.empty')"
          :empty-description="hasFilters ? '' : $t('adminConsole.users.emptyDesc')"
        >
          <template #cell-user="{ row }">
            <div class="flex items-center gap-3">
              <UserAvatar :name="row.nickname || row.username" :avatar-url="row.avatarUrl" />
              <div class="flex min-w-0 flex-col">
                <span class="truncate font-medium text-on-surface">{{ row.nickname || row.username }}</span>
                <span class="truncate font-label-sm text-label-sm text-on-surface-variant">
                  {{ row.username }}<template v-if="row.phoneMasked"> · {{ row.phoneMasked }}</template>
                </span>
              </div>
            </div>
          </template>
          <template #cell-cetLevel="{ row }">{{ displayOrDash(row.cetLevel) }}</template>
          <template #cell-roles="{ row }">
            <div class="flex flex-wrap gap-1">
              <StatusBadge v-for="role in row.roles" :key="role" :tone="roleTone(role)" :label="roleLabel(role)" />
            </div>
          </template>
          <template #cell-status="{ row }">
            <StatusBadge :tone="statusTone(row.status)" :label="statusLabel(row.status)" />
          </template>
          <template #cell-eloScore="{ row }">{{ formatNumber(row.eloScore, locale) }}</template>
          <template #cell-coinBalance="{ row }">{{ formatNumber(row.coinBalance, locale) }}</template>
          <template #cell-lastLoginAt="{ row }">{{ formatAdminDateTime(row.lastLoginAt) }}</template>
          <template #cell-createdAt="{ row }">{{ formatAdminDateTime(row.createdAt) }}</template>
          <template #cell-actions="{ row }">
            <div class="flex items-center justify-end gap-1">
              <button type="button" class="flex h-8 w-8 items-center justify-center rounded-full text-on-surface-variant transition-all duration-200 hover:scale-110 hover:bg-primary-container/30 hover:text-primary active:scale-95 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-primary disabled:pointer-events-none disabled:opacity-50" :aria-label="$t('adminConsole.users.actionView')" :title="$t('adminConsole.users.actionView')" @click="router.push(`/admin/users/${row.id}`)">
                <span class="material-symbols-outlined text-icon-md">visibility</span>
              </button>
              <button v-if="row.id !== currentUserId" type="button" class="flex h-8 w-8 items-center justify-center rounded-full transition-all duration-200 hover:scale-110 active:scale-95 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-primary disabled:pointer-events-none disabled:opacity-50" :class="row.status === 1 ? 'text-error hover:bg-error-container' : 'text-on-surface-variant hover:bg-primary-container/30 hover:text-primary'" :aria-label="row.status === 1 ? $t('adminConsole.users.actionDisable') : $t('adminConsole.users.actionEnable')" :title="row.status === 1 ? $t('adminConsole.users.actionDisable') : $t('adminConsole.users.actionEnable')" @click="action = { kind: 'status', user: row }">
                <span class="material-symbols-outlined text-icon-md">{{ row.status === 1 ? 'block' : 'check_circle' }}</span>
              </button>
              <button type="button" class="flex h-8 w-8 items-center justify-center rounded-full text-on-surface-variant transition-all duration-200 hover:scale-110 hover:bg-primary-container/30 hover:text-primary active:scale-95 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-primary disabled:pointer-events-none disabled:opacity-50" :aria-label="$t('adminConsole.users.actionReset')" :title="$t('adminConsole.users.actionReset')" @click="action = { kind: 'reset', user: row }">
                <span class="material-symbols-outlined text-icon-md">lock_reset</span>
              </button>
              <button type="button" class="flex h-8 w-8 items-center justify-center rounded-full text-on-surface-variant transition-all duration-200 hover:scale-110 hover:bg-primary-container/30 hover:text-primary active:scale-95 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-primary disabled:pointer-events-none disabled:opacity-50" :aria-label="$t('adminConsole.users.actionSetPassword')" :title="$t('adminConsole.users.actionSetPassword')" @click="action = { kind: 'setPassword', user: row }">
                <span class="material-symbols-outlined text-icon-md">key</span>
              </button>
              <button v-if="row.id !== currentUserId" type="button" class="flex h-8 w-8 items-center justify-center rounded-full text-on-surface-variant transition-all duration-200 hover:scale-110 hover:bg-primary-container/30 hover:text-primary active:scale-95 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-primary disabled:pointer-events-none disabled:opacity-50" :aria-label="$t('adminConsole.users.actionRole')" :title="$t('adminConsole.users.actionRole')" @click="action = { kind: 'role', user: row }">
                <span class="material-symbols-outlined text-icon-md">manage_accounts</span>
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

    <UserActionDialog
      v-if="action"
      :key="`${action.kind}-${action.user.id}`"
      :action="action"
      @close="onActionClose"
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
import StatusBadge from '../../components/admin/StatusBadge.vue'
import UserAvatar from '../../components/admin/UserAvatar.vue'
import UserActionDialog from '../../components/admin/UserActionDialog.vue'
import ErrorState from '../../components/ui/ErrorState.vue'
import { inputClass } from '@/components/ui/formStyles'
import type { TableColumn } from '../../components/admin/tableTypes'
import type { UserAction } from '../../components/admin/userActionTypes'
import { useAsyncData } from '../../composables/useAsyncData'
import { useUserStore } from '../../stores/user'
import { getAdminUsers, type CetLevel, type UserListQuery, type UserRole, type UserStatus } from '../../api/admin'
import { USER_ROLE_META, USER_STATUS_META } from '../../utils/adminEnums'
import { displayOrDash, formatAdminDateTime, formatNumber } from '../../utils/format'
import { compactQuery, readEnum, readNumberEnum, readPage, readSize, readString } from '../../utils/query'

const route = useRoute()
const router = useRouter()
const { t, locale } = useI18n()
const userStore = useUserStore()

/** 当前登录管理员 id：不能对自己禁用/改角色（后端也会 409，前端直接隐藏入口） */
const currentUserId = computed(() => userStore.userId)

const ROLES: readonly UserRole[] = ['ROLE_USER', 'ROLE_ADMIN']
const STATUSES: readonly UserStatus[] = [1, 0]
const CET_LEVELS: readonly CetLevel[] = ['CET4', 'CET6']

const action = ref<UserAction | null>(null)

const roleOptions = computed(() => ROLES.map((role) => ({ value: role, label: t(USER_ROLE_META[role].labelKey) })))
const statusOptions = computed(() => STATUSES.map((status) => ({ value: status, label: t(USER_STATUS_META[status].labelKey) })))
const cetOptions = computed(() => CET_LEVELS.map((level) => ({ value: level, label: level })))
const roleTone = (role: UserRole) => USER_ROLE_META[role].tone
const roleLabel = (role: UserRole) => t(USER_ROLE_META[role].labelKey)
const statusTone = (status: UserStatus) => USER_STATUS_META[status].tone
const statusLabel = (status: UserStatus) => t(USER_STATUS_META[status].labelKey)

const query = computed<UserListQuery>(() => ({
  page: readPage(route.query),
  size: readSize(route.query),
  keyword: readString(route.query, 'keyword'),
  role: readEnum(route.query, 'role', ROLES),
  status: readNumberEnum(route.query, 'status', STATUSES),
  cetLevel: readEnum(route.query, 'cetLevel', CET_LEVELS),
  startDate: readString(route.query, 'startDate'),
  endDate: readString(route.query, 'endDate'),
}))

const hasFilters = computed(() => ['keyword', 'role', 'status', 'cetLevel', 'startDate', 'endDate'].some((key) => route.query[key] !== undefined))
const dateInvalid = computed(() => Boolean(query.value.startDate && query.value.endDate && query.value.startDate > query.value.endDate))

const { data, error, loading, refreshing, reload } = useAsyncData(
  () => getAdminUsers(query.value),
  () => [route.query],
)

const columns = computed<TableColumn[]>(() => [
  { key: 'user', header: t('adminConsole.users.colUser') },
  { key: 'cetLevel', header: t('adminConsole.users.colCet') },
  { key: 'roles', header: t('adminConsole.users.colRole') },
  { key: 'status', header: t('adminConsole.users.colStatus') },
  { key: 'eloScore', header: t('adminConsole.users.colElo'), align: 'right' },
  { key: 'coinBalance', header: t('adminConsole.users.colCoin'), align: 'right' },
  { key: 'lastLoginAt', header: t('adminConsole.users.colLastLogin') },
  { key: 'createdAt', header: t('adminConsole.users.colCreatedAt') },
  { key: 'actions', header: t('adminConsole.users.colActions'), align: 'right' },
])

const setParams = (patch: Record<string, string | number | undefined>) => {
  const next = compactQuery({ ...(route.query as Record<string, string | number | undefined>), ...patch })
  void router.replace({ query: next })
}

const clearFilters = () => {
  setParams({ keyword: undefined, role: undefined, status: undefined, cetLevel: undefined, startDate: undefined, endDate: undefined, page: undefined })
}

const onActionClose = (changed: boolean) => {
  action.value = null
  if (changed) void reload()
}
</script>
