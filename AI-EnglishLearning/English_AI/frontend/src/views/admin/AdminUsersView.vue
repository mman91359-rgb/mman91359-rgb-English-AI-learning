<template>
  <div class="space-y-4">
    <div class="bg-surface-container-lowest rounded-[20px] p-4 md:p-5 shadow-soft-glow border border-outline-variant/20">
      <div class="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-6 gap-3">
        <input v-model="keyword" :placeholder="$t('admin.keyword')" class="h-10 rounded-xl border border-outline-variant/40 bg-surface px-3 font-body-md text-body-md text-on-surface" @keyup.enter="applyFilters" />
        <select v-model="role" class="h-10 rounded-xl border border-outline-variant/40 bg-surface px-3 font-body-md text-body-md text-on-surface">
          <option value="">{{ $t('admin.all') }}</option>
          <option value="ROLE_USER">{{ $t('admin.roleUser') }}</option>
          <option value="ROLE_ADMIN">{{ $t('admin.roleAdmin') }}</option>
        </select>
        <select v-model="status" class="h-10 rounded-xl border border-outline-variant/40 bg-surface px-3 font-body-md text-body-md text-on-surface">
          <option value="">{{ $t('admin.all') }}</option>
          <option value="1">{{ $t('admin.enabled') }}</option>
          <option value="0">{{ $t('admin.disabled') }}</option>
        </select>
        <select v-model="cetLevel" class="h-10 rounded-xl border border-outline-variant/40 bg-surface px-3 font-body-md text-body-md text-on-surface">
          <option value="">{{ $t('admin.all') }}</option>
          <option value="CET4">CET4</option>
          <option value="CET6">CET6</option>
        </select>
        <input v-model="startDate" type="date" class="h-10 rounded-xl border border-outline-variant/40 bg-surface px-3 font-body-md text-body-md text-on-surface" />
        <input v-model="endDate" type="date" class="h-10 rounded-xl border border-outline-variant/40 bg-surface px-3 font-body-md text-body-md text-on-surface" />
      </div>
      <div class="flex gap-3 mt-3">
        <button type="button" class="px-5 h-10 rounded-full bg-primary text-on-primary font-label-lg text-label-lg" @click="applyFilters">{{ $t('admin.search') }}</button>
        <button type="button" class="px-5 h-10 rounded-full border border-outline-variant text-on-surface-variant font-label-lg text-label-lg" @click="resetFilters">{{ $t('admin.clear') }}</button>
      </div>
    </div>

    <LoadingState v-if="loading" :message="$t('admin.loading')" />
    <ErrorState v-else-if="error" :message="error" :action-label="$t('common.retry')" @retry="load" />
    <div v-else class="bg-surface-container-lowest rounded-[20px] shadow-soft-glow border border-outline-variant/20 overflow-hidden">
      <div v-if="records.length === 0" class="py-16 text-center text-on-surface-variant font-body-md text-body-md">
        {{ $t('admin.empty') }}
      </div>
      <div v-else class="overflow-x-auto">
        <table class="w-full min-w-[1100px] text-left whitespace-nowrap">
          <thead class="bg-surface-container-low border-b border-outline-variant/20">
            <tr class="font-label-md text-label-md text-on-surface-variant">
              <th class="px-4 py-3">{{ $t('admin.user') }}</th>
              <th class="px-4 py-3">{{ $t('admin.cet') }}</th>
              <th class="px-4 py-3">{{ $t('admin.role') }}</th>
              <th class="px-4 py-3">{{ $t('admin.status') }}</th>
              <th class="px-4 py-3">{{ $t('admin.elo') }}</th>
              <th class="px-4 py-3">{{ $t('admin.coin') }}</th>
              <th class="px-4 py-3">{{ $t('admin.lastLogin') }}</th>
              <th class="px-4 py-3">{{ $t('admin.createdAt') }}</th>
              <th class="px-4 py-3 text-right">{{ $t('admin.actions') }}</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="user in records" :key="user.id" class="border-b border-outline-variant/10 hover:bg-surface-container-low/50">
              <td class="px-4 py-3">
                <div class="flex items-center gap-3">
                  <div class="w-9 h-9 rounded-full bg-primary-container/25 text-primary flex items-center justify-center overflow-hidden">
                    <img v-if="user.avatarUrl" :src="user.avatarUrl" alt="" class="w-full h-full object-cover" />
                    <span v-else class="font-label-md text-label-md">{{ (user.nickname || user.username || 'U').slice(0, 1) }}</span>
                  </div>
                  <div class="min-w-0">
                    <p class="font-body-md text-body-md text-on-surface truncate">{{ user.nickname || user.username }}</p>
                    <p class="font-label-md text-label-md text-on-surface-variant truncate">{{ user.username }} · {{ user.phoneMasked || '—' }}</p>
                  </div>
                </div>
              </td>
              <td class="px-4 py-3 font-body-md text-body-md text-on-surface">{{ user.cetLevel }}</td>
              <td class="px-4 py-3 font-body-md text-body-md text-on-surface">{{ roleLabel(user.roles) }}</td>
              <td class="px-4 py-3"><StatusBadge :status="user.status" :text="user.status === 1 ? $t('admin.enabled') : $t('admin.disabled')" /></td>
              <td class="px-4 py-3 font-body-md text-body-md text-on-surface">{{ user.eloScore ?? '—' }}</td>
              <td class="px-4 py-3 font-body-md text-body-md text-on-surface">{{ user.coinBalance ?? '—' }}</td>
              <td class="px-4 py-3 font-label-md text-label-md text-on-surface-variant">{{ formatDate(user.lastLoginAt) }}</td>
              <td class="px-4 py-3 font-label-md text-label-md text-on-surface-variant">{{ formatDate(user.createdAt) }}</td>
              <td class="px-4 py-3">
                <div class="flex flex-wrap items-center justify-end gap-1.5">
                  <RouterLink :to="`/admin/users/${user.id}`" class="px-2.5 py-1 rounded-full bg-primary-container/15 text-primary font-label-md text-label-md">{{ $t('admin.detail') }}</RouterLink>
                  <button type="button" class="px-2.5 py-1 rounded-full bg-surface-container-high text-on-surface-variant font-label-md text-label-md" @click="toggleStatus(user)">
                    {{ user.status === 1 ? $t('admin.disableUser') : $t('admin.enableUser') }}
                  </button>
                  <button type="button" class="px-2.5 py-1 rounded-full bg-secondary-container/20 text-secondary font-label-md text-label-md" @click="toggleRole(user)">
                    {{ isAdminUser(user.roles) ? $t('admin.setUser') : $t('admin.setAdmin') }}
                  </button>
                  <button type="button" class="px-2.5 py-1 rounded-full bg-error-container/30 text-error font-label-md text-label-md" @click="openReset(user)">{{ $t('admin.resetPassword') }}</button>
                </div>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="px-4 pb-4">
        <AdminPagination :page="page" :size="size" :total="total" @update:page="changePage" @update:size="changeSize" />
      </div>
    </div>

    <ConfirmDialog
      :visible="confirmVisible"
      :title="confirmTitle"
      :message="confirmMessage"
      :danger="confirmDanger"
      :loading="confirmLoading"
      @update:visible="confirmVisible = $event"
      @confirm="runConfirm"
    />

    <BaseDialog :visible="resetVisible" max-width="max-w-md" @update:visible="closeReset">
      <h3 class="font-headline-md text-headline-md text-on-surface mb-2">{{ $t('admin.temporaryPassword') }}</h3>
      <p class="font-body-md text-body-md text-on-surface-variant">{{ $t('admin.temporaryPasswordHint') }}</p>
      <div class="mt-4 flex items-center gap-2 rounded-xl bg-surface-container-low p-4">
        <code class="flex-1 font-body-lg text-body-lg text-primary break-all">{{ tempPassword }}</code>
        <button type="button" class="px-3 py-2 rounded-full bg-primary text-on-primary font-label-md text-label-md" @click="copyTemp">{{ $t('admin.copy') }}</button>
      </div>
      <div class="mt-5 flex justify-end">
        <button type="button" class="px-5 py-2.5 rounded-full border border-outline-variant font-label-lg text-label-lg" @click="closeReset">{{ $t('admin.close') }}</button>
      </div>
    </BaseDialog>
  </div>
