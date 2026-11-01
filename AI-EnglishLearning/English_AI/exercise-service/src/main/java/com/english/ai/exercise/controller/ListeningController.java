package com.english.ai.exercise.controller;

import com.english.ai.common.BusinessException;
import com.english.ai.common.ErrorCode;
import com.english.ai.common.Result;
import com.english.ai.common.UserIdentityUtil;
import com.english.ai.exercise.dto.ListeningStats;
import com.english.ai.exercise.dto.QuestionVO;
import com.english.ai.exercise.dto.SubmitRequest;
import com.english.ai.exercise.dto.SubmitResponse;
import com.english.ai.exercise.service.ListeningService;
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

/**
 * 听力模块控制器。
 */
@Slf4j
@RestController
@RequestMapping("/exercise/listening")
@RequiredArgsConstructor
public class ListeningController {

    private final ListeningService listeningService;

    /**
     * 听力练习队列（复用智能选题）。
     * GET /exercise/listening/questions?userId=1&count=5
     */
    @GetMapping("/questions")
    public Result<List<QuestionVO>> questions(@RequestParam Long userId,
                                              @RequestParam(defaultValue = "5") Integer count,
                                              @RequestParam(required = false) String listeningType) {
        if (count > 20) {
            count = 20;
        }
        List<QuestionVO> questions = listeningService.listListeningQuestions(userId, count, listeningType);
        log.info("听力选题: userId={}, count={}, listeningType={}, 实际返回{}题",
                userId, count, listeningType, questions.size());
        return Result.success(questions);
    }

    /**
     * 单题详情。
     * GET /exercise/listening/question/{id}?showAnswer=false&userId=1
     */
    @GetMapping("/question/{id}")
    public Result<QuestionVO> question(@PathVariable Long id,
                                       @RequestParam(defaultValue = "false") boolean showAnswer,
                                       @RequestParam(required = false) Long userId) {
        return Result.success(listeningService.getListeningQuestion(id, showAnswer, userId));
    }

    /**
     * 提交听力答案。
     * POST /exercise/listening/submit
     */
    @PostMapping("/submit")
    public Result<SubmitResponse> submit(@Valid @RequestBody SubmitRequest request,
                                         @RequestHeader(value = "X-User-Id", required = false) Long headerUserId) {
        if (request.getUserId() == null || request.getQuestionId() == null) {
            return Result.badRequest("userId和questionId不能为空");
        }
        if (UserIdentityUtil.isForbidden(headerUserId, request.getUserId())) {
            throw new BusinessException(ErrorCode.FORBIDDEN, "无权操作其他用户数据");
        }
        return Result.success(listeningService.submitListeningAnswer(request));
    }

    /**
     * 听力答题统计。
     * GET /exercise/listening/stats/{userId}
     */
    @GetMapping("/stats/{userId}")
    public Result<ListeningStats> stats(@PathVariable Long userId) {
        return Result.success(listeningService.getListeningStats(userId));
    }
}
