package com.english.ai.user.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 用户模块答题统计 — 映射 user_module_stats 表。
 *
 * <p>正确率的唯一事实来源：答题时增量累加 total_count / correct_count，
 * 画像页的正确率直接由这两个计数相除得出，不再使用移动加权。</p>
 */
@Data
@TableName("user_module_stats")
public class UserModuleStats {

    @TableId(type = IdType.AUTO)
    private Long id;

    /** 用户ID */
    private Long userId;

    /** 模块类型: 1词汇 2语法 3翻译 4听力 5造句 6写作 7阅读 */
    private Integer moduleType;

    /** 累计作答总题数 */
    private Integer totalCount;

    /** 累计答对题数 */
    private Integer correctCount;

    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createdAt;

    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updatedAt;
}
