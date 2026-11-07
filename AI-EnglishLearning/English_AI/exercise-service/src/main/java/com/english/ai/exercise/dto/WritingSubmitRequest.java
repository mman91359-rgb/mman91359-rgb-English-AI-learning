package com.english.ai.exercise.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

/**
 * 写作提交请求。
 */
@Data
public class WritingSubmitRequest {

    @NotNull(message = "userId不能为空")
    private Long userId;

    /** 题目key（对应前端静态题库 id） */
    @NotBlank(message = "topicKey不能为空")
    private String topicKey;

    /** 题目标题快照 */
    private String topicTitle;

    /** 作文原文 */
    @NotBlank(message = "作文内容不能为空")
    private String content;

    /** 词数 */
    private Integer wordCount;

    /** 答题用时(秒) */
    private Integer durationSeconds;
}
