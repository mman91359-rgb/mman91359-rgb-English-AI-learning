import type { ReactNode } from 'react';
import { useLocation } from '@/admin/router';
import { AdminLayout } from '@/components/admin/AdminLayout';
import { EmptyState } from '@/components/ui/StateView';
import { ToastProvider } from '@/components/ui/Toast';
import { I18nProvider, useI18n } from '@/i18n';
import type { MessageKey } from '@/i18n/zh-CN';
import { ActivitiesPage } from '@/pages/admin/ActivitiesPage';
import { NoticesPage } from '@/pages/admin/NoticesPage';
import { OperationLogsPage } from '@/pages/admin/OperationLogsPage';
import { OverviewPage } from '@/pages/admin/OverviewPage';
import { QuestionsPage } from '@/pages/admin/QuestionsPage';
import { UserDetailPage } from '@/pages/admin/UserDetailPage';
import { UsersPage } from '@/pages/admin/UsersPage';

interface ResolvedRoute {
  titleKey: MessageKey;
  element: ReactNode;
}

const USER_DETAIL_PATTERN = /^\/admin\/users\/(\d+)$/;

function resolveRoute(pathname: string): ResolvedRoute {
  const path = pathname.replace(/\/+$/, '') || '/';

  const userDetail = USER_DETAIL_PATTERN.exec(path);
  if (userDetail) {
    return { titleKey: 'nav.userDetail', element: <UserDetailPage userId={Number(userDetail[1])} /> };
  }

  switch (path) {
    case '/admin':
    case '/admin/overview':
      return { titleKey: 'nav.overview', element: <OverviewPage /> };
    case '/admin/users':
      return { titleKey: 'nav.users', element: <UsersPage /> };
    case '/admin/notices':
      return { titleKey: 'nav.notices', element: <NoticesPage /> };
    case '/admin/activities':
      return { titleKey: 'nav.activities', element: <ActivitiesPage /> };
    case '/admin/operation-logs':
      return { titleKey: 'nav.operationLogs', element: <OperationLogsPage /> };
    case '/admin/questions':
      return { titleKey: 'nav.questions', element: <QuestionsPage /> };
    default:
      return { titleKey: 'nav.notFound', element: <NotFound /> };
  }
}

function NotFound() {
  const { t } = useI18n();
  return <EmptyState title={t('state.notFoundTitle')} description={t('state.notFoundDesc')} />;
}

function AdminShell() {
  const { pathname } = useLocation();
  const { t } = useI18n();
  const route = resolveRoute(pathname);

  return (
    <AdminLayout pathname={pathname} title={t(route.titleKey)} breadcrumb={t('nav.adminConsole')}>
      {route.element}
    </AdminLayout>
  );
}

export function AdminApp() {
  return (
    <I18nProvider>
      <ToastProvider>
        <AdminShell />
      </ToastProvider>
    </I18nProvider>
  );
}
