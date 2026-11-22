import { get, post, del, put } from './request'

/**
 * 题目视图对象
 */
export interface QuestionVO {
    /** 题目ID */
    id: number
    /** 模块类型: 1词汇 2语法 3翻译 4听力 5造句 6写作 */
    moduleType: number
    /** 难度等级: 1~8 */
    difficultyLevel: number
    /** 题型 */
    questionType: string
    /** 题干 */
    stem: string
    /** 选项(JSON字符串) */
    options: string
    /** 正确答案（练习模式不返回，提交后才展示） */
    correctAnswer?: string
    /** 提示（正确答案前2个字母，练习模式可用） */
    hint?: string
    /** 题目解析 */
    analysis?: string
    /** 是否展示答案 */
    showAnswer?: boolean
    /** 听力音频地址（仅听力题有值） */
    audioUrl?: string
    /** 听力原文（提交后才返回） */
    transcript?: string
    /** 听力 LRC 字幕（提交后才返回） */
    lrcContent?: string
    /** 文章段播放时长（秒），区别于答题用时 */
    durationSeconds?: number
    /** 完整音频总时长（秒） */
    audioTotalSeconds?: number
    /** 文章段起点（秒，包含） */
    audioStartSeconds?: number
    /** 文章段终点（秒，不包含） */
    audioEndSeconds?: number
    /** 题目段起点（秒，包含） */
    questionStartSeconds?: number
    /** 题目段终点（秒，不包含） */
    questionEndSeconds?: number
    /** 答案关键句起点（秒，包含），复听定位用 */
    answerStartSeconds?: number
    /** 答案关键句终点（秒，不包含） */
    answerEndSeconds?: number
    /** 题组/音频段落标识 */
    groupKey?: string
    /** 听力题型 */
    listeningType?: string
    /** 结构化卷别来源（非真题为 null），由后端 QuestionSourceResolver 解析 groupKey 得到 */
    source?: {
        exam: 'CET4' | 'CET6'
        year: number
        month: number
        paper: number
        label: string
    } | null
}

/**
 * 提交答案请求
 */
export interface SubmitRequest {
    userId: number
    questionId: number
    userAnswer: string
    moduleType: number
    durationSeconds?: number
    /** 仅练习：只判题，不写答题记录/不更新 ELO/金币 */
    practiceOnly?: boolean
    /** 只记统计：写答题记录并计入正确率，但不发金币、不推进 ELO 与遗忘曲线；practiceOnly 优先 */
    statsOnly?: boolean
    /** 练习组唯一键（≤64 位），用于一组题做完后结算积分；不传则不参与结算 */
    batchKey?: string
}

/**
 * 提交答案响应
 */
export interface SubmitResponse {
    /** 是否正确 */
    isCorrect: boolean
    /** 用户提交的答案（部分页面本地兜底使用） */
    userAnswer?: string
    /** 正确答案（完整文本） */
    correctAnswer: string
    /** 正确答案选项（仅字母） */
    correctAnswerKey: string
    /** 题目解析 */
    analysis: string
    /** 追踪ID */
    traceId: string
    /**
     * 本次答题记录ID（user_exercise_log 主键）。
     * 供 AI 对话流反查这次提交的完整上下文；practiceOnly 提交不写日志，此时为空。
     */
    logId?: number
    /** 启发式反馈提示 */
    heuristicHint?: string
    /** 错误类型 */
    errorType?: string
    /** 匹配层级 */
    matchedLevel?: number
    /** 额外建议列表 */
    suggestions?: string[]
    /** 是否为语义匹配（近义词/同义表达被判对），此时应展示标准答案供参考 */
    isSemanticMatch?: boolean
    /** 本次提交触发的金币奖励（未触发时为空） */
    coinAwarded?: number
    /** 发放后的金币余额 */
    coinBalance?: number
    /** 听力原文（仅听力题提交后返回） */
    transcript?: string
    /** 听力 LRC 字幕（仅听力题提交后返回） */
    lrcContent?: string
}

/** 学习会话上报请求 */
export interface StudySessionReportRequest {
    userId: number
    sessionKey: string
    activeSeconds: number
    sessionStartedAt: number
}

/** 学习会话上报响应 */
export interface StudySessionReportResponse {
    activeSeconds: number
    statDate: string
}

