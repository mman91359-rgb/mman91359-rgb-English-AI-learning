package com.english.ai.exercise.service;

import com.english.ai.exercise.dto.JudgeReviewEnqueueRequest;
import com.english.ai.exercise.dto.JudgeReviewResolveRequest;
import com.english.ai.exercise.entity.JudgeReviewQueueItem;
import com.english.ai.exercise.entity.UserErrorBook;
import com.english.ai.exercise.entity.UserExerciseLog;
import com.english.ai.exercise.mapper.JudgeReviewQueueMapper;
import com.english.ai.exercise.mapper.UserErrorBookMapper;
import com.english.ai.exercise.mapper.UserExerciseLogMapper;
import com.english.ai.exercise.service.impl.JudgeReviewQueueServiceImpl;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.ArgumentCaptor;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.test.util.ReflectionTestUtils;
import org.springframework.web.client.RestTemplate;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.ArgumentMatchers.isNull;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.verifyNoInteractions;
import static org.mockito.Mockito.when;

/**
 * 判题审核队列：入队与审核结论落地测试。
 */
@ExtendWith(MockitoExtension.class)
class JudgeReviewQueueServiceImplTest {

    @Mock
    private JudgeReviewQueueMapper judgeReviewQueueMapper;

    @Mock
    private UserExerciseLogMapper exerciseLogMapper;

    @Mock
    private UserErrorBookMapper errorBookMapper;

    @Mock
    private RestTemplate auditRestTemplate;

    @InjectMocks
    private JudgeReviewQueueServiceImpl service;

    @org.junit.jupiter.api.BeforeEach
    void setUp() {
        ReflectionTestUtils.setField(service, "userServiceUrl", "http://user-test");
        ReflectionTestUtils.setField(service, "learningEngineUrl", "http://learning-test");
        // @Resource 注入的字段 Mockito 不会自动填，显式塞进去
        ReflectionTestUtils.setField(service, "auditRestTemplate", auditRestTemplate);
    }

    private JudgeReviewEnqueueRequest request(String reason) {
        JudgeReviewEnqueueRequest req = new JudgeReviewEnqueueRequest();
        req.setQuestionId(510L);
        req.setUserId(9L);
        req.setUserAnswer("abandonned");
        req.setCorrectAnswer("abandoned");
        req.setMatchedLevel(2);
        req.setReason(reason);
        return req;
    }

    @Test
    void enqueueReturnsTrueWhenInserted() {
        when(judgeReviewQueueMapper.enqueueIgnoreDuplicate(any())).thenReturn(1);

        assertTrue(service.enqueue(request("MISMATCH")));
    }

    @Test
    void enqueueReturnsFalseWhenDuplicate() {
        when(judgeReviewQueueMapper.enqueueIgnoreDuplicate(any())).thenReturn(0);

        assertFalse(service.enqueue(request("MISMATCH")));
    }

    @Test
    void blankReasonFallsBackToManualAndStatusIsPending() {
        when(judgeReviewQueueMapper.enqueueIgnoreDuplicate(any())).thenReturn(1);

        service.enqueue(request("   "));

        ArgumentCaptor<JudgeReviewQueueItem> captor = ArgumentCaptor.forClass(JudgeReviewQueueItem.class);
        verify(judgeReviewQueueMapper).enqueueIgnoreDuplicate(captor.capture());
        JudgeReviewQueueItem saved = captor.getValue();
        assertEquals("MANUAL", saved.getReason());
        assertEquals("PENDING", saved.getStatus());
        assertEquals(510L, saved.getQuestionId());
        assertEquals("abandonned", saved.getUserAnswer());
    }

    // ===== 审核结论落地 =====

    private JudgeReviewQueueItem pendingItem() {
        JudgeReviewQueueItem item = new JudgeReviewQueueItem();
        item.setId(12L);
        item.setQuestionId(510L);
        item.setUserId(9L);
        item.setLogId(88L);
        item.setDifficultyLevel(3);
        item.setModuleType(3);
        item.setStatus("PENDING");
        item.setReason("TRANSLATION_LOW_SCORE");
        return item;
    }

    private JudgeReviewResolveRequest resolveRequest(String verdict) {
        JudgeReviewResolveRequest req = new JudgeReviewResolveRequest();
        req.setReviewId(12L);
        req.setVerdict(verdict);
        req.setComment("人工复核");
        req.setReviewerId(1L);
        return req;
    }

