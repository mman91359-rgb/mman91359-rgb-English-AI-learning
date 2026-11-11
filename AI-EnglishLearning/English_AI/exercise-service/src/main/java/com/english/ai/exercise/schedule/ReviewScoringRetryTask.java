package com.english.ai.exercise.schedule;

import com.english.ai.exercise.entity.JudgeReviewQueueItem;
import com.english.ai.exercise.mapper.JudgeReviewQueueMapper;
import com.english.ai.exercise.service.JudgeReviewQueueService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 复核补记重试任务。
 *
 * <p>灰区提交不计分，复核结论出来后由 resolve 补记 ELO / 遗忘曲线；
 * 下游超时或 5xx 会让补记失败（标记已清回 NULL）。这个任务定期把没补完的记录再补一次，
 * 否则那条作答会永久不计分。</p>
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class ReviewScoringRetryTask {

    /** 单次最多处理条数，避免下游故障时长时间空转 */
    private static final int BATCH_SIZE = 50;

    private final JudgeReviewQueueMapper judgeReviewQueueMapper;
    private final JudgeReviewQueueService judgeReviewQueueService;

    /** 每 10 分钟扫一次；首次延迟 2 分钟，避开启动期 */
    @Scheduled(fixedDelay = 600_000, initialDelay = 120_000)
    public void retryUnscored() {
        List<JudgeReviewQueueItem> pending = judgeReviewQueueMapper.findUnscored(BATCH_SIZE);
        if (pending.isEmpty()) {
            return;
        }
        int done = 0;
        int failed = 0;
        for (JudgeReviewQueueItem item : pending) {
            try {
                if (judgeReviewQueueService.rescore(item.getId())) {
                    done += 1;
                } else {
                    failed += 1;
                }
            } catch (Exception e) {
                failed += 1;
                log.error("复核补记重试失败: reviewId={}, error={}", item.getId(), e.getMessage());
            }
        }
        log.info("复核补记重试完成: 待处理 {} 条, 完成 {} 条, 未完成 {} 条",
                pending.size(), done, failed);
    }
}
