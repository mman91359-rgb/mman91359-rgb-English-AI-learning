package com.english.ai.exercise.config;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.env.Environment;
import org.springframework.core.env.Profiles;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

/**
 * 服务间内部接口鉴权。
 * /internal/** 不经过网关，必须由调用方携带 X-Internal-Token。
 */
@Component
public class InternalAuthInterceptor implements HandlerInterceptor {

    public static final String HEADER = "X-Internal-Token";

    private final String token;
    private final Environment environment;

    public InternalAuthInterceptor(@Value("${app.internal.token:}") String token,
                                   Environment environment) {
        this.token = token;
        this.environment = environment;
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        if (token == null || token.isBlank()) {
            if (isLocalProfile()) {
                return true;
            }
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "内部接口未配置访问令牌");
            return false;
        }
        if (!token.equals(request.getHeader(HEADER))) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "内部接口鉴权失败");
            return false;
        }
        return true;
    }

    private boolean isLocalProfile() {
        String[] activeProfiles = environment.getActiveProfiles();
        if (activeProfiles.length == 0) {
            return true;
        }
        return environment.acceptsProfiles(Profiles.of("local", "dev", "test"));
    }
}
