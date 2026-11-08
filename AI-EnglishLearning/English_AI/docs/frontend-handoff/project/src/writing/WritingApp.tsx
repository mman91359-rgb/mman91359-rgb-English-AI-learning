import { ArrowLeft, PenLine } from 'lucide-react';
import { AdminLink, useLocation } from '@/admin/router';
import { ToastProvider } from '@/components/ui/Toast';
import { I18nProvider, useI18n } from '@/i18n';
import { WritingHistoryPage } from '@/pages/writing/WritingHistoryPage';
import { WritingLibraryPage } from '@/pages/writing/WritingLibraryPage';
import { WritingModulePage } from '@/pages/writing/WritingModulePage';
import { WritingPracticePage } from '@/pages/writing/WritingPracticePage';
import { WritingReportPage } from '@/pages/writing/WritingReportPage';
import type { WritingLevel } from '@/types/writing';
import { WritingSidebar } from '@/writing/WritingSidebar';

export type WritingView = 'module' | 'library' | 'practice' | 'report' | 'history';

export const LEARNING_CENTER_HREF = '/src/pages/leaning_center.html';

interface WritingHrefOptions {
  topic?: string;
  submission?: string;
  level?: WritingLevel;
  favorites?: boolean;
}

/** 写作模块路径统一为 /writing，子视图通过查询参数切换，刷新与分享保持状态 */
export function writingHref(view: WritingView, options: WritingHrefOptions = {}): string {
  const params = new URLSearchParams();
  if (view !== 'module') params.set('view', view);
  if (options.topic) params.set('topic', options.topic);
  if (options.submission) params.set('submission', options.submission);
  if (options.level) params.set('level', options.level);
  if (options.favorites) params.set('favorites', '1');
  const text = params.toString();
  return text ? `/writing?${text}` : '/writing';
}

function parseView(value: string | null): WritingView {
  if (value === 'library' || value === 'practice' || value === 'report' || value === 'history') return value;
  return 'module';
}

function WritingShell() {
  const { search } = useLocation();
  const { t } = useI18n();
  const params = new URLSearchParams(search);
  const view = parseView(params.get('view'));
  const topicId = params.get('topic') ?? '';
  const submissionId = params.get('submission') ?? '';
  const levelParam = params.get('level');
  const level: WritingLevel | undefined = levelParam === 'CET4' || levelParam === 'CET6' ? levelParam : undefined;
  const favoritesOnly = params.get('favorites') === '1';

  const navClass = (active: boolean) =>
    `inline-flex h-10 items-center gap-2 rounded-xl px-4 text-label-lg transition-colors ${
      active
        ? 'bg-primary-container/40 text-on-primary-container'
        : 'text-on-surface-variant hover:bg-surface-container-high hover:text-on-surface'
    }`;

  if (view === 'module') {
    return (
      <div className="min-h-screen bg-background text-on-background">
        <WritingSidebar />
        <main className="px-6 pb-28 pt-10 md:ml-[280px] md:pb-10">
          <div className="mx-auto max-w-[1200px]">
            <WritingModulePage />
          </div>
        </main>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-background text-on-background">
      <header className="sticky top-0 z-40 border-b border-outline-variant/40 bg-surface/90 backdrop-blur-md">
        <div className="mx-auto flex h-20 max-w-[1200px] items-center gap-4 px-6">
          <a
            href={LEARNING_CENTER_HREF}
            className="inline-flex h-10 items-center gap-1 rounded-xl px-2 text-label-lg text-on-surface-variant transition-colors hover:bg-surface-container-high hover:text-on-surface"
          >
            <ArrowLeft size={18} aria-hidden="true" />
            {t('writing.nav.learningCenter')}
          </a>
          <span className="flex h-10 w-10 items-center justify-center rounded-full bg-primary-container/40 text-on-primary-container">
            <PenLine size={20} aria-hidden="true" />
          </span>
          <span className="text-headline-sm text-on-surface">{t('writing.nav.title')}</span>
          <nav className="ml-auto flex items-center gap-2" aria-label={t('writing.nav.title')}>
            <AdminLink to={writingHref('library')} className={navClass(view === 'library' || view === 'practice' || view === 'report')}>
              <span className="material-symbols-outlined text-icon-sm" aria-hidden="true">edit_note</span>
              {t('writing.nav.library')}
            </AdminLink>
            <AdminLink to={writingHref('history')} className={navClass(view === 'history')}>
              <span className="material-symbols-outlined text-icon-sm" aria-hidden="true">history</span>
              {t('writing.nav.history')}
            </AdminLink>
          </nav>
        </div>
      </header>

      <main className="mx-auto max-w-[1200px] px-6 py-10">
        {view === 'library' && <WritingLibraryPage level={level} favoritesOnly={favoritesOnly} />}
        {view === 'practice' && <WritingPracticePage topicId={topicId} />}
        {view === 'report' && <WritingReportPage submissionId={submissionId} />}
        {view === 'history' && <WritingHistoryPage />}
      </main>
    </div>
  );
}

export function WritingApp() {
  return (
    <I18nProvider>
      <ToastProvider>
        <WritingShell />
      </ToastProvider>
    </I18nProvider>
  );
}
