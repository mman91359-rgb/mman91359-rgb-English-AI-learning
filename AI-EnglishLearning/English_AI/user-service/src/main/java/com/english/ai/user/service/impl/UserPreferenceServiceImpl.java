package com.english.ai.user.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.english.ai.user.dto.PreferenceResponse;
import com.english.ai.user.entity.UserPreference;
import com.english.ai.user.mapper.UserMapper;
import com.english.ai.user.mapper.UserPreferenceMapper;
import com.english.ai.user.service.UserPreferenceService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 用户学习偏好实现
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class UserPreferenceServiceImpl implements UserPreferenceService {

    public static final int MIN_GROUP_SIZE = 5;
    public static final int MAX_GROUP_SIZE = 50;

    public static final int MIN_DAILY_NEW_WORDS = 1;
    public static final int MAX_DAILY_NEW_WORDS = 50;
    public static final int MIN_DAILY_REVIEW_WORDS = 0;
    public static final int MAX_DAILY_REVIEW_WORDS = 50;

    private final UserPreferenceMapper preferenceMapper;
    private final UserMapper userMapper;

    @Override
    public PreferenceResponse get(Long userId) {
        UserPreference preference = selectByUserId(userId);
        Integer groupSize = preference != null ? preference.getVocabGroupSize() : null;
        Integer dailyNewWords = preference != null ? preference.getDailyNewWords() : null;
        Integer dailyReviewWords = preference != null ? preference.getDailyReviewWords() : null;
        return buildResponse(userId, groupSize, dailyNewWords, dailyReviewWords);
    }

    @Override
    @Transactional
    public PreferenceResponse updateVocabGroupSize(Long userId, Integer vocabGroupSize) {
        if (userId == null || userMapper.selectById(userId) == null) {
            throw new IllegalArgumentException("用户不存在");
        }
        if (vocabGroupSize == null
                || vocabGroupSize < MIN_GROUP_SIZE
                || vocabGroupSize > MAX_GROUP_SIZE) {
            throw new IllegalArgumentException("每组单词数量需在 " + MIN_GROUP_SIZE + "-" + MAX_GROUP_SIZE + " 之间");
        }

        UserPreference preference = selectByUserId(userId);
        if (preference == null) {
            preference = new UserPreference();
            preference.setUserId(userId);
            preference.setVocabGroupSize(vocabGroupSize);
            preferenceMapper.insert(preference);
        } else {
            preference.setVocabGroupSize(vocabGroupSize);
            preferenceMapper.updateById(preference);
        }

        log.info("更新每组单词数量: userId={}, size={}", userId, vocabGroupSize);
        return buildResponse(userId, vocabGroupSize,
                preference.getDailyNewWords(), preference.getDailyReviewWords());
    }

    @Override
    @Transactional
    public PreferenceResponse updateVocabularyGoals(Long userId, Integer dailyNewWords, Integer dailyReviewWords) {
        if (userId == null || userMapper.selectById(userId) == null) {
            throw new IllegalArgumentException("用户不存在");
        }
        if (dailyNewWords == null
                || dailyNewWords < MIN_DAILY_NEW_WORDS
                || dailyNewWords > MAX_DAILY_NEW_WORDS) {
            throw new IllegalArgumentException("每日新背单词数需在 "
                    + MIN_DAILY_NEW_WORDS + "-" + MAX_DAILY_NEW_WORDS + " 之间");
        }
        if (dailyReviewWords == null
                || dailyReviewWords < MIN_DAILY_REVIEW_WORDS
                || dailyReviewWords > MAX_DAILY_REVIEW_WORDS) {
            throw new IllegalArgumentException("每日复习单词数需在 "
                    + MIN_DAILY_REVIEW_WORDS + "-" + MAX_DAILY_REVIEW_WORDS + " 之间");
        }

        UserPreference preference = selectByUserId(userId);
        if (preference == null) {
            preference = new UserPreference();
            preference.setUserId(userId);
            preference.setDailyNewWords(dailyNewWords);
            preference.setDailyReviewWords(dailyReviewWords);
            preferenceMapper.insert(preference);
        } else {
            preference.setDailyNewWords(dailyNewWords);
            preference.setDailyReviewWords(dailyReviewWords);
            preferenceMapper.updateById(preference);
        }

        log.info("更新每日词汇目标: userId={}, newWords={}, reviewWords={}",
                userId, dailyNewWords, dailyReviewWords);
        return buildResponse(userId, preference.getVocabGroupSize(), dailyNewWords, dailyReviewWords);
    }

    private UserPreference selectByUserId(Long userId) {
        if (userId == null) {
            return null;
        }
        return preferenceMapper.selectOne(
                new LambdaQueryWrapper<UserPreference>().eq(UserPreference::getUserId, userId));
    }

    private PreferenceResponse buildResponse(Long userId, Integer groupSize,
                                             Integer dailyNewWords, Integer dailyReviewWords) {
        return PreferenceResponse.builder()
                .userId(userId)
                .vocabGroupSize(groupSize)
                .configured(groupSize != null)
                .minGroupSize(MIN_GROUP_SIZE)
                .maxGroupSize(MAX_GROUP_SIZE)
                .dailyNewWords(dailyNewWords)
                .dailyReviewWords(dailyReviewWords)
                .vocabularyGoalsConfigured(dailyNewWords != null && dailyReviewWords != null)
                .minDailyNewWords(MIN_DAILY_NEW_WORDS)
                .maxDailyNewWords(MAX_DAILY_NEW_WORDS)
                .minDailyReviewWords(MIN_DAILY_REVIEW_WORDS)
                .maxDailyReviewWords(MAX_DAILY_REVIEW_WORDS)
                .build();
    }
}
