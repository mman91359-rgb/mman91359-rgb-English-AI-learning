package com.english.ai.exercise.dto;

import jakarta.validation.constraints.NotNull;
import lombok.Data;

/**
 * 新学判题请求（阶段 A 选择题 / 阶段 B 句子填词）。
 * 「想中文」自评不走本接口，由前端自行判定。
 */
@Data
public class NewWordAttemptRequest {

    @NotNull(message = "wordId不能为空")
    private Long wordId;

    /** 阶段：CHOICE=选择题 / FILL=句子填词 */
    @NotNull(message = "phase不能为空")
    private String phase;

    @NotNull(message = "userAnswer不能为空")
    private String userAnswer;
}
