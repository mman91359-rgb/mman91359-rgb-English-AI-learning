package com.english.ai.exercise.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * 学习会话活跃时长 — 映射 user_study_session 表
 */
@Data
@TableName("user_study_session")
public class UserStudySession {

    @TableId(type = IdType.AUTO)
    private Long id;

    private Long userId;

    /** 客户端会话唯一键 */
    private String sessionKey;

    /** 会话开始日期（Asia/Shanghai） */
    private LocalDate statDate;

    /** 有效活跃秒数 */
    private Integer activeSeconds;

    private LocalDateTime startedAt;

    private LocalDateTime lastReportedAt;

    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createdAt;

    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updatedAt;
}
