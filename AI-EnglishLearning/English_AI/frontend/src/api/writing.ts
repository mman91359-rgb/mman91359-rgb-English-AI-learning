import { get, post } from './request'
import { WRITING_TOPICS } from '../mocks/writing'
import { useUserStore } from '../stores/user'
import type { WritingDraft, WritingScore, WritingSubmission, WritingTopic } from '../types/writing'

interface DraftRecord {
  content: string
  updatedAt: string
  /** 已写作秒数，随草稿一起持久化 */
  elapsedSeconds?: number
}

type DraftStore = Record<string, DraftRecord>

const TOPIC_CACHE: WritingTopic[] = WRITING_TOPICS

export function countWords(text: string): number {
  const trimmed = text.trim()
  return trimmed ? trimmed.split(/\s+/).length : 0
}

function userScope(): string {
  const userStore = useUserStore()
  return String(userStore.userId ?? 'anonymous')
}

function keyOf(kind: 'drafts' | 'favorites'): string {
  return `recall:writing:${userScope()}:${kind}`
}

function readJson<T>(key: string, fallback: T): T {
  try {
    const raw = localStorage.getItem(key)
    return raw ? (JSON.parse(raw) as T) : fallback
  } catch {
    return fallback
  }
}

function writeJson(key: string, value: unknown): void {
  localStorage.setItem(key, JSON.stringify(value))
}

function readDrafts(): DraftStore {
  return readJson<DraftStore>(keyOf('drafts'), {})
}

/** 题库为静态数据，暂不入库（Q1 决策） */
export function fetchWritingTopics(): Promise<WritingTopic[]> {
  return Promise.resolve(TOPIC_CACHE)
}

export function fetchDraft(topicId: string): Promise<WritingDraft | null> {
  const record = readDrafts()[topicId]
  if (!record) return Promise.resolve(null)
  return Promise.resolve({
    topicId,
    content: record.content,
    wordCount: countWords(record.content),
    updatedAt: record.updatedAt,
    elapsedSeconds: record.elapsedSeconds ?? 0,
  })
}

export function saveDraft(topicId: string, content: string, elapsedSeconds = 0): Promise<WritingDraft> {
  const drafts = readDrafts()
  const updatedAt = new Date().toISOString()
  drafts[topicId] = { content, updatedAt, elapsedSeconds: Math.max(0, Math.floor(elapsedSeconds)) }
  try {
    writeJson(keyOf('drafts'), drafts)
  } catch {
    // 存储配额异常向上抛，由调用方区分“保存失败”与“评分失败”
    return Promise.reject(new Error('draft storage failed'))
  }
  return Promise.resolve({ topicId, content, wordCount: countWords(content), updatedAt, elapsedSeconds })
}

export function clearDraft(topicId: string): void {
  const drafts = readDrafts()
  if (!(topicId in drafts)) return
  delete drafts[topicId]
  writeJson(keyOf('drafts'), drafts)
}

export function fetchDrafts(): Promise<WritingDraft[]> {
  const drafts = readDrafts()
  return Promise.resolve(
    Object.entries(drafts).map(([topicId, record]) => ({
      topicId,
      content: record.content,
      wordCount: countWords(record.content),
      updatedAt: record.updatedAt,
      elapsedSeconds: record.elapsedSeconds ?? 0,
    })),
  )
}

export function fetchDraftTopicIds(): Promise<string[]> {
  return Promise.resolve(Object.keys(readDrafts()))
}

export function fetchFavoriteIds(): Promise<string[]> {
  return Promise.resolve(readJson<string[]>(keyOf('favorites'), []))
}

export function setFavorite(topicId: string, favorite: boolean): Promise<void> {
  const ids = readJson<string[]>(keyOf('favorites'), [])
  const next = favorite ? Array.from(new Set([...ids, topicId])) : ids.filter((id) => id !== topicId)
  writeJson(keyOf('favorites'), next)
  return Promise.resolve()
}

export interface SubmitEssayInput {
  topicId: string
  content: string
  durationSeconds: number
}

