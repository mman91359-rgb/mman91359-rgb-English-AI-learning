package com.english.ai.exercise.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 听力音频元数据。
 * 题目正文仍存放在 question_content，本表只补充音频地址、原文和时长。
 */
@Data
@TableName("listening_audio")
public class ListeningAudio {

    @TableId(type = IdType.AUTO)
    private Long id;

    /** 关联 question_info.id，一题一音频 */
    private Long questionId;

    /** 音频地址，如 /audio/listening-cet4-01.mp3 */
    private String audioUrl;

    /** 听力原文 */
    private String transcript;

    /** 音频时长（秒） */
    private Integer durationSeconds;

    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createdAt;

    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updatedAt;
}
