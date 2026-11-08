import { useMemo, useState } from 'react';
import { fetchDraftTopicIds, fetchFavoriteIds, fetchWritingTopics, setFavorite } from '@/api/writing';
import { navigate } from '@/admin/router';
import { EmptyState, ErrorState, LoadingState } from '@/components/ui/StateView';
import { useToast } from '@/components/ui/Toast';
import { useI18n } from '@/i18n';
import { useAsync } from '@/lib/useAsync';
import { WRITING_LEVEL_LABEL_KEYS, WRITING_LEVELS, WRITING_TYPE_META, WRITING_TYPES } from '@/lib/writing';
import type { WritingLevel, WritingTopic, WritingTopicType } from '@/types/writing';
import { writingHref } from '@/writing/WritingApp';
import { WritingTopicCard } from '@/pages/writing/WritingTopicCard';

interface LibraryData {
  topics: WritingTopic[];
  favoriteIds: string[];
  draftTopicIds: string[];
}

async function loadLibrary(): Promise<LibraryData> {
  const [topics, favoriteIds, draftTopicIds] = await Promise.all([
    fetchWritingTopics(),
    fetchFavoriteIds(),
    fetchDraftTopicIds(),
  ]);
  return { topics, favoriteIds, draftTopicIds };
}

interface WritingLibraryPageProps {
  level?: WritingLevel;
  favoritesOnly: boolean;
}

export function WritingLibraryPage({ level, favoritesOnly }: WritingLibraryPageProps) {
  const { t } = useI18n();
  const { notify } = useToast();
  const library = useAsync(loadLibrary, []);
  const [favoriteOverride, setFavoriteOverride] = useState<string[] | null>(null);

  const favoriteIds = favoriteOverride ?? library.data?.favoriteIds ?? [];

  const groups = useMemo(() => {
    const topics = (library.data?.topics ?? []).filter((topic) => {
      if (level && topic.level !== level) return false;
      if (favoritesOnly && !favoriteIds.includes(topic.id)) return false;
      return true;
    });
    return WRITING_TYPES.map((type) => ({
      type,
      topics: topics.filter((topic) => topic.type === type),
    })).filter((group) => group.topics.length > 0);
  }, [library.data, level, favoritesOnly, favoriteIds]);

  async function toggleFavorite(topicId: string) {
    const next = !favoriteIds.includes(topicId);
    const previous = favoriteIds;
    setFavoriteOverride(next ? [...previous, topicId] : previous.filter((id) => id !== topicId));
    try {
      await setFavorite(topicId, next);
    } catch {
      setFavoriteOverride(previous);
      notify('error', t('writing.library.favoriteFailed'));
    }
  }

  function changeFilter(patch: { level?: WritingLevel; favorites?: boolean }) {
    navigate(
      writingHref('library', {
        level: 'level' in patch ? patch.level : level,
        favorites: 'favorites' in patch ? patch.favorites : favoritesOnly,
      }),
    );
  }

  if (library.loading) return <LoadingState rows={8} />;
  if (library.error != null) return <ErrorState error={library.error} onRetry={library.reload} />;

  const draftTopicIds = library.data?.draftTopicIds ?? [];

  return (
    <section className="flex flex-col gap-8">
      <div className="flex flex-col gap-6">
        <div className="flex flex-col gap-2">
          <h1 className="text-headline-lg text-on-surface">{t('writing.library.title')}</h1>
          <p className="text-body-md text-on-surface-variant">{t('writing.library.desc')}</p>
        </div>

        <div className="flex flex-wrap items-center gap-3 rounded-2xl border border-outline-variant/40 bg-surface-container-lowest p-3 shadow-soft-glow">
          <div role="group" aria-label={t('writing.library.level')} className="flex items-center gap-1 rounded-xl bg-surface-container p-1">
            <LevelButton active={!level} onClick={() => changeFilter({ level: undefined })}>
              {t('writing.library.all')}
            </LevelButton>
            {WRITING_LEVELS.map((item) => (
              <LevelButton key={item} active={level === item} onClick={() => changeFilter({ level: item })}>
                {t(WRITING_LEVEL_LABEL_KEYS[item])}
              </LevelButton>
            ))}
          </div>
          <button
            type="button"
            aria-pressed={favoritesOnly}
            onClick={() => changeFilter({ favorites: !favoritesOnly })}
            className={`inline-flex h-10 items-center gap-2 rounded-xl px-4 text-label-lg transition-colors ${
              favoritesOnly
                ? 'bg-error-container/50 text-on-error-container'
                : 'text-on-surface-variant hover:bg-surface-container-high hover:text-on-surface'
            }`}
          >
            <span className="material-symbols-outlined text-icon-sm" aria-hidden="true">
              {favoritesOnly ? 'favorite' : 'favorite_border'}
            </span>
            {t('writing.library.favoritesOnly')}
          </button>
        </div>
      </div>

      {groups.length === 0 && <EmptyState title={t(favoritesOnly ? 'writing.library.emptyFavorites' : 'writing.library.empty')} />}

      {groups.map((group) => (
        <TopicGroup
          key={group.type}
          type={group.type}
          topics={group.topics}
          favoriteIds={favoriteIds}
          draftTopicIds={draftTopicIds}
          onToggleFavorite={toggleFavorite}
        />
      ))}
    </section>
  );
}

interface LevelButtonProps {
  active: boolean;
  onClick: () => void;
  children: string;
}

function LevelButton({ active, onClick, children }: LevelButtonProps) {
  return (
    <button
      type="button"
      aria-pressed={active}
      onClick={onClick}
      className={`h-8 rounded-lg px-4 text-label-lg transition-all ${
        active ? 'bg-surface-container-lowest text-primary shadow-soft-glow' : 'text-on-surface-variant hover:text-on-surface'
      }`}
    >
      {children}
    </button>
  );
}

interface TopicGroupProps {
  type: WritingTopicType;
  topics: WritingTopic[];
  favoriteIds: string[];
  draftTopicIds: string[];
  onToggleFavorite: (topicId: string) => void;
}

function TopicGroup({ type, topics, favoriteIds, draftTopicIds, onToggleFavorite }: TopicGroupProps) {
  const { t } = useI18n();
  const meta = WRITING_TYPE_META[type];

  return (
    <section className="flex flex-col gap-4">
      <header className="flex items-center gap-4 border-b border-outline-variant/40 pb-4">
        <span className="flex h-12 w-12 items-center justify-center rounded-2xl bg-secondary-container/60 text-on-secondary-container">
          <span className="material-symbols-outlined text-icon-lg" aria-hidden="true">{meta.icon}</span>
        </span>
        <div className="flex min-w-0 flex-1 flex-col gap-0.5">
          <h2 className="text-body-lg font-semibold text-on-surface">{t(meta.labelKey)}</h2>
          <p className="text-body-sm text-on-surface-variant">{t(meta.descKey)}</p>
        </div>
        <span className="rounded-full bg-surface-container-high px-3 py-1 text-label-md text-on-surface-variant">
          {t('writing.library.count', { count: topics.length })}
        </span>
      </header>
      <div className="grid grid-cols-1 gap-4 md:grid-cols-2">
        {topics.map((topic, index) => (
          <WritingTopicCard
            key={topic.id}
            index={index + 1}
            topic={topic}
            favorite={favoriteIds.includes(topic.id)}
            hasDraft={draftTopicIds.includes(topic.id)}
            onToggleFavorite={() => onToggleFavorite(topic.id)}
            onStart={() => navigate(writingHref('practice', { topic: topic.id }))}
          />
        ))}
      </div>
    </section>
  );
}
