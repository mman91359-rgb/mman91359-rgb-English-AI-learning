package com.english.ai.user.service;

import com.english.ai.user.config.CoinRewardProperties;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

/**
 * 金币奖励纯计算逻辑，便于单元测试
 */
@Component
@RequiredArgsConstructor
public class CoinRewardCalculator {

    private final CoinRewardProperties properties;

    /** 签到基础奖励 */
    public int baseReward() {
        return properties.getCheckIn().getBaseReward();
    }

    /** 连续第 streak 天的额外奖励，带上限 */
    public int streakBonus(int streak) {
        int safeStreak = Math.max(streak, 1);
        int bonus = (safeStreak - 1) * properties.getCheckIn().getStreakStep();
        return Math.min(bonus, properties.getCheckIn().getMaxStreakBonus());
    }

    /** 连续第 streak 天的里程碑奖励，没有则为 0 */
    public int milestoneReward(int streak) {
        if (properties.getCheckIn().getMilestones() == null) {
            return 0;
        }
        return properties.getCheckIn().getMilestones().stream()
                .filter(m -> m.getDays() == streak)
                .mapToInt(CoinRewardProperties.Milestone::getReward)
                .findFirst()
                .orElse(0);
    }

    /** 连续第 streak 天签到的总奖励 */
    public int checkInReward(int streak) {
        return baseReward() + streakBonus(streak) + milestoneReward(streak);
    }
}
