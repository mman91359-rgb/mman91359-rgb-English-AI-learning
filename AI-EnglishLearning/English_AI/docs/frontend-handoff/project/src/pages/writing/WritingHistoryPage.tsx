import { useMemo, useState } from 'react';
import { fetchFavoriteIds, fetchSubmissions, fetchWritingTopics, setFavorite } from '@/api/writing';
import { navigate } from '@/admin/router';
import { Button } from '@/components/ui/Button';
import { EmptyState, ErrorState, LoadingState } from '@/components/ui/StateView';
import { useToast } from '@/components/ui/Toast';
import { useI18n } from '@/i18n';
import { useAsync } from '@/lib/useAsync';
import { formatClock } from '@/lib/useCountdown';
import { SCORE_MAX, WRITING_TYPE_META } from '@/lib/writing';
import type { WritingSubmission, WritingTopic } from '@/types/writing';
import { writingHref } from '@/writing/WritingApp';

interface HistoryData {
  submissions: WritingSubmission[];
  favoriteIds: string[];
  topics: WritingTopic[];
}

async function loadHistory(): Promise<HistoryData> {
  const [submissions, favoriteIds, topics] = await Promise.all([
    fetchSubmissions(),
    fetchFavoriteIds(),
    fetchWritingTopics(),
  ]);
  return { submissions, favoriteIds, topics };
}

export function WritingHistoryPage() {
  const { t, locale } = useI18n();
  const { notify } = useToast();
  const history = useAsync(loadHistory, []);
  const [favoriteOverride, setFavoriteOverride] = useState<Record<string, boolean>>({});
  const [favoritesOnly, setFavoritesOnly] = useState(false);

  const topicById = useMemo(
    () => new Map((history.data?.topics ?? []).map((topic) => [topic.id, topic])),
    [history.data],
  );

  const favoriteIds = useMemo(() => {
    const base = new Set(history.data?.favoriteIds ?? []);
    Object.entries(favoriteOverride).forEach(([topicId, favorite]) => {
      if (favorite) base.add(topicId);
      else base.delete(topicId);
    });
    return base;
  }, [history.data, favoriteOverride]);

  const visibleItems = (history.data?.submissions ?? []).filter(
    (item) => !favoritesOnly || favoriteIds.has(item.topicId),
  );

  async function handleToggleFavorite(topicId: string) {
    const next = !favoriteIds.has(topicId);
    setFavoriteOverride((prev) => ({ ...prev, [topicId]: next }));
    try {
      await setFavorite(topicId, next);
    } catch {
      setFavoriteOverride((prev) => ({ ...prev, [topicId]: !next }));
      notify('error', t('writing.library.favoriteFailed'));
    }
  }

  return (
    <section className="flex flex-col gap-8">
      <div className="flex flex-wrap items-end justify-between gap-4">
        <div className="flex flex-col gap-2">
          <h1 className="text-headline-lg text-on-surface">{t('writing.history.title')}</h1>
          <p className="text-body-md text-on-surface-variant">{t('writing.history.desc')}</p>
        </div>
        <Button
          variant={favoritesOnly ? 'primary' : 'secondary'}
          icon={favoritesOnly ? 'favorite' : 'favorite_border'}
          aria-pressed={favoritesOnly}
          onClick={() => setFavoritesOnly((value) => !value)}
        >
          {favoritesOnly ? t('writing.history.showAll') : t('writing.history.favoritesOnly')}
        </Button>
      </div>

      <div className="overflow-hidden rounded-2xl border border-outline-variant/40 bg-surface-container-lowest shadow-soft-glow">
        {history.loading && <LoadingState rows={6} />}
        {!history.loading && history.error != null && <ErrorState error={history.error} onRetry={history.reload} />}
        {!history.loading && history.error == null && visibleItems.length === 0 && (
          <EmptyState title={t(favoritesOnly ? 'writing.history.emptyFavorites' : 'writing.history.empty')} />
        )}
        {!history.loading && history.error == null && visibleItems.length > 0 && (
          <ul className="divide-y divide-outline-variant/40">
            {visibleItems.map((item) => {
              const topic = topicById.get(item.topicId);
              const favorite = favoriteIds.has(item.topicId);
              return (
                <li key={item.id} className="flex flex-col gap-3 p-5 transition-colors hover:bg-surface-container-low md:flex-row md:items-center">
                  <button
                    type="button"
                    onClick={() => navigate(writingHref('report', { submission: item.id }))}
                    className="flex min-w-0 flex-1 items-center gap-4 text-left"
                  >
                    <span className="flex h-10 w-10 shrink-0 items-center justify-center rounded-xl bg-secondary-container/60 text-on-secondary-container">
                      <span className="material-symbols-outlined text-icon-md" aria-hidden="true">
                        {topic ? WRITING_TYPE_META[topic.type].icon : 'edit_note'}
                      </span>
                    </span>
                    <span className="flex min-w-0 flex-col gap-1">
                      <span className="truncate text-body-lg font-semibold text-on-surface">
                        {topic?.title ?? t('writing.history.unknownTopic')}
                      </span>
                      <span className="text-body-sm text-on-surface-variant">
                        {new Date(item.createdAt).toLocaleString(locale)}
                      </span>
                    </span>
                  </button>
                  <div className="flex flex-wrap items-center gap-x-6 gap-y-2 text-body-sm text-on-surface-variant md:justify-end">
                    <span className="tabular-nums">{t('writing.history.words', { count: item.wordCount })}</span>
                    <span className="tabular-nums">{formatClock(item.durationSeconds)}</span>
                    <span className="tabular-nums text-on-surface">{`${item.totalScore} / ${SCORE_MAX}`}</span>
                    <button
                      type="button"
                      aria-pressed={favorite}
                      aria-label={favorite ? t('writing.entry.unfavorite') : t('writing.entry.favorite')}
                      onClick={() => handleToggleFavorite(item.topicId)}
                      className={`flex h-9 w-9 items-center justify-center rounded-xl transition-colors ${
                        favorite ? 'text-error' : 'text-outline hover:bg-surface-container-high hover:text-on-surface'
                      }`}
                    >
                      <span className="material-symbols-outlined text-icon-md" aria-hidden="true">
                        {favorite ? 'favorite' : 'favorite_border'}
                      </span>
                    </button>
                  </div>
                </li>
              );
            })}
          </ul>
        )}
      </div>
    </section>
  );
}
