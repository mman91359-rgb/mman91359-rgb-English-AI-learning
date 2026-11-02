package com.english.ai.user.controller;

import com.english.ai.common.PageResult;
import com.english.ai.common.Result;
import com.english.ai.user.dto.admin.AdminUserDetailVO;
import com.english.ai.user.dto.admin.AdminUserListItem;
import com.english.ai.user.dto.admin.AdminUserQuery;
import com.english.ai.user.dto.admin.ResetPasswordResponse;
import com.english.ai.user.dto.admin.SetUserPasswordRequest;
import com.english.ai.user.dto.admin.UpdateUserRoleRequest;
import com.english.ai.user.dto.admin.UpdateUserStatusRequest;
import com.english.ai.user.service.AdminUserService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/admin/users")
@RequiredArgsConstructor
public class AdminUserController {

    private final AdminUserService adminUserService;

    @GetMapping
    public Result<PageResult<AdminUserListItem>> page(AdminUserQuery query) {
        return Result.success(adminUserService.page(query));
    }

    @GetMapping("/{id}")
    public Result<AdminUserDetailVO> detail(@PathVariable Long id) {
        return Result.success(adminUserService.detail(id));
    }

    @PutMapping("/{id}/status")
    public Result<AdminUserListItem> updateStatus(@PathVariable Long id,
                                                  @Valid @RequestBody UpdateUserStatusRequest request) {
        return Result.success(adminUserService.updateStatus(id, request.getStatus()));
    }

    @PutMapping("/{id}/role")
    public Result<AdminUserListItem> updateRole(@PathVariable Long id,
                                                @Valid @RequestBody UpdateUserRoleRequest request) {
        return Result.success(adminUserService.updateRole(id, request.getRole()));
    }

    @PostMapping("/{id}/reset-password")
    public Result<ResetPasswordResponse> resetPassword(@PathVariable Long id) {
        return Result.success(adminUserService.resetPassword(id));
    }

    @PutMapping("/{id}/password")
    public Result<Void> setPassword(@PathVariable Long id,
                                    @Valid @RequestBody SetUserPasswordRequest request) {
        adminUserService.setPassword(id, request.getPassword());
        return Result.success();
    }
}
