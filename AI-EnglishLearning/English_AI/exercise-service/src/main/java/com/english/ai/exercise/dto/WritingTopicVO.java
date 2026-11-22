package com.english.ai.exercise.dto;

import lombok.Data;

import java.util.List;

/**
 * 写作题目 VO — 字段形状与前端 {@code types/writing.ts} 的 WritingTopic 对齐。
 * <p>
 * id 返回 topicKey 而不是数据库自增主键：前端以字符串索引题目与草稿、收藏、提交四处共用同一个 key，
 * 与 api/writing.ts:155 的 {@code topicId: resp.topicKey} 是同一约定。
 * <p>
 * requirements / outlineHints / usefulExpressions 在真题源数据中不存在，一律返回空数组而非 null。
 */
@Data
public class WritingTopicVO {

    /** 题目key（非数据库主键） */
    private String id;

    /** 题型：SHORT_ESSAY/ARGUMENTATIVE/LETTER/PRACTICAL/CHART */
    private String type;

    /** 等级：CET4/CET6 */
    private String level;

    /** 中文标题 */
    private String title;

    /** 中文写作指令 */
    private String directions;

    /** 英文题目陈述 */
    private String topic;

    /** 写作要求，无则空数组 */
    private List<String> requirements;

    /** 字数区间 [下限, 上限] */
    private List<Integer> wordRange;

    /** 建议用时（秒） */
    private Integer timeLimitSeconds;

    /** 来源，如 CET4 2024年6月 第1套；练习题为空 */
    private String source;

    /** 提纲提示，无则空数组 */
    private List<String> outlineHints;

    /** 常用表达，无则空数组 */
    private List<String> usefulExpressions;
}
