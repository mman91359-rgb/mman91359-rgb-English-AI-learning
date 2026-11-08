import { useState } from 'react';
import { deleteActivity, endActivity, fetchActivities, publishActivity } from '@/api/admin';
import { useSearchParamsState } from '@/admin/router';
import { AdminDataTable, type TableColumn } from '@/components/admin/AdminDataTable';
import { AdminFilterBar, FilterField, FilterSearch, FilterSelect } from '@/components/admin/AdminFilterBar';
import { AdminPagination } from '@/components/admin/AdminPagination';
import { StatusBadge } from '@/components/admin/StatusBadge';
import { Button } from '@/components/ui/Button';
import { ConfirmDialog } from '@/components/ui/ConfirmDialog';
import { ErrorState } from '@/components/ui/StateView';
import { useToast } from '@/components/ui/Toast';
import { useI18n } from '@/i18n';
import { ACTIVITY_DISPLAY_META, ACTIVITY_TYPE_META, AUDIENCE_META, getActivityDisplayState } from '@/lib/adminEnums';
import { getAdminErrorKey } from '@/lib/adminErrors';
import { formatDateTime } from '@/lib/format';
import { readEnum, readPage, readSize, readString } from '@/lib/listParams';
import { useAsync } from '@/lib/useAsync';
import { ActivityEditorDrawer } from '@/pages/admin/ActivityEditorDrawer';
import type { ActivityListQuery, ActivityType, ActivityStatus, AdminActivity, TargetAudience } from '@/types/admin';

const ACTIVITY_STATUSES: readonly ActivityStatus[] = ['DRAFT', 'PUBLISHED', 'ENDED'];
const ACTIVITY_STATUS_LABEL_KEYS: Record<ActivityStatus, 'enum.activityDraft' | 'enum.activityPublished' | 'enum.activityEnded'> = {
  DRAFT: 'enum.activityDraft',
  PUBLISHED: 'enum.activityPublished',
  ENDED: 'enum.activityEnded',
};
const ACTIVITY_TYPES: readonly ActivityType[] = ['BANNER', 'CONTENT'];
const AUDIENCES: readonly TargetAudience[] = ['ALL', 'CET4', 'CET6'];

type ActivityOperation = 'publish' | 'end' | 'delete';

function readActivityQuery(params: URLSearchParams): ActivityListQuery {
  return {
    page: readPage(params),
    size: readSize(params),
    status: readEnum(params, 'status', ACTIVITY_STATUSES),
    activityType: readEnum(params, 'activityType', ACTIVITY_TYPES),
    targetAudience: readEnum(params, 'targetAudience', AUDIENCES),
    keyword: readString(params, 'keyword'),
  };
}

