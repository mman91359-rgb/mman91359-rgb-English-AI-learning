package com.english.ai.exercise.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.english.ai.common.BusinessException;
import com.english.ai.common.ErrorCode;
import com.english.ai.common.ListeningType;
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
import java.util.Objects;

/**
 * 听力模块编排实现。
 *
 * <p>题目仍复用题库与统一判题链路；本服务负责题型过滤、音频分段时间下发和防泄题。</p>
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
    public List<QuestionVO> listListeningQuestions(Long userId, int count, String listeningType) {
        int safeCount = Math.max(1, Math.min(MAX_COUNT, count));
        String normalizedType = normalizeListeningType(listeningType);

        // 先按题型拿到白名单 questionId，再交给统一选题逻辑；避免选题后过滤造成 usage_count 多扣
        // 只取 question_id，避免把整段 transcript/lrc 拉出来；用字符串列名，便于无 Spring 容器的单测
        QueryWrapper<ListeningAudio> audioQuery = new QueryWrapper<>();
        audioQuery.select("question_id");
        if (normalizedType != null) {
            audioQuery.eq("listening_type", normalizedType);
        }
        List<Long> allowedIds = listeningAudioMapper.selectList(audioQuery).stream()
                .map(ListeningAudio::getQuestionId)
                .filter(Objects::nonNull)
                .distinct()
                .toList();
        if (allowedIds.isEmpty()) {
            return Collections.emptyList();
        }

        List<QuestionVO> questions = exerciseService.selectQuestions(
                userId, ModuleType.LISTENING.getCode(), safeCount, allowedIds);
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
            fillAudioFields(question, audio);
            // 作答前不下发原文、字幕、解析；提交后再由 SubmitResponse 返回
            question.setTranscript(null);
            question.setLrcContent(null);
            question.setAnalysis(null);
            result.add(question);
        }
        return result;
    }

    @Override
    public QuestionVO getListeningQuestion(Long questionId, boolean showAnswer, Long userId) {
        QuestionVO question = exerciseService.getQuestionById(questionId, showAnswer);
        if (question == null || !Integer.valueOf(ModuleType.LISTENING.getCode()).equals(question.getModuleType())) {
            throw new BusinessException(ErrorCode.NOT_FOUND, "听力题目不存在");
        }

        ListeningAudio audio = loadAudio(questionId);
        if (audio != null) {
            fillAudioFields(question, audio);
        }

        if (!showAnswer) {
            // 听力解析通常直接给答案，未解锁时必须显式置空
            question.setTranscript(null);
            question.setLrcContent(null);
            question.setAnalysis(null);
            return question;
        }

        if (userId == null) {
            throw new BusinessException(ErrorCode.BAD_REQUEST, "查看听力原文需要 userId");
        }
        ensureAnswered(userId, questionId);
        if (audio != null) {
            question.setTranscript(audio.getTranscript());
            question.setLrcContent(audio.getLrcContent());
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
            response.setLrcContent(audio.getLrcContent());
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

    private String normalizeListeningType(String listeningType) {
        if (listeningType == null || listeningType.trim().isEmpty()) {
            return null;
        }
        ListeningType type = ListeningType.of(listeningType);
        if (type == null) {
            throw new BusinessException(ErrorCode.BAD_REQUEST, "非法听力题型");
        }
        return type.name();
    }

    /** 只有该用户已提交过这道听力题，才允许查看原文/解析/答案。 */
    private void ensureAnswered(Long userId, Long questionId) {
        Long answered = exerciseLogMapper.selectCount(
                new LambdaQueryWrapper<UserExerciseLog>()
                        .eq(UserExerciseLog::getUserId, userId)
                        .eq(UserExerciseLog::getQuestionId, questionId)
                        .eq(UserExerciseLog::getModuleType, ModuleType.LISTENING.getCode()));
        if (answered == null || answered == 0) {
            throw new BusinessException(ErrorCode.FORBIDDEN, "请先作答后再查看原文");
        }
    }

    private void fillAudioFields(QuestionVO question, ListeningAudio audio) {
        question.setAudioUrl(audio.getAudioUrl());
        question.setDurationSeconds(audio.getDurationSeconds());
        question.setAudioTotalSeconds(audio.getAudioTotalSeconds());
        question.setAudioStartSeconds(audio.getAudioStartSeconds());
        question.setAudioEndSeconds(audio.getAudioEndSeconds());
        question.setQuestionStartSeconds(audio.getQuestionStartSeconds());
        question.setQuestionEndSeconds(audio.getQuestionEndSeconds());
        question.setGroupKey(audio.getGroupKey());
        question.setListeningType(audio.getListeningType());
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
