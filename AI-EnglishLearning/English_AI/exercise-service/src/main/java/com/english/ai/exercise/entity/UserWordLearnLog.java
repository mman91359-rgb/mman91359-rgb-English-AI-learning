package com.english.ai.exercise.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 单词学习事件日志 — 映射 user_word_learn_log
 */
@Data
@TableName("user_word_learn_log")
public class UserWordLearnLog {

    @TableId(type = IdType.AUTO)
    private Long id;

    private Long userId;

    /** 关联 word_dictionary.id（可空） */
    private Long wordId;

    /** 单词（小写） */
    private String word;

    /** 事件类型: LEARN/REVIEW/MASTER/FAVORITE/UNFAVORITE/IGNORE */
    private String eventType;

    /** 作答结果: CORRECT/WRONG（仅 LEARN/REVIEW/MASTER 有值，其余为 null） */
    private String result;

    /** 当时词书编码（可空） */
    private String bookCode;

    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createdAt;
}
