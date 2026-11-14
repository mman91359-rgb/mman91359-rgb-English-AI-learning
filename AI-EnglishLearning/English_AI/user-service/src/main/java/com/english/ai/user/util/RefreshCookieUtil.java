package com.english.ai.user.util;

import com.english.ai.user.config.RefreshAuthProperties;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

/**
 * 记住我 Cookie 工具。
 * 写入与清除都走同一份配置（RefreshAuthProperties），保证 Path/Domain/SameSite 完全一致，
 * 避免登出时因参数不一致导致 Cookie 残留僵尸凭证。
 */
@Component
@RequiredArgsConstructor
public class RefreshCookieUtil {

    private final RefreshAuthProperties props;

    /**
     * 写入 Refresh Token Cookie。
     * HttpOnly=true、SameSite 可配、Path 可配、Secure 可配。
     */
    public void write(HttpServletResponse response, String token) {
        Cookie cookie = new Cookie(props.getCookieName(), token);
        cookie.setHttpOnly(true);
        cookie.setSecure(props.isCookieSecure());
        cookie.setPath(props.getCookiePath());
        cookie.setMaxAge((int) props.getMaxAgeSeconds());
        cookie.setAttribute("SameSite", props.getCookieSameSite());
        response.addCookie(cookie);
    }

    /**
     * 清除 Cookie（登出时调用）。Path/Domain/SameSite 与写入完全一致。
     */
    public void clear(HttpServletResponse response) {
        Cookie cookie = new Cookie(props.getCookieName(), "");
        cookie.setHttpOnly(true);
        cookie.setSecure(props.isCookieSecure());
        cookie.setPath(props.getCookiePath());
        cookie.setMaxAge(0);
        cookie.setAttribute("SameSite", props.getCookieSameSite());
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
            if (props.getCookieName().equals(cookie.getName())) {
                return cookie.getValue();
            }
        }
        return null;
    }
}
