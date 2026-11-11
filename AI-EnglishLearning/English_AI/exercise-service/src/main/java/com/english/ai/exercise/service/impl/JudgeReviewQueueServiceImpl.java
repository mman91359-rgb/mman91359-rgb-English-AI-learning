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
import jakarta.annotation.Resource;
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

    /**
     * 补记 ELO / 遗忘曲线用短超时客户端（connect 1s / read 2s）。
     * resolve 是运维接口，不该被下游拖到 20s；失败只记日志，不影响复核结论落地。
     */
    @Resource(name = "auditRestTemplate")
    private RestTemplate auditRestTemplate;

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

        if (request.getModuleType() == null || request.getDifficultyLevel() == null) {
            // 这类行不会被补记（扫描侧已排除），入队时留一次痕即可，不刷屏
            log.warn("审核入队缺少计分上下文（moduleType/difficultyLevel），该行不会补记: "
                    + "questionId={}, moduleType={}, difficultyLevel={}",
                    request.getQuestionId(), request.getModuleType(), request.getDifficultyLevel());
        }

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

        // 统一副作用准入门槛：必须能取到绑定的作答记录，否则无改判/错题本/计分依据。
        // 无 log_id 的手工/历史行、或绑定的 log 已被清理，都属于「无绑定作答」，
        // 状态已置 REVIEWED，但改判、错题本、ELO/曲线补记全部跳过，避免污染真实用户数据。
        UserExerciseLog logEntry = item.getLogId() == null ? null : exerciseLogMapper.selectById(item.getLogId());
        if (logEntry == null) {
            log.warn("审核记录无绑定作答，跳过改判与计分补记: reviewId={}, logId={}",
                    request.getReviewId(), item.getLogId());
            return true;
        }

        // 只有「真的把作答从对改成错」才写错题本；本来就是错的不重复写
        if (!pass && Integer.valueOf(1).equals(logEntry.getIsCorrect())) {
            logEntry.setIsCorrect(0);
            exerciseLogMapper.updateById(logEntry);
            upsertErrorBook(item.getUserId(), item.getQuestionId());
        }

        // 灰区提交时没有记 ELO / 遗忘曲线，复核结论出来后在事务提交后补记一次。
        // 结论以改判后的 log.is_correct 为准（而非 verdict 字符串），与 rescore 同源，
        // 避免「log 本已错但复核点 PASS」时 resolve 加分、重试却扣分的相反结论。
        boolean isCorrect = Integer.valueOf(1).equals(logEntry.getIsCorrect());
        runAfterCommit(() -> {
            ensureCurve(item, isCorrect);
            ensureElo(item, isCorrect);
        });

        log.info("审核结论落地: reviewId={}, verdict={}, questionId={}, userId={}, logId={}",
                request.getReviewId(), request.getVerdict(), item.getQuestionId(), item.getUserId(), item.getLogId());
        return true;
    }

    /**
     * 补记重试：只补还缺的那一半（curve / elo）。
     *
     * <p>复核结论不给对话框，直接看绑定 log 的 {@code is_correct}——
     * FAIL 时 resolve 已把它置 0，PASS 保持 1，语义一致。</p>
     *
     * @return true 表示两半都已补记完成；false 表示记录不满足条件或仍有缺失
     */
    @Override
    public boolean rescore(Long reviewId) {
        JudgeReviewQueueItem item = judgeReviewQueueMapper.selectById(reviewId);
        if (item == null || !STATUS_REVIEWED.equals(item.getStatus())) {
            return false;
        }
        if (item.getLogId() == null) {
            log.warn("审核记录缺少 log_id，无法推断复核结论，跳过补记: reviewId={}", reviewId);
            return false;
        }
        if (item.getCurveScoredAt() != null && item.getEloScoredAt() != null) {
            // 已完成的两半都不需要再动，按 javadoc 语义返回 true
            return true;
        }
        UserExerciseLog boundLog = exerciseLogMapper.selectById(item.getLogId());
        if (boundLog == null) {
            log.error("补记失败：绑定的答题日志不存在: reviewId={}, logId={}", reviewId, item.getLogId());
            return false;
        }
        boolean isCorrect = Integer.valueOf(1).equals(boundLog.getIsCorrect());
        boolean curveDone = ensureCurve(item, isCorrect);
        boolean eloDone = ensureElo(item, isCorrect);
        log.info("补记重试: reviewId={}, curve={}, elo={}", reviewId, curveDone, eloDone);
        return curveDone && eloDone;
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

    /**
     * 补记遗忘曲线。协议：抢占标记 → 发请求 → 失败清回。
     *
     * <p>顺序不能反：若先发请求再置位，resolve 与 rescore 并发时都会看到 NULL，
     * 各发一次 → 曲线阶梯推两级。</p>
     */
    private boolean ensureCurve(JudgeReviewQueueItem item, boolean isCorrect) {
        // 完成时间非空 = 永远不再补记；只有"未完成 + 无有效租约"才抢得到
        if (item.getCurveScoredAt() != null) {
            return true;
        }
        if (item.getModuleType() == null) {
            log.error("审核记录缺少 module_type，无法补记遗忘曲线: reviewId={}", item.getId());
            return false;
        }
        if (judgeReviewQueueMapper.claimCurveLease(item.getId()) == 0) {
            // 已完成或别的实例正在补，视为已处理
            return true;
        }
        try {
            Map<String, Object> body = new HashMap<>();
            body.put("userId", item.getUserId());
            body.put("questionId", item.getQuestionId());
            body.put("isCorrect", isCorrect);
            body.put("moduleType", item.getModuleType());
            postJson(learningEngineUrl + "/learning/update-curve", body);
            judgeReviewQueueMapper.markCurveDone(item.getId());
            return true;
        } catch (Exception e) {
            log.error("补记遗忘曲线失败，租约已释放待重试: reviewId={}, error={}",
                    item.getId(), e.getMessage());
            judgeReviewQueueMapper.releaseCurveLease(item.getId());
            return false;
        }
    }

    /** 补记 ELO，与 {@link #ensureCurve} 同一套「抢占 → 请求 → 成功置完成 / 失败释放租约」协议 */
    private boolean ensureElo(JudgeReviewQueueItem item, boolean isCorrect) {
        if (item.getEloScoredAt() != null) {
            return true;
        }
        if (item.getModuleType() == null || item.getDifficultyLevel() == null) {
            log.error("审核记录缺少 module_type / difficulty_level，无法补记 ELO: reviewId={}", item.getId());
            return false;
        }
        if (judgeReviewQueueMapper.claimEloLease(item.getId()) == 0) {
            return true;
        }
        try {
            Map<String, Object> body = new HashMap<>();
            body.put("userId", item.getUserId());
            body.put("difficultyLevel", item.getDifficultyLevel());
            body.put("moduleType", item.getModuleType());
            body.put("isCorrect", isCorrect);
            postJson(userServiceUrl + "/user/radar/update-elo", body);
            judgeReviewQueueMapper.markEloDone(item.getId());
            return true;
        } catch (Exception e) {
            log.error("补记 ELO 失败，租约已释放待重试: reviewId={}, error={}",
                    item.getId(), e.getMessage());
            judgeReviewQueueMapper.releaseEloLease(item.getId());
            return false;
        }
    }

    private void postJson(String url, Map<String, Object> body) {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        auditRestTemplate.postForEntity(url, new HttpEntity<>(body, headers), String.class);
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
