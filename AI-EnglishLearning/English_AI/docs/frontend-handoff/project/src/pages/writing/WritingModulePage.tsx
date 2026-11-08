import { AlignLeft, ArrowLeft, ChevronRight, Heart, History, Play } from 'lucide-react';
import { AdminLink } from '@/admin/router';
import { useI18n } from '@/i18n';
import { LEARNING_CENTER_HREF, writingHref } from '@/writing/WritingApp';

const TAB_CLASS =
  'whitespace-nowrap rounded-full px-6 py-2 font-label-lg text-label-lg transition-colors hover:bg-surface-container hover:text-on-surface';

const LEVEL_CARD_CLASS =
  'flex items-center justify-between rounded-[16px] border-2 border-on-warning/30 bg-surface-container-lowest/15 p-4 transition-all hover:border-on-warning hover:bg-surface-container-lowest/25';

const ENTRY_CARD_CLASS =
  'group flex items-center justify-between rounded-[24px] bg-surface-container-lowest p-6 shadow-[0_4px_20px_rgba(51,58,72,0.05)] transition-colors hover:bg-surface-container-lowest/80';

export function WritingModulePage() {
  const { t } = useI18n();

  const tabs = [
    { key: 'vocabulary', label: t('writing.tabs.vocabulary') },
    { key: 'grammar', label: t('writing.tabs.grammar') },
    { key: 'translation', label: t('writing.tabs.translation') },
    { key: 'listening', label: t('writing.tabs.listening') },
  ];

  return (
    <div className="flex flex-col">
      <a
        href={LEARNING_CENTER_HREF}
        className="mb-6 inline-flex w-fit items-center gap-1 font-label-lg text-label-lg text-on-surface-variant transition-colors hover:text-primary"
      >
        <ArrowLeft size={18} aria-hidden="true" />
        {t('writing.nav.learningCenter')}
      </a>

      <h2 className="mb-8 text-headline-lg text-on-surface">{t('writing.module.pageTitle')}</h2>

      <div className="mb-8 flex gap-2 overflow-x-auto pb-2">
        {tabs.map((tab) => (
          <a key={tab.key} href={LEARNING_CENTER_HREF} className={`${TAB_CLASS} text-on-surface-variant`}>
            {tab.label}
          </a>
        ))}
        <span className="whitespace-nowrap rounded-full bg-on-surface px-6 py-2 font-label-lg text-label-lg text-surface">
          {t('writing.tabs.writing')}
        </span>
      </div>

      <section className="relative mb-8 overflow-hidden rounded-[24px] bg-warning p-8 shadow-soft-glow">
        <div className="pointer-events-none absolute -right-16 -top-16 h-56 w-56 rounded-full bg-warning-container/30 blur-3xl" aria-hidden="true" />
        <div className="relative z-10">
          <h3 className="mb-2 text-headline-md text-on-warning">{t('writing.module.title')}</h3>
          <p className="mb-6 text-body-md text-on-warning/80">{t('writing.module.heroDesc')}</p>

          <div className="mb-6">
            <div className="mb-3 flex items-center gap-1 font-label-lg text-label-lg text-on-warning/90">
              <AlignLeft size={16} aria-hidden="true" />
              {t('writing.library.level')}
            </div>
            <div className="grid grid-cols-1 gap-3 sm:grid-cols-2">
              <AdminLink to={writingHref('library', { level: 'CET4' })} className={LEVEL_CARD_CLASS}>
                <span className="flex flex-col gap-1">
                  <span className="font-label-lg text-label-lg text-on-warning">{t('writing.module.cet4')}</span>
                  <span className="font-label-md text-label-md text-on-warning/70">{t('writing.module.cet4Range')}</span>
                </span>
                <ChevronRight size={20} className="text-on-warning/70" aria-hidden="true" />
              </AdminLink>
              <AdminLink to={writingHref('library', { level: 'CET6' })} className={LEVEL_CARD_CLASS}>
                <span className="flex flex-col gap-1">
                  <span className="font-label-lg text-label-lg text-on-warning">{t('writing.module.cet6')}</span>
                  <span className="font-label-md text-label-md text-on-warning/70">{t('writing.module.cet6Range')}</span>
                </span>
                <ChevronRight size={20} className="text-on-warning/70" aria-hidden="true" />
              </AdminLink>
            </div>
          </div>

          <AdminLink
            to={writingHref('library')}
            className="inline-flex h-12 w-full items-center justify-center gap-2 rounded-[16px] bg-surface-container-lowest px-8 font-label-lg text-label-lg text-warning transition-colors hover:bg-surface-container-lowest/90 sm:w-auto"
          >
            <Play size={18} aria-hidden="true" />
            {t('writing.module.start')}
          </AdminLink>
        </div>
      </section>

      <div className="grid grid-cols-1 gap-gutter md:grid-cols-2">
        <AdminLink to={writingHref('library', { favorites: true })} className={ENTRY_CARD_CLASS}>
          <span className="flex items-center gap-4">
            <span className="flex h-10 w-10 items-center justify-center rounded-full bg-error-container/30">
              <Heart size={20} className="text-error" aria-hidden="true" />
            </span>
            <span className="flex flex-col gap-1">
              <span className="text-body-lg text-on-surface">{t('writing.module.favoritesEntry')}</span>
              <span className="text-body-sm text-on-surface-variant">{t('writing.module.favoritesEntryDesc')}</span>
            </span>
          </span>
          <ChevronRight size={20} className="text-outline transition-transform group-hover:translate-x-0.5" aria-hidden="true" />
        </AdminLink>

        <AdminLink to={writingHref('history')} className={ENTRY_CARD_CLASS}>
          <span className="flex items-center gap-4">
            <span className="flex h-10 w-10 items-center justify-center rounded-full bg-tertiary-container/30">
              <History size={20} className="text-tertiary" aria-hidden="true" />
            </span>
            <span className="flex flex-col gap-1">
              <span className="text-body-lg text-on-surface">{t('writing.module.historyEntry')}</span>
              <span className="text-body-sm text-on-surface-variant">{t('writing.module.historyEntryDesc')}</span>
            </span>
          </span>
          <ChevronRight size={20} className="text-outline transition-transform group-hover:translate-x-0.5" aria-hidden="true" />
        </AdminLink>
      </div>
    </div>
  );
}
