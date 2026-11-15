package com.english.ai.exercise.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * 已学词库条目 — 「全部已学」页列表项
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class LearnedWordVO {

    /** user_vocabulary.id（标熟/取消标熟按此定位） */
    private Long id;

    /** 单词（小写） */
    private String word;

    /** 释义 */
    private String translation;

    /** 音标 */
    private String phonetic;

    /** 词性 */
    private String pos;

    /** 英文例句 */
    private String example;

    /** 学习状态: LEARNING/REVIEWING/MASTERED/FAMILIAR */
    private String status;

    /** 词书编码（可空：手工添加的词不属于任何词书） */
    private String bookCode;

    /** 词书名称（可空） */
    private String bookName;

    /** 首次学习时间 */
    private LocalDateTime firstLearnedAt;

    /** 达成已掌握时间（可空） */
    private LocalDateTime masteredAt;

    /** 标熟时间（可空） */
    private LocalDateTime familiarAt;

    /** 分组日（yyyy-MM-dd）：COALESCE(mastered_at, familiar_at, first_learned_at) */
    private String groupDate;

    /** 累计答对次数 */
    private Integer correctCount;

    /** 累计答错次数 */
    private Integer wrongCount;

    /** 累计复习次数 */
    private Integer reviewCount;
}
