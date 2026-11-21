package com.english.ai.exercise.controller;

import com.english.ai.common.BusinessException;
import com.english.ai.common.ErrorCode;
import com.english.ai.common.Result;
import com.english.ai.common.UserIdentityUtil;
import com.english.ai.exercise.dto.*;
import com.english.ai.exercise.entity.SysKnowledgePoint;
import com.english.ai.exercise.entity.UserVocabulary;
import com.english.ai.exercise.service.ExerciseService;
import com.english.ai.exercise.service.impl.LearnedVocabularyService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 练习服务控制器
 */
@Slf4j
@RestController
@RequestMapping("/exercise")
@RequiredArgsConstructor
public class ExerciseController {

    private final ExerciseService exerciseService;
    /** 已学词库与标熟 */
    private final LearnedVocabularyService learnedVocabularyService;

    /**
     * 智能选题
     * GET /exercise/questions?userId=1&moduleType=1&count=10
     */
    @GetMapping("/questions")
    public Result<List<QuestionVO>> selectQuestions(
            @RequestParam Long userId,
            @RequestParam(defaultValue = "1") Integer moduleType,
            @RequestParam(defaultValue = "10") Integer count,
            @RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        UserIdentityUtil.requireOwnership(headerUserId, userId);
        if (count > 50) count = 50;
        List<QuestionVO> questions = exerciseService.selectQuestions(userId, moduleType, count);
        log.info("智能选题: userId={}, moduleType={}, count={}, 实际返回{}题", userId, moduleType, count, questions.size());
        return Result.success(questions);
    }

    /**
     * 定级测试题
     * GET /exercise/assess-questions
     */
    @GetMapping("/assess-questions")
    public Result<List<QuestionVO>> getAssessQuestions() {
        List<QuestionVO> questions = exerciseService.getAssessQuestions();
        log.info("定级测试: 返回{}题", questions.size());
        return Result.success(questions);
    }

    /**
     * 单题详情
     * GET /exercise/question/{id}?showAnswer=false
     */
    @GetMapping("/question/{id}")
    public Result<QuestionVO> getQuestion(@PathVariable Long id,
                                          @RequestParam(defaultValue = "false") boolean showAnswer) {
        QuestionVO vo = exerciseService.getQuestionById(id, showAnswer);
        if (vo == null) return Result.error(404, "题目不存在");
        return Result.success(vo);
    }

    /**
     * 批量取题（含答案）
     * GET /exercise/questions/batch?ids=1,2,3
     */
    @GetMapping("/questions/batch")
    public Result<List<QuestionVO>> getQuestionsBatch(@RequestParam String ids) {
        List<Long> idList = Arrays.stream(ids.split(","))
                .map(String::trim)
                .filter(s -> !s.isEmpty())
                .map(Long::parseLong)
                .collect(Collectors.toList());
        List<QuestionVO> questions = exerciseService.getQuestionsBatch(idList);
        return Result.success(questions);
    }

    /**
     * 提交答案
     * POST /exercise/submit
     */
    @PostMapping("/submit")
    public Result<SubmitResponse> submit(
            @Valid @RequestBody SubmitRequest request,
            @RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        if (request.getUserId() == null || request.getQuestionId() == null) {
            return Result.badRequest("userId和questionId不能为空");
        }
        UserIdentityUtil.requireOwnership(headerUserId, request.getUserId());
        try {
            SubmitResponse response = exerciseService.submitAnswer(request);
            return Result.success(response);
        } catch (RuntimeException e) {
            log.warn("提交失败: {}", e.getMessage());
            return Result.error(e.getMessage());
        }
    }

    /**
     * 错题本
     * GET /exercise/error-book/{userId}
     */
    @GetMapping("/error-book/{userId}")
    public Result<List<QuestionVO>> errorBook(@PathVariable Long userId,
                                              @RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        UserIdentityUtil.requireOwnership(headerUserId, userId);
        List<QuestionVO> errors = exerciseService.getErrorBook(userId);
        return Result.success(errors);
    }

    /**
     * 知识点树
     * GET /exercise/knowledge-points?cetLevel=CET4
     */
    @GetMapping("/knowledge-points")
    public Result<List<SysKnowledgePoint>> knowledgePoints(@RequestParam(defaultValue = "CET4") String cetLevel) {
        List<SysKnowledgePoint> points = exerciseService.getKnowledgePoints(cetLevel);
        return Result.success(points);
    }

