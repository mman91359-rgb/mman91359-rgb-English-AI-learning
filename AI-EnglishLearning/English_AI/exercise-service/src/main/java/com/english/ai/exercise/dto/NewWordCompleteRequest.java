package com.english.ai.exercise.dto;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

import java.util.List;

/**
 * 新学整组完成请求：A/B 阶段全部走完后，把每组词的最终通过结果收口到后端排期。
 */
@Data
public class NewWordCompleteRequest {

    @NotEmpty(message = "items不能为空")
    private List<Item> items;

    @Data
    public static class Item {

        @NotNull(message = "wordId不能为空")
        private Long wordId;

        /** 是否通过（A 词义识别连对 + B 句子填词填对） */
        @NotNull(message = "passed不能为空")
        private Boolean passed;
    }
}
