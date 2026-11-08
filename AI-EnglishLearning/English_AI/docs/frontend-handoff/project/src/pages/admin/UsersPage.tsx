import { useState } from 'react';
import { fetchUsers } from '@/api/admin';
import { navigate, useSearchParamsState } from '@/admin/router';
import { AdminDataTable, type TableColumn } from '@/components/admin/AdminDataTable';
import { AdminFilterBar, FilterField, FilterSearch, FilterSelect } from '@/components/admin/AdminFilterBar';
import { AdminPagination } from '@/components/admin/AdminPagination';
import { inputClass } from '@/components/admin/FormField';
import { StatusBadge } from '@/components/admin/StatusBadge';
import { UserAvatar } from '@/components/admin/UserAvatar';
import { UserActionDialog, type UserAction } from '@/components/admin/UserActionDialog';
import { ErrorState } from '@/components/ui/StateView';
import { useI18n } from '@/i18n';
import { USER_ROLE_META, USER_STATUS_META } from '@/lib/adminEnums';
import { formatDateTime, formatNumber, displayOrDash } from '@/lib/format';
import { readEnum, readNumberEnum, readPage, readSize, readString } from '@/lib/listParams';
import { useAsync } from '@/lib/useAsync';
import type { AdminUserRow, CetLevel, UserListQuery, UserRole, UserStatus } from '@/types/admin';

const ROLES: readonly UserRole[] = ['ROLE_USER', 'ROLE_ADMIN'];
const STATUSES: readonly UserStatus[] = [1, 0];
const CET_LEVELS: readonly CetLevel[] = ['CET4', 'CET6'];

function readUserQuery(params: URLSearchParams): UserListQuery {
  return {
    page: readPage(params),
    size: readSize(params),
    keyword: readString(params, 'keyword'),
    role: readEnum(params, 'role', ROLES),
    status: readNumberEnum(params, 'status', STATUSES),
    cetLevel: readEnum(params, 'cetLevel', CET_LEVELS),
    startDate: readString(params, 'startDate'),
    endDate: readString(params, 'endDate'),
  };
}

