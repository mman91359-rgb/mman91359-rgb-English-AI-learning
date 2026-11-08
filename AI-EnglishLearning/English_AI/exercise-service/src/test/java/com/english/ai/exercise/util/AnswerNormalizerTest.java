package com.english.ai.exercise.util;

import com.english.ai.common.util.AnswerNormalizer;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * 填空题答案归一化测试：大小写、空白、全角半角、首尾标点、词内符号。
 */
class AnswerNormalizerTest {

    @Test
    void nullAndBlankBecomeEmpty() {
        assertEquals("", AnswerNormalizer.normalize(null));
        assertEquals("", AnswerNormalizer.normalize(""));
        assertEquals("", AnswerNormalizer.normalize("   "));
        assertEquals("", AnswerNormalizer.normalize("！！！"));
    }

    @Test
    void normalAnswerStaysUnchanged() {
        assertEquals("abandon", AnswerNormalizer.normalize("abandon"));
        assertEquals("inferred", AnswerNormalizer.normalize("inferred"));
    }

    @Test
    void caseIsLowered() {
        assertEquals("abandon", AnswerNormalizer.normalize("ABANDON"));
        assertEquals("abandon", AnswerNormalizer.normalize("Abandon"));
    }

    @Test
    void surroundingWhitespaceAndInnerSpacesCollapsed() {
        assertEquals("abandon", AnswerNormalizer.normalize("  abandon  "));
        assertEquals("well being", AnswerNormalizer.normalize("well   being"));
        assertEquals("a b", AnswerNormalizer.normalize("\ta \n b "));
    }

    @Test
    void fullWidthCharactersConverted() {
        assertEquals("abandon", AnswerNormalizer.normalize("ＡＢＡＮＤＯＮ"));
        assertEquals("abandon", AnswerNormalizer.normalize("ａｂａｎｄｏｎ"));
        // 全角空格
        assertEquals("a b", AnswerNormalizer.normalize("a　b"));
    }

    @Test
    void edgePunctuationStripped() {
        assertEquals("abandon", AnswerNormalizer.normalize("abandon."));
        assertEquals("abandon", AnswerNormalizer.normalize("abandon!"));
        assertEquals("abandon", AnswerNormalizer.normalize("...abandon?!"));
        assertEquals("abandon", AnswerNormalizer.normalize("（abandon）"));
        assertEquals("abandon", AnswerNormalizer.normalize("，abandon。"));
    }

    @Test
    void innerSymbolsKept() {
        assertEquals("don't", AnswerNormalizer.normalize("Don't"));
        assertEquals("well-being", AnswerNormalizer.normalize("Well-Being"));
        assertEquals("ice-cream", AnswerNormalizer.normalize("  ice-cream!  "));
    }

    @Test
    void toHalfWidthIsReusableInIsolation() {
        // 选择题等局部归一化场景直接复用，不做大小写/去标点
        assertEquals("A. Text", AnswerNormalizer.toHalfWidth("Ａ． Text"));
        assertEquals("abc 123", AnswerNormalizer.toHalfWidth("ａｂｃ　１２３"));
        assertEquals("", AnswerNormalizer.toHalfWidth(null));
    }

    @Test
    void fullWidthPunctuationHandled() {
        // ！全角感叹号先转半角再剥除
        assertEquals("abandon", AnswerNormalizer.normalize("abandon！"));
        assertEquals("abandon", AnswerNormalizer.normalize("Ａｂａｎｄｏｎ！"));
    }
}
