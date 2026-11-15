package com.english.ai.user.dto;

import jakarta.validation.constraints.NotNull;
import lombok.Data;

/**
 * 金币补签请求
 */
@Data
public class MakeupCheckInRequest {

    @NotNull(message = "userId不能为空")
    private Long userId;

    /** 补签日期，格式 yyyy-MM-dd */
    @NotNull(message = "date不能为空")
    private String date;
}
