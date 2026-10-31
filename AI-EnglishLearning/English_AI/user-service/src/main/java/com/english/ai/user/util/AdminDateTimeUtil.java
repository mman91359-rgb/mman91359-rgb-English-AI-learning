package com.english.ai.user.util;

import com.english.ai.common.BusinessException;
import com.english.ai.common.ErrorCode;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * 管理端日期时间解析：兼容 "yyyy-MM-dd HH:mm:ss" 与 ISO "yyyy-MM-ddTHH:mm:ss"。
 */
public final class AdminDateTimeUtil {

    private static final DateTimeFormatter SPACE_FORMAT = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    private static final DateTimeFormatter DATE_FORMAT = DateTimeFormatter.ofPattern("yyyy-MM-dd");

    private AdminDateTimeUtil() {
    }

    public static LocalDateTime parseDateTime(String value) {
        if (value == null || value.isBlank()) {
            return null;
        }
        String text = value.trim();
        try {
            return LocalDateTime.parse(text, SPACE_FORMAT);
        } catch (Exception ignored) {
            try {
                return LocalDateTime.parse(text);
            } catch (Exception e) {
                throw new BusinessException(ErrorCode.BAD_REQUEST, "时间格式错误: " + value);
            }
        }
    }

    public static LocalDate parseDate(String value) {
        if (value == null || value.isBlank()) {
            return null;
        }
        try {
            return LocalDate.parse(value.trim(), DATE_FORMAT);
        } catch (Exception e) {
            throw new BusinessException(ErrorCode.BAD_REQUEST, "日期格式错误: " + value);
        }
    }
}
