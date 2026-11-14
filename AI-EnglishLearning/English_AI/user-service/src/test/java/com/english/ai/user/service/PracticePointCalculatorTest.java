package com.english.ai.user.service;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * 练习积分规则单测。
 *
 * <p>数值与需求确认时的算例保持一致：10 题、平均难度 4（难度和 40）时
 * 满分 73 分、80% 正确率 58 分、60% 正确率 44 分、低于 60% 记 0。</p>
 */
class PracticePointCalculatorTest {

    @Test
    @DisplayName("单题分值：难度1为1倍，难度8为2.05倍")
    void questionPointsScalesWithDifficulty() {
        assertEquals(5.0, PracticePointCalculator.questionPoints(1), 1e-9);
        assertEquals(5.75, PracticePointCalculator.questionPoints(2), 1e-9);
        assertEquals(10.25, PracticePointCalculator.questionPoints(8), 1e-9);
        // 越界按边界处理
        assertEquals(5.0, PracticePointCalculator.questionPoints(0), 1e-9);
        assertEquals(10.25, PracticePointCalculator.questionPoints(99), 1e-9);
    }

    @Test
    @DisplayName("本组分值总和：10题/难度和40 = 72.5")
    void sumQuestionPointsMatchesManualSum() {
        assertEquals(72.5, PracticePointCalculator.sumQuestionPoints(10, 40), 1e-9);
        assertEquals(0, PracticePointCalculator.sumQuestionPoints(0, 0), 1e-9);
        // 全难度 3 的 10 题：5×10 + 0.75×(30−10) = 65
        assertEquals(65.0, PracticePointCalculator.sumQuestionPoints(10, 30), 1e-9);
    }

    @Test
    @DisplayName("正确率保留两位小数")
    void accuracyIsPercentage() {
        assertEquals(80.0, PracticePointCalculator.accuracy(8, 10), 1e-9);
        assertEquals(66.67, PracticePointCalculator.accuracy(2, 3), 1e-9);
        assertEquals(0, PracticePointCalculator.accuracy(0, 0), 1e-9);
        // 答对数超过总题数时按总题数截断
        assertEquals(100.0, PracticePointCalculator.accuracy(15, 10), 1e-9);
    }

    @Test
    @DisplayName("积分结算：正确率作为乘数，低于60%记0")
    void settlePointsAppliesAccuracyGate() {
        assertEquals(73, PracticePointCalculator.settlePoints(10, 40, 10));
        assertEquals(58, PracticePointCalculator.settlePoints(10, 40, 8));
        assertEquals(44, PracticePointCalculator.settlePoints(10, 40, 6));
        // 50% 未达门槛
        assertEquals(0, PracticePointCalculator.settlePoints(10, 40, 5));
        // 无作答
        assertEquals(0, PracticePointCalculator.settlePoints(0, 0, 0));
    }

    @Test
    @DisplayName("每日上限200：超出部分不发，已满则0")
    void dailyLimitCutsExcess() {
        assertEquals(50, PracticePointCalculator.applyDailyLimit(50, 100));
        assertEquals(20, PracticePointCalculator.applyDailyLimit(50, 180));
        assertEquals(0, PracticePointCalculator.applyDailyLimit(50, 200));
        assertEquals(0, PracticePointCalculator.applyDailyLimit(50, 260));
        assertEquals(0, PracticePointCalculator.applyDailyLimit(0, 0));
    }

    @Test
    @DisplayName("累计积分封顶10000")
    void totalPointsCapped() {
        assertEquals(150, PracticePointCalculator.capTotal(100, 50));
        assertEquals(10000, PracticePointCalculator.capTotal(9900, 300));
        assertEquals(10000, PracticePointCalculator.capTotal(10000, 500));
    }

    @Test
    @DisplayName("称号分段：0/1000/2500/4500/7000 分别落在五段")
    void titleSegments() {
        assertEquals(PracticeTitle.BEGINNER, PracticeTitle.of(0));
        assertEquals(PracticeTitle.BEGINNER, PracticeTitle.of(999));
        assertEquals(PracticeTitle.FOUNDATION, PracticeTitle.of(1000));
        assertEquals(PracticeTitle.FOUNDATION, PracticeTitle.of(2499));
        assertEquals(PracticeTitle.THROUGH, PracticeTitle.of(2500));
        assertEquals(PracticeTitle.PROFICIENT, PracticeTitle.of(4500));
        assertEquals(PracticeTitle.PEAK, PracticeTitle.of(7000));
        assertEquals(PracticeTitle.PEAK, PracticeTitle.of(10000));
        // 负数与超限兜底
        assertEquals(PracticeTitle.BEGINNER, PracticeTitle.of(-10));
        assertEquals(PracticeTitle.PEAK, PracticeTitle.of(99999));
    }

    @Test
    @DisplayName("段位进度与晋级：满段100，已封顶无下一段")
    void titleProgress() {
        assertEquals(0, PracticeTitle.BEGINNER.progressOf(0));
        assertEquals(50, PracticeTitle.BEGINNER.progressOf(500));
        assertEquals(100, PracticeTitle.PROFICIENT.progressOf(6999));
        assertEquals("登峰者", PracticeTitle.PROFICIENT.next().getLabel());
        assertEquals(PracticeTitle.PEAK, PracticeTitle.PEAK.next());
        assertEquals(100, PracticeTitle.PEAK.progressOf(10000));
        assertEquals(50, PracticeTitle.PEAK.progressOf(8500));
    }
}
