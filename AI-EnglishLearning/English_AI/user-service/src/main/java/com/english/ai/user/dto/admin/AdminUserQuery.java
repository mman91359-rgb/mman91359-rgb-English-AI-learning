package com.english.ai.user.dto.admin;

import lombok.Data;

/**
 * 管理员用户列表查询条件。
 */
@Data
public class AdminUserQuery {

    private String keyword;
    private String role;
    private Integer status;
    private String cetLevel;
    private String startDate;
    private String endDate;
    private int page = 1;
    private int size = 20;
}
