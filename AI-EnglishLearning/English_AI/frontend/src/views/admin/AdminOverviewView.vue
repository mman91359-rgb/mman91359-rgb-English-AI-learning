<template>
  <LoadingState v-if="loading && !data" :message="$t('adminConsole.common.loading')" />
  <ErrorState
    v-else-if="error"
    :message="errorMessage"
    :action-label="$t('adminConsole.common.retry')"
    @retry="reload"
  />
  <div v-else-if="data" class="flex flex-col gap-6">
    <div class="flex flex-wrap items-center justify-between gap-4">
      <p class="font-body-sm text-body-sm text-on-surface-variant">
        {{ $t('adminConsole.overview.generatedAt', { time: formatAdminDateTime(data.generatedAt) }) }}
      </p>
      <button
        type="button"
        class="flex items-center gap-2 rounded-full border border-outline-variant px-4 py-2 font-label-lg text-label-lg text-on-surface-variant transition-colors hover:bg-surface-container-low"
        @click="reload"
      >
        <span class="material-symbols-outlined text-icon-md" :class="loading ? 'animate-spin' : ''">refresh</span>
        {{ $t('adminConsole.common.refresh') }}
      </button>
    </div>

    <div
      v-if="data.exerciseDegraded"
      role="status"
      class="flex items-center gap-3 rounded-xl border border-warning/30 bg-warning-container px-4 py-3 text-on-warning-container"
    >
      <span class="material-symbols-outlined text-icon-md">warning</span>
      <span class="font-body-sm text-body-sm">{{ $t('adminConsole.overview.degradedBanner') }}</span>
    </div>

    <section class="grid grid-cols-1 gap-gutter sm:grid-cols-2 xl:grid-cols-4">
      <AdminStatCard
        icon="group"
        :label="$t('adminConsole.overview.totalUsers')"
        :value="formatNumber(data.totalUsers, locale)"
        :hint="$t('adminConsole.overview.todayNewUsers', { count: data.newUsersToday })"
      />
      <AdminStatCard
        icon="person_add"
        :label="$t('adminConsole.overview.newUsers7d')"
        :value="formatNumber(data.newUsers7d, locale)"
        :hint="$t('adminConsole.overview.adminUsers', { count: data.adminUsers })"
        tone="secondary"
      />
      <AdminStatCard
        icon="bolt"
        :label="$t('adminConsole.overview.activeUsersToday')"
        :value="data.exerciseDegraded ? $t('adminConsole.common.unavailable') : formatNumber(data.exercise.activeUsersToday, locale)"
        :hint="data.exerciseDegraded ? undefined : $t('adminConsole.overview.activeUsers7d', { count: data.exercise.activeUsers7d })"
        tone="tertiary"
      />
      <AdminStatCard
        icon="edit_note"
        :label="$t('adminConsole.overview.answeredLast30d')"
        :value="data.exerciseDegraded ? $t('adminConsole.common.unavailable') : formatNumber(data.exercise.answeredLast30d, locale)"
        :hint="data.exerciseDegraded ? undefined : $t('adminConsole.overview.todayAnswered', { count: data.exercise.todayAnswered })"
      />
      <AdminStatCard
        icon="pending_actions"
        :label="$t('adminConsole.overview.pendingReview')"
        :value="data.exerciseDegraded ? $t('adminConsole.common.unavailable') : formatNumber(data.exercise.pendingReview, locale)"
        :hint="data.exerciseDegraded ? undefined : $t('adminConsole.overview.questionTotal', { count: data.exercise.questionTotal })"
        tone="warning"
      />
      <AdminStatCard
        icon="monetization_on"
        :label="$t('adminConsole.overview.totalCoinBalance')"
        :value="formatNumber(data.totalCoinBalance, locale)"
        :hint="$t('adminConsole.overview.todayCheckIns', { count: data.todayCheckIns })"
        tone="tertiary"
      />
      <AdminStatCard
        icon="campaign"
        :label="$t('adminConsole.overview.activeNotices')"
        :value="formatNumber(data.activeNotices, locale)"
        :hint="$t('adminConsole.overview.activeActivities', { count: data.activeActivities })"
        tone="secondary"
      />
      <AdminStatCard
        icon="schedule"
        :label="$t('adminConsole.overview.totalStudyTime')"
        :value="data.exerciseDegraded ? $t('adminConsole.common.unavailable') : formatStudyDuration(data.exercise.totalStudySeconds)"
        :hint="data.exerciseDegraded ? undefined : $t('adminConsole.overview.dataWindow', { days: data.exercise.dataWindowDays })"
      />
    </section>

    <section class="grid grid-cols-1 gap-gutter lg:grid-cols-3">
      <AdminChartCard
        :title="$t('adminConsole.overview.userStatusTitle')"
        :description="$t('adminConsole.overview.userStatusDesc')"
        :data="[
          { label: $t('adminConsole.enum.userActive'), value: data.enabledUsers },
          { label: $t('adminConsole.enum.userDisabled'), value: data.disabledUsers },
          { label: $t('adminConsole.enum.roleAdmin'), value: data.adminUsers },
        ]"
        bar-class-name="bg-tertiary"
      />
      <AdminChartCard
        :title="$t('adminConsole.overview.questionStatusTitle')"
        :description="$t('adminConsole.overview.questionStatusDesc')"
        :data="data.exerciseDegraded ? [] : [
          { label: $t('adminConsole.enum.reviewPending'), value: data.exercise.pendingReview },
          { label: $t('adminConsole.enum.reviewApproved'), value: data.exercise.approvedTotal },
          { label: $t('adminConsole.enum.reviewRejected'), value: data.exercise.rejectedTotal },
        ]"
        bar-class-name="bg-primary"
      />
      <AdminChartCard
        :title="$t('adminConsole.overview.practiceTitle')"
        :description="$t('adminConsole.overview.practiceDesc')"
        :data="data.exerciseDegraded ? [] : [
          { label: $t('adminConsole.overview.todayAnsweredLabel'), value: data.exercise.todayAnswered },
          { label: $t('adminConsole.overview.activeUsersTodayLabel'), value: data.exercise.activeUsersToday },
          { label: $t('adminConsole.overview.activeUsers7dLabel'), value: data.exercise.activeUsers7d },
        ]"
        bar-class-name="bg-secondary"
      />
    </section>

    <OverviewPanels />
  </div>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { useI18n } from 'vue-i18n'
import AdminChartCard from '../../components/admin/AdminChartCard.vue'
import AdminStatCard from '../../components/admin/AdminStatCard.vue'
import LoadingState from '../../components/ui/LoadingState.vue'
import ErrorState from '../../components/ui/ErrorState.vue'
import OverviewPanels from './components/OverviewPanels.vue'
import { useAsyncData } from '../../composables/useAsyncData'
import { getAdminOverview } from '../../api/admin'
import { formatAdminDateTime, formatNumber, formatStudyDuration } from '../../utils/format'

const { t, locale } = useI18n()
const { data, error, loading, reload } = useAsyncData(() => getAdminOverview())

const errorMessage = computed(() => (error.value instanceof Error ? error.value.message : t('adminConsole.error.generic')))
</script>
