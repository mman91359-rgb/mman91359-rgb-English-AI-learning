package com.english.ai.exercise.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.english.ai.common.BusinessException;
import com.english.ai.common.ErrorCode;
import com.english.ai.common.JudgmentLevel;
import com.english.ai.common.ModuleType;
import com.english.ai.common.Result;
import com.english.ai.exercise.config.RabbitMQConfig;
import com.english.ai.exercise.dto.QuestionVO;
import com.english.ai.exercise.dto.SubmitRequest;
import com.english.ai.exercise.dto.SubmitResponse;
import com.english.ai.exercise.dto.ReviewTaskVO;
import com.english.ai.exercise.dto.UserExerciseStats;
import com.english.ai.exercise.dto.FavoriteVO;
import com.english.ai.exercise.dto.VocabularyVO;
import com.english.ai.exercise.dto.ExerciseHistoryVO;
import com.english.ai.exercise.dto.DailyWordVO;
import com.english.ai.exercise.dto.WordDetailVO;
import com.english.ai.exercise.dto.JudgeReviewEnqueueRequest;
import com.english.ai.exercise.dto.JudgmentResult;
import com.english.ai.exercise.dto.TranslationReviewDraft;
import com.english.ai.exercise.dto.WeakKnowledgePoint;
import com.english.ai.exercise.dto.CoinAwardResult;
import com.english.ai.exercise.dto.PreferenceResult;
import com.english.ai.exercise.dto.WordBookVO;
import com.english.ai.exercise.constant.VocabularyStatus;
import com.english.ai.exercise.dto.WordBookStatsVO;
import com.english.ai.exercise.dto.WordBookWordVO;
import com.english.ai.exercise.dto.NewWordItemVO;
import com.english.ai.exercise.dto.WordCardVO;
import com.english.ai.exercise.dto.UserWordFavoriteVO;
import com.english.ai.exercise.dto.UserWordLearnLogVO;
import com.english.ai.exercise.dto.WritingHistoryVO;
import com.english.ai.exercise.dto.TimelineItemVO;
import com.english.ai.exercise.entity.*;
import com.english.ai.exercise.event.ExerciseCompletedEvent;
import com.english.ai.exercise.mapper.*;
import com.english.ai.exercise.service.ExerciseService;
import com.english.ai.exercise.service.JudgmentEngine;
import com.english.ai.exercise.service.QuestionGenerateService;
import com.english.ai.exercise.service.StudySessionService;
import com.english.ai.exercise.service.VocabGroupAwardPolicy;
import com.english.ai.exercise.util.ChoiceAnswerUtil;
import com.english.ai.exercise.util.EbbinghausUtil;
import com.english.ai.exercise.util.StudyDurationAggregator;
import com.english.ai.exercise.util.VocabularyLearningHelper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.support.TransactionTemplate;
import org.springframework.web.client.RestTemplate;

import java.time.Clock;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.OffsetDateTime;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.stream.Collectors;

@Slf4j
@Service
@RequiredArgsConstructor
public class ExerciseServiceImpl implements ExerciseService {

    /**
     * 自动生成词汇题的解析分隔符：`释义 ｜ 原句：完整例句`。
     * 答题前只下发分隔符之前的释义，避免原句中的目标词泄漏答案。
     */
    private static final String ANALYSIS_SENTENCE_MARK = "｜ 原句：";

    private final QuestionInfoMapper questionInfoMapper;
    private final QuestionContentMapper questionContentMapper;
    private final SysKnowledgePointMapper knowledgePointMapper;
    private final KnowledgeMappingMapper knowledgeMappingMapper;
    private final UserExerciseLogMapper exerciseLogMapper;
    private final UserErrorBookMapper errorBookMapper;
    private final UserFavoriteMapper favoriteMapper;
    private final UserVocabularyMapper vocabularyMapper;
    private final WordDictionaryMapper wordDictionaryMapper;
    private final WordBookMapper wordBookMapper;
    private final WordBookItemMapper wordBookItemMapper;
    private final UserWordFavoriteMapper userWordFavoriteMapper;
    private final UserWordLearnLogMapper userWordLearnLogMapper;
    private final WritingEssayMapper writingEssayMapper;
    private final TimelineMapper timelineMapper;
    private final DailyWordMapper dailyWordMapper;
    private final RestTemplate restTemplate;
    private final JudgmentEngine judgmentEngine;
    private final QuestionGenerateService questionGenerateService;
    private final StudySessionService studySessionService;
    private final Clock clock;
    private final PlatformTransactionManager transactionManager;
    private final JudgeReviewAsyncWriter judgeReviewAsyncWriter;
    /** 已学词库与标熟服务（标熟/取消标熟的实现归它，避免状态语义散落） */
    private final LearnedVocabularyService learnedVocabularyService;

    /** 每组单词数量的短缓存，避免每次词汇答题都跨服务查询偏好 */
    private final Map<Long, CachedGroupSize> groupSizeCache = new ConcurrentHashMap<>();

    /** 当天已发到第几组的短缓存，用于跨服务失败后的下一次答题重试 */
    private final Map<Long, AwardedGroupState> awardedGroupCache = new ConcurrentHashMap<>();

    @Autowired(required = false)
    private RabbitTemplate rabbitTemplate;

    @Value("${service.user.url}")
    private String userServiceUrl;

    @Value("${service.learning-engine.url}")
    private String learningEngineUrl;

    @Value("${service.ai.url}")
    private String aiServiceUrl;

    @Value("${app.internal.token:}")
    private String internalToken;

    // ============= 智能选题 =============

    @Override
    public List<QuestionVO> selectQuestions(Long userId, Integer moduleType, int count) {
        return selectQuestions(userId, moduleType, count, null);
    }

    @Override
    public List<QuestionVO> selectQuestions(Long userId, Integer moduleType, int count,
                                            Collection<Long> allowedQuestionIds) {
        // 白名单为空表示该筛选条件下没有可用题，直接返回，避免空 IN 和无效 usage_count
        if (allowedQuestionIds != null && allowedQuestionIds.isEmpty()) {
            return Collections.emptyList();
        }

        // 1. 调 user-service 获取用户 ELO分 和 cetLevel
        int eloScore = 1000;
        String cetLevel = "CET4";
        try {
            String url = userServiceUrl + "/user/info/" + userId;
            ResponseEntity<Result> resp = restTemplate.getForEntity(url, Result.class);
            if (resp.getBody() != null && resp.getBody().getCode() == 200) {
                Map userMap = (Map) resp.getBody().getData();
                if (userMap != null && userMap.get("cetLevel") != null) {
                    cetLevel = userMap.get("cetLevel").toString();
                }
            }
        } catch (Exception e) {
            log.warn("获取用户信息失败(userId={}), 使用默认ELO=1000", userId, e);
        }

        // 试取 user_ability_radar 的 ELO分（如果user-service有对应接口）
        try {
            String url = userServiceUrl + "/user/radar/" + userId;
            ResponseEntity<Result> resp = restTemplate.getForEntity(url, Result.class);
            if (resp.getBody() != null && resp.getBody().getCode() == 200) {
                Map radarMap = (Map) resp.getBody().getData();
                if (radarMap != null && radarMap.get("eloScore") != null) {
                    eloScore = ((Number) radarMap.get("eloScore")).intValue();
                }
            }
        } catch (Exception e) {
            log.warn("获取用户雷达信息失败, 使用默认ELO=1000");
        }

        // 2. 计算难度区间 Δ=200
        int lo = Math.max(1, eloScore - 200);
        int hi = Math.min(2000, eloScore + 200);
        // 映射到 1~8
        int loDifficulty = Math.max(1, lo / 250);
        int hiDifficulty = Math.min(8, hi / 250);

        // 3. 查最近7天已做题目ID
        LocalDateTime sevenDaysAgo = LocalDateTime.now().minusDays(7);
        List<Long> recentIds = exerciseLogMapper.selectList(
                new LambdaQueryWrapper<UserExerciseLog>()
                        .eq(UserExerciseLog::getUserId, userId)
                        .ge(UserExerciseLog::getCreatedAt, sevenDaysAgo)
        ).stream().map(UserExerciseLog::getQuestionId).distinct().collect(Collectors.toList());

        // 4. 构建候选等级列表：首选用户CET等级，其次相邻等级，最后全量兜底
        String[] levelCandidates;
        if ("CET4".equalsIgnoreCase(cetLevel)) {
            levelCandidates = new String[]{"CET4", "CET6"};
        } else if ("CET6".equalsIgnoreCase(cetLevel)) {
            levelCandidates = new String[]{"CET6", "CET4"};
        } else {
            levelCandidates = new String[]{cetLevel, "CET4", "CET6"};
        }

        // 题型由共享契约统一决定：1词汇→FILL_BLANK、2语法/5造句→SENTENCE_MAKING、3翻译→TRANSLATION、
        // 4听力→CHOICE、6写作→WRITING；7阅读返回 null，表示不按题型过滤（含 CHOICE 与 FILL_BLANK 两种）
        String questionType = ModuleType.defaultQuestionType(moduleType);

        List<QuestionInfo> candidates = new ArrayList<>();

        // 按优先级从每个等级中取题，直到凑够数量或取完
        for (String level : levelCandidates) {
            if (candidates.size() >= count * 3) break;
            int remaining = count * 3 - candidates.size();

            LambdaQueryWrapper<QuestionInfo> wrapper = new LambdaQueryWrapper<>();
            wrapper.eq(QuestionInfo::getTargetLevel, level)
                    .eq(QuestionInfo::getModuleType, moduleType)
                    .eq(questionType != null, QuestionInfo::getQuestionType, questionType)
                    .between(QuestionInfo::getDifficultyLevel, loDifficulty, hiDifficulty)
                    .eq(QuestionInfo::getIsDeleted, 0);
            if (allowedQuestionIds != null) {
                wrapper.in(QuestionInfo::getId, allowedQuestionIds);
            }
            if (!recentIds.isEmpty()) {
                wrapper.notIn(QuestionInfo::getId, recentIds);
            }
            wrapper.orderByAsc(QuestionInfo::getUsageCount)
                    .last("LIMIT " + remaining);
            candidates.addAll(questionInfoMapper.selectList(wrapper));
        }

        // 5. 再次放宽：忽略难度范围
        if (candidates.size() < count) {
            for (String level : levelCandidates) {
                if (candidates.size() >= count) break;
                int remaining = count - candidates.size();
                LambdaQueryWrapper<QuestionInfo> wrapper = new LambdaQueryWrapper<>();
                wrapper.eq(QuestionInfo::getTargetLevel, level)
                        .eq(QuestionInfo::getModuleType, moduleType)
                        .eq(questionType != null, QuestionInfo::getQuestionType, questionType)
                        .eq(QuestionInfo::getIsDeleted, 0);
                if (allowedQuestionIds != null) {
                    wrapper.in(QuestionInfo::getId, allowedQuestionIds);
                }
                wrapper.orderByAsc(QuestionInfo::getUsageCount)
                        .last("LIMIT " + remaining);
                candidates.addAll(questionInfoMapper.selectList(wrapper));
            }
        }

        // 6. 最后兜底：不限制等级，只按模块取
        if (candidates.size() < count) {
            LambdaQueryWrapper<QuestionInfo> wrapper = new LambdaQueryWrapper<>();
            wrapper.eq(QuestionInfo::getModuleType, moduleType)
                    .eq(questionType != null, QuestionInfo::getQuestionType, questionType)
                    .eq(QuestionInfo::getIsDeleted, 0);
            if (allowedQuestionIds != null) {
                wrapper.in(QuestionInfo::getId, allowedQuestionIds);
            }
            wrapper.orderByAsc(QuestionInfo::getUsageCount)
                    .last("LIMIT " + count);
            candidates.addAll(questionInfoMapper.selectList(wrapper));
        }

        // 7. 分级兜底可能把同一道题多次加入候选，先按 ID 去重再截取，避免听力等小题库重复出题
        Map<Long, QuestionInfo> dedupedMap = new LinkedHashMap<>();
        for (QuestionInfo candidate : candidates) {
            dedupedMap.putIfAbsent(candidate.getId(), candidate);
        }
        List<QuestionInfo> selected = dedupedMap.values().stream().limit(count).collect(Collectors.toList());
        log.info("智能选题: userId={}, userLevel={}, 实际使用等级{}条, moduleType={}, 需求{}题, 返回{}题",
                userId, cetLevel, selected.size() > 0 ? "混合" : "无", moduleType, count, selected.size());

        // 更新 usage_count：单条 SQL 原子自增，避免并发读改写丢更新
        if (!selected.isEmpty()) {
            questionInfoMapper.update(null, new UpdateWrapper<QuestionInfo>()
                    .in("id", selected.stream().map(QuestionInfo::getId).toList())
                    .setSql("usage_count = usage_count + 1"));
        }

        return selected.stream()
                .map(qi -> toQuestionVO(qi, false))
                .collect(Collectors.toList());
    }

    @Override
    public List<QuestionVO> selectNewVocabularyQuestions(Long userId, int count) {
        // 词书约束：只返回有题词，无题词由 selectNewWordItems 以词卡降级
        return selectNewWordItems(userId, count).stream()
                .filter(item -> "QUESTION".equals(item.getType()) && item.getQuestion() != null)
                .map(NewWordItemVO::getQuestion)
                .collect(Collectors.toList());
    }

    // ============= 词书 =============

    @Override
    public List<WordBookVO> getWordBooks() {
        List<WordBook> books = wordBookMapper.selectList(
                new LambdaQueryWrapper<WordBook>().orderByAsc(WordBook::getSortOrder));
        List<WordBookVO> result = new ArrayList<>();
        for (WordBook book : books) {
            Long total = wordBookItemMapper.selectCount(
                    new LambdaQueryWrapper<WordBookItem>().eq(WordBookItem::getBookCode, book.getCode()));
            result.add(WordBookVO.builder()
                    .id(book.getId())
                    .code(book.getCode())
                    .name(book.getName())
                    .level(book.getLevel())
                    .description(book.getDescription())
                    .total(total != null ? total.intValue() : 0)
                    .build());
        }
        return result;
    }

    @Override
    public WordBookStatsVO getWordBookStats(Long userId, String bookCode) {
        WordBook book = wordBookMapper.selectOne(
                new LambdaQueryWrapper<WordBook>().eq(WordBook::getCode, bookCode));
        if (book == null) {
            throw new BusinessException(ErrorCode.NOT_FOUND, "词书不存在");
        }

        Long total = wordBookItemMapper.selectCount(
                new LambdaQueryWrapper<WordBookItem>().eq(WordBookItem::getBookCode, bookCode));
        int totalCount = total != null ? total.intValue() : 0;

        // 已学：user_vocabulary 中属于本词书的词条数。
        // 合并「忽略」为「标熟」后，词库中每条记录都是已学的词，故此处是全量计数；
        // 「标熟」计入已学（它与「未学习」是分开的概念）。
        List<String> bookWords = wordBookItemMapper.selectList(
                        new LambdaQueryWrapper<WordBookItem>().eq(WordBookItem::getBookCode, bookCode))
                .stream().map(WordBookItem::getWord).collect(Collectors.toList());
        int learned = 0;
        int mastered = 0;
        int familiar = 0;
        if (!bookWords.isEmpty()) {
            List<UserVocabulary> userWords = vocabularyMapper.selectList(
                    new LambdaQueryWrapper<UserVocabulary>()
                            .eq(UserVocabulary::getUserId, userId)
                            .in(UserVocabulary::getWord, bookWords));
            learned = userWords.size();
            mastered = (int) userWords.stream()
                    .filter(v -> v.getIsMastered() != null && v.getIsMastered() == 1)
                    .count();
            familiar = (int) userWords.stream()
                    .filter(v -> VocabularyStatus.FAMILIAR.equals(v.getStatus()))
                    .count();
        }

        int toLearn = Math.max(0, totalCount - learned);

        // 今日计划 = min(dailyNewWords, toLearn)
        int dailyNewWords = getDailyNewWords(userId);
        int todayPlan = Math.min(dailyNewWords, toLearn);

        return WordBookStatsVO.builder()
                .bookCode(bookCode)
                .total(totalCount)
                .learned(learned)
                .mastered(mastered)
                .familiar(familiar)
                .toLearn(toLearn)
                .todayPlan(todayPlan)
                .build();
    }

