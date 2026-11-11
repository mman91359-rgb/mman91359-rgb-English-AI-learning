package com.english.ai.exercise.dto;

/**
 * 段落翻译 AI 评分结果（CET 15 分制）。
 *
 * @param rawScore    得分
 * @param maxRawScore 满分（通常 15）
 * @param level       EXCELLENT / GOOD / PASS / NEEDS_WORK / POOR
 * @param comment     AI 点评
 */
public record TranslationScore(int rawScore, int maxRawScore, String level, String comment) {

    /** 归一化到 0~1，用于入库 ai_confidence */
    public double ratio() {
        return maxRawScore > 0 ? (double) rawScore / maxRawScore : 0d;
    }
}
