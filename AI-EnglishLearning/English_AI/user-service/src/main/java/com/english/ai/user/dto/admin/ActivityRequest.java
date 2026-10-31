package com.english.ai.user.dto.admin;

import jakarta.validation.constraints.NotBlank;
import lombok.Data;

/**
 * 活动创建/编辑请求。时间格式支持 yyyy-MM-dd HH:mm:ss 或 ISO。
 */
@Data
public class ActivityRequest {

    @NotBlank(message = "标题不能为空")
    private String title;

    private String summary;

    private String content;

    private String bannerUrl;

    @NotBlank(message = "活动类型不能为空")
    private String activityType;

    @NotBlank(message = "目标人群不能为空")
    private String targetAudience;

    @NotBlank(message = "开始时间不能为空")
    private String startAt;

    @NotBlank(message = "结束时间不能为空")
    private String endAt;

    private Integer sortOrder;
}
