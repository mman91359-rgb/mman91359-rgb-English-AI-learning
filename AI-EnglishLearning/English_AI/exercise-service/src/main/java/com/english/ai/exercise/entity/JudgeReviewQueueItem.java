package com.english.ai.exercise.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 判题审核队列条目（V1.0.27）。
 *
 * <p>仅作能力预留：判题引擎不读写本表，入队由调用方显式触发。</p>
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

    /** 用户作答原文 */
    private String userAnswer;

    /** 参考答案 */
    private String correctAnswer;

    /** 判题命中层级，见 JudgmentLevel */
    private Integer matchedLevel;

    /** 入队原因：MANUAL / MISMATCH / AI_LOW_CONFIDENCE */
    private String reason;

    /** 状态：PENDING / REVIEWED / DISMISSED */
    private String status;

    /** 审核人ID */
    private Long reviewerId;

    /** 审核意见 */
    private String reviewComment;

    private LocalDateTime createdAt;

    private LocalDateTime updatedAt;
}
