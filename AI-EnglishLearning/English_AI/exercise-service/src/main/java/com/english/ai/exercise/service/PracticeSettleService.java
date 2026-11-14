package com.english.ai.exercise.service;

import com.english.ai.exercise.dto.PracticeSettleResponse;

/**
 * 练习组积分结算服务。
 */
public interface PracticeSettleService {

    /**
     * 按练习组键聚合本次练习并结算积分。
     *
     * <p>题数与正确数一律取自服务端答题日志，前端只提供分组键，无法伪造得分。</p>
     */
    PracticeSettleResponse settle(Long userId, String batchKey);
}
