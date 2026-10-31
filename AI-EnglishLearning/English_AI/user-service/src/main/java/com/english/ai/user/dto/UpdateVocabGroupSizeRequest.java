package com.english.ai.user.dto;

import lombok.Data;

/**
 * 更新每组单词数量请求
 */
@Data
public class UpdateVocabGroupSizeRequest {

    private Long userId;

    private Integer vocabGroupSize;
}
