import { ApiError, del, get, post, put } from './request'

/** 管理端分页响应 */
export interface AdminPage<T> {
  records: T[]
  total: number
  page: number
  size: number
}

export type UserStatus = 0 | 1
export type UserRole = 'ROLE_USER' | 'ROLE_ADMIN'
export type CetLevel = 'CET4' | 'CET6'
export type TargetAudience = 'ALL' | CetLevel
export type NoticeStatus = 'DRAFT' | 'PUBLISHED' | 'EXPIRED'
export type NoticeType = 'SYSTEM' | 'REMINDER' | 'ACTIVITY'
export type ActivityStatus = 'DRAFT' | 'PUBLISHED' | 'ENDED'
export type ActivityType = 'BANNER' | 'CONTENT'
export type ActivityDisplayState = 'DRAFT' | 'SCHEDULED' | 'ACTIVE' | 'ENDED'
export type ReviewStatus = 'PENDING' | 'APPROVED' | 'REJECTED'
export type AuditResult = 'SUCCESS' | 'FAIL'

export type LooseRecord = Record<string, string | number | boolean | null>

/** ---------- 概览 ---------- */

export interface AdminOverviewExercise {
  questionTotal: number
  pendingReview: number
  approvedTotal: number
  rejectedTotal: number
  answeredLast30d: number
  todayAnswered: number
  activeUsersToday: number
  activeUsers7d: number
  totalStudySeconds: number
  dataWindowDays: number
}

export interface AdminOverview {
  generatedAt: string
  exerciseDegraded: boolean
  totalUsers: number
  enabledUsers: number
  disabledUsers: number
  newUsersToday: number
  newUsers7d: number
  adminUsers: number
  totalCoinBalance: number
  todayCheckIns: number
  activeNotices: number
  activeActivities: number
  exercise: AdminOverviewExercise
}

/** ---------- 用户 ---------- */

/** 后端原始用户行：roles 为逗号分隔字符串 */
interface AdminUserRaw {
  id: number
  username: string
  nickname: string | null
  avatarUrl: string | null
  cetLevel: string | null
  phoneMasked: string | null
  roles: string
  status: number
  lastLoginAt: string | null
  createdAt: string
  eloScore: number | null
  coinBalance: number | null
}

export interface AdminUserRow {
  id: number
  username: string
  nickname: string | null
  avatarUrl: string | null
  cetLevel: CetLevel | null
  phoneMasked: string | null
  roles: UserRole[]
  status: UserStatus
  lastLoginAt: string | null
  createdAt: string
  eloScore: number | null
  coinBalance: number | null
}

export interface AdminUserQuery {
  keyword?: string
  role?: UserRole
  status?: UserStatus
  cetLevel?: CetLevel
  startDate?: string
  endDate?: string
  page?: number
  size?: number
}

export type UserListQuery = AdminUserQuery

interface AdminUserDetailRaw {
  user: AdminUserRaw
  radar: LooseRecord | null
  coin: LooseRecord | null
  preference: LooseRecord | null
  stats: LooseRecord | null
}

export interface AdminUserDetail {
  user: AdminUserRow
  radar: LooseRecord | null
  coin: LooseRecord | null
  preference: LooseRecord | null
  stats: LooseRecord | null
}

export interface ResetPasswordResult {
  userId: number
  temporaryPassword: string
}

/** ---------- 题目审核 ---------- */

export interface AdminQuestion {
  id: number
  moduleType: number
  targetLevel: string | null
  difficultyLevel: number | null
  questionType: string
  stem: string
  options: string | null
  correctAnswer: string | null
  analysis: string | null
  knowledgePointName: string | null
  status: ReviewStatus
  reviewerId: number | null
  reviewComment: string | null
  createdAt: string
  updatedAt: string | null
}

export interface AdminQuestionQuery {
  status?: ReviewStatus
  moduleType?: number
  targetLevel?: CetLevel
  keyword?: string
  page?: number
  size?: number
}

export interface GenerateQuestionsRequest {
  knowledgePoint: string
  cetLevel: CetLevel
  difficulty: number
  questionType: string
  count: number
}

export interface ApproveQuestionResult {
  pendingId: number
  questionId: number
}

/** ---------- 通知 ---------- */

export interface AdminNotice {
  id: number
  title: string
  content: string
  noticeType: NoticeType
  targetAudience: TargetAudience
  status: NoticeStatus
  publishAt: string | null
  expireAt: string | null
  createdBy: number
  createdByName: string | null
  createdAt: string
  updatedAt: string
}

export interface NoticeListQuery {
  status?: NoticeStatus
  noticeType?: NoticeType
  targetAudience?: TargetAudience
  keyword?: string
  page?: number
  size?: number
}

export interface NoticePayload {
  title: string
  content: string
  noticeType: NoticeType
  targetAudience: TargetAudience
  publishAt?: string
  expireAt?: string
}

/** ---------- 活动 ---------- */

export interface AdminActivity {
  id: number
  title: string
  summary: string
  content: string
  bannerUrl: string | null
  activityType: ActivityType
  targetAudience: TargetAudience
  status: ActivityStatus
  /** 后端按状态与时间计算的展示态，可能不存在 */
  effectiveStatus?: ActivityDisplayState
  startAt: string
  endAt: string
  sortOrder: number
  createdBy: number
  createdByName?: string | null
  createdAt: string
  updatedAt: string
}

export interface ActivityListQuery {
  status?: ActivityStatus
  activityType?: ActivityType
  targetAudience?: TargetAudience
  keyword?: string
  page?: number
  size?: number
}

export interface ActivityPayload {
  title: string
  summary: string
  content: string
  bannerUrl?: string
  activityType: ActivityType
  targetAudience: TargetAudience
  startAt: string
  endAt: string
  sortOrder: number
}