</template>

<script setup lang="ts">
import { onMounted, ref } from 'vue'
import { useI18n } from 'vue-i18n'
import AdminPagination from '../../components/admin/AdminPagination.vue'
import StatusBadge from '../../components/admin/StatusBadge.vue'
import ConfirmDialog from '../../components/admin/ConfirmDialog.vue'
import LoadingState from '../../components/ui/LoadingState.vue'
import ErrorState from '../../components/ui/ErrorState.vue'
import BaseDialog from '../../components/ui/BaseDialog.vue'
import { useToast } from '../../composables/useToast'
import {
  getAdminUsers,
  resetUserPassword,
  updateUserRole,
  updateUserStatus,
  type AdminUser,
  type AdminUserQuery,
} from '../../api/admin'

const { t } = useI18n()
const { show: toast } = useToast()

const keyword = ref('')
const role = ref('')
const status = ref('')
const cetLevel = ref('')
const startDate = ref('')
const endDate = ref('')
const page = ref(1)
const size = ref(20)
const total = ref(0)
const records = ref<AdminUser[]>([])
const loading = ref(false)
const error = ref('')

const confirmVisible = ref(false)
const confirmTitle = ref('')
const confirmMessage = ref('')
const confirmDanger = ref(false)
const confirmLoading = ref(false)
let confirmAction: (() => Promise<void>) | null = null

