import { LEVEL_WORD_RANGE, WRITING_LEVEL_LABEL_KEYS } from '@/lib/writing';
import { useI18n } from '@/i18n';
import type { WritingTopic } from '@/types/writing';

interface WritingTopicCardProps {
  index: number;
  topic: WritingTopic;
  favorite: boolean;
  hasDraft: boolean;
  onToggleFavorite: () => void;
  onStart: () => void;
}

export function WritingTopicCard({ index, topic, favorite, hasDraft, onToggleFavorite, onStart }: WritingTopicCardProps) {
  const { t } = useI18n();
  const [minWords, maxWords] = topic.wordRange ?? LEVEL_WORD_RANGE[topic.level];

  return (
    <article className="group flex flex-col gap-4 rounded-2xl border border-outline-variant/40 bg-surface-container-lowest p-5 shadow-soft-glow transition-all duration-300 hover:-translate-y-0.5 hover:border-primary/30">
      <div className="flex items-start justify-between gap-3">
        <div className="flex flex-wrap items-center gap-2">
          <span className="font-mono text-label-md tabular-nums text-outline">No.{String(index).padStart(2, '0')}</span>
          <span className="rounded-full bg-primary-container/40 px-2.5 py-0.5 text-label-sm text-on-primary-container">
            {t(WRITING_LEVEL_LABEL_KEYS[topic.level])}
          </span>
          {hasDraft && (
            <span className="rounded-full bg-warning-container/50 px-2.5 py-0.5 text-label-sm text-on-warning-container">
              {t('writing.library.draft')}
            </span>
          )}
        </div>
        <button
          type="button"
          aria-pressed={favorite}
          aria-label={favorite ? t('writing.entry.unfavorite') : t('writing.entry.favorite')}
          onClick={onToggleFavorite}
          className={`flex h-9 w-9 shrink-0 items-center justify-center rounded-xl transition-colors ${
            favorite ? 'text-error' : 'text-outline hover:bg-surface-container-high hover:text-on-surface'
          }`}
        >
          <span className="material-symbols-outlined text-icon-md" aria-hidden="true">
            {favorite ? 'favorite' : 'favorite_border'}
          </span>
        </button>
      </div>

      <h3 className="text-body-lg font-semibold text-on-surface">{topic.title}</h3>
      <p className="line-clamp-2 text-body-sm text-on-surface-variant">{topic.directions}</p>

      <div className="mt-auto flex items-center justify-between gap-3 border-t border-outline-variant/40 pt-4">
        <div className="flex flex-wrap items-center gap-3 text-label-md text-on-surface-variant">
          <span className="inline-flex items-center gap-1">
            <span className="material-symbols-outlined text-icon-sm" aria-hidden="true">notes</span>
            {t('writing.entry.words', { min: minWords, max: maxWords })}
          </span>
          <span className="inline-flex items-center gap-1">
            <span className="material-symbols-outlined text-icon-sm" aria-hidden="true">timer</span>
            {t('writing.entry.minutes', { minutes: Math.round(topic.timeLimitSeconds / 60) })}
          </span>
        </div>
        <button
          type="button"
          onClick={onStart}
          className="inline-flex h-9 shrink-0 items-center gap-1 rounded-xl bg-primary px-3.5 text-label-lg text-on-primary shadow-soft-glow transition-all hover:bg-primary/90 active:scale-[0.98]"
        >
          {t('writing.library.practice')}
          <span className="material-symbols-outlined text-icon-sm transition-transform group-hover:translate-x-0.5" aria-hidden="true">arrow_forward</span>
        </button>
      </div>
    </article>
  );
}
