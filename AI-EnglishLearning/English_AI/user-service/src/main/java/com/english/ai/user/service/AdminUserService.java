package com.english.ai.user.service;

import com.english.ai.common.PageResult;
import com.english.ai.user.dto.admin.AdminUserDetailVO;
import com.english.ai.user.dto.admin.AdminUserListItem;
import com.english.ai.user.dto.admin.AdminUserQuery;
import com.english.ai.user.dto.admin.ResetPasswordResponse;

/**
 * 管理端用户管理。
 */
public interface AdminUserService {

    PageResult<AdminUserListItem> page(AdminUserQuery query);

    AdminUserDetailVO detail(Long userId);

    AdminUserListItem updateStatus(Long userId, Integer status);

    AdminUserListItem updateRole(Long userId, String role);

    ResetPasswordResponse resetPassword(Long userId);
}
