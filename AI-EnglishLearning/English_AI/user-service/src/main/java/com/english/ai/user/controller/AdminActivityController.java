package com.english.ai.user.controller;

import com.english.ai.common.PageResult;
import com.english.ai.common.Result;
import com.english.ai.user.dto.admin.ActivityQuery;
import com.english.ai.user.dto.admin.ActivityRequest;
import com.english.ai.user.dto.admin.ActivityVO;
import com.english.ai.user.service.AdminActivityService;
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
@RequestMapping("/admin/activities")
@RequiredArgsConstructor
public class AdminActivityController {

    private final AdminActivityService activityService;

    @GetMapping
    public Result<PageResult<ActivityVO>> page(ActivityQuery query) {
        return Result.success(activityService.page(query));
    }

    @GetMapping("/{id}")
    public Result<ActivityVO> get(@PathVariable Long id) {
        return Result.success(activityService.get(id));
    }

    @PostMapping
    public Result<Long> create(@Valid @RequestBody ActivityRequest request) {
        return Result.success(activityService.create(request));
    }

    @PutMapping("/{id}")
    public Result<ActivityVO> update(@PathVariable Long id, @Valid @RequestBody ActivityRequest request) {
        return Result.success(activityService.update(id, request));
    }

    @PostMapping("/{id}/publish")
    public Result<ActivityVO> publish(@PathVariable Long id) {
        return Result.success(activityService.publish(id));
    }

    @PostMapping("/{id}/end")
    public Result<ActivityVO> end(@PathVariable Long id) {
        return Result.success(activityService.end(id));
    }

    @DeleteMapping("/{id}")
    public Result<Void> delete(@PathVariable Long id) {
        activityService.delete(id);
        return Result.success();
    }
}
