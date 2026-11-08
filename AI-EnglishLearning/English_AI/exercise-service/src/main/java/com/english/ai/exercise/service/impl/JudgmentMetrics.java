package com.english.ai.exercise.service.impl;

import com.english.ai.exercise.dto.JudgmentResult;
import lombok.extern.slf4j.Slf4j;

import java.util.concurrent.atomic.AtomicLong;

/**
 * 判题链路埋点（无外部依赖）。
 *
 * <p>项目未引入 actuator/micrometer，这里用内存计数器 + 结构化日志承担观测职责：
 * 每次判题输出层级、耗时、是否触发 AI；每 {@value #SUMMARY_INTERVAL} 次输出一行汇总，
 * 含各层级命中分布与 AI 触发率。</p>
 */
@Slf4j
class JudgmentMetrics {

    /** 汇总日志的输出间隔（次） */
    static final int SUMMARY_INTERVAL = 100;

    private final AtomicLong total = new AtomicLong();
    private final AtomicLong aiCalled = new AtomicLong();
    /** 下标即层级编号：0=本地比对，1=精确，2=语义/错因/相似度，3=AI 反馈 */
    private final AtomicLong[] levelHits = {
            new AtomicLong(), new AtomicLong(), new AtomicLong(), new AtomicLong()
    };

    void record(Long questionId, JudgmentResult result, long elapsedMs, boolean calledAi) {
        long count = total.incrementAndGet();
        if (calledAi) {
            aiCalled.incrementAndGet();
        }
        Integer level = result != null ? result.getMatchedLevel() : null;
        if (level != null && level >= 0 && level < levelHits.length) {
            levelHits[level].incrementAndGet();
        }

        log.debug("判题完成 qid={} level={} correct={} elapsedMs={} aiCalled={}",
                questionId, level, result != null ? result.getIsCorrect() : null, elapsedMs, calledAi);

        if (count % SUMMARY_INTERVAL == 0) {
            log.info("判题汇总 total={} level0={} level1={} level2={} level3={} aiRate={}%",
                    count, levelHits[0].get(), levelHits[1].get(), levelHits[2].get(), levelHits[3].get(),
                    Math.round(aiCalled.get() * 100.0 / count));
        }
    }

    long totalCount() {
        return total.get();
    }

    long aiCalledCount() {
        return aiCalled.get();
    }

    long levelHit(int level) {
        return level >= 0 && level < levelHits.length ? levelHits[level].get() : 0;
    }
}
