package com.english.ai.exercise.service.impl;

import com.english.ai.exercise.dto.JudgmentResult;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * 判题埋点计数器测试。
 */
class JudgmentMetricsTest {

    private JudgmentResult result(int level, boolean correct) {
        return JudgmentResult.builder()
                .isCorrect(correct)
                .matchedLevel(level)
                .suggestions(java.util.List.of())
                .build();
    }

    @Test
    void countsTotalLevelHitsAndAiCalls() {
        JudgmentMetrics metrics = new JudgmentMetrics();

        metrics.record(1L, result(1, true), 5, false);
        metrics.record(1L, result(2, false), 6, false);
        metrics.record(1L, result(3, false), 7, true);
        metrics.record(1L, result(0, true), 1, false);

        assertEquals(4, metrics.totalCount());
        assertEquals(1, metrics.aiCalledCount());
        assertEquals(1, metrics.levelHit(0));
        assertEquals(1, metrics.levelHit(1));
        assertEquals(1, metrics.levelHit(2));
        assertEquals(1, metrics.levelHit(3));
    }

    @Test
    void toleratesNullResultAndOutOfRangeLevel() {
        JudgmentMetrics metrics = new JudgmentMetrics();

        metrics.record(1L, null, 3, false);
        metrics.record(1L, result(99, false), 3, false);

        assertEquals(2, metrics.totalCount());
        assertEquals(0, metrics.levelHit(-1));
        assertEquals(0, metrics.levelHit(99));
    }
}
