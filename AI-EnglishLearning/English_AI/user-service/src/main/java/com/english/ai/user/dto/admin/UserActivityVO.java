package com.english.ai.user.dto.admin;

import lombok.Builder;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@Builder
public class UserActivityVO {

    private Long id;
    private String title;
    private String summary;
    private String content;
    private String bannerUrl;
    private String activityType;
    private LocalDateTime startAt;
    private LocalDateTime endAt;
    private Integer sortOrder;
}
