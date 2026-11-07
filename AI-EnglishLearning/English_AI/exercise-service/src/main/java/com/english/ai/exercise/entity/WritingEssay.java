package com.english.ai.exercise.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * 写作作文记录表 — 作文"先落库后评分"，AI 评分失败时保留原文并标记未评分。
 */
@Data
@TableName("writing_essay")
public class WritingEssay {

    @TableId(type = IdType.AUTO)
    private Long id;

    /** 用户ID */
    private Long userId;

    /** 题目key（对应前端静态题库 id） */
    private String topicKey;

    /** 题目标题快照 */
    private String topicTitle;

    /** 作文原文 */
    private String content;

    /** 词数 */
    private Integer wordCount;

    /** 答题用时(秒) */
    private Integer durationSeconds;

    /** AI是否已评分: 1=已评分, 0=未评分(降级待重评) */
    private Integer aiScored;

    /** 评分结果快照(JSON) */
    private String scoreJson;

    /** 原始分(满分15) */
    private BigDecimal rawScore;

    /** 百分制折算分 */
    private BigDecimal weightedScore;

    /** 创建时间 */
    private LocalDateTime createdAt;
}
