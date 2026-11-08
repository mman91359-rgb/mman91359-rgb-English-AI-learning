import { useState, type ReactNode } from 'react';
import { AdminSidebar } from '@/components/admin/AdminSidebar';
import { AdminTopbar } from '@/components/admin/AdminTopbar';

interface AdminLayoutProps {
  pathname: string;
  title: string;
  breadcrumb: string;
  children: ReactNode;
}

export function AdminLayout({ pathname, title, breadcrumb, children }: AdminLayoutProps) {
  const [collapsed, setCollapsed] = useState(false);

  return (
    <div className="min-h-screen bg-background">
      <AdminSidebar pathname={pathname} collapsed={collapsed} onToggle={() => setCollapsed((value) => !value)} />
      <div
        className={`flex min-h-screen flex-col transition-[margin] duration-300 ${
          collapsed ? 'ml-admin-sidebar-collapsed' : 'ml-admin-sidebar'
        }`}
      >
        <AdminTopbar breadcrumb={breadcrumb} title={title} />
        <main className="mx-auto w-full max-w-admin-container flex-1 px-6 py-8 xl:px-8">{children}</main>
      </div>
    </div>
  );
}
