package com.english.ai.exercise.service.impl;

import com.english.ai.common.Result;
import com.english.ai.exercise.dto.BatchAggregate;
import com.english.ai.exercise.dto.PracticeSettleResponse;
import com.english.ai.exercise.mapper.UserExerciseLogMapper;
import com.english.ai.exercise.service.PracticeSettleService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.Map;

/**
 * 练习组结算实现：本服务负责聚合，计分规则全部在 user-service。
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class PracticeSettleServiceImpl implements PracticeSettleService {

    private static final int MAX_BATCH_KEY_LENGTH = 64;

    private final UserExerciseLogMapper exerciseLogMapper;
    private final RestTemplate restTemplate;

    @Value("${service.user.url}")
    private String userServiceUrl;

    @Value("${app.internal.token:}")
    private String internalToken;

    @Override
    public PracticeSettleResponse settle(Long userId, String batchKey) {
        if (userId == null || batchKey == null || batchKey.isBlank()
                || batchKey.length() > MAX_BATCH_KEY_LENGTH) {
            throw new IllegalArgumentException("batchKey非法");
        }

        BatchAggregate aggregate = exerciseLogMapper.aggregateByBatch(userId, batchKey);
        int totalCount = aggregate == null || aggregate.getTotalCount() == null ? 0 : aggregate.getTotalCount();
        if (totalCount <= 0) {
            // 该组没有任何落库作答：可能是全部 practiceOnly，或 batchKey 不属于该用户
            log.info("练习组无有效作答，跳过结算: userId={}, batchKey={}", userId, batchKey);
            return failure("NO_RECORD");
        }

        Map<String, Object> body = new HashMap<>();
        body.put("userId", userId);
        body.put("batchKey", batchKey);
        body.put("moduleType", aggregate.getModuleType() == null ? 1 : aggregate.getModuleType());
        body.put("totalCount", totalCount);
        body.put("correctCount", aggregate.getCorrectCount() == null ? 0 : aggregate.getCorrectCount());
        body.put("sumDifficulty", aggregate.getSumDifficulty() == null ? 0L : aggregate.getSumDifficulty());

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        if (internalToken != null && !internalToken.isBlank()) {
            headers.set("X-Internal-Token", internalToken);
        }

        try {
            String url = userServiceUrl + "/internal/practice/settle";
            ResponseEntity<Result<PracticeSettleResponse>> response = restTemplate.exchange(
                    url, HttpMethod.POST, new HttpEntity<>(body, headers),
                    new ParameterizedTypeReference<Result<PracticeSettleResponse>>() {
                    });
            if (response.getBody() != null && response.getBody().getCode() == 200) {
                PracticeSettleResponse data = response.getBody().getData();
                if (data != null) {
                    return data;
                }
            }
            log.warn("练习组结算返回异常: userId={}, batchKey={}", userId, batchKey);
        } catch (Exception e) {
            log.warn("练习组结算调用失败: userId={}, batchKey={}, reason={}", userId, batchKey, e.getMessage());
        }
        return failure("SETTLE_FAILED");
    }

    private PracticeSettleResponse failure(String reason) {
        PracticeSettleResponse response = new PracticeSettleResponse();
        response.setQualified(false);
        response.setAwarded(false);
        response.setAccuracy(0.0);
        response.setTotalCount(0);
        response.setCorrectCount(0);
        response.setRawPoints(0);
        response.setPoints(0);
        response.setDailyLimitReached(false);
        response.setReason(reason);
        return response;
    }
}
