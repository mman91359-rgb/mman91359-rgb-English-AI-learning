package com.english.ai.exercise.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 用户收藏单词 — 映射 user_word_favorite（与句子收藏 user_favorite 分表）
 */
@Data
@TableName("user_word_favorite")
public class UserWordFavorite {

    @TableId(type = IdType.AUTO)
    private Long id;

    private Long userId;

    /** 关联 word_dictionary.id（可空） */
    private Long wordId;

    /** 单词（小写） */
    private String word;

    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createdAt;
}
