package com.english.ai.user.controller;

import com.english.ai.common.Result;
import com.english.ai.user.dto.ForgotPasswordRequest;
import com.english.ai.user.service.PasswordResetService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 未登录状态下的手机号找回密码。
 * 当前仅本地模拟验证码；网关白名单与 request.ts 均已放行该前缀。
 */
@RestController
@RequestMapping("/user/forgot-password")
@RequiredArgsConstructor
public class ForgotPasswordController {

    private final PasswordResetService passwordResetService;

    @PostMapping("/reset")
    public Result<Boolean> reset(@Valid @RequestBody ForgotPasswordRequest request) {
        passwordResetService.resetByPhone(request);
        return Result.success(true);
    }
}
