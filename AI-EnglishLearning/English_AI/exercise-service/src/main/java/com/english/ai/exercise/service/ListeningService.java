package com.english.ai.exercise.service;

import com.english.ai.exercise.dto.ListeningStats;
import com.english.ai.exercise.dto.QuestionVO;
import com.english.ai.exercise.dto.SubmitRequest;
import com.english.ai.exercise.dto.SubmitResponse;

import java.util.List;

/**
 * 听力模块编排服务。
 * 题目仍复用题库与统一判题链路，本服务只补充音频元数据与听力统计。
 */
public interface ListeningService {

    /**
     * 听力选题；listeningType 为 null 表示全部题型。
     */
    List<QuestionVO> listListeningQuestions(Long userId, int count, String listeningType);

    /**
     * 听力单题详情；showAnswer=true 时必须传 userId，且该用户已作答过该题。
     */
    QuestionVO getListeningQuestion(Long questionId, boolean showAnswer, Long userId);

    SubmitResponse submitListeningAnswer(SubmitRequest request);

    ListeningStats getListeningStats(Long userId);
}
