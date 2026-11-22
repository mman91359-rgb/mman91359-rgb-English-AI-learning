package com.english.ai.user.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import lombok.Data;

import java.time.LocalDate;

/**
 * 更新备考目标请求（考试日期 + 目标分 + 考试等级）
 */
@Data
public class UpdateExamGoalRequest {

    @NotNull(message = "userId不能为空")
    private Long userId;

    /** 考试日期（yyyy-MM-dd） */
    @NotNull(message = "考试日期不能为空")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private LocalDate examDate;

    /** 目标分（425-710） */
    @NotNull(message = "目标分不能为空")
    @Min(value = 425, message = "目标分不能低于425")
    @Max(value = 710, message = "目标分不能高于710")
    private Integer targetScore;

    /** 考试等级：CET4 / CET6，回写 sys_user.cet_level */
    @NotBlank(message = "考试等级不能为空")
    @Pattern(regexp = "CET4|CET6", message = "考试等级只能是 CET4 或 CET6")
    private String cetLevel;
}
