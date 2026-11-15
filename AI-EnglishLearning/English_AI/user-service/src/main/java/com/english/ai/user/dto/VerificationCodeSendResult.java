package com.english.ai.user.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 发送验证码响应。
 * mockCode 仅在本地模拟下发时返回，prod profile 直接拒绝发送，不会下发该字段。
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class VerificationCodeSendResult {

    /** 验证码有效期（秒） */
    private Integer expiresInSeconds;

    /** 本地模拟下发的验证码 */
    private String mockCode;
}
