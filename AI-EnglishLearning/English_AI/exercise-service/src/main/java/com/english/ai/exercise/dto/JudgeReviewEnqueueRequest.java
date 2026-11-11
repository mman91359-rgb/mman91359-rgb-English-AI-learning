package com.english.ai.exercise.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Data;

/**
 * 判题审核入队请求。
 */
@Data
public class JudgeReviewEnqueueRequest {

    @NotNull(message = "questionId不能为空")
    private Long questionId;

    @NotNull(message = "userId不能为空")
    private Long userId;

    /** 绑定的答题记录ID，灰区入队时必带；人工入队可为空 */
    private Long logId;

    /** 题目难度：复核后补记 ELO 用 */
    private Integer difficultyLevel;

    /** 模块类型：复核后补记遗忘曲线用 */
    private Integer moduleType;

    /** 段落翻译是整段作答，长度上限放到 2000（V1.0.42 同步放宽列宽） */
    @NotBlank(message = "userAnswer不能为空")
    @Size(max = 2000, message = "userAnswer长度不能超过2000")
    private String userAnswer;

    @Size(max = 2000, message = "correctAnswer长度不能超过2000")
    private String correctAnswer;

    /** 判题命中层级，可不传 */
    private Integer matchedLevel;

    /** 入队原因，默认 MANUAL；段落翻译灰区为 TRANSLATION_LOW_SCORE */
    @Size(max = 50, message = "reason长度不能超过50")
    private String reason;

    /** AI 评分归一化 0~1，可不传 */
    private java.math.BigDecimal aiConfidence;

    /** AI 结论：CORRECT / PARTIAL / INCORRECT，可不传 */
    @Size(max = 20, message = "aiResult长度不能超过20")
    private String aiResult;

    /** 判题上下文快照，可不传 */
    @Size(max = 1000, message = "judgeContext长度不能超过1000")
    private String judgeContext;
}