export function UsersPage() {
  const { t, locale } = useI18n();
  const [params, setParams] = useSearchParamsState();
  const query = readUserQuery(params);
  const [action, setAction] = useState<UserAction | null>(null);
  const { data, error, loading, reload } = useAsync(() => fetchUsers(readUserQuery(params)), [params.toString()]);

  const hasFilters = ['keyword', 'role', 'status', 'cetLevel', 'startDate', 'endDate'].some((key) => params.has(key));
  const dateInvalid = Boolean(query.startDate && query.endDate && query.startDate > query.endDate);

  const columns: TableColumn<AdminUserRow>[] = [
    {
      key: 'user',
      header: t('users.colUser'),
      render: (row) => (
        <div className="flex items-center gap-3">
          <UserAvatar name={row.nickname || row.username} avatarUrl={row.avatarUrl} />
          <div className="flex min-w-0 flex-col">
            <span className="truncate font-medium text-on-surface">{row.nickname || row.username}</span>
            <span className="truncate text-label-sm text-on-surface-variant">
              {row.username}
              {row.phoneMasked && ` · ${row.phoneMasked}`}
            </span>
          </div>
        </div>
      ),
    },
    { key: 'cet', header: t('users.colCet'), render: (row) => displayOrDash(row.cetLevel) },
    {
      key: 'roles',
      header: t('users.colRole'),
      render: (row) => (
        <div className="flex flex-wrap gap-1">
          {row.roles.map((role) => (
            <StatusBadge key={role} tone={USER_ROLE_META[role].tone} label={t(USER_ROLE_META[role].labelKey)} />
          ))}
        </div>
      ),
    },
    {
      key: 'status',
      header: t('users.colStatus'),
      render: (row) => (
        <StatusBadge tone={USER_STATUS_META[row.status].tone} label={t(USER_STATUS_META[row.status].labelKey)} />
      ),
    },
    {
      key: 'elo',
      header: t('users.colElo'),
      align: 'right',
      render: (row) => <span className="tabular-nums">{formatNumber(row.eloScore, locale)}</span>,
    },
    {
      key: 'coin',
      header: t('users.colCoin'),
      align: 'right',
      render: (row) => <span className="tabular-nums">{formatNumber(row.coinBalance, locale)}</span>,
    },
    {
      key: 'lastLogin',
      header: t('users.colLastLogin'),
      render: (row) => <span className="text-on-surface-variant">{formatDateTime(row.lastLoginAt)}</span>,
    },
    {
      key: 'createdAt',
      header: t('users.colCreatedAt'),
      render: (row) => <span className="text-on-surface-variant">{formatDateTime(row.createdAt)}</span>,
    },
    {
      key: 'actions',
      header: t('users.colActions'),
      align: 'right',
      render: (row) => (
        <div className="flex items-center justify-end gap-1">
          <IconAction icon="visibility" label={t('users.actionView')} onClick={() => navigate(`/admin/users/${row.id}`)} />
          <IconAction
            icon={row.status === 1 ? 'block' : 'check_circle'}
            label={row.status === 1 ? t('users.actionDisable') : t('users.actionEnable')}
            tone={row.status === 1 ? 'danger' : 'default'}
            onClick={() => setAction({ kind: 'status', user: row })}
          />
          <IconAction icon="lock_reset" label={t('users.actionReset')} onClick={() => setAction({ kind: 'reset', user: row })} />
          <IconAction icon="manage_accounts" label={t('users.actionRole')} onClick={() => setAction({ kind: 'role', user: row })} />
        </div>
      ),
    },
  ];

  const clearFilters = () =>
    setParams({ keyword: null, role: null, status: null, cetLevel: null, startDate: null, endDate: null, page: null });

  return (
    <div className="flex flex-col gap-6">
      <div className="flex flex-col gap-1">
        <p className="text-body-md text-on-surface-variant">{t('users.subtitle')}</p>
      </div>

      <AdminFilterBar hasActiveFilters={hasFilters} onReset={clearFilters}>
        <FilterField label={t('users.filterKeyword')} className="w-full sm:w-64">
          <FilterSearch
            value={query.keyword ?? ''}
            placeholder={t('users.searchPlaceholder')}
            onChange={(keyword) => setParams({ keyword, page: null })}
          />
        </FilterField>
        <FilterField label={t('users.filterRole')}>
          <FilterSelect<UserRole>
            value={query.role}
            allLabel={t('common.all')}
            options={ROLES.map((role) => ({ value: role, label: t(USER_ROLE_META[role].labelKey) }))}
            onChange={(role) => setParams({ role: role ?? null, page: null })}
          />
        </FilterField>
        <FilterField label={t('users.filterStatus')}>
          <FilterSelect<UserStatus>
            value={query.status}
            allLabel={t('common.all')}
            options={STATUSES.map((status) => ({ value: status, label: t(USER_STATUS_META[status].labelKey) }))}
            onChange={(status) => setParams({ status: status ?? null, page: null })}
          />
        </FilterField>
        <FilterField label={t('users.filterCet')}>
          <FilterSelect<CetLevel>
            value={query.cetLevel}
            allLabel={t('common.all')}
            options={CET_LEVELS.map((level) => ({ value: level, label: level }))}
            onChange={(cetLevel) => setParams({ cetLevel: cetLevel ?? null, page: null })}
          />
        </FilterField>
        <FilterField label={t('users.filterRegisteredFrom')} className="w-full sm:w-44">
          <input
            type="date"
            value={query.startDate ?? ''}
            onChange={(event) => setParams({ startDate: event.target.value, page: null })}
            className={`${inputClass} h-10 py-0`}
          />
        </FilterField>
        <FilterField label={t('users.filterRegisteredTo')} className="w-full sm:w-44">
          <input
            type="date"
            value={query.endDate ?? ''}
            onChange={(event) => setParams({ endDate: event.target.value, page: null })}
            className={`${inputClass} h-10 py-0`}
          />
        </FilterField>
      </AdminFilterBar>
      {dateInvalid && <p className="text-label-md text-error">{t('users.dateRangeInvalid')}</p>}

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
              emptyTitle={hasFilters ? t('users.emptyFiltered') : t('users.empty')}
              emptyDescription={hasFilters ? undefined : t('users.emptyDesc')}
              emptyAction={
                hasFilters ? (
                  <button type="button" onClick={clearFilters} className="text-label-lg text-primary hover:underline">
                    {t('filter.reset')}
                  </button>
                ) : undefined
              }
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

      {action && (
        <UserActionDialog
          key={`${action.kind}-${action.user.id}`}
          action={action}
          onClose={(changed) => {
            setAction(null);
            if (changed) reload();
          }}
        />
      )}
    </div>
  );
}

interface IconActionProps {
  icon: string;
  label: string;
  tone?: 'default' | 'danger';
  onClick: () => void;
}

function IconAction({ icon, label, tone = 'default', onClick }: IconActionProps) {
  const toneClass = tone === 'danger' ? 'text-error hover:bg-error-container' : 'text-on-surface-variant hover:bg-primary-container/30 hover:text-primary';
  return (
    <button
      type="button"
      onClick={onClick}
      aria-label={label}
      title={label}
      className={`flex h-8 w-8 items-center justify-center rounded-full transition-all duration-200 hover:scale-110 ${toneClass}`}
    >
      <span className="material-symbols-outlined text-icon-md">{icon}</span>
    </button>
  );
}
