package com.english.ai.exercise.dto;

import lombok.Builder;
import lombok.Data;

/**
 * 词卡（无题词的降级展示）— 返回给前端
 * 数据来源：word_dictionary，无题词也能看释义/音标/例句。
 */
@Data
@Builder
public class WordCardVO {
    /** 单词 */
    private String word;
    /** 音标 */
    private String phonetic;
    /** 释义 */
    private String translation;
    /** 词性 */
    private String pos;
    /** 英文例句 */
    private String example;
    /** 例句中文翻译 */
    private String exampleTranslation;
    /** 词书内名次（可空） */
    private Integer rankNo;
}
