package com.english.ai.user.controller;

import com.english.ai.common.PageResult;
import com.english.ai.common.Result;
import com.english.ai.user.dto.admin.NoticeQuery;
import com.english.ai.user.dto.admin.NoticeRequest;
import com.english.ai.user.dto.admin.NoticeVO;
import com.english.ai.user.service.AdminNoticeService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/admin/notices")
@RequiredArgsConstructor
public class AdminNoticeController {

    private final AdminNoticeService noticeService;

    @GetMapping
    public Result<PageResult<NoticeVO>> page(NoticeQuery query) {
        return Result.success(noticeService.page(query));
    }

    @GetMapping("/{id}")
    public Result<NoticeVO> get(@PathVariable Long id) {
        return Result.success(noticeService.get(id));
    }

    @PostMapping
    public Result<Long> create(@Valid @RequestBody NoticeRequest request) {
        return Result.success(noticeService.create(request));
    }

    @PutMapping("/{id}")
    public Result<NoticeVO> update(@PathVariable Long id, @Valid @RequestBody NoticeRequest request) {
        return Result.success(noticeService.update(id, request));
    }

    @PostMapping("/{id}/publish")
    public Result<NoticeVO> publish(@PathVariable Long id) {
        return Result.success(noticeService.publish(id));
    }

    @PostMapping("/{id}/expire")
    public Result<NoticeVO> expire(@PathVariable Long id) {
        return Result.success(noticeService.expire(id));
    }

    @DeleteMapping("/{id}")
    public Result<Void> delete(@PathVariable Long id) {
        noticeService.delete(id);
        return Result.success();
    }
}
