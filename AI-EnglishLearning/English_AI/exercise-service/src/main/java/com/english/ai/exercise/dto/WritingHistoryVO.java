package com.english.ai.exercise.dto;

import lombok.Builder;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * 写作历史视图对象 — 数据源 writing_essay
 */
@Data
@Builder
public class WritingHistoryVO {
    private Long id;
    private Long userId;
    /** 题目 key */
    private String topicKey;
    /** 题目标题快照 */
    private String topicTitle;
    /** 词数 */
    private Integer wordCount;
    /** 用时（秒） */
    private Integer durationSeconds;
    /** AI 是否已评分: 1=已评分 0=未评分 */
    private Integer aiScored;
    /** 原始分（满分 15） */
    private BigDecimal rawScore;
    /** 百分制折算分 */
    private BigDecimal weightedScore;
    private LocalDateTime createdAt;
}
