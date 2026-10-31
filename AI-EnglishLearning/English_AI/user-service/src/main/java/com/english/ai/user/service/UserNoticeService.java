package com.english.ai.user.service;

import com.english.ai.common.PageResult;
import com.english.ai.user.dto.admin.UserNoticeVO;

public interface UserNoticeService {

    PageResult<UserNoticeVO> page(Long userId, int page, int size);

    long unreadCount(Long userId);

    boolean markRead(Long userId, Long noticeId);

    int markAllRead(Long userId);
}
