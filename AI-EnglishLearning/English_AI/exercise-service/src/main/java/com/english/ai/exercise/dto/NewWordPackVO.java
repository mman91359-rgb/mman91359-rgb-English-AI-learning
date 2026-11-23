package com.english.ai.exercise.dto;

import lombok.Builder;
import lombok.Data;

import java.util.List;

/**
 * 新学词包条目：阶段 A 词义识别 + 阶段 B 句子挖空填词所需数据。
 *
 * <p>单例句过渡版：meanings / examples 由 word_dictionary 的单条释义、单条例句
 * 包装成数组结构，后续多义项/多例句数据就绪后再扩容。</p>
 */
@Data
@Builder
public class NewWordPackVO {

    private Long wordId;

    private String word;

    private String phonetic;

    private String pos;

    private List<Meaning> meanings;

    private List<Example> examples;

    private Choice choice;

    /** 挖空句；例句缺失或挖不到目标词时为 null，前端跳过 B 阶段 */
    private Fill fill;

    @Data
    @Builder
    public static class Meaning {
        private String pos;
        private String meaning;
    }

    @Data
    @Builder
    public static class Example {
        private String sentence;
        private String translation;
    }

    @Data
    @Builder
    public static class Choice {
        private List<Option> options;
    }

    @Data
    @Builder
    public static class Option {
        private String text;
        private boolean correct;
    }

    @Data
    @Builder
    public static class Fill {
        /** 挖空后的句子，如 "The factory ___ car parts." */
        private String stem;
        /** 例句中目标词的实际形式，如 produces */
        private String targetWord;
        /** 原形，如 produce */
        private String lemma;
        /** 中文提示 */
        private String hint;
    }
}
