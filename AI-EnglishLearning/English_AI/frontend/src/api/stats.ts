import { get } from './request'

/**
 * 能力雷达图数据
 */
export interface RadarData {
    userId: number
    /** ELO 内部隐藏分，仅用于选题难度匹配，画像页不再展示 */
    eloScore: number
    eloLevel: string
    targetLevel: string
    /** 六维得分：非写作维度为累计正确率，写作维度为 AI 评分得分率 */
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
    /** 六维累计作答题数 */
    vocabularyTotal: number
    grammarTotal: number
    listeningTotal: number
    readingTotal: number
    translationTotal: number
    writingTotal: number
    /** 六维累计答对题数 */
    vocabularyCorrect: number
    grammarCorrect: number
    listeningCorrect: number
    readingCorrect: number
    translationCorrect: number
    writingCorrect: number
    /** 六维是否已有可用数据（样本不足 5 题时为 false） */
    vocabularyHasData: boolean
    grammarHasData: boolean
    listeningHasData: boolean
    readingHasData: boolean
    translationHasData: boolean
    writingHasData: boolean
    /** 已达标模块的算术平均；全部未达标为 null */
    overallAbilityScore: number | null
    /** 累计练习积分 */
    practicePoints: number
    /** 当前称号 */
    practiceTitle: string
    /** 当前称号区间下界 */
    titleFloor: number
    /** 当前称号区间上界 */
    titleCeil: number
    /** 当前称号内进度百分比 */
    titleProgress: number
    /** 下一称号；已封顶为 null */
    nextTitle: string | null
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
    /** 非写作维度为累计正确率（答对数 ÷ 总题数），写作维度为 AI 评分得分率 */
    score: number
    /** 该维度是否已有可用数据；false 时页面展示「—」且不计入综合分 */
    hasData: boolean
    /** 累计作答总题数（写作维度为评分次数） */
    total: number
    /** 累计答对题数（写作维度为 0） */
    correct: number
}

/** 能力画像：累计练习积分 + 称号 + 六维正确率 */
export interface AbilityRadar {
    userId: number
    /** 累计练习积分（只增不减） */
    practicePoints: number
    /** 当前称号 */
    practiceTitle: string
    /** 当前称号区间下界 */
    titleFloor: number
    /** 当前称号区间上界 */
    titleCeil: number
    /** 当前称号内进度百分比 */
    titleProgress: number
    /** 下一称号；已封顶为 null */
    nextTitle: string | null
    /** 有数据维度的算术平均；全部无数据为 null */
    overallAbilityScore: number | null
    dimensions: AbilityDimension[]
}

/** 统一保留一位小数，与后端模块分的精度一致 */
const round1 = (value: number): number => Math.round(value * 10) / 10

/**
 * 获取能力画像：一次请求拿到练习积分、称号与六维正确率。
 * 旧后端可能缺少新增字段，统一用 ?? 兜底，避免整页报错。
 */
export const getAbilityRadar = async (userId: number): Promise<AbilityRadar> => {
    const radar = await getRadarData(userId)

    const dimension = (
        key: AbilityDimensionKey,
        score: number | undefined,
        total: number | undefined,
        correct: number | undefined,
        hasData: boolean | undefined,
    ): AbilityDimension => ({
        key,
        score: round1(score ?? 0),
        hasData: hasData ?? false,
        total: total ?? 0,
        correct: correct ?? 0,
    })

    return {
        userId,
        practicePoints: radar.practicePoints ?? 0,
        practiceTitle: radar.practiceTitle ?? '',
        titleFloor: radar.titleFloor ?? 0,
        titleCeil: radar.titleCeil ?? 0,
        titleProgress: radar.titleProgress ?? 0,
        nextTitle: radar.nextTitle ?? null,
        overallAbilityScore: radar.overallAbilityScore == null
            ? null
            : round1(radar.overallAbilityScore),
        dimensions: [
            dimension('vocabulary', radar.vocabularyScore, radar.vocabularyTotal,
                radar.vocabularyCorrect, radar.vocabularyHasData),
            dimension('grammar', radar.grammarScore, radar.grammarTotal,
                radar.grammarCorrect, radar.grammarHasData),
            dimension('reading', radar.readingScore, radar.readingTotal,
                radar.readingCorrect, radar.readingHasData),
            dimension('listening', radar.listeningScore, radar.listeningTotal,
                radar.listeningCorrect, radar.listeningHasData),
            dimension('translation', radar.translationScore, radar.translationTotal,
                radar.translationCorrect, radar.translationHasData),
            dimension('writing', radar.writingScore, radar.writingTotal,
                radar.writingCorrect, radar.writingHasData),
        ],
    }
}
