import { fetchSubmission } from '@/api/writing';
import { navigate } from '@/admin/router';
import { Button } from '@/components/ui/Button';
import { EmptyState, ErrorState, LoadingState } from '@/components/ui/StateView';
import { useI18n } from '@/i18n';
import { useAsync } from '@/lib/useAsync';
import {
  CORRECTION_TYPE_LABEL_KEYS,
  DIMENSION_LABEL_KEYS,
  DIMENSION_MAX,
  SCORE_LEVEL_LABEL_KEYS,
  SCORE_MAX,
  WRITING_DIMENSIONS,
} from '@/lib/writing';
import type { WritingScore } from '@/types/writing';
import { writingHref } from '@/writing/WritingApp';

interface WritingReportPageProps {
  submissionId: string;
}

export function WritingReportPage({ submissionId }: WritingReportPageProps) {
  const { t } = useI18n();
  const submission = useAsync(() => fetchSubmission(submissionId), [submissionId]);

  if (submission.loading) return <LoadingState rows={8} />;
  if (submission.error != null) return <ErrorState error={submission.error} onRetry={submission.reload} />;
  if (!submission.data) {
    return <EmptyState title={t('writing.report.notFound')} />;
  }

  return <ReportContent score={submission.data.report} topicId={submission.data.topicId} />;
}