export function ActivitiesPage() {
  const { t } = useI18n();
  const { notify } = useToast();
  const [params, setParams] = useSearchParamsState();
  const [editing, setEditing] = useState<AdminActivity | 'create' | null>(null);
  const [pending, setPending] = useState<{ operation: ActivityOperation; activity: AdminActivity } | null>(null);
  const [submitting, setSubmitting] = useState(false);
  const { data, error, loading, reload } = useAsync(() => fetchActivities(readActivityQuery(params)), [params.toString()]);

  const hasFilters = ['keyword', 'status', 'activityType', 'targetAudience'].some((key) => params.has(key));

  const columns: TableColumn<AdminActivity>[] = [
    {
      key: 'title',
      header: t('activity.colTitle'),
      render: (row) => (
        <div className="flex min-w-0 flex-col">
          <span className="truncate font-medium text-on-surface">{row.title}</span>
          <span className="truncate text-label-sm text-on-surface-variant">{row.summary}</span>
        </div>
      ),
    },
    {
      key: 'type',
      header: t('activity.colType'),
      render: (row) => <StatusBadge tone={ACTIVITY_TYPE_META[row.activityType].tone} label={t(ACTIVITY_TYPE_META[row.activityType].labelKey)} />,
    },
    {
      key: 'audience',
      header: t('activity.colAudience'),
      render: (row) => <StatusBadge tone={AUDIENCE_META[row.targetAudience].tone} label={t(AUDIENCE_META[row.targetAudience].labelKey)} />,
    },
    {
      key: 'status',
      header: t('activity.colStatus'),
      render: (row) => {
        const meta = ACTIVITY_DISPLAY_META[getActivityDisplayState(row)];
        return <StatusBadge tone={meta.tone} label={t(meta.labelKey)} />;
      },
    },
    {
      key: 'time',
      header: t('activity.colTime'),
      render: (row) => (
        <span className="whitespace-nowrap text-on-surface-variant">
          {formatDateTime(row.startAt)} → {formatDateTime(row.endAt)}
        </span>
      ),
    },
    {
      key: 'sort',
      header: t('activity.colSort'),
      align: 'right',
      render: (row) => <span className="tabular-nums">{row.sortOrder}</span>,
    },
    {
      key: 'actions',
      header: t('common.actions'),
      align: 'right',
      render: (row) => (
        <div className="flex items-center justify-end gap-2">
          {row.status === 'DRAFT' && (
            <>
              <Button variant="ghost" size="sm" icon="edit" onClick={() => setEditing(row)}>
                {t('common.edit')}
              </Button>
              <Button size="sm" icon="rocket_launch" onClick={() => setPending({ operation: 'publish', activity: row })}>
                {t('activity.publish')}
              </Button>
              <Button variant="danger" size="sm" icon="delete" onClick={() => setPending({ operation: 'delete', activity: row })}>
                {t('common.delete')}
              </Button>
            </>
          )}
          {row.status === 'PUBLISHED' && (
            <Button variant="secondary" size="sm" icon="stop_circle" onClick={() => setPending({ operation: 'end', activity: row })}>
              {t('activity.end')}
            </Button>
          )}
        </div>
      ),
    },
  ];

  const clearFilters = () => setParams({ keyword: null, status: null, activityType: null, targetAudience: null, page: null });

  const runOperation = async () => {
    if (!pending) return;
    setSubmitting(true);
    try {
      if (pending.operation === 'publish') await publishActivity(pending.activity.id);
      if (pending.operation === 'end') await endActivity(pending.activity.id);
      if (pending.operation === 'delete') await deleteActivity(pending.activity.id);
      notify('success', t(`activity.${pending.operation}Toast`));
      setPending(null);
      reload();
    } catch (err) {
      notify('error', t(getAdminErrorKey(err)));
    } finally {
      setSubmitting(false);
    }
  };

  return (
    <div className="flex flex-col gap-6">
      <div className="flex flex-wrap items-center justify-between gap-4">
        <p className="text-body-md text-on-surface-variant">{t('activity.subtitle')}</p>
        <Button icon="add" onClick={() => setEditing('create')}>
          {t('activity.create')}
        </Button>
      </div>

      <AdminFilterBar hasActiveFilters={hasFilters} onReset={clearFilters}>
        <FilterField label={t('common.keyword')} className="w-full sm:w-64">
          <FilterSearch value={readString(params, 'keyword') ?? ''} placeholder={t('activity.searchPlaceholder')} onChange={(keyword) => setParams({ keyword, page: null })} />
        </FilterField>
        <FilterField label={t('activity.colStatus')}>
          <FilterSelect<ActivityStatus>
            value={readEnum(params, 'status', ACTIVITY_STATUSES)}
            allLabel={t('common.all')}
            options={ACTIVITY_STATUSES.map((value) => ({ value, label: t(ACTIVITY_STATUS_LABEL_KEYS[value]) }))}
            onChange={(value) => setParams({ status: value ?? null, page: null })}
          />
        </FilterField>
        <FilterField label={t('activity.colType')}>
          <FilterSelect<ActivityType>
            value={readEnum(params, 'activityType', ACTIVITY_TYPES)}
            allLabel={t('common.all')}
            options={ACTIVITY_TYPES.map((value) => ({ value, label: t(ACTIVITY_TYPE_META[value].labelKey) }))}
            onChange={(value) => setParams({ activityType: value ?? null, page: null })}
          />
        </FilterField>
        <FilterField label={t('activity.colAudience')}>
          <FilterSelect<TargetAudience>
            value={readEnum(params, 'targetAudience', AUDIENCES)}
            allLabel={t('common.all')}
            options={AUDIENCES.map((value) => ({ value, label: t(AUDIENCE_META[value].labelKey) }))}
            onChange={(value) => setParams({ targetAudience: value ?? null, page: null })}
          />
        </FilterField>
      </AdminFilterBar>

      <section className="overflow-hidden rounded-[16px] border border-outline-variant/40 bg-surface-container-lowest shadow-soft-glow">
        {error ? (
          <ErrorState error={error} onRetry={reload} />
        ) : (
          <>
            <AdminDataTable
              columns={columns}
              rows={data?.records ?? []}
              rowKey={(row) => row.id}
              loading={loading}
              refreshing={loading && data !== null}
              emptyTitle={hasFilters ? t('activity.emptyFiltered') : t('activity.empty')}
              emptyDescription={hasFilters ? undefined : t('activity.emptyDesc')}
            />
            {data && (
              <AdminPagination
                page={data.page}
                size={data.size}
                total={data.total}
                onPageChange={(page) => setParams({ page })}
                onSizeChange={(size) => setParams({ size, page: null })}
              />
            )}
          </>
        )}
      </section>

      {editing && (
        <ActivityEditorDrawer
          activity={editing === 'create' ? null : editing}
          onClose={(saved) => {
            setEditing(null);
            if (saved) reload();
          }}
        />
      )}

      {pending && (
        <ConfirmDialog
          open
          danger={pending.operation !== 'publish'}
          title={t(`activity.${pending.operation}Title`)}
          targetName={pending.activity.title}
          impact={t(`activity.${pending.operation}Impact`, {
            audience: t(AUDIENCE_META[pending.activity.targetAudience].labelKey),
            start: formatDateTime(pending.activity.startAt),
            end: formatDateTime(pending.activity.endAt),
          })}
          confirmLabel={t(`activity.${pending.operation}Confirm`)}
          loading={submitting}
          onCancel={() => setPending(null)}
          onConfirm={runOperation}
        />
      )}
    </div>
  );
}