    @Override
    public List<WordBookWordVO> getWordBookWords(Long userId, String bookCode, Integer page, Integer size,
                                                 String keyword, String status) {
        assertWordBookExists(bookCode);

        int safePage = page == null || page < 1 ? 1 : page;
        int safeSize = size == null ? 20 : Math.max(1, Math.min(50, size));
        int offset = (safePage - 1) * safeSize;

        // 状态过滤必须落在 SQL 层：分页 LIMIT 打在 word_book_item 上，
        // 若在前端过滤，每页会不足 size 条、总数也会失真。
        StatusFilter statusFilter = buildStatusFilter(userId, bookCode, status);

        LambdaQueryWrapper<WordBookItem> wrapper = new LambdaQueryWrapper<WordBookItem>()
                .eq(WordBookItem::getBookCode, bookCode);
        if (keyword != null && !keyword.isBlank()) {
            wrapper.like(WordBookItem::getWord, keyword.trim().toLowerCase(Locale.ROOT));
        }
        if (statusFilter.allowed() != null) {
            if (statusFilter.allowed().isEmpty()) {
                return Collections.emptyList();
            }
            wrapper.in(WordBookItem::getWord, statusFilter.allowed());
        } else if (statusFilter.excluded() != null && !statusFilter.excluded().isEmpty()) {
            wrapper.notIn(WordBookItem::getWord, statusFilter.excluded());
        }
        wrapper.orderByAsc(WordBookItem::getRankNo)
                .last("LIMIT " + offset + "," + safeSize);

        List<WordBookItem> items = wordBookItemMapper.selectList(wrapper);
        if (items.isEmpty()) {
            return Collections.emptyList();
        }

        List<String> words = items.stream()
                .map(WordBookItem::getWord)
                .filter(Objects::nonNull)
                .collect(Collectors.toList());
        if (words.isEmpty()) {
            return Collections.emptyList();
        }

        // 不在 SQL 里跨表 JOIN：word_book_item 与 word_dictionary 的 collation 不同，
        // 分两次按 word 批量查询，避免 1267 Illegal mix of collations。
        Map<String, WordDictionary> dictionaryMap = wordDictionaryMapper.selectList(
                        new LambdaQueryWrapper<WordDictionary>().in(WordDictionary::getWord, words))
                .stream()
                .filter(wd -> wd.getWord() != null)
                .collect(Collectors.toMap(wd -> wordKey(wd.getWord()), wd -> wd, (a, b) -> a));

        Map<String, UserVocabulary> userVocabularyMap = vocabularyMapper.selectList(
                        new LambdaQueryWrapper<UserVocabulary>()
                                .eq(UserVocabulary::getUserId, userId)
                                .in(UserVocabulary::getWord, words))
                .stream()
                .filter(v -> v.getWord() != null)
                .collect(Collectors.toMap(v -> wordKey(v.getWord()), v -> v, (a, b) -> a));

        List<WordBookWordVO> result = new ArrayList<>(items.size());
        for (WordBookItem item : items) {
            String key = wordKey(item.getWord());
            WordDictionary dictionary = dictionaryMap.get(key);
            UserVocabulary vocabulary = userVocabularyMap.get(key);
            result.add(WordBookWordVO.builder()
                    .word(item.getWord())
                    .phonetic(dictionary == null ? null : dictionary.getPhonetic())
                    .translation(dictionary == null ? null : dictionary.getTranslation())
                    .pos(dictionary == null ? null : dictionary.getPos())
                    .example(dictionary == null ? null : dictionary.getExample())
                    .exampleTranslation(dictionary == null ? null : dictionary.getExampleTranslation())
                    .rankNo(item.getRankNo())
                    .wordId(dictionary == null ? null : dictionary.getId())
                    .status(vocabulary == null ? null : vocabulary.getStatus())
                    .isMastered(vocabulary != null && vocabulary.getIsMastered() != null
                            && vocabulary.getIsMastered() == 1 ? 1 : 0)
                    .build());
        }
        return result;
    }

    @Override
    public long getWordBookWordCount(Long userId, String bookCode, String keyword, String status) {
        assertWordBookExists(bookCode);
        StatusFilter statusFilter = buildStatusFilter(userId, bookCode, status);
        LambdaQueryWrapper<WordBookItem> wrapper = new LambdaQueryWrapper<WordBookItem>()
                .eq(WordBookItem::getBookCode, bookCode);
        if (keyword != null && !keyword.isBlank()) {
            wrapper.like(WordBookItem::getWord, keyword.trim().toLowerCase(Locale.ROOT));
        }
        if (statusFilter.allowed() != null) {
            if (statusFilter.allowed().isEmpty()) {
                return 0L;
            }
            wrapper.in(WordBookItem::getWord, statusFilter.allowed());
        } else if (statusFilter.excluded() != null && !statusFilter.excluded().isEmpty()) {
            wrapper.notIn(WordBookItem::getWord, statusFilter.excluded());
        }
        Long count = wordBookItemMapper.selectCount(wrapper);
        return count == null ? 0L : count;
    }

    /**
     * 词书词表的状态过滤条件。
     *
     * <p>allowed 非空时按 IN 过滤（指定状态）；excluded 非空时按 NOT IN 过滤（「未学习」
     * = 词书内除去已学的词）。两者都为空表示不过滤。</p>
     */
    private record StatusFilter(List<String> allowed, List<String> excluded) {
    }

    /**
     * 构造词书词表的状态过滤条件。
     *
     * <p>不能用 SQL JOIN 算状态：word_book_item 是 utf8mb4_unicode_ci，
     * user_vocabulary 是 utf8mb4_0900_ai_ci，collation 不同会报 1267。
     * 这里查该用户全部词条（走 user_id 索引，SQL 短），再在内存里与词书词集合求交集。</p>
     *
     * @param status ALL / NEW（未学习）/ LEARNING（复习中，含 REVIEWING）/ MASTERED / FAMILIAR
     */
    private StatusFilter buildStatusFilter(Long userId, String bookCode, String status) {
        String filter = normalizeStatusFilter(status);
        if ("ALL".equals(filter)) {
            return new StatusFilter(null, null);
        }
        // 词书内的词：比较键 → 词书原值（IN/NOT IN 必须用原值，否则大小写差异会漏匹配）
        Map<String, String> keyToBookWord = new HashMap<>();
        for (WordBookItem item : wordBookItemMapper.selectList(
                new LambdaQueryWrapper<WordBookItem>().eq(WordBookItem::getBookCode, bookCode))) {
            if (item.getWord() != null) {
                keyToBookWord.putIfAbsent(wordKey(item.getWord()), item.getWord());
            }
        }
        if (keyToBookWord.isEmpty()) {
            return new StatusFilter(List.of(), List.of());
        }
        // 该用户在这些词上的状态
        Map<String, String> keyToStatus = new HashMap<>();
        for (UserVocabulary v : vocabularyMapper.selectList(
                new LambdaQueryWrapper<UserVocabulary>()
                        .eq(UserVocabulary::getUserId, userId))) {
            if (v.getWord() != null) {
                String key = wordKey(v.getWord());
                if (keyToBookWord.containsKey(key)) {
                    keyToStatus.put(key, v.getStatus());
                }
            }
        }
        if ("NEW".equals(filter)) {
            // 未学习 = 词书内除去已学过的词
            List<String> learned = keyToBookWord.entrySet().stream()
                    .filter(e -> keyToStatus.containsKey(e.getKey()))
                    .map(Map.Entry::getValue)
                    .collect(Collectors.toList());
            return new StatusFilter(null, learned);
        }
        List<String> allowed = keyToBookWord.entrySet().stream()
                .filter(e -> matchStatusFilter(filter, keyToStatus.get(e.getKey())))
                .map(Map.Entry::getValue)
                .collect(Collectors.toList());
        return new StatusFilter(allowed, null);
    }

    /** 状态过滤取值归一：ALL / NEW / LEARNING / REVIEWING / MASTERED / FAMILIAR */
    private static String normalizeStatusFilter(String status) {
        if (status == null || status.isBlank()) {
            return "ALL";
        }
        String s = status.trim().toUpperCase(Locale.ROOT);
        return switch (s) {
            case "NEW", "UNLEARNED" -> "NEW";
            case "LEARNING", "REVIEWING", "MASTERED", "FAMILIAR" -> s;
            default -> "ALL";
        };
    }

    /** 判断某个词条是否命中状态过滤条件 */
    private static boolean matchStatusFilter(String filter, String status) {
        if (status == null) {
            return false;
        }
        return switch (filter) {
            // 页面上「复习中」合并 LEARNING 与 REVIEWING 两态
            case "LEARNING" -> VocabularyStatus.LEARNING.equals(status)
                    || VocabularyStatus.REVIEWING.equals(status);
            case "REVIEWING" -> VocabularyStatus.REVIEWING.equals(status);
            case "MASTERED" -> VocabularyStatus.MASTERED.equals(status);
            case "FAMILIAR" -> VocabularyStatus.FAMILIAR.equals(status);
            default -> true;
        };
    }

    /** 词书不存在时统一抛业务异常，避免词表接口返回空数据掩盖配置问题。 */
    private void assertWordBookExists(String bookCode) {
        WordBook book = wordBookMapper.selectOne(
                new LambdaQueryWrapper<WordBook>().eq(WordBook::getCode, bookCode));
        if (book == null) {
            throw new BusinessException(ErrorCode.NOT_FOUND, "词书不存在");
        }
    }

    /** 单词比较键：去选项前缀后统一小写，兼容存量数据的大小写差异。 */
    private static String wordKey(String word) {
        return VocabularyLearningHelper.normalizeWord(word).toLowerCase(Locale.ROOT);
    }

    /**
     * 选择新词练习条目：按当前词书 + 同等级取题，禁止跨书/跨等级兜底，无题词返回词卡。
     */
    @Override
    public List<NewWordItemVO> selectNewWordItems(Long userId, int count) {
        int safeCount = Math.max(1, Math.min(50, count));
        // 一次拉取偏好：当前词书 + 「收藏词并行」开关，避免重复跨服务往返
        PreferenceResult preference = fetchPreference(userId);
        WordBook book = resolveBookById(preference != null ? preference.getActiveWordBookId() : null);
        if (book == null) {
            log.warn("新词选题: userId={} 未设置词书，返回空", userId);
            return Collections.emptyList();
        }
        boolean includeFavorite = preference != null
                && Boolean.TRUE.equals(preference.getIncludeFavoriteWords());

        String bookCode = book.getCode();
        String level = book.getLevel();

        // 1. 词书内所有词（按 rank_no 升序，优先高频）
        List<WordBookItem> items = wordBookItemMapper.selectList(
                new LambdaQueryWrapper<WordBookItem>()
                        .eq(WordBookItem::getBookCode, bookCode)
                        .orderByAsc(WordBookItem::getRankNo));

        // 2. 已学词集合（排除这些词，保证不重复学）
        Set<String> learnedWords = vocabularyMapper.selectList(
                        new LambdaQueryWrapper<UserVocabulary>()
                                .eq(UserVocabulary::getUserId, userId))
                .stream()
                .map(v -> VocabularyLearningHelper.normalizeWord(v.getWord()).toLowerCase(Locale.ROOT))
                .filter(w -> !w.isEmpty())
                .collect(Collectors.toSet());

        // 3. 候选词池：收藏词优先（开关开启时），再接词书词
        List<String> candidateWords = new ArrayList<>();
        Set<String> queued = new HashSet<>();
        if (includeFavorite) {
            for (UserWordFavorite fav : userWordFavoriteMapper.selectList(
                    new LambdaQueryWrapper<UserWordFavorite>()
                            .eq(UserWordFavorite::getUserId, userId))) {
                String w = VocabularyLearningHelper.normalizeWord(fav.getWord())
                        .toLowerCase(Locale.ROOT);
                if (w.isEmpty() || learnedWords.contains(w) || !queued.add(w)) continue;
                candidateWords.add(w);
            }
        }
        for (WordBookItem item : items) {
            String w = item.getWord();
            if (w == null) continue;
            String key = w.toLowerCase(Locale.ROOT);
            if (learnedWords.contains(key) || !queued.add(key)) continue;
            candidateWords.add(w);
        }

        // 4. 最近 7 天已做题目（避免重复）
        LocalDateTime sevenDaysAgo = LocalDateTime.now().minusDays(7);
        Set<Long> recentQuestionIds = exerciseLogMapper.selectList(
                        new LambdaQueryWrapper<UserExerciseLog>()
                                .eq(UserExerciseLog::getUserId, userId)
                                .ge(UserExerciseLog::getCreatedAt, sevenDaysAgo))
                .stream().map(UserExerciseLog::getQuestionId)
                .filter(Objects::nonNull)
                .collect(Collectors.toSet());

        // 5. 对候选词匹配题目（同等级，不跨级兜底）
        List<NewWordItemVO> result = new ArrayList<>();
        int questionBudget = safeCount * 2; // 多取一些，避免全无题时不够
        int scanned = 0;
        int maxScan = Math.min(candidateWords.size(), 200); // 最多扫 200 个词，避免全表扫描

        for (String word : candidateWords) {
            if (result.size() >= safeCount || scanned >= maxScan) break;
            scanned++;

            QuestionInfo qi = findQuestionByWord(word, level);
            if (qi != null && !recentQuestionIds.contains(qi.getId())) {
                result.add(NewWordItemVO.builder()
                        .type("QUESTION")
                        .question(toQuestionVO(qi, false))
                        .build());
            } else {
                // 无题（或最近做过）→ 词卡降级
                WordDictionary wd = wordDictionaryMapper.selectOne(
                        new LambdaQueryWrapper<WordDictionary>()
                                .eq(WordDictionary::getWord, word.toLowerCase(Locale.ROOT)));
                if (wd != null) {
                    result.add(NewWordItemVO.builder()
                            .type("CARD")
                            .card(WordCardVO.builder()
                                    .word(wd.getWord())
                                    .phonetic(wd.getPhonetic())
                                    .translation(wd.getTranslation())
                                    .pos(wd.getPos())
                                    .example(wd.getExample())
                                    .exampleTranslation(wd.getExampleTranslation())
                                    .rankNo(null)
                                    .build())
                            .build());
                }
            }
        }

        log.info("新词选题(词书约束): userId={}, book={}, level={}, 需求{}条, 返回{}条",
                userId, bookCode, level, safeCount, result.size());
        return result;
    }

    /** 按 answer_word 匹配题目（同等级） */
    private QuestionInfo findQuestionByWord(String word, String level) {
        String lower = word.toLowerCase(Locale.ROOT);
        List<QuestionInfo> matches = questionInfoMapper.selectList(
                new LambdaQueryWrapper<QuestionInfo>()
                        .eq(QuestionInfo::getModuleType, 1)
                        .eq(QuestionInfo::getTargetLevel, level)
                        .eq(QuestionInfo::getIsDeleted, 0)
                        .and(w -> w.eq(QuestionInfo::getAnswerWord, lower)
                                .or().isNull(QuestionInfo::getAnswerWord)));
        if (matches.isEmpty()) return null;
        // 优先 answer_word 精确匹配
        for (QuestionInfo qi : matches) {
            if (qi.getAnswerWord() != null && qi.getAnswerWord().equalsIgnoreCase(lower)) {
                return qi;
            }
        }
        // 回落：取 content 的 correct_answer 匹配
        for (QuestionInfo qi : matches) {
            QuestionContent content = questionContentMapper.selectOne(
                    new LambdaQueryWrapper<QuestionContent>().eq(QuestionContent::getQuestionId, qi.getId()));
            if (content != null && content.getCorrectAnswer() != null
                    && VocabularyLearningHelper.normalizeWord(content.getCorrectAnswer()).equalsIgnoreCase(lower)) {
                return qi;
            }
        }
        return null;
    }

    /**
     * 拉取 user-service 的用户偏好，一次调用取回全部字段。
     *
     * <p>原先「取当前词书」与「取每日新词目标」各发一次相同请求，
     * 这里合并为一次，避免同一请求内重复往返。</p>
     */
    private PreferenceResult fetchPreference(Long userId) {
        try {
            String url = userServiceUrl + "/internal/user/preference/" + userId;
            HttpHeaders headers = new HttpHeaders();
            if (internalToken != null && !internalToken.isBlank()) {
                headers.set("X-Internal-Token", internalToken);
            }
            ResponseEntity<Result<PreferenceResult>> response = restTemplate.exchange(
                    url, HttpMethod.GET, new HttpEntity<>(headers),
                    new ParameterizedTypeReference<Result<PreferenceResult>>() {
                    });
            if (response.getBody() != null && response.getBody().getCode() == 200) {
                return response.getBody().getData();
            }
        } catch (Exception e) {
            log.warn("获取用户偏好失败(userId={}): {}", userId, e.getMessage());
        }
        return null;
    }

