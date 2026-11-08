import { useCallback, useEffect, useMemo, useState, type AnchorHTMLAttributes, type MouseEvent } from 'react';

const NAVIGATE_EVENT = 'recall-admin:navigate';

export type SearchPatch = Record<string, string | number | null | undefined>;

interface LocationSnapshot {
  pathname: string;
  search: string;
}

function readLocation(): LocationSnapshot {
  return { pathname: window.location.pathname, search: window.location.search };
}

/** 站内跳转（不刷新页面），replace 时不新增历史记录 */
export function navigate(to: string, options?: { replace?: boolean }): void {
  if (options?.replace) {
    window.history.replaceState(null, '', to);
  } else {
    window.history.pushState(null, '', to);
  }
  window.dispatchEvent(new Event(NAVIGATE_EVENT));
}

export function useLocation(): LocationSnapshot {
  const [location, setLocation] = useState<LocationSnapshot>(readLocation);

  useEffect(() => {
    const sync = () => setLocation(readLocation());
    window.addEventListener('popstate', sync);
    window.addEventListener(NAVIGATE_EVENT, sync);
    return () => {
      window.removeEventListener('popstate', sync);
      window.removeEventListener(NAVIGATE_EVENT, sync);
    };
  }, []);

  return location;
}

/** 读写 URL 查询参数，筛选与分页状态通过 URL 同步，刷新后保持 */
export function useSearchParamsState(): [URLSearchParams, (patch: SearchPatch) => void] {
  const { search } = useLocation();
  const params = useMemo(() => new URLSearchParams(search), [search]);

  const update = useCallback(
    (patch: SearchPatch) => {
      const next = new URLSearchParams(window.location.search);
      Object.entries(patch).forEach(([key, value]) => {
        if (value === undefined || value === null || value === '') {
          next.delete(key);
        } else {
          next.set(key, String(value));
        }
      });
      const text = next.toString();
      navigate(`${window.location.pathname}${text ? `?${text}` : ''}`, { replace: true });
    },
    [],
  );

  return [params, update];
}

interface AdminLinkProps extends Omit<AnchorHTMLAttributes<HTMLAnchorElement>, 'href'> {
  to: string;
}

export function AdminLink({ to, onClick, ...rest }: AdminLinkProps) {
  const handleClick = (event: MouseEvent<HTMLAnchorElement>) => {
    onClick?.(event);
    if (event.defaultPrevented || event.metaKey || event.ctrlKey || event.shiftKey) return;
    event.preventDefault();
    navigate(to);
  };
  return <a href={to} onClick={handleClick} {...rest} />;
}
