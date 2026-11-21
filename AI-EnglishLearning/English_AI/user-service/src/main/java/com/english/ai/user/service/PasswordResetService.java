package com.english.ai.user.service;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.english.ai.common.BusinessException;
import com.english.ai.common.BizCode;
import com.english.ai.common.PasswordUtil;
import com.english.ai.user.dto.ForgotPasswordRequest;
import com.english.ai.user.entity.SysUser;
import com.english.ai.user.enums.VerificationScene;
import com.english.ai.user.mapper.UserMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 手机号找回密码。
 * <p>验证码由统一验证码服务签发与消费；下发通道为本地模拟，prod profile 由该服务拒绝。</p>
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class PasswordResetService {

    private final UserMapper userMapper;
    private final VerificationCodeService verificationCodeService;

    @Transactional
    public void resetByPhone(ForgotPasswordRequest request) {
        if (!PasswordUtil.isValidPassword(request.getNewPassword())) {
            throw new BusinessException(BizCode.PASSWORD_TOO_WEAK, "新密码至少10位，且需包含小写字母和数字");
        }

        List<SysUser> users = userMapper.selectList(new LambdaQueryWrapper<SysUser>()
                .eq(SysUser::getPhone, request.getPhone()));
        if (users.isEmpty()) {
            throw new BusinessException(BizCode.PHONE_NOT_BOUND, "手机号未绑定账号");
        }
        if (users.size() > 1) {
            throw new BusinessException(BizCode.PHONE_MULTI_ACCOUNT, "该手机号关联多个账号，请联系管理员");
        }

        SysUser user = users.get(0);
        if (user.getStatus() == null || user.getStatus() == 0) {
            throw new BusinessException(BizCode.ACCOUNT_DISABLED, "账号已被禁用");
        }
        // 校验并消费验证码：独立事务提交，改密失败也不会让同一验证码被反复重试
        verificationCodeService.verifyAndConsume(
                request.getPhone().trim(), VerificationScene.FORGOT_PASSWORD,
                request.getCode(), null);
        user.setPassword(PasswordUtil.encode(request.getNewPassword()));
        userMapper.updateById(user);
        log.info("手机号找回密码成功: userId={}", user.getId());
    }
}