/**
 * 知识点
 */
export interface SysKnowledgePoint {
    id: number
    name: string
    parentId?: number
    cetLevel: string
    sortOrder: number
}

/**
 * 智能选题
 * GET /exercise/questions?userId=1&moduleType=1&count=10
 */
export const selectQuestions = (userId: number, moduleType: number = 1, count: number = 10): Promise<QuestionVO[]> => {
    return get('/exercise/questions', { userId, moduleType, count })
}

/** 新词练习选题：后端会排除单词本中已有的单词 */
export const selectNewVocabularyQuestions = (userId: number, count: number = 10): Promise<QuestionVO[]> => {
    return get('/exercise/vocabulary/new-questions', { userId, count })
}

/**
 * 定级测试题
 * GET /exercise/assess-questions
 */
export const getAssessQuestions = (): Promise<QuestionVO[]> => {
    return get('/exercise/assess-questions')
}

/**
 * 单题详情
 * GET /exercise/question/{id}
 */
export const getQuestionById = (id: number, showAnswer: boolean = false): Promise<QuestionVO> => {
    return get(`/exercise/question/${id}`, { showAnswer })
}

/**
 * 提交答案
 * POST /exercise/submit
 */
export const submitAnswer = (data: SubmitRequest): Promise<SubmitResponse> => {
    return post('/exercise/submit', data)
}

/** 练习组积分结算结果 */
export interface PracticeSettleResult {
    /** 本组是否正确率达到 60% 计分门槛 */
    qualified: boolean
    /** 本次是否实际发放积分（幂等重复请求为 false） */
    awarded: boolean
    /** 本组正确率(0~100) */
    accuracy: number
    /** 本组总题数 */
    totalCount: number
    /** 本组答对题数 */
    correctCount: number
    /** 扣除每日上限前应得积分 */
    rawPoints: number
    /** 本次实发积分 */
    points: number
    /** 是否触发每日上限 */
    dailyLimitReached: boolean
    /** 结算后累计积分 */
    totalPoints?: number
    /** 当前称号 */
    title?: string
    /** 下一称号；已封顶为 null */
    nextTitle?: string | null
    /** 当前称号区间下界 */
    titleFloor?: number
    /** 当前称号区间上界 */
    titleCeil?: number
    /** 当前称号内进度百分比 */
    titleProgress?: number
    /** 未结算原因：NO_RECORD / SETTLE_FAILED；正常为 null */
    reason?: string | null
}

/**
 * 结算一组练习的积分（幂等：同一 batchKey 重复调用返回首次结果）
 * POST /exercise/practice/settle
 */
export const settlePractice = (
    userId: number,
    batchKey: string,
): Promise<PracticeSettleResult> => {
    return post('/exercise/practice/settle', { userId, batchKey })
}

/** 生成练习组唯一键：时间戳 + 随机串，长度远小于 64 位上限 */
export const newPracticeBatchKey = (moduleType: number): string => {
    const random = Math.random().toString(36).slice(2, 10)
    return `p${moduleType}-${Date.now().toString(36)}-${random}`
}

/** 听力答题统计 */
export interface ListeningStats {
    totalAnswered: number
    correctCount: number
    correctRate: number
}

/** 听力题型（与后端 ListeningType 一致） */
export const LISTENING_TYPES = [
    'SHORT_DIALOGUE',
    'LONG_DIALOGUE',
    'PASSAGE',
    'LECTURE',
    'NEWS',
    'OTHER',
] as const

export type ListeningType = (typeof LISTENING_TYPES)[number]

/**
 * 听力练习队列（复用智能选题）
 * GET /exercise/listening/questions?userId=1&count=5&listeningType=LONG_DIALOGUE
 */
export const selectListeningQuestions = (
    userId: number,
    count: number = 5,
    listeningType?: string,
): Promise<QuestionVO[]> => {
    return get('/exercise/listening/questions', { userId, count, listeningType })
}

/**
 * 听力单题详情
 * GET /exercise/listening/question/{id}?showAnswer=false&userId=1
 */
export const getListeningQuestion = (
    id: number,
    showAnswer: boolean = false,
    userId?: number,
): Promise<QuestionVO> => {
    return get(`/exercise/listening/question/${id}`, { showAnswer, userId })
}

