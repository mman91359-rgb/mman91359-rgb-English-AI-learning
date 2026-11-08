package com.english.ai.exercise;

import com.english.ai.common.ModuleType;
import com.english.ai.common.RadarDimension;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;

/**
 * module_type 契约单元测试。
 */
class ModuleTypeTest {

    @Test
    void defaultQuestionTypeMatchesContract() {
        assertEquals("FILL_BLANK", ModuleType.defaultQuestionType(1));
        assertEquals("SENTENCE_MAKING", ModuleType.defaultQuestionType(2));
        assertEquals("TRANSLATION", ModuleType.defaultQuestionType(3));
        assertEquals("CHOICE", ModuleType.defaultQuestionType(4));
        assertEquals("SENTENCE_MAKING", ModuleType.defaultQuestionType(5));
        assertEquals("WRITING", ModuleType.defaultQuestionType(6));
        // 阅读不强制题型：null 表示选题时不按 question_type 过滤
        assertNull(ModuleType.defaultQuestionType(7));
        assertEquals("FILL_BLANK", ModuleType.defaultQuestionType(null));
        assertEquals("FILL_BLANK", ModuleType.defaultQuestionType(99));
    }

    @Test
    void radarDimensionMatchesContract() {
        assertEquals(RadarDimension.VOCABULARY, ModuleType.radarDimensionOf(1));
        assertEquals(RadarDimension.GRAMMAR, ModuleType.radarDimensionOf(2));
        assertEquals(RadarDimension.TRANSLATION, ModuleType.radarDimensionOf(3));
        assertEquals(RadarDimension.LISTENING, ModuleType.radarDimensionOf(4));
        assertEquals(RadarDimension.GRAMMAR, ModuleType.radarDimensionOf(5));
        assertEquals(RadarDimension.WRITING, ModuleType.radarDimensionOf(6));
        assertEquals(RadarDimension.READING, ModuleType.radarDimensionOf(7));
        assertNull(ModuleType.radarDimensionOf(null));
        assertNull(ModuleType.radarDimensionOf(99));
    }

    @Test
    void ofReturnsNullForUnknownCode() {
        assertEquals(ModuleType.LISTENING, ModuleType.of(4));
        assertNull(ModuleType.of(0));
        assertNull(ModuleType.of(99));
    }
}
