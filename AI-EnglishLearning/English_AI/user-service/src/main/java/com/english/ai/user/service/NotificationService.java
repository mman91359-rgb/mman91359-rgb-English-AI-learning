package com.english.ai.user.service;

import com.english.ai.common.PageResult;
import com.english.ai.user.dto.NotificationVO;

/**
 * 个人通知服务：只做拉取与状态变更，不做推送（见需求文档 §4.5）。
 * <p>
 * 与公告线（{@link UserNoticeService}，读 sys_notice + user_notice_read）是两套：
 * 本服务是点对点，每人一条，表内自带 is_read。
 * 红点不单独开接口，由 /user/notices/unread-count 汇总两线后返回。
 */
public interface NotificationService {

    /** 分页查询；unreadOnly=true 只看未读，按创建时间倒序 */
    PageResult<NotificationVO> page(Long userId, int page, int size, boolean unreadOnly);

    /** 标记单条已读；不存在或不属于该用户抛 NOTIFICATION_NOT_FOUND，已读重复调用返回 0 */
    int markRead(Long userId, Long notificationId);

    /** 全部标为已读，返回本次影响行数 */
    int markAllRead(Long userId);

    /** 清空（逻辑删除），返回本次影响行数 */
    int clear(Long userId);

    /** 未读数，供红点汇总使用 */
    long unreadCount(Long userId);
}