function ReportContent({ score, topicId }: { score: WritingScore; topicId: string }) {
  const { t } = useI18n();
  const ratio = Math.round((score.total / SCORE_MAX) * 100);

  return (
    <div className="flex flex-col gap-6">
      <div className="flex flex-col gap-6 rounded-2xl border border-outline-variant/40 bg-surface-container-lowest p-6 shadow-soft-glow md:flex-row md:items-center md:justify-between">
        <div className="flex items-center gap-6">
          <div
            className="relative flex h-28 w-28 shrink-0 items-center justify-center rounded-full"
            style={{ background: `conic-gradient(rgb(var(--primary)) ${ratio}%, rgb(var(--surface-container-high)) 0)` }}
            aria-label={t('writing.report.scoreOf', { score: score.total, max: SCORE_MAX })}
          >
            <span className="flex h-[88px] w-[88px] flex-col items-center justify-center rounded-full bg-surface-container-lowest">
              <span className="text-headline-lg tabular-nums text-on-surface">{score.total}</span>
              <span className="text-label-sm text-on-surface-variant">/ {SCORE_MAX}</span>
            </span>
          </div>
          <div className="flex flex-col gap-1">
            <span className="text-label-md text-on-surface-variant">{t('writing.report.title')}</span>
            <span className="text-headline-sm text-on-surface">{t(SCORE_LEVEL_LABEL_KEYS[score.level])}</span>
          </div>
        </div>
        <div className="flex flex-wrap gap-3">
          <Button variant="secondary" icon="history" onClick={() => navigate(writingHref('history'))}>
            {t('writing.report.history')}
          </Button>
          <Button variant="secondary" icon="list" onClick={() => navigate(writingHref('library'))}>
            {t('writing.report.list')}
          </Button>
          <Button icon="refresh" onClick={() => navigate(writingHref('practice', { topic: topicId }))}>
            {t('writing.report.again')}
          </Button>
        </div>
      </div>

      <div className="grid grid-cols-1 gap-6 lg:grid-cols-2">
        <section className="flex flex-col gap-4 rounded-2xl border border-outline-variant/40 bg-surface-container-lowest p-6 shadow-soft-glow">
          <h2 className="text-body-lg font-semibold text-on-surface">{t('writing.report.dimensions')}</h2>
          {WRITING_DIMENSIONS.map((dimension) => {
            const value = score.dimensions[dimension];
            return (
              <div key={dimension} className="flex flex-col gap-2">
                <div className="flex items-center justify-between text-label-md text-on-surface">
                  <span>{t(DIMENSION_LABEL_KEYS[dimension])}</span>
                  <span className="tabular-nums text-on-surface-variant">{t('writing.report.dimScore', { score: value, max: DIMENSION_MAX })}</span>
                </div>
                <div className="h-2 overflow-hidden rounded-full bg-surface-container-high">
                  <div
                    className="h-full rounded-full bg-primary transition-all duration-500"
                    style={{ width: `${(value / DIMENSION_MAX) * 100}%` }}
                  />
                </div>
              </div>
            );
          })}
        </section>

        <section className="grid grid-cols-1 gap-6 sm:grid-cols-2 lg:grid-cols-1">
          <FeedbackList title={t('writing.report.strengths')} icon="thumb_up" items={score.strengths} tone="success" />
          <FeedbackList title={t('writing.report.issues')} icon="priority_high" items={score.issues} tone="warning" />
        </section>
      </div>

      <section className="flex flex-col gap-4">
        <h2 className="text-body-lg font-semibold text-on-surface">{t('writing.report.corrections')}</h2>
        {score.corrections.map((item) => (
          <article key={`${item.original}-${item.suggestion}`} className="flex flex-col gap-3 rounded-2xl border border-outline-variant/40 bg-surface-container-lowest p-5 shadow-soft-glow">
            <span className="w-fit rounded-full bg-secondary-container/60 px-2.5 py-0.5 text-label-sm text-on-secondary-container">
              {t(CORRECTION_TYPE_LABEL_KEYS[item.type])}
            </span>
            <p className="text-body-md text-error line-through decoration-error/60">{item.original}</p>
            <p className="text-body-md text-tertiary">{item.suggestion}</p>
            <p className="text-body-sm text-on-surface-variant">{item.reason}</p>
          </article>
        ))}
      </section>

      <section className="flex flex-col gap-4 rounded-2xl border border-outline-variant/40 bg-surface-container-lowest p-6 shadow-soft-glow">
        <h2 className="text-body-lg font-semibold text-on-surface">{t('writing.report.highlights')}</h2>
        <ul className="flex flex-col gap-2">
          {score.highlights.map((sentence) => (
            <li key={sentence} className="rounded-xl bg-primary-container/20 px-4 py-3 text-body-md italic text-on-surface">
              {sentence}
            </li>
          ))}
        </ul>
      </section>

      <section className="flex flex-col gap-4 rounded-2xl border border-outline-variant/40 bg-surface-container-lowest p-6 shadow-soft-glow">
        <h2 className="text-body-lg font-semibold text-on-surface">{t('writing.report.modelEssay')}</h2>
        <p className="text-body-md leading-relaxed text-on-surface">{score.modelEssay}</p>
      </section>
    </div>
  );
}

interface FeedbackListProps {
  title: string;
  icon: string;
  items: string[];
  tone: 'success' | 'warning';
}

const FEEDBACK_TONE_CLASS: Record<FeedbackListProps['tone'], string> = {
  success: 'text-tertiary bg-tertiary-container/30',
  warning: 'text-warning bg-warning-container/40',
};

function FeedbackList({ title, icon, items, tone }: FeedbackListProps) {
  return (
    <div className="flex flex-col gap-3 rounded-2xl border border-outline-variant/40 bg-surface-container-lowest p-6 shadow-soft-glow">
      <div className="flex items-center gap-2">
        <span className={`flex h-8 w-8 items-center justify-center rounded-lg ${FEEDBACK_TONE_CLASS[tone]}`}>
          <span className="material-symbols-outlined text-icon-sm" aria-hidden="true">{icon}</span>
        </span>
        <h3 className="text-body-lg font-semibold text-on-surface">{title}</h3>
      </div>
      <ul className="flex list-disc flex-col gap-1.5 pl-5 text-body-sm text-on-surface">
        {items.map((item) => (
          <li key={item}>{item}</li>
        ))}
      </ul>
    </div>
  );
}
