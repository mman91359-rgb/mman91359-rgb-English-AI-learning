import { get, post, put } from './request'

/** 管理端分页响应 */
export interface AdminPage<T> {
  records: T[]
  total: number
  page: number
  size: number
}

/** 概览 */
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

/** 用户 */
export interface AdminUser {
  id: number
  username: string
  nickname: string
  avatarUrl?: string | null
  cetLevel: string
  phoneMasked?: string | null
  roles: string
  status: number
  lastLoginAt?: string | null
  createdAt: string
  eloScore?: number | null
  coinBalance?: number | null
}

export interface AdminUserQuery {
  keyword?: string
  role?: string
  status?: number
  cetLevel?: string
  startDate?: string
  endDate?: string
  page?: number
  size?: number
}

export interface AdminUserDetail {
  user: AdminUser
  radar?: {
    eloScore?: number
    vocabularyScore?: number
    grammarScore?: number
    listeningScore?: number
    readingScore?: number
  } | null
  coin?: {
    balance?: number
    totalEarned?: number
    checkInStreak?: number
  } | null
  preference?: {
    dailyNewWords?: number
    dailyReviewWords?: number
    vocabGroupSize?: number
  } | null
  stats?: {
    totalAnswered?: number
    correctRate?: number
    totalStudySeconds?: number
    activeDays?: number
  } | null
}

export interface ResetPasswordResult {
  userId: number
  temporaryPassword: string
}

/** 题目审核 */
export interface AdminQuestion {
  id: number
  moduleType: number
  targetLevel: string
  difficultyLevel: number
  questionType: string
  stem: string
  options: string
  correctAnswer: string
  analysis: string
  knowledgePointName?: string | null
  status: 'PENDING' | 'APPROVED' | 'REJECTED' | string
  reviewerId?: number | null
  reviewComment?: string | null
  createdAt: string
  updatedAt?: string
}

export interface AdminQuestionQuery {
  status?: string
  moduleType?: number
  targetLevel?: string
  keyword?: string
  page?: number
  size?: number
}

export interface GenerateQuestionsRequest {
  knowledgePoint: string
  cetLevel: string
  difficulty: number
  questionType: string
  count: number
}

/** 概览 */
export const getAdminOverview = (): Promise<AdminOverview> => get('/admin/overview')

/** 用户 */
export const getAdminUsers = (params: AdminUserQuery): Promise<AdminPage<AdminUser>> =>
  get('/admin/users', params)

export const getAdminUser = (id: number): Promise<AdminUserDetail> =>
  get(`/admin/users/${id}`)

export const updateUserStatus = (id: number, status: 0 | 1): Promise<AdminUser> =>
  put(`/admin/users/${id}/status`, { status })

export const updateUserRole = (id: number, role: 'ROLE_USER' | 'ROLE_ADMIN'): Promise<AdminUser> =>
  put(`/admin/users/${id}/role`, { role })

export const resetUserPassword = (id: number): Promise<ResetPasswordResult> =>
  post(`/admin/users/${id}/reset-password`)

/** 题目审核 */
export const getAdminQuestions = (params: AdminQuestionQuery): Promise<AdminPage<AdminQuestion>> =>
  get('/admin/questions', params)

export const approveQuestion = (id: number): Promise<string> =>
  post(`/admin/questions/${id}/approve`)

export const rejectQuestion = (id: number, comment: string): Promise<string> =>
  post(`/admin/questions/${id}/reject`, { comment })

export const generateQuestions = (body: GenerateQuestionsRequest): Promise<number> =>
  post('/admin/questions/generate', body)
