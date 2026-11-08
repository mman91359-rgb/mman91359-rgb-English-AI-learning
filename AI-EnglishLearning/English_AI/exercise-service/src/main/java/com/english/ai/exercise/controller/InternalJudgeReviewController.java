package com.english.ai.exercise.controller;

import com.english.ai.common.Result;
import com.english.ai.exercise.dto.JudgeReviewEnqueueRequest;
import com.english.ai.exercise.service.JudgeReviewQueueService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 判题审核队列写入接口（/internal/** 由 InternalAuthInterceptor 校验）。
 *
 * <p>能力预留：主判题链路不会调用本接口。是否入队由调用方（管理端/运营脚本）决定。</p>
 */
@RestController
@RequestMapping("/internal/judge")
@RequiredArgsConstructor
public class InternalJudgeReviewController {

    private final JudgeReviewQueueService judgeReviewQueueService;

    /**
     * 幂等入队：同一题 + 同一用户 + 同一答案重复提交只保留一条。
     *
     * @return true 本次新增，false 已存在
     */
    @PostMapping("/review")
    public Result<Boolean> enqueue(@Valid @RequestBody JudgeReviewEnqueueRequest request) {
        return Result.success(judgeReviewQueueService.enqueue(request));
    }
}
