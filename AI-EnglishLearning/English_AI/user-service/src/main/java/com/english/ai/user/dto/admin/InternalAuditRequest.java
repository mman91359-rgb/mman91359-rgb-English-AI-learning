package com.english.ai.user.dto.admin;

import lombok.Data;

/**
 * exercise-service 上报的审计事件。
 */
@Data
public class InternalAuditRequest {

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
}
