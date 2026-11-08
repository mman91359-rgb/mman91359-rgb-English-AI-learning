import { fetchOverview } from '@/api/admin';
import { AdminChartCard } from '@/components/admin/AdminChartCard';
import { AdminStatCard } from '@/components/admin/AdminStatCard';
import { Button } from '@/components/ui/Button';
import { ErrorState, LoadingState } from '@/components/ui/StateView';
import { useI18n } from '@/i18n';
import { formatDateTime, formatNumber, formatStudyDuration } from '@/lib/format';
import { useAsync } from '@/lib/useAsync';
import { OverviewActivityPanels } from '@/pages/admin/OverviewActivityPanels';

export function OverviewPage() {
  const { t, locale } = useI18n();
  const { data, error, loading, reload } = useAsync(fetchOverview, []);

  if (loading && !data) return <LoadingState rows={8} />;
  if (error || !data) return <ErrorState error={error} onRetry={reload} />;

  const n = (value: number) => formatNumber(value, locale);
  const exercise = data.exercise;
  const degraded = data.exerciseDegraded;

  return (
    <div className="flex flex-col gap-6">
      <div className="flex flex-wrap items-center justify-between gap-4">
        <p className="text-body-sm text-on-surface-variant">
          {t('overview.generatedAt', { time: formatDateTime(data.generatedAt) })}
        </p>
        <Button variant="secondary" size="sm" icon="refresh" onClick={reload} loading={loading}>
          {t('common.refresh')}
        </Button>
      </div>

      {degraded && (
        <div
          role="status"
          className="flex items-center gap-3 rounded-xl border border-warning/30 bg-warning-container px-4 py-3 text-on-warning-container"
        >
          <span className="material-symbols-outlined text-icon-md">warning</span>
          <span className="text-body-sm">{t('overview.degradedBanner')}</span>
        </div>
      )}

      <section className="grid grid-cols-1 gap-gutter sm:grid-cols-2 xl:grid-cols-4">
        <AdminStatCard
          icon="group"
          label={t('overview.totalUsers')}
          value={n(data.totalUsers)}
          hint={t('overview.todayNewUsers', { count: data.newUsersToday })}
        />
        <AdminStatCard
          icon="person_add"
          label={t('overview.newUsers7d')}
          value={n(data.newUsers7d)}
          hint={t('overview.adminUsers', { count: data.adminUsers })}
          tone="secondary"
        />
        <AdminStatCard
          icon="bolt"
          label={t('overview.activeUsersToday')}
          value={degraded ? t('common.unavailable') : n(exercise.activeUsersToday)}
          hint={degraded ? undefined : t('overview.activeUsers7d', { count: exercise.activeUsers7d })}
          tone="tertiary"
        />
        <AdminStatCard
          icon="edit_note"
          label={t('overview.answeredLast30d')}
          value={degraded ? t('common.unavailable') : n(exercise.answeredLast30d)}
          hint={degraded ? undefined : t('overview.todayAnswered', { count: exercise.todayAnswered })}
          tone="primary"
        />
        <AdminStatCard
          icon="pending_actions"
          label={t('overview.pendingReview')}
          value={n(exercise.pendingReview)}
          hint={t('overview.questionTotal', { count: exercise.questionTotal })}
          tone="warning"
        />
        <AdminStatCard
          icon="monetization_on"
          label={t('overview.totalCoinBalance')}
          value={n(data.totalCoinBalance)}
          hint={t('overview.todayCheckIns', { count: data.todayCheckIns })}
          tone="tertiary"
        />
        <AdminStatCard
          icon="campaign"
          label={t('overview.activeNotices')}
          value={n(data.activeNotices)}
          hint={t('overview.activeActivities', { count: data.activeActivities })}
          tone="secondary"
        />
        <AdminStatCard
          icon="schedule"
          label={t('overview.totalStudyTime')}
          value={degraded ? t('common.unavailable') : formatStudyDuration(exercise.totalStudySeconds)}
          hint={degraded ? undefined : t('overview.dataWindow', { days: exercise.dataWindowDays })}
          tone="primary"
        />
      </section>

      <section className="grid grid-cols-1 gap-gutter lg:grid-cols-3">
        <AdminChartCard
          title={t('overview.userStatusTitle')}
          description={t('overview.userStatusDesc')}
          data={[
            { label: t('enum.userActive'), value: data.enabledUsers },
            { label: t('enum.userDisabled'), value: data.disabledUsers },
            { label: t('enum.roleAdmin'), value: data.adminUsers },
          ]}
          barClassName="bg-tertiary"
        />
        <AdminChartCard
          title={t('overview.questionStatusTitle')}
          description={t('overview.questionStatusDesc')}
          data={[
            { label: t('enum.reviewPending'), value: exercise.pendingReview },
            { label: t('enum.reviewApproved'), value: exercise.approvedTotal },
            { label: t('enum.reviewRejected'), value: exercise.rejectedTotal },
          ]}
          barClassName="bg-primary"
        />
        <AdminChartCard
          title={t('overview.practiceTitle')}
          description={t('overview.practiceDesc')}
          data={
            degraded
              ? []
              : [
                  { label: t('overview.todayAnsweredLabel'), value: exercise.todayAnswered },
                  { label: t('overview.activeUsersTodayLabel'), value: exercise.activeUsersToday },
                  { label: t('overview.activeUsers7dLabel'), value: exercise.activeUsers7d },
                ]
          }
          barClassName="bg-secondary"
        />
      </section>

      <OverviewActivityPanels />
    </div>
  );
}
