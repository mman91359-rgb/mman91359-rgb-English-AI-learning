package com.english.ai.user.config;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.env.Environment;
import org.springframework.core.env.Profiles;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

/**
 * 服务间内部接口鉴权。
 * <p>
 * /internal/** 不经过网关，必须由调用方携带 X-Internal-Token；
 * 本地开发允许使用 application.yml 中的开发默认 token，生产必须显式配置。
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

        String provided = request.getHeader(HEADER);
        if (!token.equals(provided)) {
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
