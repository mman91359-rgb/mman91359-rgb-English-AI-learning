import { useI18n } from '@/i18n';

export interface BarDatum {
  label: string;
  value: number;
}

interface AdminChartCardProps {
  title: string;
  description?: string;
  data: BarDatum[];
  barClassName?: string;
}

/** 横向条形图卡片，纯样式实现，颜色随主题令牌自动适配 */
export function AdminChartCard({ title, description, data, barClassName = 'bg-primary' }: AdminChartCardProps) {
  const { t, locale } = useI18n();
  const max = Math.max(0, ...data.map((item) => item.value));
  const total = data.reduce((sum, item) => sum + item.value, 0);

  return (
    <section className="flex flex-col gap-6 rounded-[16px] border border-outline-variant/40 bg-surface-container-lowest p-6 shadow-soft-glow">
      <header className="flex flex-col gap-1">
        <h2 className="text-headline-sm text-on-surface">{title}</h2>
        {description && <p className="text-body-sm text-on-surface-variant">{description}</p>}
      </header>

      {total === 0 ? (
        <p className="py-8 text-center text-body-sm text-on-surface-variant">{t('chart.noData')}</p>
      ) : (
        <ul className="flex flex-col gap-4">
          {data.map((item) => {
            const width = max > 0 ? Math.round((item.value / max) * 100) : 0;
            return (
              <li key={item.label} className="flex flex-col gap-2">
                <div className="flex items-center justify-between text-body-sm">
                  <span className="text-on-surface-variant">{item.label}</span>
                  <span className="tabular-nums font-semibold text-on-surface">{item.value.toLocaleString(locale)}</span>
                </div>
                <div className="h-2 overflow-hidden rounded-full bg-surface-container-high">
                  <div
                    className={`h-full origin-left rounded-full transition-[width] duration-700 ease-out ${barClassName}`}
                    style={{ width: `${width}%` }}
                  />
                </div>
              </li>
            );
          })}
        </ul>
      )}
    </section>
  );
}
