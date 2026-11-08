import { useCallback, useEffect, useRef, useState } from 'react';

/**
 * 倒计时：running 为 false 时暂停；归零时调用一次 onExpire。
 * reset 将剩余时间恢复为 totalSeconds（需配合 running 重新开始）。
 */
export function useCountdown(totalSeconds: number, running: boolean, onExpire: () => void) {
  const [remaining, setRemaining] = useState(totalSeconds);
  const expireRef = useRef(onExpire);

  useEffect(() => {
    expireRef.current = onExpire;
  }, [onExpire]);

  useEffect(() => {
    if (!running) return;
    const timer = window.setInterval(() => setRemaining((value) => Math.max(0, value - 1)), 1000);
    return () => window.clearInterval(timer);
  }, [running]);

  useEffect(() => {
    if (running && remaining === 0) expireRef.current();
  }, [running, remaining]);

  const reset = useCallback(() => setRemaining(totalSeconds), [totalSeconds]);

  return { remaining, reset };
}

/** 秒数格式化为 mm:ss */
export function formatClock(seconds: number): string {
  const minutes = Math.floor(seconds / 60);
  const rest = seconds % 60;
  return `${String(minutes).padStart(2, '0')}:${String(rest).padStart(2, '0')}`;
}
