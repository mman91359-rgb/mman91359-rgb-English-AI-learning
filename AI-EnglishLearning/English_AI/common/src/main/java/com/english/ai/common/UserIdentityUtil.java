package com.english.ai.common;

/**
 * 网关透传用户身份校验工具。
 * <p>
 * 网关校验 JWT 后透传 X-User-Id；下游服务用该工具确认请求中的 userId
 * 与网关头一致，避免已登录用户通过修改 userId 访问他人数据。
 */
public final class UserIdentityUtil {

    private UserIdentityUtil() {
    }

    /**
     * 网关透传的 X-User-Id 与请求中的 userId 不一致时视为越权。
     * 本地直连（没有网关）时 headerUserId 为空，不做限制。
     */
    public static boolean isForbidden(Long headerUserId, Long requestUserId) {
        return headerUserId != null && requestUserId != null && !headerUserId.equals(requestUserId);
    }
}
