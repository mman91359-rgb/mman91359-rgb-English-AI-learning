package com.english.ai.exercise.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 词书明细 — 映射 word_book_item（词 → 词书多对多）
 */
@Data
@TableName("word_book_item")
public class WordBookItem {

    @TableId(type = IdType.AUTO)
    private Long id;

    /** 词书编码 */
    private String bookCode;

    /** 单词（小写） */
    private String word;

    /** 词书内名次，1 为词频最高 */
    private Integer rankNo;

    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createdAt;
}
