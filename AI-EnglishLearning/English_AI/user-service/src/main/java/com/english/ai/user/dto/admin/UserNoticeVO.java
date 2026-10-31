package com.english.ai.user.dto.admin;

import lombok.Builder;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@Builder
public class UserNoticeVO {

    private Long id;
    private String title;
    private String content;
    private String noticeType;
    private LocalDateTime publishAt;
    private Boolean read;
}
