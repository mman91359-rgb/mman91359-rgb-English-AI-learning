package com.english.ai.user.dto;

import lombok.Data;

/**
 * 只累加模块答题统计的请求（服务间调用）。
 *
 * <p>用于词汇复习等「需要正确率但不应重复发放奖励」的场景，
 * 只更新 user_module_stats 与对应维度正确率，不触碰 ELO。</p>
 */
@Data
public class ModuleStatRequest {

    /** 用户ID */
    private Long userId;

    /** 模块类型: 1词汇 2语法 3翻译 4听力 5造句 6写作 7阅读 */
    private Integer moduleType;

    /** 本次是否答对 */
    private Boolean isCorrect;
}
