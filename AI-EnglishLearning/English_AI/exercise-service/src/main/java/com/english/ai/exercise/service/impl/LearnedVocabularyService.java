package com.english.ai.exercise.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.english.ai.exercise.constant.VocabularyStatus;
import com.english.ai.exercise.dto.LearnedWordDateVO;
import com.english.ai.exercise.dto.LearnedWordVO;
import com.english.ai.exercise.dto.VocabularySummaryVO;
import com.english.ai.exercise.entity.UserVocabulary;
import com.english.ai.exercise.entity.UserWordLearnLog;
import com.english.ai.exercise.entity.WordBook;
import com.english.ai.exercise.entity.WordBookItem;
import com.english.ai.exercise.mapper.UserVocabularyMapper;
import com.english.ai.exercise.mapper.UserWordLearnLogMapper;
import com.english.ai.exercise.mapper.WordBookItemMapper;
import com.english.ai.exercise.mapper.WordBookMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * 已学词库与「标熟」服务。
 *
 * <p>独立于 {@code ExerciseServiceImpl}（后者已 2000+ 行），只负责三件事：
 * 已学词库查询、标熟/取消标熟、词汇量汇总。</p>
 *
 * <h3>状态语义</h3>
 * <p>词库只有四个状态，见 {@link VocabularyStatus}。用户唯一可操作的排除动作是「标熟」：
 * 标熟即退出新词池与复习队列，但仍计入已学——这是它与「未学习」的根本差别。</p>
 *
 * <h3>日期分组</h3>
 * <p>分组日统一为 {@code COALESCE(mastered_at, familiar_at, first_learned_at)}，
 * 即「当前状态是什么时候达成的」。数据库 datetime 无时区，分组在 SQL 层用 DATE() 截断，
 * 前端拿到的 yyyy-MM-dd 字符串不得再做时区二次转换（会差 8 小时）。</p>
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class LearnedVocabularyService {

    private static final DateTimeFormatter DATE_FMT = DateTimeFormatter.ofPattern("yyyy-MM-dd");

    private final UserVocabularyMapper vocabularyMapper;
    private final UserWordLearnLogMapper userWordLearnLogMapper;
    private final WordBookMapper wordBookMapper;
    private final WordBookItemMapper wordBookItemMapper;

    /**
     * 页面 tab → 数据库状态集合。
     *
     * <p>「复习中」把 LEARNING 与 REVIEWING 合并展示；接口保留两态，
     * 这样前端也能按更细的状态单独筛选。</p>
     */
    private List<String> statusesOf(String tab) {
        if (tab == null || tab.isBlank() || "ALL".equalsIgnoreCase(tab)) {
            return new ArrayList<>(VocabularyStatus.ALL);
        }
        switch (tab.toUpperCase(Locale.ROOT)) {
            case "LEARNING":
                return VocabularyStatus.IN_REVIEW;
            case "REVIEWING":
                return List.of(VocabularyStatus.REVIEWING);
            case "MASTERED":
                return List.of(VocabularyStatus.MASTERED);
            case "FAMILIAR":
                return List.of(VocabularyStatus.FAMILIAR);
            default:
                return new ArrayList<>(VocabularyStatus.ALL);
        }
    }

    /**
     * 已学词库：日期分组头（按日期倒序）。
     */
    public List<LearnedWordDateVO> getDateGroups(Long userId, String tab) {
        List<LearnedWordDateVO> groups = vocabularyMapper.selectGroupDates(userId, statusesOf(tab));
        return groups == null ? Collections.emptyList() : groups;
    }

    /**
     * 已学词库：分页取词条。
     *
     * @param groupDate 分组日（yyyy-MM-dd），为空表示不限日期
     */
    public Map<String, Object> getLearnedWords(Long userId, String tab, String groupDate,
                                               int page, int size) {
        int safePage = page < 1 ? 1 : page;
        int safeSize = Math.max(1, Math.min(200, size));
        List<String> statuses = statusesOf(tab);

        long total = vocabularyMapper.countLearnedWords(userId, statuses, groupDate);
        List<UserVocabulary> list = vocabularyMapper.selectLearnedWords(
                userId, statuses, groupDate, (safePage - 1) * safeSize, safeSize);

        List<LearnedWordVO> records = toVOList(list);

        Map<String, Object> result = new LinkedHashMap<>();
        result.put("records", records);
        result.put("total", total);
        result.put("page", safePage);
        result.put("size", safeSize);
        return result;
    }

    /**
     * 标记标熟 / 取消标熟。
     *
     * <p>标熟语义：退出新词池与复习队列，但计入已学。取消标熟后回到「复习中」，
     * next_review_at 保持原值（若已过期则立即回到复习队列——这符合
     * 「取消标熟 = 我愿意再学一遍」）。</p>
     *
     * <p>标熟时把 is_mastered 归零：MASTERED 与 FAMILIAR 两档必须互斥不重叠，
     * 否则「复习完成」与「已标熟」两个统计数字会互相污染。</p>
     */
    public UserVocabulary markFamiliar(Long id, Long userId, boolean familiar) {
        UserVocabulary v = vocabularyMapper.selectOne(
                new LambdaQueryWrapper<UserVocabulary>()
                        .eq(UserVocabulary::getId, id)
                        .eq(UserVocabulary::getUserId, userId));
        if (v == null) {
            throw new IllegalArgumentException("单词不存在");
        }
        LocalDateTime now = LocalDateTime.now();
        if (familiar) {
            v.setStatus(VocabularyStatus.FAMILIAR);
            v.setFamiliarAt(now);
            v.setIsMastered(0);
        } else {
            v.setStatus(VocabularyStatus.REVIEWING);
            v.setFamiliarAt(null);
        }
        vocabularyMapper.updateById(v);
        logEvent(userId, v.getWordId(), v.getWord(),
                familiar ? "FAMILIAR" : "UNFAMILIAR", bookCodeOf(v.getBookId()));
        log.info("标熟变更: id={}, userId={}, familiar={}", id, userId, familiar);
        return v;
    }

    /**
     * 批量取消标熟（「已标熟」分类页多选批量用）。
     *
     * @return 实际变更条数
     */
    public int batchUnfamiliar(Long userId, List<Long> ids) {
        if (ids == null || ids.isEmpty()) {
            return 0;
        }
        List<UserVocabulary> list = vocabularyMapper.selectList(
                new LambdaQueryWrapper<UserVocabulary>()
                        .eq(UserVocabulary::getUserId, userId)
                        .in(UserVocabulary::getId, ids)
                        .eq(UserVocabulary::getStatus, VocabularyStatus.FAMILIAR));
        if (list.isEmpty()) {
            return 0;
        }
        LocalDateTime now = LocalDateTime.now();
        for (UserVocabulary v : list) {
            v.setStatus(VocabularyStatus.REVIEWING);
            v.setFamiliarAt(null);
            vocabularyMapper.updateById(v);
            logEvent(userId, v.getWordId(), v.getWord(), "UNFAMILIAR", bookCodeOf(v.getBookId()));
        }
        log.info("批量取消标熟: userId={}, 请求{}条, 实际变更{}条", userId, ids.size(), list.size());
        return list.size();
    }

    /**
     * 词汇量汇总（统计页「个人词汇量」组件）。
     */
    public VocabularySummaryVO getSummary(Long userId) {
        int total = 0;
        int learning = 0;
        int mastered = 0;
        int familiar = 0;
        for (Map<String, Object> row : vocabularyMapper.countByStatus(userId)) {
            Object st = row.get("status");
            Object ct = row.get("cnt");
            int count = ct instanceof Number ? ((Number) ct).intValue() : 0;
            total += count;
            String status = st == null ? "" : String.valueOf(st);
            switch (status) {
                case VocabularyStatus.LEARNING:
                case VocabularyStatus.REVIEWING:
                    learning += count;
                    break;
                case VocabularyStatus.MASTERED:
                    mastered += count;
                    break;
                case VocabularyStatus.FAMILIAR:
                    familiar += count;
                    break;
                default:
                    break;
            }
        }
        return VocabularySummaryVO.builder()
                .total(total)
                .learning(learning)
                .mastered(mastered)
                .familiar(familiar)
                .dueReview(vocabularyMapper.countDueReview(userId))
                .build();
    }

    // ============= 内部转换 =============

    private List<LearnedWordVO> toVOList(List<UserVocabulary> list) {
        if (list == null || list.isEmpty()) {
            return Collections.emptyList();
        }
        Map<Long, WordBook> books = loadBooks(list);
        List<LearnedWordVO> result = new ArrayList<>(list.size());
        for (UserVocabulary v : list) {
            LearnedWordVO vo = new LearnedWordVO();
            vo.setId(v.getId());
            vo.setWord(v.getWord());
            vo.setTranslation(v.getTranslation());
            vo.setPhonetic(v.getPhonetic());
            vo.setPos(v.getPos());
            vo.setExample(v.getExample());
            vo.setStatus(v.getStatus());
            vo.setFirstLearnedAt(v.getFirstLearnedAt());
            vo.setMasteredAt(v.getMasteredAt());
            vo.setFamiliarAt(v.getFamiliarAt());
            vo.setCorrectCount(v.getCorrectCount());
            vo.setWrongCount(v.getWrongCount());
            vo.setReviewCount(v.getReviewCount());
            vo.setGroupDate(groupDateOf(v));

            WordBook book = v.getBookId() == null ? null : books.get(v.getBookId());
            if (book != null) {
                vo.setBookCode(book.getCode());
                vo.setBookName(book.getName());
            }
            result.add(vo);
        }
        return result;
    }

    /** 分组日：COALESCE(mastered_at, familiar_at, first_learned_at)，与 SQL 分组键保持一致 */
    private String groupDateOf(UserVocabulary v) {
        LocalDateTime date = v.getMasteredAt() != null ? v.getMasteredAt()
                : (v.getFamiliarAt() != null ? v.getFamiliarAt() : v.getFirstLearnedAt());
        return date == null ? null : date.format(DATE_FMT);
    }

    private Map<Long, WordBook> loadBooks(List<UserVocabulary> list) {
        Set<Long> bookIds = list.stream()
                .map(UserVocabulary::getBookId)
                .filter(java.util.Objects::nonNull)
                .collect(Collectors.toSet());
        if (bookIds.isEmpty()) {
            return Collections.emptyMap();
        }
        Map<Long, WordBook> map = new HashMap<>();
        for (WordBook b : wordBookMapper.selectBatchIds(bookIds)) {
            map.put(b.getId(), b);
        }
        return map;
    }

    /** 按词书ID反查 code（本地查表，不跨服务） */
    private String bookCodeOf(Long bookId) {
        if (bookId == null) {
            return null;
        }
        WordBook b = wordBookMapper.selectById(bookId);
        return b != null ? b.getCode() : null;
    }

    private void logEvent(Long userId, Long wordId, String word, String eventType, String bookCode) {
        UserWordLearnLog entry = new UserWordLearnLog();
        entry.setUserId(userId);
        entry.setWordId(wordId);
        entry.setWord(word == null ? "" : word.toLowerCase(Locale.ROOT));
        entry.setEventType(eventType);
        entry.setResult(null);
        entry.setBookCode(bookCode);
        userWordLearnLogMapper.insert(entry);
    }

    /** 词书编码反查（供外部复用） */
    public String resolveBookCodeForWord(String word) {
        if (word == null || word.isBlank()) {
            return null;
        }
        List<WordBookItem> items = wordBookItemMapper.selectList(
                new LambdaQueryWrapper<WordBookItem>()
                        .eq(WordBookItem::getWord, word.toLowerCase(Locale.ROOT))
                        .select(WordBookItem::getBookCode));
        if (items.isEmpty()) {
            return null;
        }
        Set<String> codes = items.stream()
                .map(WordBookItem::getBookCode)
                .filter(c -> c != null && !c.isBlank())
                .collect(Collectors.toSet());
        if (codes.size() == 1) {
            return codes.iterator().next();
        }
        List<WordBook> books = wordBookMapper.selectList(
                new LambdaQueryWrapper<WordBook>()
                        .in(WordBook::getCode, codes)
                        .orderByAsc(WordBook::getSortOrder));
        return books.isEmpty() ? null : books.get(0).getCode();
    }
}
