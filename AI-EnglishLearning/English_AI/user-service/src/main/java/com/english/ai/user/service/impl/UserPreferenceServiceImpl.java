package com.english.ai.user.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.english.ai.user.dto.PreferenceResponse;
import com.english.ai.user.entity.SysUser;
import com.english.ai.user.entity.UserPreference;
import com.english.ai.user.mapper.UserMapper;
import com.english.ai.user.mapper.UserPreferenceMapper;
import com.english.ai.user.service.UserPreferenceService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;

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

    public static final int MIN_TARGET_SCORE = 425;
    public static final int MAX_TARGET_SCORE = 710;

    private final UserPreferenceMapper preferenceMapper;
    private final UserMapper userMapper;

    @Override
    public PreferenceResponse get(Long userId) {
        return buildResponse(userId, selectByUserId(userId));
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
        return buildResponse(userId, preference);
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
        return buildResponse(userId, preference);
    }

    @Override
    @Transactional
    public PreferenceResponse updateActiveWordBook(Long userId, Long activeWordBookId) {
        if (userId == null || userMapper.selectById(userId) == null) {
            throw new IllegalArgumentException("用户不存在");
        }
        if (activeWordBookId == null) {
            throw new IllegalArgumentException("词书ID不能为空");
        }

        UserPreference preference = selectByUserId(userId);
        if (preference == null) {
            preference = new UserPreference();
            preference.setUserId(userId);
            preference.setActiveWordBookId(activeWordBookId);
            preferenceMapper.insert(preference);
        } else {
            preference.setActiveWordBookId(activeWordBookId);
            preferenceMapper.updateById(preference);
        }

        log.info("更新当前词书: userId={}, activeWordBookId={}", userId, activeWordBookId);
        return buildResponse(userId, preference);
    }

    @Override
    @Transactional
    public PreferenceResponse updateIncludeFavoriteWords(Long userId, Boolean includeFavoriteWords) {
        if (userId == null || userMapper.selectById(userId) == null) {
            throw new IllegalArgumentException("用户不存在");
        }
        if (includeFavoriteWords == null) {
            throw new IllegalArgumentException("收藏词并行开关不能为空");
        }

        UserPreference preference = selectByUserId(userId);
        if (preference == null) {
            preference = new UserPreference();
            preference.setUserId(userId);
            preference.setIncludeFavoriteWords(includeFavoriteWords);
            preferenceMapper.insert(preference);
        } else {
            preference.setIncludeFavoriteWords(includeFavoriteWords);
            preferenceMapper.updateById(preference);
        }

        log.info("更新收藏词并行开关: userId={}, includeFavoriteWords={}", userId, includeFavoriteWords);
        return buildResponse(userId, preference);
    }

    @Override
    @Transactional
    public PreferenceResponse updateExamGoal(Long userId, LocalDate examDate, Integer targetScore, String cetLevel) {
        SysUser user = userId == null ? null : userMapper.selectById(userId);
        if (user == null) {
            throw new IllegalArgumentException("用户不存在");
        }
        if (examDate == null) {
            throw new IllegalArgumentException("考试日期不能为空");
        }
        if (targetScore == null || targetScore < MIN_TARGET_SCORE || targetScore > MAX_TARGET_SCORE) {
            throw new IllegalArgumentException("目标分需在 " + MIN_TARGET_SCORE + "-" + MAX_TARGET_SCORE + " 之间");
        }
        if (!"CET4".equals(cetLevel) && !"CET6".equals(cetLevel)) {
            throw new IllegalArgumentException("考试等级只能是 CET4 或 CET6");
        }

        UserPreference preference = selectByUserId(userId);
        if (preference == null) {
            preference = new UserPreference();
            preference.setUserId(userId);
            preference.setExamDate(examDate);
            preference.setTargetScore(targetScore);
            preferenceMapper.insert(preference);
        } else {
            preference.setExamDate(examDate);
            preference.setTargetScore(targetScore);
            preferenceMapper.updateById(preference);
        }

        // 考试等级回写 sys_user：只更新 cet_level 一个字段，避免整行覆盖丢数据。
        if (!cetLevel.equals(user.getCetLevel())) {
            SysUser patch = new SysUser();
            patch.setId(userId);
            patch.setCetLevel(cetLevel);
            userMapper.updateById(patch);
        }

        log.info("更新备考目标: userId={}, examDate={}, targetScore={}, cetLevel={}",
                userId, examDate, targetScore, cetLevel);
        return buildResponse(userId, preference);
    }

    private UserPreference selectByUserId(Long userId) {
        if (userId == null) {
            return null;
        }
        return preferenceMapper.selectOne(
                new LambdaQueryWrapper<UserPreference>().eq(UserPreference::getUserId, userId));
    }

    private PreferenceResponse buildResponse(Long userId, UserPreference preference) {
        Integer groupSize = preference != null ? preference.getVocabGroupSize() : null;
        Integer dailyNewWords = preference != null ? preference.getDailyNewWords() : null;
        Integer dailyReviewWords = preference != null ? preference.getDailyReviewWords() : null;
        Long activeWordBookId = preference != null ? preference.getActiveWordBookId() : null;
        Boolean includeFavoriteWords = preference != null
                && Boolean.TRUE.equals(preference.getIncludeFavoriteWords());
        LocalDate examDate = preference != null ? preference.getExamDate() : null;
        Integer targetScore = preference != null ? preference.getTargetScore() : null;
        return PreferenceResponse.builder()
                .userId(userId)
                .vocabGroupSize(groupSize)
                .configured(groupSize != null)
                .minGroupSize(MIN_GROUP_SIZE)
                .maxGroupSize(MAX_GROUP_SIZE)
                .dailyNewWords(dailyNewWords)
                .dailyReviewWords(dailyReviewWords)
                .activeWordBookId(activeWordBookId)
                .includeFavoriteWords(includeFavoriteWords)
                .vocabularyGoalsConfigured(dailyNewWords != null && dailyReviewWords != null)
                .minDailyNewWords(MIN_DAILY_NEW_WORDS)
                .maxDailyNewWords(MAX_DAILY_NEW_WORDS)
                .minDailyReviewWords(MIN_DAILY_REVIEW_WORDS)
                .maxDailyReviewWords(MAX_DAILY_REVIEW_WORDS)
                .examDate(examDate)
                .targetScore(targetScore)
                .examGoalConfigured(examDate != null && targetScore != null)
                .build();
    }
}
