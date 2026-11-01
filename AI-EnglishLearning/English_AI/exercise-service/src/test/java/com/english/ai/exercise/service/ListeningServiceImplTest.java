package com.english.ai.exercise.service;

import com.english.ai.common.BusinessException;
import com.english.ai.exercise.dto.ListeningStats;
import com.english.ai.exercise.dto.QuestionVO;
import com.english.ai.exercise.dto.SubmitRequest;
import com.english.ai.exercise.dto.SubmitResponse;
import com.english.ai.exercise.entity.ListeningAudio;
import com.english.ai.exercise.entity.UserExerciseLog;
import com.english.ai.exercise.mapper.ListeningAudioMapper;
import com.english.ai.exercise.mapper.UserExerciseLogMapper;
import com.english.ai.exercise.service.impl.ListeningServiceImpl;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.math.BigDecimal;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyInt;
import static org.mockito.ArgumentMatchers.anyList;
import static org.mockito.ArgumentMatchers.anyLong;
import static org.mockito.Mockito.when;

/**
 * 听力编排服务单元测试。
 */
@ExtendWith(MockitoExtension.class)
class ListeningServiceImplTest {

    @Mock
    private ExerciseService exerciseService;

    @Mock
    private ListeningAudioMapper listeningAudioMapper;

    @Mock
    private UserExerciseLogMapper exerciseLogMapper;

    private ListeningServiceImpl service;

    @BeforeEach
    void setUp() {
        service = new ListeningServiceImpl(exerciseService, listeningAudioMapper, exerciseLogMapper);
    }

    @Test
    void listFiltersByTypeAndHidesTranscriptLrcAnalysis() {
        QuestionVO withAudio = QuestionVO.builder()
                .id(1L)
                .moduleType(4)
                .analysis("会泄题的解析")
                .build();
        QuestionVO withoutAudio = QuestionVO.builder().id(2L).moduleType(4).build();
        when(listeningAudioMapper.selectList(any())).thenReturn(List.of(audio(1L, "原文", "字幕")));
        when(exerciseService.selectQuestions(anyLong(), anyInt(), anyInt(), anyList()))
                .thenReturn(List.of(withAudio, withoutAudio));

        List<QuestionVO> result = service.listListeningQuestions(9L, 5, "LONG_DIALOGUE");

        assertEquals(1, result.size());
        assertEquals(1L, result.get(0).getId());
        assertEquals("/audio/exams/test.mp3", result.get(0).getAudioUrl());
        assertEquals(30, result.get(0).getDurationSeconds());
        assertEquals("cet6-test-g01", result.get(0).getGroupKey());
        assertEquals("LONG_DIALOGUE", result.get(0).getListeningType());
        assertEquals(new BigDecimal("10.00"), result.get(0).getAudioStartSeconds());
        assertNull(result.get(0).getTranscript());
        assertNull(result.get(0).getLrcContent());
        assertNull(result.get(0).getAnalysis());
    }

    @Test
    void listReturnsEmptyWhenNoQuestionMatchesType() {
        when(listeningAudioMapper.selectList(any())).thenReturn(List.of());

        List<QuestionVO> result = service.listListeningQuestions(9L, 5, "NEWS");

        assertEquals(0, result.size());
    }

    @Test
    void listRejectsIllegalType() {
        assertThrows(BusinessException.class,
                () -> service.listListeningQuestions(9L, 5, "NOT_A_TYPE"));
    }

    @Test
    void detailRejectsNonListeningQuestion() {
        when(exerciseService.getQuestionById(1L, false))
                .thenReturn(QuestionVO.builder().id(1L).moduleType(2).build());

        assertThrows(BusinessException.class, () -> service.getListeningQuestion(1L, false, 9L));
    }

