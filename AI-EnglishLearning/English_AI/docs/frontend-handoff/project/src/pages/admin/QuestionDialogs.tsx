import { useState } from 'react';
import { generateQuestions, rejectQuestion } from '@/api/admin';
import { FormField, inputClass } from '@/components/admin/FormField';
import { BaseDialog } from '@/components/ui/BaseDialog';
import { Button } from '@/components/ui/Button';
import { useToast } from '@/components/ui/Toast';
import { useI18n } from '@/i18n';
import { getAdminErrorKey } from '@/lib/adminErrors';
import type { AdminQuestion, CetLevel, GenerateQuestionsPayload } from '@/types/admin';

const CET_LEVELS: readonly CetLevel[] = ['CET4', 'CET6'];
const GENERATE_COUNT_MIN = 1;
const GENERATE_COUNT_MAX = 20;
const DIFFICULTY_MIN = 1;
const DIFFICULTY_MAX = 5;

interface RejectQuestionDialogProps {
  question: AdminQuestion;
  onClose: (changed: boolean) => void;
}

/** 驳回题目，驳回意见必填 */
export function RejectQuestionDialog({ question, onClose }: RejectQuestionDialogProps) {
  const { t } = useI18n();
  const { notify } = useToast();
  const [comment, setComment] = useState('');
  const [error, setError] = useState<string | null>(null);
  const [submitting, setSubmitting] = useState(false);

  const submit = async () => {
    const trimmed = comment.trim();
    if (!trimmed) {
      setError(t('question.errCommentRequired'));
      return;
    }
    setSubmitting(true);
    try {
      await rejectQuestion(question.id, trimmed);
      notify('success', t('question.rejectToast'));
      onClose(true);
    } catch (err) {
      notify('error', t(getAdminErrorKey(err)));
      setSubmitting(false);
    }
  };

  return (
    <BaseDialog
      open
      title={t('question.rejectTitle')}
      onClose={() => onClose(false)}
      closeDisabled={submitting}
      footer={
        <>
          <Button variant="secondary" onClick={() => onClose(false)} disabled={submitting}>
            {t('common.cancel')}
          </Button>
          <Button variant="danger" onClick={submit} loading={submitting}>
            {t('question.rejectConfirm')}
          </Button>
        </>
      }
    >
      <div className="flex flex-col gap-5">
        <p className="line-clamp-3 text-body-sm text-on-surface-variant">{question.stem}</p>
        <FormField label={t('question.fieldComment')} required error={error ?? undefined}>
          <textarea
            value={comment}
            onChange={(event) => {
              setComment(event.target.value);
              setError(null);
            }}
            rows={4}
            className={`${inputClass} resize-y`}
          />
        </FormField>
      </div>
    </BaseDialog>
  );
}

interface GenerateQuestionsDialogProps {
  onClose: (generated: boolean) => void;
}

interface GenerateDraft {
  knowledgePoint: string;
  cetLevel: CetLevel;
  difficulty: string;
  questionType: string;
  count: string;
}

const INITIAL_DRAFT: GenerateDraft = {
  knowledgePoint: '',
  cetLevel: 'CET4',
  difficulty: '3',
  questionType: 'FILL_BLANK',
  count: '5',
};

/** AI 出题：生成的题目进入待审核队列 */
export function GenerateQuestionsDialog({ onClose }: GenerateQuestionsDialogProps) {
  const { t } = useI18n();
  const { notify } = useToast();
  const [draft, setDraft] = useState<GenerateDraft>(INITIAL_DRAFT);
  const [error, setError] = useState<string | null>(null);
  const [submitting, setSubmitting] = useState(false);

  const update = <K extends keyof GenerateDraft>(key: K, value: GenerateDraft[K]) => {
    setDraft((prev) => ({ ...prev, [key]: value }));
    setError(null);
  };

  const submit = async () => {
    const difficulty = Number(draft.difficulty);
    const count = Number(draft.count);
    if (!draft.knowledgePoint.trim() || !draft.questionType.trim()) {
      setError(t('question.errFieldsRequired'));
      return;
    }
    if (!Number.isInteger(difficulty) || difficulty < DIFFICULTY_MIN || difficulty > DIFFICULTY_MAX) {
      setError(t('question.errDifficulty', { min: DIFFICULTY_MIN, max: DIFFICULTY_MAX }));
      return;
    }
    if (!Number.isInteger(count) || count < GENERATE_COUNT_MIN || count > GENERATE_COUNT_MAX) {
      setError(t('question.errCount', { min: GENERATE_COUNT_MIN, max: GENERATE_COUNT_MAX }));
      return;
    }

    const payload: GenerateQuestionsPayload = {
      knowledgePoint: draft.knowledgePoint.trim(),
      cetLevel: draft.cetLevel,
      difficulty,
      questionType: draft.questionType.trim(),
      count,
    };

    setSubmitting(true);
    try {
      const result = await generateQuestions(payload);
      if (result.savedCount === 0) {
        notify('info', t('question.generateEmpty'));
      } else {
        notify('success', t('question.generateToast', { count: result.savedCount }));
      }
      onClose(result.savedCount > 0);
    } catch (err) {
      notify('error', t(getAdminErrorKey(err)));
      setSubmitting(false);
    }
  };

  return (
    <BaseDialog
      open
      title={t('question.generateTitle')}
      onClose={() => onClose(false)}
      closeDisabled={submitting}
      footer={
        <>
          <Button variant="secondary" onClick={() => onClose(false)} disabled={submitting}>
            {t('common.cancel')}
          </Button>
          <Button icon="auto_awesome" onClick={submit} loading={submitting}>
            {t('question.generateConfirm')}
          </Button>
        </>
      }
    >
      <div className="flex flex-col gap-5">
        {error && <p role="alert" className="text-label-md text-error">{error}</p>}
        <FormField label={t('question.fieldKnowledge')} required>
          <input value={draft.knowledgePoint} onChange={(event) => update('knowledgePoint', event.target.value)} className={inputClass} />
        </FormField>
        <div className="grid grid-cols-1 gap-4 sm:grid-cols-2">
          <FormField label={t('question.fieldCet')} required>
            <select value={draft.cetLevel} onChange={(event) => update('cetLevel', event.target.value as CetLevel)} className={inputClass}>
              {CET_LEVELS.map((level) => (
                <option key={level} value={level}>
                  {level}
                </option>
              ))}
            </select>
          </FormField>
          <FormField label={t('question.fieldType')} required>
            <input value={draft.questionType} onChange={(event) => update('questionType', event.target.value)} className={inputClass} />
          </FormField>
        </div>
        <div className="grid grid-cols-1 gap-4 sm:grid-cols-2">
          <FormField label={t('question.fieldDifficulty')} required hint={t('question.difficultyHint', { min: DIFFICULTY_MIN, max: DIFFICULTY_MAX })}>
            <input type="number" min={DIFFICULTY_MIN} max={DIFFICULTY_MAX} value={draft.difficulty} onChange={(event) => update('difficulty', event.target.value)} className={inputClass} />
          </FormField>
          <FormField label={t('question.fieldCount')} required hint={t('question.countHint', { min: GENERATE_COUNT_MIN, max: GENERATE_COUNT_MAX })}>
            <input type="number" min={GENERATE_COUNT_MIN} max={GENERATE_COUNT_MAX} value={draft.count} onChange={(event) => update('count', event.target.value)} className={inputClass} />
          </FormField>
        </div>
      </div>
    </BaseDialog>
  );
}
