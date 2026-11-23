package com.english.ai.exercise.dto;

import jakarta.validation.constraints.NotNull;
import lombok.Data;

/**
 * 单词复习结果提交请求
 * 用户在复习模式中标记"记住/没记住"后提交
 */
@Data
public class ReviewResultRequest {

    /** 用户ID */
    @NotNull(message = "userId不能为空")
    private Long userId;

    /** 是否记住：true=记住，false=没记住；兼容旧前端，quality 优先 */
    private Boolean isCorrect;

    /** 复习质量：GOOD(认识)/HARD(模糊)/AGAIN(不认识)；不传时按 isCorrect 推导 */
    private String quality;
}