    @Test
    void resolvePassOnlyUpdatesStatusAndRecordsPositive() {
        when(judgeReviewQueueMapper.selectById(12L)).thenReturn(pendingItem());
        when(judgeReviewQueueMapper.update(isNull(), any())).thenReturn(1);
        // PASS 也需确认有绑定作答，否则走「无绑定作答」分支跳过补记
        UserExerciseLog log = new UserExerciseLog();
        log.setId(88L);
        log.setUserId(9L);
        log.setQuestionId(510L);
        log.setIsCorrect(1);
        when(exerciseLogMapper.selectById(88L)).thenReturn(log);
        when(judgeReviewQueueMapper.claimCurveLease(12L)).thenReturn(1);
        when(judgeReviewQueueMapper.claimEloLease(12L)).thenReturn(1);

        assertTrue(service.resolve(resolveRequest("PASS")));

        // PASS 不改判（不 updateById），但要按 isCorrect=true 补记 ELO / 曲线
        verify(exerciseLogMapper, never()).updateById(any());
        verifyNoInteractions(errorBookMapper);
        verify(auditRestTemplate, org.mockito.Mockito.times(2))
                .postForEntity(any(String.class), any(), eq(String.class));
    }

    @Test
    void resolveFailMarksBoundLogWrongAndUpsertsErrorBook() {
        when(judgeReviewQueueMapper.selectById(12L)).thenReturn(pendingItem());
        when(judgeReviewQueueMapper.update(isNull(), any())).thenReturn(1);

        UserExerciseLog log = new UserExerciseLog();
        log.setId(88L);
        log.setUserId(9L);
        log.setQuestionId(510L);
        log.setIsCorrect(1);
        // 按 log_id 精确取，而不是按 user+question 猜最近一条
        when(exerciseLogMapper.selectById(88L)).thenReturn(log);
        when(errorBookMapper.selectOne(any())).thenReturn(null);
        when(judgeReviewQueueMapper.claimCurveLease(12L)).thenReturn(1);
        when(judgeReviewQueueMapper.claimEloLease(12L)).thenReturn(1);

        assertTrue(service.resolve(resolveRequest("FAIL")));

        verify(exerciseLogMapper).updateById(org.mockito.ArgumentMatchers.argThat(
                saved -> saved != null && saved.getId().equals(88L) && saved.getIsCorrect() == 0));
        ArgumentCaptor<UserErrorBook> captor = ArgumentCaptor.forClass(UserErrorBook.class);
        verify(errorBookMapper).insert(captor.capture());
        assertEquals(9L, captor.getValue().getUserId());
        assertEquals(510L, captor.getValue().getQuestionId());
        verify(auditRestTemplate, org.mockito.Mockito.times(2))
                .postForEntity(any(String.class), any(), eq(String.class));
    }

    @Test
    void resolveFailWithoutLogIdSkipsAllSideEffects() {
        JudgeReviewQueueItem item = pendingItem();
        item.setLogId(null);
        when(judgeReviewQueueMapper.selectById(12L)).thenReturn(item);
        when(judgeReviewQueueMapper.update(isNull(), any())).thenReturn(1);

        assertTrue(service.resolve(resolveRequest("FAIL")));

        // 无 log_id：不改判、不写错题本、不发补记请求（手工/历史行无计分依据）
        verifyNoInteractions(exerciseLogMapper, errorBookMapper, auditRestTemplate);
    }

    @Test
    void resolveFailWithoutBoundLogSkipsAllSideEffects() {
        when(judgeReviewQueueMapper.selectById(12L)).thenReturn(pendingItem());
        when(judgeReviewQueueMapper.update(isNull(), any())).thenReturn(1);
        // log_id 有值，但绑定的作答记录已不存在（被清理）
        when(exerciseLogMapper.selectById(88L)).thenReturn(null);

        assertTrue(service.resolve(resolveRequest("FAIL")));

        // 无绑定作答：不改判、不写错题本、不补记（与 log_id=null 同一门槛）
        verify(exerciseLogMapper, never()).updateById(any());
        verifyNoInteractions(errorBookMapper, auditRestTemplate);
    }

