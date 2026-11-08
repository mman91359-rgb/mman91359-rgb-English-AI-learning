import type { ReactNode } from 'react';
import { BaseDialog } from '@/components/ui/BaseDialog';
import { Button } from '@/components/ui/Button';
import { useI18n } from '@/i18n';

interface ConfirmDialogProps {
  open: boolean;
  title: string;
  /** 操作对象名称，例如用户名、通知标题 */
  targetName: string;
  /** 影响范围说明 */
  impact: ReactNode;
  confirmLabel: string;
  danger?: boolean;
  loading?: boolean;
  onConfirm: () => void;
  onCancel: () => void;
}

export function ConfirmDialog({
  open,
  title,
  targetName,
  impact,
  confirmLabel,
  danger = false,
  loading = false,
  onConfirm,
  onCancel,
}: ConfirmDialogProps) {
  const { t } = useI18n();

  return (
    <BaseDialog
      open={open}
      title={title}
      onClose={onCancel}
      closeDisabled={loading}
      maxWidthClass="max-w-md"
      footer={
        <>
          <Button variant="secondary" onClick={onCancel} disabled={loading}>
            {t('common.cancel')}
          </Button>
          <Button variant={danger ? 'danger' : 'primary'} onClick={onConfirm} loading={loading}>
            {confirmLabel}
          </Button>
        </>
      }
    >
      <div className="flex flex-col gap-4">
        <p className="text-body-md text-on-surface">
          {t('common.confirmTarget')}
          <span className="mx-1 font-semibold text-on-surface">{targetName}</span>
        </p>
        <div className="rounded-xl bg-surface-container-low p-4 text-body-sm text-on-surface-variant">
          <span className="mb-1 block text-label-md text-on-surface">{t('common.impact')}</span>
          {impact}
        </div>
      </div>
    </BaseDialog>
  );
}
