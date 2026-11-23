package com.english.ai.exercise.util;

import com.english.ai.exercise.entity.UserVocabulary;

import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * SM-2 简化版复习排期算法。
 *
 * <p>参考不背单词的动态间隔思路（SuperMemo SM-2 族）：
 * 每个词维护连续成功复习次数 n、难度因子 EF、当前间隔 I；复习质量三档
 * GOOD(认识)/HARD(模糊)/AGAIN(不认识) 映射 q = 5/3/1。</p>
 *
 * <ul>
 *   <li>答对：I = round(I × EF)，EF 微增（上限 3.00）</li>
 *   <li>答错：n 归零、I=1、EF 下降（下限 1.30）</li>
 * </ul>
 */
public final class Sm2Scheduler {

    /** 难度因子初始值 */
    public static final BigDecimal INITIAL_EASE_FACTOR = new BigDecimal("2.50");

    /** 难度因子下限（防止降得太低导致永不长间隔） */
    public static final BigDecimal MIN_EASE_FACTOR = new BigDecimal("1.30");

    /** 难度因子上限（防止间隔爆炸） */
    public static final BigDecimal MAX_EASE_FACTOR = new BigDecimal("3.00");

    /** 间隔天数上限 */
    public static final int MAX_INTERVAL_DAYS = 180;

    /** 首次复习间隔（天） */
    public static final int FIRST_INTERVAL_DAYS = 1;

    /** 第二次复习间隔（天） */
    public static final int SECOND_INTERVAL_DAYS = 6;

    private Sm2Scheduler() {
    }

    /**
     * 解析复习质量并转成 SM-2 q 值。
     * 优先取 quality（GOOD/HARD/AGAIN），未传时按 isCorrect 推导（对=5、错=1）。
     */
    public static int resolveQuality(String quality, Boolean isCorrect) {
        if (quality != null && !quality.isBlank()) {
            return qualityValue(quality);
        }
        return Boolean.TRUE.equals(isCorrect) ? 5 : 1;
    }

    /** 质量档位转 q 值：GOOD=5 / HARD=3 / AGAIN=1，非法值按 AGAIN 处理 */
    public static int qualityValue(String quality) {
        if (quality == null) {
            return 1;
        }
        return switch (quality.trim().toUpperCase()) {
            case "GOOD" -> 5;
            case "HARD" -> 3;
            case "AGAIN" -> 1;
            default -> 1;
        };
    }

    /**
     * 新学完成（词义识别连对 + 句子填词通过）时初始化排期。
     * n=0、EF=2.50、I=1，次日首次复习。
     */
    public static void initNewLearned(UserVocabulary v, LocalDateTime now) {
        v.setRepetition(0);
        v.setEaseFactor(INITIAL_EASE_FACTOR);
        v.setIntervalDays(FIRST_INTERVAL_DAYS);
        v.setNextReviewAt(now.plusDays(FIRST_INTERVAL_DAYS));
    }

    /**
     * 复习一次后按 q 更新排期。
     *
     * @param q SM-2 质量值：5=GOOD / 3=HARD / 1=AGAIN
     */
    public static void schedule(UserVocabulary v, int q, LocalDateTime now) {
        int n = v.getRepetition() == null ? 0 : v.getRepetition();
        BigDecimal ef = v.getEaseFactor() == null ? INITIAL_EASE_FACTOR : v.getEaseFactor();
        int interval = v.getIntervalDays() == null ? 0 : v.getIntervalDays();

        if (q < 3) {
            // 失败：连对次数归零，间隔回 1 天，难度因子下降
            v.setRepetition(0);
            v.setEaseFactor(max(MIN_EASE_FACTOR, ef.subtract(new BigDecimal("0.20"))));
            v.setIntervalDays(FIRST_INTERVAL_DAYS);
        } else {
            // 成功：间隔按 EF 放大
            int newInterval;
            if (n == 0) {
                newInterval = FIRST_INTERVAL_DAYS;
            } else if (n == 1) {
                newInterval = SECOND_INTERVAL_DAYS;
            } else {
                long raw = Math.round(interval * ef.doubleValue());
                newInterval = (int) Math.min(MAX_INTERVAL_DAYS, Math.max(1, raw));
            }
            v.setIntervalDays(newInterval);
            // GOOD 且非首次成功才微增 EF；首次成功保持初始 2.50
            if (q == 5 && n > 0) {
                v.setEaseFactor(min(MAX_EASE_FACTOR, ef.add(new BigDecimal("0.10"))));
            } else {
                v.setEaseFactor(ef);
            }
            v.setRepetition(n + 1);
        }
        v.setNextReviewAt(now.plusDays(v.getIntervalDays()));
    }

    private static BigDecimal max(BigDecimal a, BigDecimal b) {
        return a.compareTo(b) >= 0 ? a : b;
    }

    private static BigDecimal min(BigDecimal a, BigDecimal b) {
        return a.compareTo(b) <= 0 ? a : b;
    }
}
