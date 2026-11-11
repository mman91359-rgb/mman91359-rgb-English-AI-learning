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
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionSynchronization;
import org.springframework.transaction.support.TransactionSynchronizationManager;
import org.springframework.web.client.RestTemplate;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

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
    private final RestTemplate restTemplate;

    @Value("${service.user.url}")
    private String userServiceUrl;

    @Value("${service.learning-engine.url}")
    private String learningEngineUrl;

    @Override
    public boolean enqueue(JudgeReviewEnqueueRequest request) {
        JudgeReviewQueueItem item = new JudgeReviewQueueItem();
        item.setQuestionId(request.getQuestionId());
        item.setUserId(request.getUserId());
        item.setLogId(request.getLogId());
        item.setDifficultyLevel(request.getDifficultyLevel());
        item.setModuleType(request.getModuleType());
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

        boolean pass = "PASS".equalsIgnoreCase(request.getVerdict());
        if (!pass) {
            markLogWrong(item.getLogId(), request.getReviewId());
            upsertErrorBook(item.getUserId(), item.getQuestionId());
        }

        // 灰区提交时没有记 ELO / 遗忘曲线，复核结论出来后在事务提交后补记一次
        runAfterCommit(() -> {
            updateCurve(item, pass);
            updateElo(item, pass);
        });

        log.info("审核结论落地: reviewId={}, verdict={}, questionId={}, userId={}, logId={}",
                request.getReviewId(), request.getVerdict(), item.getQuestionId(), item.getUserId(), item.getLogId());
        return true;
    }

    /**
     * 按 log_id 精确改判。
     *
     * <p>历史行没有 log_id，这时**不猜**最近一条——用户可能已经重做过该题，
     * 猜错会把一条正确记录改成错。宁可不改，留日志等人工处理。</p>
     */
    private void markLogWrong(Long logId, Long reviewId) {
        if (logId == null) {
            log.warn("审核记录缺少 log_id，跳过改判: reviewId={}", reviewId);
            return;
        }
        UserExerciseLog logEntry = exerciseLogMapper.selectById(logId);
        if (logEntry == null) {
            log.warn("审核记录绑定的答题日志不存在: reviewId={}, logId={}", reviewId, logId);
            return;
        }
        if (Integer.valueOf(0).equals(logEntry.getIsCorrect())) {
            return;
        }
        logEntry.setIsCorrect(0);
        exerciseLogMapper.updateById(logEntry);
    }

    /** 事务提交后执行；单测等无事务场景直接执行 */
    private void runAfterCommit(Runnable action) {
        if (TransactionSynchronizationManager.isSynchronizationActive()) {
            TransactionSynchronizationManager.registerSynchronization(new TransactionSynchronization() {
                @Override
                public void afterCommit() {
                    action.run();
                }
            });
        } else {
            action.run();
        }
    }

    private void updateCurve(JudgeReviewQueueItem item, boolean isCorrect) {
        if (item.getModuleType() == null) {
            log.warn("审核记录缺少 module_type，跳过遗忘曲线补记: reviewId={}", item.getId());
            return;
        }
        try {
            Map<String, Object> body = new HashMap<>();
            body.put("userId", item.getUserId());
            body.put("questionId", item.getQuestionId());
            body.put("isCorrect", isCorrect);
            body.put("moduleType", item.getModuleType());
            postJson(learningEngineUrl + "/learning/update-curve", body);
        } catch (Exception e) {
            log.warn("复核后补记遗忘曲线失败: reviewId={}, error={}", item.getId(), e.getMessage());
        }
    }

    private void updateElo(JudgeReviewQueueItem item, boolean isCorrect) {
        if (item.getModuleType() == null || item.getDifficultyLevel() == null) {
            log.warn("审核记录缺少 module_type / difficulty_level，跳过 ELO 补记: reviewId={}", item.getId());
            return;
        }
        try {
            Map<String, Object> body = new HashMap<>();
            body.put("userId", item.getUserId());
            body.put("difficultyLevel", item.getDifficultyLevel());
            body.put("moduleType", item.getModuleType());
            body.put("isCorrect", isCorrect);
            postJson(userServiceUrl + "/user/radar/update-elo", body);
        } catch (Exception e) {
            log.warn("复核后补记 ELO 失败: reviewId={}, error={}", item.getId(), e.getMessage());
        }
    }

    private void postJson(String url, Map<String, Object> body) {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        restTemplate.postForEntity(url, new HttpEntity<>(body, headers), String.class);
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
