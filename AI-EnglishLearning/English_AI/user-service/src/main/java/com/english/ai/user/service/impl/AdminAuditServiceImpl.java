package com.english.ai.user.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.english.ai.common.PageResult;
import com.english.ai.user.config.AdminContext;
import com.english.ai.user.dto.admin.AdminOperationLogVO;
import com.english.ai.user.dto.admin.LogQuery;
import com.english.ai.user.entity.AdminOperationLog;
import com.english.ai.user.mapper.AdminOperationLogMapper;
import com.english.ai.user.service.AdminAuditService;
import com.english.ai.user.util.AdminDateTimeUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@Slf4j
@Service
@RequiredArgsConstructor
public class AdminAuditServiceImpl implements AdminAuditService {

    private static final int MAX_DETAIL = 1000;

    private final AdminOperationLogMapper logMapper;

    @Override
    public void record(String action, String targetType, Object targetId, String detail) {
        record(action, targetType, targetId, detail, "SUCCESS");
    }

    @Override
    public void record(String action, String targetType, Object targetId, String detail, String result) {
        Long operatorId = AdminContext.getOperatorId();
        if (operatorId == null) {
            log.warn("缺少管理员上下文，跳过审计: action={}", action);
            return;
        }
        String userAgent = currentUserAgent();
        recordInternal(operatorId, AdminContext.getUsername(), action, targetType,
                targetId == null ? null : String.valueOf(targetId), detail,
                AdminContext.getIp(), userAgent, result, null);
    }

    @Override
    public void recordInternal(Long operatorId, String operatorName, String action, String targetType,
                               String targetId, String detail, String ip, String userAgent,
                               String result, String traceId) {
        AdminOperationLog entry = new AdminOperationLog();
        entry.setOperatorId(operatorId);
        entry.setOperatorName(operatorName);
        entry.setAction(action);
        entry.setTargetType(targetType);
        entry.setTargetId(targetId);
        entry.setDetail(truncate(detail, MAX_DETAIL));
        entry.setIp(truncate(ip, 64));
        entry.setUserAgent(truncate(userAgent, 255));
        entry.setResult(result == null ? "SUCCESS" : result);
        entry.setTraceId(truncate(traceId, 64));
        logMapper.insert(entry);
    }

    @Override
    public PageResult<AdminOperationLogVO> page(LogQuery query) {
        int page = Math.max(1, query.getPage());
        int size = Math.max(1, Math.min(100, query.getSize()));
        LambdaQueryWrapper<AdminOperationLog> wrapper = new LambdaQueryWrapper<>();
        if (query.getOperatorId() != null) {
            wrapper.eq(AdminOperationLog::getOperatorId, query.getOperatorId());
        }
        if (query.getAction() != null && !query.getAction().isBlank()) {
            wrapper.eq(AdminOperationLog::getAction, query.getAction().trim());
        }
        if (query.getTargetType() != null && !query.getTargetType().isBlank()) {
            wrapper.eq(AdminOperationLog::getTargetType, query.getTargetType().trim());
        }
        if (query.getResult() != null && !query.getResult().isBlank()) {
            wrapper.eq(AdminOperationLog::getResult, query.getResult().trim());
        }
        if (query.getKeyword() != null && !query.getKeyword().isBlank()) {
            String keyword = query.getKeyword().trim();
            wrapper.and(w -> w.like(AdminOperationLog::getOperatorName, keyword)
                    .or().like(AdminOperationLog::getTargetId, keyword)
                    .or().like(AdminOperationLog::getDetail, keyword));
        }
        LocalDateTime start = AdminDateTimeUtil.parseDateTime(query.getStartTime());
        LocalDateTime end = AdminDateTimeUtil.parseDateTime(query.getEndTime());
        if (start != null) {
            wrapper.ge(AdminOperationLog::getCreatedAt, start);
        }
        if (end != null) {
            wrapper.le(AdminOperationLog::getCreatedAt, end);
        }
        long total = logMapper.selectCount(wrapper);
        wrapper.orderByDesc(AdminOperationLog::getCreatedAt)
                .last("LIMIT " + ((page - 1) * size) + "," + size);
        List<AdminOperationLogVO> records = logMapper.selectList(wrapper).stream()
                .map(this::toVO)
                .collect(Collectors.toList());
        return PageResult.of(records, total, page, size);
    }

    private AdminOperationLogVO toVO(AdminOperationLog entry) {
        return AdminOperationLogVO.builder()
                .id(entry.getId())
                .operatorId(entry.getOperatorId())
                .operatorName(entry.getOperatorName())
                .action(entry.getAction())
                .targetType(entry.getTargetType())
                .targetId(entry.getTargetId())
                .detail(entry.getDetail())
                .ip(entry.getIp())
                .userAgent(entry.getUserAgent())
                .result(entry.getResult())
                .traceId(entry.getTraceId())
                .createdAt(entry.getCreatedAt())
                .build();
    }

    private String currentUserAgent() {
        try {
            ServletRequestAttributes attributes =
                    (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
            return attributes == null ? null : attributes.getRequest().getHeader("User-Agent");
        } catch (Exception e) {
            return null;
        }
    }

    private String truncate(String value, int max) {
        if (value == null) {
            return null;
        }
        return value.length() <= max ? value : value.substring(0, max);
    }
}
