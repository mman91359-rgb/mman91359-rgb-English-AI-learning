package com.english.ai.exercise.service;

import com.english.ai.exercise.dto.QuestionVO;
import com.english.ai.exercise.dto.NewWordItemVO;
import com.english.ai.exercise.dto.UserWordLearnLogVO;
import com.english.ai.exercise.dto.WordBookVO;
import com.english.ai.exercise.dto.WordBookStatsVO;
import com.english.ai.exercise.dto.WordBookWordVO;
import com.english.ai.exercise.dto.UserWordFavoriteVO;
import com.english.ai.exercise.dto.WritingHistoryVO;
import com.english.ai.exercise.dto.TimelineItemVO;
import com.english.ai.exercise.dto.SubmitRequest;
import com.english.ai.exercise.dto.SubmitResponse;
import com.english.ai.exercise.dto.ReviewTaskVO;
import com.english.ai.exercise.dto.UserExerciseStats;
import com.english.ai.exercise.dto.FavoriteVO;
import com.english.ai.exercise.dto.VocabularyVO;
import com.english.ai.exercise.dto.ExerciseHistoryVO;
import com.english.ai.exercise.dto.DailyWordVO;
import com.english.ai.exercise.dto.WeakKnowledgePoint;
import com.english.ai.exercise.entity.SysKnowledgePoint;

import java.util.Collection;
import java.util.List;

/**
 * 练习服务接口
 */
public interface ExerciseService {

    /**
     * 智能选题
     */
    List<QuestionVO> selectQuestions(Long userId, Integer moduleType, int count);

    /**
     * 智能选题（带题目白名单）。
     *
     * <p>听力等需要按题型预过滤时，先查出允许的 questionId，再走同一套 ELO/难度逻辑，
     * 避免“先选题再过滤”造成 usage_count 多扣和数量不足。传入空集合直接返回空。</p>
     */
    List<QuestionVO> selectQuestions(Long userId, Integer moduleType, int count,
                                     Collection<Long> allowedQuestionIds);

    /** 选择新词练习题目，排除用户单词本中已存在的单词 */
    List<QuestionVO> selectNewVocabularyQuestions(Long userId, int count);

    /**
     * 选择新词练习条目（按当前词书 + 同等级约束，禁止跨书/跨等级兜底）。
     * 有题词返回题目，无题词返回词卡（从 word_dictionary 取释义/音标/例句）。
     */
    List<NewWordItemVO> selectNewWordItems(Long userId, int count);

    /**
     * 获取定级测试题（20题: 12词汇+8语法，难度均匀分布1~8）
     */
    List<QuestionVO> getAssessQuestions();

    /**
     * 单题详情（不返回答案）
     */
    QuestionVO getQuestionById(Long questionId, boolean showAnswer);

    /**
     * 批量取题（含答案，供learning-engine调用）
     */
    List<QuestionVO> getQuestionsBatch(List<Long> questionIds);

    /**
     * 提交答案并判分
     */
    SubmitResponse submitAnswer(SubmitRequest request);

    /**
     * 错题本
     */
    List<QuestionVO> getErrorBook(Long userId);

    /**
     * 知识点树
     */
    List<SysKnowledgePoint> getKnowledgePoints(String cetLevel);

    /**
     * 每日单词（全局统一，按日期固定）
     */
    DailyWordVO getDailyWord(String cetLevel);

    /**
     * 用户答题统计（用于热力图、学习时间等）
     */
    UserExerciseStats getUserStats(Long userId);

    // ========== 收藏句 ==========

    /** 添加收藏 */
    FavoriteVO addFavorite(Long userId, String sentenceText, Long questionId);

    /** 收藏列表 */
    List<FavoriteVO> getFavorites(Long userId);

    /** 删除收藏 */
    void removeFavorite(Long id, Long userId);

    // ========== 词书 ==========

    /** 词书列表（含每本总词数） */
    List<WordBookVO> getWordBooks();

    /** 词书学习统计（待背/已学/忽略/已掌握/今日计划） */
    WordBookStatsVO getWordBookStats(Long userId, String bookCode);

    /**
     * 词书单词表（分页）。
     *
     * <p>按 word_book_item.rank_no 升序返回整本词书的词条，并补充字典释义和
     * 当前用户的学习状态；keyword 为空时不过滤，非空时按单词前缀/包含匹配。</p>
     *
     * @param status 分类筛选：ALL / NEW（未学习）/ LEARNING（复习中，含 REVIEWING）/
     *               MASTERED（复习完成）/ FAMILIAR（已标熟）；为空视为 ALL。
     *               过滤在 SQL 层完成，分页与总数同口径。
     */
    List<WordBookWordVO> getWordBookWords(Long userId, String bookCode, Integer page, Integer size,
                                          String keyword, String status);

    /** 词书单词表总数（与分页同口径，含分类筛选） */
    long getWordBookWordCount(Long userId, String bookCode, String keyword, String status);

    // ========== 单词收藏 ==========

    /** 收藏单词（未学词不创建 user_vocabulary，不影响新词池与复习队列） */
    UserWordFavoriteVO addWordFavorite(Long userId, String word);

    /** 取消收藏单词 */
    void removeWordFavorite(Long userId, String word);

    /** 收藏单词列表 */
    List<UserWordFavoriteVO> getWordFavorites(Long userId);

    /** 忽略单词（status=IGNORE，退出新词池与复习） */
    VocabularyVO ignoreWord(Long id, Long userId);

