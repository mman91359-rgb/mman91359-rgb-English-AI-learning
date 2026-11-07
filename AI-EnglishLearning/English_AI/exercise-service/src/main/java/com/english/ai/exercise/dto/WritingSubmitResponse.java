package com.english.ai.exercise.dto;

import lombok.Data;

import java.time.LocalDateTime;

/**
 * 写作提交响应：作文已落库，若 AI 评分成功则附带评分结果，失败则标记未评分可重评。
 */
@Data
public class WritingSubmitResponse {

    /** 作文记录ID */
    private Long essayId;

    /** 题目key */
    private String topicKey;

    /** 作文原文 */
    private String content;

    /** 词数 */
    private Integer wordCount;

    /** AI是否已评分: true=已评分, false=未评分(降级) */
    private Boolean aiScored;

    /** 评分结果（AI 已评分时非空） */
    private WritingScoreDTO score;

    /** 提交时间 */
    private LocalDateTime createdAt;

    /** 降级提示文案（AI 未评分时给出） */
    private String message;
}
