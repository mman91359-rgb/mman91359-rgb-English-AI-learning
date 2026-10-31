package com.english.ai.common;

import java.util.Arrays;

/**
 * 生产环境启动校验。
 * <p>
 * 本地开发允许使用 application.yml 中的开发默认值；一旦显式启用 prod profile，
 * 关键密钥必须来自环境变量，缺失时直接拒绝启动，避免带着公开的默认密钥上线。
 */
public final class EnvGuard {

    private EnvGuard() {
    }

    /**
     * 在 prod profile 下校验必需的环境变量。
     *
     * @param keys 环境变量名
     */
    public static void requireInProd(String... keys) {
        if (!isProdProfileActive()) {
            return;
        }
        for (String key : keys) {
            String value = System.getenv(key);
            if (value == null || value.isBlank()) {
                throw new IllegalStateException("生产环境缺少必需环境变量: " + key);
            }
        }
    }

    private static boolean isProdProfileActive() {
        String profiles = System.getenv("SPRING_PROFILES_ACTIVE");
        if (profiles == null || profiles.isBlank()) {
            return false;
        }
        return Arrays.stream(profiles.split(","))
                .map(String::trim)
                .anyMatch("prod"::equals);
    }
}
