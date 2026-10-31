package com.english.ai.exercise.service;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * 词汇组完成判定单元测试
 */
class VocabGroupAwardPolicyTest {

    @Test
    void groupIsCompletedOnExactMultiples() {
        assertEquals(-1, VocabGroupAwardPolicy.completedGroupIndex(9, 10));
        assertEquals(1, VocabGroupAwardPolicy.completedGroupIndex(10, 10));
        assertEquals(2, VocabGroupAwardPolicy.completedGroupIndex(20, 10));
        assertEquals(-1, VocabGroupAwardPolicy.completedGroupIndex(21, 10));
    }

    @Test
    void boundaryGroupSizes() {
        assertEquals(1, VocabGroupAwardPolicy.completedGroupIndex(5, 5));
        assertEquals(1, VocabGroupAwardPolicy.completedGroupIndex(50, 50));
        assertEquals(-1, VocabGroupAwardPolicy.completedGroupIndex(0, 10));
        assertEquals(-1, VocabGroupAwardPolicy.completedGroupIndex(10, 0));
    }

    @Test
    void currentGroupIndexSupportsRetry() {
        assertEquals(0, VocabGroupAwardPolicy.currentGroupIndex(9, 10));
        assertEquals(1, VocabGroupAwardPolicy.currentGroupIndex(10, 10));
        assertEquals(1, VocabGroupAwardPolicy.currentGroupIndex(11, 10));
        assertEquals(2, VocabGroupAwardPolicy.currentGroupIndex(20, 10));
        assertEquals(0, VocabGroupAwardPolicy.currentGroupIndex(0, 10));
    }
}
