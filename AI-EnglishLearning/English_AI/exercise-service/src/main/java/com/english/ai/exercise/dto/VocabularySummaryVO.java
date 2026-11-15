package com.english.ai.exercise.dto;

import lombok.Builder;
import lombok.Data;

/**
 * 词汇量汇总 — 统计页「个人词汇量」组件用
 */
@Data
@Builder
public class VocabularySummaryVO {

    /** 已学词总数（user_vocabulary 全量） */
    private Integer total;

    /** 复习中（LEARNING + REVIEWING） */
    private Integer learning;

    /** 复习完成（MASTERED，is_mastered=1） */
    private Integer mastered;

    /** 已标熟（FAMILIAR） */
    private Integer familiar;

    /** 今日待复习（next_review_at <= now 且非标熟） */
    private Integer dueReview;
}
