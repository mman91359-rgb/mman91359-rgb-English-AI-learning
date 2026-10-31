package com.english.ai.exercise.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.english.ai.common.BusinessException;
import com.english.ai.common.ErrorCode;
import com.english.ai.common.ModuleType;
import com.english.ai.exercise.dto.ListeningStats;
import com.english.ai.exercise.dto.QuestionVO;
import com.english.ai.exercise.dto.SubmitRequest;
import com.english.ai.exercise.dto.SubmitResponse;
import com.english.ai.exercise.entity.ListeningAudio;
import com.english.ai.exercise.entity.UserExerciseLog;
import com.english.ai.exercise.mapper.ListeningAudioMapper;
import com.english.ai.exercise.mapper.UserExerciseLogMapper;
import com.english.ai.exercise.service.ExerciseService;
import com.english.ai.exercise.service.ListeningService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 听力模块编排实现。
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class ListeningServiceImpl implements ListeningService {

    private static final int MAX_COUNT = 20;

    private final ExerciseService exerciseService;
    private final ListeningAudioMapper listeningAudioMapper;
    private final UserExerciseLogMapper exerciseLogMapper;

    @Override
    public List<QuestionVO> listListeningQuestions(Long userId, int count) {
        int safeCount = Math.max(1, Math.min(MAX_COUNT, count));
        List<QuestionVO> questions = exerciseService.selectQuestions(
                userId, ModuleType.LISTENING.getCode(), safeCount);
        if (questions.isEmpty()) {
            return questions;
        }

        List<Long> ids = questions.stream().map(QuestionVO::getId).toList();
        Map<Long, ListeningAudio> audioMap = loadAudioMap(ids);
        List<QuestionVO> result = new ArrayList<>();
        for (QuestionVO question : questions) {
            ListeningAudio audio = audioMap.get(question.getId());
            if (audio == null) {
                log.warn("听力题缺少音频元数据，已跳过: questionId={}", question.getId());
                continue;
            }
            question.setAudioUrl(audio.getAudioUrl());
            question.setDurationSeconds(audio.getDurationSeconds());
            // 作答前不下发原文，提交后再由 SubmitResponse 返回
            question.setTranscript(null);
            result.add(question);
        }
        return result;
    }

    @Override
    public QuestionVO getListeningQuestion(Long questionId, boolean showAnswer) {
        QuestionVO question = exerciseService.getQuestionById(questionId, showAnswer);
        if (question == null || !Integer.valueOf(ModuleType.LISTENING.getCode()).equals(question.getModuleType())) {
            throw new BusinessException(ErrorCode.NOT_FOUND, "听力题目不存在");
        }
        ListeningAudio audio = loadAudio(questionId);
        if (audio != null) {
            question.setAudioUrl(audio.getAudioUrl());
            question.setDurationSeconds(audio.getDurationSeconds());
            question.setTranscript(showAnswer ? audio.getTranscript() : null);
        }
        return question;
    }

    @Override
    public SubmitResponse submitListeningAnswer(SubmitRequest request) {
        QuestionVO question = exerciseService.getQuestionById(request.getQuestionId(), false);
        if (question == null || !Integer.valueOf(ModuleType.LISTENING.getCode()).equals(question.getModuleType())) {
            throw new BusinessException(ErrorCode.BAD_REQUEST, "题目不属于听力模块");
        }

        request.setModuleType(ModuleType.LISTENING.getCode());
        SubmitResponse response = exerciseService.submitAnswer(request);

        ListeningAudio audio = loadAudio(request.getQuestionId());
        if (audio != null) {
            response.setTranscript(audio.getTranscript());
        }
        return response;
    }

    @Override
    public ListeningStats getListeningStats(Long userId) {
        List<UserExerciseLog> logs = exerciseLogMapper.selectList(
                new LambdaQueryWrapper<UserExerciseLog>()
                        .eq(UserExerciseLog::getUserId, userId)
                        .eq(UserExerciseLog::getModuleType, ModuleType.LISTENING.getCode()));
        int total = logs.size();
        int correct = (int) logs.stream()
                .filter(logEntry -> Integer.valueOf(1).equals(logEntry.getIsCorrect()))
                .count();
        double rate = total == 0 ? 0.0 : Math.round(correct * 1000.0 / total) / 10.0;
        return ListeningStats.builder()
                .totalAnswered(total)
                .correctCount(correct)
                .correctRate(rate)
                .build();
    }

    private ListeningAudio loadAudio(Long questionId) {
        return listeningAudioMapper.selectOne(
                new LambdaQueryWrapper<ListeningAudio>()
                        .eq(ListeningAudio::getQuestionId, questionId));
    }

    private Map<Long, ListeningAudio> loadAudioMap(Collection<Long> ids) {
        if (ids == null || ids.isEmpty()) {
            return Collections.emptyMap();
        }
        Map<Long, ListeningAudio> result = new HashMap<>();
        List<ListeningAudio> audios = listeningAudioMapper.selectList(
                new LambdaQueryWrapper<ListeningAudio>()
                        .in(ListeningAudio::getQuestionId, ids));
        for (ListeningAudio audio : audios) {
            result.put(audio.getQuestionId(), audio);
        }
        return result;
    }
}
