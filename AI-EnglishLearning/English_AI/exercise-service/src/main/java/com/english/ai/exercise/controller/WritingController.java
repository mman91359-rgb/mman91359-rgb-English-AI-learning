package com.english.ai.exercise.controller;

import com.english.ai.common.BusinessException;
import com.english.ai.common.ErrorCode;
import com.english.ai.common.Result;
import com.english.ai.common.UserIdentityUtil;
import com.english.ai.exercise.dto.WritingSubmitRequest;
import com.english.ai.exercise.dto.WritingSubmitResponse;
import com.english.ai.exercise.service.WritingService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

/**
 * 写作模块控制器：作文提交（先落库后评分）、重新评分、历史查询。
 */
@Slf4j
@RestController
@RequestMapping("/exercise/writing")
@RequiredArgsConstructor
public class WritingController {

    private final WritingService writingService;

    /**
     * 提交作文：先落库，后调 AI 评分，评分失败保留原文并标记未评分。
     * POST /exercise/writing/submit
     */
    @PostMapping("/submit")
    public Result<WritingSubmitResponse> submit(@Valid @RequestBody WritingSubmitRequest request,
                                                @RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        if (request.getUserId() == null) {
            return Result.badRequest("userId不能为空");
        }
        if (UserIdentityUtil.isForbidden(headerUserId, request.getUserId())) {
            throw new BusinessException(ErrorCode.FORBIDDEN, "无权操作其他用户数据");
        }
        WritingSubmitResponse resp = writingService.submit(request);
        log.info("写作提交: userId={}, essayId={}, aiScored={}", request.getUserId(), resp.getEssayId(), resp.getAiScored());
        return Result.success(resp);
    }

    /**
     * 重新评分（对未评分的作文）。
     * POST /exercise/writing/rescore
     */
    @PostMapping("/rescore")
    public Result<WritingSubmitResponse> rescore(@RequestBody Map<String, Object> body,
                                                  @RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        Long userId = body.get("userId") != null ? ((Number) body.get("userId")).longValue() : null;
        Long essayId = body.get("essayId") != null ? ((Number) body.get("essayId")).longValue() : null;
        if (userId == null || essayId == null) {
            return Result.badRequest("userId和essayId不能为空");
        }
        if (UserIdentityUtil.isForbidden(headerUserId, userId)) {
            throw new BusinessException(ErrorCode.FORBIDDEN, "无权操作其他用户数据");
        }
        return Result.success(writingService.rescore(userId, essayId));
    }

    /**
     * 写作历史。
     * GET /exercise/writing/submissions?userId=1
     */
    @GetMapping("/submissions")
    public Result<List<WritingSubmitResponse>> submissions(@RequestParam Long userId,
                                                           @RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        if (UserIdentityUtil.isForbidden(headerUserId, userId)) {
            throw new BusinessException(ErrorCode.FORBIDDEN, "无权访问其他用户数据");
        }
        return Result.success(writingService.listSubmissions(userId));
    }

    /**
     * 单篇作文详情。
     * GET /exercise/writing/submission/{id}?userId=1
     */
    @GetMapping("/submission/{id}")
    public Result<WritingSubmitResponse> submission(@PathVariable Long id,
                                                    @RequestParam Long userId,
                                                    @RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        if (UserIdentityUtil.isForbidden(headerUserId, userId)) {
            throw new BusinessException(ErrorCode.FORBIDDEN, "无权访问其他用户数据");
        }
        return Result.success(writingService.getSubmission(userId, id));
    }
}