/** 后端提交响应 */
interface WritingSubmitResponseDTO {
  essayId: number
  topicKey: string
  content: string
  wordCount: number
  aiScored: boolean
  score: WritingScore | null
  createdAt: string
  message?: string
}

/** 构造降级（未评分）占位报告 */
function degradedReport(createdAt: string, message?: string): WritingScore {
  return {
    scoreVersion: 'degraded',
    provider: 'MOCK',
    scoredAt: createdAt,
    rawScore: 0,
    maxRawScore: 15,
    weightedScore: 0,
    level: 'NEEDS_WORK',
    dimensions: { content: 0, structure: 0, language: 0, vocabulary: 0, grammar: 0 },
    strengths: [],
    issues: [message || 'AI 评分暂不可用，可稍后重新评分'],
    corrections: [],
    highlights: [],
    modelEssay: '',
    rewriteSuggestions: [],
  }
}

function toSubmission(resp: WritingSubmitResponseDTO, durationSeconds: number): WritingSubmission {
  const report = resp.score ?? degradedReport(resp.createdAt, resp.message)
  return {
    id: String(resp.essayId),
    topicId: resp.topicKey,
    content: resp.content,
    wordCount: resp.wordCount,
    durationSeconds,
    rawScore: report.rawScore,
    weightedScore: report.weightedScore,
    status: resp.aiScored ? 'SCORED' : 'FAILED',
    createdAt: resp.createdAt,
    report,
  }
}

/**
 * 提交作文：调后端先落库后评分（失败降级为 aiScored=false）。
 * 返回与前端契约对齐的 WritingSubmission。
 */
export async function submitWritingEssay(input: SubmitEssayInput): Promise<WritingSubmission> {
  const topic = TOPIC_CACHE.find((item) => item.id === input.topicId)
  if (!topic) throw new Error('writing topic not found')

  const userStore = useUserStore()
  if (!userStore.userId) throw new Error('请先登录')

  const resp = await post<WritingSubmitResponseDTO>('/exercise/writing/submit', {
    userId: userStore.userId,
    topicKey: input.topicId,
    topicTitle: topic.title,
    content: input.content,
    wordCount: countWords(input.content),
    durationSeconds: input.durationSeconds,
  })

  return toSubmission(resp, input.durationSeconds)
}

export async function fetchSubmission(submissionId: string): Promise<WritingSubmission | null> {
  const userStore = useUserStore()
  if (!userStore.userId) return null
  const resp = await get<WritingSubmitResponseDTO>(`/exercise/writing/submission/${submissionId}`, {
    userId: userStore.userId,
  })
  if (!resp) return null
  return toSubmission(resp, 0)
}

export async function fetchSubmissions(): Promise<WritingSubmission[]> {
  const userStore = useUserStore()
  if (!userStore.userId) return []
  const list = await get<WritingSubmitResponseDTO[]>('/exercise/writing/submissions', {
    userId: userStore.userId,
  })
  return list.map((resp) => toSubmission(resp, 0))
}

/** 重新评分：对未评分（降级）的作文触发后端重新评分 */
export async function rescoreWriting(essayId: number): Promise<WritingSubmission | null> {
  const userStore = useUserStore()
  if (!userStore.userId) return null
  const resp = await post<WritingSubmitResponseDTO>('/exercise/writing/rescore', {
    userId: userStore.userId,
    essayId,
  })
  if (!resp || !resp.score) return null
  return toSubmission(resp, 0)
}

/** 仅供页面展示用：把提交记录转换成契约中的历史项 */
export function toHistoryItem(submission: WritingSubmission): {
  id: string
  topicId: string
  score: number
  wordCount: number
  durationSeconds: number
  createdAt: string
} {
  return {
    id: submission.id,
    topicId: submission.topicId,
    score: submission.rawScore,
    wordCount: submission.wordCount,
    durationSeconds: submission.durationSeconds,
    createdAt: submission.createdAt,
  }
}
