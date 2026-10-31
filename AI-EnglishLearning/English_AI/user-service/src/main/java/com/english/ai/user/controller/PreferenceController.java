package com.english.ai.user.controller;

import com.english.ai.common.Result;
import com.english.ai.user.dto.PreferenceResponse;
import com.english.ai.user.dto.UpdateVocabGroupSizeRequest;
import com.english.ai.user.dto.UpdateVocabularyGoalsRequest;
import com.english.ai.user.service.UserPreferenceService;
import com.english.ai.user.util.UserIdentityUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 用户学习偏好接口
 */
@Slf4j
@RestController
@RequestMapping("/user/preference")
@RequiredArgsConstructor
public class PreferenceController {

    private final UserPreferenceService preferenceService;

    /**
     * 查询每组单词数量
     * GET /user/preference/{userId}
     */
    @GetMapping("/{userId}")
    public Result<PreferenceResponse> get(
            @PathVariable Long userId,
            @RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        if (UserIdentityUtil.isForbidden(headerUserId, userId)) {
            return Result.error(403, "无权访问其他用户数据");
        }
        return Result.success(preferenceService.get(userId));
    }

    /**
     * 更新每组单词数量
     * PUT /user/preference/vocab-group-size
     */
    @PutMapping("/vocab-group-size")
    public Result<PreferenceResponse> updateVocabGroupSize(
            @RequestBody UpdateVocabGroupSizeRequest request,
            @RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        if (request == null || request.getUserId() == null) {
            return Result.badRequest("userId不能为空");
        }
        if (UserIdentityUtil.isForbidden(headerUserId, request.getUserId())) {
            return Result.error(403, "无权操作其他用户数据");
        }
        try {
            return Result.success(preferenceService.updateVocabGroupSize(
                    request.getUserId(), request.getVocabGroupSize()));
        } catch (IllegalArgumentException e) {
            return Result.badRequest(e.getMessage());
        } catch (RuntimeException e) {
            log.warn("更新每组单词数量失败: userId={}, reason={}", request.getUserId(), e.getMessage());
            return Result.error("保存失败，请稍后重试");
        }
    }

    /**
     * 更新每日新背/复习单词目标
     * PUT /user/preference/vocabulary-goals
     */
    @PutMapping("/vocabulary-goals")
    public Result<PreferenceResponse> updateVocabularyGoals(
            @RequestBody UpdateVocabularyGoalsRequest request,
            @RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        if (request == null || request.getUserId() == null) {
            return Result.badRequest("userId不能为空");
        }
        if (UserIdentityUtil.isForbidden(headerUserId, request.getUserId())) {
            return Result.error(403, "无权操作其他用户数据");
        }
        try {
            return Result.success(preferenceService.updateVocabularyGoals(
                    request.getUserId(), request.getDailyNewWords(), request.getDailyReviewWords()));
        } catch (IllegalArgumentException e) {
            return Result.badRequest(e.getMessage());
        } catch (RuntimeException e) {
            log.warn("更新每日词汇目标失败: userId={}, reason={}", request.getUserId(), e.getMessage());
            return Result.error("保存失败，请稍后重试");
        }
    }
}
