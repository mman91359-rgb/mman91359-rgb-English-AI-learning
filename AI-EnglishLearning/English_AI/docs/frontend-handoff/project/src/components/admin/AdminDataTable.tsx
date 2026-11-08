import { Fragment, useState, type ReactNode } from 'react';
import { EmptyState, LoadingState } from '@/components/ui/StateView';
import { useI18n } from '@/i18n';

export interface TableColumn<T> {
  key: string;
  header: string;
  align?: 'left' | 'right' | 'center';
  width?: string;
  render: (row: T) => ReactNode;
}

interface AdminDataTableProps<T> {
  columns: TableColumn<T>[];
  rows: T[];
  rowKey: (row: T) => string | number;
  loading: boolean;
  refreshing?: boolean;
  emptyTitle: string;
  emptyDescription?: string;
  emptyAction?: ReactNode;
  renderExpanded?: (row: T) => ReactNode;
}

const ALIGN_CLASS = { left: 'text-left', right: 'text-right', center: 'text-center' } as const;

/** 通用数据表格：sticky 表头、行高 56px、可选行展开 */
export function AdminDataTable<T>({
  columns,
  rows,
  rowKey,
  loading,
  refreshing = false,
  emptyTitle,
  emptyDescription,
  emptyAction,
  renderExpanded,
}: AdminDataTableProps<T>) {
  const { t } = useI18n();
  const [expandedKey, setExpandedKey] = useState<string | number | null>(null);

  if (loading && rows.length === 0) return <LoadingState rows={6} />;
  if (rows.length === 0) {
    return <EmptyState title={emptyTitle} description={emptyDescription} action={emptyAction} />;
  }

  return (
    <div className={`overflow-x-auto transition-opacity duration-200 ${refreshing ? 'opacity-60' : ''}`}>
      <table className="w-full min-w-[720px] border-collapse text-body-sm">
        <thead className="sticky top-0 z-10 bg-surface-container-low">
          <tr className="text-label-md text-on-surface-variant">
            {renderExpanded && <th className="w-12 px-4 py-3" aria-label={t('table.expand')} />}
            {columns.map((column) => (
              <th
                key={column.key}
                style={column.width ? { width: column.width } : undefined}
                className={`whitespace-nowrap px-4 py-3 font-medium ${ALIGN_CLASS[column.align ?? 'left']}`}
              >
                {column.header}
              </th>
            ))}
          </tr>
        </thead>
        <tbody>
          {rows.map((row) => {
            const key = rowKey(row);
            const expanded = expandedKey === key;
            return (
              <Fragment key={key}>
                <tr
                  className={`h-admin-table-row border-b border-outline-variant/40 transition-colors duration-150 hover:bg-surface-container-low ${
                    expanded ? 'bg-surface-container-low' : ''
                  }`}
                >
                  {renderExpanded && (
                    <td className="px-4">
                      <button
                        type="button"
                        onClick={() => setExpandedKey(expanded ? null : key)}
                        aria-expanded={expanded}
                        aria-label={t('table.expand')}
                        className="flex h-8 w-8 items-center justify-center rounded-full text-on-surface-variant transition-transform duration-200 hover:bg-surface-container-high"
                      >
                        <span className={`material-symbols-outlined text-icon-md transition-transform duration-200 ${expanded ? 'rotate-180' : ''}`}>
                          expand_more
                        </span>
                      </button>
                    </td>
                  )}
                  {columns.map((column) => (
                    <td
                      key={column.key}
                      className={`px-4 py-2 align-middle text-on-surface ${ALIGN_CLASS[column.align ?? 'left']}`}
                    >
                      {column.render(row)}
                    </td>
                  ))}
                </tr>
                {renderExpanded && expanded && (
                  <tr className="border-b border-outline-variant/40 bg-surface-container-low">
                    <td colSpan={columns.length + 1} className="px-6 py-4">
                      {renderExpanded(row)}
                    </td>
                  </tr>
                )}
              </Fragment>
            );
          })}
        </tbody>
      </table>
    </div>
  );
}
