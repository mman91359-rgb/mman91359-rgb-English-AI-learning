import { clearAdminSession } from '@/api/admin';
import { useTheme } from '@/lib/useTheme';
import { useI18n } from '@/i18n';

interface AdminTopbarProps {
  breadcrumb: string;
  title: string;
}

export function AdminTopbar({ breadcrumb, title }: AdminTopbarProps) {
  const { t, locale, setLocale } = useI18n();
  const { dark, toggleTheme } = useTheme();

  const handleLogout = () => {
    clearAdminSession();
    window.location.assign('/');
  };

  return (
    <header className="sticky top-0 z-30 flex h-admin-topbar items-center gap-4 border-b border-outline-variant/50 bg-surface/90 px-6 backdrop-blur-md">
      <div className="flex min-w-0 flex-1 flex-col">
        <span className="truncate text-label-sm text-on-surface-variant">{breadcrumb}</span>
        <h1 className="truncate text-headline-sm text-on-surface">{title}</h1>
      </div>

      <button
        type="button"
        onClick={() => setLocale(locale === 'zh-CN' ? 'en-US' : 'zh-CN')}
        className="flex h-9 items-center gap-1 rounded-full px-3 text-label-md text-on-surface-variant transition-colors hover:bg-surface-container-high"
        aria-label={t('topbar.switchLocale')}
      >
        <span className="material-symbols-outlined text-icon-md">translate</span>
        {locale === 'zh-CN' ? 'EN' : '中文'}
      </button>

      <button
        type="button"
        onClick={toggleTheme}
        aria-label={t('topbar.toggleTheme')}
        className="flex h-9 w-9 items-center justify-center rounded-full text-on-surface-variant transition-all duration-200 hover:rotate-12 hover:bg-surface-container-high"
      >
        <span className="material-symbols-outlined text-icon-md">{dark ? 'light_mode' : 'dark_mode'}</span>
      </button>

      <div className="flex items-center gap-3 border-l border-outline-variant/50 pl-4">
        <span className="flex h-9 w-9 items-center justify-center rounded-full bg-primary-container text-on-primary-container">
          <span className="material-symbols-outlined text-icon-md">admin_panel_settings</span>
        </span>
        <div className="hidden flex-col sm:flex">
          <span className="text-label-md text-on-surface">{t('topbar.adminRole')}</span>
          <span className="text-label-sm text-on-surface-variant">ROLE_ADMIN</span>
        </div>
        <button
          type="button"
          onClick={handleLogout}
          aria-label={t('topbar.logout')}
          title={t('topbar.logout')}
          className="flex h-9 w-9 items-center justify-center rounded-full text-on-surface-variant transition-colors hover:bg-error-container hover:text-on-error-container"
        >
          <span className="material-symbols-outlined text-icon-md">logout</span>
        </button>
      </div>
    </header>
  );
}