    /** 按词书ID解析词书，ID 缺失或词书不存在时回落 basic_500 */
    private WordBook resolveBookById(Long bookId) {
        WordBook book = null;
        if (bookId != null) {
            book = wordBookMapper.selectById(bookId);
        }
        if (book == null) {
            // 默认回落到 basic_500
            book = wordBookMapper.selectOne(
                    new LambdaQueryWrapper<WordBook>().eq(WordBook::getCode, "basic_500"));
        }
        return book;
    }

    /** 解析当前词书：调 user-service 拿 activeWordBookId，未设置默认 basic_500 */
    private WordBook resolveActiveWordBook(Long userId) {
        PreferenceResult preference = fetchPreference(userId);
        return resolveBookById(preference != null ? preference.getActiveWordBookId() : null);
    }

    /** 读取每日新背单词数，失败默认 10 */
    private int getDailyNewWords(Long userId) {
        PreferenceResult preference = fetchPreference(userId);
        Integer dailyNewWords = preference != null ? preference.getDailyNewWords() : null;
        return dailyNewWords != null ? dailyNewWords : 10;
    }

    // ============= 定级测试题 =============

    @Override
    public List<QuestionVO> getAssessQuestions() {
        List<QuestionVO> result = new ArrayList<>();

        // 12道词汇题，难度均匀分布 1~8
        List<QuestionInfo> vocab = getQuestionsByModule(1, 12);
        result.addAll(vocab.stream().map(qi -> toQuestionVO(qi, false)).collect(Collectors.toList()));

        // 8道语法题，难度均匀分布 1~8
        List<QuestionInfo> grammar = getQuestionsByModule(2, 8);
        result.addAll(grammar.stream().map(qi -> toQuestionVO(qi, false)).collect(Collectors.toList()));

        return result;
    }

    private List<QuestionInfo> getQuestionsByModule(int moduleType, int count) {
        LambdaQueryWrapper<QuestionInfo> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(QuestionInfo::getModuleType, moduleType)
                .eq(QuestionInfo::getIsDeleted, 0)
                .orderByAsc(QuestionInfo::getDifficultyLevel)
                .last("LIMIT " + count * 2);
        List<QuestionInfo> all = questionInfoMapper.selectList(wrapper);

        // 均匀采样
        if (all.size() <= count) return all;
        List<QuestionInfo> sampled = new ArrayList<>();
        for (int i = 0; i < count; i++) {
            sampled.add(all.get(i * all.size() / count));
        }
        return sampled;
    }

    // ============= 单题详情 =============

    @Override
    public QuestionVO getQuestionById(Long questionId, boolean showAnswer) {
        QuestionInfo info = questionInfoMapper.selectById(questionId);
        if (info == null) return null;
        return toQuestionVO(info, showAnswer);
    }

    // ============= 批量取题（含答案，供learning-engine调用） =============

    @Override
    public List<QuestionVO> getQuestionsBatch(List<Long> questionIds) {
        if (questionIds == null || questionIds.isEmpty()) return Collections.emptyList();
        List<QuestionInfo> infos = questionInfoMapper.selectBatchIds(questionIds);
        return infos.stream()
                .map(qi -> toQuestionVO(qi, true))
                .collect(Collectors.toList());
    }

    // ============= 提交答案 =============

    @Override
    public SubmitResponse submitAnswer(SubmitRequest request) {
        QuestionInfo info = questionInfoMapper.selectById(request.getQuestionId());
        QuestionContent content = questionContentMapper.selectOne(
                new LambdaQueryWrapper<QuestionContent>()
                        .eq(QuestionContent::getQuestionId, request.getQuestionId()));

        if (info == null || content == null) {
            throw new RuntimeException("题目不存在");
        }

        // 以数据库题目为准，避免客户端伪造 moduleType 污染日志/ELO/雷达维度
        int moduleType = info.getModuleType();
        if (request.getModuleType() != null && !request.getModuleType().equals(moduleType)) {
            throw new BusinessException(ErrorCode.BAD_REQUEST, "模块类型与题目不一致");
        }

        String traceId = UUID.randomUUID().toString().substring(0, 8);

        boolean isCorrect;
        String heuristicHint = null;
        String errorType = null;
        Integer matchedLevel = null;
        List<String> suggestions = new ArrayList<>();
        Boolean isSemanticMatch = null;

        String judgeCorrectAnswer = content.getCorrectAnswer();
        String judgeContext = content.getStem();

        JudgmentResult judgmentResult;
        if (moduleType == 2) {
            String[] display = buildGrammarDisplay(content, request.getUserAnswer());
            String fullSentence = display[0] != null ? display[0] : "";
            String correctText = display[1] != null ? display[1] : "";
            judgeCorrectAnswer = correctText;

            // 用 normalizeSentence 对比：消除标点、空格差异
            // 用户提交的可能是完整句子也可能是填空部分
            String normUser = normalizeSentence(request.getUserAnswer());
            String normFull = normalizeSentence(fullSentence);
            String normText = normalizeSentence(correctText);

            if (!normUser.isEmpty() && (normUser.equals(normFull) || normUser.equals(normText))) {
                judgmentResult = JudgmentResult.builder()
                        .isCorrect(true)
                        .heuristicHint("回答正确！")
                        .matchedLevel(JudgmentLevel.LOCAL_MATCH)
                        .suggestions(List.of())
                        .build();
            } else {
                judgmentResult = judgmentEngine.judge(request, judgeCorrectAnswer, judgeContext);
            }
        } else if (moduleType == 4 || (moduleType == 7 && "CHOICE".equals(info.getQuestionType()))) {
            // 选择题（听力、阅读仔细阅读/信息匹配）只做本地确定性比对，不走 AI 语义判对/兜底，避免无 Key 时误判或 AI 放水
            boolean choiceCorrect = ChoiceAnswerUtil.isCorrect(
                    request.getUserAnswer(), content.getCorrectAnswer(), content.getOptions());
            String wrongHint = moduleType == 4
                    ? "再听一遍录音，注意关键信息。"
                    : "回到原文，定位题干关键词所在的句子。";
            judgmentResult = JudgmentResult.builder()
                    .isCorrect(choiceCorrect)
                    .heuristicHint(choiceCorrect ? "回答正确！" : wrongHint)
                    .matchedLevel(JudgmentLevel.EXACT)
                    .suggestions(List.of())
                    .isSemanticMatch(false)
                    .build();
        } else if (moduleType == 3) {
            // 翻译题：本地归一化精确比对 + 短句走 AI 语义兜底，段落仅本地比对
            // 题干中文长度 > 40 判定为段落翻译（passage），不走 AI 兜底
            String stem = content.getStem() != null ? content.getStem() : "";
            boolean isPassage = stem.length() > 40;
            judgmentResult = judgmentEngine.judgeTranslation(
                    request, judgeCorrectAnswer, judgeContext,
                    info.getAcceptedAnswers(), isPassage);
        } else {
            judgmentResult = judgmentEngine.judge(request, judgeCorrectAnswer, judgeContext);
        }

        isCorrect = judgmentResult.getIsCorrect();
        heuristicHint = judgmentResult.getHeuristicHint();
        errorType = judgmentResult.getErrorType();
        matchedLevel = judgmentResult.getMatchedLevel();
        suggestions = judgmentResult.getSuggestions();
        isSemanticMatch = judgmentResult.getIsSemanticMatch();

        if (!isCorrect && heuristicHint == null) {
            heuristicHint = "这个答案不太对哦，再想一想这个词的正确用法是什么？";
        }

        // 新词循环的练习尝试只判题，不写日志、不更新 ELO/遗忘曲线、不触发金币组
        boolean practiceOnly = Boolean.TRUE.equals(request.getPracticeOnly());
        // practiceOnly 优先：只判题时不写任何记录；statsOnly 写记录但只累加正确率
        boolean statsOnly = !practiceOnly && Boolean.TRUE.equals(request.getStatsOnly());
        CoinAwardResult coinAward = null;
        // 答题记录ID：insert 后由 MyBatis-Plus 回填自增主键，供前端反查本次提交的上下文
        Long logId = null;

        if (!practiceOnly) {
            // 本地写操作放在同一事务：日志 + 错题本要么都成功，要么都回滚
            UserExerciseLog logEntry = new UserExerciseLog();
            logEntry.setUserId(request.getUserId());
            logEntry.setQuestionId(request.getQuestionId());
            logEntry.setUserAnswer(request.getUserAnswer());
            logEntry.setIsCorrect(isCorrect ? 1 : 0);
            logEntry.setDurationSeconds(request.getDurationSeconds());
            logEntry.setModuleType(moduleType);
            logEntry.setTraceId(traceId);
            logEntry.setBatchKey(normalizeBatchKey(request.getBatchKey()));
            // 统一使用 Asia/Shanghai，保证按日统计与词汇组判定一致
            logEntry.setCreatedAt(LocalDateTime.now(clock));

            Long userId = request.getUserId();
            Long questionId = request.getQuestionId();
            new TransactionTemplate(transactionManager).executeWithoutResult(status -> {
                exerciseLogMapper.insert(logEntry);
                // 只记统计时不动错题本：复习答错不该把已掌握的词重新打成错题
                if (!statsOnly) {
                    if (!isCorrect) {
                        upsertErrorBook(userId, questionId);
                    } else {
                        resolveErrorBook(userId, questionId);
                    }
                }
            });
            // 事务提交后主键已回填，此处读取即可拿到自增ID
            logId = logEntry.getId();

            if (statsOnly) {
                // 复习只计入正确率，不重复发放金币、不推进 ELO 与遗忘曲线、不入复核队列
                recordModuleStatOnly(request.getUserId(), moduleType, isCorrect);
            } else {
                // 事务提交后再执行跨服务/消息副作用，避免长事务与本地回滚不一致
                // 词汇答题刚好完成一组时发放金币，失败不影响答题主流程
                if (moduleType == 1) {
                    coinAward = maybeAwardVocabGroup(request.getUserId());
                }

                // 灰区（reviewDraft 非空）跳过计分，等复核结论出来再补记一次，避免不可逆的"先加后减"
                applyLearningSideEffects(request, info, moduleType, isCorrect,
                        judgmentResult.getReviewDraft(), logId, traceId, judgeCorrectAnswer);

                // 发布RabbitMQ事件（异步解耦，fire-and-forget）
                // 灰区必须一并跳过：consumer 会无条件写遗忘曲线，发了就等于计了两次
                publishCompletedEvent(request, moduleType, isCorrect, traceId, judgmentResult.getReviewDraft());
            }
        }

        if (practiceOnly) {
            log.info("练习提交(不计分): userId={}, questionId={}, correct={}, traceId={}",
                    request.getUserId(), request.getQuestionId(), isCorrect, traceId);
        } else if (statsOnly) {
            log.info("复习提交(只计正确率): userId={}, questionId={}, correct={}, traceId={}",
                    request.getUserId(), request.getQuestionId(), isCorrect, traceId);
        } else {
            log.info("答题提交: userId={}, questionId={}, correct={}, matchedLevel={}, errorType={}, traceId={}",
                    request.getUserId(), request.getQuestionId(), isCorrect, matchedLevel, errorType, traceId);
        }

        return SubmitResponse.builder()
                .isCorrect(isCorrect)
                .correctAnswer(content.getCorrectAnswer())
                .correctAnswerKey(extractAnswerKey(content.getCorrectAnswer()))
                .analysis(content.getAnalysis())
                .traceId(traceId)
                .logId(logId)
                .heuristicHint(heuristicHint)
                .errorType(errorType)
                .matchedLevel(matchedLevel)
                .suggestions(suggestions)
                .isSemanticMatch(isSemanticMatch)
                .coinAwarded(coinAward != null && Boolean.TRUE.equals(coinAward.getAwarded())
                        ? coinAward.getAmount() : null)
                .coinBalance(coinAward != null && Boolean.TRUE.equals(coinAward.getAwarded())
                        ? coinAward.getBalance() : null)
                .build();
    }

    private boolean judge(String userAnswer, String correctAnswer) {
        if (userAnswer == null || correctAnswer == null) return false;
        String ua = userAnswer.trim().toLowerCase();
        String ca = correctAnswer.trim().toLowerCase();
        if (ua.equals(ca)) return true;
        // 从完整答案文本（如 "A. established"）中提取选项字母
        String caKey = extractKey(ca);
        if (ua.equals(caKey)) return true;
        // 从 "A. established" 中提取选项文本 "established" 与 ua 对比
        // 解决前端提交选项文本（而非字母）时的判分问题
        String caText = extractOptionText(ca);
        if (!caText.isEmpty() && ua.equals(caText)) return true;
        // userAnswer 是字母（a-d），correctAnswer 可能以该字母开头
        if (ua.matches("[a-d]")) {
            if (ca.startsWith(ua + ".") || ca.startsWith(ua + "、") || ca.startsWith(ua + ")")) {
                return true;
            }
        }
        return false;
    }

    /**
     * 规范化句子用于对比判分：
     * 去掉所有标点符号（句号、逗号、问号、感叹号、分号、冒号、引号、括号等），
     * 去掉多余空格，统一小写。
     * 用于语法题（词语排序题）提交完整句子时的对比，避免标点和空格差异导致误判。
     */
    private String normalizeSentence(String s) {
        if (s == null) return "";
        return s.toLowerCase()
                .replaceAll("[\\p{Punct}。？！，；：、\u201c\u201d\u2018\u2019（）【】《》…—]", "")
                .replaceAll("\\s+", " ")
                .trim();
    }

    /**
     * 从 "A. established" 格式中提取选项纯文本 "established"
     * 用于前端提交选项文本时与 correctAnswer（含字母前缀）做对比
     * 输入已统一转小写
     */
    private String extractOptionText(String answer) {
        if (answer == null) return "";
        String t = answer.trim();
        if (t.length() < 2) return "";
        char first = t.charAt(0);
        // 首字符为 a-d，跳过分隔符（. 、 ) 空格），返回剩余文本
        if (first >= 'a' && first <= 'd') {
            int i = 1;
            while (i < t.length() && (t.charAt(i) == '.' || t.charAt(i) == '、'
                    || t.charAt(i) == ')' || t.charAt(i) == ' ')) {
                i++;
            }
            if (i < t.length()) {
                return t.substring(i).trim();
            }
        }
        return "";
    }

    /** 从任意格式的答案中提取纯选项字母 */
    private String extractKey(String answer) {
        if (answer == null) return "";
        String t = answer.trim().toLowerCase();
        if (t.isEmpty()) return t;
        // 尝试：A. xxx / A.xxx
        if (t.length() >= 2 && t.charAt(1) == '.') return t.substring(0, 1);
        // 尝试：数字. A. xxx
        int dotIdx = t.indexOf('.');
        if (dotIdx >= 0 && dotIdx + 2 < t.length()) {
            String rest = t.substring(dotIdx + 1).trim();
            if (rest.length() >= 1 && rest.charAt(0) >= 'a' && rest.charAt(0) <= 'd') {
                return String.valueOf(rest.charAt(0));
            }
        }
        // 单字母
        if (t.length() == 1 && t.charAt(0) >= 'a' && t.charAt(0) <= 'd') return t;
        return t;
    }

    /** 从 "A. some text" 中提取 "A"，兼容纯字母格式 */
    private String extractAnswerKey(String answer) {
        if (answer == null) return "";
        String t = answer.trim();
        if (t.length() >= 2 && t.charAt(1) == '.') return t.substring(0, 1).toUpperCase();
        if (t.length() == 1 && Character.isLetter(t.charAt(0))) return t.toUpperCase();
        return t;
    }

