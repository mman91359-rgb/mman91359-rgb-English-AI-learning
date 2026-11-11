package com.english.ai.exercise.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 判题审核队列条目（V1.0.27 建表，V1.0.41 补 AI 评分三列）。
 *
 * <p>段落翻译灰区会由判题引擎异步写入本表（reason=TRANSLATION_LOW_SCORE）；
 * 其余场景仍由调用方显式触发。</p>
 */
@Data
@TableName("judge_review_queue")
public class JudgeReviewQueueItem {

    @TableId(type = IdType.AUTO)
    private Long id;

    /** 题目ID */
    private Long questionId;

    /** 提交用户ID */
    private Long userId;

    /** 绑定的答题记录ID（user_exercise_log.id），复核改判按它精确到单次作答 */
    private Long logId;

    /** 题目难度：复核后补记 ELO 用 */
    private Integer difficultyLevel;

    /** 模块类型：复核后补记遗忘曲线用 */
    private Integer moduleType;

    /** 用户作答原文 */
    private String userAnswer;

    /** 参考答案 */
    private String correctAnswer;

    /** 判题命中层级，见 JudgmentLevel */
    private Integer matchedLevel;

    /** AI 评分归一化 0.000~1.000（rawScore / maxScore），人工入队时为 null */
    private java.math.BigDecimal aiConfidence;

    /** AI 结论：CORRECT / PARTIAL / INCORRECT */
    private String aiResult;

    /** 判题上下文快照（模式/分数档位/耗时等） */
    private String judgeContext;

    /** 入队原因：MANUAL / MISMATCH / AI_LOW_CONFIDENCE / TRANSLATION_LOW_SCORE */
    private String reason;

    /** 状态：PENDING / REVIEWED / DISMISSED */
    private String status;

    /** 审核人ID */
    private Long reviewerId;

    /** 审核意见 */
    private String reviewComment;

    /** 遗忘曲线补记成功时间；NULL 表示未补记（灰区提交时不记，复核后补） */
    private LocalDateTime curveScoredAt;

    /** 遗忘曲线补记租约到期时间；未到期表示有实例正在补，别抢 */
    private LocalDateTime curveLeaseUntil;

    /** ELO 补记成功时间；NULL 表示未补记 */
    private LocalDateTime eloScoredAt;

    /** ELO 补记租约到期时间 */
    private LocalDateTime eloLeaseUntil;

    private LocalDateTime createdAt;

    private LocalDateTime updatedAt;
}
