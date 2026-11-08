import { useState, type FormEvent } from 'react';
import { createNotice, updateNotice } from '@/api/admin';
import { FormField, inputClass } from '@/components/admin/FormField';
import { BaseDrawer } from '@/components/ui/BaseDrawer';
import { Button } from '@/components/ui/Button';
import { useToast } from '@/components/ui/Toast';
import { useI18n } from '@/i18n';
import type { MessageKey } from '@/i18n/zh-CN';
import { AUDIENCE_META, NOTICE_TYPE_META } from '@/lib/adminEnums';
import { getAdminErrorKey } from '@/lib/adminErrors';
import { formatDateTime, fromInputDateTime, toInputDateTime } from '@/lib/format';
import type { AdminNotice, NoticePayload, NoticeType, TargetAudience } from '@/types/admin';

const NOTICE_TYPES: readonly NoticeType[] = ['SYSTEM', 'REMINDER', 'ACTIVITY'];
const AUDIENCES: readonly TargetAudience[] = ['ALL', 'CET4', 'CET6'];
const TITLE_MAX = 60;
const CONTENT_MAX = 1000;

interface NoticeDraft {
  title: string;
  content: string;
  noticeType: NoticeType;
  targetAudience: TargetAudience;
  publishAt: string;
  expireAt: string;
}

type DraftErrors = Partial<Record<keyof NoticeDraft, MessageKey>>;

function toDraft(notice: AdminNotice | null): NoticeDraft {
  return {
    title: notice?.title ?? '',
    content: notice?.content ?? '',
    noticeType: notice?.noticeType ?? 'SYSTEM',
    targetAudience: notice?.targetAudience ?? 'ALL',
    publishAt: toInputDateTime(notice?.publishAt),
    expireAt: toInputDateTime(notice?.expireAt),
  };
}

function validate(draft: NoticeDraft): DraftErrors {
  const errors: DraftErrors = {};
  if (!draft.title.trim()) errors.title = 'notice.errTitleRequired';
  else if (draft.title.trim().length > TITLE_MAX) errors.title = 'notice.errTitleTooLong';
  if (!draft.content.trim()) errors.content = 'notice.errContentRequired';
  else if (draft.content.length > CONTENT_MAX) errors.content = 'notice.errContentTooLong';
  if (draft.publishAt && draft.expireAt && draft.expireAt <= draft.publishAt) {
    errors.expireAt = 'notice.errExpireBeforePublish';
  }
  return errors;
}

interface NoticeEditorDrawerProps {
  /** null 表示新建 */
  notice: AdminNotice | null;
  onClose: (saved: boolean) => void;
}

