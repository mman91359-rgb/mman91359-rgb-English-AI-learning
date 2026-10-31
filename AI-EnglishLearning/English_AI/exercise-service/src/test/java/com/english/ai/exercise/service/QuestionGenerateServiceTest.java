package com.english.ai.exercise.service;

import com.english.ai.common.BusinessException;
import com.english.ai.exercise.entity.QuestionInfo;
import com.english.ai.exercise.entity.QuestionPending;
import com.english.ai.exercise.entity.SysKnowledgePoint;
import com.english.ai.exercise.mapper.KnowledgeMappingMapper;
import com.english.ai.exercise.mapper.QuestionContentMapper;
import com.english.ai.exercise.mapper.QuestionInfoMapper;
import com.english.ai.exercise.mapper.QuestionPendingMapper;
import com.english.ai.exercise.mapper.SysKnowledgePointMapper;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.web.client.RestTemplate;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class QuestionGenerateServiceTest {

    @Mock
    private QuestionPendingMapper pendingMapper;
    @Mock
    private QuestionInfoMapper questionInfoMapper;
    @Mock
    private QuestionContentMapper questionContentMapper;
    @Mock
    private KnowledgeMappingMapper knowledgeMappingMapper;
    @Mock
    private SysKnowledgePointMapper knowledgePointMapper;
    @Mock
    private RestTemplate restTemplate;

    private QuestionGenerateService service;

    @BeforeEach
    void setUp() {
        service = new QuestionGenerateService(pendingMapper, questionInfoMapper, questionContentMapper,
                knowledgeMappingMapper, knowledgePointMapper, restTemplate);
    }

    @Test
    void approveRejectsMissingPending() {
        when(pendingMapper.selectById(1L)).thenReturn(null);
        assertThrows(BusinessException.class, () -> service.approveQuestion(1L, 9L));
    }

    @Test
    void approveRejectsAlreadyReviewed() {
        QuestionPending pending = pending("APPROVED");
        when(pendingMapper.selectById(1L)).thenReturn(pending);

        assertThrows(BusinessException.class, () -> service.approveQuestion(1L, 9L));
        verify(pendingMapper, never()).update(any(), any());
    }

    @Test
    void approveRejectsConcurrentReview() {
        QuestionPending pending = pending("PENDING");
        when(pendingMapper.selectById(1L)).thenReturn(pending);
        when(pendingMapper.update(any(), any())).thenReturn(0);

        assertThrows(BusinessException.class, () -> service.approveQuestion(1L, 9L));
        verify(questionInfoMapper, never()).insert(any());
    }

    @Test
    void approveInsertsOfficialQuestionOnce() {
        QuestionPending pending = pending("PENDING");
        when(pendingMapper.selectById(1L)).thenReturn(pending);
        when(pendingMapper.update(any(), any())).thenReturn(1);
        SysKnowledgePoint point = new SysKnowledgePoint();
        point.setId(7L);
        when(knowledgePointMapper.selectList(any())).thenReturn(List.of(point));
        when(questionInfoMapper.insert(any())).thenAnswer(invocation -> {
            QuestionInfo info = invocation.getArgument(0);
            info.setId(100L);
            return 1;
        });

        Long questionId = service.approveQuestion(1L, 9L);

        assertEquals(100L, questionId);
        verify(questionInfoMapper).insert(any());
        verify(questionContentMapper).insert(any());
        verify(knowledgeMappingMapper).insert(any());
    }

    @Test
    void rejectRejectsAlreadyReviewed() {
        QuestionPending pending = pending("REJECTED");
        when(pendingMapper.selectById(1L)).thenReturn(pending);

        assertThrows(BusinessException.class, () -> service.rejectQuestion(1L, 9L, "bad"));
        verify(pendingMapper, never()).update(any(), any());
    }

    private QuestionPending pending(String status) {
        QuestionPending pending = new QuestionPending();
        pending.setId(1L);
        pending.setModuleType(1);
        pending.setTargetLevel("CET4");
        pending.setDifficultyLevel(3);
        pending.setQuestionType("FILL_BLANK");
        pending.setKnowledgePointName("词汇");
        pending.setStem("The company was ___ in 2005.");
        pending.setOptions("[]");
        pending.setCorrectAnswer("established");
        pending.setAnalysis("解析");
        pending.setStatus(status);
        return pending;
    }
}
