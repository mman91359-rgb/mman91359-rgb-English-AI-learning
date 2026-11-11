package com.english.ai.exercise.client;

import com.english.ai.exercise.dto.TranslationScore;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.Map;

/**
 * 段落翻译评分客户端：调用 ai-service 的 {@code /ai/translate-score}。
 *
 * <p>用独立的 RestTemplate（读超时 8s），失败一律返回 {@code null}，
 * 由调用方回落本地判定——评分不可用不能把提交卡住，也不能抛异常给前端。</p>
 */
@Slf4j
@Component
public class TranslationScoreClient {

    private final RestTemplate restTemplate;
    private final String aiServiceUrl;

    public TranslationScoreClient(
            @Qualifier("translationScoreRestTemplate") RestTemplate restTemplate,
            @Value("${service.ai.url}") String aiServiceUrl) {
        this.restTemplate = restTemplate;
        this.aiServiceUrl = aiServiceUrl;
    }

    /**
     * @return 评分结果；AI 不可用、超时、返回不可用或字段缺失时返回 {@code null}
     */
    public TranslationScore score(String questionId, String source, String reference, String userAnswer) {
        try {
            Map<String, Object> body = new HashMap<>();
            body.put("questionId", questionId);
            body.put("source", source);
            body.put("reference", reference);
            body.put("userAnswer", userAnswer);

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);

            ResponseEntity<Map> resp = restTemplate.postForEntity(
                    aiServiceUrl + "/ai/translate-score", new HttpEntity<>(body, headers), Map.class);
            if (resp.getBody() == null) {
                return null;
            }
            Object available = resp.getBody().get("available");
            if (!(available instanceof Boolean) || !((Boolean) available)) {
                return null;
            }
            Integer raw = toInt(resp.getBody().get("rawScore"));
            Integer max = toInt(resp.getBody().get("maxRawScore"));
            if (raw == null || max == null || max <= 0) {
                return null;
            }
            return new TranslationScore(
                    raw,
                    max,
                    String.valueOf(resp.getBody().getOrDefault("level", "")),
                    String.valueOf(resp.getBody().getOrDefault("comment", "")));
        } catch (Exception e) {
            log.warn("段落翻译评分调用失败，回落本地判定: questionId={}, error={}",
                    questionId, e.getMessage());
            return null;
        }
    }

    private Integer toInt(Object value) {
        return value instanceof Number ? ((Number) value).intValue() : null;
    }
}
