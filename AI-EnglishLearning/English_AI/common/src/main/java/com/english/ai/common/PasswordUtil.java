package com.english.ai.common;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

/**
 * 密码工具类 — BCrypt加密/验证
 * work factor = 10（OWASP 推荐区间，单次校验约 0.13s；调整需同步 CLAUDE.md 约定）
 */
public class PasswordUtil {

    /** BCrypt 工作因子 */
    public static final int STRENGTH = 10;

    /** 无法解析出工作因子时的返回值 */
    private static final int UNKNOWN_ROUNDS = -1;

    private static final BCryptPasswordEncoder ENCODER = new BCryptPasswordEncoder(STRENGTH);

    /**
     * 加密明文密码
     */
    public static String encode(String rawPassword) {
        return ENCODER.encode(rawPassword);
    }

    /**
     * 验证密码是否正确
     */
    public static boolean matches(String rawPassword, String encodedPassword) {
        return ENCODER.matches(rawPassword, encodedPassword);
    }

    /**
     * 校验密码强度：至少 10 位，且必须同时包含小写英文字母和数字。
     * <p>
     * 仅用于「设置密码」类入口（注册/改密/找回密码），登录入口不校验强度，
     * 避免历史弱密码存量账号无法登录。
     *
     * @return true 表示符合强度要求
     */
    public static boolean isValidPassword(String rawPassword) {
        if (rawPassword == null) {
            return false;
        }
        if (rawPassword.length() < 10) {
            return false;
        }
        boolean hasLower = false;
        boolean hasDigit = false;
        for (char c : rawPassword.toCharArray()) {
            if (c >= 'a' && c <= 'z') {
                hasLower = true;
            } else if (c >= '0' && c <= '9') {
                hasDigit = true;
            }
        }
        return hasLower && hasDigit;
    }

    /**
     * 判断已存哈希是否需要按当前强度重编码。
     * <p>
     * 注意：{@link BCryptPasswordEncoder#upgradeEncoding(String)} 只在存量强度**低于**目标强度时返回 true。
     * 本项目是把强度从 12 降到 10，升级判断永远为 false，因此必须直接比较 rounds，
     * 否则存量 $2b$12$ 哈希会长期停留在高成本。
     */
    public static boolean needsRehash(String encodedPassword) {
        int rounds = rounds(encodedPassword);
        return rounds != UNKNOWN_ROUNDS && rounds != STRENGTH;
    }

    /**
     * 解析 BCrypt 哈希中的工作因子。
     * 兼容 $2a$10$... / $2b$12$... / $2y$... 格式，非 BCrypt 字符串返回 -1。
     */
    public static int rounds(String encodedPassword) {
        if (encodedPassword == null || encodedPassword.length() < 7) {
            return UNKNOWN_ROUNDS;
        }
        if (encodedPassword.charAt(0) != '$' || encodedPassword.charAt(1) != '2') {
            return UNKNOWN_ROUNDS;
        }
        // $2$10$ 为无小版本号格式（偏移 3），$2a$10$ 为带小版本号格式（偏移 4）
        int offset = encodedPassword.charAt(2) == '$' ? 3 : 4;
        if (encodedPassword.length() < offset + 2) {
            return UNKNOWN_ROUNDS;
        }
        try {
            return Integer.parseInt(encodedPassword.substring(offset, offset + 2));
        } catch (NumberFormatException e) {
            // 非 BCrypt 格式（历史脏数据），交给正常校验流程处理，不做重编码
            return UNKNOWN_ROUNDS;
        }
    }
}