    /**
     * 答题后的学习副作用：遗忘曲线 + ELO，或段落翻译灰区的一次性入队。
     *
     * <p>灰区（{@code draft != null}）**不记 ELO / 曲线**：结论还没定，先记再改会造成
     * ELO 反向不对称、曲线阶梯不可逆。等人工复核出结论，由 resolve 用队列里的
     * difficultyLevel / moduleType 补记一次。</p>
     *
     * <p>入队放在这里而不是判题引擎里，是因为此刻 {@code user_exercise_log} 已插入、
     * 主键已回填，队列可以直接存 log_id，复核时按主键精确改判。</p>
     */
    void applyLearningSideEffects(SubmitRequest request, QuestionInfo info, int moduleType,
                                  boolean isCorrect, TranslationReviewDraft draft, Long logId,
                                  String traceId, String correctAnswer) {
        if (draft != null && logId != null) {
            JudgeReviewEnqueueRequest enqueue = new JudgeReviewEnqueueRequest();
            enqueue.setQuestionId(request.getQuestionId());
            enqueue.setUserId(request.getUserId());
            enqueue.setLogId(logId);
            enqueue.setDifficultyLevel(info != null ? info.getDifficultyLevel() : null);
            enqueue.setModuleType(moduleType);
            enqueue.setUserAnswer(request.getUserAnswer());
            enqueue.setCorrectAnswer(correctAnswer);
            enqueue.setMatchedLevel(JudgmentLevel.SEMANTIC);
            enqueue.setReason(draft.getReason());
            enqueue.setAiConfidence(draft.getAiConfidence());
            enqueue.setAiResult(draft.getAiResult());
            String context = (draft.getJudgeContext() == null ? "" : draft.getJudgeContext())
                    + ";traceId=" + traceId;
            enqueue.setJudgeContext(context.length() > 1000 ? context.substring(0, 1000) : context);
            judgeReviewAsyncWriter.enqueueAsync(enqueue);
            return;
        }
        if (draft != null) {
            // 理论上不会发生（practiceOnly 不走这里）；真发生就按普通判对计分，避免漏记
            log.warn("灰区结果缺少答题记录ID，按普通判对计分: questionId={}", request.getQuestionId());
        }

        // 调用 learning-engine 更新遗忘曲线
        try {
            String url = learningEngineUrl + "/learning/update-curve";
            Map<String, Object> body = new HashMap<>();
            body.put("userId", request.getUserId());
            body.put("questionId", request.getQuestionId());
            body.put("isCorrect", isCorrect);
            body.put("moduleType", moduleType);

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            HttpEntity<Map<String, Object>> entity = new HttpEntity<>(body, headers);
            restTemplate.postForEntity(url, entity, String.class);
        } catch (Exception e) {
            log.warn("调用learning-engine更新遗忘曲线失败: {}", e.getMessage());
        }

        // 调用 user-service 更新ELO分
        try {
            String url = userServiceUrl + "/user/radar/update-elo";
            Map<String, Object> body = new HashMap<>();
            body.put("userId", request.getUserId());
            body.put("difficultyLevel", info != null ? info.getDifficultyLevel() : null);
            body.put("moduleType", moduleType);
            body.put("isCorrect", isCorrect);

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            HttpEntity<Map<String, Object>> entity = new HttpEntity<>(body, headers);
            restTemplate.postForEntity(url, entity, String.class);
        } catch (Exception e) {
            log.warn("调用user-service更新ELO失败: {}", e.getMessage());
        }
    }

    /**
     * 发布练习完成事件（fire-and-forget）。
     *
     * <p>灰区（{@code draft != null}）不能发：learning-engine 的消费者会无条件写遗忘曲线，
     * 而灰区的计分要等复核结论出来才补记——发了就会变成"先记一次、复核再记一次"。</p>
     */
    void publishCompletedEvent(SubmitRequest request, int moduleType, boolean isCorrect,
                               String traceId, TranslationReviewDraft draft) {
        if (draft != null) {
            return;
        }
        if (rabbitTemplate == null) {
            return;
        }
        try {
            ExerciseCompletedEvent event = ExerciseCompletedEvent.builder()
                    .userId(request.getUserId())
                    .questionId(request.getQuestionId())
                    .moduleType(moduleType)
                    .isCorrect(isCorrect)
                    .attemptCount(1)
                    .timestamp(System.currentTimeMillis())
                    .traceId(traceId)
                    .build();
            rabbitTemplate.convertAndSend(RabbitMQConfig.EXCHANGE_NAME,
                    RabbitMQConfig.ROUTING_KEY, event);
            log.debug("MQ事件已发送: traceId={}", traceId);
        } catch (Exception e) {
            log.warn("RabbitMQ事件发送失败（不影响主流程）: {}", e.getMessage());
        }
    }

    private void upsertErrorBook(Long userId, Long questionId) {
        UserErrorBook exist = errorBookMapper.selectOne(
                new LambdaQueryWrapper<UserErrorBook>()
                        .eq(UserErrorBook::getUserId, userId)
                        .eq(UserErrorBook::getQuestionId, questionId));
        if (exist != null) {
            exist.setWrongCount(exist.getWrongCount() + 1);
            exist.setLastWrongAt(LocalDateTime.now());
            exist.setIsResolved(0);
            errorBookMapper.updateById(exist);
        } else {
            UserErrorBook eb = new UserErrorBook();
            eb.setUserId(userId);
            eb.setQuestionId(questionId);
            eb.setWrongCount(1);
            eb.setLastWrongAt(LocalDateTime.now());
            eb.setIsResolved(0);
            errorBookMapper.insert(eb);
        }
    }

    /**
     * 用户答对某题后，从错题本中移除该题（标记为已解决）
     * 错题集只保留未解决的错题，解决一个少一个
     */
    private void resolveErrorBook(Long userId, Long questionId) {
        UserErrorBook exist = errorBookMapper.selectOne(
                new LambdaQueryWrapper<UserErrorBook>()
                        .eq(UserErrorBook::getUserId, userId)
                        .eq(UserErrorBook::getQuestionId, questionId)
                        .eq(UserErrorBook::getIsResolved, 0));
        if (exist != null) {
            exist.setIsResolved(1);
            exist.setUpdatedAt(LocalDateTime.now());
            errorBookMapper.updateById(exist);
            log.info("错题已解决: userId={}, questionId={}", userId, questionId);
        }
    }

    // ============= 错题本 =============

    @Override
    public List<QuestionVO> getErrorBook(Long userId) {
        List<UserErrorBook> errors = errorBookMapper.selectList(
                new LambdaQueryWrapper<UserErrorBook>()
                        .eq(UserErrorBook::getUserId, userId)
                        .eq(UserErrorBook::getIsResolved, 0)
                        .orderByDesc(UserErrorBook::getWrongCount));
        if (errors.isEmpty()) return Collections.emptyList();

        List<Long> questionIds = errors.stream()
                .map(UserErrorBook::getQuestionId)
                .collect(Collectors.toList());

        List<QuestionInfo> infos = questionInfoMapper.selectBatchIds(questionIds);
        // 错题本需要显示正确答案（用户重做后需对照），showAnswer=true
        return infos.stream()
                .map(qi -> toQuestionVO(qi, true))
                .collect(Collectors.toList());
    }

    // ============= 知识点树 =============

    @Override
    public List<SysKnowledgePoint> getKnowledgePoints(String cetLevel) {
        return knowledgePointMapper.selectList(
                new LambdaQueryWrapper<SysKnowledgePoint>()
                        .eq(SysKnowledgePoint::getCetLevel, cetLevel)
                        .orderByAsc(SysKnowledgePoint::getSortOrder));
    }

    // ============= 每日单词 =============

    @Override
    public DailyWordVO getDailyWord(String cetLevel) {
        java.time.LocalDate today = java.time.LocalDate.now();

        // 1. 查今天是否已有每日单词
        DailyWord dailyWord = dailyWordMapper.selectOne(
                new LambdaQueryWrapper<DailyWord>()
                        .eq(DailyWord::getDate, today));

        WordDictionary word;
        if (dailyWord != null) {
            word = wordDictionaryMapper.selectById(dailyWord.getWordId());
        } else {
            // 2. 从词库选一个：按等级优先，usage_count 升序（轮转公平）
            List<WordDictionary> candidates = wordDictionaryMapper.selectList(
                    new LambdaQueryWrapper<WordDictionary>()
                            .eq(WordDictionary::getLevel, cetLevel)
                            .orderByAsc(WordDictionary::getUsageCount)
                            .last("LIMIT 1"));

            // 备用：放宽等级限制
            if (candidates.isEmpty()) {
                candidates = wordDictionaryMapper.selectList(
                        new LambdaQueryWrapper<WordDictionary>()
                                .orderByAsc(WordDictionary::getUsageCount)
                                .last("LIMIT 1"));
            }

            if (candidates.isEmpty()) {
                throw new RuntimeException("词库为空，请联系管理员添加单词");
            }

            word = candidates.get(0);

            // 3. 创建每日单词记录
            DailyWord newDailyWord = new DailyWord();
            newDailyWord.setWordId(word.getId());
            newDailyWord.setDate(today);
            try {
                dailyWordMapper.insert(newDailyWord);
            } catch (Exception e) {
                // 并发场景：唯一约束冲突，重新查询
                DailyWord existing = dailyWordMapper.selectOne(
                        new LambdaQueryWrapper<DailyWord>()
                                .eq(DailyWord::getDate, today));
                if (existing != null) {
                    word = wordDictionaryMapper.selectById(existing.getWordId());
                }
            }

            // 4. usage_count +1
            if (word != null) {
                word.setUsageCount(word.getUsageCount() + 1);
                wordDictionaryMapper.updateById(word);
            }
        }

        if (word == null) {
            throw new RuntimeException("每日单词数据异常");
        }

        return DailyWordVO.builder()
                .id(word.getId())
                .word(word.getWord())
                .phonetic(word.getPhonetic())
                .translation(word.getTranslation())
                .pos(word.getPos())
                .example(word.getExample())
                .exampleTranslation(word.getExampleTranslation())
                .level(word.getLevel())
                .date(today)
                .build();
    }

    // ============= 用户答题统计 =============

    @Override
    public UserExerciseStats getUserStats(Long userId) {
        // 1. 获取该用户所有答题记录
        List<UserExerciseLog> allLogs = exerciseLogMapper.selectList(
                new LambdaQueryWrapper<UserExerciseLog>()
                        .eq(UserExerciseLog::getUserId, userId)
                        .orderByAsc(UserExerciseLog::getCreatedAt));
        List<UserStudySession> studySessions = studySessionService.listByUser(userId);

        int totalAnswered = allLogs.size();
        int correctCount = (int) allLogs.stream().filter(l -> l.getIsCorrect() != null && l.getIsCorrect() == 1).count();
        int errorCount = totalAnswered - correctCount;
        double correctRate = totalAnswered > 0 ? (correctCount * 100.0 / totalAnswered) : 0.0;

        // 2. 累计学习时长（改用学习会话口径）
        int totalDurationSeconds = StudyDurationAggregator.totalSeconds(studySessions);
        double totalHours = totalDurationSeconds / 3600.0;
        int totalMinutes = (totalDurationSeconds % 3600) / 60;

        LocalDate today = LocalDate.now(clock);

        // 2.1 今日学习时长
        List<UserExerciseLog> todayLogs = allLogs.stream()
                .filter(l -> l.getCreatedAt() != null && l.getCreatedAt().toLocalDate().equals(today))
                .collect(Collectors.toList());

        int todayDurationSeconds = StudyDurationAggregator.todaySeconds(studySessions, today);

        // 2.2 今日答题数统计
        int todayAnsweredCount = todayLogs.size();
        int todayVocabAnswered = (int) todayLogs.stream()
                .filter(l -> l.getModuleType() != null && l.getModuleType() == 1)
                .count();
        int todayGrammarAnswered = (int) todayLogs.stream()
                .filter(l -> l.getModuleType() != null && l.getModuleType() == 2)
                .count();

        LocalDateTime todayStart = today.atStartOfDay();
        LocalDateTime tomorrowStart = today.plusDays(1).atStartOfDay();
        Long learnedCount = vocabularyMapper.selectCount(new LambdaQueryWrapper<UserVocabulary>()
                .eq(UserVocabulary::getUserId, userId)
                .ge(UserVocabulary::getFirstLearnedAt, todayStart)
                .lt(UserVocabulary::getFirstLearnedAt, tomorrowStart));
        Long reviewedCount = vocabularyMapper.selectCount(new LambdaQueryWrapper<UserVocabulary>()
                .eq(UserVocabulary::getUserId, userId)
                .ge(UserVocabulary::getLastReviewedAt, todayStart)
                .lt(UserVocabulary::getLastReviewedAt, tomorrowStart));
        int todayLearnedWords = learnedCount != null ? learnedCount.intValue() : 0;
        int todayReviewedWords = reviewedCount != null ? reviewedCount.intValue() : 0;

        // 3. 按日期分组（只看日期，不看时间）
        Map<java.time.LocalDate, List<UserExerciseLog>> byDate = allLogs.stream()
                .filter(l -> l.getCreatedAt() != null)
                .collect(Collectors.groupingBy(l -> l.getCreatedAt().toLocalDate()));

        // 4. 活跃天数：会话日期 ∪ 答题日志日期（连续天数统一使用签到口径）
        Set<LocalDate> sessionDates = StudyDurationAggregator.sessionDates(studySessions);
        int activeDays = StudyDurationAggregator.activeDays(sessionDates, byDate.keySet());

        // 6. 已掌握单词数 = user_vocabulary.is_mastered=1 的数量（不再用答题次数）
        Long masteredCount = vocabularyMapper.selectCount(new LambdaQueryWrapper<UserVocabulary>()
                .eq(UserVocabulary::getUserId, userId)
                .eq(UserVocabulary::getIsMastered, 1));
        int masteredWords = masteredCount != null ? masteredCount.intValue() : 0;

        // 7. 全国排名估算（基于正确率和答题量）
        double score = correctRate * 0.6 + Math.min(totalAnswered / 200.0, 1.0) * 40;
        double nationalRank = Math.max(1.0, Math.min(99.0, score));

        // 8. 词汇理解度 = 正确率
        double vocabularyComprehension = correctRate;

        // 9. 生成年度热力图数据 + 每日学习时长（当前年 1月1日 ~ 12月31日，按自然年排版）
        List<UserExerciseStats.DailyActivity> heatmapData = new ArrayList<>();
        List<Integer> yearlyStudyMinutes = new ArrayList<>();
        int currentYear = today.getYear();
        java.time.LocalDate startOfYear = java.time.LocalDate.of(currentYear, 1, 1);
        java.time.LocalDate endOfYear = java.time.LocalDate.of(currentYear, 12, 31);
        // 计算当前年总天数（兼容闰年 366 天与平年 365 天）
        long totalDaysOfYear = java.time.temporal.ChronoUnit.DAYS.between(startOfYear, endOfYear) + 1;
        for (int i = 0; i < totalDaysOfYear; i++) {
            java.time.LocalDate d = startOfYear.plusDays(i);
            List<UserExerciseLog> dayLogs = byDate.getOrDefault(d, Collections.emptyList());
            int count = dayLogs.size();
            int activityLevel = 0;
            if (count > 0 && count <= 3) {
                activityLevel = 1;
            } else if (count > 3 && count <= 8) {
                activityLevel = 2;
            } else if (count > 8 && count <= 15) {
                activityLevel = 3;
            } else if (count > 15 && count <= 25) {
                activityLevel = 4;
            } else if (count > 25) {
                activityLevel = 5;
            }

            heatmapData.add(UserExerciseStats.DailyActivity.builder()
                    .date(d.toString())
                    .questionCount(count)
                    .activityLevel(activityLevel)
                    .build());
        }
        // 年度每日学习时长（分钟）改用会话口径
        yearlyStudyMinutes = StudyDurationAggregator.yearlyMinutes(studySessions, currentYear);

        // 10. 本周学习时长（分钟）+ 每日答题数
        // 按周一到周日顺序返回，确保与前端标签对齐
        List<Integer> recentWeekQuestionCounts = new ArrayList<>();
        // 获取本周一的日期（Java的DayOfWeek: 1=周一, 7=周日）
        int dayOfWeek = today.getDayOfWeek().getValue();
        LocalDate monday = today.minusDays(dayOfWeek - 1L);
        // 遍历周一到周日（7天）
        for (int i = 0; i < 7; i++) {
            LocalDate d = monday.plusDays(i);
            List<UserExerciseLog> dayLogs = byDate.getOrDefault(d, Collections.emptyList());
            recentWeekQuestionCounts.add(dayLogs.size());
        }
        List<Integer> recentWeekMinutes = StudyDurationAggregator.recentWeekMinutes(studySessions, today);
        List<Integer> recent7DaysMinutes = StudyDurationAggregator.last7DaysMinutes(studySessions, today);
        List<String> recent7DaysLabels = StudyDurationAggregator.last7DaysLabels(today);

        // 10.1 本周平均每天答题数（最近7天每日答题数的平均值，四舍五入取整）
        double weeklyAvgQuestions = recentWeekQuestionCounts.stream()
                .mapToInt(Integer::intValue)
                .average()
                .orElse(0.0);
        int weeklyAverageQuestions = (int) Math.round(weeklyAvgQuestions);

        // 10.2 本年 1~12 月每月答题总数（12个元素，下标0对应1月）
        List<Integer> yearlyMonthQuestions = new ArrayList<>();
        for (int m = 1; m <= 12; m++) {
            java.time.YearMonth ym = java.time.YearMonth.of(currentYear, m);
            // 统计该月答题总数
            int monthQuestionCount = 0;
            for (Map.Entry<java.time.LocalDate, List<UserExerciseLog>> entry : byDate.entrySet()) {
                if (java.time.YearMonth.from(entry.getKey()).equals(ym)) {
                    monthQuestionCount += entry.getValue().size();
                }
            }
            yearlyMonthQuestions.add(monthQuestionCount);
        }

        // 11. 24小时学习分布（按会话开始小时统计）
        List<Integer> hourlyStudyMinutes = StudyDurationAggregator.hourlyMinutes(studySessions);

        return UserExerciseStats.builder()
                .totalAnswered(totalAnswered)
                .correctCount(correctCount)
                .errorCount(errorCount)
                .correctRate(Math.round(correctRate * 100.0) / 100.0)
                .totalDurationSeconds(totalDurationSeconds)
                .totalHours(Math.round(totalHours * 100.0) / 100.0)
                .totalMinutes(totalMinutes)
                .todayDurationSeconds(todayDurationSeconds)
                .todayAnsweredCount(todayAnsweredCount)
                .todayVocabAnswered(todayVocabAnswered)
                .todayGrammarAnswered(todayGrammarAnswered)
                .todayLearnedWords(todayLearnedWords)
                .todayReviewedWords(todayReviewedWords)
                .activeDays(activeDays)
                .masteredWords(masteredWords)
                .nationalRankPercent(Math.round(nationalRank * 100.0) / 100.0)
                .vocabularyComprehension(Math.round(vocabularyComprehension * 100.0) / 100.0)
                .heatmapData(heatmapData)
                .recentWeekMinutes(recentWeekMinutes)
                .recent7DaysMinutes(recent7DaysMinutes)
                .recent7DaysLabels(recent7DaysLabels)
                .weeklyAverageQuestions(weeklyAverageQuestions)
                .yearlyMonthQuestions(yearlyMonthQuestions)
                .yearlyStudyMinutes(yearlyStudyMinutes)
                .hourlyStudyMinutes(hourlyStudyMinutes)
                .build();
    }

