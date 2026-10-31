package com.english.ai.user.dto.admin;

import lombok.Data;

@Data
public class LogQuery {

    private Long operatorId;
    private String action;
    private String targetType;
    private String result;
    private String keyword;
    private String startTime;
    private String endTime;
    private int page = 1;
    private int size = 20;
}
