package com.english.ai.exercise.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ApproveQuestionResponse {

    private Long pendingId;
    private Long questionId;
}