    // ============= 内部工具方法 =============

    private QuestionVO toQuestionVO(QuestionInfo info, boolean showAnswer) {
        QuestionContent content = questionContentMapper.selectOne(
                new LambdaQueryWrapper<QuestionContent>()
                        .eq(QuestionContent::getQuestionId, info.getId()));

        String correctAnswer = content != null ? content.getCorrectAnswer() : null;
        // hint = 正确答案前2个字母（词汇/语法练习可用）
        String hint = (correctAnswer != null && correctAnswer.length() >= 2)
                ? correctAnswer.substring(0, 2)
                : (correctAnswer != null ? correctAnswer : "");
        // 选择题的 hint 等于泄露正确选项字母，听力题不下发
        if (info.getModuleType() != null && info.getModuleType() == 4) {
            hint = null;
        }

        String analysis = content != null ? content.getAnalysis() : null;
        // 自动生成的词汇题：analysis 存的是"释义 ｜ 原句：完整例句"，答题前只下发释义，
        // 否则原句里的目标词会直接泄漏答案。答题后（showAnswer=true）与 SubmittedResponse 仍下发完整解析。
        if (!showAnswer && analysis != null
                && info.getExternalKey() != null
                && info.getExternalKey().startsWith("vocab-auto-")) {
            int markIndex = analysis.indexOf(ANALYSIS_SENTENCE_MARK);
            if (markIndex > 0) {
                analysis = analysis.substring(0, markIndex).trim();
            }
        }

        return QuestionVO.builder()
                .id(info.getId())
                .moduleType(info.getModuleType())
                .difficultyLevel(info.getDifficultyLevel())
                .questionType(info.getQuestionType())
                .stem(content != null ? content.getStem() : null)
                .options(content != null ? content.getOptions() : null)
                .correctAnswer(showAnswer && content != null ? correctAnswer : null)
                .hint(hint)
                .analysis(analysis)
                .showAnswer(showAnswer)
                // 优先用词条原形（V1.0.12 起自动生成的词汇题会写 answer_word），旧题回落正确答案
                .answerWord(info.getAnswerWord() != null ? info.getAnswerWord() : correctAnswer)
                .build();
    }

    // ============= 收藏句 =============

    @Override
    public FavoriteVO addFavorite(Long userId, String sentenceText, Long questionId) {
        UserFavorite f = new UserFavorite();
        f.setUserId(userId);
        f.setSentenceText(sentenceText);
        f.setQuestionId(questionId);
        f.setSourceType(questionId != null ? "EXERCISE" : "SENTENCE");
        favoriteMapper.insert(f);
        return toFavoriteVO(f);
    }

    @Override
    public List<FavoriteVO> getFavorites(Long userId) {
        List<UserFavorite> list = favoriteMapper.selectList(
                new LambdaQueryWrapper<UserFavorite>()
                        .eq(UserFavorite::getUserId, userId)
                        .orderByDesc(UserFavorite::getCreatedAt));
        return list.stream().map(this::toFavoriteVO).collect(Collectors.toList());
    }

    @Override
    public void removeFavorite(Long id, Long userId) {
        favoriteMapper.delete(
                new LambdaQueryWrapper<UserFavorite>()
                        .eq(UserFavorite::getId, id)
                        .eq(UserFavorite::getUserId, userId));
    }

    private FavoriteVO toFavoriteVO(UserFavorite f) {
        return FavoriteVO.builder()
                .id(f.getId())
                .userId(f.getUserId())
                .sentenceText(f.getSentenceText())
                .questionId(f.getQuestionId())
                .sourceType(f.getSourceType())
                .createdAt(f.getCreatedAt())
                .build();
    }

    // ============= 单词收藏 =============

    @Override
    public UserWordFavoriteVO addWordFavorite(Long userId, String word) {
        String normalized = VocabularyLearningHelper.normalizeWord(word);
        if (normalized.isEmpty()) {
            throw new RuntimeException("单词不能为空");
        }
        String lower = normalized.toLowerCase(Locale.ROOT);

        // 幂等：已收藏直接返回
        UserWordFavorite existing = userWordFavoriteMapper.selectOne(
                new LambdaQueryWrapper<UserWordFavorite>()
                        .eq(UserWordFavorite::getUserId, userId)
                        .eq(UserWordFavorite::getWord, lower));
        if (existing != null) {
            return toUserWordFavoriteVO(existing);
        }

        // 关联 word_dictionary
        WordDictionary wd = wordDictionaryMapper.selectOne(
                new LambdaQueryWrapper<WordDictionary>().eq(WordDictionary::getWord, lower));

        UserWordFavorite fav = new UserWordFavorite();
        fav.setUserId(userId);
        fav.setWordId(wd != null ? wd.getId() : null);
        fav.setWord(lower);
        userWordFavoriteMapper.insert(fav);

        // 记录收藏事件（不创建 user_vocabulary）
        logWordLearnEvent(userId, wd != null ? wd.getId() : null, lower, "FAVORITE", null,
                resolveBookCodeForWord(userId, lower));

        return toUserWordFavoriteVO(fav);
    }

    @Override
    public void removeWordFavorite(Long userId, String word) {
        String normalized = VocabularyLearningHelper.normalizeWord(word);
        String lower = normalized.toLowerCase(Locale.ROOT);
        userWordFavoriteMapper.delete(
                new LambdaQueryWrapper<UserWordFavorite>()
                        .eq(UserWordFavorite::getUserId, userId)
                        .eq(UserWordFavorite::getWord, lower));
        // 记录取消收藏事件
        WordDictionary wd = wordDictionaryMapper.selectOne(
                new LambdaQueryWrapper<WordDictionary>().eq(WordDictionary::getWord, lower));
        logWordLearnEvent(userId, wd != null ? wd.getId() : null, lower, "UNFAVORITE", null,
                resolveBookCodeForWord(userId, lower));
    }

    @Override
    public List<UserWordFavoriteVO> getWordFavorites(Long userId) {
        List<UserWordFavorite> list = userWordFavoriteMapper.selectList(
                new LambdaQueryWrapper<UserWordFavorite>()
                        .eq(UserWordFavorite::getUserId, userId)
                        .orderByDesc(UserWordFavorite::getCreatedAt));
        return list.stream().map(this::toUserWordFavoriteVO).collect(Collectors.toList());
    }

    private UserWordFavoriteVO toUserWordFavoriteVO(UserWordFavorite f) {
        String phonetic = null;
        String translation = null;
        String pos = null;
        if (f.getWordId() != null) {
            WordDictionary wd = wordDictionaryMapper.selectById(f.getWordId());
            if (wd != null) {
                phonetic = wd.getPhonetic();
                translation = wd.getTranslation();
                pos = wd.getPos();
            }
        }
        return UserWordFavoriteVO.builder()
                .id(f.getId())
                .userId(f.getUserId())
                .wordId(f.getWordId())
                .word(f.getWord())
                .phonetic(phonetic)
                .translation(translation)
                .pos(pos)
                .createdAt(f.getCreatedAt())
                .build();
    }

    /** 记录单词学习事件 */
    /**
     * 记录单词学习事件。
     *
     * @param result 作答结果 CORRECT/WRONG；收藏、忽略等非答题事件传 null
     */
    private void logWordLearnEvent(Long userId, Long wordId, String word,
                                   String eventType, String result, String bookCode) {
        UserWordLearnLog logEntry = new UserWordLearnLog();
        logEntry.setUserId(userId);
        logEntry.setWordId(wordId);
        logEntry.setWord(word == null ? "" : word.toLowerCase(Locale.ROOT));
        logEntry.setEventType(eventType);
        logEntry.setResult(result);
        logEntry.setBookCode(bookCode);
        userWordLearnLogMapper.insert(logEntry);
    }

    /**
     * 解析某个词所属的词书编码，用于事件记录。
     *
     * <p>优先按词反查 word_book_item（同一本词书可能收录同一个词，取 sort_order 最小的主词书），
     * 查不到再回落用户当前活跃词书；两边都取不到返回 null。</p>
     *
     * <p>只查 word_book_item / word_book（都是 utf8mb4_unicode_ci），不跨 0900 表，
     * 不需要额外 COLLATE。</p>
     */
    private String resolveBookCodeForWord(Long userId, String word) {
        if (word == null || word.isBlank()) {
            return null;
        }
        String lower = word.toLowerCase(Locale.ROOT);
        List<WordBookItem> items = wordBookItemMapper.selectList(
                new LambdaQueryWrapper<WordBookItem>()
                        .eq(WordBookItem::getWord, lower)
                        .select(WordBookItem::getBookCode));
        if (!items.isEmpty()) {
            Set<String> codes = items.stream()
                    .map(WordBookItem::getBookCode)
                    .filter(code -> code != null && !code.isBlank())
                    .collect(Collectors.toSet());
            if (codes.size() == 1) {
                return codes.iterator().next();
            }
            if (!codes.isEmpty()) {
                // 多本词书都收录：按 word_book.sort_order 取最靠前的一本
                List<WordBook> books = wordBookMapper.selectList(
                        new LambdaQueryWrapper<WordBook>()
                                .in(WordBook::getCode, codes)
                                .orderByAsc(WordBook::getSortOrder));
                if (!books.isEmpty()) {
                    return books.get(0).getCode();
                }
            }
        }
        WordBook active = resolveActiveWordBook(userId);
        return active != null ? active.getCode() : null;
    }

    /** 按词书ID反查 code（本地查表，不跨服务） */
    private String bookCodeOf(Long bookId) {
        if (bookId == null) {
            return null;
        }
        WordBook b = wordBookMapper.selectById(bookId);
        return b != null ? b.getCode() : null;
    }

    /**
     * 记录一次单词作答（新词/复习循环专用，不污染答题统计）。
     *
     * <p>与 reviewWord 的区别：reviewWord 操作已有记录的 id（单词本页复习弹窗），
     * 本方法按 word 幂等写入（词汇练习页提交后调用），首次自动建记录。
     * 答错时 next_review_at 设为当前，立即进入今日复习队列。</p>
     */
    @Override
    public VocabularyVO recordWordAttempt(Long userId, Long questionId, String word, Boolean isCorrect) {
        if (isCorrect == null) {
            throw new RuntimeException("作答结果不能为空");
        }

        // 优先用题目 answer_word 的词条原形，避免题面变形被当成新词
        String candidate = null;
        if (questionId != null) {
            QuestionInfo qi = questionInfoMapper.selectById(questionId);
            if (qi != null && qi.getAnswerWord() != null && !qi.getAnswerWord().isBlank()) {
                candidate = qi.getAnswerWord();
            } else {
                QuestionContent qc = questionContentMapper.selectOne(
                        new LambdaQueryWrapper<QuestionContent>()
                                .eq(QuestionContent::getQuestionId, questionId));
                if (qc != null && qc.getCorrectAnswer() != null) {
                    candidate = VocabularyLearningHelper.normalizeWord(qc.getCorrectAnswer());
                }
            }
        }
        if (candidate == null || candidate.isBlank()) {
            candidate = word;
        }

        String normalized = VocabularyLearningHelper.normalizeWord(candidate);
        if (normalized.isEmpty()) {
            throw new RuntimeException("单词不能为空");
        }
        String lower = normalized.toLowerCase(Locale.ROOT);

        WordDictionary wd = wordDictionaryMapper.selectOne(
                new LambdaQueryWrapper<WordDictionary>().eq(WordDictionary::getWord, lower));
        WordBook book = resolveActiveWordBook(userId);
        String bookCode = book != null ? book.getCode() : null;
        Long bookId = book != null ? book.getId() : null;

        UserVocabulary v = vocabularyMapper.selectOne(
                new LambdaQueryWrapper<UserVocabulary>()
                        .eq(UserVocabulary::getUserId, userId)
                        .eq(UserVocabulary::getWord, lower));

        LocalDateTime now = LocalDateTime.now(clock);
        boolean isNew = false;

        if (v == null) {
            isNew = true;
            v = new UserVocabulary();
            v.setUserId(userId);
            v.setWord(lower);
            v.setTranslation(wd != null ? wd.getTranslation() : "");
            v.setPhonetic(wd != null ? wd.getPhonetic() : null);
            v.setPos(wd != null ? wd.getPos() : null);
            v.setExample(wd != null ? wd.getExample() : null);
            v.setExampleTranslation(wd != null ? wd.getExampleTranslation() : null);
            v.setSource("quiz");
            v.setWordId(wd != null ? wd.getId() : null);
            v.setBookId(bookId);
            v.setFirstLearnedAt(now);
            v.setCorrectCount(0);
            v.setWrongCount(0);
            v.setReviewCount(0);
            v.setMasteryLevel(0);
            v.setIsMastered(0);
            v.setStatus(VocabularyStatus.LEARNING);
            v.setCreatedAt(now);
        }

        if (isCorrect) {
            v.setCorrectCount((v.getCorrectCount() == null ? 0 : v.getCorrectCount()) + 1);
            v.setLastResult("CORRECT");
        } else {
            v.setWrongCount((v.getWrongCount() == null ? 0 : v.getWrongCount()) + 1);
            v.setLastResult("WRONG");
        }
        v.setReviewCount((v.getReviewCount() == null ? 0 : v.getReviewCount()) + 1);
        v.setLastReviewedAt(now);

        if (isCorrect) {
            int newMastery = EbbinghausUtil.nextMasteryOnCorrect(
                    v.getMasteryLevel() == null ? 0 : v.getMasteryLevel());
            v.setMasteryLevel(newMastery);
            v.setNextReviewAt(EbbinghausUtil.nextReviewAt(newMastery, now));
            // 标熟是用户的显式标记，优先于系统判定：状态为 FAMILIAR 时不改写
            if (!VocabularyStatus.FAMILIAR.equals(v.getStatus())) {
                if (EbbinghausUtil.isMastered(newMastery, true)) {
                    v.setIsMastered(1);
                    v.setStatus(VocabularyStatus.MASTERED);
                    v.setMasteredAt(now);
                } else if (!VocabularyStatus.MASTERED.equals(v.getStatus())) {
                    v.setStatus(VocabularyStatus.REVIEWING);
                }
            }
        } else {
            // 答错：掌握度归零 + 立即进复习队列（next_review_at = 现在）
            v.setMasteryLevel(EbbinghausUtil.nextMasteryOnWrong());
            v.setNextReviewAt(now);
            v.setIsMastered(0);
            // 标熟不再复习，答错也不能把它打回学习中
            if (!VocabularyStatus.FAMILIAR.equals(v.getStatus())) {
                v.setStatus(VocabularyStatus.LEARNING);
            }
        }

        if (isNew) {
            vocabularyMapper.insert(v);
        } else {
            vocabularyMapper.updateById(v);
        }

        logWordLearnEvent(userId, v.getWordId(), lower, isNew ? "LEARN" : "REVIEW",
                isCorrect ? "CORRECT" : "WRONG", bookCode);

        log.info("单词作答: userId={}, word={}, correct={}, new={}, nextReviewAt={}",
                userId, lower, isCorrect, isNew, v.getNextReviewAt());
        return toVocabularyVO(v);
    }

