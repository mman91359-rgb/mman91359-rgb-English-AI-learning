package com.english.ai.user.util;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;
import java.util.UUID;

/**
 * Refresh Token 生成与哈希工具。
 * 明文仅用于 Cookie 下发，数据库只存 SHA-256 哈希。
 */
public final class RefreshTokenUtil {

    private static final SecureRandom RANDOM = new SecureRandom();

    private RefreshTokenUtil() {
    }

    /**
     * 生成 32 字节随机 Refresh Token（Base64 URL 编码，约 43 字符明文）。
     */
    public static String generate() {
        byte[] bytes = new byte[32];
        RANDOM.nextBytes(bytes);
        return Base64.getUrlEncoder().withoutPadding().encodeToString(bytes);
    }

    /**
     * 计算 SHA-256 哈希，返回 64 位小写 hex。
     */
    public static String sha256(String raw) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(raw.getBytes(StandardCharsets.UTF_8));
            StringBuilder sb = new StringBuilder(64);
            for (byte b : hash) {
                sb.append(Character.forDigit((b >> 4) & 0xF, 16));
                sb.append(Character.forDigit(b & 0xF, 16));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            // SHA-256 是 JDK 内置算法，理论不会走到这里
            throw new IllegalStateException("SHA-256 算法不可用", e);
        }
    }

    /**
     * 生成一个新的 series（UUID）。
     */
    public static String newSeries() {
        return UUID.randomUUID().toString();
    }
}
