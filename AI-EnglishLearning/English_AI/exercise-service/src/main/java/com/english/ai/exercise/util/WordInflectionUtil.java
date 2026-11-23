package com.english.ai.exercise.util;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 词形变化与例句挖空辅助。
 *
 * <p>用于从 word_dictionary.example 中定位目标词（原形或其规则变形）并挖成 "___"，
 * 供新学阶段 B 句子填词使用。只做规则变形，不规则变形（go/went 等）挖不到时返回 null，
 * 由调用方跳过该词的填词环节。</p>
 */
public final class WordInflectionUtil {

    private WordInflectionUtil() {
    }

    /**
     * 从例句中挖掉目标词，生成挖空句信息。
     *
     * @return 挖空结果；例句为空或挖不到目标词时返回 null
     */
    public static FillInfo buildFill(String example, String lemma, String hint) {
        if (example == null || example.isBlank() || lemma == null || lemma.isBlank()) {
            return null;
        }
        String lowerLemma = lemma.trim().toLowerCase(Locale.ROOT);

        // 1. 优先原形匹配
        MatchResult r = find(example, lowerLemma);
        if (r != null) {
            return new FillInfo(blank(example, r), r.matched, lemma, hint);
        }

        // 2. 规则变形兜底（短词不做变形，避免误伤 as/aed 等）
        if (lowerLemma.length() >= 3) {
            for (String form : inflect(lowerLemma)) {
                MatchResult fr = find(example, form);
                if (fr != null) {
                    return new FillInfo(blank(example, fr), fr.matched, lemma, hint);
                }
            }
        }
        return null;
    }

    /** 生成常见规则变形 */
    private static List<String> inflect(String lemma) {
        List<String> forms = new ArrayList<>();
        forms.add(lemma + "s");
        forms.add(lemma + "es");
        forms.add(lemma + "ed");
        forms.add(lemma + "d");
        forms.add(lemma + "ing");
        // 去 e：make -> making / made 分支按 ing/ed 处理
        if (lemma.endsWith("e")) {
            String stem = lemma.substring(0, lemma.length() - 1);
            forms.add(stem + "ed");
            forms.add(stem + "ing");
        }
        // 辅音 + y -> ies / ied：study -> studies / studied
        if (lemma.endsWith("y") && lemma.length() > 1 && isConsonant(lemma.charAt(lemma.length() - 2))) {
            String stem = lemma.substring(0, lemma.length() - 1);
            forms.add(stem + "ies");
            forms.add(stem + "ied");
        }
        // CVC 双写：stop -> stopping / stopped
        if (isCvc(lemma)) {
            char last = lemma.charAt(lemma.length() - 1);
            forms.add(lemma + last + "ed");
            forms.add(lemma + last + "ing");
        }
        return forms;
    }

    private static boolean isConsonant(char c) {
        return "bcdfghjklmnpqrstvwxyz".indexOf(c) >= 0;
    }

    private static boolean isCvc(String w) {
        int n = w.length();
        if (n < 3) return false;
        char a = w.charAt(n - 3);
        char b = w.charAt(n - 2);
        char c = w.charAt(n - 1);
        // 辅元辅，且最后一个辅音不是 w/x/y（避免 blow -> blowwing）
        return isConsonant(a) && !isConsonant(b) && isConsonant(c)
                && c != 'w' && c != 'x' && c != 'y';
    }

    private static MatchResult find(String text, String word) {
        Matcher m = Pattern.compile("\\b" + Pattern.quote(word) + "\\b", Pattern.CASE_INSENSITIVE)
                .matcher(text);
        if (m.find()) {
            return new MatchResult(m.start(), m.end(), m.group());
        }
        return null;
    }

    private static String blank(String text, MatchResult r) {
        return text.substring(0, r.start) + "___" + text.substring(r.end);
    }

    private static final class MatchResult {
        final int start;
        final int end;
        final String matched;

        MatchResult(int start, int end, String matched) {
            this.start = start;
            this.end = end;
            this.matched = matched;
        }
    }

    /** 挖空结果 */
    @Data
    @AllArgsConstructor
    public static final class FillInfo {
        /** 挖空后的句子 */
        private String stem;
        /** 例句中目标词的实际形式 */
        private String targetWord;
        /** 原形 */
        private String lemma;
        /** 中文提示 */
        private String hint;
    }
}
