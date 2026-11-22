package com.english.ai.exercise.controller;

import com.english.ai.common.BizCode;
import com.english.ai.common.BusinessException;
import com.english.ai.common.ErrorCode;
import com.english.ai.common.PageResult;
import com.english.ai.common.Result;
import com.english.ai.common.UserIdentityUtil;
import com.english.ai.exercise.dto.WritingDraftSaveRequest;
import com.english.ai.exercise.dto.WritingDraftVO;
import com.english.ai.exercise.dto.WritingFavoriteToggleRequest;
import com.english.ai.exercise.dto.WritingSubmitRequest;
import com.english.ai.exercise.dto.WritingSubmitResponse;
import com.english.ai.exercise.dto.WritingTopicVO;
import com.english.ai.exercise.service.WritingPracticeService;
import com.english.ai.exercise.service.WritingService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
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
    private final WritingPracticeService writingPracticeService;

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
        UserIdentityUtil.requireOwnership(headerUserId, request.getUserId());
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
        UserIdentityUtil.requireOwnership(headerUserId, userId);
        return Result.success(writingService.rescore(userId, essayId));
    }

    /**
     * 写作历史。
     * GET /exercise/writing/submissions?userId=1
     */
    @GetMapping("/submissions")
    public Result<List<WritingSubmitResponse>> submissions(@RequestParam Long userId,
                                                           @RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        UserIdentityUtil.requireOwnership(headerUserId, userId);
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
        UserIdentityUtil.requireOwnership(headerUserId, userId);
        return Result.success(writingService.getSubmission(userId, id));
    }

    // ========== 题库 / 草稿 / 收藏（C-1） ==========
    // 以下接口的 userId 一律取自网关透传的 X-User-Id，不接受 query 参数，从源头消除越权。

    /**
     * 题库列表，只返回 PUBLISHED。
     * GET /exercise/writing/topics?level=CET4&type=SHORT_ESSAY&page=1&size=20
     */
    @GetMapping("/topics")
    public Result<PageResult<WritingTopicVO>> topics(@RequestParam(required = false) String level,
                                                    @RequestParam(required = false) String type,
                                                    @RequestParam(defaultValue = "1") int page,
                                                    @RequestParam(defaultValue = "20") int size) {
        return Result.success(writingPracticeService.pageTopics(level, type, page, size));
    }

    /**
     * 读草稿；没有草稿时 data 为 null。
     * GET /exercise/writing/draft/{topicKey}
     */
    @GetMapping("/draft/{topicKey}")
    public Result<WritingDraftVO> getDraft(@PathVariable String topicKey,
                                          @RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        return Result.success(writingPracticeService.getDraft(requireUserId(headerUserId), topicKey));
    }

    /**
     * 存草稿：已有则覆盖，没有则新建。
     * PUT /exercise/writing/draft/{topicKey}
     */
    @PutMapping("/draft/{topicKey}")
    public Result<WritingDraftVO> saveDraft(@PathVariable String topicKey,
                                           @RequestBody(required = false) WritingDraftSaveRequest request,
                                           @RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        WritingDraftSaveRequest body = request == null ? new WritingDraftSaveRequest() : request;
        return Result.success(writingPracticeService.saveDraft(requireUserId(headerUserId), topicKey, body));
    }

    /**
     * 删草稿；不存在也返回成功（幂等）。
     * DELETE /exercise/writing/draft/{topicKey}
     */
    @DeleteMapping("/draft/{topicKey}")
    public Result<Void> deleteDraft(@PathVariable String topicKey,
                                    @RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        writingPracticeService.deleteDraft(requireUserId(headerUserId), topicKey);
        return Result.success();
    }

    /**
     * 草稿列表，按最近保存倒序。
     * GET /exercise/writing/drafts
     */
    @GetMapping("/drafts")
    public Result<List<WritingDraftVO>> drafts(@RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        return Result.success(writingPracticeService.listDrafts(requireUserId(headerUserId)));
    }

    /**
     * 收藏列表，返回 topicKey 数组。
     * GET /exercise/writing/favorites
     */
    @GetMapping("/favorites")
    public Result<List<String>> favorites(@RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        return Result.success(writingPracticeService.listFavoriteTopicKeys(requireUserId(headerUserId)));
    }

    /**
     * 加/取消收藏，同一方向重复调用幂等。
     * POST /exercise/writing/favorites  body: {topicKey, favorite}
     */
    @PostMapping("/favorites")
    public Result<Void> toggleFavorite(@RequestBody(required = false) WritingFavoriteToggleRequest request,
                                       @RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        if (request == null || !StringUtils.hasText(request.getTopicKey()) || request.getFavorite() == null) {
            throw new BusinessException(BizCode.PARAM_INVALID);
        }
        writingPracticeService.toggleFavorite(requireUserId(headerUserId), request.getTopicKey(), request.getFavorite());
        return Result.success();
    }

    /** 从网关透传头取当前用户；缺失视为未登录，给业务码而不是裸 400 */
    private Long requireUserId(Long headerUserId) {
        if (headerUserId == null) {
            throw new BusinessException(BizCode.UNAUTHENTICATED);
        }
        return headerUserId;
    }
}
