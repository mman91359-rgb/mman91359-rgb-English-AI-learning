<template>
  <LoadingState v-if="loading" :message="$t('admin.loading')" />
  <ErrorState v-else-if="error" :message="error" :action-label="$t('common.retry')" @retry="load" />
  <template v-else-if="data">
    <div v-if="data.exerciseDegraded" class="mb-4 rounded-xl border border-secondary/30 bg-secondary-container/20 px-4 py-3 font-body-md text-body-md text-secondary">
      {{ $t('admin.degraded') }}
    </div>

    <div class="grid grid-cols-1 sm:grid-cols-2 xl:grid-cols-3 gap-4">
      <AdminStatCard :label="$t('admin.totalUsers')" :value="data.totalUsers" icon="group" tone="primary" :hint="`${$t('admin.enabled')} ${data.enabledUsers} · ${$t('admin.disabled')} ${data.disabledUsers}`" />
      <AdminStatCard :label="$t('admin.newUsersToday')" :value="data.newUsersToday" icon="person_add" tone="secondary" :hint="`7d ${data.newUsers7d} · ${$t('admin.roleAdmin')} ${data.adminUsers}`" />
      <AdminStatCard :label="$t('admin.activeUsersToday')" :value="data.exercise.activeUsersToday" icon="bolt" tone="tertiary" :hint="`7d ${data.exercise.activeUsers7d}`" />
      <AdminStatCard :label="$t('admin.answeredLast30d')" :value="data.exercise.answeredLast30d" icon="fact_check" tone="primary" :hint="`${data.exercise.dataWindowDays} days`" />
      <AdminStatCard :label="$t('admin.todayAnswered')" :value="data.exercise.todayAnswered" icon="today" tone="secondary" :hint="`${$t('admin.total')}: ${data.exercise.questionTotal}`" />
      <AdminStatCard :label="$t('admin.pendingReview')" :value="data.exercise.pendingReview" icon="pending_actions" tone="error" :hint="`${$t('admin.approved')} ${data.exercise.approvedTotal} · ${$t('admin.rejected')} ${data.exercise.rejectedTotal}`" />
    </div>

    <div class="grid grid-cols-1 lg:grid-cols-2 gap-4 mt-6">
      <RouterLink to="/admin/users" class="bg-surface-container-lowest rounded-[20px] p-6 shadow-soft-glow border border-outline-variant/20 flex items-center justify-between hover:bg-surface-container transition-colors">
        <div class="flex items-center gap-4">
          <div class="w-11 h-11 rounded-full bg-primary-container/20 flex items-center justify-center">
            <span class="material-symbols-outlined text-primary">group</span>
          </div>
          <div>
            <p class="font-body-lg text-body-lg text-on-surface">{{ $t('admin.users') }}</p>
            <p class="font-label-md text-label-md text-on-surface-variant">{{ $t('admin.usersSubtitle') }}</p>
          </div>
        </div>
        <span class="material-symbols-outlined text-outline">chevron_right</span>
      </RouterLink>

      <RouterLink to="/admin/questions" class="bg-surface-container-lowest rounded-[20px] p-6 shadow-soft-glow border border-outline-variant/20 flex items-center justify-between hover:bg-surface-container transition-colors">
        <div class="flex items-center gap-4">
          <div class="w-11 h-11 rounded-full bg-secondary-container/30 flex items-center justify-center">
            <span class="material-symbols-outlined text-secondary">fact_check</span>
          </div>
          <div>
            <p class="font-body-lg text-body-lg text-on-surface">{{ $t('admin.questions') }}</p>
            <p class="font-label-md text-label-md text-on-surface-variant">{{ $t('admin.questionsSubtitle') }}</p>
          </div>
        </div>
        <span class="material-symbols-outlined text-outline">chevron_right</span>
      </RouterLink>
    </div>
  </template>
</template>

<script setup lang="ts">
import { onMounted, ref } from 'vue'
import { useI18n } from 'vue-i18n'
import AdminStatCard from '../../components/admin/AdminStatCard.vue'
import LoadingState from '../../components/ui/LoadingState.vue'
import ErrorState from '../../components/ui/ErrorState.vue'
import { getAdminOverview, type AdminOverview } from '../../api/admin'

const { t } = useI18n()
const data = ref<AdminOverview | null>(null)
const loading = ref(false)
const error = ref('')

const load = async () => {
  loading.value = true
  error.value = ''
  try {
    data.value = await getAdminOverview()
  } catch (e) {
    error.value = e instanceof Error ? e.message : t('admin.error')
  } finally {
    loading.value = false
  }
}

onMounted(load)
</script>
