package com.english.ai.user.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 用户学习偏好响应
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PreferenceResponse {

    private Long userId;

    /** 每组单词数量，null 表示尚未设置 */
    private Integer vocabGroupSize;

    /** 是否已完成每组数量设置 */
    private Boolean configured;

    private Integer minGroupSize;

    private Integer maxGroupSize;

    /** 每日新背单词数，null 表示尚未设置 */
    private Integer dailyNewWords;

    /** 每日复习单词数，null 表示尚未设置 */
    private Integer dailyReviewWords;

    /** 当前选中的词书ID（关联 exercise_db.word_book.id），null 表示未选 */
    private Long activeWordBookId;

    /** 新词队列是否并行收藏词：true = 收藏词优先于词书词；null 表示未设置，按关闭处理 */
    private Boolean includeFavoriteWords;

    /** 每日新背/复习目标是否都已设置 */
    private Boolean vocabularyGoalsConfigured;

    private Integer minDailyNewWords;

    private Integer maxDailyNewWords;

    private Integer minDailyReviewWords;

    private Integer maxDailyReviewWords;
}
