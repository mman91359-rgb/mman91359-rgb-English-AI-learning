package com.english.ai.user.dto.admin;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Data;

/**
 * 管理员为指定用户设置新密码。
 */
@Data
public class SetUserPasswordRequest {

    @NotBlank(message = "新密码不能为空")
    @Size(min = 6, max = 72, message = "密码长度需为 6-72 位")
    private String password;
}