/**
 * 提交听力答案（强制 moduleType=4）
 * POST /exercise/listening/submit
 */
export const submitListeningAnswer = (data: Omit<SubmitRequest, 'moduleType'>): Promise<SubmitResponse> => {
    return post('/exercise/listening/submit', { ...data, moduleType: 4 })
}

/**
 * 听力答题统计
 * GET /exercise/listening/stats/{userId}
 */
export const getListeningStats = (userId: number): Promise<ListeningStats> => {
    return get(`/exercise/listening/stats/${userId}`)
}

/** 上报学习会话累计活跃秒数 */
export const reportStudySession = (data: StudySessionReportRequest): Promise<StudySessionReportResponse> => {
    return post('/exercise/study-session/report', data)
}

/**
 * 错题本
 * GET /exercise/error-book/{userId}
 */
export const getErrorBook = (userId: number): Promise<QuestionVO[]> => {
    return get(`/exercise/error-book/${userId}`)
}

/**
 * 知识点树
 * GET /exercise/knowledge-points?cetLevel=CET4
 */
export const getKnowledgePoints = (cetLevel: string = 'CET4'): Promise<SysKnowledgePoint[]> => {
    return get('/exercise/knowledge-points', { cetLevel })
}

/**
 * 用户答题统计返回类型
 */
export interface UserExerciseStats {
    totalAnswered: number
    correctCount: number
    errorCount: number
    correctRate: number
    totalDurationSeconds: number
    totalHours: number
    totalMinutes: number
    todayDurationSeconds: number
    activeDays: number
    masteredWords: number
    nationalRankPercent: number
    vocabularyComprehension: number
    heatmapData: { date: string; questionCount: number; activityLevel: number; title?: string }[]
    recentWeekMinutes: number[]
    recent7DaysMinutes: number[]
    recent7DaysLabels: string[]
    weeklyAverageQuestions: number
    yearlyMonthQuestions: number[]
    yearlyStudyMinutes: number[]
    hourlyStudyMinutes: number[]
    todayAnsweredCount: number
    todayVocabAnswered: number
    todayGrammarAnswered: number
    todayLearnedWords: number
    todayReviewedWords: number
}

/**
 * 用户答题统计
 * GET /exercise/stats/{userId}
 */
export const getExerciseStats = (userId: number): Promise<UserExerciseStats> => {
    return get(`/exercise/stats/${userId}`)
}

// ========== 收藏句 ==========

export interface FavoriteVO {
    id: number
    userId: number
    sentenceText: string
    questionId?: number
    sourceType: string
    /** 模块类型: 1词汇 2语法 3翻译 4听力 5造句 6写作；存量数据可能为空，缺省时用 sourceType 兜底 */
    moduleType?: number
    createdAt: string
}

export const addFavorite = (data: {
    userId: number
    sentenceText: string
    questionId?: number
    moduleType?: number
}): Promise<FavoriteVO> => {
    return post('/exercise/favorites', data)
}

export const getFavorites = (userId: number): Promise<FavoriteVO[]> => {
    return get(`/exercise/favorites/${userId}`)
}

export const removeFavorite = (id: number, userId: number): Promise<string> => {
    return del(`/exercise/favorites/${id}?userId=${userId}`)
}

// ========== 单词本 ==========

export interface VocabularyVO {
    id: number
    userId: number
    word: string
    translation: string
    /** 音标 */
    phonetic?: string
    /** 词性 */
    pos?: string
    /** 英文例句 */
    example?: string
    /** 例句中文翻译 */
    exampleTranslation?: string
    /** 常见搭配 */
    collocation?: string
    /** 来源: manual/daily_word/quiz */
    source?: string
    /** 学习状态: LEARNING/REVIEWING/MASTERED/IGNORE */
    status?: string
    /** 关联 word_dictionary.id */
    wordId?: number
    /** 词书归属 word_book.id */
    bookId?: number
    /** 首次学习时间 */
    firstLearnedAt?: string
    /** 累计答对次数 */
    correctCount?: number
    /** 累计答错次数 */
    wrongCount?: number
    /** 最近一次复习结果 */
    lastResult?: string
    /** 累计复习次数 */
    reviewCount?: number
    /** 掌握度等级 0-5 */
    masteryLevel?: number
    /** 上次复习时间 */
    lastReviewedAt?: string
    /** 下次复习时间 */
    nextReviewAt?: string
    isMastered: number
    createdAt: string
    updatedAt: string
}

