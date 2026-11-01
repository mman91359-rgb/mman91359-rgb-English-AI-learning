package com.english.ai.common;

import java.util.Locale;

/**
 * 听力题型契约。
 *
 * <p>与前端 {@code config} 中的题型常量保持一致；数据库存字符串，非法值一律拒绝。</p>
 */
public enum ListeningType {

    SHORT_DIALOGUE("短对话"),
    LONG_DIALOGUE("长对话"),
    PASSAGE("听力篇章"),
    LECTURE("讲座/讲话"),
    NEWS("新闻报道"),
    OTHER("其他");

    private final String label;

    ListeningType(String label) {
        this.label = label;
    }

    /**
     * 按字符串查找；忽略大小写和首尾空格，未知返回 null。
     */
    public static ListeningType of(String code) {
        if (code == null || code.trim().isEmpty()) {
            return null;
        }
        String normalized = code.trim().toUpperCase(Locale.ROOT);
        for (ListeningType type : values()) {
            if (type.name().equals(normalized)) {
                return type;
            }
        }
        return null;
    }

    public static boolean isValid(String code) {
        return of(code) != null;
    }

    public String getLabel() {
        return label;
    }
}
