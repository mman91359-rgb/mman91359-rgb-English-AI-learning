package com.english.ai.exercise.dto;

import lombok.Builder;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 用户收藏单词视图对象
 */
@Data
@Builder
public class UserWordFavoriteVO {
    private Long id;
    private Long userId;
    /** 关联 word_dictionary.id（可空） */
    private Long wordId;
    /** 单词（小写） */
    private String word;
    /** 音标 */
    private String phonetic;
    /** 释义 */
    private String translation;
    /** 词性 */
    private String pos;
    private LocalDateTime createdAt;
}