    @Test
    void detailHidesSensitiveFieldsBeforeSubmit() {
        when(exerciseService.getQuestionById(1L, false))
                .thenReturn(QuestionVO.builder().id(1L).moduleType(4).analysis("解析").build());
        when(listeningAudioMapper.selectOne(any())).thenReturn(audio(1L, "原文", "字幕"));

        QuestionVO beforeSubmit = service.getListeningQuestion(1L, false, 9L);

        assertNull(beforeSubmit.getTranscript());
        assertNull(beforeSubmit.getLrcContent());
        assertNull(beforeSubmit.getAnalysis());
    }

    @Test
    void detailRejectsShowAnswerWhenUserHasNotAnswered() {
        when(exerciseService.getQuestionById(1L, true))
                .thenReturn(QuestionVO.builder().id(1L).moduleType(4).analysis("解析").build());
        when(listeningAudioMapper.selectOne(any())).thenReturn(audio(1L, "原文", "字幕"));
        when(exerciseLogMapper.selectCount(any())).thenReturn(0L);

        assertThrows(BusinessException.class,
                () -> service.getListeningQuestion(1L, true, 9L));
    }

    @Test
    void detailReturnsTranscriptAfterAnswered() {
        when(exerciseService.getQuestionById(1L, true))
                .thenReturn(QuestionVO.builder().id(1L).moduleType(4).analysis("解析").build());
        when(listeningAudioMapper.selectOne(any())).thenReturn(audio(1L, "原文", "字幕"));
        when(exerciseLogMapper.selectCount(any())).thenReturn(1L);

        QuestionVO withAnswer = service.getListeningQuestion(1L, true, 9L);

        assertEquals("原文", withAnswer.getTranscript());
        assertEquals("字幕", withAnswer.getLrcContent());
        assertEquals("解析", withAnswer.getAnalysis());
    }

    @Test
    void submitDelegatesAndReturnsTranscriptAndLrc() {
        QuestionVO question = QuestionVO.builder().id(1L).moduleType(4).build();
        SubmitRequest request = new SubmitRequest();
        request.setUserId(9L);
        request.setQuestionId(1L);
        request.setUserAnswer("A");
        request.setModuleType(4);
        SubmitResponse response = SubmitResponse.builder().isCorrect(true).build();

        when(exerciseService.getQuestionById(1L, false)).thenReturn(question);
        when(exerciseService.submitAnswer(request)).thenReturn(response);
        when(listeningAudioMapper.selectOne(any())).thenReturn(audio(1L, "原文", "字幕"));

        SubmitResponse result = service.submitListeningAnswer(request);

        assertEquals("原文", result.getTranscript());
        assertEquals("字幕", result.getLrcContent());
    }

    @Test
    void statsComputesCorrectRate() {
        UserExerciseLog correct = log(1);
        UserExerciseLog wrong = log(0);
        when(exerciseLogMapper.selectList(any())).thenReturn(List.of(correct, wrong));

        ListeningStats stats = service.getListeningStats(9L);

        assertEquals(2, stats.getTotalAnswered());
        assertEquals(1, stats.getCorrectCount());
        assertEquals(50.0, stats.getCorrectRate());
    }

    private ListeningAudio audio(Long questionId, String transcript, String lrc) {
        ListeningAudio audio = new ListeningAudio();
        audio.setQuestionId(questionId);
        audio.setAudioUrl("/audio/exams/test.mp3");
        audio.setTranscript(transcript);
        audio.setLrcContent(lrc);
        audio.setDurationSeconds(30);
        audio.setAudioTotalSeconds(300);
        audio.setAudioStartSeconds(new BigDecimal("10.00"));
        audio.setAudioEndSeconds(new BigDecimal("40.00"));
        audio.setQuestionStartSeconds(new BigDecimal("45.00"));
        audio.setQuestionEndSeconds(new BigDecimal("60.00"));
        audio.setGroupKey("cet6-test-g01");
        audio.setListeningType("LONG_DIALOGUE");
        return audio;
    }

    private UserExerciseLog log(int correct) {
        UserExerciseLog log = new UserExerciseLog();
        log.setUserId(9L);
        log.setModuleType(4);
        log.setIsCorrect(correct);
        return log;
    }
}
