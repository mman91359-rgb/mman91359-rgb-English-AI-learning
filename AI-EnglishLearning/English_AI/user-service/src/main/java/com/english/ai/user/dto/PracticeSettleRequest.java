package com.english.ai.user.dto;

import lombok.Data;

/**
 * 练习组结算请求（服务间内部调用）。
 *
 * <p>题数、正确数、难度和由 exercise-service 从答题日志聚合得出，
 * user-service 只负责计分规则，避免两边各自实现一套公式。</p>
 */
@Data
public class PracticeSettleRequest {

    /** 用户ID */
    private Long userId;

    /** 练习组唯一键，幂等依据 */
    private String batchKey;

    /** 模块类型 */
    private Integer moduleType;

    /** 本组总题数 */
    private Integer totalCount;

    /** 本组答对题数 */
    private Integer correctCount;

    /** 本组题目难度等级之和 */
    private Long sumDifficulty;
}
