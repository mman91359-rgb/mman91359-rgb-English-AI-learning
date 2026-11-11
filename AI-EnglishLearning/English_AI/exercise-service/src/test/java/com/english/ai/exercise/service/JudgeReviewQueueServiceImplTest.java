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
    private RestTemplate restTemplate;

    @InjectMocks
    private JudgeReviewQueueServiceImpl service;

    @org.junit.jupiter.api.BeforeEach
    void setUp() {
        ReflectionTestUtils.setField(service, "userServiceUrl", "http://user-test");
        ReflectionTestUtils.setField(service, "learningEngineUrl", "http://learning-test");
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

        assertTrue(service.resolve(resolveRequest("PASS")));

        // PASS 不动答题日志与错题本，但要按 isCorrect=true 补记 ELO / 曲线
        verifyNoInteractions(exerciseLogMapper, errorBookMapper);
        verify(restTemplate, org.mockito.Mockito.times(2))
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

        assertTrue(service.resolve(resolveRequest("FAIL")));

        verify(exerciseLogMapper).updateById(org.mockito.ArgumentMatchers.argThat(
                saved -> saved != null && saved.getId().equals(88L) && saved.getIsCorrect() == 0));
        ArgumentCaptor<UserErrorBook> captor = ArgumentCaptor.forClass(UserErrorBook.class);
        verify(errorBookMapper).insert(captor.capture());
        assertEquals(9L, captor.getValue().getUserId());
        assertEquals(510L, captor.getValue().getQuestionId());
        verify(restTemplate, org.mockito.Mockito.times(2))
                .postForEntity(any(String.class), any(), eq(String.class));
    }

    @Test
    void resolveFailWithoutLogIdSkipsLogUpdateInsteadOfGuessing() {
        JudgeReviewQueueItem item = pendingItem();
        item.setLogId(null);
        when(judgeReviewQueueMapper.selectById(12L)).thenReturn(item);
        when(judgeReviewQueueMapper.update(isNull(), any())).thenReturn(1);
        when(errorBookMapper.selectOne(any())).thenReturn(null);

        assertTrue(service.resolve(resolveRequest("FAIL")));

        // 没有 log_id 就不猜"最近一条"，只写错题本
        verifyNoInteractions(exerciseLogMapper);
        verify(errorBookMapper).insert(any(UserErrorBook.class));
    }

    @Test
    void resolveIsIdempotent() {
        JudgeReviewQueueItem reviewed = pendingItem();
        reviewed.setStatus("REVIEWED");
        when(judgeReviewQueueMapper.selectById(12L)).thenReturn(reviewed);

        assertFalse(service.resolve(resolveRequest("FAIL")));
        verify(judgeReviewQueueMapper, never()).update(isNull(), any());
        verifyNoInteractions(exerciseLogMapper, errorBookMapper, restTemplate);
    }

    @Test
    void resolveReturnsFalseWhenAlreadyTakenConcurrently() {
        when(judgeReviewQueueMapper.selectById(12L)).thenReturn(pendingItem());
        when(judgeReviewQueueMapper.update(isNull(), any())).thenReturn(0);

        assertFalse(service.resolve(resolveRequest("FAIL")));
        verifyNoInteractions(exerciseLogMapper, errorBookMapper, restTemplate);
    }
}
