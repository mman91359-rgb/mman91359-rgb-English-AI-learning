package com.english.ai.user.service;

import com.english.ai.common.PageResult;
import com.english.ai.user.dto.admin.AdminOperationLogVO;
import com.english.ai.user.dto.admin.LogQuery;

/**
 * 管理端操作审计。
 */
public interface AdminAuditService {

    void record(String action, String targetType, Object targetId, String detail);

    void record(String action, String targetType, Object targetId, String detail, String result);

    void recordInternal(Long operatorId, String operatorName, String action, String targetType,
                        String targetId, String detail, String ip, String userAgent, String result, String traceId);

    PageResult<AdminOperationLogVO> page(LogQuery query);
}
