package com.english.ai.user.dto;

import lombok.Data;

/**
 * 服务间发币请求
 */
@Data
public class AwardCoinRequest {

    private Long userId;

    /** 业务类型，当前只允许 VOCAB_GROUP */
    private String bizType;

    /** 业务幂等键 */
    private String bizKey;
}
