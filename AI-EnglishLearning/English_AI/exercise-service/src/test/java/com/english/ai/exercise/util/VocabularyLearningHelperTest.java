package com.english.ai.exercise.util;

import com.english.ai.exercise.entity.UserVocabulary;
import org.junit.jupiter.api.Test;

import java.time.LocalDateTime;

import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * 词汇学习初始化辅助测试
 */
class VocabularyLearningHelperTest {

    private static final LocalDateTime NOW = LocalDateTime.of(2026, 10, 24, 12, 0);

    @Test
    void normalizeWordRemovesOptionPrefix() {
        assertEquals("establish", VocabularyLearningHelper.normalizeWord("  A. establish  "));
        assertEquals("abandon", VocabularyLearningHelper.normalizeWord("B、abandon"));
        assertEquals("maintain", VocabularyLearningHelper.normalizeWord("maintain"));
        assertEquals("", VocabularyLearningHelper.normalizeWord(null));
    }

    @Test
    void extractTranslationTakesFirstParenthesis() {
        assertEquals("成立", VocabularyLearningHelper.extractTranslation("公司于2005年（成立），此后迅速发展。"));
        assertEquals("维持", VocabularyLearningHelper.extractTranslation("maintain (维持) the status"));
        assertEquals("", VocabularyLearningHelper.extractTranslation("没有括号的解析"));
        assertEquals("", VocabularyLearningHelper.extractTranslation(null));
    }

    @Test
    void buildInitialVocabularyStartsAtMasteryZeroAndReviewsTomorrow() {
        UserVocabulary vocabulary = VocabularyLearningHelper.buildInitialVocabulary(
                1L, " C. maintain ", "维持", "quiz", NOW);

        assertEquals(1L, vocabulary.getUserId());
        assertEquals("maintain", vocabulary.getWord());
        assertEquals("维持", vocabulary.getTranslation());
        assertEquals("quiz", vocabulary.getSource());
        assertEquals(0, vocabulary.getReviewCount());
        assertEquals(0, vocabulary.getMasteryLevel());
        assertEquals(0, vocabulary.getIsMastered());
        assertEquals(NOW, vocabulary.getCreatedAt());
        assertEquals(NOW.plusDays(1), vocabulary.getNextReviewAt());
    }

    @Test
    void buildInitialVocabularyDefaultsToManualSource() {
        UserVocabulary vocabulary = VocabularyLearningHelper.buildInitialVocabulary(
                1L, "maintain", "维持", null, NOW);

        assertEquals("manual", vocabulary.getSource());
    }
}
