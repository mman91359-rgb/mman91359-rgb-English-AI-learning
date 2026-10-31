package com.english.ai.exercise.dto;

import lombok.Builder;
import lombok.Data;

/**
 * 听力答题统计。
 */
@Data
@Builder
public class ListeningStats {

    /** 累计答题数 */
    private Integer totalAnswered;

    /** 答对数 */
    private Integer correctCount;

    /** 正确率（0~100，保留一位小数） */
    private Double correctRate;
}
