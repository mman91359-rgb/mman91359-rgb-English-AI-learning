package com.english.ai.user.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * 金币奖励配置，集中放在 application.yml 的 app.coin 下
 */
@Data
@Component
@ConfigurationProperties(prefix = "app.coin")
public class CoinRewardProperties {

    private CheckIn checkIn = new CheckIn();

    private VocabGroup vocabGroup = new VocabGroup();

    @Data
    public static class CheckIn {

        /** 每日签到基础金币 */
        private int baseReward = 10;

        /** 连续第 n 天额外 (n-1) * streakStep */
        private int streakStep = 2;

        /** 连续加成上限 */
        private int maxStreakBonus = 20;

        /** 连续签到里程碑 */
        private List<Milestone> milestones = new ArrayList<>();
    }

    @Data
    public static class Milestone {

        private int days;

        private int reward;
    }

    @Data
    public static class VocabGroup {

        /** 每完成一组单词的奖励 */
        private int reward = 5;

        /** 每日最多发放组数 */
        private int dailyLimit = 3;
    }
}
