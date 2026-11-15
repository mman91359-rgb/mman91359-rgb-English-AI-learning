package com.english.ai.user.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.Data;

/**
 * 发送验证码请求。
 * recipient 为手机号或邮箱；scene 为 REGISTER / FORGOT_PASSWORD / PHONE_BIND。
 */
@Data
public class VerificationCodeSendRequest {

    @NotBlank(message = "接收地址不能为空")
    private String recipient;

    @NotBlank(message = "验证码场景不能为空")
    private String scene;
}
