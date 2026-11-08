package com.english.ai.common.util;

import java.util.Locale;

/**
 * 填空题答案归一化工具。
 *
 * <p>纯函数、无状态、零外部依赖。仅用于判题入口对**用户输入**做预处理，
 * 不修改库里保存的正确答案或 accepted_answers。</p>
 *
 * <p>处理顺序：全角转半角 → 合并空白 → 统一小写 → 清洗首尾标点。</p>
 */
public final class AnswerNormalizer {

    private AnswerNormalizer() {
    }

    /**
     * 需要从两端剥除的标点。
     * 不含 {@code -}：well-being、ice-cream 这类词内连字符必须保留。
     * 括注类中文字符多数已由全角转半角处理，这里保留未覆盖的几类。
     */
    private static final String EDGE_PUNCTUATION = ".,!?;:\"'()[]{}<>。、，！？；：（）【】《》…—‘’“”";

    /**
     * 归一化用户答案。
     *
     * @param raw 原始输入，可为 null
     * @return 归一化后的答案；null / 空白返回空串
     */
    public static String normalize(String raw) {
        if (raw == null) {
            return "";
        }
        String halfWidth = toHalfWidth(raw);
        String collapsed = halfWidth.replaceAll("\\s+", " ").trim();
        String lower = collapsed.toLowerCase(Locale.ROOT);
        return stripEdges(lower).trim();
    }

    /** 全角 ASCII 区（U+FF01–U+FF5E）与全角空格转半角 */
    private static String toHalfWidth(String s) {
        StringBuilder sb = new StringBuilder(s.length());
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if (c == '　') {
                sb.append(' ');
            } else if (c >= '！' && c <= '～') {
                sb.append((char) (c - 0xFEE0));
            } else {
                sb.append(c);
            }
        }
        return sb.toString();
    }

    /** 剥除首尾标点，词内标点保持不动（只从两端向内扫描） */
    private static String stripEdges(String s) {
        int start = 0;
        int end = s.length();
        while (start < end && EDGE_PUNCTUATION.indexOf(s.charAt(start)) >= 0) {
            start++;
        }
        while (end > start && EDGE_PUNCTUATION.indexOf(s.charAt(end - 1)) >= 0) {
            end--;
        }
        return s.substring(start, end);
    }
}