    /**
     * 解析前端传来的时间字符串，兼容三种格式。
     *
     * <p>前端用 {@code Date.toISOString()} 发出的是 UTC（如 2026-11-14T14:32:00.000Z），
     * 直接用 {@code LocalDateTime.parse} 会抛异常并被 catch 吞掉，导致筛选静默失效。
     * 这里统一按业务时区（Asia/Shanghai）转成 LocalDateTime。</p>
     *
     * @return 解析失败返回 null（调用方按未传处理）
     */
    private LocalDateTime parseDateTime(String text) {
        if (text == null || text.isBlank()) {
            return null;
        }
        String s = text.trim();
        // 1. 无时区：2026-11-14T14:32:00
        try {
            return LocalDateTime.parse(s);
        } catch (Exception ignore) {
            // 继续尝试下一种
        }
        // 2. 带偏移或 Z：2026-11-14T14:32:00.000Z / +08:00
        try {
            return OffsetDateTime.parse(s)
                    .atZoneSameInstant(clock.getZone())
                    .toLocalDateTime();
        } catch (Exception ignore) {
            // 继续尝试下一种
        }
        // 3. 纯 Instant 字符串
        try {
            return Instant.parse(s).atZone(clock.getZone()).toLocalDateTime();
        } catch (Exception ignore) {
            // 落到下面统一告警
        }
        log.warn("无法解析时间参数: {}", text);
        return null;
    }

    @Override
    public VocabularyVO ignoreWord(Long id, Long userId) {
        // 「忽略」与「标熟」已合并（迁移 V1.0.54）：用户唯一可操作的排除动作是标熟。
        // 本方法保留仅为兼容旧调用方，语义等价于「标记标熟」。
        return toVocabularyVO(learnedVocabularyService.markFamiliar(id, userId, true));
    }

    // ============= 单词本 =============

    @Override
    public VocabularyVO addVocabulary(Long userId, String word, String translation, String source) {
        String normalized = VocabularyLearningHelper.normalizeWord(word);
        if (normalized.isEmpty()) {
            throw new RuntimeException("单词不能为空");
        }
        String lower = normalized.toLowerCase(Locale.ROOT);

        // 幂等：已存在同一单词时直接返回，不重置其复习计划
        UserVocabulary existing = vocabularyMapper.selectOne(new LambdaQueryWrapper<UserVocabulary>()
                .eq(UserVocabulary::getUserId, userId)
                .eq(UserVocabulary::getWord, lower));
        if (existing != null) {
            return toVocabularyVO(existing);
        }

        LocalDateTime now = LocalDateTime.now(clock);
        WordDictionary wd = wordDictionaryMapper.selectOne(
                new LambdaQueryWrapper<WordDictionary>().eq(WordDictionary::getWord, lower));
        WordBook book = resolveActiveWordBook(userId);

        UserVocabulary v = VocabularyLearningHelper.buildInitialVocabulary(
                userId, lower, translation, source, now);

        // 补全 V1.0.50 新增字段（状态/词库ID/词书归属/首学时间/答对答错计数）
        v.setWordId(wd != null ? wd.getId() : null);
        v.setBookId(book != null ? book.getId() : null);
        v.setFirstLearnedAt(now);
        v.setCorrectCount(0);
        v.setWrongCount(0);
        v.setStatus(VocabularyStatus.LEARNING);
        v.setIsMastered(0);
        // 释义/音标兜底：调用方未传时回落到词库，避免单词本里出现「暂无释义」
        if ((translation == null || translation.isBlank()) && wd != null) {
            v.setTranslation(wd.getTranslation());
            v.setPhonetic(wd.getPhonetic());
            v.setPos(wd.getPos());
            v.setExample(wd.getExample());
            v.setExampleTranslation(wd.getExampleTranslation());
        }

        vocabularyMapper.insert(v);

        // 记录 LEARN 事件，带上当前词书，历史页才能按词书筛选
        logWordLearnEvent(userId, v.getWordId(), lower, "LEARN", null,
                book != null ? book.getCode() : null);

        log.info("添加单词: userId={}, word={}, source={}", userId, lower, v.getSource());
        return toVocabularyVO(v);
    }

    @Override
    public List<VocabularyVO> getVocabulary(Long userId) {
        List<UserVocabulary> list = vocabularyMapper.selectList(
                new LambdaQueryWrapper<UserVocabulary>()
                        .eq(UserVocabulary::getUserId, userId)
                        .orderByAsc(UserVocabulary::getIsMastered)
                        .orderByDesc(UserVocabulary::getCreatedAt));
        return list.stream().map(this::toVocabularyVO).collect(Collectors.toList());
    }

    @Override
    public List<VocabularyVO> getVocabulary(Long userId, Integer page, Integer size, String bookCode, String status) {
        int offset = (page == null || page < 1 ? 0 : page - 1) * (size == null ? 20 : size);
        int limit = size == null ? 20 : size;

        LambdaQueryWrapper<UserVocabulary> wrapper = new LambdaQueryWrapper<UserVocabulary>()
                .eq(UserVocabulary::getUserId, userId);

        // 按词书筛选：只筛 user_vocabulary.book_id 对应的词（需要反查 word_book_item）
        if (bookCode != null && !bookCode.isBlank()) {
            List<String> bookWords = wordBookItemMapper.selectList(
                            new LambdaQueryWrapper<WordBookItem>().eq(WordBookItem::getBookCode, bookCode))
                    .stream().map(WordBookItem::getWord).collect(Collectors.toList());
            if (bookWords.isEmpty()) {
                return Collections.emptyList();
            }
            wrapper.in(UserVocabulary::getWord, bookWords);
        }
        if (status != null && !status.isBlank()) {
            wrapper.eq(UserVocabulary::getStatus, status);
        }

        wrapper.orderByAsc(UserVocabulary::getIsMastered)
                .orderByDesc(UserVocabulary::getCreatedAt)
                .last("LIMIT " + offset + "," + limit);
        return vocabularyMapper.selectList(wrapper).stream().map(this::toVocabularyVO).collect(Collectors.toList());
    }

    @Override
    public long getVocabularyCount(Long userId, String bookCode, String status) {
        LambdaQueryWrapper<UserVocabulary> wrapper = new LambdaQueryWrapper<UserVocabulary>()
                .eq(UserVocabulary::getUserId, userId);
        if (bookCode != null && !bookCode.isBlank()) {
            List<String> bookWords = wordBookItemMapper.selectList(
                            new LambdaQueryWrapper<WordBookItem>().eq(WordBookItem::getBookCode, bookCode))
                    .stream().map(WordBookItem::getWord).collect(Collectors.toList());
            if (bookWords.isEmpty()) {
                return 0;
            }
            wrapper.in(UserVocabulary::getWord, bookWords);
        }
        if (status != null && !status.isBlank()) {
            wrapper.eq(UserVocabulary::getStatus, status);
        }
        return vocabularyMapper.selectCount(wrapper);
    }

    @Override
    public void removeVocabulary(Long id, Long userId) {
        vocabularyMapper.delete(
                new LambdaQueryWrapper<UserVocabulary>()
                        .eq(UserVocabulary::getId, id)
                        .eq(UserVocabulary::getUserId, userId));
    }

    @Override
    public VocabularyVO toggleMastered(Long id, Long userId) {
        UserVocabulary v = vocabularyMapper.selectOne(
                new LambdaQueryWrapper<UserVocabulary>()
                        .eq(UserVocabulary::getId, id)
                        .eq(UserVocabulary::getUserId, userId));
        if (v == null) throw new RuntimeException("单词不存在");
        v.setIsMastered(v.getIsMastered() == 1 ? 0 : 1);
        vocabularyMapper.updateById(v);
        return toVocabularyVO(v);
    }

    private VocabularyVO toVocabularyVO(UserVocabulary v) {
        return VocabularyVO.builder()
                .id(v.getId())
                .userId(v.getUserId())
                .word(v.getWord())
                .translation(v.getTranslation())
                .phonetic(v.getPhonetic())
                .pos(v.getPos())
                .example(v.getExample())
                .exampleTranslation(v.getExampleTranslation())
                .collocation(v.getCollocation())
                .source(v.getSource())
                .status(v.getStatus())
                .wordId(v.getWordId())
                .bookId(v.getBookId())
                .firstLearnedAt(v.getFirstLearnedAt())
                .correctCount(v.getCorrectCount())
                .wrongCount(v.getWrongCount())
                .lastResult(v.getLastResult())
                .reviewCount(v.getReviewCount())
                .masteryLevel(v.getMasteryLevel())
                .lastReviewedAt(v.getLastReviewedAt())
                .nextReviewAt(v.getNextReviewAt())
                .isMastered(v.getIsMastered())
                .createdAt(v.getCreatedAt())
                .updatedAt(v.getUpdatedAt())
                .build();
    }

    /**
     * 智能添加单词：调用 ai-service 的 /ai/word-detail 接口自动补全音标/词性/释义/例句/搭配
     * 然后写入 user_vocabulary 表，并初始化艾宾浩斯复习计划（next_review_at = 明天）
     */
    @Override
    public VocabularyVO addVocabularySmart(Long userId, String word, String source) {
        String w = word == null ? "" : word.trim();
        if (w.isEmpty()) throw new RuntimeException("单词不能为空");
        String lower = w.toLowerCase(Locale.ROOT);

        // 幂等去重：已存在同词直接返回，避免重复插入
        UserVocabulary existing = vocabularyMapper.selectOne(
                new LambdaQueryWrapper<UserVocabulary>()
                        .eq(UserVocabulary::getUserId, userId)
                        .eq(UserVocabulary::getWord, lower));
        if (existing != null) {
            return toVocabularyVO(existing);
        }

        // 调用 ai-service 获取单词详情
        WordDetailVO detail = fetchWordDetailFromAi(w);

        // 关联 word_dictionary
        WordDictionary wd = wordDictionaryMapper.selectOne(
                new LambdaQueryWrapper<WordDictionary>().eq(WordDictionary::getWord, lower));
        // 当前词书归属
        WordBook book = resolveActiveWordBook(userId);

        UserVocabulary v = new UserVocabulary();
        v.setUserId(userId);
        v.setWord(lower);
        v.setIsMastered(0);
        v.setSource(source == null || source.isBlank() ? "manual" : source);
        v.setStatus(VocabularyStatus.LEARNING);
        v.setWordId(wd != null ? wd.getId() : null);
        v.setBookId(book != null ? book.getId() : null);
        v.setFirstLearnedAt(LocalDateTime.now(clock));
        v.setCorrectCount(0);
        v.setWrongCount(0);
        v.setReviewCount(0);
        v.setMasteryLevel(0);
        v.setNextReviewAt(EbbinghausUtil.nextReviewAt(0, LocalDateTime.now(clock)));
        v.setCreatedAt(LocalDateTime.now(clock));

        if (detail != null) {
            v.setPhonetic(detail.getPhonetic());
            v.setPos(detail.getPos());
            v.setTranslation(detail.getTranslation());
            v.setExample(detail.getExample());
            v.setExampleTranslation(detail.getExampleTranslation());
            v.setCollocation(detail.getCollocation());
        } else if (wd != null) {
            // AI 不可用：回落到 word_dictionary
            v.setPhonetic(wd.getPhonetic());
            v.setPos(wd.getPos());
            v.setTranslation(wd.getTranslation());
            v.setExample(wd.getExample());
            v.setExampleTranslation(wd.getExampleTranslation());
        } else {
            // 都拿不到：translation 留空
            v.setTranslation("");
        }

        vocabularyMapper.insert(v);

        // 记录 LEARN 事件
        logWordLearnEvent(userId, v.getWordId(), lower, "LEARN", null,
                book != null ? book.getCode() : null);

        log.info("智能添加单词: userId={}, word={}, source={}", userId, lower, v.getSource());
        return toVocabularyVO(v);
    }

    /**
     * 通过 RestTemplate 调用 ai-service 的 /ai/word-detail 接口
     */
    @SuppressWarnings("unchecked")
    private WordDetailVO fetchWordDetailFromAi(String word) {
        try {
            String url = aiServiceUrl + "/ai/word-detail?word=" + java.net.URLEncoder.encode(word, java.nio.charset.StandardCharsets.UTF_8);
            ResponseEntity<Result> resp = restTemplate.getForEntity(url, Result.class);
            if (resp.getBody() != null && resp.getBody().getCode() == 200 && resp.getBody().getData() != null) {
                Map<String, Object> map = (Map<String, Object>) resp.getBody().getData();
                WordDetailVO vo = new WordDetailVO();
                vo.setWord((String) map.get("word"));
                vo.setPhonetic((String) map.get("phonetic"));
                vo.setPos((String) map.get("pos"));
                vo.setTranslation((String) map.get("translation"));
                vo.setExample((String) map.get("example"));
                vo.setExampleTranslation((String) map.get("exampleTranslation"));
                vo.setCollocation((String) map.get("collocation"));
                return vo;
            }
        } catch (Exception e) {
            log.warn("调用 ai-service 生成单词详情失败，word={}: {}", word, e.getMessage());
        }
        return null;
    }

    /**
     * 获取今日待复习单词列表
     * 规则：next_review_at <= 现在 且 isMastered = 0
     */
    @Override
    public List<VocabularyVO> getReviewList(Long userId) {
        return getReviewList(userId, 50);
    }

    @Override
    public List<VocabularyVO> getReviewList(Long userId, Integer limit) {
        int safeLimit = limit == null ? 50 : Math.max(1, Math.min(200, limit));
        List<UserVocabulary> list = vocabularyMapper.selectList(
                new LambdaQueryWrapper<UserVocabulary>()
                        .eq(UserVocabulary::getUserId, userId)
                        .eq(UserVocabulary::getIsMastered, 0)
                        .ne(UserVocabulary::getStatus, VocabularyStatus.FAMILIAR)
                        .le(UserVocabulary::getNextReviewAt, LocalDateTime.now())
                        .orderByAsc(UserVocabulary::getNextReviewAt)
                        .last("LIMIT " + safeLimit));
        return list.stream().map(this::toVocabularyVO).collect(Collectors.toList());
    }

    /**
     * 提交单词复习结果：
     *  - 答对：掌握度+1，下次复习时间按新等级延后；若达到最高掌握度且再次答对则标记为已掌握
     *  - 答错：掌握度重置为0，下次复习时间为明天
     */
    @Override
    public VocabularyVO reviewWord(Long id, Long userId, Boolean isCorrect) {
        if (isCorrect == null) throw new RuntimeException("复习结果不能为空");
        UserVocabulary v = vocabularyMapper.selectOne(
                new LambdaQueryWrapper<UserVocabulary>()
                        .eq(UserVocabulary::getId, id)
                        .eq(UserVocabulary::getUserId, userId));
        if (v == null) throw new RuntimeException("单词不存在");

        int currentMastery = v.getMasteryLevel() == null ? 0 : v.getMasteryLevel();
        int newMastery;
        if (isCorrect) {
            newMastery = EbbinghausUtil.nextMasteryOnCorrect(currentMastery);
        } else {
            newMastery = EbbinghausUtil.nextMasteryOnWrong();
        }

        LocalDateTime now = LocalDateTime.now(clock);
        v.setMasteryLevel(newMastery);
        v.setReviewCount((v.getReviewCount() == null ? 0 : v.getReviewCount()) + 1);
        v.setLastReviewedAt(now);
        v.setNextReviewAt(EbbinghausUtil.nextReviewAt(newMastery, now));

        // 更新答对/答错计数与最近结果
        if (isCorrect) {
            v.setCorrectCount((v.getCorrectCount() == null ? 0 : v.getCorrectCount()) + 1);
            v.setLastResult("CORRECT");
        } else {
            v.setWrongCount((v.getWrongCount() == null ? 0 : v.getWrongCount()) + 1);
            v.setLastResult("WRONG");
        }

        // 达到最高掌握度且本次答对 → 标记为已掌握
        // 标熟是用户的显式标记，优先于系统判定：状态为 FAMILIAR 时不改写
        boolean mastered = EbbinghausUtil.isMastered(newMastery, isCorrect);
        if (VocabularyStatus.FAMILIAR.equals(v.getStatus())) {
            // 保持标熟状态不动，仅更新计数与下次复习时间
        } else if (mastered) {
            v.setIsMastered(1);
            v.setStatus(VocabularyStatus.MASTERED);
            v.setMasteredAt(now);
        } else {
            v.setIsMastered(0);
            v.setStatus(VocabularyStatus.REVIEWING);
        }

        vocabularyMapper.updateById(v);

        // 记录 REVIEW/MASTER 事件（带作答结果，历史页才能显示答对/答错）
        // 标熟词本不该出现在复习队列里，走到这里属异常兜底，事件记 REVIEW 不记 MASTER
        String eventType = VocabularyStatus.FAMILIAR.equals(v.getStatus())
                ? "REVIEW" : (mastered ? "MASTER" : "REVIEW");
        logWordLearnEvent(userId, v.getWordId(), v.getWord(),
                eventType, isCorrect ? "CORRECT" : "WRONG",
                bookCodeOf(v.getBookId()));

        log.info("单词复习: id={}, userId={}, isCorrect={}, newMastery={}, nextReviewAt={}",
                id, userId, isCorrect, newMastery, v.getNextReviewAt());
        return toVocabularyVO(v);
    }

