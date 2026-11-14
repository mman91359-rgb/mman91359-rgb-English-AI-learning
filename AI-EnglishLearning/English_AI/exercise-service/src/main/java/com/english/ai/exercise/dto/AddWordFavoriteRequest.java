package com.english.ai.exercise.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

/**
 * 收藏单词请求
 */
@Data
public class AddWordFavoriteRequest {

    @NotNull(message = "userId不能为空")
    private Long userId;

    @NotBlank(message = "word不能为空")
    private String word;
}