/** 智能添加单词请求参数 */
export interface AddVocabularySmartRequest {
    userId: number
    word: string
    /** 来源: manual/daily_word/quiz */
    source?: string
}

/** 复习结果请求参数 */
export interface ReviewResultRequest {
    userId: number
    isCorrect: boolean
}

export const addVocabulary = (data: {
    userId: number
    word: string
    translation?: string
    source?: string
}): Promise<VocabularyVO> => {
    return post('/exercise/vocabulary', data)
}

/**
 * 智能添加单词：只传 userId 和 word，AI 自动补全音标/词性/释义/例句/搭配
 * 并初始化艾宾浩斯复习计划（next_review_at = 明天）
 */
export const addVocabularySmart = (data: AddVocabularySmartRequest): Promise<VocabularyVO> => {
    return post('/exercise/vocabulary/smart', data)
}

/** 分页查询单词本（带词书/状态筛选） */
export const getVocabularyPage = (
    userId: number,
    page: number = 1,
    size: number = 20,
    bookCode?: string,
    status?: string,
): Promise<{ records: VocabularyVO[]; total: number; page: number; size: number }> => {
    const params: Record<string, any> = { page, size }
    if (bookCode) params.bookCode = bookCode
    if (status) params.status = status
    return get(`/exercise/vocabulary/${userId}`, params)
}

export const removeVocabulary = (id: number, userId: number): Promise<string> => {
    return del(`/exercise/vocabulary/${id}?userId=${userId}`)
}

export const toggleMastered = (id: number, userId: number): Promise<VocabularyVO> => {
    return put(`/exercise/vocabulary/${id}/toggle?userId=${userId}`)
}

/** 获取今日待复习单词列表 */
export const getReviewList = (userId: number): Promise<VocabularyVO[]> => {
    return get(`/exercise/vocabulary/review/${userId}`)
}

/** 提交单词复习结果（记住/没记住） */
export const reviewWord = (id: number, data: ReviewResultRequest): Promise<VocabularyVO> => {
    return put(`/exercise/vocabulary/${id}/review`, data)
}

/** 忽略单词 */
export const ignoreWord = (id: number, userId: number): Promise<VocabularyVO> => {
    return put(`/exercise/vocabulary/${id}/ignore?userId=${userId}`)
}

/**
 * 记录一次单词作答（词汇练习循环专用）。
 * 有题时传 questionId（后端用 answer_word 取词条原形），词卡作答传 word。
 * 只更新单词本计数与复习计划，不进答题统计、不发金币；答错立刻进复习队列。
 */
export const recordWordAttempt = (
    userId: number,
    payload: { questionId?: number; word?: string; isCorrect: boolean },
): Promise<VocabularyVO> => {
    return post('/exercise/vocabulary/attempt', { userId, ...payload })
}

// ========== 词书 ==========

export interface WordBookVO {
    id: number
    code: string
    name: string
    level: string
    description?: string
    total: number
}

export interface WordBookStatsVO {
    bookCode: string
    total: number
    learned: number
    mastered: number
    /** 已标熟数（status=FAMILIAR）；「忽略」已与「标熟」合并 */
    familiar: number
    toLearn: number
    todayPlan: number
}

/** 词书单词表条目 */
export interface WordBookWordVO {
    word: string
    phonetic?: string
    translation?: string
    pos?: string
    example?: string
    exampleTranslation?: string
    rankNo?: number
    wordId?: number
    /** 当前用户学习状态: LEARNING/REVIEWING/MASTERED/FAMILIAR；未学为 undefined */
    status?: string
    /** 是否已掌握 0/1；未学为 0 */
    isMastered?: number
}

export interface WordBookWordsPage {
    records: WordBookWordVO[]
    total: number
    page: number
    size: number
}

/** 词书词表分类筛选档位 */
export type WordBookWordFilter = 'ALL' | 'NEW' | 'LEARNING' | 'MASTERED' | 'FAMILIAR'

export const getWordBooks = (): Promise<WordBookVO[]> => {
    return get('/exercise/word-books')
}

export const getWordBookStats = (bookCode: string, userId: number): Promise<WordBookStatsVO> => {
    return get(`/exercise/word-books/${bookCode}/stats`, { userId })
}

