package com.english.ai.user.config;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.english.ai.common.PasswordUtil;
import com.english.ai.common.Roles;
import com.english.ai.user.entity.SysUser;
import com.english.ai.user.mapper.UserMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Component;

/**
 * 管理员引导：仅在显式配置 ADMIN_BOOTSTRAP_PASSWORD 且系统没有启用管理员时创建。
 * 不在 SQL 中写死账号/密码，避免把可登录凭据提交到仓库。
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class AdminBootstrapRunner implements ApplicationRunner {

    private final UserMapper userMapper;

    @Value("${app.admin.bootstrap.username:admin}")
    private String adminUsername;

    @Value("${app.admin.bootstrap.password:}")
    private String adminPassword;

    @Override
    public void run(ApplicationArguments args) {
        if (adminPassword == null || adminPassword.isBlank()) {
            log.info("未配置 ADMIN_BOOTSTRAP_PASSWORD，跳过管理员引导");
            return;
        }
        Long adminCount = userMapper.selectCount(new LambdaQueryWrapper<SysUser>()
                .eq(SysUser::getRoles, Roles.ADMIN)
                .eq(SysUser::getStatus, 1));
        if (adminCount != null && adminCount > 0) {
            log.info("已存在启用管理员，跳过管理员引导");
            return;
        }
        String username = adminUsername == null || adminUsername.isBlank() ? "admin" : adminUsername.trim();
        if (adminPassword.length() < 12 || adminPassword.equalsIgnoreCase(username)) {
            log.error("管理员初始密码强度不足（至少12位且不能等于用户名），跳过管理员引导");
            return;
        }
        SysUser existing = userMapper.selectOne(new LambdaQueryWrapper<SysUser>()
                .eq(SysUser::getUsername, username));
        if (existing != null) {
            log.error("用户名 {} 已被占用且不是启用管理员，跳过管理员引导", username);
            return;
        }

        SysUser admin = new SysUser();
        admin.setUsername(username);
        admin.setPassword(PasswordUtil.encode(adminPassword));
        admin.setNickname("管理员");
        admin.setCetLevel("CET4");
        admin.setRoles(Roles.ADMIN);
        admin.setStatus(1);
        try {
            userMapper.insert(admin);
            log.info("管理员引导完成: username={}", username);
        } catch (DuplicateKeyException e) {
            log.info("管理员已由其他实例创建，忽略本次引导");
        }
    }
}
