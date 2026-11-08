package com.english.ai.user.dto;

import lombok.Data;

/**
 * 按百分制分值更新模块维度分的请求（内部调用，供写作评分回写等场景）。
 */
@Data
public class ModuleScoreUpdateRequest {

    /** 用户ID */
    private Long userId;

    /** 模块类型: 1=词汇, 2=语法, 3=翻译, 4=听力, 5=造句, 6=写作, 7=阅读 */
    private Integer moduleType;

    /** 本次得分率折算到 0~100，超出范围由服务端截断 */
    private Double score;
}
