package com.english.ai.exercise.service.impl;

import com.english.ai.exercise.service.JudgeReviewQueueService;
import org.junit.jupiter.api.Test;

import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

/**
 * 审核队列写入器的拒绝策略测试：丢弃必须被计数，不能静默。
 */
class JudgeReviewAsyncWriterTest {

    @Test
    void countingHandlerIncrementsOnRejection() {
        JudgeReviewAsyncWriter.CountingDiscardHandler handler =
                new JudgeReviewAsyncWriter.CountingDiscardHandler();

        ThreadPoolExecutor executor = mock(ThreadPoolExecutor.class);
        when(executor.getQueue()).thenReturn(new ArrayBlockingQueue<>(1));

        handler.rejectedExecution(() -> { }, executor);
        handler.rejectedExecution(() -> { }, executor);

        assertEquals(2, handler.dropped());
    }

    @Test
    void writerStartsWithZeroDropped() {
        JudgeReviewAsyncWriter writer = new JudgeReviewAsyncWriter(mock(JudgeReviewQueueService.class));

        assertEquals(0, writer.droppedCount());
    }
}
