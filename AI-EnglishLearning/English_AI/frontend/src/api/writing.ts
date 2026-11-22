import { del, get, post, put } from './request'
import { useUserStore } from '../stores/user'
import { LEVEL_WORD_RANGE } from '../utils/writing'
import type {
  WritingDraft,
  WritingLevel,
  WritingScore,
  WritingSubmission,
  WritingTopic,
  WritingTopicType,
} from '../types/writing'

/** 后端 PageResult 包装；写作题库一次取全，取 records 后拍平返回 */
interface PageResult<T> {
  records: T[]
  total: number
  page: number
  size: number
}

/** 后端 WritingTopicVO */
interface WritingTopicVO {
  id: string
  type: string
  level: string
  title: string | null
  directions: string | null
  topic: string
  requirements: string[] | null
  wordRange: number[] | null
  timeLimitSeconds: number | null
  source: string | null
  outlineHints: string[] | null
  usefulExpressions: string[] | null
}

/** 后端 WritingDraftVO（不下发 wordCount，由前端现算） */
interface WritingDraftVO {
  topicId: string
  content: string | null
  updatedAt: string
  elapsedSeconds: number | null
}

const WRITING_BASE = '/exercise/writing'
/** 后端 MAX_SIZE=100，题库 63 题一次取全；保持 fetchWritingTopics 返回数组的既有签名 */
const TOPICS_PAGE_SIZE = 100

export function countWords(text: string): number {
  const trimmed = text.trim()
  return trimmed ? trimmed.split(/\s+/).length : 0
}

/** VO → 前端类型：wordRange 为空时按等级兜底，避免 type-check 的非空元组被击穿 */
function toTopic(vo: WritingTopicVO): WritingTopic {
  const level: WritingLevel = vo.level === 'CET6' ? 'CET6' : 'CET4'
  const range = vo.wordRange
  const validRange = Array.isArray(range) && range.length === 2 && range[0] != null && range[1] != null
  return {
    id: vo.id,
    type: (vo.type as WritingTopicType) ?? 'SHORT_ESSAY',
    level,
    title: vo.title ?? '',
    directions: vo.directions ?? '',
    topic: vo.topic ?? '',
    requirements: vo.requirements ?? [],
    wordRange: validRange ? [range[0], range[1]] : LEVEL_WORD_RANGE[level],
    timeLimitSeconds: vo.timeLimitSeconds ?? 1800,
    source: vo.source ?? undefined,
    outlineHints: vo.outlineHints ?? [],
    usefulExpressions: vo.usefulExpressions ?? [],
  }
}

function toDraft(vo: WritingDraftVO): WritingDraft {
  const content = vo.content ?? ''
  return {
    topicId: vo.topicId,
    content,
    wordCount: countWords(content),
    updatedAt: vo.updatedAt,
    elapsedSeconds: vo.elapsedSeconds ?? 0,
  }
}

/** 题库：一次取全并拍平为数组，页面调用方签名不变 */
export async function fetchWritingTopics(): Promise<WritingTopic[]> {
  const resp = await get<PageResult<WritingTopicVO>>(`${WRITING_BASE}/topics`, {
    page: 1,
    size: TOPICS_PAGE_SIZE,
  })
  return (resp?.records ?? []).map(toTopic)
}

export async function fetchDraft(topicId: string): Promise<WritingDraft | null> {
  const vo = await get<WritingDraftVO | null>(`${WRITING_BASE}/draft/${encodeURIComponent(topicId)}`)
  return vo ? toDraft(vo) : null
}

export async function saveDraft(topicId: string, content: string, elapsedSeconds = 0): Promise<WritingDraft> {
  const vo = await put<WritingDraftVO>(
    `${WRITING_BASE}/draft/${encodeURIComponent(topicId)}`,
    { content, elapsedSeconds: Math.max(0, Math.floor(elapsedSeconds)) },
  )
  return toDraft(vo)
}

/** 删草稿：后端幂等，不存在也返回成功 */
export async function clearDraft(topicId: string): Promise<void> {
  await del<void>(`${WRITING_BASE}/draft/${encodeURIComponent(topicId)}`)
}

export async function fetchDrafts(): Promise<WritingDraft[]> {
  const list = await get<WritingDraftVO[]>(`${WRITING_BASE}/drafts`)
  return (list ?? []).map(toDraft)
}

export async function fetchFavoriteIds(): Promise<string[]> {
  const list = await get<string[]>(`${WRITING_BASE}/favorites`)
  return list ?? []
}

export async function setFavorite(topicId: string, favorite: boolean): Promise<void> {
  await post<void>(`${WRITING_BASE}/favorites`, { topicKey: topicId, favorite })
}

export interface SubmitEssayInput {
  topicId: string
  content: string
  durationSeconds: number
  /** 题目标题快照，可选；仅用于后端留档 */
  topicTitle?: string
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
  const userStore = useUserStore()
  if (!userStore.userId) throw new Error('请先登录')

  // 题目标题非后端必填项；改为由调用方按当前题目透传，不再依赖静态题库反查
  const resp = await post<WritingSubmitResponseDTO>(`${WRITING_BASE}/submit`, {
    userId: userStore.userId,
    topicKey: input.topicId,
    topicTitle: input.topicTitle ?? '',
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
