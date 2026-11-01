<template>
  <div>
    <RouterLink to="/admin/users" class="inline-flex items-center gap-1 text-on-surface-variant hover:text-primary font-label-lg text-label-lg mb-4">
      <span class="material-symbols-outlined">arrow_back_ios_new</span>{{ $t('admin.users') }}
    </RouterLink>

    <LoadingState v-if="loading" :message="$t('admin.loading')" />
    <ErrorState v-else-if="error" :message="error" :action-label="$t('common.retry')" @retry="load" />
    <template v-else-if="detail">
      <div class="grid grid-cols-1 xl:grid-cols-3 gap-4">
        <div class="xl:col-span-2 space-y-4">
          <div class="bg-surface-container-lowest rounded-[20px] p-6 shadow-soft-glow border border-outline-variant/20">
            <div class="flex flex-col sm:flex-row sm:items-center gap-4">
              <div class="w-16 h-16 rounded-full bg-primary-container/25 text-primary flex items-center justify-center overflow-hidden text-xl font-bold">
                <img v-if="detail.user.avatarUrl" :src="detail.user.avatarUrl" alt="" class="w-full h-full object-cover" />
                <span v-else>{{ (detail.user.nickname || detail.user.username || 'U').slice(0, 1) }}</span>
              </div>
              <div class="flex-1 min-w-0">
                <h2 class="font-headline-md text-headline-md text-on-surface truncate">{{ detail.user.nickname || detail.user.username }}</h2>
                <p class="font-body-md text-body-md text-on-surface-variant">{{ detail.user.username }} · {{ detail.user.phoneMasked || '—' }}</p>
                <div class="flex flex-wrap gap-2 mt-2">
                  <StatusBadge :status="detail.user.status" :text="detail.user.status === 1 ? $t('admin.enabled') : $t('admin.disabled')" />
                  <span class="rounded-full bg-primary-container/15 text-primary px-2.5 py-1 font-label-md text-label-md">{{ isAdmin ? $t('admin.roleAdmin') : $t('admin.roleUser') }}</span>
                  <span class="rounded-full bg-surface-container-high text-on-surface-variant px-2.5 py-1 font-label-md text-label-md">{{ detail.user.cetLevel }}</span>
                </div>
              </div>
              <div class="flex flex-wrap gap-2">
                <button type="button" class="px-4 py-2 rounded-full bg-surface-container-high font-label-md text-label-md" @click="toggleStatus">{{ detail.user.status === 1 ? $t('admin.disableUser') : $t('admin.enableUser') }}</button>
                <button type="button" class="px-4 py-2 rounded-full bg-secondary-container/20 text-secondary font-label-md text-label-md" @click="toggleRole">{{ isAdmin ? $t('admin.setUser') : $t('admin.setAdmin') }}</button>
                <button type="button" class="px-4 py-2 rounded-full bg-error-container/30 text-error font-label-md text-label-md" @click="openReset">{{ $t('admin.resetPassword') }}</button>
              </div>
            </div>
          </div>

          <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
            <div class="bg-surface-container-lowest rounded-[20px] p-5 shadow-soft-glow border border-outline-variant/20">
              <p class="font-label-md text-label-md text-on-surface-variant mb-3">{{ $t('admin.elo') }}</p>
              <p class="font-headline-lg text-headline-lg text-primary">{{ detail.radar?.eloScore ?? '—' }}</p>
              <div class="mt-3 space-y-2 font-body-md text-body-md text-on-surface-variant">
                <div class="flex justify-between"><span>词汇</span><span>{{ detail.radar?.vocabularyScore ?? '—' }}</span></div>
                <div class="flex justify-between"><span>语法</span><span>{{ detail.radar?.grammarScore ?? '—' }}</span></div>
                <div class="flex justify-between"><span>听力</span><span>{{ detail.radar?.listeningScore ?? '—' }}</span></div>
                <div class="flex justify-between"><span>阅读</span><span>{{ detail.radar?.readingScore ?? '—' }}</span></div>
              </div>
            </div>
            <div class="bg-surface-container-lowest rounded-[20px] p-5 shadow-soft-glow border border-outline-variant/20">
              <p class="font-label-md text-label-md text-on-surface-variant mb-3">{{ $t('admin.coin') }}</p>
              <p class="font-headline-lg text-headline-lg text-primary">{{ detail.coin?.balance ?? '—' }}</p>
              <div class="mt-3 space-y-2 font-body-md text-body-md text-on-surface-variant">
                <div class="flex justify-between"><span>累计获得</span><span>{{ detail.coin?.totalEarned ?? '—' }}</span></div>
                <div class="flex justify-between"><span>连续签到</span><span>{{ detail.coin?.checkInStreak ?? '—' }}</span></div>
              </div>
            </div>
          </div>

          <div class="bg-surface-container-lowest rounded-[20px] p-5 shadow-soft-glow border border-outline-variant/20">
            <p class="font-label-md text-label-md text-on-surface-variant mb-3">学习数据</p>
            <div v-if="detail.stats" class="grid grid-cols-2 sm:grid-cols-4 gap-3 font-body-md text-body-md text-on-surface">
              <div><p class="text-on-surface-variant text-label-md">累计答题</p><p class="text-headline-md">{{ detail.stats.totalAnswered ?? 0 }}</p></div>
              <div><p class="text-on-surface-variant text-label-md">正确率</p><p class="text-headline-md">{{ detail.stats.correctRate ?? 0 }}%</p></div>
              <div><p class="text-on-surface-variant text-label-md">学习时长</p><p class="text-headline-md">{{ Math.round((detail.stats.totalStudySeconds ?? 0) / 60) }} 分</p></div>
              <div><p class="text-on-surface-variant text-label-md">活跃天数</p><p class="text-headline-md">{{ detail.stats.activeDays ?? 0 }}</p></div>
            </div>
            <p v-else class="font-body-md text-body-md text-on-surface-variant">暂不可用</p>
          </div>
        </div>

        <div class="space-y-4">
          <div class="bg-surface-container-lowest rounded-[20px] p-5 shadow-soft-glow border border-outline-variant/20">
            <p class="font-label-md text-label-md text-on-surface-variant mb-3">学习偏好</p>
            <div class="space-y-2 font-body-md text-body-md text-on-surface-variant">
              <div class="flex justify-between"><span>每日新词</span><span>{{ detail.preference?.dailyNewWords ?? '—' }}</span></div>
              <div class="flex justify-between"><span>每日复习</span><span>{{ detail.preference?.dailyReviewWords ?? '—' }}</span></div>
              <div class="flex justify-between"><span>每组词数</span><span>{{ detail.preference?.vocabGroupSize ?? '—' }}</span></div>
            </div>
          </div>
          <div class="bg-surface-container-lowest rounded-[20px] p-5 shadow-soft-glow border border-outline-variant/20">
            <p class="font-label-md text-label-md text-on-surface-variant mb-3">账号</p>
            <div class="space-y-2 font-body-md text-body-md text-on-surface-variant">
              <div class="flex justify-between"><span>注册时间</span><span>{{ formatDate(detail.user.createdAt) }}</span></div>
              <div class="flex justify-between"><span>最后登录</span><span>{{ formatDate(detail.user.lastLoginAt) }}</span></div>
            </div>
          </div>
        </div>
      </div>
    </template>

    <ConfirmDialog
      :visible="confirmVisible"
      :title="$t('admin.confirmTitle')"
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
import { computed, onMounted, ref } from 'vue'
import { useRoute } from 'vue-router'
import { useI18n } from 'vue-i18n'
import StatusBadge from '../../components/admin/StatusBadge.vue'
import ConfirmDialog from '../../components/admin/ConfirmDialog.vue'
import LoadingState from '../../components/ui/LoadingState.vue'
import ErrorState from '../../components/ui/ErrorState.vue'
import BaseDialog from '../../components/ui/BaseDialog.vue'
import { useToast } from '../../composables/useToast'
import { getAdminUser, resetUserPassword, updateUserRole, updateUserStatus, type AdminUserDetail } from '../../api/admin'

