package com.english.ai.ai.service;

import org.junit.jupiter.api.Test;

import java.util.Map;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;

/**
 * 段落翻译评分解析测试。
 */
class TranslateScoreParseTest {

    @Test
    void parsesPlainJson() {
        Map<String, Object> r = AiService.parseTranslationScore(
                "{\"rawScore\":8,\"maxRawScore\":15,\"level\":\"PASS\",\"comment\":\"基本达意\"}");

        assertNotNull(r);
        assertEquals(8, r.get("rawScore"));
        assertEquals(15, r.get("maxRawScore"));
        assertEquals("PASS", r.get("level"));
        assertEquals("基本达意", r.get("comment"));
    }

    @Test
    void parsesJsonWrappedInCodeFence() {
        Map<String, Object> r = AiService.parseTranslationScore(
                "```json\n{\"rawScore\":12,\"maxRawScore\":15,\"level\":\"GOOD\",\"comment\":\"通顺\"}\n```");

        assertNotNull(r);
        assertEquals(12, r.get("rawScore"));
        assertEquals("GOOD", r.get("level"));
    }

    @Test
    void clampsScoreToMax() {
        Map<String, Object> r = AiService.parseTranslationScore(
                "{\"rawScore\":20,\"maxRawScore\":15,\"level\":\"EXCELLENT\"}");

        assertNotNull(r);
        assertEquals(15, r.get("rawScore"));
    }

    @Test
    void missingRawScoreReturnsNull() {
        assertNull(AiService.parseTranslationScore("{\"level\":\"PASS\",\"comment\":\"x\"}"));
    }

    @Test
    void invalidJsonReturnsNull() {
        assertNull(AiService.parseTranslationScore("这句是纯文本，没有 JSON"));
        assertNull(AiService.parseTranslationScore("{不是合法 JSON}"));
    }

    @Test
    void blankReturnsNull() {
        assertNull(AiService.parseTranslationScore(null));
        assertNull(AiService.parseTranslationScore("   "));
    }
}
