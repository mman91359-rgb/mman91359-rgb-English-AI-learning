import { createContext, useCallback, useContext, useMemo, useState, type ReactNode } from 'react';

type ToastTone = 'success' | 'error' | 'info';

interface ToastItem {
  id: number;
  tone: ToastTone;
  message: string;
}

interface ToastContextValue {
  notify: (tone: ToastTone, message: string) => void;
}

const ToastContext = createContext<ToastContextValue | null>(null);
const TOAST_DURATION_MS = 3600;

const TONE_CLASS: Record<ToastTone, { box: string; icon: string }> = {
  success: { box: 'bg-tertiary text-on-tertiary', icon: 'check_circle' },
  error: { box: 'bg-error text-on-error', icon: 'error' },
  info: { box: 'bg-inverse-surface text-inverse-on-surface', icon: 'info' },
};

export function ToastProvider({ children }: { children: ReactNode }) {
  const [items, setItems] = useState<ToastItem[]>([]);

  const notify = useCallback((tone: ToastTone, message: string) => {
    const id = Date.now() + Math.random();
    setItems((prev) => [...prev, { id, tone, message }]);
    window.setTimeout(() => {
      setItems((prev) => prev.filter((item) => item.id !== id));
    }, TOAST_DURATION_MS);
  }, []);

  const value = useMemo(() => ({ notify }), [notify]);

  return (
    <ToastContext.Provider value={value}>
      {children}
      <div className="pointer-events-none fixed bottom-6 right-6 z-[60] flex flex-col gap-3" aria-live="polite">
        {items.map((item) => (
          <div
            key={item.id}
            className={`pointer-events-auto flex max-w-sm items-center gap-3 rounded-xl px-4 py-3 shadow-soft-glow animate-slide-in-right ${TONE_CLASS[item.tone].box}`}
          >
            <span className="material-symbols-outlined text-icon-md">{TONE_CLASS[item.tone].icon}</span>
            <span className="text-body-sm">{item.message}</span>
          </div>
        ))}
      </div>
    </ToastContext.Provider>
  );
}

export function useToast(): ToastContextValue {
  const context = useContext(ToastContext);
  if (!context) throw new Error('useToast must be used within ToastProvider');
  return context;
}
