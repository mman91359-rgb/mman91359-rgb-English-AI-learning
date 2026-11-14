package com.english.ai.exercise.dto;

import lombok.Builder;
import lombok.Data;

/**
 * 新词练习条目（题或词卡）— 返回给前端
 * 有题词返回 QUESTION（含题目字段），无题词返回 CARD（含词卡字段）。
 */
@Data
@Builder
public class NewWordItemVO {
    /** 条目类型：QUESTION=有题，CARD=词卡降级 */
    private String type;
    /** 题目（type=QUESTION 时有值） */
    private QuestionVO question;
    /** 词卡（type=CARD 时有值） */
    private WordCardVO card;
}
