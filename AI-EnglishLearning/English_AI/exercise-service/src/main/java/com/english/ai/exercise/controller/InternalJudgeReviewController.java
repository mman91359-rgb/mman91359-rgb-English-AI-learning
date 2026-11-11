package com.english.ai.exercise.controller;

import com.english.ai.common.Result;
import com.english.ai.exercise.dto.JudgeReviewEnqueueRequest;
import com.english.ai.exercise.dto.JudgeReviewRescoreRequest;
import com.english.ai.exercise.dto.JudgeReviewResolveRequest;
import com.english.ai.exercise.service.JudgeReviewQueueService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 判题审核队列的服务间/运维接口（/internal/** 由 InternalAuthInterceptor 校验 X-Internal-Token）。
 *
 * <p>面向服务间调用与运维脚本，不经网关、不走角色鉴权；
 * 运营后台请改用 {@link AdminJudgeReviewController}（/admin/judge-review/**，走网关 JWT + 管理员角色）。</p>
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

    /**
     * 审核结论落地：PASS 维持判对，FAIL 改判为错并写回错题本。
     *
     * @return true 本次处理成功；false 记录不存在或已被处理
     */
    @PostMapping("/review/resolve")
    public Result<Boolean> resolve(@Valid @RequestBody JudgeReviewResolveRequest request) {
        return Result.success(judgeReviewQueueService.resolve(request));
    }

    /**
     * 补记重试：只补尚未完成的 ELO / 遗忘曲线，天然幂等。
     */
    @PostMapping("/review/rescore")
    public Result<Boolean> rescore(@Valid @RequestBody JudgeReviewRescoreRequest request) {
        return Result.success(judgeReviewQueueService.rescore(request.getReviewId()));
    }
}
