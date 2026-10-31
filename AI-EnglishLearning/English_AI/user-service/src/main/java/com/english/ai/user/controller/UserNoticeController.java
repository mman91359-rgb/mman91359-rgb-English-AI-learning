package com.english.ai.user.controller;

import com.english.ai.common.PageResult;
import com.english.ai.common.Result;
import com.english.ai.user.dto.admin.UserNoticeVO;
import com.english.ai.user.service.UserNoticeService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/user/notices")
@RequiredArgsConstructor
public class UserNoticeController {

    private final UserNoticeService noticeService;

    @GetMapping
    public Result<PageResult<UserNoticeVO>> page(
            @RequestHeader("X-User-Id") Long userId,
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "20") int size) {
        return Result.success(noticeService.page(userId, page, size));
    }

    @GetMapping("/unread-count")
    public Result<Long> unreadCount(@RequestHeader("X-User-Id") Long userId) {
        return Result.success(noticeService.unreadCount(userId));
    }

    @PutMapping("/{id}/read")
    public Result<Boolean> markRead(@RequestHeader("X-User-Id") Long userId,
                                    @PathVariable Long id) {
        return Result.success(noticeService.markRead(userId, id));
    }

    @PutMapping("/read-all")
    public Result<Integer> markAllRead(@RequestHeader("X-User-Id") Long userId) {
        return Result.success(noticeService.markAllRead(userId));
    }
}
