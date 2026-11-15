package com.english.ai.user.service.impl;

import com.english.ai.user.service.SmsSender;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

/**
 * 本地模拟下发：不接第三方短信/邮件，只在服务端日志与接口响应中回显验证码。
 * prod profile 由 VerificationCodeService 直接拒绝，该实现不会在生产环境被调用。
 */
@Slf4j
@Service
public class MockSmsSender implements SmsSender {

    @Override
    public void send(String recipient, String code) {
        log.info("[模拟验证码下发] recipient={}, code={}", recipient, code);
    }
}
