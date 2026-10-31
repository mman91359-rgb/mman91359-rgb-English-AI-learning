package com.english.ai.common;

/**
 * 可预期的业务异常。
 * 由全局异常处理器转换为对应的 HTTP 状态码与 Result body。
 */
public class BusinessException extends RuntimeException {

    private final ErrorCode errorCode;

    public BusinessException(ErrorCode errorCode) {
        super(errorCode.getMessage());
        this.errorCode = errorCode;
    }

    public BusinessException(ErrorCode errorCode, String message) {
        super(message);
        this.errorCode = errorCode;
    }

    public int getHttpStatus() {
        return errorCode.getCode();
    }

    public int getCode() {
        return errorCode.getCode();
    }

    public ErrorCode getErrorCode() {
        return errorCode;
    }
}