    /**
     * 每日单词
     * GET /exercise/daily-word?level=CET4
     */
    @GetMapping("/daily-word")
    public Result<DailyWordVO> getDailyWord(@RequestParam(defaultValue = "CET4") String level) {
        DailyWordVO vo = exerciseService.getDailyWord(level);
        log.info("每日单词: level={}, word={}", level, vo.getWord());
        return Result.success(vo);
    }

    /**
     * 用户答题统计（热力图、学习时间、词汇量等）
     * GET /exercise/stats/{userId}
     */
    @GetMapping("/stats/{userId}")
    public Result<UserExerciseStats> getUserStats(@PathVariable Long userId,
                                                  @RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        UserIdentityUtil.requireOwnership(headerUserId, userId);
        UserExerciseStats stats = exerciseService.getUserStats(userId);
        log.info("用户答题统计: userId={}, 总答题={}, 正确={}, 活跃天数={}",
                userId, stats.getTotalAnswered(), stats.getCorrectCount(), stats.getActiveDays());
        return Result.success(stats);
    }

    // ========== 收藏句 ==========

    /** POST /exercise/favorites */
    @PostMapping("/favorites")
    public Result<FavoriteVO> addFavorite(
            @Valid @RequestBody AddFavoriteRequest request,
            @RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        if (request.getUserId() == null || request.getSentenceText() == null || request.getSentenceText().isBlank()) {
            return Result.badRequest("userId和sentenceText不能为空");
        }
        UserIdentityUtil.requireOwnership(headerUserId, request.getUserId());
        FavoriteVO vo = exerciseService.addFavorite(request.getUserId(), request.getSentenceText(), request.getQuestionId());
        return Result.success(vo);
    }

    /** GET /exercise/favorites/{userId} */
    @GetMapping("/favorites/{userId}")
    public Result<List<FavoriteVO>> getFavorites(@PathVariable Long userId,
                                                 @RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        UserIdentityUtil.requireOwnership(headerUserId, userId);
        return Result.success(exerciseService.getFavorites(userId));
    }

    /** DELETE /exercise/favorites/{id}?userId=1 */
    @DeleteMapping("/favorites/{id}")
    public Result<String> removeFavorite(
            @PathVariable Long id,
            @RequestParam Long userId,
            @RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        UserIdentityUtil.requireOwnership(headerUserId, userId);
        exerciseService.removeFavorite(id, userId);
        return Result.success("已删除");
    }

    // ========== 词书 ==========

    /** GET /exercise/word-books */
    @GetMapping("/word-books")
    public Result<List<WordBookVO>> getWordBooks() {
        return Result.success(exerciseService.getWordBooks());
    }

    /** GET /exercise/word-books/{bookCode}/stats?userId=1 */
    @GetMapping("/word-books/{bookCode}/stats")
    public Result<WordBookStatsVO> getWordBookStats(
            @PathVariable String bookCode,
            @RequestParam Long userId,
            @RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        UserIdentityUtil.requireOwnership(headerUserId, userId);
        try {
            return Result.success(exerciseService.getWordBookStats(userId, bookCode));
        } catch (BusinessException e) {
            return Result.error(e.getCode(), e.getMessage());
        } catch (RuntimeException e) {
            return Result.error(e.getMessage());
        }
    }

    /**
     * GET /exercise/word-books/{bookCode}/words?userId=1&page=1&size=20&keyword=abandon
     * 词书单词表：按书内名次分页，带释义与当前用户学习状态。
     *
     * @param status 分类筛选：ALL / NEW（未学习）/ LEARNING（复习中）/ MASTERED（复习完成）/
     *               FAMILIAR（已标熟）；过滤在 SQL 层完成，total 与分页同口径。
     */
    @GetMapping("/word-books/{bookCode}/words")
    public Result<Map<String, Object>> getWordBookWords(
            @PathVariable String bookCode,
            @RequestParam Long userId,
            @RequestParam(defaultValue = "1") Integer page,
            @RequestParam(defaultValue = "20") Integer size,
            @RequestParam(required = false) String keyword,
            @RequestParam(required = false) String status,
            @RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        UserIdentityUtil.requireOwnership(headerUserId, userId);
        try {
            List<WordBookWordVO> records = exerciseService.getWordBookWords(
                    userId, bookCode, page, size, keyword, status);
            long total = exerciseService.getWordBookWordCount(userId, bookCode, keyword, status);
            int safePage = page == null || page < 1 ? 1 : page;
            int safeSize = size == null ? 20 : Math.max(1, Math.min(50, size));
            Map<String, Object> result = new java.util.HashMap<>();
            result.put("records", records);
            result.put("total", total);
            result.put("page", safePage);
            result.put("size", safeSize);
            return Result.success(result);
        } catch (BusinessException e) {
            return Result.error(e.getCode(), e.getMessage());
        } catch (RuntimeException e) {
            return Result.error(e.getMessage());
        }
    }

