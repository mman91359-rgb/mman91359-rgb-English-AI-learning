package com.english.ai.user.dto;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

/**
 * 更新每组单词数量请求
 */
@Data
public class UpdateVocabGroupSizeRequest {

    @NotNull(message = "userId不能为空")
    private Long userId;

    @NotNull(message = "每组单词数不能为空")
    @Min(value = 5, message = "每组单词数不能小于5")
    @Max(value = 50, message = "每组单词数不能大于50")
    private Integer vocabGroupSize;
}
