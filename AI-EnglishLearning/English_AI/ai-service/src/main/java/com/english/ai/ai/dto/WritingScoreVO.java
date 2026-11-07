package com.english.ai.ai.dto;

import lombok.Data;

import java.util.List;
import java.util.Map;

/**
 * 作文结构化评分视图对象
 * 对齐前端 types/writing.ts 的 WritingScore 契约：5 维度各 3 分、满分 15
 */
@Data
public class WritingScoreVO {

    /** 评分版本标识 */
    private String scoreVersion;

    /** 评分提供方：LLM / MOCK */
    private String provider;

    /** 原始分（满分 15） */
    private Integer rawScore;

    /** 满分 */
    private Integer maxRawScore;

    /** 百分制折算分 = rawScore / 15 * 106.5 */
    private Double weightedScore;

    /** 等级：EXCELLENT/GOOD/PASS/NEEDS_WORK/POOR */
    private String level;

    /** 五维度得分：content/structure/language/vocabulary/grammar */
    private Map<String, Integer> dimensions;

    /** 优点列表 */
    private List<String> strengths;

    /** 问题列表 */
    private List<String> issues;

    /** 逐句批改 */
    private List<Correction> corrections;

    /** 亮点句 */
    private List<String> highlights;

    /** 参考范文 */
    private String modelEssay;

    /** 改写建议 */
    private List<String> rewriteSuggestions;

    @Data
    public static class Correction {
        /** 原句 */
        private String original;
        /** 建议改法 */
        private String suggestion;
        /** 修改原因 */
        private String reason;
        /** 错误类型：GRAMMAR/VOCABULARY/STRUCTURE/SPELLING/PUNCTUATION */
        private String type;
    }
}
