package com.english.ai.user.controller;

import com.english.ai.common.PageResult;
import com.english.ai.common.Result;
import com.english.ai.user.dto.admin.UserActivityVO;
import com.english.ai.user.service.UserActivityService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/user/activities")
@RequiredArgsConstructor
public class UserActivityController {

    private final UserActivityService activityService;

    @GetMapping
    public Result<PageResult<UserActivityVO>> page(
            @RequestHeader("X-User-Id") Long userId,
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "20") int size) {
        return Result.success(activityService.page(userId, page, size));
    }

    @GetMapping("/{id}")
    public Result<UserActivityVO> get(@RequestHeader("X-User-Id") Long userId,
                                      @PathVariable Long id) {
        return Result.success(activityService.get(userId, id));
    }
}
