<template>
  <section class="grid grid-cols-1 gap-gutter xl:grid-cols-2">
    <section class="flex flex-col rounded-[16px] border border-outline-variant/40 bg-surface-container-lowest shadow-soft-glow">
      <header class="flex items-center justify-between border-b border-outline-variant/40 px-6 py-4">
        <h2 class="font-headline-sm text-headline-sm text-on-surface">{{ $t('adminConsole.overview.recentLogs') }}</h2>
        <RouterLink to="/admin/operation-logs" class="font-label-md text-label-md text-primary hover:underline">
          {{ $t('adminConsole.common.viewAll') }}
        </RouterLink>
      </header>
      <LoadingState v-if="logsLoading && !logsData" :message="$t('adminConsole.common.loading')" />
      <ErrorState
        v-else-if="logsError"
        :message="logsError instanceof Error ? logsError.message : $t('adminConsole.error.generic')"
        :action-label="$t('adminConsole.common.retry')"
        @retry="reloadLogs"
      />
      <EmptyState v-else-if="!logsData?.records.length" :title="$t('adminConsole.overview.recentLogsEmpty')" />
      <ul v-else class="divide-y divide-outline-variant/40">
        <li v-for="log in logsData.records" :key="log.id" class="flex items-center gap-4 px-6 py-3">
          <div class="flex min-w-0 flex-1 flex-col">
            <span class="truncate font-body-sm text-body-sm text-on-surface">{{ log.operatorName }} · {{ log.action }}</span>
            <span class="font-label-sm text-label-sm text-on-surface-variant">{{ formatAdminDateTime(log.createdAt) }}</span>
          </div>
          <StatusBadge :tone="AUDIT_RESULT_META[log.result].tone" :label="$t(AUDIT_RESULT_META[log.result].labelKey)" />
        </li>
      </ul>
    </section>

    <section class="flex flex-col rounded-[16px] border border-outline-variant/40 bg-surface-container-lowest shadow-soft-glow">
      <header class="flex items-center justify-between border-b border-outline-variant/40 px-6 py-4">
        <h2 class="font-headline-sm text-headline-sm text-on-surface">{{ $t('adminConsole.overview.pendingQuestions') }}</h2>
        <RouterLink to="/admin/questions" class="font-label-md text-label-md text-primary hover:underline">
          {{ $t('adminConsole.common.viewAll') }}
        </RouterLink>
      </header>
      <LoadingState v-if="questionsLoading && !questionsData" :message="$t('adminConsole.common.loading')" />
      <ErrorState
        v-else-if="questionsError"
        :message="questionsError instanceof Error ? questionsError.message : $t('adminConsole.error.generic')"
        :action-label="$t('adminConsole.common.retry')"
        @retry="reloadQuestions"
      />
      <EmptyState v-else-if="!questionsData?.records.length" :title="$t('adminConsole.overview.pendingQuestionsEmpty')" />
      <ul v-else class="divide-y divide-outline-variant/40">
        <li v-for="question in questionsData.records" :key="question.id" class="flex items-center gap-4 px-6 py-3">
          <div class="flex min-w-0 flex-1 flex-col">
            <span class="truncate font-body-sm text-body-sm text-on-surface">{{ question.stem }}</span>
            <span class="font-label-sm text-label-sm text-on-surface-variant">{{ formatAdminDateTime(question.createdAt) }}</span>
          </div>
          <StatusBadge :tone="REVIEW_STATUS_META[question.status].tone" :label="$t(REVIEW_STATUS_META[question.status].labelKey)" />
        </li>
      </ul>
    </section>
  </section>
</template>

<script setup lang="ts">
import { RouterLink } from 'vue-router'
import EmptyState from '../../../components/ui/EmptyState.vue'
import ErrorState from '../../../components/ui/ErrorState.vue'
import LoadingState from '../../../components/ui/LoadingState.vue'
import StatusBadge from '../../../components/admin/StatusBadge.vue'
import { useAsyncData } from '../../../composables/useAsyncData'
import { getAdminQuestions, getOperationLogs } from '../../../api/admin'
import { AUDIT_RESULT_META, REVIEW_STATUS_META } from '../../../utils/adminEnums'
import { formatAdminDateTime } from '../../../utils/format'

const {
  data: logsData,
  error: logsError,
  loading: logsLoading,
  reload: reloadLogs,
} = useAsyncData(() => getOperationLogs({ page: 1, size: 5 }))

const {
  data: questionsData,
  error: questionsError,
  loading: questionsLoading,
  reload: reloadQuestions,
} = useAsyncData(() => getAdminQuestions({ status: 'PENDING', page: 1, size: 5 }))
</script>
