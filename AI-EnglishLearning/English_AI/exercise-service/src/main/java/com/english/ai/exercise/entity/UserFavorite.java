package com.english.ai.exercise.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@TableName("user_favorite")
public class UserFavorite {

    @TableId(type = IdType.AUTO)
    private Long id;

    private Long userId;

    private String sentenceText;

    private Long questionId;

    private String sourceType;

    /** 模块类型：1词汇 2语法 3翻译 4听力 5造句 6写作 7阅读；0=未知 */
    private Integer moduleType;

    /** 句子内容哈希（纯句子去重用）；习题行为 null，去重交给 (user_id, question_id) 唯一键 */
    private String contentHash;

    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createdAt;
}