    // ========== 单词收藏 ==========

    /** POST /exercise/word-favorites */
    @PostMapping("/word-favorites")
    public Result<UserWordFavoriteVO> addWordFavorite(
            @Valid @RequestBody AddWordFavoriteRequest request,
            @RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        if (request.getUserId() == null || request.getWord() == null || request.getWord().isBlank()) {
            return Result.badRequest("userId和word不能为空");
        }
        UserIdentityUtil.requireOwnership(headerUserId, request.getUserId());
        try {
            return Result.success(exerciseService.addWordFavorite(request.getUserId(), request.getWord()));
        } catch (RuntimeException e) {
            return Result.error(e.getMessage());
        }
    }

    /** DELETE /exercise/word-favorites?userId=1&word=xxx */
    @DeleteMapping("/word-favorites")
    public Result<String> removeWordFavorite(
            @RequestParam Long userId,
            @RequestParam String word,
            @RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        UserIdentityUtil.requireOwnership(headerUserId, userId);
        exerciseService.removeWordFavorite(userId, word);
        return Result.success("已取消收藏");
    }

    /** GET /exercise/word-favorites/{userId} */
    @GetMapping("/word-favorites/{userId}")
    public Result<List<UserWordFavoriteVO>> getWordFavorites(
            @PathVariable Long userId,
            @RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        UserIdentityUtil.requireOwnership(headerUserId, userId);
        return Result.success(exerciseService.getWordFavorites(userId));
    }

    // ========== 单词本 ==========

    /** POST /exercise/vocabulary */
    @PostMapping("/vocabulary")
    public Result<VocabularyVO> addVocabulary(
            @Valid @RequestBody AddVocabularyRequest request,
            @RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        if (request.getUserId() == null || request.getWord() == null || request.getWord().isBlank()) {
            return Result.badRequest("userId和word不能为空");
        }
        UserIdentityUtil.requireOwnership(headerUserId, request.getUserId());
        VocabularyVO vo = exerciseService.addVocabulary(
                request.getUserId(), request.getWord(), request.getTranslation(), request.getSource());
        return Result.success(vo);
    }

    /**
     * 智能添加单词：只传 userId 和 word，AI 自动补全音标/词性/释义/例句/搭配
     * 并初始化艾宾浩斯复习计划
     * POST /exercise/vocabulary/smart
     */
    @PostMapping("/vocabulary/smart")
    public Result<VocabularyVO> addVocabularySmart(
            @Valid @RequestBody AddVocabularyRequest request,
            @RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        if (request.getUserId() == null || request.getWord() == null || request.getWord().isBlank()) {
            return Result.badRequest("userId和word不能为空");
        }
        UserIdentityUtil.requireOwnership(headerUserId, request.getUserId());
        try {
            VocabularyVO vo = exerciseService.addVocabularySmart(
                    request.getUserId(), request.getWord(), request.getSource());
            return Result.success(vo);
        } catch (RuntimeException e) {
            log.warn("智能添加单词失败: {}", e.getMessage());
            return Result.error(e.getMessage());
        }
    }

    /** GET /exercise/vocabulary/{userId}?page=1&size=20&bookCode=basic_foundation&status=LEARNING */
    @GetMapping("/vocabulary/{userId}")
    public Result<Map<String, Object>> getVocabulary(@PathVariable Long userId,
                                                     @RequestParam(defaultValue = "1") Integer page,
                                                     @RequestParam(defaultValue = "20") Integer size,
                                                     @RequestParam(required = false) String bookCode,
                                                     @RequestParam(required = false) String status,
                                                     @RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        UserIdentityUtil.requireOwnership(headerUserId, userId);
        List<VocabularyVO> list = exerciseService.getVocabulary(userId, page, size, bookCode, status);
        long total = exerciseService.getVocabularyCount(userId, bookCode, status);
        Map<String, Object> result = new java.util.HashMap<>();
        result.put("records", list);
        result.put("total", total);
        result.put("page", page);
        result.put("size", size);
        return Result.success(result);
    }

