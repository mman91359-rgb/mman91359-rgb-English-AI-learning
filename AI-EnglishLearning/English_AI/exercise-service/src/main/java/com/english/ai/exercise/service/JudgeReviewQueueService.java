package com.english.ai.exercise.service;

import com.english.ai.exercise.dto.JudgeReviewEnqueueRequest;
import com.english.ai.exercise.dto.JudgeReviewResolveRequest;

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

    /**
     * 审核结论落地。
     *
     * <p>PASS 只更新队列状态；FAIL 额外把该用户该题最近一次作答改为错，并写回错题本。
     * 只有 PENDING 的记录可以被处理，重复调用返回 false（幂等）。</p>
     *
     * @return true 表示本次处理成功，false 表示记录不存在或已被处理
     */
    boolean resolve(JudgeReviewResolveRequest request);
}
