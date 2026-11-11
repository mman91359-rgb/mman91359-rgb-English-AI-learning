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

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.ArgumentMatchers.any;
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

    @InjectMocks
    private JudgeReviewQueueServiceImpl service;

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
    void resolvePassOnlyUpdatesStatus() {
        when(judgeReviewQueueMapper.selectById(12L)).thenReturn(pendingItem());
        when(judgeReviewQueueMapper.update(isNull(), any())).thenReturn(1);

        assertTrue(service.resolve(resolveRequest("PASS")));
        // PASS 不动答题日志与错题本
        verifyNoInteractions(exerciseLogMapper, errorBookMapper);
    }

    @Test
    void resolveFailMarksLatestLogWrongAndUpsertsErrorBook() {
        when(judgeReviewQueueMapper.selectById(12L)).thenReturn(pendingItem());
        when(judgeReviewQueueMapper.update(isNull(), any())).thenReturn(1);

        UserExerciseLog log = new UserExerciseLog();
        log.setId(88L);
        log.setUserId(9L);
        log.setQuestionId(510L);
        log.setIsCorrect(1);
        when(exerciseLogMapper.selectOne(any())).thenReturn(log);
        when(errorBookMapper.selectOne(any())).thenReturn(null);

        assertTrue(service.resolve(resolveRequest("FAIL")));

        verify(exerciseLogMapper).updateById(org.mockito.ArgumentMatchers.argThat(
                saved -> saved != null && saved.getId().equals(88L) && saved.getIsCorrect() == 0));
        ArgumentCaptor<UserErrorBook> captor = ArgumentCaptor.forClass(UserErrorBook.class);
        verify(errorBookMapper).insert(captor.capture());
        assertEquals(9L, captor.getValue().getUserId());
        assertEquals(510L, captor.getValue().getQuestionId());
    }

    @Test
    void resolveIsIdempotent() {
        JudgeReviewQueueItem reviewed = pendingItem();
        reviewed.setStatus("REVIEWED");
        when(judgeReviewQueueMapper.selectById(12L)).thenReturn(reviewed);

        assertFalse(service.resolve(resolveRequest("FAIL")));
        verify(judgeReviewQueueMapper, never()).update(isNull(), any());
        verifyNoInteractions(exerciseLogMapper, errorBookMapper);
    }

    @Test
    void resolveReturnsFalseWhenAlreadyTakenConcurrently() {
        when(judgeReviewQueueMapper.selectById(12L)).thenReturn(pendingItem());
        when(judgeReviewQueueMapper.update(isNull(), any())).thenReturn(0);

        assertFalse(service.resolve(resolveRequest("FAIL")));
        verifyNoInteractions(exerciseLogMapper, errorBookMapper);
    }
}
