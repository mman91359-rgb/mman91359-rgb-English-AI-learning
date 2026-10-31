package com.english.ai.user.dto.admin;

import lombok.Builder;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@Builder
public class AdminOperationLogVO {

    private Long id;
    private Long operatorId;
    private String operatorName;
    private String action;
    private String targetType;
    private String targetId;
    private String detail;
    private String ip;
    private String userAgent;
    private String result;
    private String traceId;
    private LocalDateTime createdAt;
}