    @Test
    void resolveFailOnAlreadyWrongLogSkipsErrorBook() {
        when(judgeReviewQueueMapper.selectById(12L)).thenReturn(pendingItem());
        when(judgeReviewQueueMapper.update(isNull(), any())).thenReturn(1);
        // 绑定的作答本来就是错的 → 无需改判，也不重复写错题本
        UserExerciseLog log = new UserExerciseLog();
        log.setId(88L);
        log.setUserId(9L);
        log.setQuestionId(510L);
        log.setIsCorrect(0);
        when(exerciseLogMapper.selectById(88L)).thenReturn(log);
        when(judgeReviewQueueMapper.claimCurveLease(12L)).thenReturn(1);
        when(judgeReviewQueueMapper.claimEloLease(12L)).thenReturn(1);

        assertTrue(service.resolve(resolveRequest("FAIL")));

        verify(exerciseLogMapper, never()).updateById(any());
        verifyNoInteractions(errorBookMapper);
        // 作答存在（只是本已错）→ 仍按 FAIL 补记
        verify(auditRestTemplate, org.mockito.Mockito.times(2))
                .postForEntity(any(String.class), any(), eq(String.class));
    }

    @Test
    void resolveIsIdempotent() {
        JudgeReviewQueueItem reviewed = pendingItem();
        reviewed.setStatus("REVIEWED");
        when(judgeReviewQueueMapper.selectById(12L)).thenReturn(reviewed);

        assertFalse(service.resolve(resolveRequest("FAIL")));
        verify(judgeReviewQueueMapper, never()).update(isNull(), any());
        verifyNoInteractions(exerciseLogMapper, errorBookMapper, auditRestTemplate);
    }

    @Test
    void resolveReturnsFalseWhenAlreadyTakenConcurrently() {
        when(judgeReviewQueueMapper.selectById(12L)).thenReturn(pendingItem());
        when(judgeReviewQueueMapper.update(isNull(), any())).thenReturn(0);

        assertFalse(service.resolve(resolveRequest("FAIL")));
        verifyNoInteractions(exerciseLogMapper, errorBookMapper, auditRestTemplate);
    }

    // ===== 补记重试（rescore） =====

    private JudgeReviewQueueItem reviewedItem() {
        JudgeReviewQueueItem item = pendingItem();
        item.setStatus("REVIEWED");
        return item;
    }

    private UserExerciseLog boundLog(int isCorrect) {
        UserExerciseLog log = new UserExerciseLog();
        log.setId(88L);
        log.setUserId(9L);
        log.setQuestionId(510L);
        log.setIsCorrect(isCorrect);
        return log;
    }

    @Test
    void rescoreOnlyFillsMissingCurveAndSkipsScoredElo() {
        JudgeReviewQueueItem item = reviewedItem();
        item.setEloScoredAt(java.time.LocalDateTime.now());
        when(judgeReviewQueueMapper.selectById(12L)).thenReturn(item);
        when(exerciseLogMapper.selectById(88L)).thenReturn(boundLog(1));
        when(judgeReviewQueueMapper.claimCurveLease(12L)).thenReturn(1);

        assertTrue(service.rescore(12L));

        verify(judgeReviewQueueMapper, never()).claimEloLease(any());
        verify(judgeReviewQueueMapper).markCurveDone(12L);
        verify(auditRestTemplate, org.mockito.Mockito.times(1))
                .postForEntity(any(String.class), any(), eq(String.class));
    }

    @Test
    void rescoreReturnsTrueWhenBothAlreadyScored() {
        JudgeReviewQueueItem item = reviewedItem();
        item.setCurveScoredAt(java.time.LocalDateTime.now());
        item.setEloScoredAt(java.time.LocalDateTime.now());
        when(judgeReviewQueueMapper.selectById(12L)).thenReturn(item);

        // 两半都完成 → 按 javadoc 语义返回 true，而不是 false
        assertTrue(service.rescore(12L));
        verifyNoInteractions(auditRestTemplate, exerciseLogMapper);
    }

    @Test
    void rescoreRejectsPendingOrUnboundRows() {
        when(judgeReviewQueueMapper.selectById(12L)).thenReturn(pendingItem());
        assertFalse(service.rescore(12L));

        JudgeReviewQueueItem noLog = reviewedItem();
        noLog.setLogId(null);
        when(judgeReviewQueueMapper.selectById(12L)).thenReturn(noLog);
        assertFalse(service.rescore(12L));

        verifyNoInteractions(auditRestTemplate);
    }

