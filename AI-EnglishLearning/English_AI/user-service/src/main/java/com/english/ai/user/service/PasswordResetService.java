package com.english.ai.user.service;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.english.ai.common.BusinessException;
import com.english.ai.common.ErrorCode;
import com.english.ai.common.PasswordUtil;
import com.english.ai.user.dto.ForgotPasswordRequest;
import com.english.ai.user.entity.SysUser;
import com.english.ai.user.mapper.UserMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.env.Environment;
import org.springframework.core.env.Profiles;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 手机号找回密码。
 * <p>
 * 当前为本地模拟验证码：固定 123456；prod profile 下直接拒绝。
 * 后续接真实短信时，只需替换验证码校验部分，保持接口不变。
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class PasswordResetService {

    /** 本地模拟验证码；生产 profile 不允许使用 */
    private static final String MOCK_SMS_CODE = "123456";

    private final UserMapper userMapper;
    private final Environment environment;

    @Transactional
    public void resetByPhone(ForgotPasswordRequest request) {
        if (environment.acceptsProfiles(Profiles.of("prod"))) {
            throw new BusinessException(ErrorCode.BAD_REQUEST, "模拟验证码仅本地开发可用");
        }
        if (!MOCK_SMS_CODE.equals(request.getCode())) {
            throw new BusinessException(ErrorCode.BAD_REQUEST, "验证码错误");
        }
        if (!PasswordUtil.isValidPassword(request.getNewPassword())) {
            throw new BusinessException(ErrorCode.BAD_REQUEST, "新密码至少10位，且需包含小写字母和数字");
        }

        List<SysUser> users = userMapper.selectList(new LambdaQueryWrapper<SysUser>()
                .eq(SysUser::getPhone, request.getPhone()));
        if (users.isEmpty()) {
            throw new BusinessException(ErrorCode.BAD_REQUEST, "手机号未绑定账号");
        }
        if (users.size() > 1) {
            throw new BusinessException(ErrorCode.CONFLICT, "该手机号关联多个账号，请联系管理员");
        }

        SysUser user = users.get(0);
        if (user.getStatus() == null || user.getStatus() == 0) {
            throw new BusinessException(ErrorCode.BAD_REQUEST, "账号已被禁用");
        }
        user.setPassword(PasswordUtil.encode(request.getNewPassword()));
        userMapper.updateById(user);
        log.info("手机号找回密码成功: userId={}", user.getId());
    }
}
