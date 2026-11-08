package com.english.ai.exercise.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Data;

/**
 * 判题审核入队请求。
 */
@Data
public class JudgeReviewEnqueueRequest {

    @NotNull(message = "questionId不能为空")
    private Long questionId;

    @NotNull(message = "userId不能为空")
    private Long userId;

    @NotBlank(message = "userAnswer不能为空")
    @Size(max = 500, message = "userAnswer长度不能超过500")
    private String userAnswer;

    @Size(max = 500, message = "correctAnswer长度不能超过500")
    private String correctAnswer;

    /** 判题命中层级，可不传 */
    private Integer matchedLevel;

    /** 入队原因，默认 MANUAL */
    @Size(max = 50, message = "reason长度不能超过50")
    private String reason;
}
