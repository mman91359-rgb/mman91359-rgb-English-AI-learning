package com.english.ai.user.controller;

import com.english.ai.common.BizCode;
import com.english.ai.common.BusinessException;
import com.english.ai.common.PageResult;
import com.english.ai.common.Result;
import com.english.ai.user.dto.NotificationVO;
import com.english.ai.user.service.NotificationService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * 个人通知控制器（点对点）。路径与公告线 /user/notices 刻意分开，避免混成一套。
 * <p>
 * 未读数不在这里开接口：红点统一由 /user/notices/unread-count 汇总公告与个人两条线后返回，
 * 保证前端只有一个数据来源。
 */
@RestController
@RequestMapping("/user/notifications")
@RequiredArgsConstructor
public class NotificationController {

    private final NotificationService notificationService;

    /**
     * 通知列表。
     * GET /user/notifications?page=1&size=20&unreadOnly=false
     */
    @GetMapping
    public Result<PageResult<NotificationVO>> page(
            @RequestHeader(value = "X-User-Id", required = false) Long headerUserId,
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "20") int size,
            @RequestParam(defaultValue = "false") boolean unreadOnly) {
        return Result.success(notificationService.page(requireUserId(headerUserId), page, size, unreadOnly));
    }

    /**
     * 标记单条已读；id 不存在抛 NOTIFICATION_NOT_FOUND。
     * POST /user/notifications/{id}/read
     */
    @PostMapping("/{id}/read")
    public Result<Integer> markRead(@PathVariable Long id,
                                    @RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        return Result.success(notificationService.markRead(requireUserId(headerUserId), id));
    }

    /**
     * 全部标记已读，返回影响行数。
     * POST /user/notifications/read-all
     */
    @PostMapping("/read-all")
    public Result<Integer> markAllRead(@RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        return Result.success(notificationService.markAllRead(requireUserId(headerUserId)));
    }

    /**
     * 清空（逻辑删除），返回影响行数。
     * DELETE /user/notifications
     */
    @DeleteMapping
    public Result<Integer> clear(@RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        return Result.success(notificationService.clear(requireUserId(headerUserId)));
    }

    /** 从网关透传头取当前用户；缺失视为未登录 */
    private Long requireUserId(Long headerUserId) {
        if (headerUserId == null) {
            throw new BusinessException(BizCode.UNAUTHENTICATED);
        }
        return headerUserId;
    }
}
