import { useI18n } from '@/i18n';
import { PAGE_SIZE_OPTIONS } from '@/lib/listParams';

interface AdminPaginationProps {
  page: number;
  size: number;
  total: number;
  onPageChange: (page: number) => void;
  onSizeChange: (size: number) => void;
}

/** 服务端分页控件，总数为 0 时隐藏 */
export function AdminPagination({ page, size, total, onPageChange, onSizeChange }: AdminPaginationProps) {
  const { t, locale } = useI18n();
  if (total === 0) return null;

  const pageCount = Math.max(1, Math.ceil(total / size));
  const buttonClass =
    'flex h-9 w-9 items-center justify-center rounded-full text-on-surface-variant transition-colors hover:bg-surface-container-high disabled:cursor-not-allowed disabled:opacity-40';

  return (
    <div className="flex flex-wrap items-center justify-between gap-4 border-t border-outline-variant/40 px-6 py-4">
      <div className="flex items-center gap-3 text-body-sm text-on-surface-variant">
        <span>{t('pagination.total', { total: total.toLocaleString(locale) })}</span>
        <label className="flex items-center gap-2">
          <span>{t('pagination.perPage')}</span>
          <select
            value={size}
            onChange={(event) => onSizeChange(Number(event.target.value))}
            className="h-8 rounded-lg border border-outline-variant bg-surface-container-lowest px-2 text-label-md text-on-surface focus:border-primary focus:outline-none"
          >
            {PAGE_SIZE_OPTIONS.map((option) => (
              <option key={option} value={option}>
                {option}
              </option>
            ))}
          </select>
        </label>
      </div>

      <nav className="flex items-center gap-2" aria-label={t('pagination.label')}>
        <button
          type="button"
          className={buttonClass}
          disabled={page <= 1}
          onClick={() => onPageChange(page - 1)}
          aria-label={t('pagination.prev')}
        >
          <span className="material-symbols-outlined text-icon-md">chevron_left</span>
        </button>
        <span className="min-w-[88px] text-center text-label-md text-on-surface">
          {t('pagination.pageOf', { page, pages: pageCount })}
        </span>
        <button
          type="button"
          className={buttonClass}
          disabled={page >= pageCount}
          onClick={() => onPageChange(page + 1)}
          aria-label={t('pagination.next')}
        >
          <span className="material-symbols-outlined text-icon-md">chevron_right</span>
        </button>
      </nav>
    </div>
  );
}