const resetVisible = ref(false)
const tempPassword = ref('')
const resetTarget = ref<AdminUser | null>(null)

const formatDate = (value?: string | null) => {
  if (!value) return '—'
  return value.replace('T', ' ').slice(0, 16)
}
const isAdminUser = (roles: string) => roles.split(',').map(item => item.trim()).includes('ROLE_ADMIN')
const roleLabel = (roles: string) => (isAdminUser(roles) ? t('admin.roleAdmin') : t('admin.roleUser'))

const load = async () => {
  loading.value = true
  error.value = ''
  try {
    const params: AdminUserQuery = { page: page.value, size: size.value }
    if (keyword.value.trim()) params.keyword = keyword.value.trim()
    if (role.value) params.role = role.value
    if (status.value) params.status = Number(status.value)
    if (cetLevel.value) params.cetLevel = cetLevel.value
    if (startDate.value) params.startDate = startDate.value
    if (endDate.value) params.endDate = endDate.value
    const result = await getAdminUsers(params)
    records.value = result.records
    total.value = result.total
  } catch (e) {
    error.value = e instanceof Error ? e.message : t('admin.error')
  } finally {
    loading.value = false
  }
}

const applyFilters = () => {
  page.value = 1
  void load()
}
const resetFilters = () => {
  keyword.value = ''
  role.value = ''
  status.value = ''
  cetLevel.value = ''
  startDate.value = ''
  endDate.value = ''
  applyFilters()
}
const changePage = (value: number) => {
  page.value = value
  void load()
}
const changeSize = (value: number) => {
  size.value = value
  page.value = 1
  void load()
}

const openConfirm = (title: string, message: string, danger: boolean, action: () => Promise<void>) => {
  confirmTitle.value = title
  confirmMessage.value = message
  confirmDanger.value = danger
  confirmAction = action
  confirmVisible.value = true
}

const runConfirm = async () => {
  if (!confirmAction) return
  confirmLoading.value = true
  try {
    await confirmAction()
    confirmVisible.value = false
    await load()
  } catch (e) {
    toast(e instanceof Error ? e.message : t('admin.error'), 'error')
  } finally {
    confirmLoading.value = false
  }
}

const toggleStatus = (user: AdminUser) => {
  const next = user.status === 1 ? 0 : 1
  openConfirm(
    t('admin.confirmTitle'),
    `${next === 0 ? t('admin.disableUser') : t('admin.enableUser')} ${user.username}?`,
    next === 0,
    async () => {
      await updateUserStatus(user.id, next)
      toast(t('admin.confirm'), 'success')
    },
  )
}

const toggleRole = (user: AdminUser) => {
  const next = isAdminUser(user.roles) ? 'ROLE_USER' : 'ROLE_ADMIN'
  openConfirm(
    t('admin.confirmTitle'),
    `${next === 'ROLE_ADMIN' ? t('admin.setAdmin') : t('admin.setUser')} ${user.username}?`,
    next === 'ROLE_ADMIN',
    async () => {
      await updateUserRole(user.id, next)
      toast(t('admin.confirm'), 'success')
    },
  )
}

const openReset = (user: AdminUser) => {
  resetTarget.value = user
  openConfirm(
    t('admin.resetPassword'),
    `${t('admin.resetPassword')} ${user.username}?`,
    true,
    async () => {
      const result = await resetUserPassword(user.id)
      tempPassword.value = result.temporaryPassword
      resetVisible.value = true
    },
  )
}

const closeReset = () => {
  resetVisible.value = false
  tempPassword.value = ''
  resetTarget.value = null
}

const copyTemp = async () => {
  try {
    await navigator.clipboard.writeText(tempPassword.value)
    toast(t('admin.copied'), 'success')
  } catch {
    toast(t('admin.copy'), 'warning')
  }
}

onMounted(load)
</script>
