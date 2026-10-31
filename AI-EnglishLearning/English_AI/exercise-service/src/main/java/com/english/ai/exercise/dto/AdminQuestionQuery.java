package com.english.ai.exercise.dto;

import lombok.Data;

@Data
public class AdminQuestionQuery {

    private String status = "PENDING";
    private Integer moduleType;
    private String targetLevel;
    private String keyword;
    private int page = 1;
    private int size = 20;
}
