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
}
