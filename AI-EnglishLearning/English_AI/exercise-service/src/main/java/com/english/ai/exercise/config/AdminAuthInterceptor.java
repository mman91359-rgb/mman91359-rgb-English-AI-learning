package com.english.ai.exercise.config;

import com.english.ai.common.Result;
import com.english.ai.common.Roles;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import java.nio.charset.StandardCharsets;

/**
 * exercise-service 管理员接口鉴权。
 * 只信任网关写入的可信头；不回查 user_db，避免跨库依赖。
 */
@Component
@RequiredArgsConstructor
public class AdminAuthInterceptor implements HandlerInterceptor {

    public static final String HEADER_GATEWAY_TOKEN = "X-Gateway-Token";
    public static final String HEADER_USER_ID = "X-User-Id";
    public static final String HEADER_USER_ROLE = "X-User-Role";

    private final ObjectMapper objectMapper;

    @Value("${app.internal.token:}")
    private String gatewayToken;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        if (gatewayToken == null || gatewayToken.isBlank()
                || !gatewayToken.equals(request.getHeader(HEADER_GATEWAY_TOKEN))) {
            return reject(response, HttpServletResponse.SC_FORBIDDEN, "缺少可信网关令牌");
        }
        if (request.getHeader(HEADER_USER_ID) == null || request.getHeader(HEADER_USER_ID).isBlank()) {
            return reject(response, HttpServletResponse.SC_UNAUTHORIZED, "缺少用户身份");
        }
        if (!Roles.isAdmin(request.getHeader(HEADER_USER_ROLE))) {
            return reject(response, HttpServletResponse.SC_FORBIDDEN, "需要管理员权限");
        }
        return true;
    }

    private boolean reject(HttpServletResponse response, int status, String message) throws Exception {
        response.setStatus(status);
        response.setCharacterEncoding(StandardCharsets.UTF_8.name());
        response.setContentType("application/json;charset=UTF-8");
        response.getWriter().write(objectMapper.writeValueAsString(Result.error(status, message)));
        return false;
    }
}
