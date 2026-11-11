package com.english.ai.exercise.dto;

import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * 判题复核后台列表项：队列字段 + 题干（截断） + 补记状态。
 *
 * <p>题干来自 {@code question_content}（不是 question_info），列表只取前 200 字，
 * 全文与参考译文/用户答案一起放在详情展开区。</p>
 */
@Data
public class JudgeReviewAdminItem {

    /** 队列主键 */
    private Long id;

    /** 题目 ID */
    private Long questionId;

    /** 提交用户 ID */
    private Long userId;

    /** 绑定的答题记录 ID（可能为空） */
    private Long logId;

    /** 题目难度 */
    private Integer difficultyLevel;

    /** 模块类型 */
    private Integer moduleType;

    /** 用户作答原文 */
    private String userAnswer;

    /** 参考答案 */
    private String correctAnswer;

    /** 判题命中层级 */
    private Integer matchedLevel;

    /** AI 评分归一化 0~1（可能为空） */
    private BigDecimal aiConfidence;

    /** AI 结论：CORRECT / PARTIAL / INCORRECT */
    private String aiResult;

    /** 判题上下文快照 */
    private String judgeContext;

    /** 入队原因 */
    private String reason;

    /** 状态：PENDING / REVIEWED / DISMISSED */
    private String status;

    /** 审核人 ID */
    private Long reviewerId;

    /** 审核意见 */
    private String reviewComment;

    /** 题干（来自 question_content，截断 200 字） */
    private String stem;

    /** 遗忘曲线是否已补记 */
    private boolean curveScored;

    /** ELO 是否已补记 */
    private boolean eloScored;

    /** 入队时间 */
    private LocalDateTime createdAt;
}
