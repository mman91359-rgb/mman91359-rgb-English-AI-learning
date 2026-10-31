package com.english.ai.user.dto.admin;

import jakarta.validation.constraints.NotBlank;
import lombok.Data;

/**
 * 通知创建/编辑请求。时间格式支持 yyyy-MM-dd HH:mm:ss 或 ISO。
 */
@Data
public class NoticeRequest {

    @NotBlank(message = "标题不能为空")
    private String title;

    @NotBlank(message = "正文不能为空")
    private String content;

    @NotBlank(message = "通知类型不能为空")
    private String noticeType;

    @NotBlank(message = "目标人群不能为空")
    private String targetAudience;

    private String publishAt;

    private String expireAt;
}
