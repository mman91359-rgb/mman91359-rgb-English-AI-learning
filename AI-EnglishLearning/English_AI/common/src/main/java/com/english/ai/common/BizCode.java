package com.english.ai.common;

/**
 * 业务错误码。
 * <p>
 * 与 {@link ErrorCode} 的分工：
 * <ul>
 *   <li>{@code ErrorCode} 决定 HTTP 状态与粗粒度语义（400 / 403 / 404 / 409 / 429 / 500）；</li>
 *   <li>{@code BizCode} 决定前端可编程区分的具体业务原因，通过 {@code Result.bizCode} 下发。</li>
 * </ul>
 * 这样前端既保留了按 HTTP 状态做通用处理的能力（{@code Result.code} 语义不变），
 * 又能按 {@code bizCode} 精确区分「验证码错误」和「余额不足」这类同状态不同因的场景。
 * <p>
 * 编码规则：3 位以内整数，按域分段，段内连续。
 * <pre>
 *   001-009  通用
 *   011-019  user 域
 *   021-029  admin 后台
 *   031-039  exercise 域
 *   041-049  learning 域
 *   051-059  ai 域
 * </pre>
 * 新增码：先在对应段末尾追加，再同步本文档与前端。号码一旦上线不得复用。
 */
public enum BizCode {

    // ===== 通用 001-009 =====

    /** 参数校验未通过：类型不匹配、必填缺失、格式错误、取值范围非法 */
    PARAM_INVALID(1, ErrorCode.BAD_REQUEST, "请求参数不合法"),

    /** 越权：请求中的 userId 与网关透传身份不一致 */
    OWNERSHIP_DENIED(2, ErrorCode.FORBIDDEN, "无权访问该资源"),

    /** 目标资源不存在 */
    RESOURCE_NOT_FOUND(3, ErrorCode.NOT_FOUND, "资源不存在"),

    /** 当前状态不允许该操作：如只有草稿可发布、已审核不可再审 */
    STATE_CONFLICT(4, ErrorCode.CONFLICT, "当前状态不允许该操作"),

    /** 未登录或登录态失效 */
    UNAUTHENTICATED(5, ErrorCode.UNAUTHORIZED, "未登录或登录已过期"),

    /** 触发限流 */
    RATE_LIMITED(6, ErrorCode.TOO_MANY_REQUESTS, "操作过于频繁，请稍后重试"),

    // ===== user 域 011-019 =====

    USER_NOT_FOUND(11, ErrorCode.NOT_FOUND, "用户不存在"),
    ACCOUNT_DISABLED(12, ErrorCode.FORBIDDEN, "账号已被禁用"),
    PASSWORD_TOO_WEAK(13, ErrorCode.BAD_REQUEST, "新密码至少10位，且需包含小写字母和数字"),
    PHONE_NOT_BOUND(14, ErrorCode.BAD_REQUEST, "手机号未绑定账号"),
    PHONE_MULTI_ACCOUNT(15, ErrorCode.CONFLICT, "该手机号关联多个账号，请联系管理员"),
    VERIFY_CODE_INVALID(16, ErrorCode.BAD_REQUEST, "验证码错误"),
    MOCK_CODE_LOCAL_ONLY(17, ErrorCode.BAD_REQUEST, "模拟验证码仅本地开发可用"),
    NOTIFICATION_NOT_FOUND(18, ErrorCode.NOT_FOUND, "通知不存在"),

    // ===== admin 域 021-029 =====

    ACTIVITY_STATE_INVALID(21, ErrorCode.CONFLICT, "当前活动状态不允许该操作"),
    NOTICE_STATE_INVALID(22, ErrorCode.CONFLICT, "当前通知状态不允许该操作"),
    TIME_RANGE_INVALID(23, ErrorCode.BAD_REQUEST, "时间范围不合法"),
    LAST_ADMIN_REQUIRED(24, ErrorCode.CONFLICT, "至少保留一个启用状态的管理员"),
    SELF_OPERATION_DENIED(25, ErrorCode.FORBIDDEN, "不能修改自己的账号状态或角色"),
    ROLE_INVALID(26, ErrorCode.BAD_REQUEST, "角色取值不合法"),

    // ===== exercise 域 031-039 =====

    QUESTION_NOT_FOUND(31, ErrorCode.NOT_FOUND, "题目不存在"),
    MODULE_MISMATCH(32, ErrorCode.BAD_REQUEST, "模块类型与题目不一致"),
    QUESTION_TYPE_INVALID(33, ErrorCode.BAD_REQUEST, "题型不合法"),
    ANSWER_REQUIRED_FIRST(34, ErrorCode.BAD_REQUEST, "请先作答后再查看原文"),
    REVIEW_STATE_CONFLICT(35, ErrorCode.CONFLICT, "该题已被其他管理员审核"),
    WORD_BOOK_NOT_FOUND(36, ErrorCode.NOT_FOUND, "词书不存在"),
    ESSAY_NOT_FOUND(37, ErrorCode.NOT_FOUND, "作文不存在"),
    TOPIC_NOT_FOUND(38, ErrorCode.NOT_FOUND, "写作题目不存在"),
    DRAFT_SAVE_FAILED(39, ErrorCode.INTERNAL_ERROR, "草稿保存失败");

    private final int code;
    private final ErrorCode errorCode;
    private final String message;

    BizCode(int code, ErrorCode errorCode, String message) {
        this.code = code;
        this.errorCode = errorCode;
        this.message = message;
    }

    /** 前端可编程区分的业务码 */
    public int getCode() {
        return code;
    }

    /** 该业务码对应的 HTTP 语义 */
    public ErrorCode getErrorCode() {
        return errorCode;
    }

    public String getMessage() {
        return message;
    }
}
