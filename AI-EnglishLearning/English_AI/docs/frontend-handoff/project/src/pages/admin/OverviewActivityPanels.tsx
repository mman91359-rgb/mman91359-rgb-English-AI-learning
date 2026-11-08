import type { ReactNode } from 'react';
import { fetchOperationLogs, fetchQuestions } from '@/api/admin';
import { AdminLink } from '@/admin/router';
import { StatusBadge } from '@/components/admin/StatusBadge';
import { EmptyState, ErrorState, LoadingState } from '@/components/ui/StateView';
import { useI18n } from '@/i18n';
import { AUDIT_RESULT_META, REVIEW_STATUS_META } from '@/lib/adminEnums';
import { formatDateTime } from '@/lib/format';
import { useAsync } from '@/lib/useAsync';

interface PanelProps {
  title: string;
  action: ReactNode;
  children: ReactNode;
}

function Panel({ title, action, children }: PanelProps) {
  return (
    <section className="flex flex-col rounded-[16px] border border-outline-variant/40 bg-surface-container-lowest shadow-soft-glow">
      <header className="flex items-center justify-between border-b border-outline-variant/40 px-6 py-4">
        <h2 className="text-headline-sm text-on-surface">{title}</h2>
        {action}
      </header>
      {children}
    </section>
  );
}

function RecentLogsPanel() {
  const { t } = useI18n();
  const { data, error, loading, reload } = useAsync(
    () => fetchOperationLogs({ page: 1, size: 5 }),
    [],
  );

  return (
    <Panel title={t('overview.recentLogs')} action={<AdminLink to="/admin/operation-logs" className="text-label-md text-primary hover:underline">{t('common.viewAll')}</AdminLink>}>
      {loading && !data ? (
        <LoadingState rows={3} />
      ) : error ? (
        <ErrorState error={error} onRetry={reload} />
      ) : !data || data.records.length === 0 ? (
        <EmptyState title={t('overview.recentLogsEmpty')} />
      ) : (
        <ul className="divide-y divide-outline-variant/40">
          {data.records.map((log) => (
            <li key={log.id} className="flex items-center gap-4 px-6 py-3">
              <div className="flex min-w-0 flex-1 flex-col">
                <span className="truncate text-body-sm text-on-surface">
                  {log.operatorName} · {log.action}
                </span>
                <span className="text-label-sm text-on-surface-variant">{formatDateTime(log.createdAt)}</span>
              </div>
              <StatusBadge tone={AUDIT_RESULT_META[log.result].tone} label={t(AUDIT_RESULT_META[log.result].labelKey)} />
            </li>
          ))}
        </ul>
      )}
    </Panel>
  );
}

function PendingQuestionsPanel() {
  const { t } = useI18n();
  const { data, error, loading, reload } = useAsync(
    () => fetchQuestions({ status: 'PENDING', page: 1, size: 5 }),
    [],
  );

  return (
    <Panel
      title={t('overview.pendingQuestions')}
      action={<AdminLink to="/admin/questions" className="text-label-md text-primary hover:underline">{t('common.viewAll')}</AdminLink>}
    >
      {loading && !data ? (
        <LoadingState rows={3} />
      ) : error ? (
        <ErrorState error={error} onRetry={reload} />
      ) : !data || data.records.length === 0 ? (
        <EmptyState title={t('overview.pendingQuestionsEmpty')} />
      ) : (
        <ul className="divide-y divide-outline-variant/40">
          {data.records.map((question) => (
            <li key={question.id} className="flex items-center gap-4 px-6 py-3">
              <div className="flex min-w-0 flex-1 flex-col">
                <span className="truncate text-body-sm text-on-surface">{question.stem}</span>
                <span className="text-label-sm text-on-surface-variant">{formatDateTime(question.createdAt)}</span>
              </div>
              <StatusBadge tone={REVIEW_STATUS_META[question.status].tone} label={t(REVIEW_STATUS_META[question.status].labelKey)} />
            </li>
          ))}
        </ul>
      )}
    </Panel>
  );
}

export function OverviewActivityPanels() {
  return (
    <section className="grid grid-cols-1 gap-gutter xl:grid-cols-2">
      <RecentLogsPanel />
      <PendingQuestionsPanel />
    </section>
  );
}
