package com.english.ai.user.dto.admin;

import lombok.Builder;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 管理员用户列表项。
 */
@Data
@Builder
public class AdminUserListItem {

    private Long id;
    private String username;
    private String nickname;
    private String avatarUrl;
    private String cetLevel;
    private String phoneMasked;
    private String roles;
    private Integer status;
    private LocalDateTime lastLoginAt;
    private LocalDateTime createdAt;
    private Integer eloScore;
    private Integer coinBalance;
}
