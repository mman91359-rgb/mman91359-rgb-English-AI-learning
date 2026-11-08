import { useState } from 'react';
import { resetUserPassword, updateUserRole, updateUserStatus } from '@/api/admin';
import { FormField, inputClass } from '@/components/admin/FormField';
import { BaseDialog } from '@/components/ui/BaseDialog';
import { Button } from '@/components/ui/Button';
import { ConfirmDialog } from '@/components/ui/ConfirmDialog';
import { useToast } from '@/components/ui/Toast';
import { useI18n } from '@/i18n';
import { getAdminErrorKey } from '@/lib/adminErrors';
import type { AdminUserRow, UserRole } from '@/types/admin';

export type UserActionKind = 'status' | 'role' | 'reset';

export interface UserAction {
  kind: UserActionKind;
  user: AdminUserRow;
}

interface UserActionDialogProps {
  action: UserAction;
  /** changed 为 true 表示用户数据已变更，调用方需刷新列表 */
  onClose: (changed: boolean) => void;
}

/**
 * 用户危险操作弹窗：启用/禁用、调整角色、重置密码。
 * 每次操作挂载一个新实例，内部状态随挂载重置。
 */
export function UserActionDialog({ action, onClose }: UserActionDialogProps) {
  const { t } = useI18n();
  const { notify } = useToast();
  const { user } = action;
  const [submitting, setSubmitting] = useState(false);
  const [changed, setChanged] = useState(false);
  const [role, setRole] = useState<UserRole>(user.roles.includes('ROLE_ADMIN') ? 'ROLE_ADMIN' : 'ROLE_USER');
  const [tempPassword, setTempPassword] = useState<string | null>(null);

  const displayName = user.nickname || user.username;
  const targetName = `${displayName} (${user.username})`;
  const close = () => onClose(changed);

  const runAction = async (task: () => Promise<unknown>, successMessage: string) => {
    setSubmitting(true);
    try {
      await task();
      notify('success', successMessage);
      onClose(true);
    } catch (error) {
      notify('error', t(getAdminErrorKey(error)));
      setSubmitting(false);
    }
  };

  const copyTemporaryPassword = (password: string) => {
    navigator.clipboard
      .writeText(password)
      .then(() => notify('success', t('users.copied')))
      .catch(() => notify('error', t('error.generic')));
  };

  if (action.kind === 'status') {
    const disabling = user.status === 1;
    return (
      <ConfirmDialog
        open
        danger={disabling}
        title={disabling ? t('users.disableTitle') : t('users.enableTitle')}
        targetName={targetName}
        impact={disabling ? t('users.disableImpact') : t('users.enableImpact')}
        confirmLabel={disabling ? t('users.confirmDisable') : t('users.confirmEnable')}
        loading={submitting}
        onCancel={close}
        onConfirm={() =>
          runAction(
            () => updateUserStatus(user.id, disabling ? 0 : 1),
            disabling ? t('users.disabledToast') : t('users.enabledToast'),
          )
        }
      />
    );
  }

  if (action.kind === 'reset') {
    if (tempPassword !== null) {
      return (
        <BaseDialog
          open
          title={t('users.tempPasswordTitle')}
          onClose={close}
          footer={
            <>
              <Button variant="secondary" icon="content_copy" onClick={() => copyTemporaryPassword(tempPassword)}>
                {t('common.copy')}
              </Button>
              <Button onClick={close}>{t('common.done')}</Button>
            </>
          }
        >
          <div className="flex flex-col gap-4">
            <p className="text-body-sm text-on-surface-variant">{t('users.tempPasswordDesc', { name: displayName })}</p>
            <code className="select-all rounded-xl bg-surface-container-low px-4 py-3 text-center font-mono text-headline-sm tracking-widest text-on-surface">
              {tempPassword}
            </code>
            <p className="flex items-start gap-2 rounded-xl bg-warning-container px-4 py-3 text-body-sm text-on-warning-container">
              <span className="material-symbols-outlined text-icon-md">warning</span>
              <span>{t('users.tempPasswordOnce')}</span>
            </p>
          </div>
        </BaseDialog>
      );
    }
    return (
      <ConfirmDialog
        open
        danger
        title={t('users.resetTitle')}
        targetName={targetName}
        impact={t('users.resetImpact')}
        confirmLabel={t('users.confirmReset')}
        loading={submitting}
        onCancel={close}
        onConfirm={async () => {
          setSubmitting(true);
          try {
            const result = await resetUserPassword(user.id);
            setChanged(true);
            setTempPassword(result.temporaryPassword);
          } catch (error) {
            notify('error', t(getAdminErrorKey(error)));
          } finally {
            setSubmitting(false);
          }
        }}
      />
    );
  }

  const currentRole: UserRole = user.roles.includes('ROLE_ADMIN') ? 'ROLE_ADMIN' : 'ROLE_USER';
  const roleOptions: { value: UserRole; label: string }[] = [
    { value: 'ROLE_USER', label: t('enum.roleUser') },
    { value: 'ROLE_ADMIN', label: t('enum.roleAdmin') },
  ];

  return (
    <BaseDialog
      open
      title={t('users.roleTitle')}
      onClose={close}
      closeDisabled={submitting}
      footer={
        <>
          <Button variant="secondary" onClick={close} disabled={submitting}>
            {t('common.cancel')}
          </Button>
          <Button
            loading={submitting}
            disabled={role === currentRole}
            onClick={() => runAction(() => updateUserRole(user.id, role), t('users.roleToast'))}
          >
            {t('common.save')}
          </Button>
        </>
      }
    >
      <div className="flex flex-col gap-5">
        <p className="text-body-sm text-on-surface-variant">{t('users.roleTarget', { name: targetName })}</p>
        <FormField label={t('users.roleField')} hint={t('users.roleImpact')}>
          <select value={role} onChange={(event) => setRole(event.target.value as UserRole)} className={inputClass}>
            {roleOptions.map((option) => (
              <option key={option.value} value={option.value}>
                {option.label}
              </option>
            ))}
          </select>
        </FormField>
      </div>
    </BaseDialog>
  );
}
