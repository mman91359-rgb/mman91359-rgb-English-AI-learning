import { useState } from 'react';
import { deleteNotice, expireNotice, fetchNotices, publishNotice } from '@/api/admin';
import { useSearchParamsState } from '@/admin/router';
import { AdminDataTable, type TableColumn } from '@/components/admin/AdminDataTable';
import { AdminFilterBar, FilterField, FilterSearch, FilterSelect } from '@/components/admin/AdminFilterBar';
import { AdminPagination } from '@/components/admin/AdminPagination';
import { StatusBadge } from '@/components/admin/StatusBadge';
import { ConfirmDialog } from '@/components/ui/ConfirmDialog';
import { Button } from '@/components/ui/Button';
import { ErrorState } from '@/components/ui/StateView';
import { useToast } from '@/components/ui/Toast';
import { useI18n } from '@/i18n';
import { AUDIENCE_META, NOTICE_STATUS_META, NOTICE_TYPE_META } from '@/lib/adminEnums';
import { getAdminErrorKey } from '@/lib/adminErrors';
import { formatDateTime } from '@/lib/format';
import { readEnum, readPage, readSize, readString } from '@/lib/listParams';
import { useAsync } from '@/lib/useAsync';
import { NoticeEditorDrawer } from '@/pages/admin/NoticeEditorDrawer';
import type { AdminNotice, NoticeListQuery, NoticeStatus, NoticeType, TargetAudience } from '@/types/admin';

const NOTICE_STATUSES: readonly NoticeStatus[] = ['DRAFT', 'PUBLISHED', 'EXPIRED'];
const NOTICE_TYPES: readonly NoticeType[] = ['SYSTEM', 'REMINDER', 'ACTIVITY'];
const AUDIENCES: readonly TargetAudience[] = ['ALL', 'CET4', 'CET6'];

type NoticeOperation = 'publish' | 'expire' | 'delete';

function readNoticeQuery(params: URLSearchParams): NoticeListQuery {
  return {
    page: readPage(params),
    size: readSize(params),
    status: readEnum(params, 'status', NOTICE_STATUSES),
    noticeType: readEnum(params, 'noticeType', NOTICE_TYPES),
    targetAudience: readEnum(params, 'targetAudience', AUDIENCES),
    keyword: readString(params, 'keyword'),
  };
}

