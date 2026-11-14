package com.english.ai.exercise.dto;

import lombok.Builder;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 单词学习事件视图对象 — 用于历史时间线「单词」模块
 */
@Data
@Builder
public class UserWordLearnLogVO {
    private Long id;
    private Long userId;
    /** 关联 word_dictionary.id（可空） */
    private Long wordId;
    /** 单词（小写） */
    private String word;
    /** 事件类型: LEARN/REVIEW/MASTER/FAVORITE/UNFAVORITE/IGNORE */
    private String eventType;
    /** 词书编码（可空） */
    private String bookCode;
    private LocalDateTime createdAt;
}
