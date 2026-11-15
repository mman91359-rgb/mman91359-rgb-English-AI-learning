import axios from 'axios'
import type { AxiosInstance, AxiosResponse, InternalAxiosRequestConfig } from 'axios'
import { useUserStore } from '@/stores/user'

export interface ApiResponse<T = any> {
  code: number
  message: string
  data: T
  traceId?: string
}

/** 带 HTTP 状态码与业务码的请求异常，便于页面区分 409/403 等场景 */
export class ApiError extends Error {
  readonly status: number
  readonly code: number

  constructor(message: string, status = 0, code = 0) {
    super(message)
    this.name = 'ApiError'
    this.status = status
    this.code = code
  }
}

const instance: AxiosInstance = axios.create({
  baseURL: '/api',
  timeout: 10000,
  withCredentials: true, // 允许携带 HttpOnly Cookie（记住我 Refresh Token）
  headers: {
    'Content-Type': 'application/json',
  },
})

/** 惰性获取 user store，避免模块加载期循环依赖（拦截器运行时才调用） */
function getUserStore() {
  return useUserStore()
}

/** 401 刷新锁：并发请求同时 401 时只触发一次刷新 */
let refreshPromise: Promise<boolean> | null = null

instance.interceptors.request.use(
  (config: InternalAxiosRequestConfig) => {
    const token = getUserStore().token
    if (token) {
      config.headers.Authorization = `Bearer ${token}`
    }
    return config
  },
  (error) => {
    return Promise.reject(error)
  }
)

function isAuthRequest(url: string = ''): boolean {
  return (
    url.includes('/user/login') ||
    url.includes('/user/register') ||
    url.includes('/user/forgot-password') ||
    url.includes('/user/verify-code') ||
    url.includes('/auth/refresh') ||
    url.includes('/auth/logout')
  )
}

function clearAuthAndRedirect(): void {
  window.location.href = '/login'
}

instance.interceptors.response.use(
  (response: AxiosResponse<ApiResponse>) => {
    const res = response.data
    if (res.code !== 200) {
      if (res.code === 401) {
        // 登录、注册、刷新、登出接口的 401 是业务错误，不触发自动刷新，让调用方处理
        const url = response.config.url || ''
        if (!isAuthRequest(url)) {
          return Promise.reject(new ApiError(res.message || '请求失败', response.status, res.code))
        }
      }
      return Promise.reject(new ApiError(res.message || '请求失败', response.status, res.code))
    }
    return res.data
  },
  async (error) => {
    const status = error.response?.status
    const url = error.config?.url || ''
    // 401 且非鉴权接口 → 尝试静默刷新一次，成功后重试原请求
    if (status === 401 && !isAuthRequest(url) && !error.config?._retried) {
      if (!refreshPromise) {
        refreshPromise = getUserStore().refreshAuth().finally(() => {
          refreshPromise = null
        })
      }
      const refreshed = await refreshPromise
      if (refreshed) {
        error.config._retried = true
        // 重试时重新注入新 token
        const newToken = getUserStore().token
        if (newToken) {
          error.config.headers.Authorization = `Bearer ${newToken}`
        }
        return instance(error.config)
      }
      clearAuthAndRedirect()
      return Promise.reject(new ApiError('登录已过期，请重新登录', status ?? 0, 401))
    }
    if (status === 401 && !isAuthRequest(url)) {
      clearAuthAndRedirect()
    }
    const message = error.response?.data?.message || error.message || '网络异常'
    const code = error.response?.data?.code ?? status ?? 0
    return Promise.reject(new ApiError(message, status ?? 0, code))
  }
)

export const get = <T>(url: string, params?: Record<string, any>): Promise<T> => {
  // 响应拦截器已把 AxiosResponse 解包为业务 data，这里显式收敛泛型
  return instance.get(url, { params }) as unknown as Promise<T>
}

export const post = <T>(url: string, data?: Record<string, any>): Promise<T> => {
  return instance.post(url, data) as unknown as Promise<T>
}

export const put = <T>(url: string, data?: Record<string, any>): Promise<T> => {
  return instance.put(url, data) as unknown as Promise<T>
}

export const del = <T>(url: string, params?: Record<string, any>): Promise<T> => {
  return instance.delete(url, { params }) as unknown as Promise<T>
}

export default instance
