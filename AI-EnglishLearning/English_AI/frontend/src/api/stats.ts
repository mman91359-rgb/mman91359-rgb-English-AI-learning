import { get } from './request'

/**
 * 能力雷达图数据
 */
export interface RadarData {
    userId: number
    eloScore: number
    eloLevel: string
    targetLevel: string
    vocabularyScore: number
    grammarScore: number
    listeningScore: number
    readingScore: number
    translationScore: number
    writingScore: number
    vocabularyPercent: number
    grammarPercent: number
    listeningPercent: number
    readingPercent: number
    translationPercent: number
    writingPercent: number
    eloFloor: number
    eloCeil: number
    eloProgress: number
}

/**
 * 用户完整信息（含能力雷达）
 */
export interface UserFullInfo {
    id: number
    username: string
    nickname: string
    avatarUrl: string
    cetLevel: string
    roles: string
    status: number
    lastLoginAt: string
    createdAt: string
}

/**
 * 获取能力雷达图数据
 * GET /user/radar/{userId}
 */
export const getRadarData = (userId: number): Promise<RadarData> => {
    return get(`/user/radar/${userId}`)
}

/**
 * 获取用户信息
 * GET /user/info/{userId}
 */
export const getUserInfo = (userId: number): Promise<UserFullInfo> => {
    return get(`/user/info/${userId}`)
}

/* ============================================================
   能力画像（个人资料页「分数 + 雷达图」）
   后端契约：GET /user/radar/{userId} 一次返回六维得分
   （vocabulary / grammar / reading / listening / translation / writing），
   六列同由 user_ability_radar 的移动加权公式维护，前端只做展示不重算。
   ============================================================ */

/** 能力维度标识，数组顺序即雷达图轴顺序 */
export type AbilityDimensionKey =
    | 'vocabulary'
    | 'grammar'
    | 'reading'
    | 'listening'
    | 'translation'
    | 'writing'

/** 单维度得分（0~100，保留一位小数） */
export interface AbilityDimension {
    key: AbilityDimensionKey
    score: number
    /** 该维度是否已有可用数据；false 时页面展示「—」且不计入雷达面积 */
    hasData: boolean
}

/** 能力画像：ELO 总分 + 六维得分 */
export interface AbilityRadar {
    userId: number
    eloScore: number
    eloLevel: string
    eloFloor: number
    eloCeil: number
    eloProgress: number
    dimensions: AbilityDimension[]
}

/** 统一保留一位小数，与后端模块分的精度一致 */
const round1 = (value: number): number => Math.round(value * 10) / 10

/**
 * 获取能力画像：一次请求拿到 ELO 与六维得分。
 * 旧后端可能不返回 translationScore / writingScore，用 ?? 0 兜底并标记为无数据。
 */
export const getAbilityRadar = async (userId: number): Promise<AbilityRadar> => {
    const radar = await getRadarData(userId)

    /** 后端分值即百分制，>0 视为已有数据 */
    const direct = (
        key: AbilityDimensionKey,
        score: number | undefined,
    ): AbilityDimension => {
        const value = round1(score ?? 0)
        return { key, score: value, hasData: value > 0 }
    }

    return {
        userId,
        eloScore: radar.eloScore || 0,
        eloLevel: radar.eloLevel || '',
        eloFloor: radar.eloFloor || 0,
        eloCeil: radar.eloCeil || 0,
        eloProgress: radar.eloProgress || 0,
        dimensions: [
            direct('vocabulary', radar.vocabularyScore),
            direct('grammar', radar.grammarScore),
            direct('reading', radar.readingScore),
            direct('listening', radar.listeningScore),
            direct('translation', radar.translationScore),
            direct('writing', radar.writingScore),
        ],
    }
}
