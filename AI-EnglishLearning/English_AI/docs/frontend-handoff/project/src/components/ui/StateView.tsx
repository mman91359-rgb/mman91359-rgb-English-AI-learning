import type { ReactNode } from 'react';
import { Button } from '@/components/ui/Button';
import { useI18n } from '@/i18n';

export function LoadingState({ rows = 4 }: { rows?: number }) {
  return (
    <div className="flex flex-col gap-3 p-6" role="status" aria-label="loading">
      {Array.from({ length: rows }).map((_, index) => (
        <div
          key={index}
          className="h-6 w-full rounded-lg bg-gradient-to-r from-surface-container via-surface-container-high to-surface-container bg-[length:200%_100%] animate-shimmer"
        />
      ))}
    </div>
  );
}

interface EmptyStateProps {
  title: string;
  description?: string;
  action?: ReactNode;
}

export function EmptyState({ title, description, action }: EmptyStateProps) {
  return (
    <div className="flex flex-col items-center justify-center gap-3 px-6 py-16 text-center">
      <span className="material-symbols-outlined text-icon-xl text-outline">inbox</span>
      <p className="text-headline-sm text-on-surface">{title}</p>
      {description && <p className="max-w-sm text-body-sm text-on-surface-variant">{description}</p>}
      {action}
    </div>
  );
}

export type ErrorKind = 'unauthorized' | 'forbidden' | 'generic';

/** 根据接口错误的 HTTP 状态判断错误类别 */
export function getErrorKind(error: unknown): ErrorKind {
  const status = typeof error === 'object' && error !== null && 'status' in error ? Number(error.status) : 0;
  if (status === 401) return 'unauthorized';
  if (status === 403) return 'forbidden';
  return 'generic';
}

interface ErrorStateProps {
  error: unknown;
  onRetry?: () => void;
}

export function ErrorState({ error, onRetry }: ErrorStateProps) {
  const { t } = useI18n();
  const kind = getErrorKind(error);

  const copy = {
    unauthorized: { icon: 'lock', title: t('state.unauthorizedTitle'), desc: t('state.unauthorizedDesc') },
    forbidden: { icon: 'shield_person', title: t('state.forbiddenTitle'), desc: t('state.forbiddenDesc') },
    generic: { icon: 'error', title: t('state.errorTitle'), desc: t('state.errorDesc') },
  }[kind];

  return (
    <div role="alert" className="flex flex-col items-center justify-center gap-3 px-6 py-16 text-center">
      <span className="flex h-14 w-14 items-center justify-center rounded-full bg-error-container text-on-error-container">
        <span className="material-symbols-outlined text-icon-lg">{copy.icon}</span>
      </span>
      <p className="text-headline-sm text-on-surface">{copy.title}</p>
      <p className="max-w-sm text-body-sm text-on-surface-variant">{copy.desc}</p>
      {onRetry && kind === 'generic' && (
        <Button variant="secondary" icon="refresh" onClick={onRetry}>
          {t('common.retry')}
        </Button>
      )}
    </div>
  );
}
