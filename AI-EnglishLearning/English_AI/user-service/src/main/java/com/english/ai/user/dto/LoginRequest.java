package com.english.ai.user.dto;

import lombok.Data;

/**
 * 登录请求
 */
@Data
public class LoginRequest {

    /** 登录标识：手机号 或 邮箱 */
    private String account;

    /** 明文密码 */
    private String password;
}
