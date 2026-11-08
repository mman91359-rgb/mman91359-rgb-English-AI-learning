export type StatTone = 'primary' | 'secondary' | 'tertiary' | 'warning' | 'error';

const TONE_CLASS: Record<StatTone, string> = {
  primary: 'bg-primary-container text-on-primary-container',
  secondary: 'bg-secondary-container text-on-secondary-container',
  tertiary: 'bg-tertiary-container text-on-tertiary-container',
  warning: 'bg-warning-container text-on-warning-container',
  error: 'bg-error-container text-on-error-container',
};

interface AdminStatCardProps {
  icon: string;
  label: string;
  value: string;
  hint?: string;
  tone?: StatTone;
}

export function AdminStatCard({ icon, label, value, hint, tone = 'primary' }: AdminStatCardProps) {
  return (
    <div className="group flex flex-col gap-4 rounded-[16px] border border-outline-variant/40 bg-surface-container-lowest p-6 shadow-soft-glow transition-all duration-300 hover:-translate-y-0.5 hover:border-primary/30">
      <div className="flex items-center justify-between">
        <span className="text-label-md text-on-surface-variant">{label}</span>
        <span
          className={`flex h-10 w-10 items-center justify-center rounded-xl transition-transform duration-300 group-hover:scale-110 ${TONE_CLASS[tone]}`}
        >
          <span className="material-symbols-outlined text-icon-md">{icon}</span>
        </span>
      </div>
      <div className="flex flex-col gap-1">
        <span className="text-headline-md tabular-nums text-on-surface">{value}</span>
        {hint && <span className="text-label-sm text-on-surface-variant">{hint}</span>}
      </div>
    </div>
  );
}
