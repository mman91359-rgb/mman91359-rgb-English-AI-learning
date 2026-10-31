package com.english.ai.user.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

/**
 * 服务间发币请求
 */
@Data
public class AwardCoinRequest {

    @NotNull(message = "userId不能为空")
    private Long userId;

    /** 业务类型，当前只允许 VOCAB_GROUP */
    @NotBlank(message = "bizType不能为空")
    private String bizType;

    /** 业务幂等键 */
    @NotBlank(message = "bizKey不能为空")
    private String bizKey;
}