/** ---------- 操作日志 ---------- */

export interface OperationLog {
  id: number
  operatorId: number
  operatorName: string
  action: string
  targetType: string
  targetId: string | null
  detail: string | null
  ip: string | null
  userAgent: string | null
  result: AuditResult
  traceId: string | null
  createdAt: string
}

export interface OperationLogQuery {
  operatorId?: number
  action?: string
  targetType?: string
  result?: AuditResult
  startTime?: string
  endTime?: string
  page?: number
  size?: number
}

/** ---------- 适配 ---------- */

function normalizeRoles(value: string): UserRole[] {
  return value
    .split(',')
    .map((item) => item.trim())
    .filter((item): item is UserRole => item === 'ROLE_USER' || item === 'ROLE_ADMIN')
}

function normalizeCetLevel(value: string | null): CetLevel | null {
  return value === 'CET4' || value === 'CET6' ? value : null
}

function mapUser(raw: AdminUserRaw): AdminUserRow {
  return {
    ...raw,
    cetLevel: normalizeCetLevel(raw.cetLevel),
    roles: normalizeRoles(raw.roles || ''),
    status: raw.status === 1 ? 1 : 0,
  }
}

/** 把请求异常映射为 i18n key，供页面 Toast 使用 */
export function getAdminErrorKey(error: unknown): string {
  if (error instanceof ApiError) {
    if (error.status === 400 || error.code === 400) return 'adminConsole.error.badRequest'
    if (error.status === 401 || error.code === 401) return 'adminConsole.error.unauthorized'
    if (error.status === 403 || error.code === 403) return 'adminConsole.error.forbidden'
    if (error.status === 404 || error.code === 404) return 'adminConsole.error.notFound'
    if (error.status === 409 || error.code === 409) return 'adminConsole.error.conflict'
  }
  return 'adminConsole.error.generic'
}

/** ---------- 概览 ---------- */

export const getAdminOverview = (): Promise<AdminOverview> => get('/admin/overview')

/** ---------- 用户 ---------- */

export const getAdminUsers = async (params: AdminUserQuery): Promise<AdminPage<AdminUserRow>> => {
  const page = await get<AdminPage<AdminUserRaw>>('/admin/users', params)
  return { ...page, records: page.records.map(mapUser) }
}

export const getAdminUser = async (id: number): Promise<AdminUserDetail> => {
  const detail = await get<AdminUserDetailRaw>(`/admin/users/${id}`)
  return { ...detail, user: mapUser(detail.user) }
}

export const updateUserStatus = async (id: number, status: UserStatus): Promise<AdminUserRow> =>
  mapUser(await put<AdminUserRaw>(`/admin/users/${id}/status`, { status }))

export const updateUserRole = async (id: number, role: UserRole): Promise<AdminUserRow> =>
  mapUser(await put<AdminUserRaw>(`/admin/users/${id}/role`, { role }))

export const resetUserPassword = (id: number): Promise<ResetPasswordResult> =>
  post(`/admin/users/${id}/reset-password`)

/** 管理员直接设置指定用户的新密码 */
export const setUserPassword = (id: number, password: string): Promise<void> =>
  put(`/admin/users/${id}/password`, { password })

/** ---------- 通知 ---------- */

export const getAdminNotices = (params: NoticeListQuery): Promise<AdminPage<AdminNotice>> =>
  get('/admin/notices', params)

export const getAdminNotice = (id: number): Promise<AdminNotice> => get(`/admin/notices/${id}`)

export const createNotice = (payload: NoticePayload): Promise<number> => post('/admin/notices', payload)

export const updateNotice = (id: number, payload: NoticePayload): Promise<AdminNotice> =>
  put(`/admin/notices/${id}`, payload)

export const publishNotice = (id: number): Promise<AdminNotice> => post(`/admin/notices/${id}/publish`)

export const expireNotice = (id: number): Promise<AdminNotice> => post(`/admin/notices/${id}/expire`)

export const deleteNotice = (id: number): Promise<void> => del(`/admin/notices/${id}`)

/** ---------- 活动 ---------- */

export const getAdminActivities = (params: ActivityListQuery): Promise<AdminPage<AdminActivity>> =>
  get('/admin/activities', params)

export const getAdminActivity = (id: number): Promise<AdminActivity> => get(`/admin/activities/${id}`)

export const createActivity = (payload: ActivityPayload): Promise<number> => post('/admin/activities', payload)

export const updateActivity = (id: number, payload: ActivityPayload): Promise<AdminActivity> =>
  put(`/admin/activities/${id}`, payload)

export const publishActivity = (id: number): Promise<AdminActivity> => post(`/admin/activities/${id}/publish`)

export const endActivity = (id: number): Promise<AdminActivity> => post(`/admin/activities/${id}/end`)

export const deleteActivity = (id: number): Promise<void> => del(`/admin/activities/${id}`)

/** ---------- 操作日志 ---------- */

export const getOperationLogs = (params: OperationLogQuery): Promise<AdminPage<OperationLog>> =>
  get('/admin/operation-logs', params)

/** ---------- 题目审核 ---------- */

export const getAdminQuestions = (params: AdminQuestionQuery): Promise<AdminPage<AdminQuestion>> =>
  get('/admin/questions', { ...params, status: params.status ?? 'PENDING' })

export const approveQuestion = (id: number): Promise<ApproveQuestionResult> =>
  post(`/admin/questions/${id}/approve`)

export const rejectQuestion = (id: number, comment: string): Promise<void> =>
  post(`/admin/questions/${id}/reject`, { comment })

export const generateQuestions = (body: GenerateQuestionsRequest): Promise<number> =>
  post('/admin/questions/generate', body)
