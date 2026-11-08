package com.english.ai.exercise.service.impl;

import com.english.ai.exercise.dto.JudgeReviewEnqueueRequest;
import com.english.ai.exercise.entity.JudgeReviewQueueItem;
import com.english.ai.exercise.mapper.JudgeReviewQueueMapper;
import com.english.ai.exercise.service.JudgeReviewQueueService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

/**
 * 判题审核队列实现：只做幂等入队，不做任何判题逻辑。
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class JudgeReviewQueueServiceImpl implements JudgeReviewQueueService {

    private static final String DEFAULT_REASON = "MANUAL";
    private static final String STATUS_PENDING = "PENDING";

    private final JudgeReviewQueueMapper judgeReviewQueueMapper;

    @Override
    public boolean enqueue(JudgeReviewEnqueueRequest request) {
        JudgeReviewQueueItem item = new JudgeReviewQueueItem();
        item.setQuestionId(request.getQuestionId());
        item.setUserId(request.getUserId());
        item.setUserAnswer(request.getUserAnswer());
        item.setCorrectAnswer(request.getCorrectAnswer());
        item.setMatchedLevel(request.getMatchedLevel());
        item.setReason(isBlank(request.getReason()) ? DEFAULT_REASON : request.getReason());
        item.setStatus(STATUS_PENDING);

        int affected = judgeReviewQueueMapper.enqueueIgnoreDuplicate(item);
        if (affected > 0) {
            log.info("判题审核入队: questionId={}, userId={}, reason={}",
                    item.getQuestionId(), item.getUserId(), item.getReason());
            return true;
        }
        log.debug("判题审核重复入队，已忽略: questionId={}, userId={}",
                item.getQuestionId(), item.getUserId());
        return false;
    }

    private boolean isBlank(String value) {
        return value == null || value.trim().isEmpty();
    }
}
