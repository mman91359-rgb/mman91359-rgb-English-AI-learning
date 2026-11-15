package com.english.ai.user.enums;

import java.util.Arrays;

/**
 * 验证码业务场景。
 * 匿名场景（注册、找回密码）不需要登录；换绑场景必须登录后签发，并与用户绑定。
 */
public enum VerificationScene {

    REGISTER("注册"),
    FORGOT_PASSWORD("找回密码"),
    PHONE_BIND("换绑手机号");

    private final String description;

    VerificationScene(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }

    /** 是否允许未登录调用发送接口 */
    public boolean isAnonymous() {
        return this == REGISTER || this == FORGOT_PASSWORD;
    }

    /** 字符串转枚举，未知值返回 null（不做默认兜底，避免场景串用） */
    public static VerificationScene of(String value) {
        if (value == null) {
            return null;
        }
        String normalized = value.trim();
        return Arrays.stream(values())
                .filter(scene -> scene.name().equalsIgnoreCase(normalized))
                .findFirst()
                .orElse(null);
    }
}
