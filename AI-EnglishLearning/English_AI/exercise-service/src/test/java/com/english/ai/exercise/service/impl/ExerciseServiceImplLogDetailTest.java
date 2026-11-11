package com.english.ai.exercise.service.impl;

import com.english.ai.exercise.dto.ExerciseHistoryVO;
import com.english.ai.exercise.dto.JudgeReviewEnqueueRequest;
import com.english.ai.exercise.dto.SubmitRequest;
import com.english.ai.exercise.dto.TranslationReviewDraft;
import com.english.ai.exercise.entity.QuestionContent;
import com.english.ai.exercise.entity.QuestionInfo;
import com.english.ai.exercise.entity.UserExerciseLog;
import com.english.ai.exercise.mapper.DailyWordMapper;
import com.english.ai.exercise.mapper.KnowledgeMappingMapper;
import com.english.ai.exercise.mapper.QuestionContentMapper;
import com.english.ai.exercise.mapper.QuestionInfoMapper;
import com.english.ai.exercise.mapper.SysKnowledgePointMapper;
import com.english.ai.exercise.mapper.UserErrorBookMapper;
import com.english.ai.exercise.mapper.UserExerciseLogMapper;
import com.english.ai.exercise.mapper.UserFavoriteMapper;
import com.english.ai.exercise.mapper.UserVocabularyMapper;
import com.english.ai.exercise.mapper.WordDictionaryMapper;
import com.english.ai.exercise.service.JudgmentEngine;
import com.english.ai.exercise.service.QuestionGenerateService;
import com.english.ai.exercise.service.StudySessionService;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.test.util.ReflectionTestUtils;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.web.client.RestTemplate;

import java.time.Clock;
import java.time.LocalDateTime;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.verifyNoInteractions;
import static org.mockito.Mockito.when;

/**
 * 答题记录详情反查测试：覆盖「不存在 / 越权 / 正常映射」三种分支。
 *
 * <p>ExerciseServiceImpl 依赖较多，这里只桩住该方法的三个 Mapper，
 * 其余按 Mockito 的空实现保留。</p>
 */
@ExtendWith(MockitoExtension.class)
class ExerciseServiceImplLogDetailTest {

    @Mock private QuestionInfoMapper questionInfoMapper;
    @Mock private QuestionContentMapper questionContentMapper;
    @Mock private SysKnowledgePointMapper knowledgePointMapper;
    @Mock private KnowledgeMappingMapper knowledgeMappingMapper;
    @Mock private UserExerciseLogMapper exerciseLogMapper;
    @Mock private UserErrorBookMapper errorBookMapper;
    @Mock private UserFavoriteMapper favoriteMapper;
    @Mock private UserVocabularyMapper vocabularyMapper;
    @Mock private WordDictionaryMapper wordDictionaryMapper;
    @Mock private DailyWordMapper dailyWordMapper;
    @Mock private RestTemplate restTemplate;
    @Mock private JudgmentEngine judgmentEngine;
    @Mock private QuestionGenerateService questionGenerateService;
    @Mock private StudySessionService studySessionService;
    @Mock private Clock clock;
    @Mock private PlatformTransactionManager transactionManager;
    @Mock private JudgeReviewAsyncWriter judgeReviewAsyncWriter;
    @Mock private RabbitTemplate rabbitTemplate;

    @InjectMocks
    private ExerciseServiceImpl service;

    @org.junit.jupiter.api.BeforeEach
    void setUp() {
        ReflectionTestUtils.setField(service, "userServiceUrl", "http://user-test");
        ReflectionTestUtils.setField(service, "learningEngineUrl", "http://learning-test");
    }

    private UserExerciseLog logOf(Long id, Long userId, Long questionId) {
        UserExerciseLog log = new UserExerciseLog();
        log.setId(id);
        log.setUserId(userId);
        log.setQuestionId(questionId);
        log.setUserAnswer("abandonned");
        log.setIsCorrect(0);
        log.setDurationSeconds(12);
        log.setModuleType(1);
        log.setCreatedAt(LocalDateTime.of(2026, 11, 9, 10, 0));
        return log;
    }

    @Test
    void missingLogReturnsNull() {
        when(exerciseLogMapper.selectById(999L)).thenReturn(null);

        assertNull(service.getExerciseLogDetail(999L, 9L));
    }

    @Test
    void otherUsersLogIsTreatedAsMissing() {
        when(exerciseLogMapper.selectById(100L)).thenReturn(logOf(100L, 10L, 510L));

        // 别人提交的记录一律当不存在，不泄漏「这条记录存在但不属于你」
        assertNull(service.getExerciseLogDetail(100L, 9L));
        verifyNoInteractions(questionInfoMapper);
    }

