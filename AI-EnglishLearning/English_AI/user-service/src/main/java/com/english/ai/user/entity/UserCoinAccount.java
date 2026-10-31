package com.english.ai.user.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 用户金币账户 — 映射 user_coin_account 表
 */
@Data
@TableName("user_coin_account")
public class UserCoinAccount {

    @TableId(type = IdType.AUTO)
    private Long id;

    /** 用户ID（唯一） */
    private Long userId;

    /** 当前金币余额 */
    private Integer balance;

    /** 累计获得金币 */
    private Integer totalEarned;

    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createdAt;

    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updatedAt;
}
