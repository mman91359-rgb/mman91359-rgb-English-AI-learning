package com.english.ai.user.service;

import com.english.ai.user.dto.VerificationCodeSendResult;
import com.english.ai.user.enums.VerificationScene;

/**
 * 统一验证码服务：签发、限频、过期、失败次数、单次消费。
 * 下发通道当前为本地模拟（非 prod profile 可用）。
 */
public interface VerificationCodeService {

    /**
     * 签发验证码
     *
     * @param recipient 接收地址（手机号或邮箱）
     * @param scene     业务场景
     * @param userId    换绑场景必填，其余场景传 null
     */
    VerificationCodeSendResult send(String recipient, VerificationScene scene, Long userId);

    /**
     * 校验并消费验证码；失败抛出 BusinessException。
     * 使用独立事务提交，避免业务方法回滚时把失败次数或消费状态一并回滚。
     */
    void verifyAndConsume(String recipient, VerificationScene scene, String code, Long userId);
}
