package com.english.ai.user.dto.admin;

import lombok.AllArgsConstructor;
import lombok.Data;

/**
 * 重置密码响应；临时密码只在本次响应返回一次。
 */
@Data
@AllArgsConstructor
public class ResetPasswordResponse {

    private Long userId;
    private String temporaryPassword;
}
