package com.english.ai.exercise.dto;

import lombok.Data;

/**
 * 学习会话上报请求
 */
@Data
public class StudySessionReportRequest {

    private Long userId;

    private String sessionKey;

    /** 本会话累计活跃秒数（绝对量，不是增量） */
    private Integer activeSeconds;

    /** 会话开始时间（epoch 毫秒） */
    private Long sessionStartedAt;
}
