package com.english.ai.exercise.dto;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
public class GenerateQuestionsRequest {

    @NotBlank(message = "知识点不能为空")
    private String knowledgePoint;

    private String cetLevel = "CET4";

    @Min(value = 1, message = "难度范围 1~8")
    @Max(value = 8, message = "难度范围 1~8")
    private Integer difficulty = 3;

    private String questionType = "FILL_BLANK";

    @Min(value = 1, message = "数量范围 1~20")
    @Max(value = 20, message = "数量范围 1~20")
    private Integer count = 5;
}
