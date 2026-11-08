package com.english.ai.exercise;

import com.english.ai.common.JudgmentLevel;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * 判题层级常量契约测试：取值必须与前端 {@code L${matchedLevel}} 的既有解析一致。
 */
class JudgmentLevelTest {

    @Test
    void valuesStayCompatibleWithExistingFrontend() {
        assertEquals(0, JudgmentLevel.LOCAL_MATCH);
        assertEquals(1, JudgmentLevel.EXACT);
        assertEquals(2, JudgmentLevel.SEMANTIC);
        assertEquals(3, JudgmentLevel.AI_FEEDBACK);
    }
}
