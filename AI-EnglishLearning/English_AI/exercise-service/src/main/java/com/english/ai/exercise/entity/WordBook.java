package com.english.ai.exercise.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 词书主表 — 映射 word_book
 */
@Data
@TableName("word_book")
public class WordBook {

    @TableId(type = IdType.AUTO)
    private Long id;

    /** 词书编码，如 basic_foundation */
    private String code;

    /** 词书名称 */
    private String name;

    /** 目标等级：CET4/CET6 */
    private String level;

    /** 词书说明 */
    private String description;

    /** 展示排序 */
    private Integer sortOrder;

    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createdAt;

    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updatedAt;
}
