package com.english.ai.user.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * 记住我 Refresh Token 配置。
 *
 * <p>用 {@link ConfigurationProperties} 绑定（支持松散绑定），
 * 环境变量 AUTH_REFRESH_COOKIE_SECURE、AUTH_REFRESH_MAX_AGE_SECONDS 等可自动映射，
 * 无需逐个 @Value。</p>
 */
@Data
@Component
@ConfigurationProperties(prefix = "auth.refresh")
public class RefreshAuthProperties {

    /** Cookie 名 */
    private String cookieName = "refresh_token";

    /** 有效期秒，默认 7 天 */
    private long maxAgeSeconds = 604800;

    /** 生产 true（HTTPS）；本地 HTTP 调试设 false（Firefox/Safari 对 http://localhost 拒绝 Secure Cookie） */
    private boolean cookieSecure = true;

    /** SameSite：Lax（同站）；跨站部署需 None + Secure，并补 Origin/Referer 校验 */
    private String cookieSameSite = "Lax";

    /** Cookie 路径，必须与前端实际请求路径一致 */
    private String cookiePath = "/api/auth";

    /** 刷新接口单实例内存限流：同一 key 每分钟最大次数 */
    private int rateLimit = 10;
}
