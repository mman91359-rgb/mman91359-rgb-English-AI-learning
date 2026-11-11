package com.english.ai.exercise.schedule;

import com.english.ai.exercise.entity.JudgeReviewQueueItem;
import com.english.ai.exercise.mapper.JudgeReviewQueueMapper;
import com.english.ai.exercise.service.JudgeReviewQueueService;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.List;

import static org.mockito.ArgumentMatchers.anyInt;
import static org.mockito.ArgumentMatchers.anyLong;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.verifyNoInteractions;
import static org.mockito.Mockito.when;

/**
 * 复核补记重试任务测试。
 */
@ExtendWith(MockitoExtension.class)
class ReviewScoringRetryTaskTest {

    @Mock
    private JudgeReviewQueueMapper judgeReviewQueueMapper;

    @Mock
    private JudgeReviewQueueService judgeReviewQueueService;

    @InjectMocks
    private ReviewScoringRetryTask task;

    @Test
    void retriesEachUnscoredRow() {
        JudgeReviewQueueItem first = new JudgeReviewQueueItem();
        first.setId(1L);
        JudgeReviewQueueItem second = new JudgeReviewQueueItem();
        second.setId(2L);
        when(judgeReviewQueueMapper.findUnscored(anyInt())).thenReturn(List.of(first, second));
        when(judgeReviewQueueService.rescore(anyLong())).thenReturn(true);

        task.retryUnscored();

        verify(judgeReviewQueueService).rescore(1L);
        verify(judgeReviewQueueService).rescore(2L);
    }

    @Test
    void doesNothingWhenQueueIsClean() {
        when(judgeReviewQueueMapper.findUnscored(anyInt())).thenReturn(List.of());

        task.retryUnscored();

        verifyNoInteractions(judgeReviewQueueService);
    }
}
