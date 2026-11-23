package com.english.ai.exercise.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
@TableName("user_vocabulary")
public class UserVocabulary {

    @TableId(type = IdType.AUTO)
    private Long id;

    private Long userId;

    private String word;

    private String translation;

    /** 音标，如 /ˈsɜːkəmstəns/ */
    private String phonetic;

    /** 词性，如 n./v./adj. */
    private String pos;

    /** 英文例句 */
    private String example;

    /** 例句中文翻译 */
    private String exampleTranslation;

    /** 常见搭配，分号分隔 */
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

    /** 标熟时间（状态达成日；「已学词库」按日期分组的分组键之一） */
    private LocalDateTime familiarAt;

    /** 达成已掌握时间（状态达成日；「已学词库」按日期分组的分组键之一） */
    private LocalDateTime masteredAt;

    /** 累计答对次数 */
    private Integer correctCount;

    /** 累计答错次数 */
    private Integer wrongCount;

    /** 最近一次复习结果: CORRECT/WRONG */
    private String lastResult;

    /** 累计复习次数 */
    private Integer reviewCount;

    /** 掌握度等级 0-5，5 为已掌握 */
    private Integer masteryLevel;

    /** 连续成功复习次数（SM-2 n） */
    private Integer repetition;

    /** 难度因子（SM-2 EF，范围 1.30~3.00） */
    private BigDecimal easeFactor;

    /** 当前复习间隔天数（SM-2 I，上限 180） */
    private Integer intervalDays;

    /** 上次复习时间 */
    private LocalDateTime lastReviewedAt;

    /** 下次复习时间（按艾宾浩斯曲线计算） */
    private LocalDateTime nextReviewAt;

    private Integer isMastered;

    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createdAt;

    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updatedAt;
}
