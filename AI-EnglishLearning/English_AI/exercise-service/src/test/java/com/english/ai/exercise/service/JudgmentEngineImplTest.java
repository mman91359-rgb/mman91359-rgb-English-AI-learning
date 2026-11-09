package com.english.ai.exercise.service;

import com.english.ai.exercise.dto.JudgmentResult;
import com.english.ai.exercise.dto.SubmitRequest;
import com.english.ai.exercise.entity.QuestionBuggyPath;
import com.english.ai.exercise.entity.QuestionInfo;
import com.english.ai.exercise.mapper.QuestionBuggyPathMapper;
import com.english.ai.exercise.mapper.QuestionInfoMapper;
import com.english.ai.exercise.service.impl.JudgmentEngineImpl;
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
import java.util.List;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.verifyNoInteractions;
import static org.mockito.Mockito.when;

/**
 * 判题链路顺序与 AI 分支控制测试。
 *
 * <p>覆盖：accepted 优先命中、buggy 短路、accepted 非空禁调 AI、
 * accepted 为空保留 AI 兜底、填空类答案归一化。</p>
 */
@ExtendWith(MockitoExtension.class)
class JudgmentEngineImplTest {

    @Mock
    private QuestionBuggyPathMapper buggyPathMapper;

    @Mock
    private QuestionInfoMapper questionInfoMapper;

    @Mock
    private RestTemplate restTemplate;

    private JudgmentEngineImpl engine;

    private static final Long QID = 1L;

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

    private QuestionInfo question(String type, String acceptedJson) {
        QuestionInfo info = new QuestionInfo();
        info.setId(QID);
        info.setQuestionType(type);
        info.setAcceptedAnswers(acceptedJson);
        return info;
    }

    @Test
    void acceptedHitReturnsCorrectAndShortCircuits() {
        when(questionInfoMapper.selectById(QID)).thenReturn(question("FILL_BLANK", "[\"abandoned\"]"));

        JudgmentResult result = engine.judge(request("abandoned"), "abandon", "He ____ his plan to travel.");

        assertTrue(result.getIsCorrect());
        assertTrue(result.getIsSemanticMatch());
        verifyNoInteractions(buggyPathMapper);
        verifyNoInteractions(restTemplate);
    }

    @Test
    void acceptedNotEmptyButMissReturnsMismatchWithoutAi() {
        when(questionInfoMapper.selectById(QID)).thenReturn(question("FILL_BLANK", "[\"gave up\",\"quit\"]"));

        JudgmentResult result = engine.judge(request("zzzzzzzz"), "abandon", "He ____ his plan to travel.");

        assertFalse(result.getIsCorrect());
        assertEquals("MISMATCH", result.getErrorType());
        assertEquals(2, result.getMatchedLevel());
        verifyNoInteractions(restTemplate);
    }

    @Test
    void acceptedEmptyKeepsAiSemanticPath() {
        when(questionInfoMapper.selectById(QID)).thenReturn(question("FILL_BLANK", null));
        when(restTemplate.postForEntity(anyString(), any(), eq(Map.class)))
                .thenReturn(mapResponse(true, "同义表达"));

        JudgmentResult result = engine.judge(request("zzzzzzzz"), "abandon", "He ____ his plan to travel.");

        assertTrue(result.getIsCorrect());
        verify(restTemplate, times(1)).postForEntity(anyString(), any(), eq(Map.class));
    }

    @Test
    void acceptedEmptyAndAiRejectsFallsToAiFeedback() {
        when(questionInfoMapper.selectById(QID)).thenReturn(question("FILL_BLANK", null));
        when(restTemplate.postForEntity(anyString(), any(), eq(Map.class)))
                .thenReturn(mapResponse(false, null))
                .thenReturn(feedbackResponse("再想想 abandon 的用法。"));

        JudgmentResult result = engine.judge(request("zzzzzzzz"), "abandon", "He ____ his plan to travel.");

        assertFalse(result.getIsCorrect());
        assertEquals(3, result.getMatchedLevel());
        // AI 返回的 errorType 必须透传到判题结果，否则错因表会全落 UNKNOWN
        assertEquals("SPELLING", result.getErrorType());
        verify(restTemplate, times(2)).postForEntity(anyString(), any(), eq(Map.class));
    }

    @Test
    void buggyPathHitShortCircuitsBeforeRuleLayer() {
        when(questionInfoMapper.selectById(QID)).thenReturn(question("FILL_BLANK", null));
        QuestionBuggyPath buggy = new QuestionBuggyPath();
        buggy.setQuestionId(QID);
        buggy.setWrongAnswer("abandonned");
        buggy.setHeuristicHint("abandon 只有一个 n，注意拼写。");
        buggy.setErrorType("SPELLING");
        buggy.setOccurrenceCount(1);
        when(buggyPathMapper.findByQuestionAndAnswer(QID, "abandonned")).thenReturn(buggy);

        JudgmentResult result = engine.judge(request("abandonned"), "abandon", "He ____ his plan to travel.");

        assertFalse(result.getIsCorrect());
        assertEquals("SPELLING", result.getErrorType());
        assertEquals("abandon 只有一个 n，注意拼写。", result.getHeuristicHint());
        verify(buggyPathMapper).updateById(buggy);
        verifyNoInteractions(restTemplate);
    }

    @Test
    void fillBlankAnswerIsNormalizedBeforeCompare() {
        when(questionInfoMapper.selectById(QID)).thenReturn(question("FILL_BLANK", null));

        JudgmentResult result = engine.judge(request("  Ａｂａｎｄｏｎ!  "), "abandon", "He ____ his plan to travel.");

        assertTrue(result.getIsCorrect());
        assertEquals(1, result.getMatchedLevel());
    }