    @Test
    void rescoreReleasesLeasesWhenDownstreamFails() {
        JudgeReviewQueueItem item = reviewedItem();
        when(judgeReviewQueueMapper.selectById(12L)).thenReturn(item);
        when(exerciseLogMapper.selectById(88L)).thenReturn(boundLog(0));
        when(judgeReviewQueueMapper.claimCurveLease(12L)).thenReturn(1);
        when(judgeReviewQueueMapper.claimEloLease(12L)).thenReturn(1);
        when(auditRestTemplate.postForEntity(any(String.class), any(), eq(String.class)))
                .thenThrow(new RuntimeException("timeout"));

        assertFalse(service.rescore(12L));

        verify(judgeReviewQueueMapper).releaseCurveLease(12L);
        verify(judgeReviewQueueMapper).releaseEloLease(12L);
        // 失败绝不能写完成时间
        verify(judgeReviewQueueMapper, never()).markCurveDone(any());
        verify(judgeReviewQueueMapper, never()).markEloDone(any());
    }

    /**
     * 回归：一条 10 分钟前**成功补记**的记录，绝不能被当成"过期租约"再补一次。
     * 旧实现把抢占时刻写进 scored_at，这条会每 10 分钟重复推一次曲线。
     */
    @Test
    void completedCurveIsNeverReclaimed() {
        JudgeReviewQueueItem item = reviewedItem();
        item.setCurveScoredAt(java.time.LocalDateTime.now().minusMinutes(10));
        item.setEloScoredAt(java.time.LocalDateTime.now());
        when(judgeReviewQueueMapper.selectById(12L)).thenReturn(item);

        assertTrue(service.rescore(12L));

        verify(judgeReviewQueueMapper, never()).claimCurveLease(any());
        verify(judgeReviewQueueMapper, never()).claimEloLease(any());
        verifyNoInteractions(auditRestTemplate, exerciseLogMapper);
    }

    @Test
    void activeLeaseIsNotReclaimed() {
        JudgeReviewQueueItem item = reviewedItem();
        // 未完成，但租约还有效 → 别的实例正在补，不能抢
        item.setCurveLeaseUntil(java.time.LocalDateTime.now().plusMinutes(5));
        item.setEloScoredAt(java.time.LocalDateTime.now());
        when(judgeReviewQueueMapper.selectById(12L)).thenReturn(item);
        when(exerciseLogMapper.selectById(88L)).thenReturn(boundLog(1));
        when(judgeReviewQueueMapper.claimCurveLease(12L)).thenReturn(0);

        assertTrue(service.rescore(12L));

        verify(judgeReviewQueueMapper).claimCurveLease(12L);
        verifyNoInteractions(auditRestTemplate);
    }

    @Test
    void expiredLeaseAllowsReclaim() {
        JudgeReviewQueueItem item = reviewedItem();
        // 未完成 + 租约已过期（模拟进程崩溃）→ 应重新抢占并只发一次
        item.setCurveLeaseUntil(java.time.LocalDateTime.now().minusMinutes(1));
        item.setEloScoredAt(java.time.LocalDateTime.now());
        when(judgeReviewQueueMapper.selectById(12L)).thenReturn(item);
        when(exerciseLogMapper.selectById(88L)).thenReturn(boundLog(1));
        when(judgeReviewQueueMapper.claimCurveLease(12L)).thenReturn(1);

        assertTrue(service.rescore(12L));

        verify(judgeReviewQueueMapper).claimCurveLease(12L);
        verify(judgeReviewQueueMapper).markCurveDone(12L);
        verify(auditRestTemplate, org.mockito.Mockito.times(1))
                .postForEntity(any(String.class), any(), eq(String.class));
    }

    @Test
    void claimReturningZeroMeansAlreadyHandled() {
        JudgeReviewQueueItem item = reviewedItem();
        when(judgeReviewQueueMapper.selectById(12L)).thenReturn(item);
        when(exerciseLogMapper.selectById(88L)).thenReturn(boundLog(1));
        when(judgeReviewQueueMapper.claimCurveLease(12L)).thenReturn(0);
        when(judgeReviewQueueMapper.claimEloLease(12L)).thenReturn(0);

        assertTrue(service.rescore(12L));
        verifyNoInteractions(auditRestTemplate);
    }
}
