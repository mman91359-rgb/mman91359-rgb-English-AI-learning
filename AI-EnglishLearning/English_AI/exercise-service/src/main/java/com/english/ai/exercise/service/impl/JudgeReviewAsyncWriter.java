package com.english.ai.exercise.service.impl;

import com.english.ai.exercise.dto.JudgeReviewEnqueueRequest;
import com.english.ai.exercise.service.JudgeReviewQueueService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.RejectedExecutionHandler;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicLong;

/**
 * 判题审核队列的异步写入器。
 *
 * <p>project 没有启用 {@code @EnableAsync}，这里用单线程 + 有界队列自建执行器：
 * 队列满时**丢弃并记 error 日志、累加计数**，保证判题主流程永远不会被审核写入拖慢或拖垮。
 * 标定期样本稀缺，丢了多少必须能查——所以拒绝策略不能是静默的 DiscardPolicy。</p>
 */
@Slf4j
@Component
public class JudgeReviewAsyncWriter {

    private static final int QUEUE_CAPACITY = 200;

    private final JudgeReviewQueueService judgeReviewQueueService;
    private final CountingDiscardHandler rejectHandler = new CountingDiscardHandler();
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
                rejectHandler);
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

    /** 累计丢弃数，供监控/测试查询 */
    long droppedCount() {
        return rejectHandler.dropped();
    }

    /** 队列满时的拒绝策略：计数 + error 日志 */
    static final class CountingDiscardHandler implements RejectedExecutionHandler {

        private final AtomicLong dropped = new AtomicLong();

        @Override
        public void rejectedExecution(Runnable r, ThreadPoolExecutor executor) {
            long total = dropped.incrementAndGet();
            log.error("审核队列已满，丢弃样本: queueSize={}, dropped={}",
                    executor.getQueue().size(), total);
        }

        long dropped() {
            return dropped.get();
        }
    }
}
