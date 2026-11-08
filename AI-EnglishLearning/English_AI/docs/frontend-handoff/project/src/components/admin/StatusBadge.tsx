export type BadgeTone = 'success' | 'warning' | 'danger' | 'info' | 'neutral';

const TONE_CLASS: Record<BadgeTone, string> = {
  success: 'bg-tertiary/10 text-tertiary',
  warning: 'bg-warning-container text-on-warning-container',
  danger: 'bg-error-container text-on-error-container',
  info: 'bg-secondary-container text-on-secondary-container',
  neutral: 'bg-surface-container-high text-on-surface-variant',
};

interface StatusBadgeProps {
  tone: BadgeTone;
  label: string;
}

/** 统一的状态徽章，所有页面共用同一色板 */
export function StatusBadge({ tone, label }: StatusBadgeProps) {
  return (
    <span className={`inline-flex items-center gap-1 whitespace-nowrap rounded-full px-2.5 py-0.5 text-label-sm ${TONE_CLASS[tone]}`}>
      <span className="h-1.5 w-1.5 rounded-full bg-current" aria-hidden="true" />
      {label}
    </span>
  );
}
