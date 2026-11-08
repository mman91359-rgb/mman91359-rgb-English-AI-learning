package com.english.ai.user.dto;

import lombok.Builder;
import lombok.Data;

/**
 * 登录响应
 */
@Data
@Builder
public class LoginResponse {

    /** JWT Token */
    private String token;

    /** 用户ID */
    private Long userId;

    /** 昵称（展示用） */
    private String username;

    /** 昵称（与 username 一致，保留兼容） */
    private String nickname;

    /** 头像URL */
    private String avatarUrl;

    /** 手机号 */
    private String phone;

    /** 邮箱 */
    private String email;

    /** 考试级别 */
    private String cetLevel;

    /** 角色 */
    private String roles;

    /** ELO隐藏分 */
    private Integer eloScore;

    /** ELO等级名称 */
    private String eloLevel;
}
