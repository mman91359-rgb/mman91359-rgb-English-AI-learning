package com.english.ai.exercise.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 新学判题响应。
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class NewWordAttemptResponse {

    /** 是否答对 */
    private boolean isCorrect;

    /** 正确答案（CHOICE 为释义，FILL 为挖空句目标词的实际形式） */
    private String correctAnswer;
}
