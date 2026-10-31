package com.english.ai.exercise.service;

/**
 * 词汇组完成判定：今日答题数刚好达到组大小的整数倍时视为完成一组。
 * 抽成纯函数便于单元测试。
 */
public final class VocabGroupAwardPolicy {

    private VocabGroupAwardPolicy() {
    }

    /**
     * @return 完成第几组（从 1 开始）；未完成一组返回 -1
     */
    public static int completedGroupIndex(long answeredCount, int groupSize) {
        if (answeredCount <= 0 || groupSize <= 0) {
            return -1;
        }
        if (answeredCount % groupSize != 0) {
            return -1;
        }
        return (int) (answeredCount / groupSize);
    }

    /**
     * 当前答题数对应的组序号（向下取整），用于失败重试。
     * 例如每组 10 个，答了 11 个仍返回 1，下一次提交可重试第 1 组奖励。
     */
    public static int currentGroupIndex(long answeredCount, int groupSize) {
        if (answeredCount <= 0 || groupSize <= 0) {
            return 0;
        }
        return (int) (answeredCount / groupSize);
    }
}