    /**
     * 新词练习选题：排除用户单词本中已存在的单词
     * GET /exercise/vocabulary/new-questions?userId=1&count=10
     */
    @GetMapping("/vocabulary/new-questions")
    public Result<List<QuestionVO>> selectNewVocabularyQuestions(
            @RequestParam Long userId,
            @RequestParam(defaultValue = "10") Integer count,
            @RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        UserIdentityUtil.requireOwnership(headerUserId, userId);
        int safeCount = Math.max(1, Math.min(50, count));
        List<QuestionVO> questions = exerciseService.selectNewVocabularyQuestions(userId, safeCount);
        log.info("新词选题: userId={}, 需求{}题, 返回{}题", userId, safeCount, questions.size());
        return Result.success(questions);
    }

    /**
     * 新词练习条目（按当前词书 + 同等级约束，无题词返回词卡）
     * GET /exercise/vocabulary/new-items?userId=1&count=10
     */
    @GetMapping("/vocabulary/new-items")
    public Result<List<NewWordItemVO>> selectNewWordItems(
            @RequestParam Long userId,
            @RequestParam(defaultValue = "10") Integer count,
            @RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        UserIdentityUtil.requireOwnership(headerUserId, userId);
        int safeCount = Math.max(1, Math.min(50, count));
        List<NewWordItemVO> items = exerciseService.selectNewWordItems(userId, safeCount);
        log.info("新词条目: userId={}, 需求{}条, 返回{}条", userId, safeCount, items.size());
        return Result.success(items);
    }

    /**
     * 忽略单词 —— 已废弃，语义等价于「标记标熟」。
     *
     * <p>产品上「忽略」与「标熟」已合并（迁移 V1.0.54）：用户唯一可操作的排除动作是标熟。
     * 本端点保留仅为兼容旧调用方，新代码请用 {@code POST /vocabulary/{id}/familiar}。</p>
     *
     * <p>PUT /exercise/vocabulary/{id}/ignore?userId=1</p>
     */
    @PutMapping("/vocabulary/{id}/ignore")
    public Result<VocabularyVO> ignoreWord(
            @PathVariable Long id,
            @RequestParam Long userId,
            @RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        UserIdentityUtil.requireOwnership(headerUserId, userId);
        try {
            return Result.success(exerciseService.ignoreWord(id, userId));
        } catch (RuntimeException e) {
            return Result.error(e.getMessage());
        }
    }

    // ============= 已学词库与标熟 =============

    /**
     * 已学词库：日期分组头。
     *
     * <p>GET /exercise/vocabulary/learned/dates?userId=1&status=LEARNING</p>
     *
     * @param status LEARNING（复习中，含 REVIEWING）/ MASTERED（复习完成）/ FAMILIAR（已标熟）/ ALL
     */
    @GetMapping("/vocabulary/learned/dates")
    public Result<List<LearnedWordDateVO>> getLearnedDateGroups(
            @RequestParam Long userId,
            @RequestParam(required = false) String status,
            @RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        UserIdentityUtil.requireOwnership(headerUserId, userId);
        try {
            return Result.success(learnedVocabularyService.getDateGroups(userId, status));
        } catch (RuntimeException e) {
            return Result.error(e.getMessage());
        }
    }

    /**
     * 已学词库：分页词条。
     *
     * <p>GET /exercise/vocabulary/learned?userId=1&status=LEARNING&date=2026-11-15&page=1&size=50</p>
     *
     * @param date 分组日（yyyy-MM-dd），为空表示不限日期
     */
    @GetMapping("/vocabulary/learned")
    public Result<Map<String, Object>> getLearnedWords(
            @RequestParam Long userId,
            @RequestParam(required = false) String status,
            @RequestParam(required = false) String date,
            @RequestParam(defaultValue = "1") Integer page,
            @RequestParam(defaultValue = "50") Integer size,
            @RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        UserIdentityUtil.requireOwnership(headerUserId, userId);
        try {
            int safePage = page == null || page < 1 ? 1 : page;
            int safeSize = size == null ? 50 : Math.max(1, Math.min(200, size));
            return Result.success(
                    learnedVocabularyService.getLearnedWords(userId, status, date, safePage, safeSize));
        } catch (RuntimeException e) {
            return Result.error(e.getMessage());
        }
    }

