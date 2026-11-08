import { useCallback, useState } from 'react';

const THEME_STORAGE_KEY = 'recall-theme';

function readInitialDark(): boolean {
  const stored = localStorage.getItem(THEME_STORAGE_KEY);
  if (stored) return stored === 'dark';
  return window.matchMedia?.('(prefers-color-scheme: dark)').matches ?? false;
}

function applyTheme(dark: boolean): void {
  document.documentElement.classList.toggle('dark', dark);
}

/** 全站共用的亮/暗主题切换，偏好保存在本机 */
export function useTheme(): { dark: boolean; toggleTheme: () => void } {
  const [dark, setDark] = useState<boolean>(() => {
    const initial = readInitialDark();
    applyTheme(initial);
    return initial;
  });

  const toggleTheme = useCallback(() => {
    const next = !dark;
    localStorage.setItem(THEME_STORAGE_KEY, next ? 'dark' : 'light');
    applyTheme(next);
    setDark(next);
  }, [dark]);

  return { dark, toggleTheme };
}
