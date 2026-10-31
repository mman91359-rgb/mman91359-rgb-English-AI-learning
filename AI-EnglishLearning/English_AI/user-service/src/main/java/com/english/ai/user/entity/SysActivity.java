package com.english.ai.user.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 运营活动/横幅。
 */
@Data
@TableName("sys_activity")
public class SysActivity {

    @TableId(type = IdType.AUTO)
    private Long id;

    private String title;

    private String summary;

    private String content;

    private String bannerUrl;

    /** BANNER / CONTENT */
    private String activityType;

    /** ALL / CET4 / CET6 */
    private String targetAudience;

    /** DRAFT / PUBLISHED / ENDED */
    private String status;

    private LocalDateTime startAt;

    private LocalDateTime endAt;

    private Integer sortOrder;

    private Long createdBy;

    private Long updatedBy;

    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createdAt;

    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updatedAt;
}
