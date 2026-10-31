package com.english.ai.exercise.client;

import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.Map;

/**
 * 题目审核操作审计上报。
 * 远程写入失败只 WARN，不回滚审核主流程。
 */
@Slf4j
@Component
public class AdminAuditClient {

    @Resource(name = "auditRestTemplate")
    private RestTemplate auditRestTemplate;

    @Value("${service.user.url:http://localhost:8081}")
    private String userServiceUrl;

    @Value("${app.internal.token:}")
    private String internalToken;

    public void record(Long operatorId, String operatorName, String action, String targetType,
                       String targetId, String detail, String ip, String userAgent, String result) {
        if (internalToken == null || internalToken.isBlank()) {
            return;
        }
        try {
            Map<String, Object> body = new HashMap<>();
            body.put("operatorId", operatorId);
            body.put("operatorName", operatorName);
            body.put("action", action);
            body.put("targetType", targetType);
            body.put("targetId", targetId);
            body.put("detail", detail);
            body.put("ip", ip);
            body.put("userAgent", userAgent);
            body.put("result", result);

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            headers.set("X-Internal-Token", internalToken);
            auditRestTemplate.postForEntity(userServiceUrl + "/internal/admin/operation-logs",
                    new HttpEntity<>(body, headers), String.class);
        } catch (Exception e) {
            log.warn("审计上报失败（不影响审核主流程）: action={}, targetId={}, reason={}",
                    action, targetId, e.getMessage());
        }
    }
}
