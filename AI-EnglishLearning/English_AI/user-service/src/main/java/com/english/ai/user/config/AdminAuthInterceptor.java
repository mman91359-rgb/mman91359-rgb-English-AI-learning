package com.english.ai.user.config;

import com.english.ai.common.ErrorCode;
import com.english.ai.common.Result;
import com.english.ai.common.Roles;
import com.english.ai.user.entity.SysUser;
import com.english.ai.user.mapper.UserMapper;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import java.nio.charset.StandardCharsets;

/**
 * 管理员接口鉴权。
 * <p>
 * 只信任网关写入的 X-Gateway-Token / X-User-Id / X-User-Role；
 * 并回查数据库确认用户仍启用且仍为管理员，使禁用/降权立即生效。
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class AdminAuthInterceptor implements HandlerInterceptor {

    public static final String HEADER_GATEWAY_TOKEN = "X-Gateway-Token";
    public static final String HEADER_USER_ID = "X-User-Id";
    public static final String HEADER_USER_ROLE = "X-User-Role";

    private final UserMapper userMapper;
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

        Long userId = parseLong(request.getHeader(HEADER_USER_ID));
        if (userId == null) {
            return reject(response, HttpServletResponse.SC_UNAUTHORIZED, "缺少用户身份");
        }

        String role = request.getHeader(HEADER_USER_ROLE);
        if (!Roles.isAdmin(role)) {
            return reject(response, HttpServletResponse.SC_FORBIDDEN, "需要管理员权限");
        }

        SysUser user = userMapper.selectById(userId);
        if (user == null || !Integer.valueOf(1).equals(user.getStatus()) || !Roles.isAdmin(user.getRoles())) {
            return reject(response, HttpServletResponse.SC_FORBIDDEN, "管理员身份已失效");
        }

        // 审计用操作者名称：优先昵称，昵称为空回退用户名
        String operatorName = user.getNickname() != null && !user.getNickname().isBlank()
                ? user.getNickname()
                : user.getUsername();
        AdminContext.set(userId, operatorName, resolveIp(request));
        return true;
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
        AdminContext.clear();
    }

    private boolean reject(HttpServletResponse response, int status, String message) throws Exception {
        response.setStatus(status);
        response.setCharacterEncoding(StandardCharsets.UTF_8.name());
        response.setContentType("application/json;charset=UTF-8");
        response.getWriter().write(objectMapper.writeValueAsString(Result.error(status, message)));
        return false;
    }

    private Long parseLong(String value) {
        if (value == null || value.isBlank()) {
            return null;
        }
        try {
            return Long.valueOf(value.trim());
        } catch (NumberFormatException e) {
            return null;
        }
    }

    private String resolveIp(HttpServletRequest request) {
        String realIp = request.getHeader("X-Real-IP");
        if (realIp != null && !realIp.isBlank()) {
            return trim(realIp, 64);
        }
        String forwarded = request.getHeader("X-Forwarded-For");
        if (forwarded != null && !forwarded.isBlank()) {
            return trim(forwarded.split(",")[0].trim(), 64);
        }
        return trim(request.getRemoteAddr(), 64);
    }

    private String trim(String value, int max) {
        if (value == null) {
            return null;
        }
        return value.length() <= max ? value : value.substring(0, max);
    }
}