    @Test
    void returnsMappedDetail() {
        when(exerciseLogMapper.selectById(100L)).thenReturn(logOf(100L, 9L, 510L));

        QuestionInfo info = new QuestionInfo();
        info.setId(510L);
        info.setQuestionType("FILL_BLANK");
        info.setDifficultyLevel(3);
        when(questionInfoMapper.selectById(510L)).thenReturn(info);

        QuestionContent content = new QuestionContent();
        content.setQuestionId(510L);
        content.setStem("He ____ his plan to travel.");
        content.setCorrectAnswer("abandoned");
        content.setAnalysis("abandon 的过去式");
        when(questionContentMapper.selectOne(any())).thenReturn(content);

        ExerciseHistoryVO detail = service.getExerciseLogDetail(100L, 9L);

        assertNotNull(detail);
        assertEquals(100L, detail.getLogId().longValue());
        assertEquals(510L, detail.getQuestionId().longValue());
        assertEquals("abandonned", detail.getUserAnswer());
        assertEquals("abandoned", detail.getCorrectAnswer());
        assertEquals(0, detail.getIsCorrect().intValue());
        assertEquals(12, detail.getDurationSeconds().intValue());
        assertEquals(1, detail.getModuleType().intValue());
        assertEquals("FILL_BLANK", detail.getQuestionType());
        assertEquals(3, detail.getDifficultyLevel().intValue());
        assertEquals("abandon 的过去式", detail.getAnalysis());
        assertEquals("He ____ his plan to travel.", detail.getStem());
    }

    // ===== 提交后的学习副作用分流 =====

    private SubmitRequest submitRequest() {
        SubmitRequest req = new SubmitRequest();
        req.setUserId(9L);
        req.setQuestionId(510L);
        req.setUserAnswer("a fairly good translation");
        req.setModuleType(3);
        return req;
    }

    private QuestionInfo infoWithDifficulty() {
        QuestionInfo info = new QuestionInfo();
        info.setId(510L);
        info.setDifficultyLevel(4);
        info.setQuestionType("TRANSLATION");
        return info;
    }

    @Test
    void grayDraftEnqueuesWithLogIdAndSkipsScoring() {
        TranslationReviewDraft draft = TranslationReviewDraft.builder()
                .reason("TRANSLATION_LOW_SCORE")
                .aiConfidence(new java.math.BigDecimal("0.533"))
                .aiResult("PARTIAL")
                .judgeContext("mode=enforce;scaled=8/15")
                .build();

        service.applyLearningSideEffects(submitRequest(), infoWithDifficulty(), 3,
                true, draft, 88L, "trace-123", "参考译文");

        org.mockito.ArgumentCaptor<JudgeReviewEnqueueRequest> captor =
                org.mockito.ArgumentCaptor.forClass(JudgeReviewEnqueueRequest.class);
        verify(judgeReviewAsyncWriter).enqueueAsync(captor.capture());
        JudgeReviewEnqueueRequest enqueued = captor.getValue();
        assertEquals(88L, enqueued.getLogId());
        assertEquals(3, enqueued.getModuleType().intValue());
        assertEquals(4, enqueued.getDifficultyLevel().intValue());
        assertEquals("TRANSLATION_LOW_SCORE", enqueued.getReason());
        org.junit.jupiter.api.Assertions.assertTrue(enqueued.getJudgeContext().contains("traceId=trace-123"));
        // 灰区不记 ELO / 曲线
        verifyNoInteractions(restTemplate);
    }

    @Test
    void normalSubmitRecordsCurveAndElo() {
        service.applyLearningSideEffects(submitRequest(), infoWithDifficulty(), 3,
                true, null, 88L, "trace-123", "参考译文");

        verify(restTemplate, times(2)).postForEntity(any(String.class), any(), eq(String.class));
        verifyNoInteractions(judgeReviewAsyncWriter);
    }

    // ===== MQ 与灰区互斥 =====

    @Test
    void grayDraftDoesNotPublishMessage() {
        ReflectionTestUtils.setField(service, "rabbitTemplate", rabbitTemplate);

        TranslationReviewDraft draft = TranslationReviewDraft.builder()
                .reason("TRANSLATION_LOW_SCORE").build();
        service.publishCompletedEvent(submitRequest(), 3, true, "trace-1", draft);

        // consumer 会无条件写遗忘曲线，灰区发事件等于计两次
        verifyNoInteractions(rabbitTemplate);
    }

    @Test
    void normalSubmitPublishesMessage() {
        ReflectionTestUtils.setField(service, "rabbitTemplate", rabbitTemplate);

        service.publishCompletedEvent(submitRequest(), 3, true, "trace-1", null);

        verify(rabbitTemplate).convertAndSend(any(String.class), any(String.class), any(Object.class));
    }
}
