package com.english.ai.common;

/**
 * 统一错误码。
 * <p>
 * code 同时作为 HTTP 状态码使用，前端既能按 HTTP 状态处理，也能读取 Result.code。
 */
public enum ErrorCode {

    BAD_REQUEST(400, "请求参数错误"),
    UNAUTHORIZED(401, "未认证或登录已过期"),
    FORBIDDEN(403, "无权访问该资源"),
    NOT_FOUND(404, "资源不存在"),
    METHOD_NOT_ALLOWED(405, "请求方法不支持"),
    CONFLICT(409, "数据冲突"),
    INTERNAL_ERROR(500, "系统异常，请稍后重试");

    private final int code;
    private final String message;

    ErrorCode(int code, String message) {
        this.code = code;
        this.message = message;
    }

    public int getCode() {
        return code;
    }

    public String getMessage() {
        return message;
    }
}