const route = useRoute()
const { t } = useI18n()
const { show: toast } = useToast()
const detail = ref<AdminUserDetail | null>(null)
const loading = ref(false)
const error = ref('')
const confirmVisible = ref(false)
const confirmMessage = ref('')
const confirmDanger = ref(false)
const confirmLoading = ref(false)
let confirmAction: (() => Promise<void>) | null = null
const resetVisible = ref(false)
const tempPassword = ref('')

const isAdmin = computed(() => (detail.value?.user.roles || '').split(',').map(item => item.trim()).includes('ROLE_ADMIN'))
const formatDate = (value?: string | null) => (value ? value.replace('T', ' ').slice(0, 16) : '—')

const load = async () => {
  loading.value = true
  error.value = ''
  try {
    detail.value = await getAdminUser(Number(route.params.id))
  } catch (e) {
    error.value = e instanceof Error ? e.message : t('admin.error')
  } finally {
    loading.value = false
  }
}

const openConfirm = (message: string, danger: boolean, action: () => Promise<void>) => {
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

const toggleStatus = () => {
  const user = detail.value?.user
  if (!user) return
  const next = user.status === 1 ? 0 : 1
  openConfirm(`${next === 0 ? t('admin.disableUser') : t('admin.enableUser')} ${user.username}?`, next === 0, async () => {
    await updateUserStatus(user.id, next)
  })
}
const toggleRole = () => {
  const user = detail.value?.user
  if (!user) return
  const next = isAdmin.value ? 'ROLE_USER' : 'ROLE_ADMIN'
  openConfirm(`${next === 'ROLE_ADMIN' ? t('admin.setAdmin') : t('admin.setUser')} ${user.username}?`, next === 'ROLE_ADMIN', async () => {
    await updateUserRole(user.id, next)
  })
}
const openReset = () => {
  const user = detail.value?.user
  if (!user) return
  openConfirm(`${t('admin.resetPassword')} ${user.username}?`, true, async () => {
    const result = await resetUserPassword(user.id)
    tempPassword.value = result.temporaryPassword
    resetVisible.value = true
  })
}
const closeReset = () => {
  resetVisible.value = false
  tempPassword.value = ''
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
