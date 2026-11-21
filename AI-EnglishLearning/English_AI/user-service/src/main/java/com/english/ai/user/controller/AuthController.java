package com.english.ai.user.controller;

import com.english.ai.common.BizCode;
import com.english.ai.common.JwtUtil;
import com.english.ai.common.Result;
import com.english.ai.common.Roles;
import com.english.ai.user.dto.LoginResponse;
import com.english.ai.user.entity.SysUser;
import com.english.ai.user.service.RefreshTokenService;
import com.english.ai.user.service.UserService;
import com.english.ai.user.util.RefreshCookieUtil;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 认证辅助接口：记住我刷新 + 登出。
 *
 * <p>这两个接口无 Access Token，走 HttpOnly Cookie 里的 Refresh Token 鉴权；
 * 网关已将其加入 JWT 白名单，鉴权前移到本服务内部。</p>
 */
@Slf4j
@RestController
@RequestMapping("/auth")
@RequiredArgsConstructor
public class AuthController {

    private final RefreshTokenService refreshTokenService;
    private final RefreshCookieUtil cookieUtil;
    private final UserService userService;

    /** 管理员 Token 有效期（与 UserServiceImpl 保持一致） */
    @Value("${jwt.admin-expiration:7200000}")
    private long adminExpiration;

    /**
     * 刷新登录态：用 Refresh Token 换新 Access Token。
     * 令牌轮换 + 复用检测，复用则吊销整条系列。
     */
    @PostMapping("/refresh")
    public Result<LoginResponse> refresh(HttpServletRequest request, HttpServletResponse response) {
        String raw = cookieUtil.read(request);
        if (raw == null || raw.isBlank()) {
            return Result.unauthorized("缺少记住我凭证");
        }

        // 限流：按 IP 粗粒度限流，防暴力枚举
        String clientKey = "ip:" + resolveIp(request);
        if (!refreshTokenService.tryAcquire(clientKey)) {
            log.warn("刷新接口限流触发: key={}", clientKey);
            return Result.error(BizCode.RATE_LIMITED, "刷新过于频繁，请稍后重试");
        }

        // 先反查 userId，做越权前置校验（Refresh Token 本身不含 userId）
        Long userId = refreshTokenService.findUserIdByToken(raw);
        if (userId == null) {
            cookieUtil.clear(response);
            return Result.unauthorized("凭证无效或已过期");
        }

        // 轮换（内部做复用检测 + 过期校验 + 状态校验）
        String newRaw = refreshTokenService.rotate(raw);
        if (newRaw == null) {
            cookieUtil.clear(response);
            return Result.unauthorized("凭证已失效，请重新登录");
        }

        // 重新签发 Access Token
        SysUser user = userService.getById(userId);
        if (user == null || user.getStatus() == 0) {
            cookieUtil.clear(response);
            return Result.unauthorized("账号已被禁用");
        }

        String nickname = user.getNickname() != null ? user.getNickname() : user.getUsername();
        String accessToken = Roles.isAdmin(user.getRoles())
                ? JwtUtil.generate(user.getId(), nickname, user.getRoles(), adminExpiration)
                : JwtUtil.generate(user.getId(), nickname, user.getRoles());

        // 更新 Cookie 为新 Refresh Token
        cookieUtil.write(response, newRaw);

        return Result.success(LoginResponse.builder()
                .token(accessToken)
                .userId(user.getId())
                .username(nickname)
                .nickname(nickname)
                .avatarUrl(user.getAvatarUrl())
                .phone(user.getPhone())
                .email(user.getEmail())
                .cetLevel(user.getCetLevel())
                .roles(user.getRoles())
                .build());
    }

    /**
     * 登出：吊销当前 Refresh Token + 清 Cookie。
     * 即使 Access Token 已过期也能正常登出。
     */
    @PostMapping("/logout")
    public Result<Boolean> logout(HttpServletRequest request, HttpServletResponse response) {
        String raw = cookieUtil.read(request);
        if (raw != null && !raw.isBlank()) {
            refreshTokenService.revokeByToken(raw);
        }
        cookieUtil.clear(response);
        return Result.success(true);
    }

    /**
     * 解析客户端 IP（优先 X-Forwarded-For / X-Real-IP）。
     */
    private String resolveIp(HttpServletRequest request) {
        String realIp = request.getHeader("X-Real-IP");
        if (realIp != null && !realIp.isBlank()) {
            return realIp.length() > 64 ? realIp.substring(0, 64) : realIp;
        }
        String forwarded = request.getHeader("X-Forwarded-For");
        if (forwarded != null && !forwarded.isBlank()) {
            return forwarded.split(",")[0].trim();
        }
        return request.getRemoteAddr();
    }
}
