package com.english.ai.user.controller;

import com.english.ai.common.Result;
import com.english.ai.user.dto.admin.InternalAuditRequest;
import com.english.ai.user.service.AdminAuditService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 服务间管理端内部接口（/internal/** 由 InternalAuthInterceptor 校验）。
 */
@RestController
@RequestMapping("/internal/admin")
@RequiredArgsConstructor
public class InternalAdminController {

    private final AdminAuditService auditService;

    @PostMapping("/operation-logs")
    public Result<Void> record(@RequestBody InternalAuditRequest request) {
        auditService.recordInternal(
                request.getOperatorId(),
                request.getOperatorName(),
                request.getAction(),
                request.getTargetType(),
                request.getTargetId(),
                request.getDetail(),
                request.getIp(),
                request.getUserAgent(),
                request.getResult(),
                request.getTraceId());
        return Result.success();
    }
}