/**
 * 词书单词表：按书内名次分页，带释义与用户学习状态。
 *
 * filter 为分类筛选，过滤在后端 SQL 层完成，total 与分页同口径。
 */
export const getWordBookWords = (
    bookCode: string,
    userId: number,
    page: number = 1,
    size: number = 20,
    keyword?: string,
    filter: WordBookWordFilter = 'ALL',
): Promise<WordBookWordsPage> => {
    const params: Record<string, any> = { userId, page, size }
    if (keyword && keyword.trim()) params.keyword = keyword.trim()
    if (filter && filter !== 'ALL') params.status = filter
    return get(`/exercise/word-books/${encodeURIComponent(bookCode)}/words`, params)
}

// ========== 已学词库与标熟 ==========

/** 已学词库条目 */
export interface LearnedWordVO {
    id: number
    word: string
    translation?: string
    phonetic?: string
    pos?: string
    example?: string
    /** 学习状态: LEARNING/REVIEWING/MASTERED/FAMILIAR */
    status: string
    bookCode?: string
    bookName?: string
    firstLearnedAt?: string
    masteredAt?: string
    familiarAt?: string
    /** 分组日 yyyy-MM-dd（后端已截断，前端不得再做时区转换） */
    groupDate?: string
    correctCount?: number
    wrongCount?: number
    reviewCount?: number
}

/** 已学词库日期分组头 */
export interface LearnedWordDateVO {
    date: string
    count: number
}

export interface LearnedWordsPage {
    records: LearnedWordVO[]
    total: number
    page: number
    size: number
}

/** 词汇量汇总（统计页「个人词汇量」组件） */
export interface VocabularySummaryVO {
    total: number
    learning: number
    mastered: number
    familiar: number
    dueReview: number
}

/** 已学词库分类 tab：复习中（含 REVIEWING）/ 复习完成 / 已标熟 */
export type LearnedWordTab = 'LEARNING' | 'MASTERED' | 'FAMILIAR'

/** 日期分组头：按分组日倒序 */
export const getLearnedDateGroups = (
    userId: number,
    tab: LearnedWordTab,
): Promise<LearnedWordDateVO[]> => {
    return get('/exercise/vocabulary/learned/dates', { userId, status: tab })
}

/** 已学词库词条：可按分组日过滤，不传 date 表示不限日期 */
export const getLearnedWords = (
    userId: number,
    tab: LearnedWordTab,
    date?: string,
    page: number = 1,
    size: number = 50,
): Promise<LearnedWordsPage> => {
    const params: Record<string, any> = { userId, page, size, status: tab }
    if (date) params.date = date
    return get('/exercise/vocabulary/learned', params)
}

/** 标记标熟 / 取消标熟（familiar=false 取消） */
export const markFamiliar = (
    id: number,
    userId: number,
    familiar: boolean = true,
): Promise<{ id: number; word: string; status: string; familiarAt?: string }> => {
    return post(`/exercise/vocabulary/${id}/familiar?userId=${userId}&familiar=${familiar}`)
}

/** 批量取消标熟（「已标熟」分类页多选批量用），返回实际变更条数 */
export const batchUnfamiliar = (userId: number, ids: number[]): Promise<number> => {
    return post(`/exercise/vocabulary/familiar/batch?userId=${userId}&ids=${ids.join(',')}`)
}

/** 词汇量汇总 */
export const getVocabularySummary = (userId: number): Promise<VocabularySummaryVO> => {
    return get('/exercise/stats/vocabulary-summary', { userId })
}

// ========== 单词收藏 ==========

export interface UserWordFavoriteVO {
    id: number
    userId: number
    wordId?: number
    word: string
    phonetic?: string
    translation?: string
    pos?: string
    createdAt: string
}

export const addWordFavorite = (userId: number, word: string): Promise<UserWordFavoriteVO> => {
    return post('/exercise/word-favorites', { userId, word })
}

export const removeWordFavorite = (userId: number, word: string): Promise<string> => {
    return del(`/exercise/word-favorites?userId=${userId}&word=${encodeURIComponent(word)}`)
}

export const getWordFavorites = (userId: number): Promise<UserWordFavoriteVO[]> => {
    return get(`/exercise/word-favorites/${userId}`)
}

