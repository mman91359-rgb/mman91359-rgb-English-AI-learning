package com.english.ai.common;

import lombok.Data;

import java.util.UUID;

/**
 * 统一响应结构
 * <pre>
 * {
 *   "code": 200,
 *   "message": "success",
 *   "data": {},
 *   "traceId": "xxx"
 * }
 * </pre>
 */
@Data
public class Result<T> {

    /** 200成功, 400参数错误, 401未授权, 500系统异常 */
    private int code;

    /** 提示信息 */
    private String message;

    /** 业务数据 */
    private T data;

    /** 全链路追踪ID */
    private String traceId;

    /**
     * 业务错误码，成功时为 null。
     * 与 code 的分工：code 是 HTTP 语义（400/403/404/…），bizCode 是前端可编程区分的具体业务原因。
     * 见 {@link BizCode}。
     */
    private Integer bizCode;

    private Result() {
        this.traceId = UUID.randomUUID().toString().substring(0, 8);
    }

    // ========== 静态工厂方法 ==========

    public static <T> Result<T> success(T data) {
        Result<T> r = new Result<>();
        r.code = 200;
        r.message = "success";
        r.data = data;
        return r;
    }

    public static <T> Result<T> success(T data, String message) {
        Result<T> r = success(data);
        r.message = message;
        return r;
    }

    public static <T> Result<T> success() {
        return success(null);
    }

    public static <T> Result<T> error(int code, String message) {
        Result<T> r = new Result<>();
        r.code = code;
        r.message = message;
        return r;
    }

    public static <T> Result<T> error(ErrorCode errorCode) {
        return error(errorCode.getCode(), errorCode.getMessage());
    }

    public static <T> Result<T> error(ErrorCode errorCode, String message) {
        return error(errorCode.getCode(), message);
    }

    public static <T> Result<T> error(String message) {
        return error(500, message);
    }

    /** 带业务码：code 仍是 HTTP 语义，bizCode 供前端精确区分 */
    public static <T> Result<T> error(int code, String message, Integer bizCode) {
        Result<T> r = error(code, message);
        r.bizCode = bizCode;
        return r;
    }

    /** 只给业务码：code 与文案都取自业务码内置映射 */
    public static <T> Result<T> error(BizCode bizCode) {
        return error(bizCode.getErrorCode().getCode(), bizCode.getMessage(), bizCode.getCode());
    }

    /** 给业务码并覆盖默认文案 */
    public static <T> Result<T> error(BizCode bizCode, String message) {
        return error(bizCode.getErrorCode().getCode(), message, bizCode.getCode());
    }

    public static <T> Result<T> badRequest(String message) {
        return error(400, message);
    }

    public static <T> Result<T> unauthorized(String message) {
        return error(401, message);
    }

    public static <T> Result<T> conflict(String message) {
        return error(409, message);
    }

}
