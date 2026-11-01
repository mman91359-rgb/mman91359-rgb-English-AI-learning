import type {
  ActivityDisplayState,
  ActivityStatus,
  ActivityType,
  AdminActivity,
  AuditResult,
  NoticeStatus,
  NoticeType,
  ReviewStatus,
  TargetAudience,
  UserRole,
  UserStatus,
} from '../api/admin'
import type { BadgeTone } from '../components/admin/tableTypes'

export interface EnumMeta {
  tone: BadgeTone
  labelKey: string
}

export const USER_STATUS_META: Record<UserStatus, EnumMeta> = {
  1: { tone: 'success', labelKey: 'adminConsole.enum.userActive' },
  0: { tone: 'danger', labelKey: 'adminConsole.enum.userDisabled' },
}

export const USER_ROLE_META: Record<UserRole, EnumMeta> = {
  ROLE_USER: { tone: 'neutral', labelKey: 'adminConsole.enum.roleUser' },
  ROLE_ADMIN: { tone: 'info', labelKey: 'adminConsole.enum.roleAdmin' },
}

export const NOTICE_STATUS_META: Record<NoticeStatus, EnumMeta> = {
  DRAFT: { tone: 'neutral', labelKey: 'adminConsole.enum.noticeDraft' },
  PUBLISHED: { tone: 'success', labelKey: 'adminConsole.enum.noticePublished' },
  EXPIRED: { tone: 'warning', labelKey: 'adminConsole.enum.noticeExpired' },
}

export const NOTICE_TYPE_META: Record<NoticeType, EnumMeta> = {
  SYSTEM: { tone: 'info', labelKey: 'adminConsole.enum.typeSystem' },
  REMINDER: { tone: 'warning', labelKey: 'adminConsole.enum.typeReminder' },
  ACTIVITY: { tone: 'success', labelKey: 'adminConsole.enum.typeActivity' },
}

export const AUDIENCE_META: Record<TargetAudience, EnumMeta> = {
  ALL: { tone: 'neutral', labelKey: 'adminConsole.enum.audienceAll' },
  CET4: { tone: 'info', labelKey: 'adminConsole.enum.audienceCet4' },
  CET6: { tone: 'info', labelKey: 'adminConsole.enum.audienceCet6' },
}

export const ACTIVITY_STATUS_META: Record<ActivityStatus, EnumMeta> = {
  DRAFT: { tone: 'neutral', labelKey: 'adminConsole.enum.activityDraft' },
  PUBLISHED: { tone: 'success', labelKey: 'adminConsole.enum.activityPublished' },
  ENDED: { tone: 'warning', labelKey: 'adminConsole.enum.activityEnded' },
}

export const ACTIVITY_DISPLAY_META: Record<ActivityDisplayState, EnumMeta> = {
  DRAFT: { tone: 'neutral', labelKey: 'adminConsole.enum.activityDraft' },
  SCHEDULED: { tone: 'info', labelKey: 'adminConsole.enum.activityScheduled' },
  ACTIVE: { tone: 'success', labelKey: 'adminConsole.enum.activityActive' },
  ENDED: { tone: 'warning', labelKey: 'adminConsole.enum.activityEnded' },
}

export const ACTIVITY_TYPE_META: Record<ActivityType, EnumMeta> = {
  BANNER: { tone: 'info', labelKey: 'adminConsole.enum.typeBanner' },
  CONTENT: { tone: 'neutral', labelKey: 'adminConsole.enum.typeContent' },
}

export const REVIEW_STATUS_META: Record<ReviewStatus, EnumMeta> = {
  PENDING: { tone: 'warning', labelKey: 'adminConsole.enum.reviewPending' },
  APPROVED: { tone: 'success', labelKey: 'adminConsole.enum.reviewApproved' },
  REJECTED: { tone: 'danger', labelKey: 'adminConsole.enum.reviewRejected' },
}

export const AUDIT_RESULT_META: Record<AuditResult, EnumMeta> = {
  SUCCESS: { tone: 'success', labelKey: 'adminConsole.enum.auditSuccess' },
  FAIL: { tone: 'danger', labelKey: 'adminConsole.enum.auditFail' },
}

/** 活动展示态：草稿 / 未开始 / 进行中 / 已结束 */
export function getActivityDisplayState(activity: AdminActivity, now: number = Date.now()): ActivityDisplayState {
  if (activity.status === 'DRAFT') return 'DRAFT'
  if (activity.status === 'ENDED') return 'ENDED'
  if (activity.effectiveStatus) return activity.effectiveStatus
  const start = new Date(activity.startAt.replace(' ', 'T')).getTime()
  const end = new Date(activity.endAt.replace(' ', 'T')).getTime()
  if (now < start) return 'SCHEDULED'
  if (now >= end) return 'ENDED'
  return 'ACTIVE'
}

export function activityStatusMeta(activity: AdminActivity): EnumMeta {
  return ACTIVITY_DISPLAY_META[getActivityDisplayState(activity)]
}
