package com.english.ai.exercise.dto;

import lombok.Builder;
import lombok.Data;

/**
 * 题目结构化来源（真题卷别）。
 * <p>
 * 不靠数据库新增列：卷别信息本来就编码在 key 里（`cet6-2022-12-1-g01` 的前四段），
 * 由 {@code QuestionSourceResolver} 解析出来即可，避免再加一列还要回头补历史数据。
 * <p>
 * {@code null} 表示非真题：AI 生成题、`legacy-464` 这类早期上传的杂项题。
 * 前端拿到 null 时应显示当前语言的「练习」文案，而不是显示原始 key。
 */
@Data
@Builder
public class QuestionSourceVO {

    /** 考试：CET4 / CET6 */
    private String exam;

    private Integer year;

    private Integer month;

    /** 第几套 */
    private Integer paper;

    /**
     * 展示标签，如「2022.12 CET6 第一套」。
     * 后端拼好给前端直接用，省得前端再写一遍补零与「第几套」的中文映射。
     */
    private String label;
}
