import type {
  ActivityListQuery,
  ActivityPayload,
  AdminActivity,
  AdminNotice,
  AdminOverview,
  AdminQuestion,
  AdminUserDetail,
  AdminUserRow,
  ApiResponse,
  GenerateQuestionsPayload,
  GenerateQuestionsResult,
  NoticeListQuery,
  NoticePayload,
  OperationLog,
  OperationLogQuery,
  PageResult,
  QuestionListQuery,
  ResetPasswordResult,
  UserListQuery,
  UserRole,
  UserStatus,
} from '@/types/admin';

const API_BASE = '/api';
const ADMIN_TOKEN_KEY = 'recall-admin-token';

/** 接口调用失败（含 HTTP 状态码与后端业务码） */
export class AdminApiError extends Error {
  readonly status: number;
  readonly code: number;

  constructor(status: number, code: number, message: string) {
    super(message);
    this.name = 'AdminApiError';
    this.status = status;
    this.code = code;
  }
}

type QueryValue = string | number | boolean | null | undefined;

function buildQuery(params: Record<string, QueryValue>): string {
  const search = new URLSearchParams();
  Object.entries(params).forEach(([key, value]) => {
    if (value === undefined || value === null || value === '') return;
    search.set(key, String(value));
  });
  const text = search.toString();
  return text ? `?${text}` : '';
}

function getAdminToken(): string | null {
  return localStorage.getItem(ADMIN_TOKEN_KEY);
}

export function clearAdminSession(): void {
  localStorage.removeItem(ADMIN_TOKEN_KEY);
}

async function request<T>(method: string, path: string, body?: unknown): Promise<T> {
  const headers: Record<string, string> = { Accept: 'application/json' };
  const token = getAdminToken();
  if (token) headers.Authorization = `Bearer ${token}`;
  if (body !== undefined) headers['Content-Type'] = 'application/json';

  let response: Response;
  try {
    response = await fetch(`${API_BASE}/admin${path}`, {
      method,
      headers,
      body: body === undefined ? undefined : JSON.stringify(body),
    });
  } catch {
    throw new AdminApiError(0, 500, 'NETWORK_ERROR');
  }

  let payload: ApiResponse<T> | null = null;
  try {
    payload = (await response.json()) as ApiResponse<T>;
  } catch {
    payload = null;
  }

  if (!response.ok || !payload || payload.code !== 0) {
    const code = payload?.code ?? response.status;
    throw new AdminApiError(response.status, code, payload?.message ?? 'REQUEST_FAILED');
  }
  return payload.data;
}

// ---------- 概览 ----------

export function fetchOverview(): Promise<AdminOverview> {
  return request<AdminOverview>('GET', '/overview');
}

// ---------- 用户管理 ----------

export function fetchUsers(query: UserListQuery): Promise<PageResult<AdminUserRow>> {
  return request<PageResult<AdminUserRow>>('GET', `/users${buildQuery({ ...query })}`);
}

export function fetchUserDetail(id: number): Promise<AdminUserDetail> {
  return request<AdminUserDetail>('GET', `/users/${id}`);
}

export function updateUserStatus(id: number, status: UserStatus): Promise<void> {
  return request<void>('PUT', `/users/${id}/status`, { status });
}

export function updateUserRole(id: number, role: UserRole): Promise<void> {
  return request<void>('PUT', `/users/${id}/role`, { role });
}

export function resetUserPassword(id: number): Promise<ResetPasswordResult> {
  return request<ResetPasswordResult>('POST', `/users/${id}/reset-password`);
}

// ---------- 通知管理 ----------

export function fetchNotices(query: NoticeListQuery): Promise<PageResult<AdminNotice>> {
  return request<PageResult<AdminNotice>>('GET', `/notices${buildQuery({ ...query })}`);
}

export function fetchNotice(id: number): Promise<AdminNotice> {
  return request<AdminNotice>('GET', `/notices/${id}`);
}

export function createNotice(payload: NoticePayload): Promise<AdminNotice> {
  return request<AdminNotice>('POST', '/notices', payload);
}

export function updateNotice(id: number, payload: NoticePayload): Promise<AdminNotice> {
  return request<AdminNotice>('PUT', `/notices/${id}`, payload);
}

export function publishNotice(id: number): Promise<AdminNotice> {
  return request<AdminNotice>('POST', `/notices/${id}/publish`);
}

export function expireNotice(id: number): Promise<AdminNotice> {
  return request<AdminNotice>('POST', `/notices/${id}/expire`);
}

export function deleteNotice(id: number): Promise<void> {
  return request<void>('DELETE', `/notices/${id}`);
}

// ---------- 活动管理 ----------

export function fetchActivities(query: ActivityListQuery): Promise<PageResult<AdminActivity>> {
  return request<PageResult<AdminActivity>>('GET', `/activities${buildQuery({ ...query })}`);
}

export function fetchActivity(id: number): Promise<AdminActivity> {
  return request<AdminActivity>('GET', `/activities/${id}`);
}

export function createActivity(payload: ActivityPayload): Promise<AdminActivity> {
  return request<AdminActivity>('POST', '/activities', payload);
}

export function updateActivity(id: number, payload: ActivityPayload): Promise<AdminActivity> {
  return request<AdminActivity>('PUT', `/activities/${id}`, payload);
}

export function publishActivity(id: number): Promise<AdminActivity> {
  return request<AdminActivity>('POST', `/activities/${id}/publish`);
}

export function endActivity(id: number): Promise<AdminActivity> {
  return request<AdminActivity>('POST', `/activities/${id}/end`);
}

export function deleteActivity(id: number): Promise<void> {
  return request<void>('DELETE', `/activities/${id}`);
}

// ---------- 操作日志 ----------

export function fetchOperationLogs(query: OperationLogQuery): Promise<PageResult<OperationLog>> {
  return request<PageResult<OperationLog>>('GET', `/operation-logs${buildQuery({ ...query })}`);
}

// ---------- 题目审核 ----------

export function fetchQuestions(query: QuestionListQuery): Promise<PageResult<AdminQuestion>> {
  return request<PageResult<AdminQuestion>>('GET', `/questions${buildQuery({ ...query, status: query.status ?? 'PENDING' })}`);
}

export function approveQuestion(id: number): Promise<void> {
  return request<void>('POST', `/questions/${id}/approve`);
}

export function rejectQuestion(id: number, comment: string): Promise<void> {
  return request<void>('POST', `/questions/${id}/reject`, { comment });
}

export function generateQuestions(payload: GenerateQuestionsPayload): Promise<GenerateQuestionsResult> {
  return request<GenerateQuestionsResult>('POST', '/questions/generate', payload);
}