    // ============= 学习历史 =============

    @Override
    public List<ExerciseHistoryVO> getExerciseHistory(Long userId, Integer page, Integer size, Integer moduleType, Integer isCorrect, String startTime) {
        return getExerciseHistory(userId, page, size, moduleType, isCorrect, startTime, null);
    }

    @Override
    public List<ExerciseHistoryVO> getExerciseHistory(Long userId, Integer page, Integer size, Integer moduleType, Integer isCorrect, String startTime, String endTime) {
        int offset = (page - 1) * size;
        LambdaQueryWrapper<UserExerciseLog> wrapper = new LambdaQueryWrapper<UserExerciseLog>()
                .eq(UserExerciseLog::getUserId, userId);

        if (moduleType != null && moduleType != 0) {
            wrapper.eq(UserExerciseLog::getModuleType, moduleType);
        }
        if (isCorrect != null && isCorrect >= 0) {
            wrapper.eq(UserExerciseLog::getIsCorrect, isCorrect);
        }
        // 时间筛选统一走 parseDateTime：兼容前端 toISOString 的 UTC（...Z）格式
        LocalDateTime start = parseDateTime(startTime);
        if (start != null) {
            wrapper.ge(UserExerciseLog::getCreatedAt, start);
        }
        LocalDateTime end = parseDateTime(endTime);
        if (end != null) {
            wrapper.lt(UserExerciseLog::getCreatedAt, end);
        }

        List<UserExerciseLog> logs = exerciseLogMapper.selectList(
                wrapper.orderByDesc(UserExerciseLog::getCreatedAt)
                        .last("LIMIT " + offset + "," + size));

        List<Long> questionIds = logs.stream()
                .map(UserExerciseLog::getQuestionId)
                .distinct()
                .collect(Collectors.toList());

        Map<Long, QuestionInfo> infoMap = Collections.emptyMap();
        Map<Long, QuestionContent> contentMap = Collections.emptyMap();
        if (!questionIds.isEmpty()) {
            infoMap = questionInfoMapper.selectBatchIds(questionIds).stream()
                    .collect(Collectors.toMap(QuestionInfo::getId, qi -> qi));
            contentMap = questionContentMapper.selectList(
                    new LambdaQueryWrapper<QuestionContent>()
                            .in(QuestionContent::getQuestionId, questionIds))
                    .stream()
                    .collect(Collectors.toMap(QuestionContent::getQuestionId, qc -> qc, (a, b) -> a));
        }

        Map<Long, QuestionInfo> finalInfoMap = infoMap;
        Map<Long, QuestionContent> finalContentMap = contentMap;

        return logs.stream().map(log -> {
            QuestionInfo info = finalInfoMap.get(log.getQuestionId());
            QuestionContent content = finalContentMap.get(log.getQuestionId());

            // 默认取数据库原始值
            String stem = content != null ? content.getStem() : null;
            String correctAnswer = content != null ? content.getCorrectAnswer() : null;
            String userAnswer = log.getUserAnswer();

            // 语法题（moduleType=2）特殊处理：还原完整句子，correctAnswer 和 userAnswer 转为纯文本
            // 数据库中语法题存的是选择题格式（stem 带 ___ 占位符，correctAnswer 为 "A. xxx"），
            // 历史记录需要展示为词语排序题形式（完整句子）
            if (log.getModuleType() != null && log.getModuleType() == 2 && content != null) {
                String[] display = buildGrammarDisplay(content, userAnswer);
                stem = display[0];
                correctAnswer = display[1];
                userAnswer = display[2];
            }

            return ExerciseHistoryVO.builder()
                    .logId(log.getId())
                    .questionId(log.getQuestionId())
                    .stem(stem)
                    .userAnswer(userAnswer)
                    .correctAnswer(correctAnswer)
                    .isCorrect(log.getIsCorrect())
                    .durationSeconds(log.getDurationSeconds())
                    .moduleType(log.getModuleType())
                    .questionType(info != null ? info.getQuestionType() : null)
                    .analysis(content != null ? content.getAnalysis() : null)
                    .difficultyLevel(info != null ? info.getDifficultyLevel() : null)
                    .createdAt(log.getCreatedAt())
                    .build();
        }).collect(Collectors.toList());
    }

    /**
     * 按答题记录ID反查单次提交的完整上下文。
     *
     * <p>存在的意义：AI 对话流只保存 {@code recordId} 而不保存业务模型，
     * 展开卡片时用这里把题干、标准答案、解析、用户作答还原出来。
     * 与 {@link #getExerciseHistory} 的区别是只查一条，不用批量 join。</p>
     *
     * <p>注意：{@code user_exercise_log} 只落 userAnswer / isCorrect，
     * 判分当时的启发式提示与建议不落库，因此这里拿不到「AI 当时的理由」，
     * 只能给到题库自带的 analysis（题目解析）。</p>
     *
     * @return 记录不存在或不属于该用户时返回 null
     */
    @Override
    public ExerciseHistoryVO getExerciseLogDetail(Long logId, Long userId) {
        if (logId == null || userId == null) {
            return null;
        }
        UserExerciseLog logEntry = exerciseLogMapper.selectById(logId);
        // 越权即视为不存在，不泄漏「这条记录存在但不属于你」
        if (logEntry == null || !userId.equals(logEntry.getUserId())) {
            return null;
        }

        QuestionInfo info = questionInfoMapper.selectById(logEntry.getQuestionId());
        QuestionContent content = questionContentMapper.selectOne(
                new LambdaQueryWrapper<QuestionContent>()
                        .eq(QuestionContent::getQuestionId, logEntry.getQuestionId()));

        String stem = content != null ? content.getStem() : null;
        String correctAnswer = content != null ? content.getCorrectAnswer() : null;
        String userAnswer = logEntry.getUserAnswer();

        // 语法题与历史列表保持同一套展示口径，避免同一道题在两处显示不一致
        if (logEntry.getModuleType() != null && logEntry.getModuleType() == 2 && content != null) {
            String[] display = buildGrammarDisplay(content, userAnswer);
            stem = display[0];
            correctAnswer = display[1];
            userAnswer = display[2];
        }

        return ExerciseHistoryVO.builder()
                .logId(logEntry.getId())
                .questionId(logEntry.getQuestionId())
                .stem(stem)
                .userAnswer(userAnswer)
                .correctAnswer(correctAnswer)
                .isCorrect(logEntry.getIsCorrect())
                .durationSeconds(logEntry.getDurationSeconds())
                .moduleType(logEntry.getModuleType())
                .questionType(info != null ? info.getQuestionType() : null)
                .analysis(content != null ? content.getAnalysis() : null)
                .difficultyLevel(info != null ? info.getDifficultyLevel() : null)
                .createdAt(logEntry.getCreatedAt())
                .build();
    }

    @Override
    public long getExerciseHistoryCount(Long userId, Integer moduleType, Integer isCorrect, String startTime) {
        return getExerciseHistoryCount(userId, moduleType, isCorrect, startTime, null);
    }

    @Override
    public long getExerciseHistoryCount(Long userId, Integer moduleType, Integer isCorrect, String startTime, String endTime) {
        LambdaQueryWrapper<UserExerciseLog> wrapper = new LambdaQueryWrapper<UserExerciseLog>()
                .eq(UserExerciseLog::getUserId, userId);

        if (moduleType != null && moduleType != 0) {
            wrapper.eq(UserExerciseLog::getModuleType, moduleType);
        }
        if (isCorrect != null && isCorrect >= 0) {
            wrapper.eq(UserExerciseLog::getIsCorrect, isCorrect);
        }
        LocalDateTime start = parseDateTime(startTime);
        if (start != null) {
            wrapper.ge(UserExerciseLog::getCreatedAt, start);
        }
        LocalDateTime end = parseDateTime(endTime);
        if (end != null) {
            wrapper.lt(UserExerciseLog::getCreatedAt, end);
        }

        return exerciseLogMapper.selectCount(wrapper);
    }

    @Override
    public List<UserWordLearnLogVO> getWordLearnHistory(Long userId, Integer page, Integer size, String eventType, String bookCode, String startTime, String endTime) {
        int offset = (page == null || page < 1 ? 0 : page - 1) * (size == null ? 20 : size);
        int limit = size == null ? 20 : size;

        LambdaQueryWrapper<UserWordLearnLog> wrapper = new LambdaQueryWrapper<UserWordLearnLog>()
                .eq(UserWordLearnLog::getUserId, userId);
        if (eventType != null && !eventType.isBlank()) {
            wrapper.eq(UserWordLearnLog::getEventType, eventType);
        }
        if (bookCode != null && !bookCode.isBlank()) {
            wrapper.eq(UserWordLearnLog::getBookCode, bookCode);
        }
        LocalDateTime start = parseDateTime(startTime);
        if (start != null) {
            wrapper.ge(UserWordLearnLog::getCreatedAt, start);
        }
        LocalDateTime end = parseDateTime(endTime);
        if (end != null) {
            wrapper.lt(UserWordLearnLog::getCreatedAt, end);
        }

        List<UserWordLearnLog> list = userWordLearnLogMapper.selectList(
                wrapper.orderByDesc(UserWordLearnLog::getCreatedAt)
                        .last("LIMIT " + offset + "," + limit));
        return list.stream().map(l -> UserWordLearnLogVO.builder()
                .id(l.getId())
                .userId(l.getUserId())
                .wordId(l.getWordId())
                .word(l.getWord())
                .eventType(l.getEventType())
                .result(l.getResult())
                .bookCode(l.getBookCode())
                .createdAt(l.getCreatedAt())
                .build()).collect(Collectors.toList());
    }

    @Override
    public long getWordLearnHistoryCount(Long userId, String eventType, String bookCode, String startTime, String endTime) {
        LambdaQueryWrapper<UserWordLearnLog> wrapper = new LambdaQueryWrapper<UserWordLearnLog>()
                .eq(UserWordLearnLog::getUserId, userId);
        if (eventType != null && !eventType.isBlank()) {
            wrapper.eq(UserWordLearnLog::getEventType, eventType);
        }
        if (bookCode != null && !bookCode.isBlank()) {
            wrapper.eq(UserWordLearnLog::getBookCode, bookCode);
        }
        LocalDateTime start = parseDateTime(startTime);
        if (start != null) {
            wrapper.ge(UserWordLearnLog::getCreatedAt, start);
        }
        LocalDateTime end = parseDateTime(endTime);
        if (end != null) {
            wrapper.lt(UserWordLearnLog::getCreatedAt, end);
        }
        return userWordLearnLogMapper.selectCount(wrapper);
    }

    // ========== 写作历史 ==========

    @Override
    public List<WritingHistoryVO> getWritingHistory(Long userId, Integer page, Integer size, String startTime, String endTime) {
        int offset = (page == null || page < 1 ? 0 : page - 1) * (size == null ? 20 : size);
        int limit = size == null ? 20 : size;

        LambdaQueryWrapper<WritingEssay> wrapper = new LambdaQueryWrapper<WritingEssay>()
                .eq(WritingEssay::getUserId, userId);
        LocalDateTime start = parseDateTime(startTime);
        LocalDateTime end = parseDateTime(endTime);
        if (start != null) {
            wrapper.ge(WritingEssay::getCreatedAt, start);
        }
        if (end != null) {
            wrapper.lt(WritingEssay::getCreatedAt, end);
        }

        List<WritingEssay> list = writingEssayMapper.selectList(
                wrapper.orderByDesc(WritingEssay::getCreatedAt)
                        .last("LIMIT " + offset + "," + limit));

        return list.stream().map(e -> WritingHistoryVO.builder()
                .id(e.getId())
                .userId(e.getUserId())
                .topicKey(e.getTopicKey())
                .topicTitle(e.getTopicTitle())
                .wordCount(e.getWordCount())
                .durationSeconds(e.getDurationSeconds())
                .aiScored(e.getAiScored())
                .rawScore(e.getRawScore())
                .weightedScore(e.getWeightedScore())
                .createdAt(e.getCreatedAt())
                .build()).collect(Collectors.toList());
    }

    @Override
    public long getWritingHistoryCount(Long userId, String startTime, String endTime) {
        LambdaQueryWrapper<WritingEssay> wrapper = new LambdaQueryWrapper<WritingEssay>()
                .eq(WritingEssay::getUserId, userId);
        LocalDateTime start = parseDateTime(startTime);
        LocalDateTime end = parseDateTime(endTime);
        if (start != null) {
            wrapper.ge(WritingEssay::getCreatedAt, start);
        }
        if (end != null) {
            wrapper.lt(WritingEssay::getCreatedAt, end);
        }
        return writingEssayMapper.selectCount(wrapper);
    }

    // ========== 统一时间线 ==========

    @Override
    public List<TimelineItemVO> getTimeline(Long userId, Integer page, Integer size, String startTime, String endTime) {
        int offset = (page == null || page < 1 ? 0 : page - 1) * (size == null ? 20 : size);
        int limit = size == null ? 20 : size;

        LocalDateTime start = parseDateTime(startTime);
        LocalDateTime end = parseDateTime(endTime);

        List<TimelineItemVO> list = timelineMapper.selectTimeline(userId,
                start != null ? start.toString() : null,
                end != null ? end.toString() : null,
                offset, limit);

        // 答题行补题干：UNION 里不带正文，避免三表 join 膨胀，这里按 questionId 批量补一次
        List<Long> questionIds = list.stream()
                .filter(i -> "ANSWER".equals(i.getSource()))
                .map(TimelineItemVO::getQuestionId)
                .filter(Objects::nonNull)
                .distinct()
                .collect(Collectors.toList());
        if (!questionIds.isEmpty()) {
            Map<Long, QuestionContent> contentMap = questionContentMapper.selectList(
                            new LambdaQueryWrapper<QuestionContent>()
                                    .in(QuestionContent::getQuestionId, questionIds))
                    .stream()
                    .collect(Collectors.toMap(QuestionContent::getQuestionId, c -> c, (a, b) -> a));
            for (TimelineItemVO item : list) {
                if ("ANSWER".equals(item.getSource()) && item.getQuestionId() != null) {
                    QuestionContent content = contentMap.get(item.getQuestionId());
                    if (content != null) {
                        item.setStem(content.getStem());
                    }
                }
            }
        }
        return list;
    }

    @Override
    public long getTimelineCount(Long userId, String startTime, String endTime) {
        LocalDateTime start = parseDateTime(startTime);
        LocalDateTime end = parseDateTime(endTime);
        return timelineMapper.countTimeline(userId,
                start != null ? start.toString() : null,
                end != null ? end.toString() : null);
    }

