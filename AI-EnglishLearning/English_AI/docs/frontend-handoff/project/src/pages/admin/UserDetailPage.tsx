import { useState } from 'react';
import { fetchUserDetail } from '@/api/admin';
import { AdminLink } from '@/admin/router';
import { StatusBadge } from '@/components/admin/StatusBadge';
import { UserAvatar } from '@/components/admin/UserAvatar';
import { UserActionDialog, type UserAction } from '@/components/admin/UserActionDialog';
import { Button } from '@/components/ui/Button';
import { ErrorState, LoadingState } from '@/components/ui/StateView';
import { useI18n } from '@/i18n';
import type { MessageKey } from '@/i18n/zh-CN';
import { USER_ROLE_META, USER_STATUS_META } from '@/lib/adminEnums';
import { displayOrDash, formatDateTime, formatNumber } from '@/lib/format';
import { useAsync } from '@/lib/useAsync';
import type { LooseRecord } from '@/types/admin';

interface UserDetailPageProps {
  userId: number;
}

export function UserDetailPage({ userId }: UserDetailPageProps) {
  const { t, locale } = useI18n();
  const [action, setAction] = useState<UserAction | null>(null);
  const { data, error, loading, reload } = useAsync(() => fetchUserDetail(userId), [userId]);

  if (loading && !data) return <LoadingState rows={8} />;
  if (error || !data) return <ErrorState error={error} onRetry={reload} />;

  const { user } = data;
  const displayName = user.nickname || user.username;

  return (
    <div className="flex flex-col gap-6">
      <AdminLink to="/admin/users" className="inline-flex w-fit items-center gap-1 text-label-lg text-primary hover:underline">
        <span className="material-symbols-outlined text-icon-md">arrow_back</span>
        {t('users.backToList')}
      </AdminLink>

      <section className="flex flex-col gap-6 rounded-[16px] border border-outline-variant/40 bg-surface-container-lowest p-6 shadow-soft-glow md:flex-row md:items-center">
        <UserAvatar name={displayName} avatarUrl={user.avatarUrl} size="lg" />
        <div className="flex min-w-0 flex-1 flex-col gap-2">
          <div className="flex flex-wrap items-center gap-3">
            <h2 className="text-headline-md text-on-surface">{displayName}</h2>
            <StatusBadge tone={USER_STATUS_META[user.status].tone} label={t(USER_STATUS_META[user.status].labelKey)} />
          </div>
          <p className="text-body-sm text-on-surface-variant">
            {user.username} · {displayOrDash(user.phoneMasked)}
          </p>
          <div className="flex flex-wrap gap-2">
            {user.roles.map((role) => (
              <StatusBadge key={role} tone={USER_ROLE_META[role].tone} label={t(USER_ROLE_META[role].labelKey)} />
            ))}
          </div>
        </div>
        <div className="flex flex-wrap gap-2">
          <Button
            variant={user.status === 1 ? 'danger' : 'secondary'}
            icon={user.status === 1 ? 'block' : 'check_circle'}
            onClick={() => setAction({ kind: 'status', user })}
          >
            {user.status === 1 ? t('users.actionDisable') : t('users.actionEnable')}
          </Button>
          <Button variant="secondary" icon="lock_reset" onClick={() => setAction({ kind: 'reset', user })}>
            {t('users.actionReset')}
          </Button>
          <Button variant="secondary" icon="manage_accounts" onClick={() => setAction({ kind: 'role', user })}>
            {t('users.actionRole')}
          </Button>
        </div>
      </section>

      <section className="grid grid-cols-1 gap-gutter lg:grid-cols-2">
        <InfoCard
          title={t('detail.basicInfo')}
          rows={[
            { label: t('users.colCet'), value: displayOrDash(user.cetLevel) },
            { label: t('detail.elo'), value: formatNumber(user.eloScore, locale) },
            { label: t('users.colCreatedAt'), value: formatDateTime(user.createdAt) },
            { label: t('users.colLastLogin'), value: formatDateTime(user.lastLoginAt) },
          ]}
        />
        <InfoCard
          title={t('detail.coinInfo')}
          rows={[{ label: t('users.colCoin'), value: formatNumber(user.coinBalance, locale) }]}
        />
      </section>

      <section className="grid grid-cols-1 gap-gutter lg:grid-cols-3">
        <DetailRecordCard titleKey="detail.abilityCard" data={data.radar} />
        <DetailRecordCard titleKey="detail.coinCard" data={data.coin} />
        <DetailRecordCard titleKey="detail.statsCard" data={data.stats} />
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

interface InfoRow {
  label: string;
  value: string;
}

function InfoCard({ title, rows }: { title: string; rows: InfoRow[] }) {
  return (
    <section className="flex flex-col gap-4 rounded-[16px] border border-outline-variant/40 bg-surface-container-lowest p-6 shadow-soft-glow">
      <h3 className="text-headline-sm text-on-surface">{title}</h3>
      <dl className="grid grid-cols-2 gap-x-6 gap-y-4">
        {rows.map((row) => (
          <div key={row.label} className="flex flex-col gap-1">
            <dt className="text-label-md text-on-surface-variant">{row.label}</dt>
            <dd className="tabular-nums text-body-md text-on-surface">{row.value}</dd>
          </div>
        ))}
      </dl>
    </section>
  );
}

interface DetailRecordCardProps {
  titleKey: MessageKey;
  data: LooseRecord | null;
}

/** 来自其他服务的聚合数据，不可用时显示占位文案 */
function DetailRecordCard({ titleKey, data }: DetailRecordCardProps) {
  const { t } = useI18n();
  const entries = data ? Object.entries(data) : [];

  return (
    <section className="flex flex-col gap-4 rounded-[16px] border border-outline-variant/40 bg-surface-container-lowest p-6 shadow-soft-glow">
      <h3 className="text-headline-sm text-on-surface">{t(titleKey)}</h3>
      {entries.length === 0 ? (
        <p className="text-body-sm text-on-surface-variant">{t('detail.unavailable')}</p>
      ) : (
        <dl className="flex flex-col gap-3">
          {entries.map(([key, value]) => (
            <div key={key} className="flex items-center justify-between gap-4 border-b border-outline-variant/30 pb-2">
              <dt className="text-body-sm text-on-surface-variant">{key}</dt>
              <dd className="tabular-nums text-body-sm font-semibold text-on-surface">{displayOrDash(value)}</dd>
            </div>
          ))}
        </dl>
      )}
    </section>
  );
}
