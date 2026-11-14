package com.english.ai.exercise.dto;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

/**
 * 提交答案请求
 */
@Data
public class SubmitRequest {

    /** 用户ID */
    @NotNull(message = "userId不能为空")
    private Long userId;

    /** 题目ID */
    @NotNull(message = "questionId不能为空")
    private Long questionId;

    /** 用户答案 */
    @NotBlank(message = "答案不能为空")
    private String userAnswer;

    /** 答题用时(秒) */
    @Min(value = 0, message = "答题用时不能为负数")
    private Integer durationSeconds;

    /** 模块类型: 1词汇 2语法 3翻译 4听力 5造句 6写作；以数据库题目为准，传错会被拒绝 */
    private Integer moduleType;

    /** 仅练习：只判题，不写答题记录、不更新 ELO/遗忘曲线/金币 */
    private Boolean practiceOnly;

    /**
     * 只记统计：写答题记录并累加模块正确率，但不更新 ELO/遗忘曲线/错题本/金币。
     *
     * <p>用于词汇复习——复习属于测验，应计入正确率；但重复发奖励会被刷分。
     * 与 practiceOnly 互斥，practiceOnly 优先。</p>
     */
    private Boolean statsOnly;

    /** 练习组唯一键（前端生成，≤64 位）；为空表示不参与单次练习结算 */
    private String batchKey;
}