export function NoticeEditorDrawer({ notice, onClose }: NoticeEditorDrawerProps) {
  const { t } = useI18n();
  const { notify } = useToast();
  const [draft, setDraft] = useState<NoticeDraft>(() => toDraft(notice));
  const [errors, setErrors] = useState<DraftErrors>({});
  const [submitting, setSubmitting] = useState(false);
  const isEdit = notice !== null;

  const update = <K extends keyof NoticeDraft>(key: K, value: NoticeDraft[K]) => {
    setDraft((prev) => ({ ...prev, [key]: value }));
    setErrors((prev) => ({ ...prev, [key]: undefined }));
  };

  const handleSubmit = async (event: FormEvent<HTMLFormElement>) => {
    event.preventDefault();
    const nextErrors = validate(draft);
    setErrors(nextErrors);
    if (Object.keys(nextErrors).length > 0) return;

    const payload: NoticePayload = {
      title: draft.title.trim(),
      content: draft.content.trim(),
      noticeType: draft.noticeType,
      targetAudience: draft.targetAudience,
      publishAt: fromInputDateTime(draft.publishAt),
      expireAt: fromInputDateTime(draft.expireAt),
    };

    setSubmitting(true);
    try {
      if (notice) {
        await updateNotice(notice.id, payload);
      } else {
        await createNotice(payload);
      }
      notify('success', t('notice.savedToast'));
      onClose(true);
    } catch (error) {
      notify('error', t(getAdminErrorKey(error)));
      setSubmitting(false);
    }
  };

  const fieldErrors = (key: keyof NoticeDraft) => (errors[key] ? t(errors[key]) : undefined);

  return (
    <BaseDrawer
      open
      title={isEdit ? t('notice.editTitle') : t('notice.createTitle')}
      onClose={() => onClose(false)}
      closeDisabled={submitting}
      footer={
        <>
          <Button variant="secondary" onClick={() => onClose(false)} disabled={submitting}>
            {t('common.cancel')}
          </Button>
          <Button type="submit" form="notice-editor-form" loading={submitting}>
            {t('notice.saveDraft')}
          </Button>
        </>
      }
    >
      <form id="notice-editor-form" onSubmit={handleSubmit} className="flex flex-col gap-6" noValidate>
        <FormField label={t('notice.fieldTitle')} required error={fieldErrors('title')} hint={t('notice.titleHint', { max: TITLE_MAX })}>
          <input
            value={draft.title}
            onChange={(event) => update('title', event.target.value)}
            className={inputClass}
          />
        </FormField>

        <FormField label={t('notice.fieldContent')} required error={fieldErrors('content')}>
          <textarea
            value={draft.content}
            onChange={(event) => update('content', event.target.value)}
            rows={5}
            className={`${inputClass} resize-y`}
          />
        </FormField>

        <div className="grid grid-cols-1 gap-4 sm:grid-cols-2">
          <FormField label={t('notice.fieldType')} required>
            <select value={draft.noticeType} onChange={(event) => update('noticeType', event.target.value as NoticeType)} className={inputClass}>
              {NOTICE_TYPES.map((type) => (
                <option key={type} value={type}>
                  {t(NOTICE_TYPE_META[type].labelKey)}
                </option>
              ))}
            </select>
          </FormField>
          <FormField label={t('notice.fieldAudience')} required>
            <select
              value={draft.targetAudience}
              onChange={(event) => update('targetAudience', event.target.value as TargetAudience)}
              className={inputClass}
            >
              {AUDIENCES.map((audience) => (
                <option key={audience} value={audience}>
                  {t(AUDIENCE_META[audience].labelKey)}
                </option>
              ))}
            </select>
          </FormField>
        </div>

        <div className="grid grid-cols-1 gap-4 sm:grid-cols-2">
          <FormField label={t('notice.fieldPublishAt')} hint={t('notice.publishAtHint')}>
            <input
              type="datetime-local"
              value={draft.publishAt}
              onChange={(event) => update('publishAt', event.target.value)}
              className={inputClass}
            />
          </FormField>
          <FormField label={t('notice.fieldExpireAt')} error={fieldErrors('expireAt')} hint={t('notice.expireAtHint')}>
            <input
              type="datetime-local"
              value={draft.expireAt}
              onChange={(event) => update('expireAt', event.target.value)}
              className={inputClass}
            />
          </FormField>
        </div>

        <section aria-label={t('notice.preview')} className="flex flex-col gap-3">
          <span className="text-label-lg text-on-surface">{t('notice.preview')}</span>
          <div className="flex flex-col gap-3 rounded-[16px] border border-outline-variant/40 bg-surface-container-low p-5">
            <div className="flex items-center gap-2">
              <span className="material-symbols-outlined text-icon-md text-primary">notifications</span>
              <span className="text-label-lg text-on-surface">{draft.title.trim() || t('notice.previewPlaceholderTitle')}</span>
            </div>
            <p className="whitespace-pre-line text-body-sm text-on-surface-variant">
              {draft.content.trim() || t('notice.previewPlaceholderContent')}
            </p>
            <span className="text-label-sm text-outline">
              {draft.publishAt ? formatDateTime(fromInputDateTime(draft.publishAt)) : t('notice.publishNow')}
            </span>
          </div>
        </section>
      </form>
    </BaseDrawer>
  );
}
