package com.english.ai.exercise.dto;

import lombok.Data;

/**
 * 判题复核后台列表查询参数。
 *
 * <p>对齐 {@link AdminQuestionQuery} 的分页风格，前端通过 query string 传参。</p>
 */
@Data
public class JudgeReviewAdminQuery {

    /** 复核状态：PENDING / REVIEWED（默认 PENDING） */
    private String status = "PENDING";

    /** 入队原因：MANUAL / MISMATCH / AI_LOW_CONFIDENCE / TRANSLATION_LOW_SCORE */
    private String reason;

    /** 题目 ID（精确筛选） */
    private Long questionId;

    /** 页码，从 1 开始 */
    private int page = 1;

    /** 每页条数 */
    private int size = 20;
}
