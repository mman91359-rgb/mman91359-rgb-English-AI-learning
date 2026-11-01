package com.english.ai.exercise.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.math.BigDecimal;
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

    /** 文章段播放时长（秒） */
    private Integer durationSeconds;

    /** 完整音频总时长（秒） */
    private Integer audioTotalSeconds;

    /** 文章段起点（秒，包含） */
    private BigDecimal audioStartSeconds;

    /** 文章段终点（秒，不包含） */
    private BigDecimal audioEndSeconds;

    /** 题目段起点（秒，包含） */
    private BigDecimal questionStartSeconds;

    /** 题目段终点（秒，不包含） */
    private BigDecimal questionEndSeconds;

    /** 题组/音频段落标识 */
    private String groupKey;

    /** 听力题型 */
    private String listeningType;

    /** 片段 LRC 字幕（完整音频绝对时间轴） */
    private String lrcContent;

    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createdAt;

    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updatedAt;
}
