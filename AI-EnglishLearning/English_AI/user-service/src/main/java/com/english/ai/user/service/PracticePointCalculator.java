package com.english.ai.user.service;

/**
 * 练习积分计算规则（纯函数，无外部依赖，便于单元测试）。
 *
 * <p>规则：</p>
 * <pre>
 *   单题分值 p = 5 × [1 + (难度等级 − 1) × 0.15]       难度 1~8 → 1.00~2.05 倍
 *   本组积分   = round( Σp × 本组正确率 )               正确率 &lt; 60% 直接记 0
 *   每日上限   = 200（约 3 组满分）
 * </pre>
 *
 * <p>题量通过 Σp 的自然累加体现，难度通过难度系数体现，正确率直接作为乘数，
 * 因此「同样正确率下难题更值钱、同样难度下题多分多」无需额外分支。</p>
 */
public final class PracticePointCalculator {

    /** 单题基础分 */
    public static final int BASE_PER_QUESTION = 5;

    /** 每提升一级难度的系数增量 */
    public static final double DIFFICULTY_STEP = 0.15;

    /** 难度等级取值范围 */
    public static final int MIN_DIFFICULTY = 1;
    public static final int MAX_DIFFICULTY = 8;

    /** 计分准入门槛（百分比） */
    public static final double QUALIFY_ACCURACY = 60.0;

    /** 每日积分上限 */
    public static final int DAILY_LIMIT = 200;

    /** 积分总上限，与最高段位上界保持一致 */
    public static final int MAX_POINTS = 10000;

    private PracticePointCalculator() {
    }

    /**
     * 单题分值：5 × [1 + (d − 1) × 0.15]，难度越界时按边界取值。
     */
    public static double questionPoints(int difficulty) {
        int safe = Math.max(MIN_DIFFICULTY, Math.min(MAX_DIFFICULTY, difficulty));
        return BASE_PER_QUESTION * (1 + (safe - 1) * DIFFICULTY_STEP);
    }

    /**
     * 本组题目分值总和。
     *
     * <p>由 Σ5×[1+(d−1)×0.15] 展开为 5n + 0.75×(Σd − n)，
     * 只需总题数与难度之和即可算出，无需逐题回传难度。</p>
     *
     * @param totalCount    本组总题数
     * @param sumDifficulty 本组题目难度等级之和
     */
    public static double sumQuestionPoints(int totalCount, long sumDifficulty) {
        if (totalCount <= 0) {
            return 0;
        }
        return BASE_PER_QUESTION * totalCount
                + (BASE_PER_QUESTION * DIFFICULTY_STEP) * (sumDifficulty - totalCount);
    }

    /**
     * 本组正确率（百分比，保留两位小数）。
     */
    public static double accuracy(int correctCount, int totalCount) {
        if (totalCount <= 0) {
            return 0;
        }
        int safeCorrect = Math.max(0, Math.min(totalCount, correctCount));
        return Math.round(safeCorrect * 10000.0 / totalCount) / 100.0;
    }

    /**
     * 本组应得积分（未扣每日上限）。
     *
     * <p>正确率低于 60% 直接返回 0——该次练习不计入个人能力对应的练习分数。</p>
     */
    public static int settlePoints(int totalCount, long sumDifficulty, int correctCount) {
        if (totalCount <= 0) {
            return 0;
        }
        double acc = accuracy(correctCount, totalCount);
        if (acc < QUALIFY_ACCURACY) {
            return 0;
        }
        double raw = sumQuestionPoints(totalCount, sumDifficulty) * acc / 100.0;
        return (int) Math.round(raw);
    }

    /**
     * 应用每日上限：已用额度越大，实发越少，最低为 0。
     *
     * @param points     本组应得积分
     * @param usedToday  当天已发放积分
     */
    public static int applyDailyLimit(int points, int usedToday) {
        if (points <= 0) {
            return 0;
        }
        int remaining = Math.max(0, DAILY_LIMIT - Math.max(0, usedToday));
        return Math.min(points, remaining);
    }

    /**
     * 累加积分并封顶，保证 practice_points 不超过总上限。
     */
    public static int capTotal(int current, int add) {
        long sum = (long) Math.max(0, current) + Math.max(0, add);
        return (int) Math.min(MAX_POINTS, sum);
    }
}
