package com.english.ai.user.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 统一验证码记录 — 映射 user_db.sms_verification_code 表。
 * 验证码只存带独立随机盐的 SHA-256 摘要，不存明文。
 */
@Data
@TableName("sms_verification_code")
public class SmsVerificationCode {

    @TableId(type = IdType.AUTO)
    private Long id;

    /** 接收地址：手机号或邮箱 */
    private String recipient;

    /** 业务场景：REGISTER / FORGOT_PASSWORD / PHONE_BIND */
    private String scene;

    /** 换绑场景绑定的用户ID，其余场景为 null */
    private Long userId;

    /** SHA-256(salt|recipient|scene|code) 十六进制 */
    private String codeHash;

    /** 每条记录独立的随机盐（16 字节十六进制） */
    private String salt;

    /** 过期时间 */
    private LocalDateTime expireAt;

    /** 是否已消费：0 未使用，1 已使用 */
    private Integer used;

    /** 校验失败次数 */
    private Integer tryCount;

    /** 签发时间 */
    private LocalDateTime createdAt;
}
