package com.english.ai.exercise.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
public class AddFavoriteRequest {
    @NotNull(message = "userId不能为空")
    private Long userId;

    @NotBlank(message = "收藏句子不能为空")
    private String sentenceText;

    private Long questionId;

    /** 模块类型，仅收藏"纯句子"(questionId 为空)时使用；有 questionId 时由后端按题目派生 */
    private Integer moduleType;
}