    @Test
    void correctAnswerWithTrailingPunctuationStillMatches() {
        // 归一化不对称回归：correct_answer 带尾部标点时，用户填正确答案不能落到 L2 SIMILAR
        when(questionInfoMapper.selectById(QID)).thenReturn(question("FILL_BLANK", null));

        JudgmentResult result = engine.judge(request("abandon"), "abandon.", "He ____ his plan.");

        assertTrue(result.getIsCorrect());
        assertEquals(1, result.getMatchedLevel());
        verifyNoInteractions(restTemplate);
    }

    @Test
    void emptyAnswerReturnsEmptyError() {
        JudgmentResult result = engine.judge(request("   "), "abandon", "He ____ his plan to travel.");

        assertFalse(result.getIsCorrect());
        assertEquals("EMPTY", result.getErrorType());
        verifyNoInteractions(questionInfoMapper);
    }

    @Test
    void nonFillBlankIsNotNormalized() {
        // 同一份全角输入：FILL_BLANK 会归一化后判对（见 fillBlankAnswerIsNormalizedBeforeCompare），
        // SENTENCE_MAKING 只做 trim + 小写，因此不会自动判对
        when(questionInfoMapper.selectById(QID)).thenReturn(question("SENTENCE_MAKING", null));
        when(restTemplate.postForEntity(anyString(), any(), eq(Map.class)))
                .thenReturn(mapResponse(false, null))
                .thenReturn(feedbackResponse("注意拼写。"));

        JudgmentResult result = engine.judge(request("Ａｂａｎｄｏｎ"), "abandon", "____");

        assertFalse(result.getIsCorrect());
    }

    // ===== P1-2-1：错答提示开关 =====

    @Test
    void mismatchHintRevealsCorrectAnswerWhenEnabled() {
        ReflectionTestUtils.setField(engine, "revealCorrectAnswer", true);
        when(questionInfoMapper.selectById(QID)).thenReturn(question("FILL_BLANK", "[\"gave up\"]"));

        JudgmentResult result = engine.judge(request("zzzzzzzz"), "abandon", "He ____ his plan.");

        assertEquals("MISMATCH", result.getErrorType());
        assertTrue(result.getHeuristicHint().contains("abandon"));
        verifyNoInteractions(restTemplate);
    }

    @Test
    void mismatchHintFallsBackWhenDisabled() {
        ReflectionTestUtils.setField(engine, "revealCorrectAnswer", false);
        when(questionInfoMapper.selectById(QID)).thenReturn(question("FILL_BLANK", "[\"gave up\"]"));

        JudgmentResult result = engine.judge(request("zzzzzzzz"), "abandon", "He ____ his plan.");

        assertEquals("MISMATCH", result.getErrorType());
        assertFalse(result.getHeuristicHint().contains("abandon"));
        assertTrue(result.getHeuristicHint().contains("可接受答案范围内"));
    }

    // ===== P1-1：翻译题归一化对齐 =====

    @Test
    void translationAcceptsFullWidthAndCaseDifferences() {
        SubmitRequest req = request("ＡＢＣ　ＤＥＦ。");
        req.setModuleType(3);

        JudgmentResult result = engine.judgeTranslation(req, "ABC DEF.", "中文题干", null, false);

        assertTrue(result.getIsCorrect());
        assertEquals(1, result.getMatchedLevel());
        verifyNoInteractions(restTemplate);
    }

    @Test
    void translationAcceptedVariantIsNormalized() {
        SubmitRequest req = request("abc def");
        req.setModuleType(3);

        JudgmentResult result = engine.judgeTranslation(
                req, "xyz uvw", "中文题干", "[\"ＡＢＣ　ＤＥＦ！\"]", false);

        assertTrue(result.getIsCorrect());
        assertEquals(2, result.getMatchedLevel());
        assertTrue(result.getIsSemanticMatch());
        verifyNoInteractions(restTemplate);
    }

    // ===== P1-1：错因表查询侧归一化兜底 =====

    @Test
    void legacyBuggyPathWithTrailingPunctuationStillMatches() {
        when(questionInfoMapper.selectById(QID)).thenReturn(question("FILL_BLANK", null));

        QuestionBuggyPath legacy = new QuestionBuggyPath();
        legacy.setQuestionId(QID);
        legacy.setWrongAnswer("meal."); // 历史脏数据：保留了尾部标点
        legacy.setHeuristicHint("这里应该用 have a meal。");
        legacy.setErrorType("USAGE");
        legacy.setOccurrenceCount(1);
        when(buggyPathMapper.findByQuestionId(QID)).thenReturn(List.of(legacy));

        JudgmentResult result = engine.judge(request("meal"), "have a meal", "I want to ____.");

        assertFalse(result.getIsCorrect());
        assertEquals("这里应该用 have a meal。", result.getHeuristicHint());
        assertEquals(2, result.getMatchedLevel());
        verifyNoInteractions(restTemplate);
    }

    private ResponseEntity<Map> mapResponse(boolean acceptable, String reason) {
        Map<String, Object> body = new HashMap<>();
        body.put("acceptable", acceptable);
        if (reason != null) body.put("reason", reason);
        return new ResponseEntity<>(body, HttpStatus.OK);
    }

    private ResponseEntity<Map> feedbackResponse(String hint) {
        Map<String, Object> body = new HashMap<>();
        body.put("hint", hint);
        body.put("errorType", "SPELLING");
        return new ResponseEntity<>(body, HttpStatus.OK);
    }
}
