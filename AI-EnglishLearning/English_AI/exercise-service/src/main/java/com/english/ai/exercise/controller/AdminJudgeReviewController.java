package com.english.ai.exercise.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.english.ai.common.PageResult;
import com.english.ai.common.Result;
import com.english.ai.exercise.dto.JudgeReviewAdminItem;
import com.english.ai.exercise.dto.JudgeReviewAdminQuery;
import com.english.ai.exercise.dto.JudgeReviewResolveRequest;
import com.english.ai.exercise.entity.JudgeReviewQueueItem;
import com.english.ai.exercise.entity.QuestionContent;
import com.english.ai.exercise.mapper.JudgeReviewQueueMapper;
import com.english.ai.exercise.mapper.QuestionContentMapper;
import com.english.ai.exercise.service.JudgeReviewQueueService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.function.Function;
import java.util.stream.Collectors;

/**
 * 管理端判题复核后台（段落翻译灰区的人工复核入口）。
 *
 * <p>鉴权复用现有 admin 链路：网关校验 JWT 的 ROLE_ADMIN 并写入可信头，
 * 本服务 {@code AdminAuthInterceptor} 已拦 {@code /admin/**}。</p>
 *
 * <p>只做「列表查询 + 单条 resolve」两件事，业务逻辑全部复用
 * {@link JudgeReviewQueueService}（与 /internal/** 共用同一份 resolve 实现，
 * 避免两个入口行为漂移）。</p>
 */
@RestController
@RequestMapping("/admin/judge-review")
@RequiredArgsConstructor
public class AdminJudgeReviewController {

    private final JudgeReviewQueueMapper judgeReviewQueueMapper;
    private final QuestionContentMapper questionContentMapper;
    private final JudgeReviewQueueService judgeReviewQueueService;

    /**
     * 分页查询复核队列。
     *
     * <p>分两步：先按条件分页查队列，再按 {@code question_id IN (...)} 批量查题干，
     * 避免 join 写进 XML，也避免误用 question_info（题干在 question_content）。</p>
     */
    @GetMapping
    public Result<PageResult<JudgeReviewAdminItem>> page(JudgeReviewAdminQuery query) {
        int page = query.getPage() > 0 ? query.getPage() : 1;
        int size = query.getSize() > 0 ? query.getSize() : 20;

        LambdaQueryWrapper<JudgeReviewQueueItem> wrapper = new LambdaQueryWrapper<>();
        if (query.getStatus() != null && !query.getStatus().isBlank()) {
            wrapper.eq(JudgeReviewQueueItem::getStatus, query.getStatus());
        }
        if (query.getReason() != null && !query.getReason().isBlank()) {
            wrapper.eq(JudgeReviewQueueItem::getReason, query.getReason());
        }
        if (query.getQuestionId() != null) {
            wrapper.eq(JudgeReviewQueueItem::getQuestionId, query.getQuestionId());
        }
        wrapper.orderByDesc(JudgeReviewQueueItem::getCreatedAt);

        Page<JudgeReviewQueueItem> pageResult = judgeReviewQueueMapper.selectPage(new Page<>(page, size), wrapper);
        List<JudgeReviewQueueItem> records = pageResult.getRecords();

        // 批量查题干
        Map<Long, String> stemMap = loadStems(records);

        List<JudgeReviewAdminItem> items = records.stream()
                .map(item -> toItem(item, stemMap.get(item.getQuestionId())))
                .collect(Collectors.toList());

        return Result.success(PageResult.of(items, pageResult.getTotal(), page, size));
    }

    /**
     * 单条复核结论落地。审核人身份从网关可信头 X-User-Id 取，忽略 body 里的 reviewerId。
     */
    @PostMapping("/{id}/resolve")
    public Result<Boolean> resolve(@PathVariable Long id,
                                   @Valid @RequestBody JudgeReviewResolveRequest body,
                                   @RequestHeader("X-User-Id") Long reviewerId) {
        body.setReviewId(id);
        body.setReviewerId(reviewerId);
        return Result.success(judgeReviewQueueService.resolve(body));
    }

    /**
     * 按题目 ID 批量查题干，截断到 200 字（列表展示用，全文在详情展开）。
     */
    private Map<Long, String> loadStems(List<JudgeReviewQueueItem> records) {
        if (records == null || records.isEmpty()) {
            return Collections.emptyMap();
        }
        List<Long> questionIds = records.stream()
                .map(JudgeReviewQueueItem::getQuestionId)
                .filter(Objects::nonNull)
                .distinct()
                .collect(Collectors.toList());
        if (questionIds.isEmpty()) {
            return Collections.emptyMap();
        }
        return questionContentMapper.selectList(
                        new LambdaQueryWrapper<QuestionContent>()
                                .in(QuestionContent::getQuestionId, questionIds))
                .stream()
                .collect(Collectors.toMap(QuestionContent::getQuestionId,
                        content -> truncate(content.getStem(), 200),
                        (a, b) -> a));
    }

    private JudgeReviewAdminItem toItem(JudgeReviewQueueItem item, String stem) {
        JudgeReviewAdminItem dto = new JudgeReviewAdminItem();
        dto.setId(item.getId());
        dto.setQuestionId(item.getQuestionId());
        dto.setUserId(item.getUserId());
        dto.setLogId(item.getLogId());
        dto.setDifficultyLevel(item.getDifficultyLevel());
        dto.setModuleType(item.getModuleType());
        dto.setUserAnswer(item.getUserAnswer());
        dto.setCorrectAnswer(item.getCorrectAnswer());
        dto.setMatchedLevel(item.getMatchedLevel());
        dto.setAiConfidence(item.getAiConfidence());
        dto.setAiResult(item.getAiResult());
        dto.setJudgeContext(item.getJudgeContext());
        dto.setReason(item.getReason());
        dto.setStatus(item.getStatus());
        dto.setReviewerId(item.getReviewerId());
        dto.setReviewComment(item.getReviewComment());
        dto.setStem(stem);
        dto.setCurveScored(item.getCurveScoredAt() != null);
        dto.setEloScored(item.getEloScoredAt() != null);
        dto.setCreatedAt(item.getCreatedAt());
        return dto;
    }

    private String truncate(String value, int max) {
        if (value == null) {
            return null;
        }
        return value.length() <= max ? value : value.substring(0, max) + "…";
    }
}
