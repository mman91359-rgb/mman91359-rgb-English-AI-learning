package com.english.ai.exercise.dto;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

/**
 * 提交答案请求
 */
@Data
public class SubmitRequest {

    /** 用户ID */
    @NotNull(message = "userId不能为空")
    private Long userId;

    /** 题目ID */
    @NotNull(message = "questionId不能为空")
    private Long questionId;

    /** 用户答案 */
    @NotBlank(message = "答案不能为空")
    private String userAnswer;

    /** 答题用时(秒) */
    @Min(value = 0, message = "答题用时不能为负数")
    private Integer durationSeconds;

    /** 模块类型 */
    private Integer moduleType;

    /** 仅练习：只判题，不写答题记录、不更新 ELO/遗忘曲线/金币 */
    private Boolean practiceOnly;
}
