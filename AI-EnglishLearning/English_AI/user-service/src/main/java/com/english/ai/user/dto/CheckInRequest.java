package com.english.ai.user.dto;

import jakarta.validation.constraints.NotNull;
import lombok.Data;

/**
 * 签到请求
 */
@Data
public class CheckInRequest {

    @NotNull(message = "userId不能为空")
    private Long userId;
}