// ========== 新词条目（词书约束 + 词卡降级） ==========

export interface WordCardVO {
    word: string
    phonetic?: string
    translation?: string
    pos?: string
    example?: string
    exampleTranslation?: string
    rankNo?: number
}

export interface NewWordItemVO {
    type: 'QUESTION' | 'CARD'
    question?: QuestionVO
    card?: WordCardVO
}

export const selectNewWordItems = (userId: number, count: number = 10): Promise<NewWordItemVO[]> => {
    return get('/exercise/vocabulary/new-items', { userId, count })
}

// ========== 单词事件历史 ==========

export interface UserWordLearnLogVO {
    id: number
    userId: number
    wordId?: number
    word: string
    eventType: string
    /** 作答结果: CORRECT/WRONG（仅 LEARN/REVIEW/MASTER 有值） */
    result?: string
    bookCode?: string
    createdAt: string
}

export interface WordHistoryPage {
    records: UserWordLearnLogVO[]
    total: number
    page: number
    size: number
}

export const getWordLearnHistory = (
    userId: number,
    page: number = 1,
    size: number = 20,
    eventType?: string,
    bookCode?: string,
    startTime?: string,
    endTime?: string,
): Promise<WordHistoryPage> => {
    const params: Record<string, any> = { page, size }
    if (eventType) params.eventType = eventType
    if (bookCode) params.bookCode = bookCode
    if (startTime) params.startTime = startTime
    if (endTime) params.endTime = endTime
    return get(`/exercise/word-history/${userId}`, params)
}

// ========== 写作历史 ==========

export interface WritingHistoryVO {
    id: number
    userId: number
    topicKey: string
    topicTitle?: string
    wordCount?: number
    durationSeconds?: number
    aiScored: number
    rawScore?: number
    weightedScore?: number
    createdAt: string
}

export interface WritingHistoryPage {
    records: WritingHistoryVO[]
    total: number
    page: number
    size: number
}

export const getWritingHistory = (
    userId: number,
    page: number = 1,
    size: number = 20,
    startTime?: string,
    endTime?: string,
): Promise<WritingHistoryPage> => {
    const params: Record<string, any> = { page, size }
    if (startTime) params.startTime = startTime
    if (endTime) params.endTime = endTime
    return get(`/exercise/writing-history/${userId}`, params)
}

// ========== 统一时间线 ==========

export interface TimelineItemVO {
    source: 'ANSWER' | 'WORD' | 'WRITING'
    id: number
    createdAt: string
    /** ANSWER */
    questionId?: number
    moduleType?: number
    isCorrect?: number
    stem?: string
    /** WORD */
    word?: string
    eventType?: string
    /** 作答结果: CORRECT/WRONG（仅答题类单词事件有值） */
    result?: string
    bookCode?: string
    /** WRITING */
    topicTitle?: string
    weightedScore?: number
}

export interface TimelinePage {
    records: TimelineItemVO[]
    total: number
    page: number
    size: number
}

export const getTimeline = (
    userId: number,
    page: number = 1,
    size: number = 20,
    startTime?: string,
    endTime?: string,
): Promise<TimelinePage> => {
    const params: Record<string, any> = { page, size }
    if (startTime) params.startTime = startTime
    if (endTime) params.endTime = endTime
    return get(`/exercise/timeline/${userId}`, params)
}

// ========== 每日单词 ==========

export interface DailyWordVO {
    id: number
    word: string
    phonetic: string
    translation: string
    pos: string
    example: string
    exampleTranslation: string
    level: string
    date: string
}

export const getDailyWord = (level: string = 'CET4'): Promise<DailyWordVO> => {
    return get('/exercise/daily-word', { level })
}

// ========== 学习历史 ==========

export interface ExerciseHistoryVO {
    logId: number
    questionId: number
    stem: string
    userAnswer: string
    correctAnswer: string
    isCorrect: number
    durationSeconds: number
    moduleType: number
    questionType: string
    difficultyLevel: number
    createdAt: string
    analysis?: string
}

export interface HistoryPage {
    records: ExerciseHistoryVO[]
    total: number
    page: number
    size: number
}

