package com.english.ai.exercise.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
public class RejectQuestionRequest {

    @NotBlank(message = "驳回意见不能为空")
    private String comment;
}
