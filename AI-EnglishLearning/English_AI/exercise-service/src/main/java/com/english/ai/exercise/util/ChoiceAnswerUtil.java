package com.english.ai.exercise.util;

import com.english.ai.common.util.AnswerNormalizer;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.util.Iterator;
import java.util.Locale;
import java.util.Map;

/**
 * 选择题确定性判题工具。
 *
 * <p>听力等 CHOICE 题型只做本地精确/选项文本比对，不进入 AI 语义判对链，
 * 避免无 Key 时判题异常或 AI 放水。</p>
 */
public final class ChoiceAnswerUtil {

    private static final ObjectMapper OBJECT_MAPPER = new ObjectMapper();

    private ChoiceAnswerUtil() {
    }

    /**
     * 判断用户答案是否正确。用户可能提交选项字母（A/a）或选项文本（"A. text"/"text"）。
     */
    public static boolean isCorrect(String userAnswer, String correctAnswer, String optionsJson) {
        if (isBlank(userAnswer) || isBlank(correctAnswer)) {
            return false;
        }

        String correctKey = extractKey(correctAnswer);
        // 字母优先，但只对"纯字母/字母+标点"这类短输入生效（长度 ≤ 2）。
        // 否则 "A bus stop" 这种以冠词 A 开头的选项文本会被误当成字母 A。
        String halfWidthUser = AnswerNormalizer.toHalfWidth(userAnswer).trim();
        if (halfWidthUser.length() <= 2) {
            String userKey = extractKey(userAnswer);
            if (!correctKey.isEmpty() && correctKey.equalsIgnoreCase(userKey)) {
                return true;
            }
        }

        String user = normalizeOptionText(userAnswer);
        String correct = normalizeOptionText(correctAnswer);
        String correctText = normalizeOptionText(extractOptionText(correctAnswer));

        if (user.equals(correct)) {
            return true;
        }
        if (!correctText.isEmpty() && user.equals(correctText)) {
            return true;
        }

        return matchByOptions(user, correctKey, correctText, optionsJson);
    }

    /**
     * 从 "A. text" / "A、text" / "A) text" / "A" 中提取选项字母；无法提取返回空串。
     */
    public static String extractKey(String answer) {
        if (isBlank(answer)) {
            return "";
        }
        // 全角字母/全角标点先转半角，否则 "Ａ．" 无法提取出选项字母
        String text = AnswerNormalizer.toHalfWidth(answer).trim();
        if (text.length() >= 2) {
            char second = text.charAt(1);
            if (second == '.' || second == '、' || second == ')' || second == '）' || Character.isWhitespace(second)) {
                char first = text.charAt(0);
                if (Character.isLetter(first)) {
                    return String.valueOf(first).toUpperCase(Locale.ROOT);
                }
            }
        }
        if (text.length() == 1 && Character.isLetter(text.charAt(0))) {
            return text.toUpperCase(Locale.ROOT);
        }
        return "";
    }

    /**
     * 去掉选项前缀（A./A、/A)）、首尾空格，统一小写并压缩空白。
     */
    public static String normalizeOptionText(String text) {
        if (text == null) {
            return "";
        }
        // 全角转半角 → 剥选项前缀 → 统一走 AnswerNormalizer（小写/折叠空白/剥首尾标点）
        // 尾部句号等由 AnswerNormalizer 处理，避免 "Her train was delayed." 与不带句号的输入对不上
        String withoutPrefix = AnswerNormalizer.toHalfWidth(text)
                .trim()
                .replaceFirst("^[A-Da-d]\\s*[.、)）]\\s*", "")
                .trim();
        return AnswerNormalizer.normalize(withoutPrefix);
    }

    /**
     * 从正确答案中提取选项文本；如果答案本身只有字母，返回空串。
     */
    public static String extractOptionText(String answer) {
        if (isBlank(answer)) {
            return "";
        }
        String text = AnswerNormalizer.toHalfWidth(answer).trim();
        if (text.length() >= 2) {
            char second = text.charAt(1);
            if (second == '.' || second == '、' || second == ')' || second == '）' || Character.isWhitespace(second)) {
                char first = text.charAt(0);
                if (Character.isLetter(first)) {
                    return text.substring(2).trim();
                }
            }
        }
        return "";
    }

    private static boolean matchByOptions(String user, String correctKey, String correctText, String optionsJson) {
        if (isBlank(optionsJson)) {
            return false;
        }
        try {
            JsonNode root = OBJECT_MAPPER.readTree(optionsJson);
            if (root.isArray()) {
                for (JsonNode item : root) {
                    String option = item.asText("");
                    String optionKey = extractKey(option);
                    String optionText = normalizeOptionText(extractOptionText(option));
                    if (matchesOption(user, correctKey, correctText, optionKey, optionText)) {
                        return true;
                    }
                }
                return false;
            }
            if (root.isObject()) {
                Iterator<Map.Entry<String, JsonNode>> fields = root.fields();
                while (fields.hasNext()) {
                    Map.Entry<String, JsonNode> entry = fields.next();
                    String optionKey = AnswerNormalizer.toHalfWidth(entry.getKey()).trim().toUpperCase(Locale.ROOT);
                    String optionText = normalizeOptionText(entry.getValue().asText(""));
                    if (matchesOption(user, correctKey, correctText, optionKey, optionText)) {
                        return true;
                    }
                }
            }
        } catch (Exception ignored) {
            // 选项 JSON 非法时退化为精确比对，不抛异常影响答题主流程
        }
        return false;
    }

    private static boolean matchesOption(String user, String correctKey, String correctText,
                                         String optionKey, String optionText) {
        if (optionKey.isEmpty()) {
            return false;
        }
        String key = optionKey.toLowerCase(Locale.ROOT);
        // 用户提交字母：只要等于正确选项字母即可
        if (user.equals(key)) {
            return key.equalsIgnoreCase(correctKey);
        }
        // 用户提交选项文本：文本一致且该选项就是正确选项
        return !correctText.isEmpty()
                && user.equals(optionText)
                && optionKey.equalsIgnoreCase(correctKey);
    }

    private static boolean isBlank(String value) {
        return value == null || value.trim().isEmpty();
    }
}
