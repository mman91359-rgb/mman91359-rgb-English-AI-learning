package com.english.ai.user.controller;

import com.english.ai.common.BusinessException;
import com.english.ai.common.Result;
import com.english.ai.user.dto.VerificationCodeSendRequest;
import com.english.ai.user.dto.VerificationCodeSendResult;
import com.english.ai.user.enums.VerificationScene;
import com.english.ai.user.service.VerificationCodeService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 未登录场景的验证码发送：注册、找回密码。
 * 网关白名单放行该前缀；换绑场景需登录，走 UserController 的 /user/phone/change/send-code。
 */
@Slf4j
@RestController
@RequestMapping("/user/verify-code")
@RequiredArgsConstructor
public class VerificationCodeController {

    private final VerificationCodeService verificationCodeService;

    @PostMapping("/send")
    public Result<VerificationCodeSendResult> send(@Valid @RequestBody VerificationCodeSendRequest request) {
        VerificationScene scene = VerificationScene.of(request.getScene());
        if (scene == null || !scene.isAnonymous()) {
            return Result.badRequest("验证码场景不正确");
        }
        try {
            return Result.success(verificationCodeService.send(request.getRecipient(), scene, null));
        } catch (BusinessException e) {
            log.warn("验证码发送失败: recipient={}, scene={}, reason={}",
                    request.getRecipient(), scene, e.getMessage());
            return Result.badRequest(e.getMessage());
        }
    }
}