/**
 * 按答题记录ID反查单次提交的上下文。
 * GET /exercise/log/{logId}?userId=
 *
 * 用于 AI 对话流的结构化反馈卡：消息只存 recordId，展开时才回捞内容。
 * 注意返回体只包含题库自带的 analysis，不含判分当时的启发式提示与建议
 * （user_exercise_log 不落这两个字段）。
 */
export const fetchExerciseLogDetail = (logId: number, userId: number): Promise<ExerciseHistoryVO> => {
    return get(`/exercise/log/${logId}`, { userId })
}

export const getExerciseHistory = (
    userId: number,
    page: number = 1,
    size: number = 20,
    moduleType?: number,
    isCorrect?: number,
    startTime?: string,
    endTime?: string,
): Promise<HistoryPage> => {
    const params: Record<string, any> = { page, size }
    if (moduleType !== undefined && moduleType !== 0) params.moduleType = moduleType
    if (isCorrect !== undefined && isCorrect >= 0) params.isCorrect = isCorrect
    if (startTime) params.startTime = startTime
    if (endTime) params.endTime = endTime
    return get(`/exercise/history/${userId}`, params)
}

// ========== AI 题目审核管理 ==========

/**
 * 待审核题目实体
 */
export interface PendingQuestion {
    /** 主键ID */
    id: number
    /** 模块类型: 1词汇 2语法 3翻译 4听力 5造句 6写作 */
    moduleType: number
    /** 目标等级: CET4/CET6 */
    targetLevel: string
    /** 难度等级: 1~8 */
    difficultyLevel: number
    /** 题型: FILL_BLANK/SENTENCE_MAKING */
    questionType: string
    /** 题干 */
    stem: string
    /** 选项(JSON数组字符串) */
    options: string
    /** 正确答案 */
    correctAnswer: string
    /** 题目解析 */
    analysis: string
    /** 关联知识点名称 */
    knowledgePointName: string
    /** 审核状态: PENDING/APPROVED/REJECTED */
    status: string
    /** 审核人ID */
    reviewerId?: number
    /** 审核意见 */
    reviewComment?: string
    /** 创建时间 */
    createdAt: string
    /** 更新时间 */
    updatedAt?: string
}

/**
 * AI 批量生成题目
 * POST /exercise/generate-questions
 * @returns 成功保存到待审核表的题目数量
 */
export const generateQuestions = (data: {
    knowledgePoint: string
    cetLevel: string
    difficulty: number
    questionType: string
    count: number
}): Promise<number> => {
    return post('/exercise/generate-questions', data)
}

/**
 * 查询待审核题目列表
 * GET /exercise/pending-questions?status=PENDING
 */
export const getPendingQuestions = (status: string): Promise<PendingQuestion[]> => {
    return get('/exercise/pending-questions', { status })
}

/**
 * 审核通过题目
 * POST /exercise/pending-questions/{id}/approve
 */
export const approvePendingQuestion = (id: number, reviewerId: number = 1): Promise<string> => {
    return post(`/exercise/pending-questions/${id}/approve`, { reviewerId })
}

/**
 * 驳回题目
 * POST /exercise/pending-questions/{id}/reject
 */
export const rejectPendingQuestion = (id: number, comment: string, reviewerId: number = 1): Promise<string> => {
    return post(`/exercise/pending-questions/${id}/reject`, { reviewerId, comment })
}

// ========== 错题驱动同类题生成 ==========

/**
 * 薄弱知识点
 */
export interface WeakKnowledgePoint {
    /** 知识点ID */
    knowledgePointId: number
    /** 知识点名称 */
    knowledgePointName: string
    /** 该知识点错题数量 */
    errorCount: number
}

/**
 * 获取用户薄弱知识点列表
 * GET /exercise/weak-points/{userId}
 * 统计用户所有未解决错题中每个知识点的出现次数，按次数降序返回前10个
 */
export const getWeakPoints = (userId: number): Promise<WeakKnowledgePoint[]> => {
    return get(`/exercise/weak-points/${userId}`)
}

/**
 * 生成同类强化练习题
 * POST /exercise/generate-similar
 * 请求体: { userId, questionId, count }
 * 优先取正式题库中同知识点题目，不足部分由 AI 生成
 */
export const generateSimilar = (data: {
    userId: number
    questionId: number
    count: number
}): Promise<QuestionVO[]> => {
    return post('/exercise/generate-similar', data)
}
