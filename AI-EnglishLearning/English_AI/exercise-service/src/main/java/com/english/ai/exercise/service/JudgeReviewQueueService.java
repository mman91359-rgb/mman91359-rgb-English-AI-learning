package com.english.ai.exercise.service;

import com.english.ai.exercise.dto.JudgeReviewEnqueueRequest;

/**
 * 判题审核队列（能力预留，不接入主判题链路）。
 */
public interface JudgeReviewQueueService {

    /**
     * 幂等入队。
     *
     * @return true 表示本次新增，false 表示同一题同一用户的同一答案已存在
     */
    boolean enqueue(JudgeReviewEnqueueRequest request);
}
