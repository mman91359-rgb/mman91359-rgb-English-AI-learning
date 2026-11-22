package com.english.ai.user.service;

import com.english.ai.common.PageResult;
import com.english.ai.user.dto.UnreadCountVO;
import com.english.ai.user.dto.admin.UserNoticeVO;

public interface UserNoticeService {

    PageResult<UserNoticeVO> page(Long userId, int page, int size);

    long unreadCount(Long userId);

    /**
     * 红点汇总：公告 + 个人通知，返回 {notice, personal, total}。
     * 需求文档 §7.1 方案 3：前端只读 total 一个数字，不再发两次请求相加。
     */
    UnreadCountVO unreadCountSummary(Long userId);

    boolean markRead(Long userId, Long noticeId);

    int markAllRead(Long userId);
}
