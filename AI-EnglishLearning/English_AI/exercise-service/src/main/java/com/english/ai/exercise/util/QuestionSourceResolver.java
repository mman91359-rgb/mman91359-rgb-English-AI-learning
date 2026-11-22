package com.english.ai.exercise.util;

import com.english.ai.exercise.dto.QuestionSourceVO;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 题目来源解析：把 key 里的卷别编码拆成结构化对象。
 * <p>
 * 支持的 key 形态（实测 `listening_audio.group_key` 226 个取值中 222 个符合）：
 * <pre>
 *   cet6-2022-12-1-g01   听力题组
 *   cet4-2024-06-1-q01   非听力题型的外部导入 key
 *   legacy-464           早期上传的杂项 → 返回 null
 * </pre>
 * 前四段固定是 level-年份-月份-套数，后面跟什么（`-g01` / `-q01`）不影响卷别。
 * <p>
 * 只做解析，不写库；来源的真相仍是 key 本身，本类不引入第二个真相源。
 */
public final class QuestionSourceResolver {

    /** 卷别四段：level-4位年份-1~2位月份-套数，其后必须跟分隔符，避免把 year 当 paper */
    private static final Pattern EXAM_KEY =
            Pattern.compile("^(cet4|cet6)-(\\d{4})-(\\d{1,2})-(\\d+)(?:[-_].*)?$", Pattern.CASE_INSENSITIVE);

    private QuestionSourceResolver() {
    }

    /**
     * 解析卷别；非真题格式（含空值与 legacy-*）返回 null。
     *
     * @param key group_key（听力）或 external_key（其他题型）
     */
    public static QuestionSourceVO resolve(String key) {
        if (key == null || key.isBlank()) {
            return null;
        }
        Matcher matcher = EXAM_KEY.matcher(key.trim());
        if (!matcher.matches()) {
            return null;
        }
        String exam = matcher.group(1).toUpperCase();
        int year = Integer.parseInt(matcher.group(2));
        int month = Integer.parseInt(matcher.group(3));
        int paper = Integer.parseInt(matcher.group(4));
        return QuestionSourceVO.builder()
                .exam(exam)
                .year(year)
                .month(month)
                .paper(paper)
                .label(String.format("%d.%02d %s %s", year, month, exam, paperLabel(paper)))
                .build();
    }

    /** 第几套 → 中文序号；超出 3 套时用数字兜底，不硬编码成「未知」 */
    private static String paperLabel(int paper) {
        return switch (paper) {
            case 1 -> "第一套";
            case 2 -> "第二套";
            case 3 -> "第三套";
            default -> "第" + paper + "套";
        };
    }
}
