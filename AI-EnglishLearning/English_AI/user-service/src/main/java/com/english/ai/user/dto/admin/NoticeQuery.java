package com.english.ai.user.dto.admin;

import lombok.Data;

@Data
public class NoticeQuery {

    private String status;
    private String noticeType;
    private String targetAudience;
    private String keyword;
    private int page = 1;
    private int size = 20;
}
