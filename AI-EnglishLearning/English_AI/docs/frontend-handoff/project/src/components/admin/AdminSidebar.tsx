import { AdminLink } from '@/admin/router';
import { useI18n } from '@/i18n';
import type { MessageKey } from '@/i18n/zh-CN';

interface NavItem {
  path: string;
  labelKey: MessageKey;
  icon: string;
}

interface NavGroup {
  titleKey: MessageKey;
  items: NavItem[];
}

export const NAV_GROUPS: NavGroup[] = [
  {
    titleKey: 'nav.groupOverview',
    items: [{ path: '/admin/overview', labelKey: 'nav.overview', icon: 'dashboard' }],
  },
  {
    titleKey: 'nav.groupUsers',
    items: [{ path: '/admin/users', labelKey: 'nav.users', icon: 'group' }],
  },
  {
    titleKey: 'nav.groupOperations',
    items: [
      { path: '/admin/notices', labelKey: 'nav.notices', icon: 'campaign' },
      { path: '/admin/activities', labelKey: 'nav.activities', icon: 'celebration' },
    ],
  },
  {
    titleKey: 'nav.groupSystem',
    items: [{ path: '/admin/operation-logs', labelKey: 'nav.operationLogs', icon: 'history' }],
  },
  {
    titleKey: 'nav.groupContent',
    items: [{ path: '/admin/questions', labelKey: 'nav.questions', icon: 'fact_check' }],
  },
];

interface AdminSidebarProps {
  pathname: string;
  collapsed: boolean;
  onToggle: () => void;
}

export function AdminSidebar({ pathname, collapsed, onToggle }: AdminSidebarProps) {
  const { t } = useI18n();
  const width = collapsed ? 'w-admin-sidebar-collapsed' : 'w-admin-sidebar';

  return (
    <aside
      className={`fixed inset-y-0 left-0 z-40 flex flex-col border-r border-outline-variant/50 bg-surface-container-lowest transition-[width] duration-300 ${width}`}
    >
      <div className={`flex h-admin-topbar items-center gap-3 px-4 ${collapsed ? 'justify-center' : ''}`}>
        <span className="flex h-10 w-10 shrink-0 items-center justify-center rounded-xl bg-primary text-on-primary">
          <span className="material-symbols-outlined text-icon-md">school</span>
        </span>
        {!collapsed && (
          <div className="flex flex-col">
            <span className="text-label-lg text-primary">Recall-睿考</span>
            <span className="text-label-sm text-on-surface-variant">{t('nav.adminConsole')}</span>
          </div>
        )}
      </div>

      <nav className="flex flex-1 flex-col gap-6 overflow-y-auto px-3 py-4" aria-label={t('nav.adminConsole')}>
        {NAV_GROUPS.map((group) => (
          <div key={group.titleKey} className="flex flex-col gap-1">
            {!collapsed && (
              <span className="px-3 pb-1 text-label-xs uppercase tracking-wider text-outline">{t(group.titleKey)}</span>
            )}
            {group.items.map((item) => {
              const active = pathname === item.path || pathname.startsWith(`${item.path}/`);
              const label = t(item.labelKey);
              return (
                <AdminLink
                  key={item.path}
                  to={item.path}
                  title={collapsed ? label : undefined}
                  aria-current={active ? 'page' : undefined}
                  className={`group flex h-10 items-center gap-3 rounded-xl px-3 text-body-sm transition-all duration-200 hover:translate-x-0.5 ${
                    active
                      ? 'border-l-2 border-primary bg-primary-container/20 font-semibold text-primary'
                      : 'border-l-2 border-transparent text-on-surface-variant hover:bg-surface-container-high hover:text-on-surface'
                  } ${collapsed ? 'justify-center' : ''}`}
                >
                  <span className="material-symbols-outlined text-icon-md transition-transform duration-200 group-hover:scale-110">
                    {item.icon}
                  </span>
                  {!collapsed && <span className="truncate">{label}</span>}
                </AdminLink>
              );
            })}
          </div>
        ))}
      </nav>

      <button
        type="button"
        onClick={onToggle}
        aria-label={collapsed ? t('nav.expand') : t('nav.collapse')}
        className="m-3 flex h-10 items-center justify-center gap-2 rounded-xl text-on-surface-variant transition-colors hover:bg-surface-container-high"
      >
        <span className="material-symbols-outlined text-icon-md">
          {collapsed ? 'chevron_right' : 'chevron_left'}
        </span>
        {!collapsed && <span className="text-label-md">{t('nav.collapse')}</span>}
      </button>
    </aside>
  );
}
