import axios from 'axios'
import type { AxiosInstance, AxiosResponse, InternalAxiosRequestConfig } from 'axios'

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
  headers: {
    'Content-Type': 'application/json',
  },
})

instance.interceptors.request.use(
  (config: InternalAxiosRequestConfig) => {
    const token = sessionStorage.getItem('token')
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
  return url.includes('/user/login') || url.includes('/user/register')
}

function clearAuthAndRedirect(): void {
  sessionStorage.removeItem('token')
  sessionStorage.removeItem('user')
  if (window.location.pathname !== '/login') {
    window.location.href = '/login'
  }
}

instance.interceptors.response.use(
  (response: AxiosResponse<ApiResponse>) => {
    const res = response.data
    if (res.code !== 200) {
      if (res.code === 401) {
        // 登录、注册接口的 401 是业务错误（如密码错误），不跳转，让调用方显示错误提示
        const url = response.config.url || ''
        if (!isAuthRequest(url)) {
          clearAuthAndRedirect()
          return Promise.reject(new ApiError(res.message || '请求失败', response.status, res.code))
        }
      }
      return Promise.reject(new ApiError(res.message || '请求失败', response.status, res.code))
    }
    return res.data
  },
  (error) => {
    const status = error.response?.status
    const url = error.config?.url || ''
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
