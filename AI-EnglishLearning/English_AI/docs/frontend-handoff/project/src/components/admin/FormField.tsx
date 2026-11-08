import type { ReactNode } from 'react';

interface FormFieldProps {
  label: string;
  required?: boolean;
  hint?: string;
  error?: string;
  children: ReactNode;
}

/** 表单项容器：标签、必填标记、帮助文字与错误文案 */
export function FormField({ label, required = false, hint, error, children }: FormFieldProps) {
  return (
    <label className="flex flex-col gap-2">
      <span className="flex items-center gap-1 text-label-lg text-on-surface">
        {label}
        {required && <span className="text-error">*</span>}
      </span>
      {children}
      {error ? (
        <span className="text-label-md text-error">{error}</span>
      ) : (
        hint && <span className="text-label-md text-on-surface-variant">{hint}</span>
      )}
    </label>
  );
}

export const inputClass =
  'w-full rounded-xl border border-outline-variant bg-surface-container-lowest px-4 py-2.5 text-body-sm text-on-surface placeholder:text-outline transition-colors focus:border-primary focus:outline-none focus:ring-2 focus:ring-primary/20 disabled:opacity-60';
