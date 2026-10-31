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

    List<QuestionVO> listListeningQuestions(Long userId, int count);

    QuestionVO getListeningQuestion(Long questionId, boolean showAnswer);

    SubmitResponse submitListeningAnswer(SubmitRequest request);

    ListeningStats getListeningStats(Long userId);
}
