package com.english.ai.user.dto;

import lombok.Data;

/**
 * 注册请求
 */
@Data
public class RegisterRequest {

    /** 昵称（可选，为空时自动生成） */
    private String nickname;

    /** 明文密码 */
    private String password;

    /** 手机号（登录标识，与邮箱至少一个非空） */
    private String phone;

    /** 邮箱（登录标识，与手机号至少一个非空） */
    private String email;

    /** 考试级别: CET4 / CET6 */
    private String cetLevel;

    /** 验证码（注册时用于校验手机号/邮箱，本地模拟固定 123456） */
    private String code;
}
