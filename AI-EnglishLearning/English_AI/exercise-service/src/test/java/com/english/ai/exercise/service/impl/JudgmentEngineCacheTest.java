package com.english.ai.exercise.service.impl;

import com.english.ai.exercise.dto.JudgmentResult;
import com.english.ai.exercise.dto.SubmitRequest;
import com.english.ai.exercise.entity.QuestionInfo;
import com.english.ai.exercise.mapper.QuestionBuggyPathMapper;
import com.english.ai.exercise.mapper.QuestionInfoMapper;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.test.util.ReflectionTestUtils;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.when;

/**
 * accepted_answers 有界缓存测试（与 JudgmentEngineImpl 同包，便于断言缓存规模）。
 */
@ExtendWith(MockitoExtension.class)
class JudgmentEngineCacheTest {

    private static final Long QID = 1L;

    @Mock
    private QuestionBuggyPathMapper buggyPathMapper;

    @Mock
    private QuestionInfoMapper questionInfoMapper;

    @Mock
    private RestTemplate restTemplate;

    private JudgmentEngineImpl engine;

    @BeforeEach
    void setUp() {
        engine = new JudgmentEngineImpl(buggyPathMapper, questionInfoMapper, restTemplate);
        ReflectionTestUtils.setField(engine, "aiServiceUrl", "http://ai-test");
    }

    private SubmitRequest request(String answer) {
        SubmitRequest req = new SubmitRequest();
        req.setUserId(9L);
        req.setQuestionId(QID);
        req.setUserAnswer(answer);
        req.setModuleType(1);
        return req;
    }

    private QuestionInfo question(String acceptedJson) {
        QuestionInfo info = new QuestionInfo();
        info.setId(QID);
        info.setQuestionType("FILL_BLANK");
        info.setAcceptedAnswers(acceptedJson);
        return info;
    }

    @Test
    void cacheDisabledByDefault() {
        when(questionInfoMapper.selectById(QID)).thenReturn(question("[\"gave up\"]"));

        engine.judge(request("zzzzzzzz"), "abandon", "He ____ his plan.");

        assertEquals(0, engine.acceptedCacheSize());
    }

    @Test
    void cacheStoresEntryWhenEnabled() {
        ReflectionTestUtils.setField(engine, "acceptedCacheEnabled", true);
        ReflectionTestUtils.setField(engine, "acceptedCacheTtlSeconds", 60L);
        ReflectionTestUtils.setField(engine, "acceptedCacheMaxSize", 10);
        when(questionInfoMapper.selectById(QID)).thenReturn(question("[\"gave up\"]"));

        engine.judge(request("zzzzzzzz"), "abandon", "He ____ his plan.");

        assertEquals(1, engine.acceptedCacheSize());
    }

    @Test
    void cacheInvalidatedAfterSelfLearningWrite() {
        ReflectionTestUtils.setField(engine, "acceptedCacheEnabled", true);
        ReflectionTestUtils.setField(engine, "acceptedCacheTtlSeconds", 60L);
        ReflectionTestUtils.setField(engine, "acceptedCacheMaxSize", 10);
        when(questionInfoMapper.selectById(QID)).thenReturn(question(null));

        // 第一次：AI 判不可接受，空集合写入缓存
        when(restTemplate.postForEntity(anyString(), any(), eq(Map.class)))
                .thenReturn(mapResponse(false))
                .thenReturn(feedbackResponse());
        engine.judge(request("zzzzzzzz"), "abandon", "He ____ his plan.");
        assertEquals(1, engine.acceptedCacheSize());

        // 第二次：AI 判可接受 → 自学习写入 accepted_answers → 缓存必须失效
        when(restTemplate.postForEntity(anyString(), any(), eq(Map.class)))
                .thenReturn(mapResponse(true));
        JudgmentResult result = engine.judge(request("zzzzzzzz"), "abandon", "He ____ his plan.");

        assertTrue(result.getIsCorrect());
        assertEquals(0, engine.acceptedCacheSize());
    }

    private ResponseEntity<Map> mapResponse(boolean acceptable) {
        Map<String, Object> body = new HashMap<>();
        body.put("acceptable", acceptable);
        body.put("altAnswer", "gave up");
        return new ResponseEntity<>(body, HttpStatus.OK);
    }

    private ResponseEntity<Map> feedbackResponse() {
        Map<String, Object> body = new HashMap<>();
        body.put("hint", "再想想。");
        body.put("errorType", "USAGE");
        return new ResponseEntity<>(body, HttpStatus.OK);
    }
}
