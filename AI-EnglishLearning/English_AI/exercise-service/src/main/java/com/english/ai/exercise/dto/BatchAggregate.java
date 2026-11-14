package com.english.ai.exercise.dto;

import lombok.Data;

/**
 * 练习组答题聚合结果（来自 user_exercise_log 与 question_info）。
 */
@Data
public class BatchAggregate {

    /** 本组总题数 */
    private Integer totalCount;

    /** 本组答对题数 */
    private Integer correctCount;

    /** 本组题目难度等级之和 */
    private Long sumDifficulty;

    /** 本组模块类型（取日志中的最大值，正常一组内应一致） */
    private Integer moduleType;
}
