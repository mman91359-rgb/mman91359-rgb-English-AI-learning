package com.english.ai.exercise.service.impl;

import com.english.ai.exercise.dto.JudgeReviewEnqueueRequest;
import com.english.ai.exercise.service.JudgeReviewQueueService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/**
 * 判题审核队列的异步写入器。
 *
 * <p>project 没有启用 {@code @EnableAsync}，这里用单线程 + 有界队列自建执行器：
 * 队列满时直接丢弃并记日志，保证判题主流程永远不会被审核写入拖慢或拖垮。</p>
 */
@Slf4j
@Component
public class JudgeReviewAsyncWriter {

    private static final int QUEUE_CAPACITY = 200;

    private final JudgeReviewQueueService judgeReviewQueueService;
    private final ThreadPoolExecutor executor;

    public JudgeReviewAsyncWriter(JudgeReviewQueueService judgeReviewQueueService) {
        this.judgeReviewQueueService = judgeReviewQueueService;
        this.executor = new ThreadPoolExecutor(
                1, 1, 0L, TimeUnit.MILLISECONDS,
                new ArrayBlockingQueue<>(QUEUE_CAPACITY),
                runnable -> {
                    Thread thread = new Thread(runnable, "judge-review-async");
                    thread.setDaemon(true);
                    return thread;
                },
                new ThreadPoolExecutor.DiscardPolicy());
    }

    /**
     * 异步入队。任何异常都在任务内部吞掉，不影响调用方。
     */
    public void enqueueAsync(JudgeReviewEnqueueRequest request) {
        try {
            executor.execute(() -> {
                try {
                    judgeReviewQueueService.enqueue(request);
                } catch (Exception e) {
                    log.warn("审核队列异步写入失败: questionId={}, userId={}, error={}",
                            request.getQuestionId(), request.getUserId(), e.getMessage());
                }
            });
        } catch (Exception e) {
            log.warn("审核队列异步任务提交失败: questionId={}, error={}",
                    request.getQuestionId(), e.getMessage());
        }
    }
}
