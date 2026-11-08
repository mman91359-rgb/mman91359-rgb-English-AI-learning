import { useState } from 'react';
import { approveQuestion, fetchQuestions } from '@/api/admin';
import { useSearchParamsState } from '@/admin/router';
import { AdminDataTable, type TableColumn } from '@/components/admin/AdminDataTable';
import { AdminFilterBar, FilterField, FilterSearch, FilterSelect } from '@/components/admin/AdminFilterBar';
import { AdminPagination } from '@/components/admin/AdminPagination';
import { inputClass } from '@/components/admin/FormField';
import { StatusBadge } from '@/components/admin/StatusBadge';
import { ConfirmDialog } from '@/components/ui/ConfirmDialog';
import { ErrorState } from '@/components/ui/StateView';
import { Button } from '@/components/ui/Button';
import { useToast } from '@/components/ui/Toast';
import { useI18n } from '@/i18n';
import { getAdminErrorKey } from '@/lib/adminErrors';
import { REVIEW_STATUS_META } from '@/lib/adminEnums';
import { readEnum, readPage, readPositiveInt, readSize, readString } from '@/lib/listParams';
import { useAsync } from '@/lib/useAsync';
import { GenerateQuestionsDialog, RejectQuestionDialog } from '@/pages/admin/QuestionDialogs';
import type { AdminQuestion, CetLevel, QuestionListQuery, ReviewStatus } from '@/types/admin';

const REVIEW_STATUSES: readonly ReviewStatus[] = ['PENDING', 'APPROVED', 'REJECTED'];
const CET_LEVELS: readonly CetLevel[] = ['CET4', 'CET6'];

type QuestionAction = { kind: 'approve' | 'reject'; question: AdminQuestion };

function readQuestionQuery(params: URLSearchParams): QuestionListQuery {
  return {
    page: readPage(params),
    size: readSize(params),
    status: readEnum(params, 'status', REVIEW_STATUSES) ?? 'PENDING',
    moduleType: readPositiveInt(params, 'moduleType'),
    targetLevel: readEnum(params, 'targetLevel', CET_LEVELS),
    keyword: readString(params, 'keyword'),
  };
}

/** 选项字段为 JSON 字符串，解析失败时原样展示 */
function parseOptions(options: string | null): string[] {
  if (!options) return [];
  try {
    const parsed: unknown = JSON.parse(options);
    if (!Array.isArray(parsed)) return [options];
    return parsed.map((item) => (typeof item === 'string' ? item : JSON.stringify(item)));
  } catch {
    return [options];
  }
}

