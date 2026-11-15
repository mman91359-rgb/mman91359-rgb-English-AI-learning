package com.english.ai.exercise.dto;

import lombok.Data;

/**
 * user-service 偏好响应的本地镜像，避免跨模块依赖
 */
@Data
public class PreferenceResult {

    private Long userId;

    private Integer vocabGroupSize;

    private Boolean configured;

    private Integer minGroupSize;

    private Integer maxGroupSize;

    /** 当前选中的词书ID（关联 exercise_db.word_book.id），null 表示未选 */
    private Long activeWordBookId;

    /** 每日新背单词数 */
    private Integer dailyNewWords;

    /** 每日复习单词数 */
    private Integer dailyReviewWords;

    /** 新词队列是否并行收藏词：true = 收藏词优先于词书词 */
    private Boolean includeFavoriteWords;
}
