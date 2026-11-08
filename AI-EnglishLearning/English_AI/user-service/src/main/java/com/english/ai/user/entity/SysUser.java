package com.english.ai.user.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 用户实体 — 映射 sys_user 表
 */
@Data
@TableName("sys_user")
public class SysUser {

    @TableId(type = IdType.AUTO)
    private Long id;

    /** 昵称（展示用，可空可重复；不再是登录标识） */
    private String username;

    /** BCrypt加密密码 */
    private String password;

    /** 昵称（冗余展示字段，与 username 保持一致） */
    private String nickname;

    /** 头像URL */
    private String avatarUrl;

    /** 考试级别: CET4 / CET6 */
    private String cetLevel;

    /** 手机号（登录标识之一） */
    private String phone;

    /** 邮箱（登录标识之一） */
    private String email;

    /** 角色: ROLE_USER / ROLE_ADMIN */
    private String roles;

    /** 状态: 1=正常, 0=禁用 */
    private Integer status;

    /** 最后登录时间 */
    private LocalDateTime lastLoginAt;

    /** 创建时间 */
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createdAt;

    /** 更新时间 */
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updatedAt;
}

