package com.english.ai.exercise.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.Data;

/**
 * 审核结论落地请求。
 *
 * <p>PASS 只改队列状态；FAIL 还要把该次作答改成错、写回错题本。</p>
 */
@Data
public class JudgeReviewResolveRequest {

    @NotNull(message = "reviewId不能为空")
    private Long reviewId;

    /** PASS：维持判对；FAIL：改判为错 */
    @NotBlank(message = "verdict不能为空")
    @Pattern(regexp = "PASS|FAIL", message = "verdict只能是 PASS 或 FAIL")
    private String verdict;

    @Size(max = 500, message = "comment长度不能超过500")
    private String comment;

    /** 审核人ID，可不传 */
    private Long reviewerId;
}
