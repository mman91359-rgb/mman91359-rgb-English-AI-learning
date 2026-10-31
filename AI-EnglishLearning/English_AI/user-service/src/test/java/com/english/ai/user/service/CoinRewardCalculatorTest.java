package com.english.ai.user.service;

import com.english.ai.user.config.CoinRewardProperties;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * 金币奖励计算单元测试
 */
class CoinRewardCalculatorTest {

    private CoinRewardCalculator calculator;

    @BeforeEach
    void setUp() {
        CoinRewardProperties properties = new CoinRewardProperties();
        properties.getCheckIn().setBaseReward(10);
        properties.getCheckIn().setStreakStep(2);
        properties.getCheckIn().setMaxStreakBonus(20);

        CoinRewardProperties.Milestone seven = new CoinRewardProperties.Milestone();
        seven.setDays(7);
        seven.setReward(30);
        CoinRewardProperties.Milestone thirty = new CoinRewardProperties.Milestone();
        thirty.setDays(30);
        thirty.setReward(100);
        properties.getCheckIn().setMilestones(List.of(seven, thirty));

        calculator = new CoinRewardCalculator(properties);
    }

    @Test
    void baseRewardAndStreakBonus() {
        assertEquals(10, calculator.baseReward());
        assertEquals(0, calculator.streakBonus(1));
        assertEquals(2, calculator.streakBonus(2));
        assertEquals(18, calculator.streakBonus(10));
        assertEquals(20, calculator.streakBonus(100));
    }

    @Test
    void milestoneRewardOnlyMatchesExactDay() {
        assertEquals(30, calculator.milestoneReward(7));
        assertEquals(100, calculator.milestoneReward(30));
        assertEquals(0, calculator.milestoneReward(8));
    }

    @Test
    void totalCheckInReward() {
        assertEquals(10, calculator.checkInReward(1));
        assertEquals(12, calculator.checkInReward(2));
        assertEquals(52, calculator.checkInReward(7));
        assertEquals(130, calculator.checkInReward(30));
    }
}