    /**
     * 标记标熟 / 取消标熟。
     *
     * <p>POST /exercise/vocabulary/{id}/familiar?userId=1&familiar=true</p>
     *
     * <p>标熟语义：退出新词池与复习队列，但计入已学；取消标熟后回到「复习中」。</p>
     */
    @PostMapping("/vocabulary/{id}/familiar")
    public Result<Map<String, Object>> markFamiliar(
            @PathVariable Long id,
            @RequestParam Long userId,
            @RequestParam(defaultValue = "true") Boolean familiar,
            @RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        UserIdentityUtil.requireOwnership(headerUserId, userId);
        try {
            UserVocabulary v = learnedVocabularyService.markFamiliar(id, userId, familiar);
            Map<String, Object> result = new java.util.LinkedHashMap<>();
            result.put("id", v.getId());
            result.put("word", v.getWord());
            result.put("status", v.getStatus());
            result.put("familiarAt", v.getFamiliarAt());
            return Result.success(result);
        } catch (RuntimeException e) {
            return Result.error(e.getMessage());
        }
    }

    /**
     * 批量取消标熟（「已标熟」分类页多选批量用）。
     *
     * <p>POST /exercise/vocabulary/familiar/batch?userId=1&ids=1,2,3</p>
     *
     * @return 实际变更条数
     */
    @PostMapping("/vocabulary/familiar/batch")
    public Result<Integer> batchUnfamiliar(
            @RequestParam Long userId,
            @RequestParam String ids,
            @RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        UserIdentityUtil.requireOwnership(headerUserId, userId);
        try {
            List<Long> idList = Arrays.stream(ids.split(","))
                    .map(String::trim)
                    .filter(s -> !s.isEmpty())
                    .map(Long::valueOf)
                    .collect(Collectors.toList());
            return Result.success(learnedVocabularyService.batchUnfamiliar(userId, idList));
        } catch (RuntimeException e) {
            return Result.error(e.getMessage());
        }
    }

    /**
     * 词汇量汇总（统计页「个人词汇量」组件）。
     *
     * <p>GET /exercise/stats/vocabulary-summary?userId=1</p>
     */
    @GetMapping("/stats/vocabulary-summary")
    public Result<VocabularySummaryVO> getVocabularySummary(
            @RequestParam Long userId,
            @RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        UserIdentityUtil.requireOwnership(headerUserId, userId);
        try {
            return Result.success(learnedVocabularyService.getSummary(userId));
        } catch (RuntimeException e) {
            return Result.error(e.getMessage());
        }
    }

    /** DELETE /exercise/vocabulary/{id}?userId=1 */
    @DeleteMapping("/vocabulary/{id}")
    public Result<String> removeVocabulary(
            @PathVariable Long id,
            @RequestParam Long userId,
            @RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        UserIdentityUtil.requireOwnership(headerUserId, userId);
        exerciseService.removeVocabulary(id, userId);
        return Result.success("已删除");
    }

    /** PUT /exercise/vocabulary/{id}/toggle?userId=1 */
    @PutMapping("/vocabulary/{id}/toggle")
    public Result<VocabularyVO> toggleMastered(
            @PathVariable Long id,
            @RequestParam Long userId,
            @RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        UserIdentityUtil.requireOwnership(headerUserId, userId);
        VocabularyVO vo = exerciseService.toggleMastered(id, userId);
        return Result.success(vo);
    }

    /**
     * 获取今日待复习单词列表
     * GET /exercise/vocabulary/review/{userId}
     */
    @GetMapping("/vocabulary/review/{userId}")
    public Result<List<VocabularyVO>> getReviewList(@PathVariable Long userId,
                                                    @RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        UserIdentityUtil.requireOwnership(headerUserId, userId);
        List<VocabularyVO> list = exerciseService.getReviewList(userId);
        log.info("今日待复习: userId={}, 数量={}", userId, list.size());
        return Result.success(list);
    }

