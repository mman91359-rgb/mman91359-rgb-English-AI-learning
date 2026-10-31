package com.english.ai.user.dto.admin;

import lombok.Builder;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@Builder
public class NoticeVO {

    private Long id;
    private String title;
    private String content;
    private String noticeType;
    private String targetAudience;
    private String status;
    private LocalDateTime publishAt;
    private LocalDateTime expireAt;
    private Long createdBy;
    private String createdByName;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}
