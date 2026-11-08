import { useI18n } from '@/i18n';
import { Button } from '@/components/ui/Button';
import { formatClock } from '@/lib/useCountdown';
import { LEVEL_WORD_RANGE, SCORING_STEP_KEYS, WRITING_LEVEL_LABEL_KEYS, WRITING_TYPE_META } from '@/lib/writing';
import type { WritingTopic } from '@/types/writing';

export type DraftSaveStatus = 'idle' | 'saving' | 'saved' | 'error';

const RULED_LINE_HEIGHT_PX = 40;

interface WritingAnswerSheetProps {
  topic: WritingTopic;
  content: string;
  onContentChange: (value: string) => void;
  remaining: number;
  wordCount: number;
  savedAt: string | null;
  saveStatus: DraftSaveStatus;
  scoring: boolean;
  scoringStep: number;
  onSubmit: () => void;
  onBack: () => void;
}

const ruledLines = {
  backgroundImage: `linear-gradient(to bottom, transparent ${RULED_LINE_HEIGHT_PX - 1}px, rgb(var(--outline-variant) / 0.7) ${RULED_LINE_HEIGHT_PX - 1}px, rgb(var(--outline-variant) / 0.7) ${RULED_LINE_HEIGHT_PX}px)`,
  backgroundSize: `100% ${RULED_LINE_HEIGHT_PX}px`,
};

export function WritingAnswerSheet({
  topic,
  content,
  onContentChange,
  remaining,
  wordCount,
  savedAt,
  saveStatus,
  scoring,
  scoringStep,
  onSubmit,
  onBack,
}: WritingAnswerSheetProps) {
  const { t } = useI18n();
  const [minWords, maxWords] = topic.wordRange ?? LEVEL_WORD_RANGE[topic.level];
  const timeUp = remaining <= 0;
  const stepIndex = Math.min(scoringStep, SCORING_STEP_KEYS.length - 1);

  return (
    <div className="mx-auto w-full max-w-4xl">
      <div className="mb-4 flex items-center justify-between gap-3">
        <Button variant="ghost" icon="arrow_back" onClick={onBack}>
          {t('writing.practice.back')}
        </Button>
        <span className="text-label-md text-on-surface-variant">
          {saveStatus === 'saving' && t('writing.practice.saving')}
          {saveStatus === 'saved' && savedAt && t('writing.practice.saved')}
          {saveStatus === 'error' && t('writing.practice.saveFailed')}
        </span>
      </div>

      <div className="rounded-3xl bg-surface-container p-4 shadow-soft-glow md:p-8">
        <article className="rounded-sm border-2 border-outline bg-surface-container-lowest p-5 text-on-surface md:p-10 dark:bg-surface">
          <header className="text-center">
            <p className="text-label-md tracking-[0.3em] text-on-surface-variant">{t('writing.paper.subtitle')}</p>
            <h1 className="mt-2 text-headline-md font-semibold text-on-surface">{t('writing.paper.title')}</h1>
          </header>

          <dl className="mt-6 grid grid-cols-2 border border-outline md:grid-cols-4 [&>div]:border-b [&>div]:border-r [&>div]:border-outline [&>div]:px-3 [&>div]:py-2">
            <div>
              <dt className="text-label-sm text-on-surface-variant">{t('writing.paper.level')}</dt>
              <dd className="text-body-sm font-semibold">{t(WRITING_LEVEL_LABEL_KEYS[topic.level])}</dd>
            </div>
            <div>
              <dt className="text-label-sm text-on-surface-variant">{t('writing.paper.type')}</dt>
              <dd className="text-body-sm font-semibold">{t(WRITING_TYPE_META[topic.type].labelKey)}</dd>
            </div>
            <div>
              <dt className="text-label-sm text-on-surface-variant">{t('writing.paper.suggested')}</dt>
              <dd className="text-body-sm font-semibold tabular-nums">{t('writing.entry.words', { min: minWords, max: maxWords })}</dd>
            </div>
            <div>
              <dt className="text-label-sm text-on-surface-variant">{t('writing.paper.timeLeft')}</dt>
              <dd className={`font-mono text-body-sm font-semibold tabular-nums ${timeUp ? 'text-error' : ''}`}>
                {formatClock(Math.max(remaining, 0))}
              </dd>
            </div>
          </dl>

          <section className="mt-6">
            <h2 className="text-label-md font-semibold text-on-surface-variant">{t('writing.paper.prompt')}</h2>
            <h3 className="mt-2 text-center text-body-lg font-semibold">{topic.title}</h3>
            <p className="mt-3 whitespace-pre-line text-body-md leading-[150%] text-on-surface-variant">{topic.directions}</p>
          </section>

          <section className="mt-8">
            <h2 className="text-label-md font-semibold text-on-surface-variant">{t('writing.paper.body')}</h2>
            {scoring ? (
              <ol className="mt-4 space-y-3 rounded-sm border border-dashed border-outline p-6">
                {SCORING_STEP_KEYS.map((key, index) => (
                  <li
                    key={key}
                    className={`flex items-center gap-3 text-body-md ${index <= stepIndex ? 'text-on-surface' : 'text-outline'}`}
                  >
                    <span className="material-symbols-outlined text-icon-sm" aria-hidden="true">
                      {index < stepIndex ? 'check_circle' : index === stepIndex ? 'progress_activity' : 'radio_button_unchecked'}
                    </span>
                    {t(key)}
                  </li>
                ))}
              </ol>
            ) : (
              <div className="mt-3 border-l-2 border-error/50 pl-4 md:pl-6">
                <textarea
                  value={content}
                  onChange={(event) => onContentChange(event.target.value)}
                  disabled={timeUp}
                  placeholder={t('writing.practice.placeholder')}
                  aria-label={t('writing.paper.body')}
                  style={ruledLines}
                  className="block min-h-[640px] w-full resize-y bg-transparent font-serif text-body-md leading-[40px] text-on-surface placeholder:text-outline focus:outline-none disabled:opacity-70"
                />
              </div>
            )}
          </section>

          {!scoring && (
            <footer className="mt-6 flex flex-col-reverse items-stretch gap-3 border-t border-outline pt-4 sm:flex-row sm:items-center sm:justify-between">
              <span className="text-label-md tabular-nums text-on-surface-variant">
                {t('writing.practice.wordCount', { count: wordCount })}
              </span>
              <Button variant="primary" icon="send" onClick={onSubmit} disabled={wordCount === 0}>
                {t('writing.practice.submit')}
              </Button>
            </footer>
          )}
        </article>
      </div>
    </div>
  );
}