    /**
     * 对语法题（moduleType=2）做展示转换：
     * 数据库中语法题以选择题格式存储（stem 带 ___ 占位符，correctAnswer 为 "A. xxx"），
     * 此方法将其还原为词语排序题的展示形式：
     * 1. 从 correctAnswer 中去掉选项前缀（如 "A. "），提取纯文本
     * 2. 用纯文本替换 stem 中的占位符（___、[BLANK]、...），生成完整句子
     * 3. 如果 userAnswer 是选项字母（如 "C"），从 options 中提取对应选项文本
     *
     * @param content    题目内容
     * @param userAnswer 用户原始答案
     * @return String[3]，[0]=完整句子 stem，[1]=纯文本 correctAnswer，[2]=转换后的 userAnswer
     */
    private String[] buildGrammarDisplay(QuestionContent content, String userAnswer) {
        String stem = content.getStem();
        String correctAnswer = content.getCorrectAnswer();

        if (stem == null || correctAnswer == null) {
            return new String[]{stem, correctAnswer, userAnswer};
        }

        // 从 correctAnswer 中去掉选项前缀（如 "A. "、"B、 "、"C) "）
        String correctText = stripOptionPrefix(correctAnswer);

        // 如果 correctText 仍然是单个字母（A-D），说明数据库中只存储了选项字母，
        // 需要从 options 中提取对应选项的文本
        if (correctText != null && correctText.length() == 1 
                && Character.toUpperCase(correctText.charAt(0)) >= 'A' 
                && Character.toUpperCase(correctText.charAt(0)) <= 'D') {
            String optionText = getOptionTextByKey(content.getOptions(), correctText.toUpperCase());
            if (optionText != null && !optionText.isEmpty()) {
                correctText = optionText;
            }
        }

        // 用选项文本替换 stem 中的占位符（___两个以上下划线、[BLANK]、...三个以上点）
        String replaced = stem.replaceAll("_{2,}|\\[BLANK\\]|\\.{3,}", correctText);

        // 清理内联选项字母：无论是否替换了占位符，都需要移除 stem 中直接包含的大写选项字母 A-D
        // 避免选项字母残留（如 "Only C C solve" → "Only can we solve"）
        String cleaned = replaced.replaceAll("\\b[A-D]\\b", correctText);

        String fullStem = cleaned.replaceAll("\\s+", " ")
                .trim();

        // 处理 userAnswer：如果是字母（A/B/C/D）或 "A. xxx" 格式，转为纯文本
        // 优先从 options 中提取对应选项的原文单词，避免用选项字母代替原文
        String displayUserAnswer = userAnswer;
        if (userAnswer != null && !userAnswer.isEmpty()) {
            String userKey = extractAnswerKey(userAnswer);
            // 如果提取出的 key 是单字母 A-D，说明是选择题格式，从 options 中提取对应选项文本
            if (userKey.length() == 1 && userKey.charAt(0) >= 'A' && userKey.charAt(0) <= 'D') {
                String optionText = getOptionTextByKey(content.getOptions(), userKey);
                if (optionText != null) {
                    displayUserAnswer = optionText;
                } else {
                    // options 解析失败兜底：保留用户原始答案（字母），不做"选项X"的伪装替换
                    displayUserAnswer = userAnswer;
                }
            }
        }

        return new String[]{fullStem, correctText, displayUserAnswer};
    }

    /**
     * 去掉答案文本的选项前缀（如 "A. "、"B、 "、"C) "、"D " → 纯文本）
     * 如果不以选项字母开头，说明已经是纯文本，不做处理
     */
    private String stripOptionPrefix(String answer) {
        if (answer == null || answer.isEmpty()) {
            return answer;
        }
        char first = Character.toUpperCase(answer.charAt(0));
        if (first >= 'A' && first <= 'D') {
            String removed = answer.replaceFirst("^[A-Da-d][.、)\\s]+\\s*", "").trim();
            if (!removed.isEmpty()) {
                return removed;
            }
        }
        return answer;
    }

    /**
     * 从 options JSON 字符串中，按选项字母（A/B/C/D）提取对应选项的纯文本
     * options 格式示例：["A. established", "B. establish", "C. establishes", "D. establishing"]
     * 也兼容无前缀格式：["established", "establish", "establishes", "establishing"]
     *
     * @param optionsJson options JSON 字符串
     * @param key         选项字母（A/B/C/D）
     * @return 选项纯文本，解析失败返回 null
     */
    private String getOptionTextByKey(String optionsJson, String key) {
        if (optionsJson == null || optionsJson.isEmpty() || key == null || key.isEmpty()) {
            return null;
        }
        try {
            // 解析 options JSON 数组
            List<String> options = new com.fasterxml.jackson.databind.ObjectMapper()
                    .readValue(optionsJson, new com.fasterxml.jackson.core.type.TypeReference<List<String>>() {});
            int idx = key.toUpperCase().charAt(0) - 'A';
            if (idx >= 0 && idx < options.size()) {
                return stripOptionPrefix(options.get(idx));
            }
        } catch (Exception e) {
            // JSON 解析失败，尝试按换行符分割
            String[] lines = optionsJson.split("\\n|\\\\n");
            int idx = key.toUpperCase().charAt(0) - 'A';
            if (idx >= 0 && idx < lines.length) {
                return stripOptionPrefix(lines[idx].replaceFirst("^[A-Da-d][.、)\\s]+\\s*", "").trim());
            }
        }
        return null;
    }

    // ============= 错题驱动同类题生成 =============

    /**
     * 获取用户薄弱知识点列表
     * 查询用户所有未解决错题，统计每个知识点出现次数，按次数降序返回前10个
     */
    @Override
    public List<WeakKnowledgePoint> getWeakKnowledgePoints(Long userId) {
        // 1. 查询用户所有未解决错题（isResolved=0）
        List<UserErrorBook> errors = errorBookMapper.selectList(
                new LambdaQueryWrapper<UserErrorBook>()
                        .eq(UserErrorBook::getUserId, userId)
                        .eq(UserErrorBook::getIsResolved, 0));
        if (errors.isEmpty()) {
            return Collections.emptyList();
        }

        // 2. 提取所有错题ID
        List<Long> questionIds = errors.stream()
                .map(UserErrorBook::getQuestionId)
                .distinct()
                .collect(Collectors.toList());

        // 3. 查询题目-知识点映射关系（多对多）
        List<KnowledgeMapping> mappings = knowledgeMappingMapper.selectList(
                new LambdaQueryWrapper<KnowledgeMapping>()
                        .in(KnowledgeMapping::getQuestionId, questionIds));
        if (mappings.isEmpty()) {
            return Collections.emptyList();
        }

        // 4. 统计每个知识点的错题出现次数
        Map<Long, Integer> countMap = new HashMap<>();
        for (KnowledgeMapping mapping : mappings) {
            countMap.merge(mapping.getKnowledgePointId(), 1, Integer::sum);
        }

        // 5. 批量查询知识点名称
        List<Long> kpIds = new ArrayList<>(countMap.keySet());
        Map<Long, String> nameMap = new HashMap<>();
        if (!kpIds.isEmpty()) {
            List<SysKnowledgePoint> kps = knowledgePointMapper.selectBatchIds(kpIds);
            for (SysKnowledgePoint kp : kps) {
                nameMap.put(kp.getId(), kp.getName());
            }
        }

        // 6. 按错误次数降序排序，取前10个
        Map<Long, String> finalNameMap = nameMap;
        return countMap.entrySet().stream()
                .sorted(Map.Entry.<Long, Integer>comparingByValue().reversed())
                .limit(10)
                .map(entry -> WeakKnowledgePoint.builder()
                        .knowledgePointId(entry.getKey())
                        .knowledgePointName(finalNameMap.getOrDefault(entry.getKey(), "未知知识点"))
                        .errorCount(entry.getValue())
                        .build())
                .collect(Collectors.toList());
    }

    /**
     * 根据错题生成同类强化练习题
     * 优先从正式题库中取同知识点、同难度、同题型的题目，
     * 不足部分通过 AI 生成并直接入库（无需审核，标记为PENDING）
     */
    @Override
    public List<QuestionVO> generateSimilarQuestions(Long userId, Long questionId, int count) {
        if (count <= 0 || count > 20) {
            count = 5;
        }

        // 1. 获取原题信息
        QuestionInfo questionInfo = questionInfoMapper.selectById(questionId);
        if (questionInfo == null) {
            throw new RuntimeException("题目不存在");
        }

        // 2. 查询该题关联的知识点
        List<KnowledgeMapping> mappings = knowledgeMappingMapper.selectList(
                new LambdaQueryWrapper<KnowledgeMapping>()
                        .eq(KnowledgeMapping::getQuestionId, questionId));
        if (mappings.isEmpty()) {
            // 无知识点映射，退回使用智能选题（同模块、同题型）
            return selectQuestions(userId, questionInfo.getModuleType(), count);
        }

        Long knowledgePointId = mappings.get(0).getKnowledgePointId();
        SysKnowledgePoint kp = knowledgePointMapper.selectById(knowledgePointId);
        String kpName = kp != null ? kp.getName() : "未知知识点";

        // 3. 从正式题库中查询同类题目（同知识点、同模块、同题型、同难度，排除自身）
        List<QuestionInfo> existing = questionInfoMapper.selectList(
                new LambdaQueryWrapper<QuestionInfo>()
                        .eq(QuestionInfo::getKnowledgePointId, knowledgePointId)
                        .eq(QuestionInfo::getModuleType, questionInfo.getModuleType())
                        .eq(QuestionInfo::getQuestionType, questionInfo.getQuestionType())
                        .eq(QuestionInfo::getIsDeleted, 0)
                        .ne(QuestionInfo::getId, questionId)
                        .orderByAsc(QuestionInfo::getUsageCount)
                        .last("LIMIT " + count));

        List<QuestionVO> result = new ArrayList<>();

        // 4. 已有正式题库题目 → 优先使用
        for (QuestionInfo qi : existing) {
            result.add(toQuestionVO(qi, false));
            // 更新使用次数
            qi.setUsageCount(qi.getUsageCount() + 1);
            questionInfoMapper.updateById(qi);
        }

        int remaining = count - result.size();
        if (remaining <= 0) {
            log.info("同类题生成: 正式题库已有足够题目，共{}题", result.size());
            return result;
        }

        // 5. 正式题库不足 → 调用 AI 生成剩余题目
        String questionType = questionInfo.getQuestionType();
        if (questionType == null || questionType.isBlank()) {
            questionType = "FILL_BLANK";
        }

        log.info("同类题生成: 正式题库{}题，需AI生成{}题, knowledgePoint={}, difficulty={}, type={}",
                result.size(), remaining, kpName, questionInfo.getDifficultyLevel(), questionType);

        List<QuestionPending> generated = questionGenerateService.generateAndSaveDirectly(
                kpName,
                questionInfo.getTargetLevel(),
                questionInfo.getDifficultyLevel(),
                questionType,
                questionInfo.getModuleType(),
                remaining);

        // 6. 将生成的待审核题目转换为 QuestionVO 返回给前端（含答案，供练习用）
        for (QuestionPending pending : generated) {
            QuestionVO vo = QuestionVO.builder()
                    .id(pending.getId()) // 使用 pending 的 ID 作为临时ID
                    .moduleType(pending.getModuleType())
                    .difficultyLevel(pending.getDifficultyLevel())
                    .questionType(pending.getQuestionType())
                    .stem(pending.getStem())
                    .options(pending.getOptions())
                    .correctAnswer(pending.getCorrectAnswer()) // 练习模式下展示答案
                    .analysis(pending.getAnalysis())
                    .showAnswer(true)
                    .build();
            result.add(vo);
        }

        log.info("同类题生成完成: 共返回{}题（正式题库{}题 + AI生成{}题）",
                result.size(), result.size() - generated.size(), generated.size());
        return result;
    }

    // ============= 词汇组金币辅助 =============

    /**
     * 词汇答题刚好完成一组时调用 user-service 发币。
     * 任何异常都只记日志，不影响答题主流程。
     */
    private CoinAwardResult maybeAwardVocabGroup(Long userId) {
        try {
            LocalDate today = LocalDate.now(clock);
            LocalDateTime start = today.atStartOfDay();
            LocalDateTime end = today.plusDays(1).atStartOfDay();
            Long countValue = exerciseLogMapper.selectCount(new LambdaQueryWrapper<UserExerciseLog>()
                    .eq(UserExerciseLog::getUserId, userId)
                    .eq(UserExerciseLog::getModuleType, 1)
                    .ge(UserExerciseLog::getCreatedAt, start)
                    .lt(UserExerciseLog::getCreatedAt, end));
            long answeredCount = countValue != null ? countValue : 0L;
            int groupSize = getUserGroupSize(userId);
            int groupIndex = VocabGroupAwardPolicy.currentGroupIndex(answeredCount, groupSize);
            if (groupIndex <= 0) {
                return null;
            }

            AwardedGroupState state = awardedGroupCache.get(userId);
            if (state != null && today.equals(state.date) && groupIndex <= state.groupIndex) {
                return null;
            }

            String bizKey = "VOCAB_GROUP:" + userId + ":" + today + ":" + groupIndex;
            CoinAwardResult result = callCoinAward(userId, bizKey);
            if (result != null && (Boolean.TRUE.equals(result.getAwarded())
                    || "DUPLICATE".equals(result.getReason()))) {
                // 成功或已发过都推进游标；失败（null）不推进，下一次答题重试同一组
                awardedGroupCache.put(userId, new AwardedGroupState(today, groupIndex));
                return Boolean.TRUE.equals(result.getAwarded()) ? result : null;
            }
            if (result != null && "DAILY_LIMIT".equals(result.getReason())) {
                awardedGroupCache.put(userId, new AwardedGroupState(today, groupIndex));
            }
            return result;
        } catch (Exception e) {
            log.warn("词汇组金币判定失败: userId={}, reason={}", userId, e.getMessage());
            return null;
        }
    }

    /**
     * 读取用户每组单词数量，60 秒本地缓存，失败默认 10。
     */
    private int getUserGroupSize(Long userId) {
        long now = System.currentTimeMillis();
        CachedGroupSize cached = groupSizeCache.get(userId);
        if (cached != null && cached.expireAt > now) {
            return cached.size;
        }

        int size = 10;
        try {
            String url = userServiceUrl + "/internal/user/preference/" + userId;
            HttpHeaders headers = new HttpHeaders();
            if (internalToken != null && !internalToken.isBlank()) {
                headers.set("X-Internal-Token", internalToken);
            }
            ResponseEntity<Result<PreferenceResult>> response = restTemplate.exchange(
                    url, HttpMethod.GET, new HttpEntity<>(headers),
                    new ParameterizedTypeReference<Result<PreferenceResult>>() {
                    });
            if (response.getBody() != null && response.getBody().getCode() == 200
                    && response.getBody().getData() != null
                    && response.getBody().getData().getVocabGroupSize() != null) {
                size = response.getBody().getData().getVocabGroupSize();
            }
        } catch (Exception e) {
            log.warn("获取每组单词数量失败(userId={})，使用默认10: {}", userId, e.getMessage());
        }

        size = Math.max(5, Math.min(50, size));
        groupSizeCache.put(userId, new CachedGroupSize(size, now + 60_000L));
        return size;
    }

    /**
     * 只累加模块答题统计（正确率口径）。
     *
     * <p>词汇复习走这条链路：需要正确率数据，但不能重复发放金币、不能推进 ELO 与遗忘曲线。
     * 统计累加挂在 user-service 的模块维度更新里，因此复用同一个入口、只跳过 ELO 计算。</p>
     */
    private void recordModuleStatOnly(Long userId, int moduleType, boolean isCorrect) {
        try {
            String url = userServiceUrl + "/user/radar/record-module-answer";
            Map<String, Object> body = new HashMap<>();
            body.put("userId", userId);
            body.put("moduleType", moduleType);
            body.put("isCorrect", isCorrect);

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            HttpEntity<Map<String, Object>> entity = new HttpEntity<>(body, headers);
            restTemplate.postForEntity(url, entity, String.class);
        } catch (Exception e) {
            log.warn("调用user-service记录模块统计失败: userId={}, moduleType={}, reason={}",
                    userId, moduleType, e.getMessage());
        }
    }

    /**
     * 练习组键归一化：空白或超长一律视为未分组，避免脏值进入索引列。
     */
    private String normalizeBatchKey(String batchKey) {
        if (batchKey == null) {
            return null;
        }
        String trimmed = batchKey.trim();
        if (trimmed.isEmpty() || trimmed.length() > 64) {
            return null;
        }
        return trimmed;
    }

    /**
     * 调用 user-service 内部发币接口。
     */
    private CoinAwardResult callCoinAward(Long userId, String bizKey) {
        try {
            String url = userServiceUrl + "/internal/coin/award";
            Map<String, Object> body = new HashMap<>();
            body.put("userId", userId);
            body.put("bizType", "VOCAB_GROUP");
            body.put("bizKey", bizKey);

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            if (internalToken != null && !internalToken.isBlank()) {
                headers.set("X-Internal-Token", internalToken);
            }
            HttpEntity<Map<String, Object>> entity = new HttpEntity<>(body, headers);
            ResponseEntity<Result<CoinAwardResult>> response = restTemplate.exchange(
                    url, HttpMethod.POST, entity,
                    new ParameterizedTypeReference<Result<CoinAwardResult>>() {
                    });
            if (response.getBody() != null && response.getBody().getCode() == 200) {
                return response.getBody().getData();
            }
        } catch (Exception e) {
            log.warn("词汇组金币发放失败: userId={}, bizKey={}, reason={}", userId, bizKey, e.getMessage());
        }
        return null;
    }

    private static class CachedGroupSize {
        private final int size;
        private final long expireAt;

        private CachedGroupSize(int size, long expireAt) {
            this.size = size;
            this.expireAt = expireAt;
        }
    }

    private static class AwardedGroupState {
        private final LocalDate date;
        private final int groupIndex;

        private AwardedGroupState(LocalDate date, int groupIndex) {
            this.date = date;
            this.groupIndex = groupIndex;
        }
    }
}
