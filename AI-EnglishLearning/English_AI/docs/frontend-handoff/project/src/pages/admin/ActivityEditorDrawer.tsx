import { useState, type FormEvent } from 'react';
import { createActivity, updateActivity } from '@/api/admin';
import { FormField, inputClass } from '@/components/admin/FormField';
import { BaseDrawer } from '@/components/ui/BaseDrawer';
import { Button } from '@/components/ui/Button';
import { useToast } from '@/components/ui/Toast';
import { useI18n } from '@/i18n';
import type { MessageKey } from '@/i18n/zh-CN';
import { AUDIENCE_META, getActivityDisplayState } from '@/lib/adminEnums';
import { getAdminErrorKey } from '@/lib/adminErrors';
import { fromInputDateTime, toInputDateTime } from '@/lib/format';
import type { ActivityPayload, ActivityType, AdminActivity, TargetAudience } from '@/types/admin';

const ACTIVITY_TYPES: readonly ActivityType[] = ['BANNER', 'CONTENT'];
const AUDIENCES: readonly TargetAudience[] = ['ALL', 'CET4', 'CET6'];

interface ActivityDraft {
  title: string;
  summary: string;
  content: string;
  activityType: ActivityType;
  targetAudience: TargetAudience;
  startAt: string;
  endAt: string;
  bannerUrl: string;
  sortOrder: string;
}

type DraftErrors = Partial<Record<keyof ActivityDraft, MessageKey>>;

function toDraft(activity: AdminActivity | null): ActivityDraft {
  return {
    title: activity?.title ?? '',
    summary: activity?.summary ?? '',
    content: activity?.content ?? '',
    activityType: activity?.activityType ?? 'BANNER',
    targetAudience: activity?.targetAudience ?? 'ALL',
    startAt: toInputDateTime(activity?.startAt),
    endAt: toInputDateTime(activity?.endAt),
    bannerUrl: activity?.bannerUrl ?? '',
    sortOrder: String(activity?.sortOrder ?? 0),
  };
}

function validate(draft: ActivityDraft): DraftErrors {
  const errors: DraftErrors = {};
  if (!draft.title.trim()) errors.title = 'activity.errTitleRequired';
  if (!draft.startAt) errors.startAt = 'activity.errStartRequired';
  if (!draft.endAt) errors.endAt = 'activity.errEndRequired';
  if (draft.startAt && draft.endAt && draft.endAt <= draft.startAt) errors.endAt = 'activity.errEndBeforeStart';
  if (!/^-?\d+$/.test(draft.sortOrder.trim())) errors.sortOrder = 'activity.errSortInvalid';
  return errors;
}

interface ActivityEditorDrawerProps {
  /** null 表示新建 */
  activity: AdminActivity | null;
  onClose: (saved: boolean) => void;
}

