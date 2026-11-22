package com.english.ai.exercise.dto;

import lombok.Data;

import java.time.LocalDateTime;

/**
 * 写作草稿 VO — 字段形状与前端 {@code types/writing.ts} 的 WritingDraft 对齐。
 * <p>
 * 不下发 wordCount：前端已有 countWords() 现算，后端再算一遍会出现两套分词口径。
 */
@Data
public class WritingDraftVO {

    /** 题目key；前端类型里叫 topicId */
    private String topicId;

    /** 草稿正文，可为空 */
    private String content;

    /** 最近保存时间（ISO-8601，与既有 WritingSubmitResponse.createdAt 同口径） */
    private LocalDateTime updatedAt;

    /** 累计作答用时（秒） */
    private Integer elapsedSeconds;
}
