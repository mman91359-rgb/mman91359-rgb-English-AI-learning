package com.english.ai.exercise.service.impl;

import com.english.ai.exercise.dto.ExerciseHistoryVO;
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
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.web.client.RestTemplate;

import java.time.Clock;
import java.time.LocalDateTime;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.mockito.ArgumentMatchers.any;
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

    @InjectMocks
    private ExerciseServiceImpl service;

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
}
