package com.english.ai.user.config;

/**
 * 当前管理员请求上下文。
 * 由 AdminAuthInterceptor 写入，afterCompletion 必须清理，避免线程池串号。
 */
public final class AdminContext {

    private static final ThreadLocal<AdminInfo> HOLDER = new ThreadLocal<>();

    private AdminContext() {
    }

    public static void set(Long operatorId, String username, String ip) {
        HOLDER.set(new AdminInfo(operatorId, username, ip));
    }

    public static AdminInfo get() {
        return HOLDER.get();
    }

    public static Long getOperatorId() {
        AdminInfo info = HOLDER.get();
        return info == null ? null : info.operatorId();
    }

    public static String getUsername() {
        AdminInfo info = HOLDER.get();
        return info == null ? null : info.username();
    }

    public static String getIp() {
        AdminInfo info = HOLDER.get();
        return info == null ? null : info.ip();
    }

    public static void clear() {
        HOLDER.remove();
    }

    public record AdminInfo(Long operatorId, String username, String ip) {
    }
}