    /**
     * 提交单词复习结果（记住/没记住）
     * PUT /exercise/vocabulary/{id}/review
     */
    @PutMapping("/vocabulary/{id}/review")
    public Result<VocabularyVO> reviewWord(
            @PathVariable Long id,
            @Valid @RequestBody ReviewResultRequest request,
            @RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        if (request.getUserId() == null || request.getIsCorrect() == null) {
            return Result.badRequest("userId和isCorrect不能为空");
        }
        UserIdentityUtil.requireOwnership(headerUserId, request.getUserId());
        try {
            VocabularyVO vo = exerciseService.reviewWord(id, request.getUserId(), request.getIsCorrect());
            return Result.success(vo);
        } catch (RuntimeException e) {
            log.warn("提交复习结果失败: {}", e.getMessage());
            return Result.error(e.getMessage());
        }
    }

    /**
     * 记录一次单词作答（新词/复习循环专用，不进答题统计）
     * POST /exercise/vocabulary/attempt
     */
    @PostMapping("/vocabulary/attempt")
    public Result<VocabularyVO> recordWordAttempt(
            @Valid @RequestBody WordAttemptRequest request,
            @RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        boolean noWord = request.getWord() == null || request.getWord().isBlank();
        if (request.getUserId() == null || (request.getQuestionId() == null && noWord)) {
            return Result.badRequest("userId必填，questionId 与 word 至少传一个");
        }
        UserIdentityUtil.requireOwnership(headerUserId, request.getUserId());
        try {
            return Result.success(exerciseService.recordWordAttempt(
                    request.getUserId(), request.getQuestionId(), request.getWord(), request.getIsCorrect()));
        } catch (RuntimeException e) {
            log.warn("记录单词作答失败: {}", e.getMessage());
            return Result.error(e.getMessage());
        }
    }

    /**
     * 写作历史（数据源 writing_essay）
     * GET /exercise/writing-history/{userId}?page=1&size=20&startTime=...&endTime=...
     */
    @GetMapping("/writing-history/{userId}")
    public Result<Map<String, Object>> getWritingHistory(
            @PathVariable Long userId,
            @RequestParam(defaultValue = "1") Integer page,
            @RequestParam(defaultValue = "20") Integer size,
            @RequestParam(required = false) String startTime,
            @RequestParam(required = false) String endTime,
            @RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        UserIdentityUtil.requireOwnership(headerUserId, userId);
        List<WritingHistoryVO> list = exerciseService.getWritingHistory(userId, page, size, startTime, endTime);
        long total = exerciseService.getWritingHistoryCount(userId, startTime, endTime);
        Map<String, Object> result = new java.util.HashMap<>();
        result.put("records", list);
        result.put("total", total);
        result.put("page", page);
        result.put("size", size);
        return Result.success(result);
    }

    /**
     * 统一学习时间线（答题 + 单词事件 + 写作，按时间倒序）
     * GET /exercise/timeline/{userId}?page=1&size=20&startTime=...&endTime=...
     */
    @GetMapping("/timeline/{userId}")
    public Result<Map<String, Object>> getTimeline(
            @PathVariable Long userId,
            @RequestParam(defaultValue = "1") Integer page,
            @RequestParam(defaultValue = "20") Integer size,
            @RequestParam(required = false) String startTime,
            @RequestParam(required = false) String endTime,
            @RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        UserIdentityUtil.requireOwnership(headerUserId, userId);
        List<TimelineItemVO> list = exerciseService.getTimeline(userId, page, size, startTime, endTime);
        long total = exerciseService.getTimelineCount(userId, startTime, endTime);
        Map<String, Object> result = new java.util.HashMap<>();
        result.put("records", list);
        result.put("total", total);
        result.put("page", page);
        result.put("size", size);
        return Result.success(result);
    }

    // ========== 学习历史 ==========

    /** GET /exercise/history/{userId}?page=1&size=20&moduleType=1&isCorrect=1&startTime=...&endTime=... */
    @GetMapping("/history/{userId}")
    public Result<Map<String, Object>> getExerciseHistory(
            @PathVariable Long userId,
            @RequestParam(defaultValue = "1") Integer page,
            @RequestParam(defaultValue = "20") Integer size,
            @RequestParam(required = false) Integer moduleType,
            @RequestParam(required = false) Integer isCorrect,
            @RequestParam(required = false) String startTime,
            @RequestParam(required = false) String endTime,
            @RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        UserIdentityUtil.requireOwnership(headerUserId, userId);
        List<ExerciseHistoryVO> list = exerciseService.getExerciseHistory(userId, page, size, moduleType, isCorrect, startTime, endTime);
        long total = exerciseService.getExerciseHistoryCount(userId, moduleType, isCorrect, startTime, endTime);
        Map<String, Object> result = new java.util.HashMap<>();
        result.put("records", list);
        result.put("total", total);
        result.put("page", page);
        result.put("size", size);
        return Result.success(result);
    }

