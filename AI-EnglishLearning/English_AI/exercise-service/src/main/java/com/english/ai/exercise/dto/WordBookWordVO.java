package com.english.ai.exercise.dto;

import lombok.Builder;
import lombok.Data;

/**
 * 词书单词表条目。
 *
 * <p>数据来源：word_book_item 提供书内名次，word_dictionary 提供释义/音标/例句，
 * user_vocabulary 提供当前用户在该词上的学习状态。字段采用可空设计，字典缺词时
 * 仍能显示词形与名次。</p>
 */
@Data
@Builder
public class WordBookWordVO {
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
    /** 词书内名次（从 1 开始） */
    private Integer rankNo;
    /** 关联 word_dictionary.id（可空） */
    private Long wordId;
    /** 当前用户学习状态: LEARNING/REVIEWING/MASTERED/FAMILIAR；未学为 null */
    private String status;
    /** 是否已掌握 0/1（未学为 0） */
    private Integer isMastered;
}
