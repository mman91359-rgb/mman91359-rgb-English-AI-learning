package com.english.ai.user.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * 每日签到记录 — 映射 user_check_in 表
 */
@Data
@TableName("user_check_in")
public class UserCheckIn {

    @TableId(type = IdType.AUTO)
    private Long id;

    /** 用户ID */
    private Long userId;

    /** 签到日期 */
    private LocalDate checkInDate;

    /** 本次签到获得金币（含连续奖励与里程碑） */
    private Integer rewardCoins;

    /** 签到时的连续天数 */
    private Integer streakDays;

    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createdAt;
}
