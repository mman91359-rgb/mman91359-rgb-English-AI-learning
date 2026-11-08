package com.english.ai.exercise.util;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

/**
 * 选择题确定性判题工具单元测试。
 */
class ChoiceAnswerUtilTest {

    private static final String OPTIONS = "[\"A. A subway station\", \"B. A bus stop\", \"C. A coffee shop\"]";

    @Test
    void letterAnswerMatchesCorrectOption() {
        assertTrue(ChoiceAnswerUtil.isCorrect("A", "A. A subway station", OPTIONS));
        assertTrue(ChoiceAnswerUtil.isCorrect("a", "A. A subway station", OPTIONS));
    }

    @Test
    void optionTextAnswerMatchesCorrectOption() {
        assertTrue(ChoiceAnswerUtil.isCorrect("A subway station", "A. A subway station", OPTIONS));
        assertTrue(ChoiceAnswerUtil.isCorrect("A. A subway station", "A. A subway station", OPTIONS));
        assertTrue(ChoiceAnswerUtil.isCorrect("a subway station", "A. A subway station", OPTIONS));
    }

    @Test
    void wrongAnswerDoesNotMatch() {
        assertFalse(ChoiceAnswerUtil.isCorrect("B", "A. A subway station", OPTIONS));
        assertFalse(ChoiceAnswerUtil.isCorrect("A bus stop", "A. A subway station", OPTIONS));
    }

    @Test
    void optionsObjectIsSupported() {
        String objectOptions = "{\"A\":\"A subway station\",\"B\":\"A bus stop\"}";
        assertTrue(ChoiceAnswerUtil.isCorrect("A", "A. A subway station", objectOptions));
        assertTrue(ChoiceAnswerUtil.isCorrect("A subway station", "A. A subway station", objectOptions));
    }

    @Test
    void invalidInputReturnsFalseWithoutThrowing() {
        assertFalse(ChoiceAnswerUtil.isCorrect(null, "A. A subway station", OPTIONS));
        assertFalse(ChoiceAnswerUtil.isCorrect("", "A. A subway station", OPTIONS));
        assertFalse(ChoiceAnswerUtil.isCorrect("A", null, OPTIONS));
        // 选项 JSON 非法时仍可退化为字母/文本比对，不抛异常
        assertFalse(ChoiceAnswerUtil.isCorrect("B", "A. A subway station", "not-json"));
    }

    @Test
    void extractKeyHandlesCommonPrefixes() {
        assertEquals("A", ChoiceAnswerUtil.extractKey("A. text"));
        assertEquals("B", ChoiceAnswerUtil.extractKey("B、text"));
        assertEquals("C", ChoiceAnswerUtil.extractKey("C) text"));
        assertEquals("D", ChoiceAnswerUtil.extractKey("D"));
        assertEquals("", ChoiceAnswerUtil.extractKey("text"));
    }

    @Test
    void normalizeOptionTextRemovesPrefixAndWhitespace() {
        assertEquals("a subway station", ChoiceAnswerUtil.normalizeOptionText("A. A  Subway Station"));
        assertEquals("bus stop", ChoiceAnswerUtil.normalizeOptionText("B、bus   stop"));
    }

    // ===== P1-1：全角归一化对齐 =====

    @Test
    void fullWidthLetterAnswerMatchesCorrectOption() {
        assertTrue(ChoiceAnswerUtil.isCorrect("Ａ", "A. A subway station", OPTIONS));
        assertTrue(ChoiceAnswerUtil.isCorrect("Ａ．", "A. A subway station", OPTIONS));
        assertFalse(ChoiceAnswerUtil.isCorrect("Ｂ", "A. A subway station", OPTIONS));
    }

    @Test
    void fullWidthOptionTextMatchesCorrectOption() {
        assertTrue(ChoiceAnswerUtil.isCorrect("Ａ． A subway station", "A. A subway station", OPTIONS));
        assertTrue(ChoiceAnswerUtil.isCorrect("Ａ　ｓｕｂｗａｙ　ｓｔａｔｉｏｎ", "A. A subway station", OPTIONS));
    }

    @Test
    void fullWidthPrefixIsParsed() {
        assertEquals("A", ChoiceAnswerUtil.extractKey("Ａ．text"));
        assertEquals("A", ChoiceAnswerUtil.extractKey("Ａ、text"));
        assertEquals("a subway station", ChoiceAnswerUtil.normalizeOptionText("Ａ．　Ａ Subway Station"));
    }

    @Test
    void realChoiceQuestionsRegression() {
        // 题 464–467：correct_answer 形如 "A. A subway station"，字母与文本双路径都要命中
        String q464 = "[\"A. A subway station\",\"B. A bus stop\",\"C. A coffee shop\",\"D. A bookstore\"]";
        assertTrue(ChoiceAnswerUtil.isCorrect("A", "A. A subway station", q464));
        assertTrue(ChoiceAnswerUtil.isCorrect("a subway station", "A. A subway station", q464));

        String q465 = "[\"A. She was ill.\",\"B. She forgot the time.\",\"C. Her train was delayed.\",\"D. She had a family emergency.\"]";
        assertTrue(ChoiceAnswerUtil.isCorrect("C", "C. Her train was delayed.", q465));
        assertTrue(ChoiceAnswerUtil.isCorrect("her train was delayed", "C. Her train was delayed.", q465));

        String q466 = "[\"A. It should replace traditional classrooms.\",\"B. It works best when combined with face-to-face teaching.\",\"C. It is unsuitable for college students.\",\"D. It requires less self-discipline.\"]";
        assertTrue(ChoiceAnswerUtil.isCorrect("B", "B. It works best when combined with face-to-face teaching.", q466));

        String q467 = "[\"A. Climate change alone.\",\"B. The use of pesticides and loss of habitat.\",\"C. An increase in natural predators.\",\"D. A shortage of honey.\"]";
        assertTrue(ChoiceAnswerUtil.isCorrect("B", "B. The use of pesticides and loss of habitat.", q467));
        assertFalse(ChoiceAnswerUtil.isCorrect("A", "B. The use of pesticides and loss of habitat.", q467));
    }
}
