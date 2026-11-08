import { useEffect, type ReactNode } from 'react';
import { useI18n } from '@/i18n';

interface BaseDrawerProps {
  open: boolean;
  title: string;
  onClose: () => void;
  children: ReactNode;
  footer?: ReactNode;
  closeDisabled?: boolean;
}

export function BaseDrawer({ open, title, onClose, children, footer, closeDisabled = false }: BaseDrawerProps) {
  const { t } = useI18n();

  useEffect(() => {
    if (!open) return;
    const handleKey = (event: KeyboardEvent) => {
      if (event.key === 'Escape' && !closeDisabled) onClose();
    };
    document.addEventListener('keydown', handleKey);
    return () => document.removeEventListener('keydown', handleKey);
  }, [open, closeDisabled, onClose]);

  if (!open) return null;

  return (
    <div className="fixed inset-0 z-50 flex justify-end">
      <div
        className="absolute inset-0 bg-on-background/40 backdrop-blur-sm animate-fade-in"
        onClick={closeDisabled ? undefined : onClose}
        aria-hidden="true"
      />
      <aside
        role="dialog"
        aria-modal="true"
        aria-label={title}
        className="relative flex h-full w-full max-w-xl flex-col bg-surface-container-lowest shadow-soft-glow animate-slide-in-right"
      >
        <header className="flex items-center justify-between gap-4 border-b border-outline-variant/40 px-6 py-4">
          <h2 className="text-headline-sm text-on-surface">{title}</h2>
          <button
            type="button"
            onClick={onClose}
            disabled={closeDisabled}
            aria-label={t('common.close')}
            className="flex h-8 w-8 items-center justify-center rounded-full text-on-surface-variant transition-colors hover:bg-surface-container-high disabled:opacity-50"
          >
            <span className="material-symbols-outlined text-icon-md">close</span>
          </button>
        </header>
        <div className="flex-1 overflow-y-auto px-6 py-6">{children}</div>
        {footer && (
          <footer className="flex items-center justify-end gap-3 border-t border-outline-variant/40 px-6 py-4">
            {footer}
          </footer>
        )}
      </aside>
    </div>
  );
}
