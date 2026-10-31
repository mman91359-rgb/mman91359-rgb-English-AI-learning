package com.english.ai.exercise.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
public class AddVocabularyRequest {
    @NotNull(message = "userId不能为空")
    private Long userId;

    @NotBlank(message = "单词不能为空")
    private String word;

    private String translation;

    /** 来源: manual/daily_word/quiz，仅智能添加时使用 */
    private String source;
}