export function NoticesPage() {
  const { t } = useI18n();
  const { notify } = useToast();
  const [params, setParams] = useSearchParamsState();
  const [editing, setEditing] = useState<AdminNotice | 'create' | null>(null);
  const [pending, setPending] = useState<{ operation: NoticeOperation; notice: AdminNotice } | null>(null);
  const [submitting, setSubmitting] = useState(false);
  const { data, error, loading, reload } = useAsync(() => fetchNotices(readNoticeQuery(params)), [params.toString()]);

  const hasFilters = ['keyword', 'status', 'noticeType', 'targetAudience'].some((key) => params.has(key));

  const columns: TableColumn<AdminNotice>[] = [
    {
      key: 'title',
      header: t('notice.colTitle'),
      render: (row) => (
        <div className="flex min-w-0 flex-col">
          <span className="truncate font-medium text-on-surface">{row.title}</span>
          <span className="truncate text-label-sm text-on-surface-variant">{row.content}</span>
        </div>
      ),
    },
    {
      key: 'type',
      header: t('notice.colType'),
      render: (row) => <StatusBadge tone={NOTICE_TYPE_META[row.noticeType].tone} label={t(NOTICE_TYPE_META[row.noticeType].labelKey)} />,
    },
    {
      key: 'audience',
      header: t('notice.colAudience'),
      render: (row) => <StatusBadge tone={AUDIENCE_META[row.targetAudience].tone} label={t(AUDIENCE_META[row.targetAudience].labelKey)} />,
    },
    {
      key: 'status',
      header: t('notice.colStatus'),
      render: (row) => <StatusBadge tone={NOTICE_STATUS_META[row.status].tone} label={t(NOTICE_STATUS_META[row.status].labelKey)} />,
    },
    {
      key: 'publishAt',
      header: t('notice.colPublishAt'),
      render: (row) => <span className="text-on-surface-variant">{formatDateTime(row.publishAt)}</span>,
    },
    {
      key: 'expireAt',
      header: t('notice.colExpireAt'),
      render: (row) => <span className="text-on-surface-variant">{formatDateTime(row.expireAt)}</span>,
    },
    {
      key: 'creator',
      header: t('notice.colCreator'),
      render: (row) => row.createdByName ?? '—',
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
              <Button size="sm" icon="send" onClick={() => setPending({ operation: 'publish', notice: row })}>
                {t('notice.publish')}
              </Button>
              <Button variant="danger" size="sm" icon="delete" onClick={() => setPending({ operation: 'delete', notice: row })}>
                {t('common.delete')}
              </Button>
            </>
          )}
          {row.status === 'PUBLISHED' && (
            <Button variant="secondary" size="sm" icon="unpublished" onClick={() => setPending({ operation: 'expire', notice: row })}>
              {t('notice.expire')}
            </Button>
          )}
        </div>
      ),
    },
  ];

  const clearFilters = () => setParams({ keyword: null, status: null, noticeType: null, targetAudience: null, page: null });

  const runOperation = async () => {
    if (!pending) return;
    setSubmitting(true);
    try {
      if (pending.operation === 'publish') await publishNotice(pending.notice.id);
      if (pending.operation === 'expire') await expireNotice(pending.notice.id);
      if (pending.operation === 'delete') await deleteNotice(pending.notice.id);
      notify('success', t(`notice.${pending.operation}Toast`));
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
        <p className="text-body-md text-on-surface-variant">{t('notice.subtitle')}</p>
        <Button icon="add" onClick={() => setEditing('create')}>
          {t('notice.create')}
        </Button>
      </div>

      <AdminFilterBar hasActiveFilters={hasFilters} onReset={clearFilters}>
        <FilterField label={t('common.keyword')} className="w-full sm:w-64">
          <FilterSearch value={readString(params, 'keyword') ?? ''} placeholder={t('notice.searchPlaceholder')} onChange={(keyword) => setParams({ keyword, page: null })} />
        </FilterField>
        <FilterField label={t('notice.colStatus')}>
          <FilterSelect<NoticeStatus>
            value={readEnum(params, 'status', NOTICE_STATUSES)}
            allLabel={t('common.all')}
            options={NOTICE_STATUSES.map((value) => ({ value, label: t(NOTICE_STATUS_META[value].labelKey) }))}
            onChange={(value) => setParams({ status: value ?? null, page: null })}
          />
        </FilterField>
        <FilterField label={t('notice.colType')}>
          <FilterSelect<NoticeType>
            value={readEnum(params, 'noticeType', NOTICE_TYPES)}
            allLabel={t('common.all')}
            options={NOTICE_TYPES.map((value) => ({ value, label: t(NOTICE_TYPE_META[value].labelKey) }))}
            onChange={(value) => setParams({ noticeType: value ?? null, page: null })}
          />
        </FilterField>
        <FilterField label={t('notice.colAudience')}>
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
              emptyTitle={hasFilters ? t('notice.emptyFiltered') : t('notice.empty')}
              emptyDescription={hasFilters ? undefined : t('notice.emptyDesc')}
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
        <NoticeEditorDrawer
          notice={editing === 'create' ? null : editing}
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
          title={t(`notice.${pending.operation}Title`)}
          targetName={pending.notice.title}
          impact={
            pending.operation === 'publish'
              ? t('notice.publishImpact', {
                  audience: t(AUDIENCE_META[pending.notice.targetAudience].labelKey),
                  publishAt: formatDateTime(pending.notice.publishAt) === '—' ? t('notice.publishNow') : formatDateTime(pending.notice.publishAt),
                  expireAt: formatDateTime(pending.notice.expireAt),
                })
              : t(`notice.${pending.operation}Impact`)
          }
          confirmLabel={t(`notice.${pending.operation}Confirm`)}
          loading={submitting}
          onCancel={() => setPending(null)}
          onConfirm={runOperation}
        />
      )}
    </div>
  );
}
