package com.english.ai.user.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * 练习组积分结算记录 — 映射 user_practice_settlement 表。
 *
 * <p>同时承担两个职责：</p>
 * <ol>
 *   <li>幂等：uk_user_batch 保证同一练习组重复提交只结算一次</li>
 *   <li>限流：按 stat_date 汇总当日已发积分，实现每日上限</li>
 * </ol>
 */
@Data
@TableName("user_practice_settlement")
public class UserPracticeSettlement {

    @TableId(type = IdType.AUTO)
    private Long id;

    /** 用户ID */
    private Long userId;

    /** 练习组唯一键 */
    private String batchKey;

    /** 模块类型 */
    private Integer moduleType;

    /** 本组总题数 */
    private Integer totalCount;

    /** 本组答对题数 */
    private Integer correctCount;

    /** 本组正确率(0~100) */
    private BigDecimal accuracy;

    /** 本次实发积分（已扣每日上限） */
    private Integer points;

    /** 结算日期 */
    private LocalDate statDate;

    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createdAt;
}
