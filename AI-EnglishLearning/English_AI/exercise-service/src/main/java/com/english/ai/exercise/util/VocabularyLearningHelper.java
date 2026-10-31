package com.english.ai.exercise.util;

import com.english.ai.exercise.entity.UserVocabulary;

import java.time.LocalDateTime;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 词汇学习初始化辅助：统一单词清洗、中文释义提取与复习计划初始化。
 */
public final class VocabularyLearningHelper {

    private static final Pattern OPTION_PREFIX = Pattern.compile("^[A-Da-d][.、)]\\s*");
    private static final Pattern TRANSLATION_IN_PARENTHESES = Pattern.compile("[（(]([^）)]+)[）)]");

    private VocabularyLearningHelper() {
    }

    /** 去掉选项前缀与首尾空白，单词统一小写比较时由调用方处理 */
    public static String normalizeWord(String word) {
        if (word == null) {
            return "";
        }
        String normalized = word.trim();
        normalized = OPTION_PREFIX.matcher(normalized).replaceFirst("");
        return normalized.trim();
    }

    /** 从题干解析中提取第一个中文括号内容，作为单词释义 */
    public static String extractTranslation(String analysis) {
        if (analysis == null || analysis.isBlank()) {
            return "";
        }
        Matcher matcher = TRANSLATION_IN_PARENTHESES.matcher(analysis);
        return matcher.find() ? matcher.group(1).trim() : "";
    }

    /**
     * 构建新学单词记录：掌握度 0、未掌握、次日复习、source 默认 manual。
     */
    public static UserVocabulary buildInitialVocabulary(Long userId, String word, String translation,
                                                        String source, LocalDateTime now) {
        UserVocabulary vocabulary = new UserVocabulary();
        vocabulary.setUserId(userId);
        vocabulary.setWord(normalizeWord(word));
        vocabulary.setTranslation(translation == null ? "" : translation.trim());
        vocabulary.setSource(source == null || source.isBlank() ? "manual" : source);
        vocabulary.setReviewCount(0);
        vocabulary.setMasteryLevel(0);
        vocabulary.setNextReviewAt(EbbinghausUtil.nextReviewAt(0, now));
        vocabulary.setIsMastered(0);
        vocabulary.setCreatedAt(now);
        vocabulary.setUpdatedAt(now);
        return vocabulary;
    }
}
