package com.english.ai.user.service;

import com.english.ai.user.dto.PracticeSettlementResult;

/**
 * 练习积分服务：模块答题统计累加 + 练习组结算。
 */
public interface PracticePointService {

    /**
     * 答题后累加模块答题计数（正确率的唯一事实来源）。
     *
     * @param moduleType 模块类型: 1词汇 2语法 3翻译 4听力 5造句 6写作 7阅读
     */
    void recordAnswer(Long userId, int moduleType, boolean isCorrect);

    /**
     * 结算一次练习组：幂等、按正确率门槛与每日上限发放积分。
     *
     * @param totalCount    本组总题数
     * @param correctCount  本组答对题数
     * @param sumDifficulty 本组题目难度等级之和
     */
    PracticeSettlementResult settle(Long userId, String batchKey, int moduleType,
                                    int totalCount, int correctCount, long sumDifficulty);

    /** 查询当前累计积分，记录不存在返回 0 */
    int getPoints(Long userId);
}
