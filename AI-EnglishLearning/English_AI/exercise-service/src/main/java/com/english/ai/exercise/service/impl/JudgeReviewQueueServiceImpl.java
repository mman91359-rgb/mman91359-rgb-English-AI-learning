package com.english.ai.exercise.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.english.ai.exercise.dto.JudgeReviewEnqueueRequest;
import com.english.ai.exercise.dto.JudgeReviewResolveRequest;
import com.english.ai.exercise.entity.JudgeReviewQueueItem;
import com.english.ai.exercise.entity.UserErrorBook;
import com.english.ai.exercise.entity.UserExerciseLog;
import com.english.ai.exercise.mapper.JudgeReviewQueueMapper;
import com.english.ai.exercise.mapper.UserErrorBookMapper;
import com.english.ai.exercise.mapper.UserExerciseLogMapper;
import com.english.ai.exercise.service.JudgeReviewQueueService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;

/**
 * 判题审核队列实现：幂等入队 + 审核结论落地。
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class JudgeReviewQueueServiceImpl implements JudgeReviewQueueService {

    private static final String DEFAULT_REASON = "MANUAL";
    private static final String STATUS_PENDING = "PENDING";
    private static final String STATUS_REVIEWED = "REVIEWED";

    private final JudgeReviewQueueMapper judgeReviewQueueMapper;
    private final UserExerciseLogMapper exerciseLogMapper;
    private final UserErrorBookMapper errorBookMapper;

    @Override
    public boolean enqueue(JudgeReviewEnqueueRequest request) {
        JudgeReviewQueueItem item = new JudgeReviewQueueItem();
        item.setQuestionId(request.getQuestionId());
        item.setUserId(request.getUserId());
        item.setUserAnswer(request.getUserAnswer());
        item.setCorrectAnswer(request.getCorrectAnswer());
        item.setMatchedLevel(request.getMatchedLevel());
        item.setAiConfidence(request.getAiConfidence());
        item.setAiResult(request.getAiResult());
        item.setJudgeContext(request.getJudgeContext());
        item.setReason(isBlank(request.getReason()) ? DEFAULT_REASON : request.getReason());
        item.setStatus(STATUS_PENDING);

        int affected = judgeReviewQueueMapper.enqueueIgnoreDuplicate(item);
        if (affected > 0) {
            log.info("判题审核入队: questionId={}, userId={}, reason={}",
                    item.getQuestionId(), item.getUserId(), item.getReason());
            return true;
        }
        log.debug("判题审核重复入队，已忽略: questionId={}, userId={}",
                item.getQuestionId(), item.getUserId());
        return false;
    }

    /**
     * 审核结论落地。先做条件更新抢占状态，再执行改判副作用，整体在同一事务内。
     */
    @Override
    @Transactional
    public boolean resolve(JudgeReviewResolveRequest request) {
        JudgeReviewQueueItem item = judgeReviewQueueMapper.selectById(request.getReviewId());
        if (item == null || !STATUS_PENDING.equals(item.getStatus())) {
            log.debug("审核记录不存在或已处理: reviewId={}", request.getReviewId());
            return false;
        }

        LocalDateTime now = LocalDateTime.now();
        int updated = judgeReviewQueueMapper.update(null,
                new UpdateWrapper<JudgeReviewQueueItem>()
                        .eq("id", request.getReviewId())
                        .eq("status", STATUS_PENDING)
                        .set("status", STATUS_REVIEWED)
                        .set("reviewer_id", request.getReviewerId())
                        .set("review_comment", request.getComment())
                        .set("updated_at", now));
        if (updated == 0) {
            // 并发下已被其他请求处理
            return false;
        }

        if ("FAIL".equalsIgnoreCase(request.getVerdict())) {
            markLatestLogWrong(item.getUserId(), item.getQuestionId());
            upsertErrorBook(item.getUserId(), item.getQuestionId());
        }

        log.info("审核结论落地: reviewId={}, verdict={}, questionId={}, userId={}",
                request.getReviewId(), request.getVerdict(), item.getQuestionId(), item.getUserId());
        return true;
    }

    /** 把该用户该题最近一次作答改为错（已是错则跳过） */
    private void markLatestLogWrong(Long userId, Long questionId) {
        UserExerciseLog latest = exerciseLogMapper.selectOne(
                new QueryWrapper<UserExerciseLog>()
                        .eq("user_id", userId)
                        .eq("question_id", questionId)
                        .orderByDesc("id")
                        .last("LIMIT 1"));
        if (latest == null || Integer.valueOf(0).equals(latest.getIsCorrect())) {
            return;
        }
        latest.setIsCorrect(0);
        exerciseLogMapper.updateById(latest);
    }

    /**
     * 写回错题本。与 ExerciseServiceImpl 的同名逻辑保持一致；
     * 后续可抽 ErrorBookService 复用，本轮先复制。
     */
    private void upsertErrorBook(Long userId, Long questionId) {
        UserErrorBook exist = errorBookMapper.selectOne(
                new QueryWrapper<UserErrorBook>()
                        .eq("user_id", userId)
                        .eq("question_id", questionId));
        if (exist != null) {
            exist.setWrongCount(exist.getWrongCount() + 1);
            exist.setLastWrongAt(LocalDateTime.now());
            exist.setIsResolved(0);
            errorBookMapper.updateById(exist);
        } else {
            UserErrorBook book = new UserErrorBook();
            book.setUserId(userId);
            book.setQuestionId(questionId);
            book.setWrongCount(1);
            book.setLastWrongAt(LocalDateTime.now());
            book.setIsResolved(0);
            errorBookMapper.insert(book);
        }
    }

    private boolean isBlank(String value) {
        return value == null || value.trim().isEmpty();
    }
}
