package com.english.ai.user.dto;

import lombok.Data;

/**
 * 更新每日词汇目标请求
 */
@Data
public class UpdateVocabularyGoalsRequest {

    private Long userId;

    /** 每日新背单词数（1-50） */
    private Integer dailyNewWords;

    /** 每日复习单词数（0-50） */
    private Integer dailyReviewWords;
}
