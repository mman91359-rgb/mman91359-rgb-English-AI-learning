import { get, post } from './request'
import type { QuestionVO, SubmitRequest, SubmitResponse } from './exercise'

/**
 * 翻译模块接口封装。
 * 翻译题（moduleType=3）复用智能选题与提交判题接口：
 * - 选题：GET /exercise/questions?moduleType=3
 * - 提交：POST /exercise/submit（moduleType=3）
 *
 * 翻译题型区分：短句翻译（short）与完整四六级翻译真题（passage）。
 * 题干中文长度 > 40 判定为段落翻译（与后端判题逻辑一致）。
 */

/** 翻译提交结果（在 SubmitResponse 基础上补充翻译专属字段） */
export interface TranslationSubmitResult extends SubmitResponse {
  /** 用户译文 */
  userAnswer?: string
  /** 参考译文 */
  referenceAnswer?: string
  /** AI 判断理由（若走 AI 语义判对） */
  aiReason?: string
}

/**
 * 选择翻译题（复用智能选题，moduleType=3）
 * GET /exercise/questions?userId=1&moduleType=3&count=5
 */
export const selectTranslationQuestions = (
  userId: number,
  count: number = 5,
): Promise<QuestionVO[]> => {
  return get('/exercise/questions', { userId, moduleType: 3, count })
}

/**
 * 提交翻译答案（复用提交判题，moduleType=3）
 * POST /exercise/submit
 */
export const submitTranslation = (data: SubmitRequest): Promise<TranslationSubmitResult> => {
  return post('/exercise/submit', data)
}

/**
 * 判断是否为段落翻译（题干中文长度 > 40）
 * 与后端 ExerciseServiceImpl 的判定阈值保持一致。
 */
export const isPassageTranslation = (stem: string): boolean => {
  return (stem || '').length > 40
}
