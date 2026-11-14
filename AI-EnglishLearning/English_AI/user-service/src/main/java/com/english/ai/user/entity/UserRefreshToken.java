package com.english.ai.user.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 记住我 Refresh Token（V1.0.5 建表）。
 * 数据库仅存 SHA-256 哈希，明文只出现在登录/刷新时下发的 HttpOnly Cookie 里。
 */
@Data
@TableName("user_refresh_token")
public class UserRefreshToken {

    @TableId(type = IdType.AUTO)
    private Long id;

    /** 用户ID */
    private Long userId;

    /** Refresh Token 的 SHA-256 哈希（64位 hex） */
    private String tokenHash;

    /** 令牌系列（UUID），同系列轮换；检测到复用立即吊销整条系列 */
    private String series;

    /** 过期时间 */
    private LocalDateTime expiresAt;

    /** 状态：1有效 0已吊销 */
    private Integer status;

    /** 吊销时间 */
    private LocalDateTime revokedAt;

    /** 最近使用时间 */
    private LocalDateTime lastUsedAt;

    private LocalDateTime createdAt;

    private LocalDateTime updatedAt;
}
