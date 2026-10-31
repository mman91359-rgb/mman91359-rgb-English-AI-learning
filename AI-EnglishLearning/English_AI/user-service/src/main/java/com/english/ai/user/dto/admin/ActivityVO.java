package com.english.ai.user.dto.admin;

import lombok.Builder;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@Builder
public class ActivityVO {

    private Long id;
    private String title;
    private String summary;
    private String content;
    private String bannerUrl;
    private String activityType;
    private String targetAudience;
    private String status;
    /** 由状态与时间计算的展示态：SCHEDULED/ACTIVE/ENDED */
    private String effectiveStatus;
    private LocalDateTime startAt;
    private LocalDateTime endAt;
    private Integer sortOrder;
    private Long createdBy;
    private String createdByName;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}
