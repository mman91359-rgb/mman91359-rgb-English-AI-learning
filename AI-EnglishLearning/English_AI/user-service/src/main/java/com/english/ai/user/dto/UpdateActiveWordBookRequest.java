package com.english.ai.user.dto;

import jakarta.validation.constraints.NotNull;
import lombok.Data;

/**
 * 更新当前词书请求
 */
@Data
public class UpdateActiveWordBookRequest {

    @NotNull(message = "userId不能为空")
    private Long userId;

    @NotNull(message = "词书ID不能为空")
    private Long activeWordBookId;
}
