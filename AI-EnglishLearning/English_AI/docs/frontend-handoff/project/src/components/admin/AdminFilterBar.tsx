import { useEffect, useState, type ReactNode } from 'react';
import { inputClass } from '@/components/admin/FormField';
import { useI18n } from '@/i18n';

interface FilterBarProps {
  children: ReactNode;
  hasActiveFilters: boolean;
  onReset: () => void;
}

/** 筛选区容器，包含清空筛选入口 */
export function AdminFilterBar({ children, hasActiveFilters, onReset }: FilterBarProps) {
  const { t } = useI18n();
  return (
    <div className="flex flex-wrap items-end gap-3 rounded-[16px] border border-outline-variant/40 bg-surface-container-lowest p-4 shadow-soft-glow">
      {children}
      <button
        type="button"
        onClick={onReset}
        disabled={!hasActiveFilters}
        className="h-10 rounded-xl px-3 text-label-lg text-primary transition-colors hover:bg-primary-container/20 disabled:cursor-not-allowed disabled:text-outline disabled:hover:bg-transparent"
      >
        {t('filter.reset')}
      </button>
    </div>
  );
}

interface FilterFieldProps {
  label: string;
  children: ReactNode;
  className?: string;
}

export function FilterField({ label, children, className = 'w-full sm:w-44' }: FilterFieldProps) {
  return (
    <label className={`flex flex-col gap-1.5 ${className}`}>
      <span className="text-label-md text-on-surface-variant">{label}</span>
      {children}
    </label>
  );
}

interface FilterSearchProps {
  value: string;
  placeholder: string;
  onChange: (value: string) => void;
}

/** 关键词输入，输入停止 300ms 后才回写 URL，避免频繁请求 */
export function FilterSearch({ value, placeholder, onChange }: FilterSearchProps) {
  const [draft, setDraft] = useState(value);

  useEffect(() => {
    setDraft(value);
  }, [value]);

  useEffect(() => {
    if (draft === value) return;
    const timer = window.setTimeout(() => onChange(draft.trim()), 300);
    return () => window.clearTimeout(timer);
  }, [draft, value, onChange]);

  return (
    <div className="relative w-full sm:w-64">
      <span className="material-symbols-outlined pointer-events-none absolute left-3 top-1/2 -translate-y-1/2 text-icon-md text-outline">
        search
      </span>
      <input
        type="search"
        value={draft}
        onChange={(event) => setDraft(event.target.value)}
        placeholder={placeholder}
        className={`${inputClass} pl-10`}
      />
    </div>
  );
}

interface FilterSelectOption<V extends string | number> {
  value: V;
  label: string;
}

interface FilterSelectProps<V extends string | number> {
  value: V | undefined;
  options: FilterSelectOption<V>[];
  onChange: (value: V | undefined) => void;
  allLabel: string;
}

export function FilterSelect<V extends string | number>({ value, options, onChange, allLabel }: FilterSelectProps<V>) {
  return (
    <select
      value={value === undefined ? '' : String(value)}
      onChange={(event) => {
        const selected = options.find((option) => String(option.value) === event.target.value);
        onChange(selected?.value);
      }}
      className={`${inputClass} h-10 py-0`}
    >
      <option value="">{allLabel}</option>
      {options.map((option) => (
        <option key={String(option.value)} value={String(option.value)}>
          {option.label}
        </option>
      ))}
    </select>
  );
}
