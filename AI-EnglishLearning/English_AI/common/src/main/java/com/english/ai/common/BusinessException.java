package com.english.ai.common;

/**
 * 可预期的业务异常。
 * 由全局异常处理器转换为对应的 HTTP 状态码与 Result body。
 * <p>
 * 两种构造方式：
 * <ul>
 *   <li>{@code new BusinessException(ErrorCode.X, "文案")} —— 只有 HTTP 语义，没有业务码（历史写法，兼容保留）；</li>
 *   <li>{@code new BusinessException(BizCode.X)} —— 携带业务码，HTTP 状态由业务码内置的 ErrorCode 推导。</li>
 * </ul>
 * 新增异常一律用 BizCode，这样前端才能按 {@code Result.bizCode} 区分具体业务原因。
 */
public class BusinessException extends RuntimeException {

    private final ErrorCode errorCode;

    private final BizCode bizCode;

    public BusinessException(ErrorCode errorCode) {
        this(errorCode, null, errorCode.getMessage());
    }

    public BusinessException(ErrorCode errorCode, String message) {
        this(errorCode, null, message);
    }

    /** 只给业务码，文案与 HTTP 状态都取自业务码 */
    public BusinessException(BizCode bizCode) {
        this(bizCode.getErrorCode(), bizCode, bizCode.getMessage());
    }

    /** 给业务码，并覆盖默认文案 */
    public BusinessException(BizCode bizCode, String message) {
        this(bizCode.getErrorCode(), bizCode, message);
    }

    private BusinessException(ErrorCode errorCode, BizCode bizCode, String message) {
        super(message);
        this.errorCode = errorCode;
        this.bizCode = bizCode;
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

    public BizCode getBizCode() {
        return bizCode;
    }

    /** 供 Result 直接使用；无业务码时返回 null，序列化为字段省略 */
    public Integer getBizCodeValue() {
        return bizCode == null ? null : bizCode.getCode();
    }
}