export function QuestionsPage() {
  const { t } = useI18n();
  const { notify } = useToast();
  const [params, setParams] = useSearchParamsState();
  const query = readQuestionQuery(params);
  const { data, error, loading, reload } = useAsync(() => fetchQuestions(query), [params.toString()]);
  const [action, setAction] = useState<QuestionAction | null>(null);
  const [approving, setApproving] = useState(false);
  const [generateOpen, setGenerateOpen] = useState(false);

  const status = query.status ?? 'PENDING';
  const hasFilters = ['moduleType', 'targetLevel', 'keyword'].some((key) => params.has(key));
  const isPendingTab = status === 'PENDING';

  const confirmApprove = async () => {
    if (!action) return;
    setApproving(true);
    try {
      await approveQuestion(action.question.id);
      notify('success', t('question.approveToast'));
      setAction(null);
      reload();
    } catch (err) {
      notify('error', t(getAdminErrorKey(err)));
    } finally {
      setApproving(false);
    }
  };

  const columns: TableColumn<AdminQuestion>[] = [
    {
      key: 'stem',
      header: t('question.colStem'),
      render: (row) => <span className="line-clamp-2 max-w-md text-on-surface">{row.stem}</span>,
    },
    { key: 'questionType', header: t('question.colType'), render: (row) => <span className="font-mono text-label-md">{row.questionType}</span> },
    { key: 'moduleType', header: t('question.colModule'), render: (row) => `#${row.moduleType}` },
    { key: 'targetLevel', header: t('question.colLevel'), render: (row) => row.targetLevel ?? '—' },
    {
      key: 'status',
      header: t('question.colStatus'),
      render: (row) => <StatusBadge tone={REVIEW_STATUS_META[row.status].tone} label={t(REVIEW_STATUS_META[row.status].labelKey)} />,
    },
    {
      key: 'createdAt',
      header: t('question.colCreatedAt'),
      render: (row) => <span className="whitespace-nowrap text-on-surface-variant">{row.createdAt}</span>,
    },
    {
      key: 'actions',
      header: t('common.actions'),
      align: 'right',
      render: (row) =>
        row.status === 'PENDING' ? (
          <div className="flex justify-end gap-2">
            <Button size="sm" variant="ghost" icon="check" onClick={() => setAction({ kind: 'approve', question: row })}>
              {t('question.approve')}
            </Button>
            <Button size="sm" variant="ghost" icon="close" className="text-error hover:bg-error-container/40" onClick={() => setAction({ kind: 'reject', question: row })}>
              {t('question.reject')}
            </Button>
          </div>
        ) : (
          <span className="text-label-md text-outline">—</span>
        ),
    },
  ];

  return (
    <div className="flex flex-col gap-6">
      <div className="flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
        <p className="text-body-md text-on-surface-variant">{t('question.subtitle')}</p>
        <Button icon="auto_awesome" onClick={() => setGenerateOpen(true)} className="self-start sm:self-auto">
          {t('question.generate')}
        </Button>
      </div>

      <div role="tablist" aria-label={t('question.tabsLabel')} className="flex flex-wrap gap-2">
        {REVIEW_STATUSES.map((value) => {
          const active = status === value;
          return (
            <button
              key={value}
              type="button"
              role="tab"
              aria-selected={active}
              onClick={() => setParams({ status: value === 'PENDING' ? null : value, page: null })}
              className={`h-9 rounded-full px-4 text-label-lg transition-colors ${
                active
                  ? 'bg-primary text-on-primary shadow-soft-glow'
                  : 'bg-surface-container-lowest text-on-surface-variant border border-outline-variant/40 hover:bg-surface-container-low'
              }`}
            >
              {t(REVIEW_STATUS_META[value].labelKey)}
            </button>
          );
        })}
      </div>

      <AdminFilterBar
        hasActiveFilters={hasFilters}
        onReset={() => setParams({ moduleType: null, targetLevel: null, keyword: null, page: null })}
      >
        <FilterField label={t('question.filterModule')} className="w-full sm:w-36">
          <input
            type="number"
            min={1}
            value={readString(params, 'moduleType') ?? ''}
            onChange={(event) => setParams({ moduleType: event.target.value, page: null })}
            className={`${inputClass} h-10 py-0`}
          />
        </FilterField>
        <FilterField label={t('question.filterLevel')}>
          <FilterSelect<CetLevel>
            value={query.targetLevel}
            allLabel={t('common.all')}
            options={CET_LEVELS.map((value) => ({ value, label: value }))}
            onChange={(value) => setParams({ targetLevel: value ?? null, page: null })}
          />
        </FilterField>
        <FilterField label={t('common.keyword')} className="w-full sm:w-64">
          <FilterSearch value={readString(params, 'keyword') ?? ''} placeholder={t('question.searchPlaceholder')} onChange={(keyword) => setParams({ keyword, page: null })} />
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
              emptyTitle={hasFilters ? t('question.emptyFiltered') : isPendingTab ? t('question.emptyPending') : t('question.empty')}
              emptyDescription={hasFilters ? undefined : t('question.emptyDesc')}
              renderExpanded={(row) => {
                const options = parseOptions(row.options);
                return (
                  <div className="grid grid-cols-1 gap-6 md:grid-cols-2">
                    <div className="flex flex-col gap-2">
                      <span className="text-label-md text-on-surface-variant">{t('question.fieldOptions')}</span>
                      {options.length > 0 ? (
                        <ol className="flex list-inside list-decimal flex-col gap-1 text-body-sm text-on-surface">
                          {options.map((option, index) => (
                            <li key={index}>{option}</li>
                          ))}
                        </ol>
                      ) : (
                        <span className="text-body-sm text-on-surface-variant">—</span>
                      )}
                    </div>
                    <dl className="flex flex-col gap-3 text-body-sm">
                      <div>
                        <dt className="text-label-md text-on-surface-variant">{t('question.fieldAnswer')}</dt>
                        <dd className="text-on-surface">{row.answer ?? '—'}</dd>
                      </div>
                      <div>
                        <dt className="text-label-md text-on-surface-variant">{t('question.fieldExplanation')}</dt>
                        <dd className="whitespace-pre-wrap text-on-surface">{row.explanation ?? '—'}</dd>
                      </div>
                      <div>
                        <dt className="text-label-md text-on-surface-variant">{t('question.fieldKnowledge')}</dt>
                        <dd className="text-on-surface">{row.knowledgePoint ?? '—'}</dd>
                      </div>
                    </dl>
                  </div>
                );
              }}
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

      <ConfirmDialog
        open={action?.kind === 'approve'}
        title={t('question.approveTitle')}
        targetName={action?.question.stem.slice(0, 40) ?? ''}
        impact={t('question.approveImpact')}
        confirmLabel={t('question.approveConfirm')}
        loading={approving}
        onConfirm={confirmApprove}
        onCancel={() => setAction(null)}
      />

      {action?.kind === 'reject' && (
        <RejectQuestionDialog
          question={action.question}
          onClose={(changed) => {
            setAction(null);
            if (changed) reload();
          }}
        />
      )}

      {generateOpen && (
        <GenerateQuestionsDialog
          onClose={(generated) => {
            setGenerateOpen(false);
            if (generated) reload();
          }}
        />
      )}
    </div>
  );
}
