package com.english.ai.exercise.dto;

import lombok.Builder;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
@Builder
public class VocabularyVO {
    private Long id;
    private Long userId;
    private String word;
    private String translation;
    /** 音标 */
    private String phonetic;
    /** 词性 */
    private String pos;
    /** 英文例句 */
    private String example;
    /** 例句中文翻译 */
    private String exampleTranslation;
    /** 常见搭配 */
    private String collocation;
    /** 来源: manual/daily_word/quiz */
    private String source;
    /** 学习状态: LEARNING/REVIEWING/MASTERED/FAMILIAR */
    private String status;
    /** 关联 word_dictionary.id（可空） */
    private Long wordId;
    /** 词书归属 word_book.id（可空） */
    private Long bookId;
    /** 首次学习时间 */
    private LocalDateTime firstLearnedAt;
    /** 累计答对次数 */
    private Integer correctCount;
    /** 累计答错次数 */
    private Integer wrongCount;
    /** 最近一次复习结果: CORRECT/WRONG */
    private String lastResult;
    /** 累计复习次数 */
    private Integer reviewCount;
    /** 掌握度等级 0-5 */
    private Integer masteryLevel;
    /** 连续成功复习次数（SM-2 n） */
    private Integer repetition;
    /** 难度因子（SM-2 EF，范围 1.30~3.00） */
    private BigDecimal easeFactor;
    /** 当前复习间隔天数（SM-2 I，上限 180） */
    private Integer intervalDays;
    /** 上次复习时间 */
    private LocalDateTime lastReviewedAt;
    /** 下次复习时间 */
    private LocalDateTime nextReviewAt;
    private Integer isMastered;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}