    /**
     * 记录一次单词作答（新词/复习循环专用）。
     *
     * <p>只更新 user_vocabulary 的答对/答错计数与复习计划，并落一条单词事件；
     * 不进 user_exercise_log、不发金币、不动 ELO 与错题本。
     * 答错的词 next_review_at 立即设为现在，从而马上出现在今日复习队列。</p>
     */
    VocabularyVO recordWordAttempt(Long userId, Long questionId, String word, Boolean isCorrect);

    // ========== 写作历史 ==========

    /** 写作历史（数据源 writing_essay） */
    List<WritingHistoryVO> getWritingHistory(Long userId, Integer page, Integer size, String startTime, String endTime);

    /** 写作历史总数 */
    long getWritingHistoryCount(Long userId, String startTime, String endTime);

    // ========== 统一时间线 ==========

    /** 统一学习时间线（答题 + 单词事件 + 写作，按时间倒序） */
    List<TimelineItemVO> getTimeline(Long userId, Integer page, Integer size, String startTime, String endTime);

    /** 统一时间线总数（与分页同口径） */
    long getTimelineCount(Long userId, String startTime, String endTime);

    // ========== 单词本 ==========

    /** 添加单词，source 缺省为 manual，新词学习循环传 quiz */
    VocabularyVO addVocabulary(Long userId, String word, String translation, String source);

    /**
     * 智能添加单词：仅传入单词，由 AI 自动补全音标/词性/释义/例句/搭配
     * 并初始化艾宾浩斯复习计划（next_review_at = 明天）
     */
    VocabularyVO addVocabularySmart(Long userId, String word, String source);

    /** 单词本列表 */
    List<VocabularyVO> getVocabulary(Long userId);

    /** 单词本列表（分页 + 词书筛选 + 状态筛选） */
    List<VocabularyVO> getVocabulary(Long userId, Integer page, Integer size, String bookCode, String status);

    /** 单词本总数（与分页口径一致） */
    long getVocabularyCount(Long userId, String bookCode, String status);

    /** 删除单词 */
    void removeVocabulary(Long id, Long userId);

    /** 切换掌握状态 */
    VocabularyVO toggleMastered(Long id, Long userId);

    /**
     * 获取今日待复习单词列表
     * 规则：next_review_at <= 现在 且 isMastered = 0，最多返回 limit 条
     */
    List<VocabularyVO> getReviewList(Long userId);

    /**
     * 获取今日待复习单词列表（带上限，默认 50）
     */
    List<VocabularyVO> getReviewList(Long userId, Integer limit);

    /**
     * 提交单词复习结果
     * @param id 单词记录ID
     * @param userId 用户ID
     * @param isCorrect 是否记住
     * @return 更新后的单词记录
     */
    VocabularyVO reviewWord(Long id, Long userId, Boolean isCorrect);

    // ========== 学习历史 ==========

    /** 答题历史（分页） */
    List<ExerciseHistoryVO> getExerciseHistory(Long userId, Integer page, Integer size, Integer moduleType, Integer isCorrect, String startTime);

    /**
     * 答题历史（分页，支持起止时间）
     */
    List<ExerciseHistoryVO> getExerciseHistory(Long userId, Integer page, Integer size, Integer moduleType, Integer isCorrect, String startTime, String endTime);

    /**
     * 单词事件历史（分页，支持起止时间、事件类型、词书筛选）
     */
    List<UserWordLearnLogVO> getWordLearnHistory(Long userId, Integer page, Integer size, String eventType, String bookCode, String startTime, String endTime);

    /**
     * 获取学习历史总数
     */
    long getExerciseHistoryCount(Long userId, Integer moduleType, Integer isCorrect, String startTime);

    /**
     * 获取学习历史总数（带结束时间）
     */
    long getExerciseHistoryCount(Long userId, Integer moduleType, Integer isCorrect, String startTime, String endTime);

    /**
     * 单词事件历史总数
     */
    long getWordLearnHistoryCount(Long userId, String eventType, String bookCode, String startTime, String endTime);

    /**
     * 按答题记录ID反查单次提交的上下文（题干 / 标准答案 / 解析 / 用户作答）。
     *
     * <p>供 AI 对话流的结构化反馈卡使用：消息里只存 recordId，
     * 展开时用它在服务端还原内容，避免把业务模型塞进对话 store。</p>
     *
     * @return 记录不存在或不属于该用户时返回 null
     */
    ExerciseHistoryVO getExerciseLogDetail(Long logId, Long userId);

    // ========== 错题驱动同类题生成 ==========

    /**
     * 获取用户薄弱知识点列表
     * 查询用户所有未解决错题，统计每个知识点出现次数，按次数降序返回前10个
     *
     * @param userId 用户ID
     * @return 薄弱知识点列表（按错误次数降序）
     */
    List<WeakKnowledgePoint> getWeakKnowledgePoints(Long userId);

    /**
     * 根据错题生成同类强化练习题
     * 优先从正式题库中取同知识点、同难度、同题型的题目，
     * 不足部分通过 AI 生成并直接入库（无需审核，标记为PENDING）
     *
     * @param userId     用户ID
     * @param questionId 错题ID
     * @param count      需要生成的题目数量
     * @return 同类题目列表（供前端立即练习）
     */
    List<QuestionVO> generateSimilarQuestions(Long userId, Long questionId, int count);
}
