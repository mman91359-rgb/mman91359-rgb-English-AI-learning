import { fetchOperationLogs } from '@/api/admin';
import { useSearchParamsState } from '@/admin/router';
import { AdminDataTable, type TableColumn } from '@/components/admin/AdminDataTable';
import { AdminFilterBar, FilterField, FilterSearch, FilterSelect } from '@/components/admin/AdminFilterBar';
import { AdminPagination } from '@/components/admin/AdminPagination';
import { inputClass } from '@/components/admin/FormField';
import { StatusBadge } from '@/components/admin/StatusBadge';
import { ErrorState } from '@/components/ui/StateView';
import { useI18n } from '@/i18n';
import { AUDIT_RESULT_META } from '@/lib/adminEnums';
import { displayOrDash, formatDateTime, fromInputDateTime, toInputDateTime } from '@/lib/format';
import { readEnum, readPage, readPositiveInt, readSize, readString } from '@/lib/listParams';
import { useAsync } from '@/lib/useAsync';
import type { AuditResult, OperationLog, OperationLogQuery } from '@/types/admin';

const AUDIT_RESULTS: readonly AuditResult[] = ['SUCCESS', 'FAIL'];

function readLogQuery(params: URLSearchParams): OperationLogQuery {
  return {
    page: readPage(params),
    size: readSize(params),
    operatorId: readPositiveInt(params, 'operatorId'),
    action: readString(params, 'action'),
    targetType: readString(params, 'targetType'),
    result: readEnum(params, 'result', AUDIT_RESULTS),
    startTime: fromInputDateTime(readString(params, 'startTime') ?? ''),
    endTime: fromInputDateTime(readString(params, 'endTime') ?? ''),
  };
}

/** 详情若为 JSON 则格式化展示，否则原样输出 */
function formatDetail(detail: string | null): string {
  if (!detail) return '—';
  try {
    return JSON.stringify(JSON.parse(detail), null, 2);
  } catch {
    return detail;
  }
}

export function OperationLogsPage() {
  const { t } = useI18n();
  const [params, setParams] = useSearchParamsState();
  const { data, error, loading, reload } = useAsync(() => fetchOperationLogs(readLogQuery(params)), [params.toString()]);

  const hasFilters = ['operatorId', 'action', 'targetType', 'result', 'startTime', 'endTime'].some((key) => params.has(key));

  const columns: TableColumn<OperationLog>[] = [
    {
      key: 'createdAt',
      header: t('logs.colTime'),
      render: (row) => <span className="whitespace-nowrap text-on-surface-variant">{formatDateTime(row.createdAt)}</span>,
    },
    { key: 'operator', header: t('logs.colOperator'), render: (row) => displayOrDash(row.operatorName) },
    { key: 'action', header: t('logs.colAction'), render: (row) => <span className="font-medium">{row.action}</span> },
    {
      key: 'target',
      header: t('logs.colTarget'),
      render: (row) => (
        <span className="text-on-surface-variant">
          {row.targetType}
          {row.targetId ? ` #${row.targetId}` : ''}
        </span>
      ),
    },
    {
      key: 'result',
      header: t('logs.colResult'),
      render: (row) => <StatusBadge tone={AUDIT_RESULT_META[row.result].tone} label={t(AUDIT_RESULT_META[row.result].labelKey)} />,
    },
    { key: 'ip', header: t('logs.colIp'), render: (row) => <span className="font-mono text-label-md">{displayOrDash(row.ip)}</span> },
  ];

  return (
    <div className="flex flex-col gap-6">
      <p className="text-body-md text-on-surface-variant">{t('logs.subtitle')}</p>

      <AdminFilterBar
        hasActiveFilters={hasFilters}
        onReset={() => setParams({ operatorId: null, action: null, targetType: null, result: null, startTime: null, endTime: null, page: null })}
      >
        <FilterField label={t('logs.filterOperatorId')} className="w-full sm:w-36">
          <input
            type="number"
            min={1}
            value={readString(params, 'operatorId') ?? ''}
            onChange={(event) => setParams({ operatorId: event.target.value, page: null })}
            className={`${inputClass} h-10 py-0`}
          />
        </FilterField>
        <FilterField label={t('logs.filterAction')} className="w-full sm:w-56">
          <FilterSearch value={readString(params, 'action') ?? ''} placeholder={t('logs.actionPlaceholder')} onChange={(action) => setParams({ action, page: null })} />
        </FilterField>
        <FilterField label={t('logs.filterTargetType')} className="w-full sm:w-44">
          <FilterSearch value={readString(params, 'targetType') ?? ''} placeholder={t('logs.targetPlaceholder')} onChange={(targetType) => setParams({ targetType, page: null })} />
        </FilterField>
        <FilterField label={t('logs.colResult')}>
          <FilterSelect<AuditResult>
            value={readEnum(params, 'result', AUDIT_RESULTS)}
            allLabel={t('common.all')}
            options={AUDIT_RESULTS.map((value) => ({ value, label: t(AUDIT_RESULT_META[value].labelKey) }))}
            onChange={(value) => setParams({ result: value ?? null, page: null })}
          />
        </FilterField>
        <FilterField label={t('logs.filterStart')} className="w-full sm:w-52">
          <input
            type="datetime-local"
            value={toInputDateTime(readString(params, 'startTime') ? fromInputDateTime(readString(params, 'startTime') ?? '') : undefined)}
            onChange={(event) => setParams({ startTime: fromInputDateTime(event.target.value) ?? null, page: null })}
            className={`${inputClass} h-10 py-0`}
          />
        </FilterField>
        <FilterField label={t('logs.filterEnd')} className="w-full sm:w-52">
          <input
            type="datetime-local"
            value={toInputDateTime(readString(params, 'endTime') ? fromInputDateTime(readString(params, 'endTime') ?? '') : undefined)}
            onChange={(event) => setParams({ endTime: fromInputDateTime(event.target.value) ?? null, page: null })}
            className={`${inputClass} h-10 py-0`}
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
              emptyTitle={hasFilters ? t('logs.emptyFiltered') : t('logs.empty')}
              emptyDescription={hasFilters ? undefined : t('logs.emptyDesc')}
              renderExpanded={(row) => (
                <dl className="grid grid-cols-1 gap-4 md:grid-cols-2">
                  <div className="flex flex-col gap-1">
                    <dt className="text-label-md text-on-surface-variant">{t('logs.detail')}</dt>
                    <dd>
                      <pre className="max-h-64 overflow-auto whitespace-pre-wrap rounded-xl bg-surface-container-lowest p-4 font-mono text-label-md text-on-surface">
                        {formatDetail(row.detail)}
                      </pre>
                    </dd>
                  </div>
                  <div className="flex flex-col gap-3 text-body-sm">
                    <div>
                      <dt className="text-label-md text-on-surface-variant">{t('logs.traceId')}</dt>
                      <dd className="break-all font-mono text-label-md text-on-surface">{displayOrDash(row.traceId)}</dd>
                    </div>
                    <div>
                      <dt className="text-label-md text-on-surface-variant">{t('logs.userAgent')}</dt>
                      <dd className="break-all text-on-surface">{displayOrDash(row.userAgent)}</dd>
                    </div>
                  </div>
                </dl>
              )}
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
    </div>
  );
}