export function ActivityEditorDrawer({ activity, onClose }: ActivityEditorDrawerProps) {
  const { t } = useI18n();
  const { notify } = useToast();
  const [draft, setDraft] = useState<ActivityDraft>(() => toDraft(activity));
  const [errors, setErrors] = useState<DraftErrors>({});
  const [submitting, setSubmitting] = useState(false);

  const update = <K extends keyof ActivityDraft>(key: K, value: ActivityDraft[K]) => {
    setDraft((prev) => ({ ...prev, [key]: value }));
    setErrors((prev) => ({ ...prev, [key]: undefined }));
  };

  const handleSubmit = async (event: FormEvent<HTMLFormElement>) => {
    event.preventDefault();
    const nextErrors = validate(draft);
    setErrors(nextErrors);
    if (Object.keys(nextErrors).length > 0) return;

    const payload: ActivityPayload = {
      title: draft.title.trim(),
      summary: draft.summary.trim(),
      content: draft.content.trim(),
      bannerUrl: draft.bannerUrl.trim() || undefined,
      activityType: draft.activityType,
      targetAudience: draft.targetAudience,
      startAt: fromInputDateTime(draft.startAt) ?? '',
      endAt: fromInputDateTime(draft.endAt) ?? '',
      sortOrder: Number(draft.sortOrder),
    };

    setSubmitting(true);
    try {
      if (activity) {
        await updateActivity(activity.id, payload);
      } else {
        await createActivity(payload);
      }
      notify('success', t('activity.savedToast'));
      onClose(true);
    } catch (error) {
      notify('error', t(getAdminErrorKey(error)));
      setSubmitting(false);
    }
  };

  const fieldError = (key: keyof ActivityDraft) => (errors[key] ? t(errors[key]) : undefined);

  return (
    <BaseDrawer
      open
      title={activity ? t('activity.editTitle') : t('activity.createTitle')}
      onClose={() => onClose(false)}
      closeDisabled={submitting}
      footer={
        <>
          <Button variant="secondary" onClick={() => onClose(false)} disabled={submitting}>
            {t('common.cancel')}
          </Button>
          <Button type="submit" form="activity-editor-form" loading={submitting}>
            {t('activity.saveDraft')}
          </Button>
        </>
      }
    >
      <form id="activity-editor-form" onSubmit={handleSubmit} className="flex flex-col gap-6" noValidate>
        <FormField label={t('activity.fieldTitle')} required error={fieldError('title')}>
          <input value={draft.title} onChange={(event) => update('title', event.target.value)} className={inputClass} />
        </FormField>

        <FormField label={t('activity.fieldSummary')} hint={t('activity.summaryHint')}>
          <input value={draft.summary} onChange={(event) => update('summary', event.target.value)} className={inputClass} />
        </FormField>

        <FormField label={t('activity.fieldContent')}>
          <textarea value={draft.content} onChange={(event) => update('content', event.target.value)} rows={5} className={`${inputClass} resize-y`} />
        </FormField>

        <div className="grid grid-cols-1 gap-4 sm:grid-cols-2">
          <FormField label={t('activity.fieldType')} required>
            <select value={draft.activityType} onChange={(event) => update('activityType', event.target.value as ActivityType)} className={inputClass}>
              {ACTIVITY_TYPES.map((type) => (
                <option key={type} value={type}>
                  {t(type === 'BANNER' ? 'enum.typeBanner' : 'enum.typeContent')}
                </option>
              ))}
            </select>
          </FormField>
          <FormField label={t('activity.fieldAudience')} required>
            <select value={draft.targetAudience} onChange={(event) => update('targetAudience', event.target.value as TargetAudience)} className={inputClass}>
              {AUDIENCES.map((audience) => (
                <option key={audience} value={audience}>
                  {t(AUDIENCE_META[audience].labelKey)}
                </option>
              ))}
            </select>
          </FormField>
        </div>

        <div className="grid grid-cols-1 gap-4 sm:grid-cols-2">
          <FormField label={t('activity.fieldStartAt')} required error={fieldError('startAt')}>
            <input type="datetime-local" value={draft.startAt} onChange={(event) => update('startAt', event.target.value)} className={inputClass} />
          </FormField>
          <FormField label={t('activity.fieldEndAt')} required error={fieldError('endAt')}>
            <input type="datetime-local" value={draft.endAt} onChange={(event) => update('endAt', event.target.value)} className={inputClass} />
          </FormField>
        </div>

        <div className="grid grid-cols-1 gap-4 sm:grid-cols-2">
          <FormField label={t('activity.fieldBanner')} hint={t('activity.bannerHint')}>
            <input value={draft.bannerUrl} onChange={(event) => update('bannerUrl', event.target.value)} className={inputClass} />
          </FormField>
          <FormField label={t('activity.fieldSort')} error={fieldError('sortOrder')} hint={t('activity.sortHint')}>
            <input type="number" value={draft.sortOrder} onChange={(event) => update('sortOrder', event.target.value)} className={inputClass} />
          </FormField>
        </div>

        <p className="rounded-xl bg-surface-container-low px-4 py-3 text-body-sm text-on-surface-variant">
          {activity ? t('activity.stateHint', { state: t(getStateKey(activity)) }) : t('activity.createHint')}
        </p>
      </form>
    </BaseDrawer>
  );
}

function getStateKey(activity: AdminActivity): MessageKey {
  const state = getActivityDisplayState(activity);
  return state === 'DRAFT' ? 'enum.activityDraft' : state === 'SCHEDULED' ? 'enum.activityScheduled' : state === 'ACTIVE' ? 'enum.activityActive' : 'enum.activityEnded';
}
