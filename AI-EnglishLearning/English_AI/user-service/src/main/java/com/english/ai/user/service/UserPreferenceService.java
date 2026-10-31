package com.english.ai.user.service;

import com.english.ai.user.dto.PreferenceResponse;

/**
 * 用户学习偏好服务
 */
public interface UserPreferenceService {

    /** 查询偏好，未设置时返回 configured=false */
    PreferenceResponse get(Long userId);

    /** 更新每组单词数量（5-50） */
    PreferenceResponse updateVocabGroupSize(Long userId, Integer vocabGroupSize);

    /** 更新每日新背/复习单词目标 */
    PreferenceResponse updateVocabularyGoals(Long userId, Integer dailyNewWords, Integer dailyReviewWords);
}
