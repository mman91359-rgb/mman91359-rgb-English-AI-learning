package com.english.ai.user.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 金币流水 — 映射 user_coin_transaction 表
 */
@Data
@TableName("user_coin_transaction")
public class UserCoinTransaction {

    @TableId(type = IdType.AUTO)
    private Long id;

    /** 用户ID */
    private Long userId;

    /** 金币变动值（正数为获得） */
    private Integer amount;

    /** 业务类型 */
    private String bizType;

    /** 业务幂等键（唯一） */
    private String bizKey;

    /** 流水描述 */
    private String description;

    /** 变动后余额 */
    private Integer balanceAfter;

    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createdAt;
}
