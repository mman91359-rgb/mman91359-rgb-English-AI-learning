package com.english.ai.user.util;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * 记住我 Cookie 工具。
 * Cookie 名、有效期、Secure 开关、路径均可通过配置调整。
 */
@Component
public class RefreshCookieUtil {

    /** Cookie 名（可配置） */
    @Value("${auth.refresh.cookie-name:refresh_token}")
    private String cookieName;

    /** 有效期秒，默认 7 天（可配置） */
    @Value("${auth.refresh.max-age-seconds:604800}")
    private int maxAgeSeconds;

    /** 生产环境开启 Secure（HTTPS），本地 HTTP 调试可关闭 */
    @Value("${auth.refresh.cookie-secure:true}")
    private boolean secure;

    /** Cookie 路径，限定在刷新/登出接口下，减少暴露面 */
    @Value("${auth.refresh.cookie-path:/api/auth}")
    private String cookiePath;

    /**
     * 写入 Refresh Token Cookie。
     * HttpOnly=true、SameSite=Lax、Path 可配、Secure 可配。
     */
    public void write(HttpServletResponse response, String token) {
        Cookie cookie = new Cookie(cookieName, token);
        cookie.setHttpOnly(true);
        cookie.setSecure(secure);
        cookie.setPath(cookiePath);
        cookie.setMaxAge(maxAgeSeconds);
        cookie.setAttribute("SameSite", "Lax");
        response.addCookie(cookie);
    }

    /**
     * 清除 Cookie（登出时调用）。
     */
    public void clear(HttpServletResponse response) {
        Cookie cookie = new Cookie(cookieName, "");
        cookie.setHttpOnly(true);
        cookie.setSecure(secure);
        cookie.setPath(cookiePath);
        cookie.setMaxAge(0);
        cookie.setAttribute("SameSite", "Lax");
        response.addCookie(cookie);
    }

    /**
     * 从请求读取 Refresh Token（明文）。
     */
    public String read(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        if (cookies == null) {
            return null;
        }
        for (Cookie cookie : cookies) {
            if (cookieName.equals(cookie.getName())) {
                return cookie.getValue();
            }
        }
        return null;
    }
}
