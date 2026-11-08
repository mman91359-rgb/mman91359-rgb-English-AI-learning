package com.english.ai.exercise.service;

import com.english.ai.exercise.dto.JudgeReviewEnqueueRequest;
import com.english.ai.exercise.entity.JudgeReviewQueueItem;
import com.english.ai.exercise.mapper.JudgeReviewQueueMapper;
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
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

/**
 * 判题审核队列入队逻辑测试。
 */
@ExtendWith(MockitoExtension.class)
class JudgeReviewQueueServiceImplTest {

    @Mock
    private JudgeReviewQueueMapper judgeReviewQueueMapper;

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
}
