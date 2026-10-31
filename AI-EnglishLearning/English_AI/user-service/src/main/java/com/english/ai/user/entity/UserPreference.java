package com.english.ai.user.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 用户学习偏好 — 映射 user_preference 表
 */
@Data
@TableName("user_preference")
public class UserPreference {

    @TableId(type = IdType.AUTO)
    private Long id;

    /** 用户ID（唯一） */
    private Long userId;

    /** 每组单词数量（5-50），NULL 表示尚未设置 */
    private Integer vocabGroupSize;

    /** 每日新背单词数（1-50），NULL 表示尚未设置 */
    private Integer dailyNewWords;

    /** 每日复习单词数（0-50），NULL 表示尚未设置 */
    private Integer dailyReviewWords;

    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createdAt;

    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updatedAt;
}