    /**
     * 单词事件历史（LEARN/REVIEW/MASTER/FAVORITE/UNFAVORITE/IGNORE）
     * GET /exercise/word-history/{userId}?page=1&size=20&eventType=LEARN&bookCode=basic_foundation&startTime=...&endTime=...
     */
    @GetMapping("/word-history/{userId}")
    public Result<Map<String, Object>> getWordLearnHistory(
            @PathVariable Long userId,
            @RequestParam(defaultValue = "1") Integer page,
            @RequestParam(defaultValue = "20") Integer size,
            @RequestParam(required = false) String eventType,
            @RequestParam(required = false) String bookCode,
            @RequestParam(required = false) String startTime,
            @RequestParam(required = false) String endTime,
            @RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        UserIdentityUtil.requireOwnership(headerUserId, userId);
        List<UserWordLearnLogVO> list = exerciseService.getWordLearnHistory(userId, page, size, eventType, bookCode, startTime, endTime);
        long total = exerciseService.getWordLearnHistoryCount(userId, eventType, bookCode, startTime, endTime);
        Map<String, Object> result = new java.util.HashMap<>();
        result.put("records", list);
        result.put("total", total);
        result.put("page", page);
        result.put("size", size);
        return Result.success(result);
    }

    /**
     * 按答题记录ID反查单次提交的上下文。
     * GET /exercise/log/{logId}?userId=1
     *
     * <p>供 AI 对话流展开结构化反馈卡时调用：消息里只存 recordId，
     * 内容按需回捞，避免把业务模型塞进前端对话 store。</p>
     */
    @GetMapping("/log/{logId}")
    public Result<ExerciseHistoryVO> getExerciseLogDetail(
            @PathVariable Long logId,
            @RequestParam Long userId,
            @RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        UserIdentityUtil.requireOwnership(headerUserId, userId);
        ExerciseHistoryVO detail = exerciseService.getExerciseLogDetail(logId, userId);
        if (detail == null) {
            return Result.error("答题记录不存在");
        }
        return Result.success(detail);
    }

    // ========== 错题驱动同类题生成 ==========
    /**
     * 获取用户薄弱知识点列表
     * GET /exercise/weak-points/{userId}
     * 统计用户所有未解决错题中每个知识点的出现次数，按次数降序返回前10个
     */
    @GetMapping("/weak-points/{userId}")
    public Result<List<WeakKnowledgePoint>> getWeakPoints(@PathVariable Long userId,
                                                          @RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        UserIdentityUtil.requireOwnership(headerUserId, userId);
        log.info("获取薄弱知识点: userId={}", userId);
        List<WeakKnowledgePoint> points = exerciseService.getWeakKnowledgePoints(userId);
        return Result.success(points);
    }

    /**
     * 生成同类强化练习题
     * POST /exercise/generate-similar
     * 请求体: { "userId": 1, "questionId": 100, "count": 5 }
     * 优先取正式题库中同知识点题目，不足部分由 AI 生成
     */
    @PostMapping("/generate-similar")
    public Result<List<QuestionVO>> generateSimilar(@RequestBody Map<String, Object> request,
                                                    @RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        Long userId = request.get("userId") != null
                ? ((Number) request.get("userId")).longValue()
                : null;
        Long questionId = request.get("questionId") != null
                ? ((Number) request.get("questionId")).longValue()
                : null;
        int count = request.get("count") != null
                ? ((Number) request.get("count")).intValue()
                : 5;

        if (userId == null || questionId == null) {
            return Result.badRequest("userId和questionId不能为空");
        }
        UserIdentityUtil.requireOwnership(headerUserId, userId);
        if (count > 20) count = 20;

        log.info("生成同类题: userId={}, questionId={}, count={}", userId, questionId, count);
        try {
            List<QuestionVO> questions = exerciseService.generateSimilarQuestions(userId, questionId, count);
            return Result.success(questions);
        } catch (RuntimeException e) {
            log.warn("生成同类题失败: {}", e.getMessage());
            return Result.error(e.getMessage());
        }
    }
}
