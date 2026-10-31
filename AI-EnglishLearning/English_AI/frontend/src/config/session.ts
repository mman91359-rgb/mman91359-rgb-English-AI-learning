/**
 * 学习会话与空闲检测配置。
 * 联调时可临时调小阈值，验证后恢复。
 */
export const IDLE_PAUSE_MS = 3 * 60 * 1000
export const IDLE_LOGOUT_MS = 30 * 60 * 1000
export const SESSION_TICK_MS = 5 * 1000
export const STUDY_REPORT_INTERVAL_MS = 30 * 1000
export const MAX_TICK_SECONDS = 6
export const SESSION_MAX_AGE_MS = 6 * 60 * 60 * 1000

/** 被视为“有操作”的事件 */
export const ACTIVITY_EVENTS = [
  'mousemove',
  'mousedown',
  'keydown',
  'touchstart',
  'scroll',
  'wheel',
] as const
