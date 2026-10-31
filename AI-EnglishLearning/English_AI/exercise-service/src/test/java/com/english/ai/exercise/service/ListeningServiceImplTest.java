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

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.ArgumentMatchers.any;
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
    void listSkipsQuestionsWithoutAudioAndHidesTranscript() {
        QuestionVO withAudio = QuestionVO.builder().id(1L).moduleType(4).build();
        QuestionVO withoutAudio = QuestionVO.builder().id(2L).moduleType(4).build();
        when(exerciseService.selectQuestions(9L, 4, 5)).thenReturn(List.of(withAudio, withoutAudio));
        when(listeningAudioMapper.selectList(any())).thenReturn(List.of(audio(1L, "secret")));

        List<QuestionVO> result = service.listListeningQuestions(9L, 5);

        assertEquals(1, result.size());
        assertEquals(1L, result.get(0).getId());
        assertEquals("/audio/test.mp3", result.get(0).getAudioUrl());
        assertEquals(30, result.get(0).getDurationSeconds());
        assertNull(result.get(0).getTranscript());
    }

    @Test
    void detailRejectsNonListeningQuestion() {
        when(exerciseService.getQuestionById(1L, false))
                .thenReturn(QuestionVO.builder().id(1L).moduleType(2).build());

        assertThrows(BusinessException.class, () -> service.getListeningQuestion(1L, false));
    }

    @Test
    void detailHidesTranscriptBeforeSubmitAndReturnsItWithAnswer() {
        when(exerciseService.getQuestionById(1L, false))
                .thenReturn(QuestionVO.builder().id(1L).moduleType(4).build());
        when(exerciseService.getQuestionById(1L, true))
                .thenReturn(QuestionVO.builder().id(1L).moduleType(4).build());
        when(listeningAudioMapper.selectOne(any())).thenReturn(audio(1L, "secret"));

        QuestionVO beforeSubmit = service.getListeningQuestion(1L, false);
        QuestionVO withAnswer = service.getListeningQuestion(1L, true);

        assertNull(beforeSubmit.getTranscript());
        assertEquals("secret", withAnswer.getTranscript());
    }

    @Test
    void submitDelegatesAndReturnsTranscript() {
        QuestionVO question = QuestionVO.builder().id(1L).moduleType(4).build();
        SubmitRequest request = new SubmitRequest();
        request.setUserId(9L);
        request.setQuestionId(1L);
        request.setUserAnswer("A");
        request.setModuleType(4);
        SubmitResponse response = SubmitResponse.builder().isCorrect(true).build();

        when(exerciseService.getQuestionById(1L, false)).thenReturn(question);
        when(exerciseService.submitAnswer(request)).thenReturn(response);
        when(listeningAudioMapper.selectOne(any())).thenReturn(audio(1L, "secret"));

        SubmitResponse result = service.submitListeningAnswer(request);

        assertEquals("secret", result.getTranscript());
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

    private ListeningAudio audio(Long questionId, String transcript) {
        ListeningAudio audio = new ListeningAudio();
        audio.setQuestionId(questionId);
        audio.setAudioUrl("/audio/test.mp3");
        audio.setTranscript(transcript);
        audio.setDurationSeconds(30);
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
