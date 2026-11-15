package com.english.ai.exercise.dto;

import jakarta.validation.constraints.NotNull;
import lombok.Data;

/**
 * 单词作答记录请求
 *
 * <p>用于词汇新词/复习循环：只记录「这个单词答对/答错了」，不进答题统计、
 * 不发金币、不动 ELO 与错题本。答错的词会立刻进入今日复习队列。</p>
 */
@Data
public class WordAttemptRequest {

    @NotNull(message = "userId不能为空")
    private Long userId;

    /**
     * 题目ID（有题时传）。
     * 传了它后端会优先用 question_info.answer_word 的词条原形，
     * 避免把题面变形（如 inferred）当成新词写进单词本。
     */
    private Long questionId;

    /** 单词（词卡作答时传；与 questionId 至少传一个） */
    private String word;

    /** 本次是否答对 */
    @NotNull(message = "isCorrect不能为空")
    private Boolean isCorrect;
}
