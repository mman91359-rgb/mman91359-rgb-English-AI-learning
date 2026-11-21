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

    /**
     * 校验请求中的 userId 与网关透传身份一致，不一致直接抛出越权异常。
     * <p>
     * 这是「校验并拒绝」的统一入口：调用方只需一行 {@code UserIdentityUtil.requireOwnership(a, b);}，
     * 不要再自己写 {@code if (isForbidden(...)) throw ...}。
     * <p>
     * 统一入口的意义在于：文案只有一份、错误码只有一份，新增接口不会因为漏写而开出一个越权口子。
     */
    public static void requireOwnership(Long headerUserId, Long requestUserId) {
        if (isForbidden(headerUserId, requestUserId)) {
            throw new BusinessException(ErrorCode.FORBIDDEN);
        }
    }
}
