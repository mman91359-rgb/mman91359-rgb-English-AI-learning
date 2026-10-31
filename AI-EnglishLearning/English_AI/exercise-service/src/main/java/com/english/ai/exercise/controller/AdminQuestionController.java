package com.english.ai.exercise.controller;

import com.english.ai.common.PageResult;
import com.english.ai.common.Result;
import com.english.ai.exercise.client.AdminAuditClient;
import com.english.ai.exercise.dto.AdminQuestionQuery;
import com.english.ai.exercise.dto.ApproveQuestionResponse;
import com.english.ai.exercise.dto.GenerateQuestionsRequest;
import com.english.ai.exercise.dto.RejectQuestionRequest;
import com.english.ai.exercise.entity.QuestionPending;
import com.english.ai.exercise.service.QuestionGenerateService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 管理端题目审核。
 * 旧的 /exercise/pending-questions 等未鉴权入口已由本控制器替代。
 */
@RestController
@RequestMapping("/admin/questions")
@RequiredArgsConstructor
public class AdminQuestionController {

    private final QuestionGenerateService questionGenerateService;
    private final AdminAuditClient auditClient;

    @GetMapping
    public Result<PageResult<QuestionPending>> page(AdminQuestionQuery query) {
        return Result.success(questionGenerateService.pagePending(query));
    }

    @PostMapping("/{id}/approve")
    public Result<ApproveQuestionResponse> approve(@PathVariable Long id,
                                                   @RequestHeader("X-User-Id") Long reviewerId,
                                                   @RequestHeader(value = "X-Username", required = false) String reviewerName,
                                                   HttpServletRequest request) {
        Long questionId = questionGenerateService.approveQuestion(id, reviewerId);
        auditClient.record(reviewerId, reviewerName, "QUESTION_APPROVE", "QUESTION", String.valueOf(id),
                "questionId=" + questionId, resolveIp(request), request.getHeader("User-Agent"), "SUCCESS");
        return Result.success(new ApproveQuestionResponse(id, questionId));
    }

    @PostMapping("/{id}/reject")
    public Result<Void> reject(@PathVariable Long id,
                               @Valid @RequestBody RejectQuestionRequest body,
                               @RequestHeader("X-User-Id") Long reviewerId,
                               @RequestHeader(value = "X-Username", required = false) String reviewerName,
                               HttpServletRequest request) {
        questionGenerateService.rejectQuestion(id, reviewerId, body.getComment());
        auditClient.record(reviewerId, reviewerName, "QUESTION_REJECT", "QUESTION", String.valueOf(id),
                "comment=" + body.getComment(), resolveIp(request), request.getHeader("User-Agent"), "SUCCESS");
        return Result.success();
    }

    @PostMapping("/generate")
    public Result<Integer> generate(@Valid @RequestBody GenerateQuestionsRequest body,
                                    @RequestHeader("X-User-Id") Long operatorId,
                                    @RequestHeader(value = "X-Username", required = false) String operatorName,
                                    HttpServletRequest request) {
        int savedCount = questionGenerateService.generateAndSave(
                body.getKnowledgePoint(),
                body.getCetLevel() == null ? "CET4" : body.getCetLevel(),
                body.getDifficulty() == null ? 3 : body.getDifficulty(),
                body.getQuestionType() == null ? "FILL_BLANK" : body.getQuestionType(),
                body.getCount() == null ? 5 : body.getCount());
        auditClient.record(operatorId, operatorName, "QUESTION_GENERATE", "QUESTION", null,
                "knowledgePoint=" + body.getKnowledgePoint() + ", savedCount=" + savedCount,
                resolveIp(request), request.getHeader("User-Agent"), "SUCCESS");
        return Result.success(savedCount);
    }

    private String resolveIp(HttpServletRequest request) {
        String realIp = request.getHeader("X-Real-IP");
        if (realIp != null && !realIp.isBlank()) {
            return realIp.length() > 64 ? realIp.substring(0, 64) : realIp;
        }
        String forwarded = request.getHeader("X-Forwarded-For");
        if (forwarded != null && !forwarded.isBlank()) {
            String first = forwarded.split(",")[0].trim();
            return first.length() > 64 ? first.substring(0, 64) : first;
        }
        String remote = request.getRemoteAddr();
        return remote != null && remote.length() > 64 ? remote.substring(0, 64) : remote;
    }
}
