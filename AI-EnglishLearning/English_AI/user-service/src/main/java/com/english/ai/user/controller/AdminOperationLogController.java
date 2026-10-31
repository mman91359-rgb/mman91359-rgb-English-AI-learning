package com.english.ai.user.controller;

import com.english.ai.common.PageResult;
import com.english.ai.common.Result;
import com.english.ai.user.dto.admin.AdminOperationLogVO;
import com.english.ai.user.dto.admin.LogQuery;
import com.english.ai.user.service.AdminAuditService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/admin/operation-logs")
@RequiredArgsConstructor
public class AdminOperationLogController {

    private final AdminAuditService auditService;

    @GetMapping
    public Result<PageResult<AdminOperationLogVO>> page(LogQuery query) {
        return Result.success(auditService.page(query));
    }
}
