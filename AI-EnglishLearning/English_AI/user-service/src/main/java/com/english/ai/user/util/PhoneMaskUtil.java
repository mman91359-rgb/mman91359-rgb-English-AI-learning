package com.english.ai.user.util;

/**
 * 手机号脱敏。
 */
public final class PhoneMaskUtil {

    private PhoneMaskUtil() {
    }

    public static String mask(String phone) {
        if (phone == null || phone.isBlank()) {
            return null;
        }
        String value = phone.trim();
        if (value.length() == 11) {
            return value.substring(0, 3) + "****" + value.substring(7);
        }
        if (value.length() <= 4) {
            return "****";
        }
        return value.charAt(0) + "****" + value.substring(value.length() - 2);
    }
}
