package com.english.ai.ai.service;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;

/**
 * 判题反馈解析测试：验证 errorType 能从 AI 返回中取出，且异常输入不会污染数据。
 */
class JudgeFeedbackParseTest {

    @Test
    void parsesPlainJson() {
        AiService.FeedbackPayload p = AiService.parseJudgeFeedbackJson(
                "{\"hint\":\"注意时态\",\"errorType\":\"TENSE\"}");

        assertNotNull(p);
        assertEquals("注意时态", p.hint);
        assertEquals("TENSE", p.errorType);
    }

    @Test
    void parsesJsonWrappedInCodeFence() {
        String content = "```json\n{\"hint\":\"介词搭配错误\",\"errorType\":\"PREPOSITION\"}\n```";

        AiService.FeedbackPayload p = AiService.parseJudgeFeedbackJson(content);

        assertNotNull(p);
        assertEquals("介词搭配错误", p.hint);
        assertEquals("PREPOSITION", p.errorType);
    }

    @Test
    void normalizesErrorTypeCase() {
        AiService.FeedbackPayload p = AiService.parseJudgeFeedbackJson(
                "{\"hint\":\"拼写\",\"errorType\":\"spelling\"}");

        assertNotNull(p);
        assertEquals("SPELLING", p.errorType);
    }

    @Test
    void unknownErrorTypeFallsBackToUnknown() {
        AiService.FeedbackPayload p = AiService.parseJudgeFeedbackJson(
                "{\"hint\":\"再想想\",\"errorType\":\"OTHER\"}");

        assertNotNull(p);
        assertEquals("再想想", p.hint);
        assertEquals("UNKNOWN", p.errorType);
    }

    @Test
    void plainTextBecomesHintWithUnknownType() {
        AiService.FeedbackPayload p = AiService.parseJudgeFeedbackJson("再检查一下单复数");

        assertNotNull(p);
        assertEquals("再检查一下单复数", p.hint);
        assertEquals("UNKNOWN", p.errorType);
    }

    @Test
    void jsonWithoutHintFallsBackToRawContent() {
        String content = "{\"errorType\":\"GRAMMAR\"}";

        AiService.FeedbackPayload p = AiService.parseJudgeFeedbackJson(content);

        assertNotNull(p);
        assertEquals(content, p.hint);
        assertEquals("GRAMMAR", p.errorType);
    }

    @Test
    void blankContentReturnsNull() {
        assertNull(AiService.parseJudgeFeedbackJson(null));
        assertNull(AiService.parseJudgeFeedbackJson(""));
        assertNull(AiService.parseJudgeFeedbackJson("   "));
    }
}
