package com.english.ai.user.dto;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

/**
 * 更新每日词汇目标请求
 */
@Data
public class UpdateVocabularyGoalsRequest {

    @NotNull(message = "userId不能为空")
    private Long userId;

    /** 每日新背单词数（1-50） */
    @NotNull(message = "每日新背单词数不能为空")
    @Min(value = 1, message = "每日新背单词数不能小于1")
    @Max(value = 50, message = "每日新背单词数不能大于50")
    private Integer dailyNewWords;

    /** 每日复习单词数（0-50） */
    @NotNull(message = "每日复习单词数不能为空")
    @Min(value = 0, message = "每日复习单词数不能小于0")
    @Max(value = 50, message = "每日复习单词数不能大于50")
    private Integer dailyReviewWords;
}
