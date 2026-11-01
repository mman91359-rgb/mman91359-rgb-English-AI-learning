import { WRITING_TOPICS } from '../mocks/writing'
import { writingScoringService } from '../services/writingScoring'
import { useUserStore } from '../stores/user'
import type { WritingDraft, WritingScore, WritingSubmission, WritingTopic } from '../types/writing'

interface DraftRecord {
  content: string
  updatedAt: string
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

function keyOf(kind: 'drafts' | 'favorites' | 'submissions'): string {
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

function readSubmissions(): WritingSubmission[] {
  return readJson<WritingSubmission[]>(keyOf('submissions'), [])
}

function newId(): string {
  if (typeof crypto !== 'undefined' && typeof crypto.randomUUID === 'function') return crypto.randomUUID()
  return `${Date.now()}-${Math.random().toString(16).slice(2)}`
}

/** 题库为静态数据，暂不入库 */
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
  })
}

export function saveDraft(topicId: string, content: string): Promise<WritingDraft> {
  const drafts = readDrafts()
  const updatedAt = new Date().toISOString()
  drafts[topicId] = { content, updatedAt }
  writeJson(keyOf('drafts'), drafts)
  return Promise.resolve({ topicId, content, wordCount: countWords(content), updatedAt })
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

/** 预览模式提交：只写 localStorage，不调用任何后端接口 */
export async function submitWritingEssay(input: SubmitEssayInput): Promise<WritingSubmission> {
  const topic = TOPIC_CACHE.find((item) => item.id === input.topicId)
  if (!topic) throw new Error('writing topic not found')

  const wordCount = countWords(input.content)
  const report: WritingScore = await writingScoringService.score({
    topic,
    content: input.content,
    wordCount,
    durationSeconds: input.durationSeconds,
  })

  const submission: WritingSubmission = {
    id: newId(),
    topicId: input.topicId,
    content: input.content,
    wordCount,
    durationSeconds: input.durationSeconds,
    rawScore: report.rawScore,
    weightedScore: report.weightedScore,
    status: 'SCORED',
    createdAt: new Date().toISOString(),
    report,
  }

  const submissions = readSubmissions()
  submissions.unshift(submission)
  writeJson(keyOf('submissions'), submissions)
  clearDraft(input.topicId)
  return submission
}

export function fetchSubmission(submissionId: string): Promise<WritingSubmission | null> {
  return Promise.resolve(readSubmissions().find((item) => item.id === submissionId) ?? null)
}

export function fetchSubmissions(): Promise<WritingSubmission[]> {
  return Promise.resolve(readSubmissions())
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
