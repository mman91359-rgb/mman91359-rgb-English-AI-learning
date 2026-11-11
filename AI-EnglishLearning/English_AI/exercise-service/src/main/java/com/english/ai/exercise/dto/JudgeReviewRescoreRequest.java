package com.english.ai.exercise.dto;

import jakarta.validation.constraints.NotNull;
import lombok.Data;

/**
 * 补记重试请求：只补该审核记录尚未完成的 ELO / 遗忘曲线。
 */
@Data
public class JudgeReviewRescoreRequest {

    @NotNull(message = "reviewId不能为空")
    private Long reviewId;
}
