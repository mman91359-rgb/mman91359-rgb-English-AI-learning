package com.english.ai.exercise.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * 统一学习时间线条目 — 合并答题 / 单词事件 / 写作三类记录，按时间倒序分页。
 *
 * <p>来源不同，字段按 source 取用；未用到的字段为 null。</p>
 *
 * <p>不加 @Builder / @AllArgsConstructor：MyBatis 自动映射会误用全参构造函数，
 * 按 12 个参数去套 11 列结果集，直接抛 IndexOutOfBoundsException。
 * 这里只保留无参构造 + setter 映射。</p>
 */
@Data
@NoArgsConstructor
public class TimelineItemVO {

    /** 来源: ANSWER=答题 / WORD=单词事件 / WRITING=写作 */
    private String source;

    /** 各来源的主键ID */
    private Long id;

    private LocalDateTime createdAt;

    // ---- ANSWER ----
    /** 题目ID（供前端反查详情） */
    private Long questionId;
    /** 模块类型 */
    private Integer moduleType;
    /** 是否答对 */
    private Integer isCorrect;
    /** 题干摘要 */
    private String stem;

    // ---- WORD ----
    /** 单词 */
    private String word;
    /** 事件类型 */
    private String eventType;
    /** 作答结果: CORRECT/WRONG（仅答题类单词事件有值） */
    private String result;
    /** 词书编码 */
    private String bookCode;

    // ---- WRITING ----
    /** 作文题目标题 */
    private String topicTitle;
    /** 百分制折算分 */
    private BigDecimal weightedScore;
}
