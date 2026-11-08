/** 统一响应结构 */
export interface ApiResponse<T> {
  code: number;
  message: string;
  data: T;
  traceId: string;
}

/** 分页结构 */
export interface PageResult<T> {
  records: T[];
  total: number;
  page: number;
  size: number;
}

export interface PageQuery {
  page?: number;
  size?: number;
}

export type UserStatus = 0 | 1;
export type UserRole = 'ROLE_USER' | 'ROLE_ADMIN';
export type CetLevel = 'CET4' | 'CET6';
export type TargetAudience = 'ALL' | CetLevel;
export type NoticeStatus = 'DRAFT' | 'PUBLISHED' | 'EXPIRED';
export type NoticeType = 'SYSTEM' | 'REMINDER' | 'ACTIVITY';
export type ActivityStatus = 'DRAFT' | 'PUBLISHED' | 'ENDED';
export type ActivityType = 'BANNER' | 'CONTENT';
/** 活动展示态，由 startAt / endAt 与当前时间计算得出，非后端字段 */
export type ActivityDisplayState = 'DRAFT' | 'SCHEDULED' | 'ACTIVE' | 'ENDED';
export type ReviewStatus = 'PENDING' | 'APPROVED' | 'REJECTED';
export type AuditResult = 'SUCCESS' | 'FAIL';

/** 概览 */
export interface ExerciseOverview {
  questionTotal: number;
  pendingReview: number;
  approvedTotal: number;
  rejectedTotal: number;
  answeredLast30d: number;
  todayAnswered: number;
  activeUsersToday: number;
  activeUsers7d: number;
  totalStudySeconds: number;
  dataWindowDays: number;
}

export interface AdminOverview {
  generatedAt: string;
  exerciseDegraded: boolean;
  totalUsers: number;
  enabledUsers: number;
  disabledUsers: number;
  newUsersToday: number;
  newUsers7d: number;
  adminUsers: number;
  totalCoinBalance: number;
  todayCheckIns: number;
  activeNotices: number;
  activeActivities: number;
  exercise: ExerciseOverview;
}

/** 用户 */
export interface AdminUserRow {
  id: number;
  username: string;
  nickname: string | null;
  avatarUrl: string | null;
  cetLevel: CetLevel | null;
  phoneMasked: string | null;
  roles: UserRole[];
  status: UserStatus;
  lastLoginAt: string | null;
  createdAt: string;
  eloScore: number | null;
  coinBalance: number | null;
}

export interface UserListQuery extends PageQuery {
  keyword?: string;
  role?: UserRole;
  status?: UserStatus;
  cetLevel?: CetLevel;
  startDate?: string;
  endDate?: string;
}

/**
 * 用户详情中的 radar / coin / preference / stats 字段契约未逐项给出，
 * 仅以键值对形式透传展示，待后端确认后再细化类型。
 */
export type LooseRecord = Record<string, string | number | boolean | null>;

export interface AdminUserDetail {
  user: AdminUserRow;
  radar: LooseRecord | null;
  coin: LooseRecord | null;
  preference: LooseRecord | null;
  stats: LooseRecord | null;
}

export interface ResetPasswordResult {
  userId: number;
  temporaryPassword: string;
}

/** 通知 */
export interface AdminNotice {
  id: number;
  title: string;
  content: string;
  noticeType: NoticeType;
  targetAudience: TargetAudience;
  status: NoticeStatus;
  publishAt: string | null;
  expireAt: string | null;
  createdBy: number;
  createdByName: string | null;
  createdAt: string;
  updatedAt: string;
}

export interface NoticeListQuery extends PageQuery {
  status?: NoticeStatus;
  noticeType?: NoticeType;
  targetAudience?: TargetAudience;
  keyword?: string;
}

export interface NoticePayload {
  title: string;
  content: string;
  noticeType: NoticeType;
  targetAudience: TargetAudience;
  publishAt?: string;
  expireAt?: string;
}

/** 活动 */
export interface AdminActivity {
  id: number;
  title: string;
  summary: string;
  content: string;
  bannerUrl: string | null;
  activityType: ActivityType;
  targetAudience: TargetAudience;
  status: ActivityStatus;
  startAt: string;
  endAt: string;
  sortOrder: number;
  createdBy: number;
  createdAt: string;
  updatedAt: string;
}

export interface ActivityListQuery extends PageQuery {
  status?: ActivityStatus;
  activityType?: ActivityType;
  targetAudience?: TargetAudience;
  keyword?: string;
}

export interface ActivityPayload {
  title: string;
  summary: string;
  content: string;
  bannerUrl?: string;
  activityType: ActivityType;
  targetAudience: TargetAudience;
  startAt: string;
  endAt: string;
  sortOrder: number;
}

/** 操作日志 */
export interface OperationLog {
  id: number;
  operatorId: number;
  operatorName: string;
  action: string;
  targetType: string;
  targetId: string | null;
  detail: string | null;
  ip: string | null;
  userAgent: string | null;
  result: AuditResult;
  traceId: string | null;
  createdAt: string;
}

export interface OperationLogQuery extends PageQuery {
  operatorId?: number;
  action?: string;
  targetType?: string;
  result?: AuditResult;
  startTime?: string;
  endTime?: string;
}

/**
 * 题目字段契约中仅给出审核相关接口，题目行字段以后端为准；
 * 以下字段为展示所需的最小集合，待后端确认。
 */
export interface AdminQuestion {
  id: number;
  moduleType: number;
  questionType: string;
  stem: string;
  options: string | null;
  answer: string | null;
  explanation: string | null;
  knowledgePoint: string | null;
  targetLevel: CetLevel | null;
  difficultyLevel: number | null;
  status: ReviewStatus;
  createdAt: string;
}

export interface QuestionListQuery extends PageQuery {
  status?: ReviewStatus;
  moduleType?: number;
  targetLevel?: CetLevel;
  keyword?: string;
}

export interface GenerateQuestionsPayload {
  knowledgePoint: string;
  cetLevel: CetLevel;
  difficulty: number;
  questionType: string;
  count: number;
}

export interface GenerateQuestionsResult {
  savedCount: number;
}
