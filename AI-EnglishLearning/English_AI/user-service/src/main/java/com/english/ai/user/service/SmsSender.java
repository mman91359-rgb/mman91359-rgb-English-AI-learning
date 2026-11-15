package com.english.ai.user.service;

/**
 * 验证码下发通道。
 * 当前只有本地模拟实现；接入真实短信/邮件时新增实现类即可，签发与校验逻辑不变。
 */
public interface SmsSender {

    /**
     * 下发验证码到接收地址
     *
     * @param recipient 手机号或邮箱
     * @param code      明文验证码（仅本次下发使用）
     */
    void send(String recipient, String code);
}
