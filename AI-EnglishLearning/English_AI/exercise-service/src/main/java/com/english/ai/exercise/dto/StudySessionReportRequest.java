package com.english.ai.exercise.dto;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

/**
 * 学习会话上报请求
 */
@Data
public class StudySessionReportRequest {

    @NotNull(message = "userId不能为空")
    private Long userId;

    @NotBlank(message = "sessionKey不能为空")
    private String sessionKey;

    /** 本会话累计活跃秒数（绝对量，不是增量） */
    @NotNull(message = "activeSeconds不能为空")
    @Min(value = 0, message = "activeSeconds不能为负数")
    private Integer activeSeconds;

    /** 会话开始时间（epoch 毫秒） */
    @NotNull(message = "sessionStartedAt不能为空")
    private Long sessionStartedAt;
}
