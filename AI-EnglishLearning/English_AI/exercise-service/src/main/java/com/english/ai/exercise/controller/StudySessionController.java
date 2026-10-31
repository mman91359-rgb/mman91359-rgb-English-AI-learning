package com.english.ai.exercise.controller;

import com.english.ai.common.Result;
import com.english.ai.exercise.dto.StudySessionReportRequest;
import com.english.ai.exercise.dto.StudySessionReportResponse;
import com.english.ai.exercise.service.StudySessionService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 学习会话上报接口
 */
@Slf4j
@RestController
@RequestMapping("/exercise")
@RequiredArgsConstructor
public class StudySessionController {

    private final StudySessionService studySessionService;

    /**
     * 上报本会话累计活跃秒数
     * POST /exercise/study-session/report
     */
    @PostMapping("/study-session/report")
    public Result<StudySessionReportResponse> report(
            @RequestBody StudySessionReportRequest request,
            @RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        if (request == null || request.getUserId() == null) {
            return Result.badRequest("userId不能为空");
        }
        if (headerUserId != null && !headerUserId.equals(request.getUserId())) {
            return Result.error(403, "无权操作其他用户数据");
        }
        try {
            return Result.success(studySessionService.report(request));
        } catch (IllegalArgumentException e) {
            return Result.badRequest(e.getMessage());
        } catch (RuntimeException e) {
            log.warn("学习会话上报失败: userId={}, reason={}", request.getUserId(), e.getMessage());
            return Result.error("学习时长上报失败");
        }
    }
}
