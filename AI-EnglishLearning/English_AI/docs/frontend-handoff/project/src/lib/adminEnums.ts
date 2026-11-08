import type { BadgeTone } from '@/components/admin/StatusBadge';
import type { MessageKey } from '@/i18n/zh-CN';
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
} from '@/types/admin';

export interface EnumMeta {
  tone: BadgeTone;
  labelKey: MessageKey;
}

export const USER_STATUS_META: Record<UserStatus, EnumMeta> = {
  1: { tone: 'success', labelKey: 'enum.userActive' },
  0: { tone: 'danger', labelKey: 'enum.userDisabled' },
};

export const USER_ROLE_META: Record<UserRole, EnumMeta> = {
  ROLE_USER: { tone: 'neutral', labelKey: 'enum.roleUser' },
  ROLE_ADMIN: { tone: 'info', labelKey: 'enum.roleAdmin' },
};

export const NOTICE_STATUS_META: Record<NoticeStatus, EnumMeta> = {
  DRAFT: { tone: 'neutral', labelKey: 'enum.noticeDraft' },
  PUBLISHED: { tone: 'success', labelKey: 'enum.noticePublished' },
  EXPIRED: { tone: 'warning', labelKey: 'enum.noticeExpired' },
};

export const NOTICE_TYPE_META: Record<NoticeType, EnumMeta> = {
  SYSTEM: { tone: 'info', labelKey: 'enum.typeSystem' },
  REMINDER: { tone: 'warning', labelKey: 'enum.typeReminder' },
  ACTIVITY: { tone: 'success', labelKey: 'enum.typeActivity' },
};

export const AUDIENCE_META: Record<TargetAudience, EnumMeta> = {
  ALL: { tone: 'neutral', labelKey: 'enum.audienceAll' },
  CET4: { tone: 'info', labelKey: 'enum.audienceCet4' },
  CET6: { tone: 'info', labelKey: 'enum.audienceCet6' },
};

export const ACTIVITY_DISPLAY_META: Record<ActivityDisplayState, EnumMeta> = {
  DRAFT: { tone: 'neutral', labelKey: 'enum.activityDraft' },
  SCHEDULED: { tone: 'info', labelKey: 'enum.activityScheduled' },
  ACTIVE: { tone: 'success', labelKey: 'enum.activityActive' },
  ENDED: { tone: 'warning', labelKey: 'enum.activityEnded' },
};

export const ACTIVITY_TYPE_META: Record<ActivityType, EnumMeta> = {
  BANNER: { tone: 'info', labelKey: 'enum.typeBanner' },
  CONTENT: { tone: 'neutral', labelKey: 'enum.typeContent' },
};

export const REVIEW_STATUS_META: Record<ReviewStatus, EnumMeta> = {
  PENDING: { tone: 'warning', labelKey: 'enum.reviewPending' },
  APPROVED: { tone: 'success', labelKey: 'enum.reviewApproved' },
  REJECTED: { tone: 'danger', labelKey: 'enum.reviewRejected' },
};

export const AUDIT_RESULT_META: Record<AuditResult, EnumMeta> = {
  SUCCESS: { tone: 'success', labelKey: 'enum.auditSuccess' },
  FAIL: { tone: 'danger', labelKey: 'enum.auditFail' },
};

/** 活动展示态：草稿 / 未开始 / 进行中 / 已结束，由时间与后端状态推导 */
export function getActivityDisplayState(activity: AdminActivity, now: number = Date.now()): ActivityDisplayState {
  const status: ActivityStatus = activity.status;
  if (status === 'DRAFT') return 'DRAFT';
  if (status === 'ENDED') return 'ENDED';
  const start = new Date(activity.startAt.replace(' ', 'T')).getTime();
  const end = new Date(activity.endAt.replace(' ', 'T')).getTime();
  if (now < start) return 'SCHEDULED';
  if (now >= end) return 'ENDED';
  return 'ACTIVE';
}
