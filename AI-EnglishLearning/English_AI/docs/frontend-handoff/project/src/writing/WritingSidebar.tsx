import { BarChart3, GraduationCap, House, LogOut, Settings, User, type LucideIcon } from 'lucide-react';
import { useI18n } from '@/i18n';
import { LEARNING_CENTER_HREF } from '@/writing/WritingApp';

const HOME_HREF = '/src/pages/index.html';

const ITEM_BASE_CLASS = 'flex items-center gap-4 rounded-xl px-4 py-3 font-label-lg text-label-lg transition-colors';
const ITEM_ACTIVE_CLASS = `${ITEM_BASE_CLASS} border-l-2 border-primary bg-primary-container/10 text-primary`;
const ITEM_IDLE_CLASS = `${ITEM_BASE_CLASS} text-on-surface-variant hover:bg-primary-container/10 hover:text-primary`;
const ITEM_DISABLED_CLASS = `${ITEM_BASE_CLASS} cursor-not-allowed text-on-surface-variant/50`;

interface SidebarItem {
  key: string;
  label: string;
  icon: LucideIcon;
  href?: string;
}

export function WritingSidebar() {
  const { t } = useI18n();

  const mainItems: SidebarItem[] = [
    { key: 'home', label: t('writing.sidebar.home'), icon: House, href: HOME_HREF },
    { key: 'stats', label: t('writing.sidebar.stats'), icon: BarChart3 },
    { key: 'learning', label: t('writing.nav.learningCenter'), icon: GraduationCap, href: LEARNING_CENTER_HREF },
    { key: 'profile', label: t('writing.sidebar.profile'), icon: User },
  ];
  const footerItems: SidebarItem[] = [
    { key: 'settings', label: t('writing.sidebar.settings'), icon: Settings },
    { key: 'logout', label: t('writing.sidebar.logout'), icon: LogOut },
  ];
  const activeKey = 'learning';
  const comingSoonTitle = t('writing.sidebar.comingSoon');

  return (
    <>
      <aside className="fixed left-0 top-0 z-50 hidden h-screen w-[280px] flex-col border-r border-outline-variant bg-surface px-4 py-8 md:flex">
        <div className="mb-10 flex items-center gap-2 px-4">
          <GraduationCap size={28} className="text-primary" aria-hidden="true" />
          <span className="text-headline-md font-bold text-primary">Recall-睿考</span>
        </div>

        <nav className="flex flex-1 flex-col gap-2" aria-label="Recall-睿考">
          {mainItems.map((item) => (
            <SidebarLink key={item.key} item={item} active={item.key === activeKey} comingSoonTitle={comingSoonTitle} />
          ))}
        </nav>

        <div className="mt-auto flex flex-col gap-2 border-t border-outline-variant/30 pt-8">
          {footerItems.map((item) => (
            <SidebarLink key={item.key} item={item} active={false} comingSoonTitle={comingSoonTitle} />
          ))}
        </div>
      </aside>

      <nav
        className="fixed bottom-0 left-0 right-0 z-50 border-t border-outline-variant bg-surface pb-[env(safe-area-inset-bottom)] md:hidden"
        aria-label="Recall-睿考"
      >
        <div className="flex h-16 items-center justify-around">
          {mainItems.map((item) => {
            const Icon = item.icon;
            const active = item.key === activeKey;
            const content = (
              <>
                <Icon size={22} aria-hidden="true" />
                <span className={`text-label-md ${active ? 'font-bold' : ''}`}>{item.label}</span>
              </>
            );
            const className = `flex flex-col items-center gap-1 ${active ? 'text-primary' : 'text-on-surface-variant'}`;
            return item.href ? (
              <a key={item.key} href={item.href} className={className} aria-current={active ? 'page' : undefined}>
                {content}
              </a>
            ) : (
              <span key={item.key} className={`${className} opacity-50`} aria-disabled="true" title={comingSoonTitle}>
                {content}
              </span>
            );
          })}
        </div>
      </nav>
    </>
  );
}

function SidebarLink({ item, active, comingSoonTitle }: { item: SidebarItem; active: boolean; comingSoonTitle: string }) {
  const Icon = item.icon;
  const content = (
    <>
      <Icon size={22} aria-hidden="true" />
      {item.label}
    </>
  );

  if (item.href) {
    return (
      <a href={item.href} className={active ? ITEM_ACTIVE_CLASS : ITEM_IDLE_CLASS} aria-current={active ? 'page' : undefined}>
        {content}
      </a>
    );
  }

  return (
    <span className={ITEM_DISABLED_CLASS} aria-disabled="true" title={comingSoonTitle}>
      {content}
    </span>
  );
}
