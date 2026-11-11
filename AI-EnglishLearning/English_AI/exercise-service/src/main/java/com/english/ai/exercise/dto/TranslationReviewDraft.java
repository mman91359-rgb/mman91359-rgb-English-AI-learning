package com.english.ai.exercise.dto;

import lombok.Builder;
import lombok.Data;

import java.math.BigDecimal;

/**
 * 段落翻译灰区的复核草稿。
 *
 * <p>判题引擎只负责产出这份草稿，不直接入队——入队必须等到
 * {@code user_exercise_log} 插入、主键回填之后，才能把 log_id 一起写进队列，
 * 否则复核改判只能按"最近一条作答"猜，用户重做后会改错记录。</p>
 */
@Data
@Builder
public class TranslationReviewDraft {

    /** 入队原因，目前固定 TRANSLATION_LOW_SCORE */
    private String reason;

    /** AI 评分归一化 0~1 */
    private BigDecimal aiConfidence;

    /** AI 结论：CORRECT / PARTIAL / INCORRECT */
    private String aiResult;

    /** 判题上下文快照（模式/分数档位/耗时） */
    private String judgeContext;
}
